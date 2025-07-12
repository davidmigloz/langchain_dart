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

/// The name of the tool used for structured output via ToolOutput pattern.
const String kReturnResultToolName = 'return_result';

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
  // Handle tools including structured output as a tool
  final hasTools = tools != null && tools.isNotEmpty;
  final hasStructuredOutput = outputSchema != null;

  final systemMsg = messages.firstOrNull?.role == msg.MessageRole.system
      ? (messages.firstOrNull!.parts.firstOrNull as msg.TextPart?)?.text
      : null;

  // Build the complete tools list
  final allTools = <Tool>[];
  if (hasTools) {
    allTools.addAll(tools);
  }

  // Add return_result tool for structured output
  if (hasStructuredOutput) {
    final returnResultTool = Tool<Map<String, dynamic>>(
      name: kReturnResultToolName,
      description: 'Return the final result in the required structured format',
      inputSchema: outputSchema,
      inputFromJson: (json) => json, // Identity function for JSON input
      onCall: (args) async => args, // Pass through the structured data
    );
    allTools.add(returnResultTool);
  }

  final structuredTools = allTools.isNotEmpty ? allTools.toTool() : null;

  // Removed verbose logging
  final messagesDtos = messages.toMessages();

  // Removed verbose logging

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
    toolChoice: structuredTools != null
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
    // Removed verbose logging
    final result = <a.Message>[];
    final consecutiveToolMessages = <msg.ChatMessage>[];

    void flushToolMessages() {
      if (consecutiveToolMessages.isNotEmpty) {
        // Removed verbose logging
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
            // Removed verbose logging
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
    final dataParts = message.parts.whereType<msg.DataPart>().toList();
    // Removed verbose logging

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
    if (dataPart.mimeType.startsWith('image/')) {
      // Images: Use native image blocks for better quality
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
          data: base64Encode(dataPart.bytes),
        ),
      );
    } else {
      // Non-images: Use dartantic_ai format as text
      final base64Data = base64Encode(dataPart.bytes);
      return a.Block.text(
        text:
            '[media: ${dataPart.mimeType}] '
            'data:${dataPart.mimeType};base64,$base64Data',
      );
    }
  }

  a.Message _mapModelMessage(msg.ChatMessage message) {
    final toolParts = message.parts.whereType<msg.ToolPart>().toList();
    // Removed verbose logging

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
    // Removed verbose logging
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
    // Removed verbose logging

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
  MessageStreamEventTransformer({this.hasOutputSchema = false});

  /// Whether the request has an output schema (expecting return_result).
  final bool hasOutputSchema;

  /// The last message ID.
  String? lastMessageId;

  /// The last tool call ID.
  String? lastToolCallId;

  /// The last tool name.
  String? lastToolName;

  /// Accumulator for tool arguments during streaming.
  final Map<String, StringBuffer> _toolArgumentsAccumulator = {};

  /// Track completed return_result tools in current message.
  int _returnResultCount = 0;

  /// Collect suppressed content for metadata.
  final List<String> _suppressedText = [];
  final List<String> _suppressedToolCalls = [];
  final List<String> _extraReturnResults = [];

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
    // Removed verbose logging

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
    // Check if this is a return_result tool - track it but don't emit anything
    if (e.contentBlock is a.ToolUseBlock) {
      final toolBlock = e.contentBlock as a.ToolUseBlock;
      if (toolBlock.name == kReturnResultToolName) {
        lastToolCallId = toolBlock.id;
        lastToolName = toolBlock.name;
        // Processing return_result tool
        // Return empty result - we'll emit the JSON text on block stop
        return ChatResult<msg.ChatMessage>(
          id: lastMessageId ?? '',
          output: const msg.ChatMessage(role: msg.MessageRole.model, parts: []),
          messages: const [],
          finishReason: FinishReason.unspecified,
          metadata: const {},
          usage: const LanguageModelUsage(),
        );
      }
    }

    final parts = _mapContentBlock(e.contentBlock);
    // Removed verbose logging

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

    // If we have output schema, suppress text streaming
    if (hasOutputSchema && parts.whereType<msg.TextPart>().isNotEmpty) {
      final suppressedContent = parts
          .whereType<msg.TextPart>()
          .map((p) => p.text)
          .join();
      _suppressedText.add(suppressedContent);
      // Suppressing text output when outputSchema is present
      // Return empty result to suppress text
      return ChatResult<msg.ChatMessage>(
        id: lastMessageId ?? '',
        output: const msg.ChatMessage(role: msg.MessageRole.model, parts: []),
        messages: const [],
        finishReason: FinishReason.unspecified,
        metadata: {'index': e.index},
        usage: const LanguageModelUsage(),
      );
    }

    // If we already have a return_result and this is text, log warning
    if (_returnResultCount > 0 && parts.whereType<msg.TextPart>().isNotEmpty) {
      final textContent = parts
          .whereType<msg.TextPart>()
          .map((p) => p.text)
          .join();
      if (textContent.isNotEmpty) {
        _logger.warning(
          'Dropping text content alongside return_result tool call: '
          '"$textContent"',
        );
      }
    }

    // Removed verbose logging
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

      // Check if this is the return_result tool
      if (lastToolName == kReturnResultToolName) {
        _returnResultCount++;

        // Convert to JSON text output instead of tool call
        final parsedArgs = argsJson.isNotEmpty ? json.decode(argsJson) : {};
        final jsonOutput = json.encode(parsedArgs);

        // Log warning if we already have a return_result
        if (_returnResultCount > 1) {
          _logger.warning(
            'Multiple return_result tool calls found '
            '($_returnResultCount), using first one',
          );
          // Track the extra result
          _extraReturnResults.add(jsonOutput);
          // Don't emit this one, just clear state and return null
          lastToolCallId = null;
          lastToolName = null;
          return null;
        }

        // Create metadata for the message
        final messageMetadata = <String, dynamic>{};
        if (_suppressedText.isNotEmpty) {
          messageMetadata['suppressed_text'] = _suppressedText.join('');
        }
        if (_suppressedToolCalls.isNotEmpty) {
          messageMetadata['suppressed_tool_calls'] = _suppressedToolCalls;
        }
        if (_extraReturnResults.isNotEmpty) {
          messageMetadata['extra_return_results'] = _extraReturnResults;
        }

        final result = ChatResult<msg.ChatMessage>(
          id: lastMessageId ?? '',
          output: msg.ChatMessage(
            role: msg.MessageRole.model,
            parts: [msg.TextPart(jsonOutput)],
            metadata: messageMetadata,
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

      // Normal tool call - check if we should warn about it
      if (_returnResultCount > 0) {
        _logger.warning(
          'Dropping other tool calls alongside return_result: '
          '${lastToolName ?? "unknown"}',
        );
        // Track the suppressed tool call
        _suppressedToolCalls.add(
          '${lastToolName ?? "unknown"}(args: $argsJson)',
        );
        // Don't emit this tool call
        lastToolCallId = null;
        lastToolName = null;
        return null;
      }

      // Normal tool call - return as ToolPart
      final result = ChatResult<msg.ChatMessage>(
        id: lastMessageId ?? '',
        output: msg.ChatMessage(
          role: msg.MessageRole.model,
          parts: [
            msg.ToolPart.call(
              id: lastToolCallId!,
              name: lastToolName ?? '',
              arguments: argsJson.isNotEmpty ? json.decode(argsJson) : {},
              // Provide raw JSON string for Agent's streaming fallback
              argumentsRawString: argsJson,
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
    _returnResultCount = 0; // Reset for next message
    _suppressedText.clear();
    _suppressedToolCalls.clear();
    _extraReturnResults.clear();
    return null;
  }
}

/// Maps an Anthropic [a.MessageContent] to message parts.
List<msg.Part> _mapMessageContent(a.MessageContent content) =>
    switch (content) {
      final a.MessageContentText t => [msg.TextPart(t.value)],
      final a.MessageContentBlocks b => _mapContentBlocks(b.value),
    };

/// Maps Anthropic content blocks to message parts, handling return_result
/// specially.
List<msg.Part> _mapContentBlocks(List<a.Block> blocks) {
  // Check if there's a return_result tool call
  final toolUseBlocks = blocks.whereType<a.ToolUseBlock>().toList();
  final returnResultBlock = toolUseBlocks
      .where((toolUse) => toolUse.name == kReturnResultToolName)
      .firstOrNull;

  if (returnResultBlock != null) {
    // Found return_result - convert to JSON text and drop everything else
    final jsonOutput = json.encode(returnResultBlock.input);

    // Log warnings for dropped content
    final textBlocks = blocks.whereType<a.TextBlock>().toList();
    if (textBlocks.isNotEmpty) {
      final droppedText = textBlocks.map((t) => t.text).join(' ');
      _logger.warning(
        'Dropping text content alongside return_result tool call: '
        '"$droppedText"',
      );
    }

    final otherToolBlocks = toolUseBlocks
        .where((toolUse) => toolUse.name != kReturnResultToolName)
        .toList();
    if (otherToolBlocks.isNotEmpty) {
      final droppedTools = otherToolBlocks.map((t) => t.name).join(', ');
      _logger.warning(
        'Dropping other tool calls alongside return_result: $droppedTools',
      );
    }

    // Check for multiple return_result calls
    final returnResultCount = toolUseBlocks
        .where((toolUse) => toolUse.name == kReturnResultToolName)
        .length;
    if (returnResultCount > 1) {
      _logger.warning(
        'Multiple return_result tool calls found ($returnResultCount), '
        'using first one',
      );
    }

    return [msg.TextPart(jsonOutput)];
  }

  // No return_result found - process normally
  return [
    // Extract text parts
    ...blocks.whereType<a.TextBlock>().map((t) => msg.TextPart(t.text)),
    // Extract tool use parts
    ...toolUseBlocks.map(
      (toolUse) => msg.ToolPart.call(
        id: toolUse.id,
        name: toolUse.name,
        arguments: toolUse.input,
        // Provide raw JSON string for Agent's streaming fallback
        argumentsRawString: json.encode(toolUse.input),
      ),
    ),
  ];
}

/// Maps an Anthropic [a.Block] to message parts.
List<msg.Part> _mapContentBlock(a.Block contentBlock) => switch (contentBlock) {
  final a.TextBlock t => [msg.TextPart(t.text)],
  final a.ImageBlock i => [
    msg.DataPart(
      bytes: Uint8List.fromList(i.source.data.codeUnits),
      mimeType: 'image/png',
    ),
  ],
  final a.ToolUseBlock tu =>
    tu.name == kReturnResultToolName
        ? [] // Don't emit return_result as a tool part
        : [
            msg.ToolPart.call(
              id: tu.id,
              name: tu.name,
              arguments: tu.input,
              // Provide raw JSON string for Agent's streaming fallback
              argumentsRawString: json.encode(tu.input),
            ),
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
  List<a.Tool> toTool() => map(_mapTool).toList(growable: false);

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
