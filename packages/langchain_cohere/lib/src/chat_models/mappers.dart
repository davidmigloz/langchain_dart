// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';

import '../client/client.dart';

extension ChatMessageListMapper on List<ChatMessage> {
  List<CohereMessage> toCohereMessages() {
    return map(_mapMessage).toList(growable: false);
  }

  CohereMessage _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => CohereMessage.system(msg.content),
      final HumanChatMessage msg => CohereMessage.user(msg.contentAsString),
      final AIChatMessage msg =>
        msg.toolCalls.isNotEmpty
            ? CohereMessage.assistant(
                msg.content.isNotEmpty ? msg.content : null,
                toolCalls: msg.toolCalls
                    .map(_mapToolCall)
                    .toList(growable: false),
              )
            : CohereMessage.assistant(msg.content),
      final ToolChatMessage msg => CohereMessage.tool(
        toolCallId: msg.toolCallId,
        content: msg.content,
      ),
      CustomChatMessage() => throw UnsupportedError(
        'Cohere does not support custom messages',
      ),
    };
  }

  CohereToolCall _mapToolCall(final AIChatMessageToolCall toolCall) {
    return CohereToolCall(
      id: toolCall.id,
      function: CohereFunctionCall(
        name: toolCall.name,
        arguments: json.encode(toolCall.arguments),
      ),
    );
  }
}

extension ChatToolListMapper on List<ToolSpec> {
  List<CohereTool> toCohereTools() {
    return map(_mapTool).toList(growable: false);
  }

  CohereTool _mapTool(final ToolSpec tool) {
    return CohereTool(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    );
  }
}

extension ChatToolChoiceMapper on ChatToolChoice {
  /// Maps a [ChatToolChoice] to Cohere's `tool_choice` parameter
  /// (`NONE` or `REQUIRED`).
  ///
  /// Returns `null` for [ChatToolChoiceAuto], which is Cohere's default
  /// behavior when tools are provided.
  String? toCohereToolChoice() {
    return switch (this) {
      ChatToolChoiceNone() => 'NONE',
      ChatToolChoiceAuto() => null,
      ChatToolChoiceRequired() => 'REQUIRED',
      ChatToolChoiceForced() => throw UnsupportedError(
        'Cohere does not support forcing the model to call a specific tool',
      ),
    };
  }
}

extension ChatResultMapper on CohereChatResponse {
  ChatResult toChatResult({required final String model}) {
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: text ?? '',
        toolCalls: toolCalls.map(_mapToolCall).toList(growable: false),
      ),
      finishReason: mapCohereFinishReason(finishReason),
      metadata: {'model': model, if (toolPlan != null) 'tool_plan': toolPlan},
      usage: usage?.toLanguageModelUsage() ?? const LanguageModelUsage(),
    );
  }

  AIChatMessageToolCall _mapToolCall(final CohereToolCall toolCall) {
    var args = <String, dynamic>{};
    try {
      final arguments = toolCall.function.arguments;
      if (arguments.isNotEmpty) {
        args = json.decode(arguments) as Map<String, dynamic>;
      }
    } catch (_) {}
    return AIChatMessageToolCall(
      id: toolCall.id,
      name: toolCall.function.name,
      argumentsRaw: toolCall.function.arguments,
      arguments: args,
    );
  }
}

extension CohereUsageMapper on CohereUsage {
  LanguageModelUsage toLanguageModelUsage() {
    return LanguageModelUsage(
      promptTokens: inputTokens,
      responseTokens: outputTokens,
      totalTokens: inputTokens != null && outputTokens != null
          ? inputTokens! + outputTokens!
          : null,
    );
  }
}

FinishReason mapCohereFinishReason(final String? reason) => switch (reason) {
  'COMPLETE' => FinishReason.stop,
  'STOP_SEQUENCE' => FinishReason.stop,
  'MAX_TOKENS' => FinishReason.length,
  'TOOL_CALL' => FinishReason.toolCalls,
  _ => FinishReason.unspecified,
};
