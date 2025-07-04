import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:collection/collection.dart' show IterableExtension;
import 'package:rxdart/rxdart.dart' show WhereNotNullExtension;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../tools/tool.dart';
import '../chat_result.dart';
import '../message.dart' as msg;
import 'anthropic_chat.dart';

/// Creates an Anthropic [a.CreateMessageRequest] from a list of messages
/// and options.
a.CreateMessageRequest createMessageRequest(
  List<msg.Message> messages, {
  required String modelName,
  required AnthropicChatOptions? options,
  required AnthropicChatOptions defaultOptions,
  List<Tool>? tools,
  double? temperature,
  bool stream = false,
}) {
  final systemMsg = messages.firstOrNull?.role == msg.MessageRole.system
      ? (messages.firstOrNull!.parts.firstOrNull as msg.TextPart?)?.text
      : null;

  final messagesDtos = messages.toMessages();
  final hasTools = tools != null && tools.isNotEmpty;
  final toolsDtos = hasTools ? tools.toTool() : null;

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
    tools: toolsDtos,
    toolChoice: hasTools ? const a.ToolChoice(type: a.ToolChoiceType.auto) : null,
    stream: stream,
  );
}

/// Extension on [List<msg.Message>] to convert messages to Anthropic SDK
/// messages.
extension MessageListMapper on List<msg.Message> {
  /// Converts this list of [msg.Message]s to a list of Anthropic SDK
  /// [a.Message]s.
  List<a.Message> toMessages() {
    final result = <a.Message>[];
    final consecutiveToolMessages = <msg.Message>[];

    void flushToolMessages() {
      if (consecutiveToolMessages.isNotEmpty) {
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

  a.Message _mapUserMessage(msg.Message message) {
    final textParts = message.parts.whereType<msg.TextPart>().toList();
    final dataParts = message.parts.whereType<msg.DataPart>().toList();

    if (dataParts.isEmpty) {
      // Text-only message
      final text = textParts.map((p) => p.text).join('\n');
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

  a.Message _mapModelMessage(msg.Message message) {
    final textParts = message.parts.whereType<msg.TextPart>().toList();
    final toolParts = message.parts.whereType<msg.ToolPart>().toList();

    if (toolParts.isEmpty) {
      // Text-only response
      final text = textParts.map((p) => p.text).join('\n');
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

  a.Message _mapToolMessages(List<msg.Message> messages) {
    final blocks = <a.Block>[];
    
    for (final message in messages) {
      for (final part in message.parts) {
        if (part is msg.ToolPart && part.kind == msg.ToolPartKind.result) {
          blocks.add(
            a.Block.toolResult(
              toolUseId: part.id,
              content: a.ToolResultBlockContent.text(
                part.result is String ? part.result : json.encode(part.result),
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
  ChatResult<msg.Message> toChatResult() {
    final parts = _mapMessageContent(content);
    final message = msg.Message(
      role: msg.MessageRole.model,
      parts: parts,
    );
    
    return ChatResult<msg.Message>(
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
    extends StreamTransformerBase<a.MessageStreamEvent, ChatResult<msg.Message>> {
  /// Creates a [MessageStreamEventTransformer].
  MessageStreamEventTransformer();

  /// The last message ID.
  String? lastMessageId;

  /// The last tool call ID.
  String? lastToolCallId;

  /// Binds this transformer to a stream of [a.MessageStreamEvent]s, producing a
  /// stream of [ChatResult]s.
  @override
  Stream<ChatResult<msg.Message>> bind(Stream<a.MessageStreamEvent> stream) =>
      stream
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

  ChatResult<msg.Message> _mapMessageStartEvent(a.MessageStartEvent e) {
    final message = e.message;
    
    final msgId = message.id ?? lastMessageId ?? '';
    lastMessageId = msgId;
    final parts = _mapMessageContent(e.message.content);

    return ChatResult<msg.Message>(
      id: msgId,
      output: msg.Message(role: msg.MessageRole.model, parts: parts),
      messages: [msg.Message(role: msg.MessageRole.model, parts: parts)],
      finishReason: _mapFinishReason(e.message.stopReason),
      metadata: {
        if (e.message.model != null) 'model': e.message.model,
        if (e.message.stopSequence != null)
          'stop_sequence': e.message.stopSequence,
      },
      usage: _mapUsage(e.message.usage),
    );
  }

  ChatResult<msg.Message> _mapMessageDeltaEvent(a.MessageDeltaEvent e) =>
      ChatResult<msg.Message>(
        id: lastMessageId ?? '',
        output: msg.Message(role: msg.MessageRole.model, parts: []),
        messages: [msg.Message(role: msg.MessageRole.model, parts: [])],
        finishReason: _mapFinishReason(e.delta.stopReason),
        metadata: {
          if (e.delta.stopSequence != null)
            'stop_sequence': e.delta.stopSequence,
        },
        usage: _mapMessageDeltaUsage(e.usage),
      );

  ChatResult<msg.Message> _mapContentBlockStartEvent(
    a.ContentBlockStartEvent e,
  ) {
    final parts = _mapContentBlock(e.contentBlock);
    
    // Track tool call IDs
    for (final part in parts) {
      if (part is msg.ToolPart && part.kind == msg.ToolPartKind.call) {
        lastToolCallId = part.id;
        break;
      }
    }

    return ChatResult<msg.Message>(
      id: lastMessageId ?? '',
      output: msg.Message(role: msg.MessageRole.model, parts: parts),
      messages: [msg.Message(role: msg.MessageRole.model, parts: parts)],
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult<msg.Message> _mapContentBlockDeltaEvent(
    a.ContentBlockDeltaEvent e,
  ) {
    final parts = _mapContentBlockDelta(lastToolCallId, e.delta);
    return ChatResult<msg.Message>(
      id: lastMessageId ?? '',
      output: msg.Message(role: msg.MessageRole.model, parts: parts),
      messages: [msg.Message(role: msg.MessageRole.model, parts: parts)],
      finishReason: FinishReason.unspecified,
      metadata: {'index': e.index},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult<msg.Message>? _mapContentBlockStopEvent(
    a.ContentBlockStopEvent e,
  ) {
    lastToolCallId = null;
    return null;
  }

  ChatResult<msg.Message>? _mapMessageStopEvent(a.MessageStopEvent e) {
    lastMessageId = null;
    return null;
  }
}

/// Maps an Anthropic [a.MessageContent] to message parts.
List<msg.Part> _mapMessageContent(a.MessageContent content) => switch (content) {
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
  final a.ImageBlock i => [msg.DataPart(
    bytes: Uint8List.fromList(i.source.data.codeUnits),
    mimeType: 'image/png',
  )],
  final a.ToolUseBlock tu => [
    msg.ToolPart.call(
      id: tu.id,
      name: tu.name,
      arguments: tu.input,
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
  final a.InputJsonBlockDelta _ => [
    msg.ToolPart.call(
      id: lastToolId ?? '',
      name: '',
      arguments: {},
    ),
  ],
};

/// Extension on [List<Tool>] to convert tool specs to Anthropic SDK tools.
extension ToolSpecListMapper on List<Tool> {
  /// Converts this list of [Tool]s to a list of Anthropic SDK [a.Tool]s.
  List<a.Tool> toTool() {
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