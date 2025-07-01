import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';

import '../../../chat_models.dart'
    show
        AIChatMessage,
        AIChatMessageToolCall,
        ChatMessage,
        ChatMessageContentImage,
        ChatMessageContentImageDetail,
        ChatMessageContentMultiModal,
        ChatMessageContentText,
        ChatResult,
        ChatToolChoice,
        ChatToolChoiceAuto,
        ChatToolChoiceForced,
        ChatToolChoiceNone,
        ChatToolChoiceRequired,
        CustomChatMessage,
        HumanChatMessage,
        SystemChatMessage,
        ToolChatMessage;
import '../../../language_models.dart';
import '../../../tools.dart';
import './types.dart';

/// Creates a [CreateChatCompletionRequest] from the given input.
CreateChatCompletionRequest createChatCompletionRequest(
  List<ChatMessage> messages, {
  required String model,
  required ChatOpenAIOptions? options,
  required ChatOpenAIOptions defaultOptions,
  List<ToolSpec>? tools,
  double? temperature,
  bool stream = false,
}) {
  final messagesDtos = messages.toChatCompletionMessages();
  final toolsDtos = tools?.toChatCompletionTool();
  final toolChoice = (toolsDtos?.isNotEmpty ?? false)
      ? const ChatToolChoiceAuto().toChatCompletionToolChoice()
      : null;
  final responseFormatDto =
      (options?.responseFormat ?? defaultOptions.responseFormat)
          ?.toChatCompletionResponseFormat();
  final serviceTierDto = (options?.serviceTier ?? defaultOptions.serviceTier)
      .toCreateChatCompletionRequestServiceTier();

  return CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId(model),
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
    temperature:
        temperature ?? options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    parallelToolCalls:
        options?.parallelToolCalls ?? defaultOptions.parallelToolCalls,
    serviceTier: serviceTierDto,
    user: options?.user ?? defaultOptions.user,
    streamOptions: stream
        ? (options?.streamOptions ?? defaultOptions.streamOptions)
        : null,
  );
}

/// Extension on [List<ChatMessage>] to convert chat messages to OpenAI SDK
/// messages.
extension ChatMessageListMapper on List<ChatMessage> {
  /// Converts this list of [ChatMessage]s to a list of
  /// [ChatCompletionMessage]s.
  List<ChatCompletionMessage> toChatCompletionMessages() =>
      map(_mapMessage).toList(growable: false);

  ChatCompletionMessage _mapMessage(ChatMessage msg) => switch (msg) {
    final SystemChatMessage msg => _mapSystemMessage(msg),
    final HumanChatMessage msg => _mapHumanMessage(msg),
    final AIChatMessage msg => _mapAIMessage(msg),
    final ToolChatMessage msg => _mapToolMessage(msg),
    CustomChatMessage() => throw UnsupportedError(
      'OpenAI does not support custom messages',
    ),
  };

  ChatCompletionMessage _mapSystemMessage(
    SystemChatMessage systemChatMessage,
  ) => ChatCompletionMessage.system(content: systemChatMessage.content);

  ChatCompletionMessage _mapHumanMessage(HumanChatMessage humanChatMessage) =>
      ChatCompletionMessage.user(
        content: switch (humanChatMessage.content) {
          final ChatMessageContentText c => _mapMessageContentString(c),
          final ChatMessageContentImage c =>
            ChatCompletionUserMessageContent.parts([
              _mapMessageContentPartImage(c),
            ]),
          final ChatMessageContentMultiModal c => _mapMessageContentPart(c),
        },
      );

  ChatCompletionUserMessageContentString _mapMessageContentString(
    ChatMessageContentText c,
  ) => ChatCompletionUserMessageContentString(c.text);

  ChatCompletionMessageContentPartImage _mapMessageContentPartImage(
    ChatMessageContentImage c,
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
    ChatMessageContentMultiModal c,
  ) {
    final partsList = c.parts
        .map(
          (part) => switch (part) {
            final ChatMessageContentText c => [
              ChatCompletionMessageContentPartText(text: c.text),
            ],
            final ChatMessageContentImage img => [
              _mapMessageContentPartImage(img),
            ],
            final ChatMessageContentMultiModal c => _mapMessageContentPart(
              c,
            ).value,
          },
        )
        .expand((parts) => parts)
        .toList(growable: false);
    return ChatCompletionMessageContentParts(partsList);
  }

  ChatCompletionMessage _mapAIMessage(AIChatMessage aiChatMessage) =>
      ChatCompletionMessage.assistant(
        content: aiChatMessage.content,
        toolCalls: aiChatMessage.toolCalls.isNotEmpty
            ? aiChatMessage.toolCalls
                  .map(_mapMessageToolCall)
                  .toList(growable: false)
            : null,
      );

  ChatCompletionMessageToolCall _mapMessageToolCall(
    AIChatMessageToolCall toolCall,
  ) => ChatCompletionMessageToolCall(
    id: toolCall.id,
    type: ChatCompletionMessageToolCallType.function,
    function: ChatCompletionMessageFunctionCall(
      name: toolCall.name,
      arguments: json.encode(toolCall.arguments),
    ),
  );

  ChatCompletionMessage _mapToolMessage(ToolChatMessage toolChatMessage) =>
      ChatCompletionMessage.tool(
        toolCallId: toolChatMessage.toolCallId,
        content: toolChatMessage.content,
      );
}

/// Extension on [CreateChatCompletionResponse] to convert to [ChatResult].
extension CreateChatCompletionResponseMapper on CreateChatCompletionResponse {
  /// Converts this [CreateChatCompletionResponse] to a [ChatResult].
  ChatResult toChatResult(String id) {
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
    ChatCompletionMessageToolCall tooCall,
  ) {
    var args = <String, dynamic>{};
    args = tooCall.function.arguments.isEmpty
        ? {}
        : json.decode(tooCall.function.arguments);
    return AIChatMessageToolCall(
      id: tooCall.id,
      name: tooCall.function.name,
      argumentsRaw: tooCall.function.arguments,
      arguments: args,
    );
  }
}

LanguageModelUsage _mapUsage(CompletionUsage? usage) => LanguageModelUsage(
  promptTokens: usage?.promptTokens,
  responseTokens: usage?.completionTokens,
  totalTokens: usage?.totalTokens,
);

/// Extension on [List<ToolSpec>] to convert to OpenAI SDK tool list.
extension ChatToolListMapper on List<ToolSpec> {
  /// Converts this list of [ToolSpec]s to a list of [ChatCompletionTool]s.
  List<ChatCompletionTool> toChatCompletionTool() =>
      map(_mapChatCompletionTool).toList(growable: false);

  ChatCompletionTool _mapChatCompletionTool(ToolSpec tool) =>
      ChatCompletionTool(
        type: ChatCompletionToolType.function,
        function: FunctionObject(
          name: tool.name,
          description: tool.description,
          parameters: tool.inputJsonSchema,
        ),
      );
}

/// Extension on [ChatToolChoice] to convert to OpenAI SDK tool choice.
extension ChatToolChoiceMapper on ChatToolChoice {
  /// Converts this [ChatToolChoice] to a [ChatCompletionToolChoiceOption].
  ChatCompletionToolChoiceOption toChatCompletionToolChoice() => switch (this) {
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

/// Extension on [CreateChatCompletionStreamResponse] to convert to
/// [ChatResult].
extension CreateChatCompletionStreamResponseMapper
    on CreateChatCompletionStreamResponse {
  /// Converts this [CreateChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult(String id) {
    final choice = choices.firstOrNull;
    final delta = choice?.delta;

    if (delta?.refusal != null && delta!.refusal!.isNotEmpty) {
      throw OpenAIRefusalException(delta.refusal!);
    }

    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: delta?.content ?? '',
        toolCalls:
            delta?.toolCalls
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

  // Don't decode JSON here - arguments may be incomplete during streaming Store
  // raw arguments and let the accumulation/concat logic handle merging
  AIChatMessageToolCall _mapMessageToolCall(
    ChatCompletionStreamMessageToolCallChunk toolCall,
  ) => AIChatMessageToolCall(
    id: toolCall.id ?? '',
    name: toolCall.function?.name ?? '',
    argumentsRaw: toolCall.function?.arguments ?? '',
    arguments:
        const <
          String,
          dynamic
        >{}, // Empty - will be populated after accumulation
  );
}

/// Extension on [ChatOpenAIResponseFormat] to convert to OpenAI SDK response
/// format.
extension ChatOpenAIResponseFormatMapper on ChatOpenAIResponseFormat {
  /// Converts this [ChatOpenAIResponseFormat] to a [ResponseFormat].
  ResponseFormat toChatCompletionResponseFormat() => switch (this) {
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

/// Extension on [ChatOpenAIServiceTier?] to convert to OpenAI SDK service tier.
extension ChatOpenAIServiceTierX on ChatOpenAIServiceTier? {
  /// Converts this [ChatOpenAIServiceTier] to a
  /// [CreateChatCompletionRequestServiceTier].
  CreateChatCompletionRequestServiceTier?
  toCreateChatCompletionRequestServiceTier() => switch (this) {
    ChatOpenAIServiceTier.auto => CreateChatCompletionRequestServiceTier.auto,
    ChatOpenAIServiceTier.vDefault =>
      CreateChatCompletionRequestServiceTier.vDefault,
    null => null,
  };
}

FinishReason _mapFinishReason(ChatCompletionFinishReason? reason) =>
    switch (reason) {
      ChatCompletionFinishReason.stop => FinishReason.stop,
      ChatCompletionFinishReason.length => FinishReason.length,
      ChatCompletionFinishReason.toolCalls => FinishReason.toolCalls,
      ChatCompletionFinishReason.contentFilter => FinishReason.contentFilter,
      ChatCompletionFinishReason.functionCall => FinishReason.toolCalls,
      null => FinishReason.unspecified,
    };
