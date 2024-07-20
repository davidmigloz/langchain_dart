// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
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
          content: aiChatMessage.content,
          toolCalls: aiChatMessage.toolCalls.isNotEmpty
              ? aiChatMessage.toolCalls
                  .map(_mapMessageToolCall)
                  .toList(growable: false)
              : null,
        ),
      final ToolChatMessage toolChatMessage => ChatCompletionMessage.tool(
          toolCallId: toolChatMessage.toolCallId,
          content: toolChatMessage.content,
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

  ChatCompletionMessageToolCall _mapMessageToolCall(
    final AIChatMessageToolCall toolCall,
  ) {
    return ChatCompletionMessageToolCall(
      id: toolCall.id,
      type: ChatCompletionMessageToolCallType.function,
      function: ChatCompletionMessageFunctionCall(
        name: toolCall.name,
        arguments: json.encode(toolCall.arguments),
      ),
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
        toolCalls:
            msg.toolCalls?.map(_mapMessageToolCall).toList(growable: false) ??
                const [],
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

  AIChatMessageToolCall _mapMessageToolCall(
    final ChatCompletionMessageToolCall tooCall,
  ) {
    Map<String, dynamic> args = {};
    try {
      args = tooCall.function.arguments.isEmpty
          ? {}
          : json.decode(tooCall.function.arguments);
    } catch (_) {}
    return AIChatMessageToolCall(
      id: tooCall.id,
      name: tooCall.function.name,
      argumentsRaw: tooCall.function.arguments,
      arguments: args,
    );
  }
}

LanguageModelUsage _mapUsage(final CompletionUsage? usage) {
  return LanguageModelUsage(
    promptTokens: usage?.promptTokens,
    responseTokens: usage?.completionTokens,
    totalTokens: usage?.totalTokens,
  );
}

extension ChatToolListMapper on List<ToolSpec> {
  List<ChatCompletionTool> toChatCompletionTool() {
    return map(_mapChatCompletionTool).toList(growable: false);
  }

  ChatCompletionTool _mapChatCompletionTool(final ToolSpec tool) {
    return ChatCompletionTool(
      type: ChatCompletionToolType.function,
      function: FunctionObject(
        name: tool.name,
        description: tool.description,
        parameters: tool.inputJsonSchema,
      ),
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  ChatCompletionToolChoiceOption toChatCompletionToolChoice() {
    return switch (this) {
      ChatToolChoiceNone _ => const ChatCompletionToolChoiceOption.mode(
          ChatCompletionToolChoiceMode.none,
        ),
      ChatToolChoiceAuto _ => const ChatCompletionToolChoiceOption.mode(
          ChatCompletionToolChoiceMode.auto,
        ),
      ChatToolChoiceRequired() => const ChatCompletionToolChoiceOption.mode(
          ChatCompletionToolChoiceMode.required,
        ),
      final ChatToolChoiceForced t => ChatCompletionToolChoiceOption.tool(
          ChatCompletionNamedToolChoice(
            type: ChatCompletionNamedToolChoiceType.function,
            function: ChatCompletionFunctionCallOption(name: t.name),
          ),
        ),
    };
  }
}

extension CreateChatCompletionStreamResponseMapper
    on CreateChatCompletionStreamResponse {
  ChatResult toChatResult(final String id) {
    final choice = choices.firstOrNull;
    final delta = choice?.delta;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: delta?.content ?? '',
        toolCalls: delta?.toolCalls
                ?.map(_mapMessageToolCall)
                .toList(growable: false) ??
            const [],
      ),
      finishReason: _mapFinishReason(choice?.finishReason),
      metadata: {
        'created': created,
        if (model != null) 'model': model,
        if (systemFingerprint != null) 'system_fingerprint': systemFingerprint,
      },
      usage: _mapUsage(usage),
      streaming: true,
    );
  }

  AIChatMessageToolCall _mapMessageToolCall(
    final ChatCompletionStreamMessageToolCallChunk toolCall,
  ) {
    Map<String, dynamic> args = {};
    try {
      args = json.decode(toolCall.function?.arguments ?? '');
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id ?? '',
      name: toolCall.function?.name ?? '',
      argumentsRaw: toolCall.function?.arguments ?? '',
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

extension ChatOpenAIServiceTierX on ChatOpenAIServiceTier? {
  CreateChatCompletionRequestServiceTier?
      toCreateChatCompletionRequestServiceTier() => switch (this) {
            ChatOpenAIServiceTier.auto =>
              CreateChatCompletionRequestServiceTier.auto,
            ChatOpenAIServiceTier.vDefault =>
              CreateChatCompletionRequestServiceTier.vDefault,
            null => null,
          };
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
