// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:openai_dart/openai_dart.dart' as oai;

import 'chat_openai_responses.dart';
import 'chat_openai_responses_types.dart';

/// Creates a [oai.CreateResponseRequest] from the given input.
oai.CreateResponseRequest createResponseRequest(
  final List<ChatMessage> messages, {
  required final ChatOpenAIResponsesOptions? options,
  required final ChatOpenAIResponsesOptions defaultOptions,
}) {
  final input = messages.toResponseInput();
  final toolsDtos = (options?.tools ?? defaultOptions.tools)?.toResponseTools();
  final toolChoice = (options?.toolChoice ?? defaultOptions.toolChoice)
      ?.toResponseToolChoice();
  final textConfig =
      (options?.responseFormat ?? defaultOptions.responseFormat)
          ?.toTextConfig();
  final reasoningConfig =
      (options?.reasoningEffort ?? defaultOptions.reasoningEffort)
          ?.toReasoningConfig();
  final serviceTier =
      (options?.serviceTier ?? defaultOptions.serviceTier)?.toServiceTier();
  final truncation =
      (options?.truncation ?? defaultOptions.truncation)?.toTruncation();

  return oai.CreateResponseRequest(
    model:
        options?.model ??
        defaultOptions.model ??
        ChatOpenAIResponses.defaultModel,
    input: input,
    instructions: options?.instructions ?? defaultOptions.instructions,
    previousResponseId:
        options?.previousResponseId ?? defaultOptions.previousResponseId,
    store: options?.store ?? defaultOptions.store,
    metadata:
        options?.metadata ?? defaultOptions.metadata,
    tools: toolsDtos,
    toolChoice: toolChoice,
    frequencyPenalty:
        options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    topLogprobs: options?.topLogprobs ?? defaultOptions.topLogprobs,
    maxOutputTokens: options?.maxOutputTokens ?? defaultOptions.maxOutputTokens,
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    text: textConfig,
    reasoning: reasoningConfig,
    temperature: options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    parallelToolCalls:
        options?.parallelToolCalls ?? defaultOptions.parallelToolCalls,
    serviceTier: serviceTier,
    truncation: truncation,
  );
}

extension ChatMessageListResponseMapper on List<ChatMessage> {
  oai.ResponseInput toResponseInput() {
    final items = expand(_mapMessage).toList(growable: false);
    return oai.ResponseInput.items(items);
  }

  Iterable<oai.Item> _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => [_mapSystemMessage(msg)],
      final HumanChatMessage msg => [_mapHumanMessage(msg)],
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => [_mapToolMessage(msg)],
      CustomChatMessage() => throw UnsupportedError(
        'OpenAI Responses API does not support custom messages',
      ),
    };
  }

  oai.Item _mapSystemMessage(final SystemChatMessage msg) {
    return oai.MessageItem.systemText(msg.content);
  }

  oai.Item _mapHumanMessage(final HumanChatMessage msg) {
    return switch (msg.content) {
      final ChatMessageContentText c => oai.MessageItem.userText(c.text),
      final ChatMessageContentImage c =>
        oai.MessageItem.user([_mapContentImage(c)]),
      final ChatMessageContentMultiModal c =>
        oai.MessageItem.user(_mapContentParts(c)),
    };
  }

  oai.InputContent _mapContentImage(final ChatMessageContentImage c) {
    final imageData = c.data.trim();
    final isUrl = imageData.startsWith('http');
    if (isUrl) {
      return oai.InputContent.imageUrl(imageData);
    } else {
      if (c.mimeType == null) {
        throw ArgumentError(
          "When passing a Base64 encoded image, you need to specify the mimeType (e.g. 'image/png')",
          'ChatMessageContentImage.mimeType',
        );
      }
      return oai.InputContent.imageUrl(
        'data:${c.mimeType};base64,$imageData',
      );
    }
  }

  List<oai.InputContent> _mapContentParts(
    final ChatMessageContentMultiModal c,
  ) {
    return c.parts
        .expand(
          (final part) => switch (part) {
            final ChatMessageContentText c => [oai.InputContent.text(c.text)],
            final ChatMessageContentImage img => [_mapContentImage(img)],
            final ChatMessageContentMultiModal c => _mapContentParts(c),
          },
        )
        .toList(growable: false);
  }

  // The Responses API input format expects assistant text and function calls
  // as separate items (unlike Chat Completions which groups them in one message).
  Iterable<oai.Item> _mapAIMessage(final AIChatMessage msg) {
    final items = <oai.Item>[];
    if (msg.content.isNotEmpty) {
      items.add(oai.MessageItem.assistantText(msg.content));
    }
    for (final toolCall in msg.toolCalls) {
      items.add(
        oai.FunctionCallItem(
          callId: toolCall.id,
          name: toolCall.name,
          arguments: toolCall.argumentsRaw,
        ),
      );
    }
    return items;
  }

  oai.Item _mapToolMessage(final ToolChatMessage msg) {
    return oai.FunctionCallOutputItem.string(
      callId: msg.toolCallId,
      output: msg.content,
    );
  }
}

extension ResponseMapper on oai.Response {
  ChatResult toChatResult() {
    final toolCalls = functionCalls
        .map(
          (fc) {
            var args = <String, dynamic>{};
            try {
              args = fc.arguments.isEmpty ? {} : json.decode(fc.arguments);
            } catch (_) {}
            return AIChatMessageToolCall(
              id: fc.callId,
              name: fc.name,
              argumentsRaw: fc.arguments,
              arguments: args,
            );
          },
        )
        .toList(growable: false);

    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: outputText,
        toolCalls: toolCalls,
      ),
      finishReason: _mapFinishReason(status),
      metadata: {
        'model': model,
        'created_at': createdAt,
      },
      usage: _mapResponseUsage(usage),
    );
  }
}

extension ResponseStreamAccumulatorMapper on oai.ResponseStreamAccumulator {
  ChatResult toChatResult() {
    final event = latestEvent;

    final String content;
    final List<AIChatMessageToolCall> toolCalls;

    switch (event) {
      case oai.OutputTextDeltaEvent(:final delta):
        content = delta;
        toolCalls = const [];
      case oai.OutputItemAddedEvent(:final item)
          when item is oai.FunctionCallOutputItemResponse:
        content = '';
        toolCalls = [
          AIChatMessageToolCall(
            id: item.callId,
            name: item.name,
            argumentsRaw: '',
            arguments: const {},
          ),
        ];
      case oai.FunctionCallArgumentsDeltaEvent(:final delta, :final itemId):
        content = '';
        toolCalls = [
          AIChatMessageToolCall(
            id: itemId ?? '',
            name: '',
            argumentsRaw: delta,
            arguments: const {},
          ),
        ];
      case oai.RefusalDeltaEvent(:final delta):
        content = '';
        toolCalls = const [];
        return ChatResult(
          id: responseId ?? '',
          output: AIChatMessage(content: content, toolCalls: toolCalls),
          finishReason: FinishReason.unspecified,
          metadata: {'refusal': delta},
          usage: _mapResponseUsage(usage),
          streaming: true,
        );
      case oai.ResponseCompletedEvent(:final response):
        final result = response.toChatResult();
        return ChatResult(
          id: result.id,
          output: result.output,
          finishReason: result.finishReason,
          metadata: result.metadata,
          usage: result.usage,
          streaming: true,
        );
      default:
        content = '';
        toolCalls = const [];
    }

    return ChatResult(
      id: responseId ?? '',
      output: AIChatMessage(content: content, toolCalls: toolCalls),
      finishReason: _mapStreamFinishReason(status),
      metadata: const {},
      usage: _mapResponseUsage(usage),
      streaming: true,
    );
  }
}

extension ResponseToolListMapper on List<ToolSpec> {
  List<oai.ResponseTool> toResponseTools() {
    return map(_mapResponseTool).toList(growable: false);
  }

  oai.ResponseTool _mapResponseTool(final ToolSpec tool) {
    return oai.ResponseTool.function(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    );
  }
}

extension ResponseToolChoiceMapper on ChatToolChoice {
  oai.ResponseToolChoice toResponseToolChoice() {
    return switch (this) {
      ChatToolChoiceNone _ => oai.ResponseToolChoice.none,
      ChatToolChoiceAuto _ => oai.ResponseToolChoice.auto,
      ChatToolChoiceRequired() => oai.ResponseToolChoice.required,
      final ChatToolChoiceForced t =>
        oai.ResponseToolChoice.function(name: t.name),
    };
  }
}

extension ChatOpenAIResponsesResponseFormatMapper
    on ChatOpenAIResponsesResponseFormat {
  oai.TextConfig toTextConfig() {
    return switch (this) {
      ChatOpenAIResponsesResponseFormatText() =>
        const oai.TextConfig(format: oai.PlainTextFormat()),
      ChatOpenAIResponsesResponseFormatJsonObject() =>
        const oai.TextConfig(format: oai.JsonObjectFormat()),
      final ChatOpenAIResponsesResponseFormatJsonSchema res =>
        oai.TextConfig(
          format: oai.JsonSchemaFormat(
            name: res.name,
            description: res.description,
            schema: res.schema,
            strict: res.strict,
          ),
        ),
    };
  }
}

extension ChatOpenAIResponsesReasoningEffortMapper
    on ChatOpenAIResponsesReasoningEffort {
  oai.ReasoningConfig toReasoningConfig() => switch (this) {
    ChatOpenAIResponsesReasoningEffort.low =>
      const oai.ReasoningConfig(effort: oai.ReasoningEffort.low),
    ChatOpenAIResponsesReasoningEffort.medium =>
      const oai.ReasoningConfig(effort: oai.ReasoningEffort.medium),
    ChatOpenAIResponsesReasoningEffort.high =>
      const oai.ReasoningConfig(effort: oai.ReasoningEffort.high),
  };
}

extension ChatOpenAIResponsesServiceTierMapper
    on ChatOpenAIResponsesServiceTier {
  oai.ServiceTier toServiceTier() => switch (this) {
    ChatOpenAIResponsesServiceTier.auto => oai.ServiceTier.auto,
    ChatOpenAIResponsesServiceTier.vDefault => oai.ServiceTier.defaultTier,
  };
}

extension ChatOpenAIResponsesTruncationMapper
    on ChatOpenAIResponsesTruncation {
  oai.Truncation toTruncation() => switch (this) {
    ChatOpenAIResponsesTruncation.auto => oai.Truncation.auto,
    ChatOpenAIResponsesTruncation.disabled => oai.Truncation.disabled,
  };
}

FinishReason _mapFinishReason(final oai.ResponseStatus status) =>
    switch (status) {
      oai.ResponseStatus.completed => FinishReason.stop,
      oai.ResponseStatus.failed => FinishReason.unspecified,
      oai.ResponseStatus.incomplete => FinishReason.length,
      oai.ResponseStatus.inProgress => FinishReason.unspecified,
      oai.ResponseStatus.queued => FinishReason.unspecified,
      oai.ResponseStatus.cancelled => FinishReason.unspecified,
      _ => FinishReason.unspecified,
    };

FinishReason _mapStreamFinishReason(final oai.ResponseStatus status) =>
    switch (status) {
      oai.ResponseStatus.completed => FinishReason.stop,
      _ => FinishReason.unspecified,
    };

LanguageModelUsage _mapResponseUsage(final oai.ResponseUsage? usage) {
  if (usage == null) return const LanguageModelUsage();
  return LanguageModelUsage(
    promptTokens: usage.inputTokens,
    responseTokens: usage.outputTokens,
    totalTokens: usage.totalTokens,
  );
}
