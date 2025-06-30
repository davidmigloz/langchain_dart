// ignore_for_file: public_member_api_docs
import 'package:mistralai_dart/mistralai_dart.dart';

import '../../../chat_models.dart';
import '../../../language_models.dart';

extension ChatMessageListMapper on List<ChatMessage> {
  List<ChatCompletionMessage> toChatCompletionMessages() =>
      map(_mapMessage).toList(growable: false);

  ChatCompletionMessage _mapMessage(ChatMessage msg) => switch (msg) {
    final SystemChatMessage systemChatMessage => ChatCompletionMessage(
      role: ChatCompletionMessageRole.system,
      content: systemChatMessage.content,
    ),
    final HumanChatMessage humanChatMessage => ChatCompletionMessage(
      role: ChatCompletionMessageRole.user,
      content: humanChatMessage.contentAsString,
    ),
    final AIChatMessage aiChatMessage => ChatCompletionMessage(
      role: ChatCompletionMessageRole.assistant,
      content: aiChatMessage.content,
    ),
    ToolChatMessage() => throw UnsupportedError(
      'Mistral AI does not support tool calls',
    ),
    CustomChatMessage() => throw UnsupportedError(
      'Mistral AI does not support custom messages',
    ),
  };
}

extension ChatResultMapper on ChatCompletionResponse {
  ChatResult toChatResult({bool streaming = false}) {
    final choice = choices.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(content: choice.message?.content ?? ''),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
      streaming: streaming,
    );
  }

  LanguageModelUsage _mapUsage(ChatCompletionUsage usage) => LanguageModelUsage(
    promptTokens: usage.promptTokens,
    responseTokens: usage.completionTokens,
    totalTokens: usage.totalTokens,
  );
}

/// Mapper for [ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on ChatCompletionStreamResponse {
  /// Converts a [ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult() {
    final choice = choices.first;
    return ChatResult(
      id: id,
      output: AIChatMessage(content: choice.delta.content ?? ''),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: const LanguageModelUsage(),
      streaming: true,
    );
  }
}

FinishReason _mapFinishReason(ChatCompletionFinishReason? reason) =>
    switch (reason) {
      ChatCompletionFinishReason.stop => FinishReason.stop,
      ChatCompletionFinishReason.length => FinishReason.length,
      ChatCompletionFinishReason.modelLength => FinishReason.length,
      null => FinishReason.unspecified,
    };
