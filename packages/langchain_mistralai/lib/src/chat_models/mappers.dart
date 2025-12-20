// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:mistralai_dart/mistralai_dart.dart' as mistral;

extension ChatMessageListMapper on List<ChatMessage> {
  List<mistral.ChatCompletionMessage> toChatCompletionMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  mistral.ChatCompletionMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => mistral.ChatCompletionMessage(
        role: mistral.ChatCompletionMessageRole.system,
        content: msg.content,
      ),
      final HumanChatMessage msg => mistral.ChatCompletionMessage(
        role: mistral.ChatCompletionMessageRole.user,
        content: msg.contentAsString,
      ),
      final AIChatMessage msg => mistral.ChatCompletionMessage(
        role: mistral.ChatCompletionMessageRole.assistant,
        content: msg.content,
        toolCalls: msg.toolCalls.isNotEmpty
            ? msg.toolCalls.map(_mapToolCall).toList(growable: false)
            : null,
      ),
      final ToolChatMessage msg => mistral.ChatCompletionMessage(
        role: mistral.ChatCompletionMessageRole.tool,
        content: msg.content,
        toolCallId: msg.toolCallId,
        name: null,
      ),
      CustomChatMessage() => throw UnsupportedError(
        'Mistral AI does not support custom messages',
      ),
    };
  }

  mistral.ToolCall _mapToolCall(final AIChatMessageToolCall toolCall) {
    return mistral.ToolCall(
      id: toolCall.id,
      type: mistral.ToolType.function,
      function: mistral.FunctionCall(
        name: toolCall.name,
        arguments: json.encode(toolCall.arguments),
      ),
    );
  }
}

extension ChatToolListMapper on List<ToolSpec> {
  List<mistral.Tool> toMistralTools() {
    return map(_mapTool).toList(growable: false);
  }

  mistral.Tool _mapTool(final ToolSpec tool) {
    return mistral.Tool(
      type: mistral.ToolType.function,
      function: mistral.FunctionDefinition(
        name: tool.name,
        description: tool.description,
        parameters: tool.inputJsonSchema,
      ),
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  mistral.ChatCompletionToolChoice toMistralToolChoice() {
    return switch (this) {
      ChatToolChoiceNone() =>
        const mistral.ChatCompletionToolChoice.enumeration(
          mistral.ChatCompletionToolChoiceOption.none,
        ),
      ChatToolChoiceAuto() =>
        const mistral.ChatCompletionToolChoice.enumeration(
          mistral.ChatCompletionToolChoiceOption.auto,
        ),
      ChatToolChoiceRequired() =>
        const mistral.ChatCompletionToolChoice.enumeration(
          mistral.ChatCompletionToolChoiceOption.any,
        ),
      final ChatToolChoiceForced t =>
        mistral.ChatCompletionToolChoice.toolChoiceTool(
          mistral.ToolChoiceTool(
            type: mistral.ToolType.function,
            function: mistral.ToolChoiceToolFunction(name: t.name),
          ),
        ),
    };
  }
}

extension ChatResultMapper on mistral.ChatCompletionResponse {
  ChatResult toChatResult({final bool streaming = false}) {
    final choice = choices.first;
    final message = choice.message;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: message.content ?? '',
        toolCalls:
            message.toolCalls
                ?.map(_mapResponseToolCall)
                .toList(growable: false) ??
            const [],
      ),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
      streaming: streaming,
    );
  }

  AIChatMessageToolCall _mapResponseToolCall(final mistral.ToolCall toolCall) {
    var args = <String, dynamic>{};
    try {
      args = toolCall.function.arguments.isEmpty
          ? {}
          : json.decode(toolCall.function.arguments);
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      name: toolCall.function.name,
      argumentsRaw: toolCall.function.arguments,
      arguments: args,
    );
  }

  LanguageModelUsage _mapUsage(final mistral.ChatCompletionUsage usage) {
    return LanguageModelUsage(
      promptTokens: usage.promptTokens,
      responseTokens: usage.completionTokens,
      totalTokens: usage.totalTokens,
    );
  }
}

/// Mapper for [mistral.ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on mistral.ChatCompletionStreamResponse {
  /// Converts a [mistral.ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult() {
    final choice = choices.first;
    final delta = choice.delta;
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: delta.content ?? '',
        toolCalls:
            delta.toolCalls?.map(_mapStreamToolCall).toList(growable: false) ??
            const [],
      ),
      finishReason: _mapFinishReason(choice.finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapStreamUsage(usage),
      streaming: true,
    );
  }

  AIChatMessageToolCall _mapStreamToolCall(final mistral.ToolCall toolCall) {
    var args = <String, dynamic>{};
    try {
      args = json.decode(toolCall.function.arguments);
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      name: toolCall.function.name,
      argumentsRaw: toolCall.function.arguments,
      arguments: args,
    );
  }

  LanguageModelUsage _mapStreamUsage(final mistral.ChatCompletionUsage? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

FinishReason _mapFinishReason(
  final mistral.ChatCompletionFinishReason? reason,
) => switch (reason) {
  mistral.ChatCompletionFinishReason.stop => FinishReason.stop,
  mistral.ChatCompletionFinishReason.length => FinishReason.length,
  mistral.ChatCompletionFinishReason.modelLength => FinishReason.length,
  mistral.ChatCompletionFinishReason.error => FinishReason.unspecified,
  mistral.ChatCompletionFinishReason.toolCalls => FinishReason.toolCalls,
  null => FinishReason.unspecified,
};
