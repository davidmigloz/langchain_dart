import 'package:langchain/langchain.dart';

import '../client/models/models.dart';

extension ChatMessageMapper on ChatMessage {
  OpenAIChatCompletionMessage toOpenAIChatMessage() {
    return switch (this) {
      final SystemChatMessage systemChatMessage => OpenAIChatCompletionMessage(
          role: OpenAIChatMessageRole.system,
          content: systemChatMessage.content,
        ),
      final HumanChatMessage humanChatMessage => OpenAIChatCompletionMessage(
          role: OpenAIChatMessageRole.user,
          content: humanChatMessage.content,
        ),
      final AIChatMessage aiChatMessage => OpenAIChatCompletionMessage(
          role: OpenAIChatMessageRole.assistant,
          content: aiChatMessage.content,
        ),
      _ => throw UnsupportedError('Unsupported ChatMessage type'),
    };
  }
}

extension OpenAIChatCompletionMapper on OpenAIChatCompletion {
  ChatResult toChatResult(final String model) {
    return ChatResult(
      generations: choices
          .map((final choice) => choice.toChatGeneration())
          .toList(growable: false),
      tokensUsage: usage.totalTokens,
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
    );
  }
}

extension _OpenAIChatCompletionChoiceMapper on OpenAIChatCompletionChoice {
  ChatGeneration toChatGeneration() {
    return ChatGeneration(
      message.toChatMessage(),
      generationInfo: {
        'index': index,
        'finish_reason': finishReason,
      },
    );
  }
}

extension _OpenAIChatCompletionMessageMapper on OpenAIChatCompletionMessage {
  ChatMessage toChatMessage() {
    return switch (role) {
      OpenAIChatMessageRole.system => ChatMessage.system(content),
      OpenAIChatMessageRole.user => ChatMessage.human(content),
      OpenAIChatMessageRole.assistant => ChatMessage.ai(content),
    };
  }
}
