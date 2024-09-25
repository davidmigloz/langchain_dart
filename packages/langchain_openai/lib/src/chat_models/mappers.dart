// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:openai_dart/openai_dart.dart';

import 'chat_openai.dart';
import 'types.dart';

/// Creates a [CreateChatCompletionRequest] from the given input.
CreateChatCompletionRequest createChatCompletionRequest(
  final List<ChatMessage> messages, {
  required final ChatOpenAIOptions? options,
  required final ChatOpenAIOptions defaultOptions,
  final bool stream = false,
}) {
  final messagesDtos = messages.toChatCompletionMessages();
  final toolsDtos =
      (options?.tools ?? defaultOptions.tools)?.toChatCompletionTool();
  final toolChoice = (options?.toolChoice ?? defaultOptions.toolChoice)
      ?.toChatCompletionToolChoice();
  final responseFormatDto =
      (options?.responseFormat ?? defaultOptions.responseFormat)
          ?.toChatCompletionResponseFormat();
  final serviceTierDto = (options?.serviceTier ?? defaultOptions.serviceTier)
      .toCreateChatCompletionRequestServiceTier();

  return CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId(
      options?.model ?? defaultOptions.model ?? ChatOpenAI.defaultModel,
    ),
    messages: messagesDtos,
    tools: toolsDtos,
    toolChoice: toolChoice,
    frequencyPenalty:
        options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    logitBias: options?.logitBias ?? defaultOptions.logitBias,
    maxCompletionTokens: options?.maxTokens ?? defaultOptions.maxTokens,
    n: options?.n ?? defaultOptions.n,
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    responseFormat: responseFormatDto,
    seed: options?.seed ?? defaultOptions.seed,
    stop: (options?.stop ?? defaultOptions.stop) != null
        ? ChatCompletionStop.listString(options?.stop ?? defaultOptions.stop!)
        : null,
    temperature: options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    parallelToolCalls:
        options?.parallelToolCalls ?? defaultOptions.parallelToolCalls,
    serviceTier: serviceTierDto,
    user: options?.user ?? defaultOptions.user,
    streamOptions:
        stream ? const ChatCompletionStreamOptions(includeUsage: true) : null,
  );
}

extension ChatMessageListMapper on List<ChatMessage> {
  List<ChatCompletionMessage> toChatCompletionMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  ChatCompletionMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => _mapSystemMessage(msg),
      final HumanChatMessage msg => _mapHumanMessage(msg),
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => _mapToolMessage(msg),
      CustomChatMessage() =>
        throw UnsupportedError('OpenAI does not support custom messages'),
    };
  }

  ChatCompletionMessage _mapSystemMessage(
    final SystemChatMessage systemChatMessage,
  ) {
    return ChatCompletionMessage.system(content: systemChatMessage.content);
  }

  ChatCompletionMessage _mapHumanMessage(
    final HumanChatMessage humanChatMessage,
  ) {
    return ChatCompletionMessage.user(
      content: switch (humanChatMessage.content) {
        final ChatMessageContentText c => _mapMessageContentString(c),
        final ChatMessageContentImage c =>
          ChatCompletionUserMessageContent.parts(
            [_mapMessageContentPartImage(c)],
          ),
        final ChatMessageContentMultiModal c => _mapMessageContentPart(c),
      },
    );
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

  ChatCompletionMessage _mapAIMessage(final AIChatMessage aiChatMessage) {
    return ChatCompletionMessage.assistant(
      content: aiChatMessage.content,
      toolCalls: aiChatMessage.toolCalls.isNotEmpty
          ? aiChatMessage.toolCalls
              .map(_mapMessageToolCall)
              .toList(growable: false)
          : null,
    );
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

  ChatCompletionMessage _mapToolMessage(
    final ToolChatMessage toolChatMessage,
  ) {
    return ChatCompletionMessage.tool(
      toolCallId: toolChatMessage.toolCallId,
      content: toolChatMessage.content,
    );
  }
}

extension CreateChatCompletionResponseMapper on CreateChatCompletionResponse {
  ChatResult toChatResult(final String id) {
    final choice = choices.first;
    final msg = choice.message;

    if (msg.refusal != null && msg.refusal!.isNotEmpty) {
      throw OpenAIRefusalException(msg.refusal!);
    }

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
        'logprobs': choice.logprobs?.toMap(),
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

    if (delta?.refusal != null && delta!.refusal!.isNotEmpty) {
      throw OpenAIRefusalException(delta.refusal!);
    }

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
  ResponseFormat toChatCompletionResponseFormat() {
    return switch (this) {
      ChatOpenAIResponseFormatText() => const ResponseFormat.text(),
      ChatOpenAIResponseFormatJsonObject() => const ResponseFormat.jsonObject(),
      final ChatOpenAIResponseFormatJsonSchema res => ResponseFormat.jsonSchema(
          jsonSchema: JsonSchemaObject(
            name: res.jsonSchema.name,
            description: res.jsonSchema.description,
            schema: res.jsonSchema.schema,
            strict: res.jsonSchema.strict,
          ),
        ),
    };
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
