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

/// Creates a [MessageCreateRequest] from the given input.
a.MessageCreateRequest createMessageRequest(
  final List<ChatMessage> messages, {
  required final ChatAnthropicOptions? options,
  required final ChatAnthropicOptions defaultOptions,
  final bool stream = false,
}) {
  final systemMsg = messages.firstOrNull is SystemChatMessage
      ? messages.firstOrNull?.contentAsString
      : null;

  final messagesDtos = messages.toInputMessages();
  final toolChoice = options?.toolChoice ?? defaultOptions.toolChoice;
  final toolChoiceDto = toolChoice?.toToolChoice();
  final toolsDtos = (options?.tools ?? defaultOptions.tools)?.toToolDefinitions(
    toolChoice,
  );
  final thinking = options?.thinking ?? defaultOptions.thinking;
  final thinkingDto = thinking?.toThinkingConfig();
  final userId = options?.userId ?? defaultOptions.userId;

  return a.MessageCreateRequest(
    model: options?.model ?? defaultOptions.model ?? ChatAnthropic.defaultModel,
    messages: messagesDtos,
    maxTokens:
        options?.maxTokens ??
        defaultOptions.maxTokens ??
        ChatAnthropic.defaultMaxTokens,
    stopSequences: options?.stopSequences ?? defaultOptions.stopSequences,
    system: systemMsg != null ? a.SystemPrompt.text(systemMsg) : null,
    temperature: options?.temperature ?? defaultOptions.temperature,
    topK: options?.topK ?? defaultOptions.topK,
    topP: options?.topP ?? defaultOptions.topP,
    metadata: userId != null ? a.Metadata(userId: userId) : null,
    tools: toolsDtos,
    toolChoice: toolChoiceDto,
    thinking: thinkingDto,
    stream: stream,
  );
}

extension ChatMessageListMapper on List<ChatMessage> {
  List<a.InputMessage> toInputMessages() {
    final List<a.InputMessage> result = [];
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

  a.InputMessage _mapHumanChatMessage(final HumanChatMessage msg) {
    return switch (msg.content) {
      final ChatMessageContentText t => a.InputMessage.user(t.text),
      final ChatMessageContentImage i => a.InputMessage.userBlocks([
        _mapHumanChatMessageContentImage(i),
      ]),
      final ChatMessageContentMultiModal mm => a.InputMessage.userBlocks(
        mm.parts
            .map(
              (final part) => switch (part) {
                final ChatMessageContentText t => a.InputContentBlock.text(
                  t.text,
                ),
                final ChatMessageContentImage i =>
                  _mapHumanChatMessageContentImage(i),
                ChatMessageContentMultiModal() => throw ArgumentError(
                  'Cannot have multimodal content in multimodal content',
                ),
              },
            )
            .toList(growable: false),
      ),
    };
  }

  a.InputContentBlock _mapHumanChatMessageContentImage(
    ChatMessageContentImage i,
  ) {
    final imageData = i.data.trim();
    if (imageData.startsWith('http')) {
      return a.InputContentBlock.image(a.ImageSource.url(imageData));
    }
    if (i.mimeType == 'application/pdf') {
      return a.InputContentBlock.document(
        a.DocumentSource.base64Pdf(imageData),
      );
    }
    if (i.mimeType == null) {
      throw ArgumentError(
        'mimeType is required for base64-encoded images',
      );
    }
    return a.InputContentBlock.image(
      a.ImageSource.base64(
        data: imageData,
        mediaType: a.ImageMediaType.fromMimeType(i.mimeType!),
      ),
    );
  }

  a.InputMessage _mapAIChatMessage(final AIChatMessage msg) {
    if (msg.toolCalls.isEmpty) {
      return a.InputMessage.assistant(msg.content);
    } else {
      return a.InputMessage.assistantBlocks(
        msg.toolCalls
            .map(
              (final toolCall) => a.InputContentBlock.toolUse(
                id: toolCall.id,
                name: toolCall.name,
                input: toolCall.arguments,
              ),
            )
            .toList(growable: false),
      );
    }
  }

  a.InputMessage _mapToolChatMessages(final List<ToolChatMessage> msgs) {
    return a.InputMessage.userBlocks(
      msgs
          .map(
            (msg) => a.InputContentBlock.toolResultText(
              toolUseId: msg.toolCallId,
              text: msg.content,
            ),
          )
          .toList(growable: false),
    );
  }
}

extension MessageMapper on a.Message {
  ChatResult toChatResult() {
    final content = '$thinking$text';
    final toolCalls = toolUseBlocks
        .map(
          (tu) => AIChatMessageToolCall(
            id: tu.id,
            name: tu.name,
            argumentsRaw: tu.input.isNotEmpty ? json.encode(tu.input) : '',
            arguments: tu.input,
          ),
        )
        .toList(growable: false);
    return ChatResult(
      id: id,
      output: AIChatMessage(content: content, toolCalls: toolCalls),
      finishReason: _mapFinishReason(stopReason),
      metadata: {'model': model, 'stop_sequence': stopSequence},
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
    lastMessageId = msg.id;

    return ChatResult(
      id: msg.id,
      output: AIChatMessage(
        content: '${msg.thinking}${msg.text}',
        toolCalls: msg.toolUseBlocks
            .map(
              (tu) => AIChatMessageToolCall(
                id: tu.id,
                name: tu.name,
                argumentsRaw: tu.input.isNotEmpty ? json.encode(tu.input) : '',
                arguments: tu.input,
              ),
            )
            .toList(growable: false),
      ),
      finishReason: _mapFinishReason(msg.stopReason),
      metadata: {
        'model': msg.model,
        if (msg.stopSequence != null) 'stop_sequence': msg.stopSequence,
      },
      usage: _mapUsage(msg.usage),
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
    final (content, toolCalls) = _mapContentBlockDelta(lastToolCallId, e.delta);
    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage(content: content, toolCalls: toolCalls),
      finishReason: FinishReason.unspecified,
      metadata: {'index': e.index},
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

/// Maps a single content block from stream start event.
(String content, AIChatMessageToolCall? toolCall) _mapContentBlock(
  final a.ContentBlock contentBlock,
) => switch (contentBlock) {
  final a.TextBlock t => (t.text, null),
  final a.ThinkingBlock t => (t.thinking, null),
  final a.ToolUseBlock tu => (
    '',
    AIChatMessageToolCall(
      id: tu.id,
      name: tu.name,
      argumentsRaw: tu.input.isNotEmpty ? json.encode(tu.input) : '',
      arguments: tu.input,
    ),
  ),
  a.RedactedThinkingBlock() => ('', null),
  a.ServerToolUseBlock() => ('', null),
  a.WebSearchToolResultBlock() => ('', null),
  _ => ('', null),
};

/// Maps a content block delta from streaming events.
(String content, List<AIChatMessageToolCall> toolCalls) _mapContentBlockDelta(
  final String? lastToolId,
  final a.ContentBlockDelta blockDelta,
) => switch (blockDelta) {
  final a.TextDelta t => (t.text, const <AIChatMessageToolCall>[]),
  final a.InputJsonDelta jb => (
    '',
    [
      AIChatMessageToolCall(
        id: lastToolId ?? '',
        name: '',
        argumentsRaw: jb.partialJson,
        arguments: const {},
      ),
    ],
  ),
  final a.ThinkingDelta t => (t.thinking, const <AIChatMessageToolCall>[]),
  a.SignatureDelta() => ('', const <AIChatMessageToolCall>[]),
  a.CitationsDelta() => ('', const <AIChatMessageToolCall>[]),
  _ => ('', const <AIChatMessageToolCall>[]),
};

extension ToolSpecListMapper on List<ToolSpec> {
  /// Converts tool specs to typed ToolDefinition list for the request.
  List<a.ToolDefinition>? toToolDefinitions(final ChatToolChoice? toolChoice) {
    if (toolChoice is ChatToolChoiceNone) {
      return null;
    }

    if (toolChoice is ChatToolChoiceForced) {
      final tool = firstWhereOrNull((final t) => t.name == toolChoice.name);
      return tool != null ? [_mapTool(tool)] : null;
    }

    return map(_mapTool).toList(growable: false);
  }

  a.ToolDefinition _mapTool(final ToolSpec tool) {
    return a.ToolDefinition.custom(
      a.Tool(
        name: tool.name,
        description: tool.description,
        inputSchema: a.InputSchema.fromJson(tool.inputJsonSchema),
      ),
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  /// Converts tool choice to typed ToolChoice for the request.
  a.ToolChoice toToolChoice() {
    return switch (this) {
      ChatToolChoiceNone _ => a.ToolChoice.none(),
      ChatToolChoiceAuto _ => a.ToolChoice.auto(),
      ChatToolChoiceRequired _ => a.ToolChoice.any(),
      final ChatToolChoiceForced t => a.ToolChoice.tool(t.name),
    };
  }
}

FinishReason _mapFinishReason(final a.StopReason? reason) => switch (reason) {
  a.StopReason.endTurn => FinishReason.stop,
  a.StopReason.maxTokens => FinishReason.length,
  a.StopReason.stopSequence => FinishReason.stop,
  a.StopReason.toolUse => FinishReason.toolCalls,
  a.StopReason.pauseTurn => FinishReason.unspecified,
  a.StopReason.refusal => FinishReason.contentFilter,
  a.StopReason.compaction => FinishReason.unspecified,
  _ => FinishReason.unspecified,
};

LanguageModelUsage _mapUsage(final a.Usage usage) {
  return LanguageModelUsage(
    promptTokens: usage.inputTokens,
    responseTokens: usage.outputTokens,
    totalTokens: usage.inputTokens + usage.outputTokens,
  );
}

LanguageModelUsage _mapMessageDeltaUsage(final a.MessageDeltaUsage usage) {
  return LanguageModelUsage(
    responseTokens: usage.outputTokens,
    totalTokens: usage.outputTokens,
  );
}
