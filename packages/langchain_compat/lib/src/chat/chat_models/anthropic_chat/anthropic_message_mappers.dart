import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:collection/collection.dart' show IterableExtension;
import 'package:json_schema/json_schema.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart' show WhereNotNullExtension;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../tools/tool.dart';
import '../chat_message.dart' as msg;
import '../chat_result.dart';
import '../helpers/message_part_helpers.dart';
import 'anthropic_chat.dart';

/// Logger for Anthropic message mapping operations.
final Logger _logger = Logger('dartantic.chat.mappers.anthropic');

/// Creates an Anthropic [a.CreateMessageRequest] from a list of messages and
/// options.
a.CreateMessageRequest createMessageRequest(
  List<msg.ChatMessage> messages, {
  required String modelName,
  required AnthropicChatOptions? options,
  required AnthropicChatOptions defaultOptions,
  List<Tool>? tools,
  double? temperature,
  JsonSchema? outputSchema,
  bool stream = false,
}) {
  // Handle tools but not structured output (use prefilling instead)
  final hasTools = tools != null && tools.isNotEmpty;
  final hasStructuredOutput = outputSchema != null;

  var systemMsg = messages.firstOrNull?.role == msg.MessageRole.system
      ? (messages.firstOrNull!.parts.firstOrNull as msg.TextPart?)?.text
      : null;

  // Add JSON output instructions to system message if outputSchema is provided
  // This follows Anthropic's recommendations for structured output consistency
  if (hasStructuredOutput) {
    final schemaStr = json.encode(outputSchema.schemaMap);
    final jsonInstructions =
        '\n\nYou must respond with valid JSON that matches this exact schema: '
        '$schemaStr\n'
        'Do not include any text before or after the JSON. '
        'Only return the JSON object.';
    systemMsg = (systemMsg ?? '') + jsonInstructions;
  }
  final structuredTools = hasTools ? tools.toTool() : null;

  _logger.fine(
    'Creating Anthropic message request for ${messages.length} messages',
  );
  final messagesDtos = messages.toMessages();

  // Add prefilling for structured output - this forces Claude to start with '{'
  // See:
  // https://docs.anthropic.com/en/docs/test-and-evaluate/strengthen-guardrails/increase-consistency
  // "Prefill Claude's response" section explains this technique
  if (hasStructuredOutput) {
    messagesDtos.add(
      const a.Message(
        role: a.MessageRole.assistant,
        content: a.MessageContent.text('{'),
      ),
    );
  }
  _logger.fine(
    'Tool configuration: hasTools=$hasTools, toolCount=${tools?.length ?? 0}, '
    'hasStructuredOutput=$hasStructuredOutput',
  );

  return a.CreateMessageRequest(
    model: a.Model.modelId(modelName),
    messages: messagesDtos,
    maxTokens:
        options?.maxTokens ??
        defaultOptions.maxTokens ??
        AnthropicChatModel.defaultMaxTokens,
    stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
    system: systemMsg != null
        ? a.CreateMessageRequestSystem.text(systemMsg)
        : null,
    temperature:
        temperature ?? options?.temperature ?? defaultOptions.temperature,
    topK: options?.topK ?? defaultOptions.topK,
    topP: options?.topP ?? defaultOptions.topP,
    metadata: a.CreateMessageRequestMetadata(
      userId: options?.userId ?? defaultOptions.userId,
    ),
    tools: structuredTools,
    toolChoice: hasTools
        ? const a.ToolChoice(type: a.ToolChoiceType.auto)
        : null,
    stream: stream,
  );
}

/// Extension on [List<msg.Message>] to convert messages to Anthropic SDK
/// messages.
extension MessageListMapper on List<msg.ChatMessage> {
  /// Converts this list of [msg.ChatMessage]s to a list of Anthropic SDK
  /// [a.Message]s.
  List<a.Message> toMessages() {
    _logger.fine('Converting $length messages to Anthropic format');
    final result = <a.Message>[];
    final consecutiveToolMessages = <msg.ChatMessage>[];

    void flushToolMessages() {
      if (consecutiveToolMessages.isNotEmpty) {
        _logger.fine(
          'Flushing ${consecutiveToolMessages.length} '
          'consecutive tool messages',
        );
        result.add(_mapToolMessages(consecutiveToolMessages));
        consecutiveToolMessages.clear();
      }
    }

    for (final message in this) {
      switch (message.role) {
        case msg.MessageRole.system:
          flushToolMessages();
          continue; // System message set in request params
        case msg.MessageRole.user:
          // Check if this is a tool result message
          if (message.parts.whereType<msg.ToolPart>().isNotEmpty) {
            _logger.fine(
              'Adding user message with tool parts to consecutive tool '
              'messages',
            );
            consecutiveToolMessages.add(message);
          } else {
            flushToolMessages();
            final res = _mapUserMessage(message);
            result.add(res);
          }
        case msg.MessageRole.model:
          flushToolMessages();
          final res = _mapModelMessage(message);
          result.add(res);
      }
    }

    flushToolMessages(); // Flush any remaining tool messages
    return result;
  }

  a.Message _mapUserMessage(msg.ChatMessage message) {
    final textParts = message.parts.whereType<msg.TextPart>().toList();
    final dataParts = message.parts.whereType<msg.DataPart>().toList();
    _logger.fine(
      'Mapping user message: ${textParts.length} text parts, '
      '${dataParts.length} data parts',
    );

    if (dataParts.isEmpty) {
      // Text-only message
      final text = MessagePartHelpers.extractText(message.parts);
      return a.Message(
        role: a.MessageRole.user,
        content: a.MessageContent.text(text),
      );
    } else {
      // Multimodal message
      final blocks = <a.Block>[];

      for (final part in message.parts) {
        if (part is msg.TextPart) {
          blocks.add(a.Block.text(text: part.text));
        } else if (part is msg.DataPart) {
          blocks.add(_mapDataPartToBlock(part));
        }
      }

      return a.Message(
        role: a.MessageRole.user,
        content: a.MessageContent.blocks(blocks),
      );
    }
  }

  a.Block _mapDataPartToBlock(msg.DataPart dataPart) {
    // Anthropic only supports base64 images
    if (!dataPart.mimeType.startsWith('image/')) {
      throw AssertionError(
        'Anthropic only supports image data parts, got: ${dataPart.mimeType}',
      );
    }

    return a.Block.image(
      source: a.ImageBlockSource(
        type: a.ImageBlockSourceType.base64,
        mediaType: switch (dataPart.mimeType) {
          'image/jpeg' => a.ImageBlockSourceMediaType.imageJpeg,
          'image/png' => a.ImageBlockSourceMediaType.imagePng,
          'image/gif' => a.ImageBlockSourceMediaType.imageGif,
          'image/webp' => a.ImageBlockSourceMediaType.imageWebp,
          _ => throw AssertionError(
            'Unsupported image MIME type: ${dataPart.mimeType}',
          ),
        },
        data: String.fromCharCodes(dataPart.bytes),
      ),
    );
  }

  a.Message _mapModelMessage(msg.ChatMessage message) {
    final textParts = message.parts.whereType<msg.TextPart>().toList();
    final toolParts = message.parts.whereType<msg.ToolPart>().toList();
    _logger.fine(
      'Mapping model message: ${textParts.length} text parts, '
      '${toolParts.length} tool parts',
    );

    if (toolParts.isEmpty) {
      // Text-only response
      final text = MessagePartHelpers.extractText(message.parts);
      return a.Message(
        role: a.MessageRole.assistant,
        content: a.MessageContent.text(text),
      );
    } else {
      // Response with tool calls
      return a.Message(
        role: a.MessageRole.assistant,
        content: a.MessageContent.blocks(
          toolParts
              .map(
                (toolPart) => a.Block.toolUse(
                  id: toolPart.id,
                  name: toolPart.name,
                  input: toolPart.arguments ?? {},
                ),
              )
              .toList(growable: false),
        ),
      );
    }
  }

  a.Message _mapToolMessages(List<msg.ChatMessage> messages) {
    _logger.fine(
      'Mapping ${messages.length} tool messages to Anthropic blocks',
    );
    final blocks = <a.Block>[];

    for (final message in messages) {
      for (final part in message.parts) {
        if (part is msg.ToolPart && part.kind == msg.ToolPartKind.result) {
          blocks.add(
            a.Block.toolResult(
              toolUseId: part.id,
              // ignore: avoid_dynamic_calls
              content: a.ToolResultBlockContent.text(
                ToolResultHelpers.serialize(part.result),
              ),
            ),
          );
        }
      }
    }

    return a.Message(
      role: a.MessageRole.user,
      content: a.MessageContent.blocks(blocks),
    );
  }
}

/// Extension on [a.Message] to convert an Anthropic SDK message to a
/// [ChatResult].
extension MessageMapper on a.Message {
  /// Converts this Anthropic SDK [a.Message] to a [ChatResult].
  ChatResult<msg.ChatMessage> toChatResult() {
    final parts = _mapMessageContent(content);
    final message = msg.ChatMessage(role: msg.MessageRole.model, parts: parts);
    _logger.fine(
      'Converting Anthropic message to ChatResult with ${parts.length} parts',
    );

    return ChatResult<msg.ChatMessage>(
      id: id ?? '',
      output: message,
      messages: [message],
      finishReason: _mapFinishReason(stopReason),
      metadata: {'model': model, 'stop_sequence': stopSequence},
      usage: _mapUsage(usage),
    );
  }
}

/// A [StreamTransformer] that converts a stream of Anthropic
/// [a.MessageStreamEvent]s into [ChatResult]s.
class MessageStreamEventTransformer
    extends
        StreamTransformerBase<
          a.MessageStreamEvent,
          ChatResult<msg.ChatMessage>
        > {
  /// Creates a [MessageStreamEventTransformer].
  MessageStreamEventTransformer();

  /// The last message ID.
  String? lastMessageId;

  /// The last tool call ID.
  String? lastToolCallId;

  /// The last tool name.
  String? lastToolName;

  /// Accumulator for tool arguments during streaming.
  final Map<String, StringBuffer> _toolArgumentsAccumulator = {};

  /// Binds this transformer to a stream of [a.MessageStreamEvent]s, producing a
  /// stream of [ChatResult]s.
  @override
  Stream<ChatResult<msg.ChatMessage>> bind(
    Stream<a.MessageStreamEvent> stream,
  ) => stream
      .map(
        (event) => switch (event) {
          final a.MessageStartEvent e => _mapMessageStartEvent(e),
          final a.MessageDeltaEvent e => _mapMessageDeltaEvent(e),
          final a.ContentBlockStartEvent e => _mapContentBlockStartEvent(e),
          final a.ContentBlockDeltaEvent e => _mapContentBlockDeltaEvent(e),
          final a.ContentBlockStopEvent e => _mapContentBlockStopEvent(e),
          final a.MessageStopEvent e => _mapMessageStopEvent(e),
          a.PingEvent() => null,
          a.ErrorEvent() => null,
        },
      )
      .whereNotNull();

  ChatResult<msg.ChatMessage> _mapMessageStartEvent(a.MessageStartEvent e) {
    final message = e.message;

    final msgId = message.id ?? lastMessageId ?? '';
    lastMessageId = msgId;
    final parts = _mapMessageContent(e.message.content);
    _logger.fine(
      'Processing message start event: messageId=$msgId, parts=${parts.length}',
    );

    return ChatResult<msg.ChatMessage>(
      id: msgId,
      output: msg.ChatMessage(role: msg.MessageRole.model, parts: parts),
      messages: [msg.ChatMessage(role: msg.MessageRole.model, parts: parts)],
      finishReason: _mapFinishReason(e.message.stopReason),
      metadata: {
        if (e.message.model != null) 'model': e.message.model,
        if (e.message.stopSequence != null)
          'stop_sequence': e.message.stopSequence,
      },
      usage: _mapUsage(e.message.usage),
    );
  }

  ChatResult<msg.ChatMessage> _mapMessageDeltaEvent(
    a.MessageDeltaEvent e,
  ) => ChatResult<msg.ChatMessage>(
    id: lastMessageId ?? '',
    output: const msg.ChatMessage(role: msg.MessageRole.model, parts: []),
    messages: const [msg.ChatMessage(role: msg.MessageRole.model, parts: [])],
    finishReason: _mapFinishReason(e.delta.stopReason),
    metadata: {
      if (e.delta.stopSequence != null) 'stop_sequence': e.delta.stopSequence,
    },
    usage: _mapMessageDeltaUsage(e.usage),
  );

  ChatResult<msg.ChatMessage> _mapContentBlockStartEvent(
    a.ContentBlockStartEvent e,
  ) {
    final parts = _mapContentBlock(e.contentBlock);
    _logger.fine(
      'Processing content block start event: index=${e.index}, '
      'parts=${parts.length}, contentBlock=$e.contentBlock',
    );

    // Track tool call IDs and names
    for (final part in parts) {
      if (part is msg.ToolPart && part.kind == msg.ToolPartKind.call) {
        lastToolCallId = part.id;
        lastToolName = part.name;
        break;
      }
    }

    return ChatResult<msg.ChatMessage>(
      id: lastMessageId ?? '',
      output: msg.ChatMessage(role: msg.MessageRole.model, parts: parts),
      messages: [msg.ChatMessage(role: msg.MessageRole.model, parts: parts)],
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult<msg.ChatMessage> _mapContentBlockDeltaEvent(
    a.ContentBlockDeltaEvent e,
  ) {
    // Handle InputJsonBlockDelta specially to accumulate arguments
    if (e.delta is a.InputJsonBlockDelta && lastToolCallId != null) {
      final delta = e.delta as a.InputJsonBlockDelta;
      _toolArgumentsAccumulator.putIfAbsent(lastToolCallId!, StringBuffer.new);
      _toolArgumentsAccumulator[lastToolCallId]!.write(delta.partialJson);

      // Return empty result for accumulation
      return ChatResult<msg.ChatMessage>(
        id: lastMessageId ?? '',
        output: const msg.ChatMessage(role: msg.MessageRole.model, parts: []),
        messages: const [],
        finishReason: FinishReason.unspecified,
        metadata: {'index': e.index},
        usage: const LanguageModelUsage(),
      );
    }

    final parts = _mapContentBlockDelta(lastToolCallId, e.delta);
    _logger.fine(
      'Processing content block delta event: index=${e.index}, '
      'parts=${parts.length}',
    );
    return ChatResult<msg.ChatMessage>(
      id: lastMessageId ?? '',
      output: msg.ChatMessage(role: msg.MessageRole.model, parts: parts),
      messages: [msg.ChatMessage(role: msg.MessageRole.model, parts: parts)],
      finishReason: FinishReason.unspecified,
      metadata: {'index': e.index},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult<msg.ChatMessage>? _mapContentBlockStopEvent(
    a.ContentBlockStopEvent e,
  ) {
    // If we have accumulated arguments for this tool, create a complete tool
    // part
    if (lastToolCallId != null &&
        _toolArgumentsAccumulator.containsKey(lastToolCallId)) {
      final argsJson = _toolArgumentsAccumulator[lastToolCallId]!.toString();
      _toolArgumentsAccumulator.remove(lastToolCallId);

      // Return a result with the complete tool call
      final result = ChatResult<msg.ChatMessage>(
        id: lastMessageId ?? '',
        output: msg.ChatMessage(
          role: msg.MessageRole.model,
          parts: [
            msg.ToolPart.call(
              id: lastToolCallId!,
              name: lastToolName ?? '',
              arguments: argsJson.isNotEmpty ? json.decode(argsJson) : {},
            ),
          ],
        ),
        messages: const [],
        finishReason: FinishReason.unspecified,
        metadata: const {},
        usage: const LanguageModelUsage(),
      );

      lastToolCallId = null;
      lastToolName = null;
      return result;
    }

    lastToolCallId = null;
    lastToolName = null;
    return null;
  }

  ChatResult<msg.ChatMessage>? _mapMessageStopEvent(a.MessageStopEvent e) {
    lastMessageId = null;
    return null;
  }
}

/// Maps an Anthropic [a.MessageContent] to message parts.
List<msg.Part> _mapMessageContent(a.MessageContent content) =>
    switch (content) {
      final a.MessageContentText t => [msg.TextPart(t.value)],
      final a.MessageContentBlocks b => [
        // Extract text parts
        ...b.value.whereType<a.TextBlock>().map((t) => msg.TextPart(t.text)),
        // Extract tool use parts
        ...b.value.whereType<a.ToolUseBlock>().map(
          (toolUse) => msg.ToolPart.call(
            id: toolUse.id,
            name: toolUse.name,
            arguments: toolUse.input,
          ),
        ),
      ],
    };

/// Maps an Anthropic [a.Block] to message parts.
List<msg.Part> _mapContentBlock(a.Block contentBlock) => switch (contentBlock) {
  final a.TextBlock t => [msg.TextPart(t.text)],
  final a.ImageBlock i => [
    msg.DataPart(
      bytes: Uint8List.fromList(i.source.data.codeUnits),
      mimeType: 'image/png',
    ),
  ],
  final a.ToolUseBlock tu => [
    msg.ToolPart.call(id: tu.id, name: tu.name, arguments: tu.input),
  ],
  final a.ToolResultBlock tr => [msg.TextPart(tr.content.text)],
};

/// Maps an Anthropic [a.BlockDelta] to message parts.
List<msg.Part> _mapContentBlockDelta(
  String? lastToolId,
  a.BlockDelta blockDelta,
) => switch (blockDelta) {
  final a.TextBlockDelta t => [msg.TextPart(t.text)],
  final a.InputJsonBlockDelta _ => const [],
};

/// Extension on [List<Tool>] to convert tool specs to Anthropic SDK tools.
extension ToolSpecListMapper on List<Tool> {
  /// Converts this list of [Tool]s to a list of Anthropic SDK [a.Tool]s.
  List<a.Tool> toTool() {
    _logger.fine('Converting $length tools to Anthropic format');
    return map(_mapTool).toList(growable: false);
  }

  a.Tool _mapTool(Tool tool) => a.Tool.custom(
    name: tool.name,
    description: tool.description,
    inputSchema: Map<String, dynamic>.from(tool.inputSchema.schemaMap ?? {}),
  );
}

/// Maps an Anthropic [a.StopReason] to a [FinishReason].
FinishReason _mapFinishReason(a.StopReason? reason) => switch (reason) {
  a.StopReason.endTurn => FinishReason.stop,
  a.StopReason.maxTokens => FinishReason.length,
  a.StopReason.stopSequence => FinishReason.stop,
  a.StopReason.toolUse => FinishReason.toolCalls,
  null => FinishReason.unspecified,
};

/// Maps Anthropic [a.Usage] to [LanguageModelUsage].
LanguageModelUsage _mapUsage(a.Usage? usage) => LanguageModelUsage(
  promptTokens: usage?.inputTokens,
  responseTokens: usage?.outputTokens,
  totalTokens: usage?.inputTokens != null && usage?.outputTokens != null
      ? usage!.inputTokens + usage.outputTokens
      : null,
);

/// Maps Anthropic [a.MessageDeltaUsage] to [LanguageModelUsage].
LanguageModelUsage _mapMessageDeltaUsage(a.MessageDeltaUsage? usage) =>
    LanguageModelUsage(
      responseTokens: usage?.outputTokens,
      totalTokens: usage?.outputTokens,
    );
