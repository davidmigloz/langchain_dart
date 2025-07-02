import 'package:mistralai_dart/mistralai_dart.dart';

import '../../language_models/types.dart';
import '../types.dart';

/// Extension on [List<ChatMessage>] to convert chat messages to Mistral SDK
/// messages.
extension ChatMessageListMapper on List<ChatMessage> {
  /// Converts this list of [ChatMessage]s to a list of Mistral SDK
  /// [ChatCompletionMessage]s.
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

/// Extension on [ChatCompletionResponse] to convert to [ChatResult].
extension ChatResultMapper on ChatCompletionResponse {
  /// Converts this [ChatCompletionResponse] to a [ChatResult].
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
