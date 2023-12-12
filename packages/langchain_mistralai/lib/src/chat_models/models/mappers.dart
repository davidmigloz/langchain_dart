import 'package:langchain/langchain.dart';
import 'package:mistralai_dart/mistralai_dart.dart';

/// Mapper for a list of [ChatMessage]s.
extension ChatMessageListMapper on List<ChatMessage> {
  /// Converts a list of [ChatMessage]s to a list of [ChatCompletionMessage]s.
  List<ChatCompletionMessage> toChatCompletionMessages() {
    return map((final message) => message.toChatCompletionMessage())
        .toList(growable: false);
  }
}

extension _ChatMessageMapper on ChatMessage {
  ChatCompletionMessage toChatCompletionMessage() {
    return switch (this) {
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
      FunctionChatMessage() =>
        throw UnsupportedError('Mistral AI does not support function calls'),
      CustomChatMessage() =>
        throw UnsupportedError('Mistral AI does not support custom messages'),
    };
  }
}

/// Mapper for [ChatCompletionResponse].
extension ChatResultMapper on ChatCompletionResponse {
  /// Converts a [ChatCompletionResponse] to a [ChatResult].
  ChatResult toChatResult({final bool streaming = false}) {
    return ChatResult(
      generations: _toChatGenerations(),
      usage: _toLanguageModelUsage(),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
      streaming: streaming,
    );
  }

  List<ChatGeneration> _toChatGenerations() {
    return choices
        .map(
          (final choice) => ChatGeneration(
            AIChatMessage(content: choice.message?.content ?? ''),
            generationInfo: {
              'index': choice.index,
              'finish_reason': choice.finishReason,
            },
          ),
        )
        .toList(growable: false);
  }

  LanguageModelUsage _toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: usage.promptTokens,
      responseTokens: usage.completionTokens,
      totalTokens: usage.totalTokens,
    );
  }
}

/// Mapper for [ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on ChatCompletionStreamResponse {
  /// Converts a [ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult() {
    return ChatResult(
      generations: _toChatGenerations(),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
      streaming: true,
    );
  }

  List<ChatGeneration> _toChatGenerations() {
    return choices
        .map(
          (final choice) => ChatGeneration(
            AIChatMessage(content: choice.delta.content ?? ''),
            generationInfo: {
              'index': choice.index,
              'finish_reason': choice.finishReason,
            },
          ),
        )
        .toList(growable: false);
  }
}
