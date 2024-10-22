// ignore_for_file: public_member_api_docs
import 'dart:async';
import 'dart:convert';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart' as a;
import 'package:collection/collection.dart' show IterableExtension;
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:rxdart/rxdart.dart' show WhereNotNullExtension;

import 'chat_anthropic.dart';
import 'types.dart';

/// Creates a [CreateMessageRequest] from the given input.
a.CreateMessageRequest createMessageRequest(
  final List<ChatMessage> messages, {
  required final ChatAnthropicOptions? options,
  required final ChatAnthropicOptions defaultOptions,
  final bool stream = false,
}) {
  final systemMsg = messages.firstOrNull is SystemChatMessage
      ? messages.firstOrNull?.contentAsString
      : null;

  final messagesDtos = messages.toMessages();
  final toolChoice = options?.toolChoice ?? defaultOptions.toolChoice;
  final toolChoiceDto = toolChoice?.toToolChoice();
  final toolsDtos =
      (options?.tools ?? defaultOptions.tools)?.toTool(toolChoice);

  return a.CreateMessageRequest(
    model: a.Model.modelId(
      options?.model ?? defaultOptions.model ?? ChatAnthropic.defaultModel,
    ),
    messages: messagesDtos,
    maxTokens: options?.maxTokens ??
        defaultOptions.maxTokens ??
        ChatAnthropic.defaultMaxTokens,
    stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
    system: systemMsg,
    temperature: options?.temperature ?? defaultOptions.temperature,
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

extension ChatMessageListMapper on List<ChatMessage> {
  List<a.Message> toMessages() {
    final List<a.Message> result = [];
    final List<ToolChatMessage> consecutiveToolMessages = [];

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

  a.Message _mapHumanChatMessage(final HumanChatMessage msg) {
    return a.Message(
      role: a.MessageRole.user,
      content: switch (msg.content) {
        final ChatMessageContentText t => a.MessageContent.text(t.text),
        final ChatMessageContentImage i => a.MessageContent.blocks([
            _mapHumanChatMessageContentImage(i),
          ]),
        final ChatMessageContentMultiModal mm => a.MessageContent.blocks(
            mm.parts
                .map(
                  (final part) => switch (part) {
                    final ChatMessageContentText t =>
                      a.Block.text(text: t.text),
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
  }

  a.Block _mapHumanChatMessageContentImage(ChatMessageContentImage i) {
    return a.Block.image(
      source: a.ImageBlockSource(
        type: a.ImageBlockSourceType.base64,
        mediaType: switch (i.mimeType) {
          'image/jpeg' => a.ImageBlockSourceMediaType.imageJpeg,
          'image/png' => a.ImageBlockSourceMediaType.imagePng,
          'image/gif' => a.ImageBlockSourceMediaType.imageGif,
          'image/webp' => a.ImageBlockSourceMediaType.imageWebp,
          _ =>
            throw AssertionError('Unsupported image MIME type: ${i.mimeType}'),
        },
        data: i.data.startsWith('http')
            ? throw AssertionError(
                'Anthropic only supports base64-encoded images',
              )
            : i.data,
      ),
    );
  }

  a.Message _mapAIChatMessage(final AIChatMessage msg) {
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
                (final toolCall) => a.Block.toolUse(
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

  a.Message _mapToolChatMessages(final List<ToolChatMessage> msgs) {
    return a.Message(
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
}

extension MessageMapper on a.Message {
  ChatResult toChatResult() {
    final (content, toolCalls) = _mapMessageContent(this.content);
    return ChatResult(
      id: id ?? '',
      output: AIChatMessage(
        content: content,
        toolCalls: toolCalls,
      ),
      finishReason: _mapFinishReason(stopReason),
      metadata: {
        'model': model,
        'stop_sequence': stopSequence,
      },
      usage: _mapUsage(usage),
    );
  }
}

class MessageStreamEventTransformer
    extends StreamTransformerBase<a.MessageStreamEvent, ChatResult> {
  MessageStreamEventTransformer();

  String? lastMessageId;
  String? lastToolCallId;

  @override
  Stream<ChatResult> bind(final Stream<a.MessageStreamEvent> stream) {
    return stream
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
  }

  ChatResult _mapMessageStartEvent(final a.MessageStartEvent e) {
    final msg = e.message;

    final msgId = msg.id ?? lastMessageId ?? '';
    lastMessageId = msgId;
    final (content, toolCalls) = _mapMessageContent(e.message.content);

    return ChatResult(
      id: msgId,
      output: AIChatMessage(
        content: content,
        toolCalls: toolCalls,
      ),
      finishReason: _mapFinishReason(e.message.stopReason),
      metadata: {
        if (e.message.model != null) 'model': e.message.model,
        if (e.message.stopSequence != null)
          'stop_sequence': e.message.stopSequence,
      },
      usage: _mapUsage(e.message.usage),
      streaming: true,
    );
  }

  ChatResult _mapMessageDeltaEvent(final a.MessageDeltaEvent e) {
    return ChatResult(
      id: lastMessageId ?? '',
      output: const AIChatMessage(content: ''),
      finishReason: _mapFinishReason(e.delta.stopReason),
      metadata: {
        if (e.delta.stopSequence != null) 'stop_sequence': e.delta.stopSequence,
      },
      usage: _mapMessageDeltaUsage(e.usage),
      streaming: true,
    );
  }

  ChatResult _mapContentBlockStartEvent(final a.ContentBlockStartEvent e) {
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
      streaming: true,
    );
  }

  ChatResult _mapContentBlockDeltaEvent(final a.ContentBlockDeltaEvent e) {
    final (content, toolCals) = _mapContentBlockDelta(lastToolCallId, e.delta);
    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage(
        content: content,
        toolCalls: toolCals,
      ),
      finishReason: FinishReason.unspecified,
      metadata: {
        'index': e.index,
      },
      usage: const LanguageModelUsage(),
      streaming: true,
    );
  }

  ChatResult? _mapContentBlockStopEvent(final a.ContentBlockStopEvent e) {
    lastToolCallId = null;
    return null;
  }

  ChatResult? _mapMessageStopEvent(final a.MessageStopEvent e) {
    lastMessageId = null;
    return null;
  }
}

(String content, List<AIChatMessageToolCall> toolCalls) _mapMessageContent(
  final a.MessageContent content,
) =>
    switch (content) {
      final a.MessageContentText t => (
          t.value,
          const <AIChatMessageToolCall>[]
        ),
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

(String content, AIChatMessageToolCall? toolCall) _mapContentBlock(
  final a.Block contentBlock,
) =>
    switch (contentBlock) {
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

(String content, List<AIChatMessageToolCall> toolCalls) _mapContentBlockDelta(
  final String? lastToolId,
  final a.BlockDelta blockDelta,
) =>
    switch (blockDelta) {
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

extension ToolSpecListMapper on List<ToolSpec> {
  List<a.Tool> toTool(final ChatToolChoice? toolChoice) {
    if (toolChoice is ChatToolChoiceNone) {
      return const [];
    }

    if (toolChoice is ChatToolChoiceForced) {
      final tool = firstWhereOrNull((final t) => t.name == toolChoice.name);
      return [if (tool != null) _mapTool(tool)];
    }

    return map(_mapTool).toList(growable: false);
  }

  a.Tool _mapTool(final ToolSpec tool) {
    return a.Tool.custom(
      name: tool.name,
      description: tool.description,
      inputSchema: tool.inputJsonSchema,
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  a.ToolChoice toToolChoice() {
    return switch (this) {
      ChatToolChoiceNone _ => const a.ToolChoice(type: a.ToolChoiceType.auto),
      ChatToolChoiceAuto _ => const a.ToolChoice(type: a.ToolChoiceType.auto),
      ChatToolChoiceRequired _ =>
        const a.ToolChoice(type: a.ToolChoiceType.any),
      final ChatToolChoiceForced t => a.ToolChoice(
          type: a.ToolChoiceType.tool,
          name: t.name,
        ),
    };
  }
}

FinishReason _mapFinishReason(
  final a.StopReason? reason,
) =>
    switch (reason) {
      a.StopReason.endTurn => FinishReason.stop,
      a.StopReason.maxTokens => FinishReason.length,
      a.StopReason.stopSequence => FinishReason.stop,
      a.StopReason.toolUse => FinishReason.toolCalls,
      null => FinishReason.unspecified,
    };

LanguageModelUsage _mapUsage(final a.Usage? usage) {
  return LanguageModelUsage(
    promptTokens: usage?.inputTokens,
    responseTokens: usage?.outputTokens,
    totalTokens: usage?.inputTokens != null && usage?.outputTokens != null
        ? usage!.inputTokens + usage.outputTokens
        : null,
  );
}

LanguageModelUsage _mapMessageDeltaUsage(final a.MessageDeltaUsage? usage) {
  return LanguageModelUsage(
    responseTokens: usage?.outputTokens,
    totalTokens: usage?.outputTokens,
  );
}
