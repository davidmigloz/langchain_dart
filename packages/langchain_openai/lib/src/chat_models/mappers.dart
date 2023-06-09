import 'package:langchain/langchain.dart';

import '../client/models/models.dart';

extension ChatMessageMapper on ChatMessage {
  OpenAIChatCompletionMessage toOpenAIChatMessage() {
    return OpenAIChatCompletionMessage(
      role: role.toOpenAIChatMessageRole(),
      content: content,
    );
  }
}

extension _ChatMessageRoleMapper on ChatMessageRole {
  OpenAIChatMessageRole toOpenAIChatMessageRole() => switch (this) {
        ChatMessageRole.human => OpenAIChatMessageRole.user,
        ChatMessageRole.ai => OpenAIChatMessageRole.assistant,
        ChatMessageRole.system => OpenAIChatMessageRole.system,
      };
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
    return ChatMessage(
      role: role.toChatMessageRole(),
      content: content,
    );
  }
}

extension _OpenAIChatMessageRoleMapper on OpenAIChatMessageRole {
  ChatMessageRole toChatMessageRole() => switch (this) {
        OpenAIChatMessageRole.user => ChatMessageRole.human,
        OpenAIChatMessageRole.assistant => ChatMessageRole.ai,
        OpenAIChatMessageRole.system => ChatMessageRole.system,
      };
}
