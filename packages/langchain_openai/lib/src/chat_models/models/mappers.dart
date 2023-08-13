import 'package:langchain/langchain.dart';

import '../../client/models/models.dart';

/// Mapper for [ChatMessage] to [OpenAIChatCompletionMessage].
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
          functionCall: aiChatMessage.functionCall?.toFunctionCallResponse(),
          content: aiChatMessage.content,
        ),
      final FunctionChatMessage functionChatMessage =>
        OpenAIChatCompletionMessage(
          role: OpenAIChatMessageRole.function,
          functionName: functionChatMessage.name,
          content: functionChatMessage.content,
        ),
      _ => throw UnsupportedError('Unsupported ChatMessage type'),
    };
  }
}

/// Mapper for [ChatGeneration] to [OpenAIChatCompletionChoice].
extension OpenAIChatCompletionMapper on OpenAIChatCompletion {
  ChatResult toChatResult(final String model) {
    return ChatResult(
      generations: choices
          .map((final choice) => choice.toChatGeneration())
          .toList(growable: false),
      usage: usage.toLanguageModelUsage(),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
    );
  }
}

/// Mapper for [OpenAIChatCompletionChoice] to [ChatGeneration].
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

/// Mapper for [OpenAIChatCompletionUsage] to [LanguageModelUsage].
extension _OpenAIChatCompletionUsageMapper on OpenAIChatCompletionUsage {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptTokens,
      responseTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}

/// Mapper for [OpenAIChatCompletionMessage] to [ChatMessage].
extension _OpenAIChatCompletionMessageMapper on OpenAIChatCompletionMessage {
  ChatMessage toChatMessage() {
    return switch (role) {
      OpenAIChatMessageRole.system => ChatMessage.system(content),
      OpenAIChatMessageRole.user => ChatMessage.human(content),
      OpenAIChatMessageRole.assistant => ChatMessage.ai(
          content,
          functionCall: functionCall?.toChatFunctionCall(),
        ),
      OpenAIChatMessageRole.function => ChatMessage.function(
          name: functionName ?? '',
          content: content,
        ),
    };
  }
}

/// Mapper for [OpenAIFunctionCallResponse] to [AIChatMessageFunctionCall].
extension _OpenAIFunctionCallResponseMapper on OpenAIFunctionCallResponse {
  AIChatMessageFunctionCall toChatFunctionCall() {
    return AIChatMessageFunctionCall(
      name: name,
      arguments: arguments,
    );
  }
}

extension _AIChatMessageFunctionCallMapper on AIChatMessageFunctionCall {
  OpenAIFunctionCallResponse toFunctionCallResponse() {
    return OpenAIFunctionCallResponse(
      name: name,
      arguments: arguments,
    );
  }
}

/// Mapper for [ChatFunction] to [OpenAIFunction].
extension ChatFunctionMapper on ChatFunction {
  OpenAIFunction toOpenAIFunction() {
    return OpenAIFunction(
      name: name,
      description: description,
      parametersSchema: parameters ?? const {},
    );
  }
}

extension ChatFunctionCallMapper on ChatFunctionCall {
  OpenAIFunctionCall toOpenAIFunctionCall() {
    return switch (this) {
      ChatFunctionCallNone _ => OpenAIFunctionCall.none,
      ChatFunctionCallAuto _ => OpenAIFunctionCall.auto,
      final ChatFunctionCallForced f =>
        OpenAIFunctionCall.forFunction(f.functionName),
    };
  }
}
