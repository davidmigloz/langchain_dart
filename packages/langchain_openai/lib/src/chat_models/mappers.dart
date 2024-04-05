// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:openai_dart/openai_dart.dart';

import 'types.dart';

extension ChatMessageListMapper on List<ChatMessage> {
  List<ChatCompletionMessage> toChatCompletionMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  ChatCompletionMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage systemChatMessage => ChatCompletionMessage.system(
          content: systemChatMessage.content,
        ),
      final HumanChatMessage humanChatMessage => ChatCompletionMessage.user(
          content: switch (humanChatMessage.content) {
            final ChatMessageContentText c => _mapMessageContentString(c),
            final ChatMessageContentImage c =>
              ChatCompletionUserMessageContent.parts(
                [_mapMessageContentPartImage(c)],
              ),
            final ChatMessageContentMultiModal c => _mapMessageContentPart(c),
          },
        ),
      final AIChatMessage aiChatMessage => ChatCompletionMessage.assistant(
          content: aiChatMessage.content, // TODO add tools support
          functionCall: _mapMessageFunctionCall(aiChatMessage.functionCall),
        ),
      final FunctionChatMessage functionChatMessage =>
        ChatCompletionMessage.function(
          name: functionChatMessage.name,
          content: functionChatMessage.content,
        ),
      CustomChatMessage() =>
        throw UnsupportedError('OpenAI does not support custom messages'),
    };
  }

  ChatCompletionUserMessageContentString _mapMessageContentString(
    final ChatMessageContentText c,
  ) {
    return ChatCompletionUserMessageContentString(c.text);
  }

  ChatCompletionMessageContentPartImage _mapMessageContentPartImage(
    final ChatMessageContentImage c,
  ) {
    final imageData = c.data.trim();
    final isUrl = imageData.startsWith('http');
    String url;
    if (isUrl) {
      url = imageData;
    } else {
      if (c.mimeType == null) {
        throw ArgumentError(
          "When passing a Base64 encoded image, you need to specify the mimeType (e.g. 'image/png')",
          'ChatMessageContentImage.mimeType',
        );
      }
      url = 'data:${c.mimeType};base64,$imageData';
    }

    return ChatCompletionMessageContentPartImage(
      imageUrl: ChatCompletionMessageImageUrl(
        url: url,
        detail: switch (c.detail) {
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

  ChatCompletionMessageContentParts _mapMessageContentPart(
    final ChatMessageContentMultiModal c,
  ) {
    final partsList = c.parts
        .map(
          (final part) => switch (part) {
            final ChatMessageContentText c => [
                ChatCompletionMessageContentPartText(text: c.text),
              ],
            final ChatMessageContentImage img => [
                _mapMessageContentPartImage(img),
              ],
            final ChatMessageContentMultiModal c =>
              _mapMessageContentPart(c).value,
          },
        )
        .expand((final parts) => parts)
        .toList(growable: false);
    return ChatCompletionMessageContentParts(partsList);
  }

  ChatCompletionMessageFunctionCall? _mapMessageFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) {
    if (functionCall == null) {
      return null;
    }
    return ChatCompletionMessageFunctionCall(
      name: functionCall.name,
      arguments: json.encode(functionCall.arguments),
    );
  }
}

extension CreateChatCompletionResponseMapper on CreateChatCompletionResponse {
  ChatResult toChatResult(final String id) {
    final choice = choices.first;
    final msg = choice.message;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: msg.content ?? '',
        functionCall: _mapMessageFunctionCall(msg.functionCall),
      ),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {
        'model': model,
        'created': created,
        'system_fingerprint': systemFingerprint,
      },
      usage: _mapUsage(usage),
    );
  }

  AIChatMessageFunctionCall? _mapMessageFunctionCall(
    final ChatCompletionMessageFunctionCall? functionCall,
  ) {
    if (functionCall == null) {
      return null;
    }
    return AIChatMessageFunctionCall(
      name: functionCall.name,
      argumentsRaw: functionCall.arguments,
      arguments: functionCall.arguments.isEmpty
          ? {}
          : json.decode(functionCall.arguments),
    );
  }

  LanguageModelUsage _mapUsage(final CompletionUsage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

extension ChatFunctionListMapper on List<ChatFunction> {
  List<FunctionObject> toFunctionObjects() {
    return map(_mapFunctionObject).toList(growable: false);
  }

  FunctionObject _mapFunctionObject(final ChatFunction func) {
    return FunctionObject(
      name: func.name,
      description: func.description,
      parameters: func.parameters ?? {},
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
  ChatResult toChatResult(final String id) {
    final choice = choices.first;
    final delta = choice.delta;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: delta.content ?? '',
        functionCall: _mapMessageFunctionCall(delta.functionCall),
      ),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {
        'model': model,
        'created': created,
        'system_fingerprint': systemFingerprint,
      },
      usage: const LanguageModelUsage(),
      streaming: true,
    );
  }

  AIChatMessageFunctionCall? _mapMessageFunctionCall(
    final ChatCompletionStreamMessageFunctionCall? functionCall,
  ) {
    if (functionCall == null) {
      return null;
    }
    Map<String, dynamic> args = {};
    try {
      args = json.decode(functionCall.arguments ?? '');
    } catch (_) {}
    return AIChatMessageFunctionCall(
      name: functionCall.name ?? '',
      argumentsRaw: functionCall.arguments ?? '',
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

FinishReason _mapFinishReason(
  final ChatCompletionFinishReason? reason,
) =>
    switch (reason) {
      ChatCompletionFinishReason.stop => FinishReason.stop,
      ChatCompletionFinishReason.length => FinishReason.length,
      ChatCompletionFinishReason.toolCalls => FinishReason.toolCalls,
      ChatCompletionFinishReason.contentFilter => FinishReason.contentFilter,
      ChatCompletionFinishReason.functionCall => FinishReason.toolCalls,
      null => FinishReason.unspecified,
    };
