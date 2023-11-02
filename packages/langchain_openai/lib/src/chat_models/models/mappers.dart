import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

extension ChatMessageListMapper on List<ChatMessage> {
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
          content: humanChatMessage.content,
        ),
      final AIChatMessage aiChatMessage => ChatCompletionMessage(
          role: ChatCompletionMessageRole.assistant,
          functionCall:
              aiChatMessage.functionCall?.toChatCompletionMessageFunctionCall(),
          content: aiChatMessage.content,
        ),
      final FunctionChatMessage functionChatMessage => ChatCompletionMessage(
          role: ChatCompletionMessageRole.function,
          name: functionChatMessage.name,
          content: functionChatMessage.content,
        ),
      _ => throw UnsupportedError('Unsupported ChatMessage type'),
    };
  }
}

extension CreateChatCompletionResponseMapper on CreateChatCompletionResponse {
  ChatResult toChatResult(final String model) {
    return ChatResult(
      generations: choices
          .map((final choice) => choice.toChatGeneration())
          .toList(growable: false),
      usage: usage?.toLanguageModelUsage(),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
      },
    );
  }
}

extension _ChatCompletionResponseChoiceMapper on ChatCompletionResponseChoice {
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

extension _CompletionUsageMapper on CompletionUsage {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: promptTokens,
      responseTokens: completionTokens,
      totalTokens: totalTokens,
    );
  }
}

extension _ChatCompletionMessageMapper on ChatCompletionMessage {
  ChatMessage toChatMessage() {
    return switch (role) {
      ChatCompletionMessageRole.system => ChatMessage.system(content ?? ''),
      ChatCompletionMessageRole.user => ChatMessage.human(content ?? ''),
      ChatCompletionMessageRole.assistant => ChatMessage.ai(
          content ?? '',
          functionCall: functionCall?.toChatCompletionMessageFunctionCall(),
        ),
      ChatCompletionMessageRole.function => ChatMessage.function(
          name: name ?? '',
          content: content ?? '',
        ),
    };
  }
}

extension _ChatCompletionMessageFunctionCallMapper
    on ChatCompletionMessageFunctionCall {
  AIChatMessageFunctionCall toChatCompletionMessageFunctionCall() {
    return AIChatMessageFunctionCall(
      name: name,
      arguments: json.decode(arguments),
    );
  }
}

extension _AIChatMessageFunctionCallMapper on AIChatMessageFunctionCall {
  ChatCompletionMessageFunctionCall toChatCompletionMessageFunctionCall() {
    return ChatCompletionMessageFunctionCall(
      name: name,
      arguments: json.encode(arguments),
    );
  }
}

extension ChatFunctionListMapper on List<ChatFunction> {
  List<ChatCompletionFunction> toChatCompletionFunctions() {
    return map((final function) => function.toChatCompletionFunction())
        .toList(growable: false);
  }
}

extension _ChatFunctionMapper on ChatFunction {
  ChatCompletionFunction toChatCompletionFunction() {
    return ChatCompletionFunction(
      name: name,
      description: description,
      parameters: parameters ?? {},
    );
  }
}

extension ChatFunctionCallMapper on ChatFunctionCall {
  ChatCompletionFunctionCall toChatCompletionFunctionCall() {
    return switch (this) {
      ChatFunctionCallNone _ => const ChatCompletionFunctionCall.enumeration(
          ChatCompletionFunctionCallMode.none,
        ),
      ChatFunctionCallAuto _ => const ChatCompletionFunctionCall.enumeration(
          ChatCompletionFunctionCallMode.auto,
        ),
      final ChatFunctionCallForced f =>
        ChatCompletionFunctionCall.chatCompletionFunctionCallOption(
          ChatCompletionFunctionCallOption(name: f.functionName),
        )
    };
  }
}
