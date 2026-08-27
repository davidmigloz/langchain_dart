// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:openai_dart/openai_dart.dart' as oai;

import 'chat_openai.dart';
import 'types.dart';

/// Creates a [oai.ChatCompletionCreateRequest] from the given input.
oai.ChatCompletionCreateRequest createChatCompletionRequest(
  final List<ChatMessage> messages, {
  required final ChatOpenAIOptions? options,
  required final ChatOpenAIOptions defaultOptions,
  final bool stream = false,
}) {
  final messagesDtos = messages.toChatCompletionMessages();
  final toolsDtos = (options?.tools ?? defaultOptions.tools)
      ?.toChatCompletionTool();
  final toolChoice = (options?.toolChoice ?? defaultOptions.toolChoice)
      ?.toChatCompletionToolChoice();
  final responseFormatDto =
      (options?.responseFormat ?? defaultOptions.responseFormat)
          ?.toChatCompletionResponseFormat();
  final serviceTierDto = (options?.serviceTier ?? defaultOptions.serviceTier)
      .toServiceTierString();

  return oai.ChatCompletionCreateRequest(
    model: options?.model ?? defaultOptions.model ?? ChatOpenAI.defaultModel,
    messages: messagesDtos,
    store: options?.store ?? defaultOptions.store,
    reasoningEffort:
        (options?.reasoningEffort ?? defaultOptions.reasoningEffort)
            .toReasoningEffort(),
    metadata: options?.metadata ?? defaultOptions.metadata,
    tools: toolsDtos,
    toolChoice: toolChoice,
    frequencyPenalty:
        options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    logitBias: options?.logitBias ?? defaultOptions.logitBias,
    logprobs: options?.logprobs ?? defaultOptions.logprobs,
    topLogprobs: options?.topLogprobs ?? defaultOptions.topLogprobs,
    maxCompletionTokens: options?.maxTokens ?? defaultOptions.maxTokens,
    n: options?.n ?? defaultOptions.n,
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    responseFormat: responseFormatDto,
    seed: options?.seed ?? defaultOptions.seed,
    stop: options?.stop ?? defaultOptions.stop,
    temperature: options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    parallelToolCalls:
        options?.parallelToolCalls ?? defaultOptions.parallelToolCalls,
    serviceTier: serviceTierDto,
    user: options?.user ?? defaultOptions.user,
    streamOptions: stream ? const oai.StreamOptions(includeUsage: true) : null,
  );
}

extension ChatMessageListMapper on List<ChatMessage> {
  List<oai.ChatMessage> toChatCompletionMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  oai.ChatMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => _mapSystemMessage(msg),
      final HumanChatMessage msg => _mapHumanMessage(msg),
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => _mapToolMessage(msg),
      CustomChatMessage() => throw UnsupportedError(
        'OpenAI does not support custom messages',
      ),
    };
  }

  oai.ChatMessage _mapSystemMessage(final SystemChatMessage systemChatMessage) {
    return oai.ChatMessage.system(systemChatMessage.content);
  }

  oai.ChatMessage _mapHumanMessage(final HumanChatMessage humanChatMessage) {
    return switch (humanChatMessage.content) {
      final ChatMessageContentText c => oai.ChatMessage.user(c.text),
      final ChatMessageContentImage c => oai.ChatMessage.user([
        _mapMessageContentPartImage(c),
      ]),
      final ChatMessageContentMultiModal c => oai.ChatMessage.user(
        _mapMessageContentParts(c),
      ),
    };
  }

  oai.ContentPart _mapMessageContentPartImage(final ChatMessageContentImage c) {
    final imageData = c.data.trim();
    final isUrl = imageData.startsWith('http');
    if (isUrl) {
      return oai.ContentPart.imageUrl(
        imageData,
        detail: _mapImageDetail(c.detail),
      );
    } else {
      if (c.mimeType == null) {
        throw ArgumentError(
          "When passing a Base64 encoded image, you need to specify the mimeType (e.g. 'image/png')",
          'ChatMessageContentImage.mimeType',
        );
      }
      return oai.ContentPart.imageBase64(
        data: imageData,
        mediaType: c.mimeType!,
        detail: _mapImageDetail(c.detail),
      );
    }
  }

  oai.ImageDetail? _mapImageDetail(final ChatMessageContentImageDetail detail) {
    return switch (detail) {
      ChatMessageContentImageDetail.auto => oai.ImageDetail.auto,
      ChatMessageContentImageDetail.low => oai.ImageDetail.low,
      ChatMessageContentImageDetail.high => oai.ImageDetail.high,
    };
  }

  List<oai.ContentPart> _mapMessageContentParts(
    final ChatMessageContentMultiModal c,
  ) {
    return c.parts
        .expand(
          (final part) => switch (part) {
            final ChatMessageContentText c => [oai.ContentPart.text(c.text)],
            final ChatMessageContentImage img => [
              _mapMessageContentPartImage(img),
            ],
            final ChatMessageContentMultiModal c => _mapMessageContentParts(c),
          },
        )
        .toList(growable: false);
  }

  oai.ChatMessage _mapAIMessage(final AIChatMessage aiChatMessage) {
    return oai.ChatMessage.assistant(
      content: aiChatMessage.content,
      toolCalls: aiChatMessage.toolCalls.isNotEmpty
          ? aiChatMessage.toolCalls
                .map(_mapMessageToolCall)
                .toList(growable: false)
          : null,
    );
  }

  oai.ToolCall _mapMessageToolCall(final AIChatMessageToolCall toolCall) {
    return oai.ToolCall(
      id: toolCall.id,
      type: 'function',
      function: oai.FunctionCall(
        name: toolCall.name,
        arguments: toolCall.argumentsRaw.isNotEmpty
            ? toolCall.argumentsRaw
            : json.encode(toolCall.arguments),
      ),
    );
  }

  oai.ChatMessage _mapToolMessage(final ToolChatMessage toolChatMessage) {
    return oai.ChatMessage.tool(
      toolCallId: toolChatMessage.toolCallId,
      content: toolChatMessage.content,
    );
  }
}

extension CreateChatCompletionResponseMapper on oai.ChatCompletion {
  ChatResult toChatResult(final String id) {
    final choice = choices.first;
    final msg = choice.message;

    if (msg.refusal != null && msg.refusal!.isNotEmpty) {
      throw OpenAIRefusalException(msg.refusal!);
    }

    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: [
          if (msg.hasReasoningContent)
            AIChatMessageReasoningBlock(
              reasoning: msg.reasoningContent ?? msg.reasoning ?? '',
              id: 'openai-chat:$id:reasoning',
              index: 0,
              providerData: {
                'openai': {
                  'chatMessage': msg.toJson(),
                  if (msg.reasoningDetails != null)
                    'reasoningDetails': msg.reasoningDetails!
                        .map((detail) => detail.toJson())
                        .toList(growable: false),
                },
              },
            ),
          if ((msg.content ?? '').isNotEmpty)
            AIChatMessageTextBlock(
              text: msg.content!,
              id: 'openai-chat:$id:text',
              index: 1,
              providerData: {
                'openai': {'chatMessage': msg.toJson()},
              },
            ),
          for (final (index, toolCall) in (msg.toolCalls ?? const []).indexed)
            _mapMessageToolCall(toolCall, index: index + 2, responseId: id),
        ],
        legacyContent: msg.content ?? '',
      ),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {
        'model': model,
        'created': created,
        'system_fingerprint': systemFingerprint,
        'logprobs': choice.logprobs?.toJson(),
      },
      usage: _mapUsage(usage),
    );
  }

  AIChatMessageToolCall _mapMessageToolCall(
    final oai.ToolCall toolCall, {
    required final int index,
    required final String responseId,
  }) {
    var args = <String, dynamic>{};
    try {
      args = toolCall.function.arguments.isEmpty
          ? {}
          : json.decode(toolCall.function.arguments);
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      index: index,
      name: toolCall.function.name,
      argumentsRaw: toolCall.function.arguments,
      arguments: args,
      providerData: {
        'openai': {'toolCall': toolCall.toJson(), 'responseId': responseId},
      },
    );
  }
}

LanguageModelUsage _mapUsage(final oai.Usage? usage) {
  return LanguageModelUsage(
    promptTokens: usage?.promptTokens,
    responseTokens: usage?.completionTokens,
    totalTokens: usage?.totalTokens,
  );
}

extension ChatToolListMapper on List<ToolSpec> {
  List<oai.Tool> toChatCompletionTool() {
    return map(_mapChatCompletionTool).toList(growable: false);
  }

  oai.Tool _mapChatCompletionTool(final ToolSpec tool) {
    return oai.Tool.function(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  oai.ToolChoice toChatCompletionToolChoice() {
    return switch (this) {
      ChatToolChoiceNone _ => oai.ToolChoice.none(),
      ChatToolChoiceAuto _ => oai.ToolChoice.auto(),
      ChatToolChoiceRequired() => oai.ToolChoice.required(),
      final ChatToolChoiceForced t => oai.ToolChoice.function(t.name),
    };
  }
}

extension CreateChatCompletionStreamResponseMapper on oai.ChatStreamEvent {
  ChatResult toChatResult(final String id) {
    final choice = choices?.firstOrNull;
    final delta = choice?.delta;

    if (delta?.refusal != null && delta!.refusal!.isNotEmpty) {
      throw OpenAIRefusalException(delta.refusal!);
    }

    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: [
          if (delta?.hasReasoningContent ?? false)
            AIChatMessageReasoningBlock(
              reasoning: delta?.reasoningContent ?? delta?.reasoning ?? '',
              id: 'openai-chat:$id:reasoning',
              index: 0,
              providerData: {
                'openai': {'delta': delta?.toJson()},
              },
            ),
          if ((delta?.content ?? '').isNotEmpty)
            AIChatMessageTextBlock(
              text: delta!.content!,
              id: 'openai-chat:$id:text',
              index: 1,
              providerData: {
                'openai': {'delta': delta.toJson()},
              },
            ),
          for (final toolCall
              in delta?.toolCalls ?? const <oai.ToolCallDelta>[])
            _mapMessageToolCall(toolCall, responseId: id),
        ],
        legacyContent: delta?.content ?? '',
      ),
      finishReason: _mapFinishReason(choice?.finishReason),
      metadata: {
        if (created != null) 'created': created,
        if (model != null) 'model': model,
        if (systemFingerprint != null) 'system_fingerprint': systemFingerprint,
      },
      usage: _mapUsage(usage),
      streaming: true,
    );
  }

  AIChatMessageToolCall _mapMessageToolCall(
    final oai.ToolCallDelta toolCall, {
    required final String responseId,
  }) {
    var args = <String, dynamic>{};
    try {
      args = json.decode(toolCall.function?.arguments ?? '');
    } catch (_) {}
    return AIChatMessageToolCall(
      // Continuation deltas commonly omit the provider ID. Keep it empty so
      // the explicit stream index can associate it with the opening delta;
      // assigning a synthetic stable ID here would split one call in two.
      id: toolCall.id ?? '',
      index: toolCall.index + 2,
      name: toolCall.function?.name ?? '',
      argumentsRaw: toolCall.function?.arguments ?? '',
      arguments: args,
      providerData: {
        'openai': {'delta': toolCall.toJson()},
      },
    );
  }
}

extension ChatOpenAIResponseFormatMapper on ChatOpenAIResponseFormat {
  oai.ResponseFormat toChatCompletionResponseFormat() {
    return switch (this) {
      ChatOpenAIResponseFormatText() => oai.ResponseFormat.text(),
      ChatOpenAIResponseFormatJsonObject() => oai.ResponseFormat.jsonObject(),
      final ChatOpenAIResponseFormatJsonSchema res =>
        oai.ResponseFormat.jsonSchema(
          name: res.jsonSchema.name,
          description: res.jsonSchema.description,
          schema: res.jsonSchema.schema,
          strict: res.jsonSchema.strict,
        ),
    };
  }
}

extension ChatOpenAIReasoningEffortX on ChatOpenAIReasoningEffort? {
  oai.ReasoningEffort? toReasoningEffort() => switch (this) {
    ChatOpenAIReasoningEffort.minimal => oai.ReasoningEffort.low, // deprecated
    ChatOpenAIReasoningEffort.low => oai.ReasoningEffort.low,
    ChatOpenAIReasoningEffort.medium => oai.ReasoningEffort.medium,
    ChatOpenAIReasoningEffort.high => oai.ReasoningEffort.high,
    null => null,
  };
}

extension ChatOpenAIServiceTierX on ChatOpenAIServiceTier? {
  String? toServiceTierString() => switch (this) {
    ChatOpenAIServiceTier.auto => 'auto',
    ChatOpenAIServiceTier.vDefault => 'default',
    null => null,
  };
}

FinishReason _mapFinishReason(final oai.FinishReason? reason) =>
    switch (reason) {
      oai.FinishReason.stop => FinishReason.stop,
      oai.FinishReason.length => FinishReason.length,
      oai.FinishReason.toolCalls => FinishReason.toolCalls,
      oai.FinishReason.contentFilter => FinishReason.contentFilter,
      oai.FinishReason.functionCall => FinishReason.toolCalls,
      null => FinishReason.unspecified,
    };
