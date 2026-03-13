// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:mistralai_dart/mistralai_dart.dart' as mistral;

extension ChatMessageListMapper on List<ChatMessage> {
  List<mistral.ChatMessage> toChatMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  mistral.ChatMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => mistral.ChatMessage.system(msg.content),
      final HumanChatMessage msg => mistral.ChatMessage.user(
        msg.contentAsString,
      ),
      final AIChatMessage msg =>
        msg.toolCalls.isNotEmpty
            ? mistral.ChatMessage.assistant(
                msg.content.isNotEmpty ? msg.content : null,
                toolCalls: msg.toolCalls
                    .map(_mapToolCall)
                    .toList(growable: false),
              )
            : mistral.ChatMessage.assistant(msg.content),
      final ToolChatMessage msg => mistral.ChatMessage.tool(
        toolCallId: msg.toolCallId,
        content: msg.content,
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
    return mistral.Tool.function(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  mistral.ToolChoice toMistralToolChoice() {
    return switch (this) {
      ChatToolChoiceNone() => mistral.ToolChoice.none,
      ChatToolChoiceAuto() => mistral.ToolChoice.auto,
      ChatToolChoiceRequired() => mistral.ToolChoice.any,
      final ChatToolChoiceForced t => mistral.ToolChoice.function(t.name),
    };
  }
}

extension ChatResultMapper on mistral.ChatCompletionResponse {
  ChatResult toChatResult({final bool streaming = false}) {
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: text ?? '',
        toolCalls: hasToolCalls
            ? toolCalls.map(_mapResponseToolCall).toList(growable: false)
            : const [],
      ),
      finishReason: _mapFinishReason(finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapUsage(usage),
      streaming: streaming,
    );
  }

  AIChatMessageToolCall _mapResponseToolCall(final mistral.ToolCall toolCall) {
    final function = toolCall.function;
    var args = <String, dynamic>{};
    try {
      final arguments = function.arguments;
      if (arguments.isNotEmpty) {
        args = json.decode(arguments);
      }
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      name: function.name,
      argumentsRaw: function.arguments,
      arguments: args,
    );
  }

  LanguageModelUsage _mapUsage(final mistral.UsageInfo? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

/// Mapper for [mistral.ChatCompletionStreamResponse].
extension CreateChatCompletionStreamResponseMapper
    on mistral.ChatCompletionStreamResponse {
  /// Converts a [mistral.ChatCompletionStreamResponse] to a [ChatResult].
  ChatResult toChatResult() {
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: text ?? '',
        toolCalls: hasToolCalls
            ? toolCalls.map(_mapStreamToolCall).toList(growable: false)
            : const [],
      ),
      finishReason: _mapFinishReason(finishReason),
      metadata: {'model': model, 'created': created},
      usage: _mapStreamUsage(usage),
      streaming: true,
    );
  }

  AIChatMessageToolCall _mapStreamToolCall(final mistral.ToolCall toolCall) {
    final function = toolCall.function;
    var args = <String, dynamic>{};
    try {
      final arguments = function.arguments;
      if (arguments.isNotEmpty) {
        args = json.decode(arguments);
      }
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      name: function.name,
      argumentsRaw: function.arguments,
      arguments: args,
    );
  }

  LanguageModelUsage _mapStreamUsage(final mistral.UsageInfo? usage) {
    return LanguageModelUsage(
      promptTokens: usage?.promptTokens,
      responseTokens: usage?.completionTokens,
      totalTokens: usage?.totalTokens,
    );
  }
}

FinishReason _mapFinishReason(final mistral.FinishReason? reason) =>
    switch (reason) {
      mistral.FinishReason.stop => FinishReason.stop,
      mistral.FinishReason.length => FinishReason.length,
      mistral.FinishReason.modelLength => FinishReason.length,
      mistral.FinishReason.error => FinishReason.unspecified,
      mistral.FinishReason.toolCalls => FinishReason.toolCalls,
      mistral.FinishReason.unknown => FinishReason.unspecified,
      null => FinishReason.unspecified,
    };
