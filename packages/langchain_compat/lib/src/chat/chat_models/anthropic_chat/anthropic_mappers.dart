import 'dart:async';
import 'dart:convert';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:collection/collection.dart' show IterableExtension;
import 'package:rxdart/rxdart.dart' show WhereNotNullExtension;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../tools/tool.dart';
import '../chat_message.dart';
import '../chat_result.dart';
import 'anthropic_chat.dart';

/// Creates an Anthropic [a.CreateMessageRequest] from a list of chat messages
/// and options.
a.CreateMessageRequest createMessageRequest(
  List<ChatMessage> messages, {
  required String model,
  required AnthropicChatOptions? options,
  required AnthropicChatOptions defaultOptions,
  List<Tool>? tools,
  double? temperature,
  bool stream = false,
}) {
  final systemMsg = messages.firstOrNull is SystemChatMessage
      ? messages.firstOrNull?.contentAsString
      : null;

  final messagesDtos = messages.toMessages();
  final hasTools = tools != null && tools.isNotEmpty;
  final toolChoice = hasTools ? const ChatToolChoiceAuto() : null;
  final toolChoiceDto = toolChoice?.toToolChoice();
  final toolsDtos = hasTools ? tools.toTool(toolChoice) : null;

  return a.CreateMessageRequest(
    model: a.Model.modelId(model),
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
    toolChoice: toolChoiceDto,
    stream: stream,
  );
}

/// Extension on [List<ChatMessage>] to convert chat messages to Anthropic SDK
/// messages.
extension ChatMessageListMapper on List<ChatMessage> {
  /// Converts this list of [ChatMessage]s to a list of Anthropic SDK
  /// [a.Message]s.
  List<a.Message> toMessages() {
    final result = <a.Message>[];
    final consecutiveToolMessages = <ToolChatMessage>[];

    void flushToolMessages() {
      if (consecutiveToolMessages.isNotEmpty) {
        result.add(_mapToolChatMessages(consecutiveToolMessages));
        consecutiveToolMessages.clear();
      }
    }

    for (final message in this) {
      switch (message) {
        case SystemChatMessage():
          flushToolMessages();
          continue; // System message set in request params
        case final HumanChatMessage msg:
          flushToolMessages();
          final res = _mapHumanChatMessage(msg);
          result.add(res);
        case final AIChatMessage msg:
          flushToolMessages();
          final res = _mapAIChatMessage(msg);
          result.add(res);
        case final ToolChatMessage msg:
          consecutiveToolMessages.add(msg);
        case CustomChatMessage():
          throw UnsupportedError('Anthropic does not support custom messages');
      }
    }

    flushToolMessages(); // Flush any remaining tool messages
    return result;
  }

  a.Message _mapHumanChatMessage(HumanChatMessage msg) => a.Message(
    role: a.MessageRole.user,
    content: switch (msg.content) {
      final ChatMessageContentText t => a.MessageContent.text(t.text),
      final ChatMessageContentImage i => a.MessageContent.blocks([
        _mapHumanChatMessageContentImage(i),
      ]),
      final ChatMessageContentMultiModal mm => a.MessageContent.blocks(
        mm.parts
            .map(
              (part) => switch (part) {
                final ChatMessageContentText t => a.Block.text(text: t.text),
                final ChatMessageContentImage i =>
                  _mapHumanChatMessageContentImage(i),
                ChatMessageContentMultiModal() => throw ArgumentError(
                  'Cannot have multimodal content in multimodal content',
                ),
              },
            )
            .toList(growable: false),
      ),
    },
  );

  a.Block _mapHumanChatMessageContentImage(ChatMessageContentImage i) =>
      a.Block.image(
        source: a.ImageBlockSource(
          type: a.ImageBlockSourceType.base64,
          mediaType: switch (i.mimeType) {
            'image/jpeg' => a.ImageBlockSourceMediaType.imageJpeg,
            'image/png' => a.ImageBlockSourceMediaType.imagePng,
            'image/gif' => a.ImageBlockSourceMediaType.imageGif,
            'image/webp' => a.ImageBlockSourceMediaType.imageWebp,
            _ => throw AssertionError(
              'Unsupported image MIME type: ${i.mimeType}',
            ),
          },
          data: i.data.startsWith('http')
              ? throw AssertionError(
                  'Anthropic only supports base64-encoded images',
                )
              : i.data,
        ),
      );

  a.Message _mapAIChatMessage(AIChatMessage msg) {
    if (msg.toolCalls.isEmpty) {
      return a.Message(
        role: a.MessageRole.assistant,
        content: a.MessageContent.text(msg.content),
      );
    } else {
      return a.Message(
        role: a.MessageRole.assistant,
        content: a.MessageContent.blocks(
          msg.toolCalls
              .map(
                (toolCall) => a.Block.toolUse(
                  id: toolCall.id,
                  name: toolCall.name,
                  input: toolCall.arguments,
                ),
              )
              .toList(growable: false),
        ),
      );
    }
  }

  a.Message _mapToolChatMessages(List<ToolChatMessage> msgs) => a.Message(
    role: a.MessageRole.user,
    content: a.MessageContent.blocks(
      msgs
          .map(
            (msg) => a.Block.toolResult(
              toolUseId: msg.toolCallId,
              content: a.ToolResultBlockContent.text(msg.content),
            ),
          )
          .toList(growable: false),
    ),
  );
}

/// Extension on [a.Message] to convert an Anthropic SDK message to a
/// [ChatResult].
extension MessageMapper on a.Message {
  /// Converts this Anthropic SDK [a.Message] to a [ChatResult].
  ChatResult toChatResult() {
    final (content, toolCalls) = _mapMessageContent(this.content);
    return ChatResult(
      id: id ?? '',
      output: AIChatMessage(content: content, toolCalls: toolCalls),
      finishReason: _mapFinishReason(stopReason),
      metadata: {'model': model, 'stop_sequence': stopSequence},
      usage: _mapUsage(usage),
    );
  }
}

/// A [StreamTransformer] that converts a stream of Anthropic
/// [a.MessageStreamEvent]s into [ChatResult]s.
class MessageStreamEventTransformer
    extends StreamTransformerBase<a.MessageStreamEvent, ChatResult> {
  /// Creates a [MessageStreamEventTransformer].
  MessageStreamEventTransformer();

  /// The last message ID.
  String? lastMessageId;

  /// The last tool call ID.
  String? lastToolCallId;

  /// Binds this transformer to a stream of [a.MessageStreamEvent]s, producing a
  /// stream of [ChatResult]s.
  @override
  Stream<ChatResult> bind(Stream<a.MessageStreamEvent> stream) => stream
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

  ChatResult _mapMessageStartEvent(a.MessageStartEvent e) {
    final msg = e.message;

    final msgId = msg.id ?? lastMessageId ?? '';
    lastMessageId = msgId;
    final (content, toolCalls) = _mapMessageContent(e.message.content);

    return ChatResult(
      id: msgId,
      output: AIChatMessage(content: content, toolCalls: toolCalls),
      finishReason: _mapFinishReason(e.message.stopReason),
      metadata: {
        if (e.message.model != null) 'model': e.message.model,
        if (e.message.stopSequence != null)
          'stop_sequence': e.message.stopSequence,
      },
      usage: _mapUsage(e.message.usage),
    );
  }

  ChatResult _mapMessageDeltaEvent(a.MessageDeltaEvent e) => ChatResult(
    id: lastMessageId ?? '',
    output: const AIChatMessage(content: ''),
    finishReason: _mapFinishReason(e.delta.stopReason),
    metadata: {
      if (e.delta.stopSequence != null) 'stop_sequence': e.delta.stopSequence,
    },
    usage: _mapMessageDeltaUsage(e.usage),
  );

  ChatResult _mapContentBlockStartEvent(a.ContentBlockStartEvent e) {
    final (content, toolCall) = _mapContentBlock(e.contentBlock);
    if (toolCall != null) {
      lastToolCallId = toolCall.id;
    }

    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage(
        content: content,
        toolCalls: [if (toolCall != null) toolCall],
      ),
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult _mapContentBlockDeltaEvent(a.ContentBlockDeltaEvent e) {
    final (content, toolCals) = _mapContentBlockDelta(lastToolCallId, e.delta);
    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage(content: content, toolCalls: toolCals),
      finishReason: FinishReason.unspecified,
      metadata: {'index': e.index},
      usage: const LanguageModelUsage(),
    );
  }

  ChatResult? _mapContentBlockStopEvent(a.ContentBlockStopEvent e) {
    lastToolCallId = null;
    return null;
  }

  ChatResult? _mapMessageStopEvent(a.MessageStopEvent e) {
    lastMessageId = null;
    return null;
  }
}

/// Maps an Anthropic [a.MessageContent] to content and tool calls.
(String content, List<AIChatMessageToolCall> toolCalls) _mapMessageContent(
  a.MessageContent content,
) => switch (content) {
  final a.MessageContentText t => (t.value, const <AIChatMessageToolCall>[]),
  final a.MessageContentBlocks b => (
    b.text,
    b.value
        .whereType<a.ToolUseBlock>()
        .map(
          (toolUse) => AIChatMessageToolCall(
            id: toolUse.id,
            name: toolUse.name,
            argumentsRaw: toolUse.input.isNotEmpty
                ? json.encode(toolUse.input)
                : '',
            arguments: toolUse.input,
          ),
        )
        .toList(growable: false),
  ),
};

/// Maps an Anthropic [a.Block] to content and tool call.
(String content, AIChatMessageToolCall? toolCall) _mapContentBlock(
  a.Block contentBlock,
) => switch (contentBlock) {
  final a.TextBlock t => (t.text, null),
  final a.ImageBlock i => (i.source.data, null),
  final a.ToolUseBlock tu => (
    '',
    AIChatMessageToolCall(
      id: tu.id,
      name: tu.name,
      argumentsRaw: tu.input.isNotEmpty ? json.encode(tu.input) : '',
      arguments: tu.input,
    ),
  ),
  final a.ToolResultBlock tr => (tr.content.text, null),
};

/// Maps an Anthropic [a.BlockDelta] to content and tool calls.
(String content, List<AIChatMessageToolCall> toolCalls) _mapContentBlockDelta(
  String? lastToolId,
  a.BlockDelta blockDelta,
) => switch (blockDelta) {
  final a.TextBlockDelta t => (t.text, const <AIChatMessageToolCall>[]),
  final a.InputJsonBlockDelta jb => (
    '',
    [
      AIChatMessageToolCall(
        id: lastToolId ?? '',
        name: '',
        argumentsRaw: jb.partialJson ?? '',
        arguments: const {},
      ),
    ],
  ),
};

/// Extension on [List<Tool>] to convert tool specs to Anthropic SDK tools.
extension ToolSpecListMapper on List<Tool> {
  /// Converts this list of [Tool]s to a list of Anthropic SDK [a.Tool]s.
  List<a.Tool> toTool(ChatToolChoice? toolChoice) {
    if (toolChoice is ChatToolChoiceNone) {
      return const [];
    }

    if (toolChoice is ChatToolChoiceForced) {
      final tool = firstWhereOrNull((t) => t.name == toolChoice.name);
      return [if (tool != null) _mapTool(tool)];
    }

    return map(_mapTool).toList(growable: false);
  }

  a.Tool _mapTool(Tool tool) => a.Tool.custom(
    name: tool.name,
    description: tool.description,
    inputSchema: tool.inputSchema,
  );
}

/// Extension on [ChatToolChoice] to convert to Anthropic SDK [a.ToolChoice].
extension ChatToolChoiceMapper on ChatToolChoice {
  /// Converts this [ChatToolChoice] to an Anthropic SDK [a.ToolChoice].
  a.ToolChoice toToolChoice() => switch (this) {
    ChatToolChoiceNone _ => const a.ToolChoice(type: a.ToolChoiceType.auto),
    ChatToolChoiceAuto _ => const a.ToolChoice(type: a.ToolChoiceType.auto),
    ChatToolChoiceRequired _ => const a.ToolChoice(type: a.ToolChoiceType.any),
    final ChatToolChoiceForced t => a.ToolChoice(
      type: a.ToolChoiceType.tool,
      name: t.name,
    ),
  };
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
