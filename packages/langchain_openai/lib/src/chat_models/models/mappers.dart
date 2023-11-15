import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:openai_dart/openai_dart.dart';

import 'models.dart';

extension ChatMessageListMapper on List<ChatMessage> {
  List<ChatCompletionMessage> toChatCompletionMessages() {
    return map((final message) => message.toChatCompletionMessage())
        .toList(growable: false);
  }
}

extension _ChatMessageMapper on ChatMessage {
  ChatCompletionMessage toChatCompletionMessage() {
    return switch (this) {
      final SystemChatMessage systemChatMessage => ChatCompletionMessage.system(
          content: systemChatMessage.content,
        ),
      final HumanChatMessage humanChatMessage => ChatCompletionMessage.user(
          content: switch (humanChatMessage.content) {
            final ChatMessageContentText c =>
              c.toChatCompletionUserMessageContentString(),
            final ChatMessageContentImage c =>
              ChatCompletionUserMessageContent.parts(
                [c.toChatCompletionMessageContentPart()],
              ),
            final ChatMessageContentMultiModal c =>
              c.toChatCompletionMessageContentPart(),
          },
        ),
      final AIChatMessage aiChatMessage => ChatCompletionMessage.assistant(
          content: aiChatMessage.content, // TODO add tools support
          functionCall:
              aiChatMessage.functionCall?.toChatCompletionMessageFunctionCall(),
        ),
      final FunctionChatMessage functionChatMessage =>
        ChatCompletionMessage.function(
          name: functionChatMessage.name,
          content: functionChatMessage.content,
        ),
      _ => throw UnsupportedError('Unsupported ChatMessage type'),
    };
  }
}

extension _ChatMessageContentTextMapper on ChatMessageContentText {
  ChatCompletionUserMessageContentString
      toChatCompletionUserMessageContentString() {
    return ChatCompletionUserMessageContentString(text);
  }
}

extension _ChatMessageContentImageMapper on ChatMessageContentImage {
  ChatCompletionMessageContentPartImage toChatCompletionMessageContentPart() {
    return ChatCompletionMessageContentPartImage(
      imageUrl: ChatCompletionMessageImageUrl(
        url: url,
        detail: switch (detail) {
          ChatMessageContentImageDetail.auto =>
            ChatCompletionMessageImageDetail.auto,
          ChatMessageContentImageDetail.low =>
            ChatCompletionMessageImageDetail.low,
          ChatMessageContentImageDetail.high =>
            ChatCompletionMessageImageDetail.high,
        },
      ),
    );
  }
}

extension _ChatMessageContentMultiModalMapper on ChatMessageContentMultiModal {
  ChatCompletionMessageContentParts toChatCompletionMessageContentPart() {
    final partsList = parts
        .map(
          (final part) => switch (part) {
            final ChatMessageContentText c => [
                ChatCompletionMessageContentPartText(text: c.text),
              ],
            final ChatMessageContentImage c => [
                c.toChatCompletionMessageContentPart(),
              ],
            final ChatMessageContentMultiModal c =>
              c.toChatCompletionMessageContentPart().value,
          },
        )
        .expand((final parts) => parts)
        .toList(growable: false);
    return ChatCompletionMessageContentParts(partsList);
  }
}

extension CreateChatCompletionResponseMapper on CreateChatCompletionResponse {
  ChatResult toChatResult() {
    return ChatResult(
      id: id,
      generations: choices
          .map((final choice) => choice.toChatGeneration())
          .toList(growable: false),
      usage: usage?.toLanguageModelUsage(),
      modelOutput: {
        'created': created,
        'model': model,
        'system_fingerprint': systemFingerprint,
      },
    );
  }
}

extension _ChatCompletionResponseChoiceMapper on ChatCompletionResponseChoice {
  ChatGeneration toChatGeneration() {
    return ChatGeneration(
      AIChatMessage(
        content: message.content ?? '',
        functionCall: message.functionCall?.toAIChatMessageFunctionCall(),
      ),
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

extension _ChatCompletionMessageFunctionCallMapper
    on ChatCompletionMessageFunctionCall {
  AIChatMessageFunctionCall toAIChatMessageFunctionCall() {
    return AIChatMessageFunctionCall(
      name: name,
      argumentsRaw: arguments,
      arguments: arguments.isEmpty ? {} : json.decode(arguments),
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
  List<FunctionObject> toFunctionObjects() {
    return map((final function) => function.toFunctionObject())
        .toList(growable: false);
  }
}

extension _ChatFunctionMapper on ChatFunction {
  FunctionObject toFunctionObject() {
    return FunctionObject(
      name: name,
      description: description,
      parameters: parameters ?? {},
    );
  }
}

extension ChatFunctionCallMapper on ChatFunctionCall {
  ChatCompletionFunctionCall toChatCompletionFunctionCall() {
    return switch (this) {
      ChatFunctionCallNone _ => const ChatCompletionFunctionCall.mode(
          ChatCompletionFunctionCallMode.none,
        ),
      ChatFunctionCallAuto _ => const ChatCompletionFunctionCall.mode(
          ChatCompletionFunctionCallMode.auto,
        ),
      final ChatFunctionCallForced f => ChatCompletionFunctionCall.function(
          ChatCompletionFunctionCallOption(name: f.functionName),
        )
    };
  }
}

extension CreateChatCompletionStreamResponseMapper
    on CreateChatCompletionStreamResponse {
  ChatResult toChatResult() {
    return ChatResult(
      generations: choices
          .map((final choice) => choice.toChatGeneration())
          .toList(growable: false),
      modelOutput: {
        'id': id,
        'created': created,
        'model': model,
        'system_fingerprint': systemFingerprint,
      },
      streaming: true,
    );
  }
}

extension _ChatCompletionStreamResponseChoiceMapper
    on ChatCompletionStreamResponseChoice {
  ChatGeneration toChatGeneration() {
    return ChatGeneration(
      delta.toAIChatMessage(),
      generationInfo: {
        'index': index,
        'finish_reason': finishReason,
      },
    );
  }
}

extension _ChatCompletionStreamResponseDeltaMapper
    on ChatCompletionStreamResponseDelta {
  AIChatMessage toAIChatMessage() {
    return AIChatMessage(
      content: content ?? '',
      functionCall: functionCall?.toAIChatMessageFunctionCall(),
    );
  }
}

extension _ChatCompletionStreamMessageFunctionCallMapper
    on ChatCompletionStreamMessageFunctionCall {
  AIChatMessageFunctionCall toAIChatMessageFunctionCall() {
    Map<String, dynamic> args = {};
    try {
      args = json.decode(arguments ?? '');
    } catch (_) {}
    return AIChatMessageFunctionCall(
      name: name ?? '',
      argumentsRaw: arguments ?? '',
      arguments: args,
    );
  }
}

extension ChatOpenAIResponseFormatMapper on ChatOpenAIResponseFormat {
  ChatCompletionResponseFormat toChatCompletionResponseFormat() {
    return ChatCompletionResponseFormat(
      type: switch (type) {
        ChatOpenAIResponseFormatType.text =>
          ChatCompletionResponseFormatType.text,
        ChatOpenAIResponseFormatType.jsonObject =>
          ChatCompletionResponseFormatType.jsonObject,
      },
    );
  }
}
