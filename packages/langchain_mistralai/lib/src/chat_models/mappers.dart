// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:mistralai_dart/mistralai_dart.dart' as mistral;

extension ChatMessageListMapper on List<ChatMessage> {
  List<mistral.ChatMessage> toChatMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  mistral.ChatMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => mistral.ChatMessage.system(msg.content),
      final HumanChatMessage msg => mistral.ChatMessage.user(
        msg.contentAsString,
      ),
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => mistral.ChatMessage.tool(
        toolCallId: msg.toolCallId,
        content: msg.content,
        name: null,
      ),
      CustomChatMessage() => throw UnsupportedError(
        'Mistral AI does not support custom messages',
      ),
    };
  }

  mistral.AssistantMessage _mapAIMessage(final AIChatMessage msg) {
    final nativeParts = msg.contentBlocks
        .where((block) => block is! AIChatMessageToolCall)
        .map(_mapContentBlock)
        .nonNulls
        .toList(growable: false);
    final hasNativePartData = msg.contentBlocks.any(
      (block) => _nativeContentPart(block) != null,
    );
    final hasStructuredContent = msg.contentBlocks.any(
      (block) =>
          block is! AIChatMessageTextBlock && block is! AIChatMessageToolCall,
    );
    final content =
        nativeParts.isNotEmpty && (hasNativePartData || hasStructuredContent)
        ? mistral.MessageContent.parts(nativeParts)
        : msg.content.isNotEmpty
        ? mistral.MessageContent.text(msg.content)
        : null;
    return mistral.AssistantMessage(
      content: content,
      toolCalls: msg.toolCalls.isNotEmpty
          ? msg.toolCalls.map(_mapToolCall).toList(growable: false)
          : null,
    );
  }

  mistral.ContentPart? _mapContentBlock(final AIChatMessageContentBlock block) {
    final native = _nativeContentPart(block);
    if (native != null) return mistral.ContentPart.fromJson(native);
    return switch (block) {
      final AIChatMessageTextBlock block => mistral.TextContentPart(block.text),
      final AIChatMessageReasoningBlock block => mistral.ThinkContentPart(
        thinking: [mistral.TextContentPart(block.reasoning)],
        closed: true,
      ),
      final AIChatMessageNonStandardBlock block
          when block.value is Map<String, dynamic> =>
        mistral.UnknownContentPart(block.value! as Map<String, dynamic>),
      _ => null,
    };
  }

  mistral.ToolCall _mapToolCall(final AIChatMessageToolCall toolCall) {
    return mistral.ToolCall(
      id: toolCall.id,
      index: toolCall.index,
      function: mistral.FunctionCall(
        name: toolCall.name,
        arguments: toolCall.argumentsRaw.isNotEmpty
            ? toolCall.argumentsRaw
            : json.encode(toolCall.arguments),
      ),
    );
  }
}

extension ChatToolListMapper on List<ToolSpec> {
  List<mistral.Tool> toMistralTools() {
    return map(_mapTool).toList(growable: false);
  }

  mistral.Tool _mapTool(final ToolSpec tool) {
    return mistral.Tool.function(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  mistral.ToolChoice toMistralToolChoice() {
    return switch (this) {
      ChatToolChoiceNone() => mistral.ToolChoice.none,
      ChatToolChoiceAuto() => mistral.ToolChoice.auto,
      ChatToolChoiceRequired() => mistral.ToolChoice.any,
      final ChatToolChoiceForced t => mistral.ToolChoice.function(t.name),
    };
  }
}

extension ChatResultMapper on mistral.ChatCompletionResponse {
  ChatResult toChatResult({final bool streaming = false}) {
    final choice = firstChoice;
    final message = choice?.message;
    final contentBlocks = <AIChatMessageContentBlock>[
      ..._mapMessageContent(
        message?.content,
        responseId: id,
        choiceIndex: choice?.index ?? 0,
      ),
      for (final (fallbackIndex, toolCall)
          in (message?.toolCalls ?? const <mistral.ToolCall>[]).indexed)
        _mapMistralToolCall(
          toolCall,
          responseId: id,
          fallbackIndex: fallbackIndex,
        ),
      if (message == null)
        for (final (deltaIndex, delta)
            in (choice?.messages ?? const <mistral.DeltaContent>[]).indexed)
          ..._mapDeltaContent(
            delta,
            responseId: id,
            choiceIndex: choice?.index ?? 0,
            deltaIndex: deltaIndex,
          ),
    ];
    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: contentBlocks,
        legacyContent: _visibleText(contentBlocks),
      ),
      finishReason: _mapFinishReason(finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
      streaming: streaming,
    );
  }

  LanguageModelUsage _mapUsage(final mistral.UsageInfo? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

/// Mapper for [mistral.ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on mistral.ChatCompletionStreamResponse {
  /// Converts a [mistral.ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult() {
    final choice = firstChoice;
    final contentBlocks = choice == null
        ? const <AIChatMessageContentBlock>[]
        : _mapDeltaContent(
            choice.delta,
            responseId: id,
            choiceIndex: choice.index,
            deltaIndex: 0,
          );
    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: contentBlocks,
        legacyContent: choice?.delta.content ?? '',
      ),
      finishReason: _mapFinishReason(finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapStreamUsage(usage),
      streaming: true,
    );
  }

  LanguageModelUsage _mapStreamUsage(final mistral.UsageInfo? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

List<AIChatMessageContentBlock> _mapMessageContent(
  final mistral.MessageContent? content, {
  required final String responseId,
  required final int choiceIndex,
}) => switch (content) {
  final mistral.MessageTextContent content when content.text.isNotEmpty => [
    AIChatMessageTextBlock(
      text: content.text,
      id: 'mistral:$responseId:$choiceIndex:content:0',
      index: 0,
      providerData: {
        'mistral': {'messageContent': content.toJson()},
      },
    ),
  ],
  final mistral.MessagePartsContent content => [
    for (final (index, part) in content.parts.indexed)
      _mapMistralContentPart(
        part,
        responseId: responseId,
        choiceIndex: choiceIndex,
        index: index,
      ),
  ],
  _ => const [],
};

AIChatMessageContentBlock _mapMistralContentPart(
  final mistral.ContentPart part, {
  required final String responseId,
  required final int choiceIndex,
  required final int index,
}) {
  final id = 'mistral:$responseId:$choiceIndex:content:$index';
  final providerData = {
    'mistral': {'contentPart': part.toJson()},
  };
  return switch (part) {
    final mistral.TextContentPart part => AIChatMessageTextBlock(
      text: part.text,
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.ThinkContentPart part => AIChatMessageReasoningBlock(
      reasoning: _contentPartsText(part.thinking),
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.ImageUrlContentPart part => AIChatMessageMediaBlock(
      data: part.url,
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.AudioContentPart part => AIChatMessageMediaBlock(
      data: part.inputAudio,
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.DocumentUrlContentPart part => AIChatMessageFileBlock(
      uri: part.documentUrl,
      name: part.documentName,
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.FileContentPart part => AIChatMessageFileBlock(
      uri: part.fileId,
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.ToolFileContentPart part => AIChatMessageServerToolResult(
      toolCallId: '',
      name: part.tool,
      result: part.toJson(),
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.ToolReferenceContentPart part =>
      AIChatMessageServerToolResult(
        toolCallId: '',
        name: part.tool,
        result: part.toJson(),
        id: id,
        index: index,
        providerData: providerData,
      ),
    mistral.ReferenceContentPart() => AIChatMessageProviderMetadataBlock(
      id: id,
      index: index,
      providerData: providerData,
    ),
    final mistral.UnknownContentPart part => AIChatMessageNonStandardBlock(
      value: part.raw,
      id: id,
      index: index,
      providerData: providerData,
    ),
  };
}

List<AIChatMessageContentBlock> _mapDeltaContent(
  final mistral.DeltaContent delta, {
  required final String responseId,
  required final int choiceIndex,
  required final int deltaIndex,
}) {
  final raw = delta.toJson();
  final blocks = <AIChatMessageContentBlock>[
    if ((delta.content ?? '').isNotEmpty)
      AIChatMessageTextBlock(
        text: delta.content!,
        id: 'mistral:$responseId:$choiceIndex:message:$deltaIndex:text',
        index: delta.index ?? deltaIndex,
        providerData: {
          'mistral': {'delta': raw},
        },
      ),
    for (final (fallbackIndex, toolCall)
        in (delta.toolCalls ?? const <mistral.ToolCall>[]).indexed)
      _mapMistralToolCall(
        toolCall,
        responseId: responseId,
        fallbackIndex: fallbackIndex,
        useFallbackId: false,
      ),
  ];
  if (blocks.isEmpty && raw.isNotEmpty) {
    blocks.add(
      AIChatMessageProviderMetadataBlock(
        id: 'mistral:$responseId:$choiceIndex:message:$deltaIndex:metadata',
        index: delta.index ?? deltaIndex,
        providerData: {
          'mistral': {'delta': raw},
        },
      ),
    );
  }
  return blocks;
}

AIChatMessageToolCall _mapMistralToolCall(
  final mistral.ToolCall toolCall, {
  required final String responseId,
  required final int fallbackIndex,
  final bool useFallbackId = true,
}) {
  final function = toolCall.function;
  final index = toolCall.index ?? fallbackIndex;
  var args = <String, dynamic>{};
  try {
    final arguments = function.arguments;
    if (arguments.isNotEmpty) {
      args = (json.decode(arguments) as Map).cast<String, dynamic>();
    }
  } catch (_) {}
  return AIChatMessageToolCall(
    // Continuation deltas commonly omit the provider ID. In streams the
    // explicit index is the correlation key until the opening ID is known.
    id: toolCall.id.isNotEmpty
        ? toolCall.id
        : useFallbackId
        ? 'mistral:$responseId:tool:$index'
        : '',
    index: index,
    name: function.name,
    argumentsRaw: function.arguments,
    arguments: args,
    providerData: {
      'mistral': {'toolCall': toolCall.toJson()},
    },
  );
}

Map<String, dynamic>? _nativeContentPart(
  final AIChatMessageContentBlock block,
) {
  final mistralData = block.providerData['mistral'];
  if (mistralData is! Map) return null;
  final contentPart = mistralData['contentPart'];
  return contentPart is Map ? contentPart.cast<String, dynamic>() : null;
}

String _contentPartsText(final List<mistral.ContentPart> parts) => parts
    .map(
      (part) => switch (part) {
        final mistral.TextContentPart part => part.text,
        final mistral.ThinkContentPart part => _contentPartsText(part.thinking),
        _ => '',
      },
    )
    .join();

String _visibleText(final List<AIChatMessageContentBlock> blocks) => blocks
    .whereType<AIChatMessageTextBlock>()
    .map((block) => block.text)
    .join();

FinishReason _mapFinishReason(final mistral.FinishReason? reason) =>
    switch (reason) {
      mistral.FinishReason.stop => FinishReason.stop,
      mistral.FinishReason.length => FinishReason.length,
      mistral.FinishReason.modelLength => FinishReason.length,
      mistral.FinishReason.error => FinishReason.unspecified,
      mistral.FinishReason.toolCalls => FinishReason.toolCalls,
      mistral.FinishReason.unknown => FinishReason.unspecified,
      null => FinishReason.unspecified,
    };
