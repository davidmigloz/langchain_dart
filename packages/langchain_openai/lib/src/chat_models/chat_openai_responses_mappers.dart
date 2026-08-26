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
  final textConfig = (options?.responseFormat ?? defaultOptions.responseFormat)
      ?.toTextConfig();
  final reasoningConfig =
      (options?.reasoningEffort ?? defaultOptions.reasoningEffort)
          ?.toReasoningConfig();
  final serviceTier = (options?.serviceTier ?? defaultOptions.serviceTier)
      ?.toServiceTier();
  final truncation = (options?.truncation ?? defaultOptions.truncation)
      ?.toTruncation();

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
    metadata: options?.metadata ?? defaultOptions.metadata,
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
    final containsResponseOutput = whereType<AIChatMessage>().any(
      (message) => message.contentBlocks.any(
        (block) => _openAIOutputItem(block) != null,
      ),
    );
    if (containsResponseOutput) {
      return oai.ResponseInput.fromOutputItems(
        expand(_mapMessageToRawItems).toList(growable: false),
      );
    }
    final items = expand(_mapMessage).toList(growable: false);
    return oai.ResponseInput.items(items);
  }

  Iterable<Map<String, dynamic>> _mapMessageToRawItems(
    final ChatMessage message,
  ) sync* {
    if (message is! AIChatMessage) {
      yield* _mapMessage(message).map((item) => item.toJson());
      return;
    }
    final emittedItems = <String>{};
    for (final block in message.contentBlocks) {
      final rawItem = _openAIOutputItem(block);
      if (rawItem != null) {
        final key = '${rawItem['type']}:${rawItem['id'] ?? block.index}';
        if (emittedItems.add(key)) yield rawItem;
        continue;
      }
      switch (block) {
        case final AIChatMessageTextBlock text:
          yield oai.MessageItem.assistantText(text.text).toJson();
        case final AIChatMessageToolCall toolCall:
          yield oai.FunctionCallItem(
            callId: toolCall.id,
            name: toolCall.name,
            arguments: toolCall.argumentsRaw,
          ).toJson();
        case AIChatMessageContentBlock():
          continue;
      }
    }
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
      final ChatMessageContentImage c => oai.MessageItem.user([
        _mapContentImage(c),
      ]),
      final ChatMessageContentMultiModal c => oai.MessageItem.user(
        _mapContentParts(c),
      ),
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
      return oai.InputContent.imageUrl('data:${c.mimeType};base64,$imageData');
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
    for (final block in msg.contentBlocks) {
      switch (block) {
        case final AIChatMessageTextBlock text:
          if (text.text.isNotEmpty) {
            items.add(oai.MessageItem.assistantText(text.text));
          }
        case final AIChatMessageToolCall toolCall:
          items.add(
            oai.FunctionCallItem(
              callId: toolCall.id,
              name: toolCall.name,
              arguments: toolCall.argumentsRaw,
            ),
          );
        case AIChatMessageContentBlock():
          continue;
      }
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
    return ChatResult(
      id: id,
      output: AIChatMessage.withBlocks(
        contentBlocks: _mapOpenAIOutputItems(output),
        legacyContent: outputText,
      ),
      finishReason: _mapFinishReason(status),
      metadata: {'model': model, 'created_at': createdAt},
      usage: _mapResponseUsage(usage),
    );
  }
}

extension ResponseStreamAccumulatorMapper on oai.ResponseStreamAccumulator {
  /// Maps the latest streaming event to a [ChatResult], or returns `null`
  /// for events that carry no meaningful content (e.g. `response.created`).
  ChatResult? toChatResult() {
    final event = latestEvent;

    final AIChatMessageContentBlock? block;

    switch (event) {
      case oai.OutputTextDeltaEvent(
        :final itemId,
        :final outputIndex,
        :final contentIndex,
        :final delta,
      ):
        block = AIChatMessageTextBlock(
          text: delta,
          id: itemId ?? 'openai-response:$responseId:$outputIndex',
          index: _responseBlockIndex(outputIndex, contentIndex),
          providerData: {
            'openai': {'event': event.toJson()},
          },
        );
      case oai.OutputItemAddedEvent(:final item)
          when item is oai.FunctionCallOutputItemResponse:
        block = AIChatMessageToolCall(
          id: item.callId,
          index: event.outputIndex,
          name: item.name,
          argumentsRaw: item.arguments,
          arguments: _decodeArguments(item.arguments),
          providerData: {
            'openai': {'outputItem': item.toJson()},
          },
        );
      case oai.FunctionCallArgumentsDeltaEvent(
        :final itemId,
        :final outputIndex,
        :final delta,
      ):
        block = AIChatMessageToolCall(
          id: itemId ?? 'openai-response:$responseId:$outputIndex',
          index: outputIndex,
          name: '',
          argumentsRaw: delta,
          arguments: const {},
          providerData: {
            'openai': {'event': event.toJson()},
          },
        );
      case oai.ReasoningTextDeltaEvent(
        :final itemId,
        :final outputIndex,
        :final contentIndex,
        :final delta,
      ):
        block = AIChatMessageReasoningBlock(
          reasoning: delta,
          id: itemId ?? 'openai-response:$responseId:$outputIndex',
          index: _responseBlockIndex(outputIndex, contentIndex ?? 0),
          providerData: {
            'openai': {'event': event.toJson()},
          },
        );
      case oai.ReasoningSummaryTextDeltaEvent(
        :final itemId,
        :final outputIndex,
        :final summaryIndex,
        :final delta,
      ):
        block = AIChatMessageReasoningBlock(
          reasoning: delta,
          id: itemId ?? 'openai-response:$responseId:$outputIndex',
          index: _responseBlockIndex(outputIndex, summaryIndex),
          providerData: {
            'openai': {'event': event.toJson()},
          },
        );
      case oai.RefusalDeltaEvent(:final delta):
        return ChatResult(
          id: responseId ?? '',
          output: AIChatMessage.withBlocks(
            contentBlocks: [
              AIChatMessageNonStandardBlock(
                value: event.toJson(),
                id:
                    event.itemId ??
                    'openai-response:$responseId:${event.outputIndex}',
                index: _responseBlockIndex(
                  event.outputIndex,
                  event.contentIndex,
                ),
                providerData: {
                  'openai': {'event': event.toJson()},
                },
              ),
            ],
          ),
          finishReason: FinishReason.unspecified,
          metadata: {'refusal': delta},
          usage: _mapResponseUsage(usage),
          streaming: true,
        );
      case oai.ResponseCompletedEvent(:final response):
        final result = response.toChatResult();
        return ChatResult(
          id: result.id,
          output: const AIChatMessage.withBlocks(contentBlocks: []),
          finishReason: result.finishReason,
          metadata: result.metadata,
          usage: result.usage,
          streaming: true,
        );
      default:
        // Skip events with no content (response.created, response.in_progress, etc.)
        return null;
    }

    return ChatResult(
      id: responseId ?? '',
      output: AIChatMessage.withBlocks(
        contentBlocks: [block],
        legacyContent: block is AIChatMessageTextBlock
            ? block.legacyContent
            : '',
      ),
      finishReason: _mapStreamFinishReason(status),
      metadata: const {},
      usage: _mapResponseUsage(usage),
      streaming: true,
    );
  }
}

List<AIChatMessageContentBlock> _mapOpenAIOutputItems(
  final List<oai.OutputItem> items,
) {
  final blocks = <AIChatMessageContentBlock>[];
  for (final (outputIndex, item) in items.indexed) {
    final rawItem = item.toJson();
    final baseProviderData = <String, dynamic>{
      'openai': {'outputItem': rawItem, 'outputIndex': outputIndex},
    };
    switch (item) {
      case final oai.MessageOutputItem message:
        for (final (contentIndex, content) in message.content.indexed) {
          final providerData = <String, dynamic>{
            'openai': {
              'outputItem': rawItem,
              'outputIndex': outputIndex,
              'contentIndex': contentIndex,
            },
          };
          final id = '${message.id}:$contentIndex';
          final index = _responseBlockIndex(outputIndex, contentIndex);
          blocks.add(switch (content) {
            final oai.OutputTextContent text => AIChatMessageTextBlock(
              text: text.text,
              id: id,
              index: index,
              providerData: providerData,
            ),
            final oai.ReasoningTextContent reasoning =>
              AIChatMessageReasoningBlock(
                reasoning: reasoning.text,
                id: id,
                index: index,
                providerData: providerData,
              ),
            final oai.SummaryTextContent summary => AIChatMessageReasoningBlock(
              reasoning: summary.text,
              id: id,
              index: index,
              providerData: providerData,
            ),
            final oai.OutputContent other => AIChatMessageNonStandardBlock(
              value: other.toJson(),
              id: id,
              index: index,
              providerData: providerData,
            ),
          });
        }
      case final oai.FunctionCallOutputItemResponse functionCall:
        blocks.add(
          AIChatMessageToolCall(
            id: functionCall.callId,
            index: outputIndex,
            name: functionCall.name,
            argumentsRaw: functionCall.arguments,
            arguments: _decodeArguments(functionCall.arguments),
            providerData: baseProviderData,
          ),
        );
      case final oai.ReasoningItem reasoning:
        final reasoningText = [
          ...?reasoning.content?.map((content) => content['text']),
          ...reasoning.summary.map((summary) => summary.text),
        ].whereType<String>().join();
        blocks.add(
          AIChatMessageReasoningBlock(
            reasoning: reasoningText,
            id: reasoning.id,
            index: outputIndex,
            providerData: baseProviderData,
          ),
        );
      case oai.OutputItem():
        final type = rawItem['type'] as String? ?? 'unknown';
        blocks.add(
          type.endsWith('_output')
              ? AIChatMessageServerToolResult(
                  id: rawItem['id'] as String? ?? 'openai:$outputIndex',
                  index: outputIndex,
                  toolCallId:
                      rawItem['call_id'] as String? ??
                      rawItem['id'] as String? ??
                      'openai:$outputIndex',
                  name: type,
                  result: rawItem,
                  providerData: baseProviderData,
                )
              : AIChatMessageServerToolCall(
                  id: rawItem['id'] as String? ?? 'openai:$outputIndex',
                  index: outputIndex,
                  name: type,
                  argumentsRaw: jsonEncode(rawItem),
                  arguments: rawItem,
                  providerData: baseProviderData,
                ),
        );
    }
  }
  return blocks;
}

Map<String, dynamic> _decodeArguments(final String raw) {
  try {
    return raw.isEmpty
        ? const {}
        : (jsonDecode(raw) as Map).cast<String, dynamic>();
  } on Object {
    return const {};
  }
}

Map<String, dynamic>? _openAIOutputItem(
  final AIChatMessageContentBlock block,
) => switch (block.providerData['openai']) {
  {'outputItem': final Map<Object?, Object?> item} =>
    item.cast<String, dynamic>(),
  _ => null,
};

int _responseBlockIndex(final int outputIndex, final int contentIndex) =>
    outputIndex * 100000 + contentIndex;

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
      final ChatToolChoiceForced t => oai.ResponseToolChoice.function(
        name: t.name,
      ),
    };
  }
}

extension ChatOpenAIResponsesResponseFormatMapper
    on ChatOpenAIResponsesResponseFormat {
  oai.TextConfig toTextConfig() {
    return switch (this) {
      ChatOpenAIResponsesResponseFormatText() => const oai.TextConfig(
        format: oai.PlainTextFormat(),
      ),
      ChatOpenAIResponsesResponseFormatJsonObject() => const oai.TextConfig(
        format: oai.JsonObjectFormat(),
      ),
      final ChatOpenAIResponsesResponseFormatJsonSchema res => oai.TextConfig(
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
    ChatOpenAIResponsesReasoningEffort.low => const oai.ReasoningConfig(
      effort: oai.ReasoningEffort.low,
    ),
    ChatOpenAIResponsesReasoningEffort.medium => const oai.ReasoningConfig(
      effort: oai.ReasoningEffort.medium,
    ),
    ChatOpenAIResponsesReasoningEffort.high => const oai.ReasoningConfig(
      effort: oai.ReasoningEffort.high,
    ),
  };
}

extension ChatOpenAIResponsesServiceTierMapper
    on ChatOpenAIResponsesServiceTier {
  oai.ServiceTier toServiceTier() => switch (this) {
    ChatOpenAIResponsesServiceTier.auto => oai.ServiceTier.auto,
    ChatOpenAIResponsesServiceTier.vDefault => oai.ServiceTier.defaultTier,
  };
}

extension ChatOpenAIResponsesTruncationMapper on ChatOpenAIResponsesTruncation {
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
