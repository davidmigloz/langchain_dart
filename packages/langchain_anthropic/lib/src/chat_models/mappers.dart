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
  // When ChatToolChoiceNone is used, omit both tools and tool_choice
  // to avoid sending tool_choice without a tools array.
  final toolChoiceDto = toolChoice is ChatToolChoiceNone
      ? null
      : toolChoice?.toToolChoice();
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
    if (i.mimeType == 'application/pdf') {
      if (imageData.startsWith('http')) {
        throw ArgumentError(
          'Anthropic does not support PDF URLs. '
          'Provide the PDF as base64-encoded data instead.',
        );
      }
      return a.InputContentBlock.document(
        a.DocumentSource.base64Pdf(imageData),
      );
    }
    if (imageData.startsWith('http')) {
      return a.InputContentBlock.image(a.ImageSource.url(imageData));
    }
    if (i.mimeType == null) {
      throw ArgumentError('mimeType is required for base64-encoded images');
    }
    return a.InputContentBlock.image(
      a.ImageSource.base64(
        data: imageData,
        mediaType: a.ImageMediaType.fromMimeType(i.mimeType!),
      ),
    );
  }

  a.InputMessage _mapAIChatMessage(final AIChatMessage msg) {
    final blocks = msg.contentBlocks;
    if (blocks.length == 1 && blocks.single is AIChatMessageTextBlock) {
      return a.InputMessage.assistant(msg.content);
    }
    return a.InputMessage.assistantBlocks(
      blocks.map(_mapAIContentBlock).toList(growable: false),
    );
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
    final blocks = [
      for (final (index, block) in content.indexed)
        _mapContentBlock(block, messageId: id, index: index),
    ];
    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: blocks,
        legacyContent: '$thinking$text',
      ),
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
  final Map<int, String> toolCallIdsByIndex = {};

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
      output: AIChatMessage.withBlocks(
        contentBlocks: [
          for (final (index, block) in msg.content.indexed)
            _mapContentBlock(block, messageId: msg.id, index: index),
        ],
        legacyContent: '${msg.thinking}${msg.text}',
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
      output: const AIChatMessage.withBlocks(contentBlocks: []),
      finishReason: _mapFinishReason(e.delta.stopReason),
      metadata: {
        if (e.delta.stopSequence != null) 'stop_sequence': e.delta.stopSequence,
      },
      usage: _mapMessageDeltaUsage(e.usage),
      streaming: true,
    );
  }

  ChatResult _mapContentBlockStartEvent(final a.ContentBlockStartEvent e) {
    final block = _mapContentBlock(
      e.contentBlock,
      messageId: lastMessageId ?? '',
      index: e.index,
    );
    if (block case final AIChatMessageToolCall toolCall) {
      toolCallIdsByIndex[e.index] = toolCall.id;
    }

    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage.withBlocks(
        contentBlocks: [block],
        legacyContent: block.legacyContent,
      ),
      finishReason: FinishReason.unspecified,
      metadata: const {},
      usage: const LanguageModelUsage(),
      streaming: true,
    );
  }

  ChatResult _mapContentBlockDeltaEvent(final a.ContentBlockDeltaEvent e) {
    final block = _mapContentBlockDelta(
      e.delta,
      messageId: lastMessageId ?? '',
      index: e.index,
      toolCallId: toolCallIdsByIndex[e.index],
    );
    return ChatResult(
      id: lastMessageId ?? '',
      output: AIChatMessage.withBlocks(
        contentBlocks: [block],
        legacyContent: block.legacyContent,
      ),
      finishReason: FinishReason.unspecified,
      metadata: {'index': e.index},
      usage: const LanguageModelUsage(),
      streaming: true,
    );
  }

  ChatResult? _mapContentBlockStopEvent(final a.ContentBlockStopEvent e) {
    toolCallIdsByIndex.remove(e.index);
    return null;
  }

  ChatResult? _mapMessageStopEvent(final a.MessageStopEvent e) {
    lastMessageId = null;
    toolCallIdsByIndex.clear();
    return null;
  }
}

a.InputContentBlock _mapAIContentBlock(final AIChatMessageContentBlock block) {
  final rawBlock = switch (block.providerData['anthropic']) {
    {'contentBlock': final Map<Object?, Object?> value} =>
      value.cast<String, dynamic>(),
    _ => null,
  };
  return switch (block) {
    final AIChatMessageTextBlock text => a.InputContentBlock.fromJson({
      ...?rawBlock,
      'type': 'text',
      'text': text.text,
    }),
    final AIChatMessageReasoningBlock reasoning => _mapAnthropicReasoningBlock(
      reasoning,
      rawBlock,
    ),
    final AIChatMessageToolCall toolCall => a.InputContentBlock.fromJson({
      ...?rawBlock,
      'type': 'tool_use',
      'id': toolCall.id,
      'name': toolCall.name,
      'input': toolCall.arguments,
    }),
    AIChatMessageMediaBlock() ||
    AIChatMessageFileBlock() ||
    AIChatMessageServerToolCall() ||
    AIChatMessageServerToolResult() ||
    AIChatMessageProviderMetadataBlock() => _rawAnthropicInputBlock(
      block,
      rawBlock,
    ),
    final AIChatMessageNonStandardBlock nonStandard =>
      rawBlock != null
          ? a.InputContentBlock.fromJson(rawBlock)
          : switch (nonStandard.value) {
              final Map<Object?, Object?> value => a.InputContentBlock.fromJson(
                value.cast<String, dynamic>(),
              ),
              _ => throw UnsupportedError(
                'Cannot replay ${nonStandard.value.runtimeType} to Anthropic',
              ),
            },
  };
}

a.InputContentBlock _mapAnthropicReasoningBlock(
  final AIChatMessageReasoningBlock block,
  final Map<String, dynamic>? rawBlock,
) {
  if (rawBlock?['type'] == 'redacted_thinking') {
    return a.InputContentBlock.fromJson(rawBlock!);
  }
  return a.InputContentBlock.fromJson({
    ...?rawBlock,
    'type': rawBlock?['type'] ?? 'thinking',
    'thinking': block.reasoning,
    if (_anthropicSignature(block) case final String signature)
      'signature': signature,
  });
}

a.InputContentBlock _rawAnthropicInputBlock(
  final AIChatMessageContentBlock block,
  final Map<String, dynamic>? rawBlock,
) {
  if (rawBlock == null) {
    throw UnsupportedError(
      '${block.runtimeType} can only be replayed to Anthropic when it contains '
      'providerData["anthropic"]["contentBlock"]',
    );
  }
  return a.InputContentBlock.fromJson(rawBlock);
}

AIChatMessageContentBlock _mapContentBlock(
  final a.ContentBlock contentBlock, {
  required final String messageId,
  required final int index,
}) {
  final rawBlock = contentBlock.toJson();
  final fallbackId = 'anthropic:$messageId:$index';
  final providerData = <String, dynamic>{
    'anthropic': {
      'contentBlock': rawBlock,
      if (contentBlock case final a.ThinkingBlock thinking)
        'signature': thinking.signature,
    },
  };
  return switch (contentBlock) {
    final a.TextBlock text => AIChatMessageTextBlock(
      text: text.text,
      id: fallbackId,
      index: index,
      providerData: providerData,
    ),
    final a.ThinkingBlock thinking => AIChatMessageReasoningBlock(
      reasoning: thinking.thinking,
      id: fallbackId,
      index: index,
      providerData: providerData,
    ),
    a.RedactedThinkingBlock() => AIChatMessageReasoningBlock(
      reasoning: '',
      id: fallbackId,
      index: index,
      providerData: providerData,
    ),
    final a.ToolUseBlock toolUse => AIChatMessageToolCall(
      id: toolUse.id,
      index: index,
      name: toolUse.name,
      argumentsRaw: toolUse.input.isNotEmpty ? json.encode(toolUse.input) : '',
      arguments: toolUse.input,
      providerData: providerData,
    ),
    _ => _mapNonClientAnthropicBlock(
      rawBlock,
      fallbackId: fallbackId,
      index: index,
      providerData: providerData,
    ),
  };
}

AIChatMessageContentBlock _mapNonClientAnthropicBlock(
  final Map<String, dynamic> rawBlock, {
  required final String fallbackId,
  required final int index,
  required final Map<String, dynamic> providerData,
}) {
  final type = rawBlock['type'] as String? ?? '';
  if (type.endsWith('tool_use')) {
    final input = switch (rawBlock['input']) {
      final Map<Object?, Object?> value => value.cast<String, dynamic>(),
      _ => const <String, dynamic>{},
    };
    return AIChatMessageServerToolCall(
      id: rawBlock['id'] as String? ?? fallbackId,
      index: index,
      name: rawBlock['name'] as String? ?? type,
      argumentsRaw: input.isNotEmpty ? json.encode(input) : '',
      arguments: input,
      providerData: providerData,
    );
  }
  if (type.endsWith('tool_result')) {
    final toolCallId = rawBlock['tool_use_id'] as String? ?? fallbackId;
    return AIChatMessageServerToolResult(
      id: toolCallId,
      index: index,
      toolCallId: toolCallId,
      result: rawBlock['content'],
      providerData: providerData,
    );
  }
  return AIChatMessageNonStandardBlock(
    value: rawBlock,
    id: fallbackId,
    index: index,
    providerData: providerData,
  );
}

AIChatMessageContentBlock _mapContentBlockDelta(
  final a.ContentBlockDelta blockDelta, {
  required final String messageId,
  required final int index,
  required final String? toolCallId,
}) {
  final fallbackId = 'anthropic:$messageId:$index';
  return switch (blockDelta) {
    final a.TextDelta text => AIChatMessageTextBlock(
      text: text.text,
      id: fallbackId,
      index: index,
      providerData: {
        'anthropic': {'delta': text.toJson()},
      },
    ),
    final a.InputJsonDelta jsonDelta => AIChatMessageToolCall(
      id: toolCallId ?? fallbackId,
      index: index,
      name: '',
      argumentsRaw: jsonDelta.partialJson,
      arguments: const {},
      providerData: {
        'anthropic': {'delta': jsonDelta.toJson()},
      },
    ),
    final a.ThinkingDelta thinking => AIChatMessageReasoningBlock(
      reasoning: thinking.thinking,
      id: fallbackId,
      index: index,
      providerData: {
        'anthropic': {'delta': thinking.toJson()},
      },
    ),
    final a.SignatureDelta signature => AIChatMessageReasoningBlock(
      reasoning: '',
      id: fallbackId,
      index: index,
      providerData: {
        'anthropic': {
          'delta': signature.toJson(),
          'signature': signature.signature,
        },
      },
    ),
    final a.CitationsDelta citations => AIChatMessageTextBlock(
      text: '',
      id: fallbackId,
      index: index,
      providerData: {
        'anthropic': {'delta': citations.toJson()},
      },
    ),
    final a.ContentBlockDelta unknown => AIChatMessageNonStandardBlock(
      value: unknown.toJson(),
      id: fallbackId,
      index: index,
      providerData: {
        'anthropic': {'delta': unknown.toJson()},
      },
    ),
  };
}

String? _anthropicSignature(final AIChatMessageContentBlock block) =>
    switch (block.providerData['anthropic']) {
      {'signature': final String signature} => signature,
      _ => null,
    };

extension ToolSpecListMapper on List<ToolSpec> {
  /// Converts tool specs to typed ToolDefinition list for the request.
  List<a.ToolDefinition>? toToolDefinitions(final ChatToolChoice? toolChoice) {
    if (toolChoice is ChatToolChoiceNone) {
      return null;
    }

    if (toolChoice is ChatToolChoiceForced) {
      final tool = firstWhereOrNull((final t) => t.name == toolChoice.name);
      if (tool == null) {
        throw ArgumentError(
          'Forced tool "${toolChoice.name}" not found in the provided tools list',
        );
      }
      return [_mapTool(tool)];
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
      ChatToolChoiceNone() => throw StateError(
        'ChatToolChoiceNone should be handled before calling toToolChoice()',
      ),
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
