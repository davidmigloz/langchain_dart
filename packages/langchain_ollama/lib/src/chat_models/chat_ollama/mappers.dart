// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:ollama_dart/ollama_dart.dart' as o;
import 'package:uuid/uuid.dart';

import '../../llms/types.dart';
import 'chat_ollama.dart';
import 'types.dart';

extension _OllamaResponseFormatChatMapper on OllamaResponseFormat {
  o.GenerateChatCompletionRequestFormat? toChatResponseFormat() {
    final format = o.ResponseFormat.values
        .where((final f) => f.name.toLowerCase() == name.toLowerCase())
        .firstOrNull;
    if (format == null) return null;
    return o.GenerateChatCompletionRequestFormat.json(
      o.GenerateChatCompletionRequestFormatEnum.values.firstWhere(
        (final e) => e.name == format.name,
      ),
    );
  }
}

extension _OllamaThinkingLevelChatMapper on OllamaThinkingLevel {
  o.GenerateChatCompletionRequestThink toThinkRequest() {
    return o.GenerateChatCompletionRequestThink.level(
      o.GenerateChatCompletionRequestThinkEnum.values.firstWhere(
        (final e) => e.name == name,
      ),
    );
  }
}

/// Creates a [GenerateChatCompletionRequest] from the given input.
o.GenerateChatCompletionRequest generateChatCompletionRequest(
  final List<ChatMessage> messages, {
  required final ChatOllamaOptions? options,
  required final ChatOllamaOptions defaultOptions,
  final bool stream = false,
}) {
  return o.GenerateChatCompletionRequest(
    model: options?.model ?? defaultOptions.model ?? ChatOllama.defaultModel,
    messages: messages.toMessages(),
    format: (options?.format ?? defaultOptions.format)?.toChatResponseFormat(),
    keepAlive: options?.keepAlive ?? defaultOptions.keepAlive,
    think: (options?.think ?? defaultOptions.think)?.toThinkRequest(),
    tools: _mapTools(
      tools: options?.tools ?? defaultOptions.tools,
      toolChoice: options?.toolChoice ?? defaultOptions.toolChoice,
    ),
    stream: stream,
    options: o.RequestOptions(
      numKeep: options?.numKeep ?? defaultOptions.numKeep,
      seed: options?.seed ?? defaultOptions.seed,
      numPredict: options?.numPredict ?? defaultOptions.numPredict,
      topK: options?.topK ?? defaultOptions.topK,
      topP: options?.topP ?? defaultOptions.topP,
      minP: options?.minP ?? defaultOptions.minP,
      tfsZ: options?.tfsZ ?? defaultOptions.tfsZ,
      typicalP: options?.typicalP ?? defaultOptions.typicalP,
      repeatLastN: options?.repeatLastN ?? defaultOptions.repeatLastN,
      temperature: options?.temperature ?? defaultOptions.temperature,
      repeatPenalty: options?.repeatPenalty ?? defaultOptions.repeatPenalty,
      presencePenalty:
          options?.presencePenalty ?? defaultOptions.presencePenalty,
      frequencyPenalty:
          options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
      mirostat: options?.mirostat ?? defaultOptions.mirostat,
      mirostatTau: options?.mirostatTau ?? defaultOptions.mirostatTau,
      mirostatEta: options?.mirostatEta ?? defaultOptions.mirostatEta,
      penalizeNewline:
          options?.penalizeNewline ?? defaultOptions.penalizeNewline,
      stop: options?.stop ?? defaultOptions.stop,
      numa: options?.numa ?? defaultOptions.numa,
      numCtx: options?.numCtx ?? defaultOptions.numCtx,
      numBatch: options?.numBatch ?? defaultOptions.numBatch,
      numGpu: options?.numGpu ?? defaultOptions.numGpu,
      mainGpu: options?.mainGpu ?? defaultOptions.mainGpu,
      lowVram: options?.lowVram ?? defaultOptions.lowVram,
      f16Kv: options?.f16KV ?? defaultOptions.f16KV,
      logitsAll: options?.logitsAll ?? defaultOptions.logitsAll,
      vocabOnly: options?.vocabOnly ?? defaultOptions.vocabOnly,
      useMmap: options?.useMmap ?? defaultOptions.useMmap,
      useMlock: options?.useMlock ?? defaultOptions.useMlock,
      numThread: options?.numThread ?? defaultOptions.numThread,
    ),
  );
}

List<o.Tool>? _mapTools({
  final List<ToolSpec>? tools,
  final ChatToolChoice? toolChoice,
}) {
  if (tools == null || tools.isEmpty) {
    return null;
  }

  return switch (toolChoice) {
    ChatToolChoiceNone() => null,
    ChatToolChoiceAuto() ||
    ChatToolChoiceRequired() ||
    null => tools.map(_mapTool).toList(growable: false),
    final ChatToolChoiceForced f => [
      _mapTool(tools.firstWhere((t) => t.name == f.name)),
    ],
  };
}

o.Tool _mapTool(final ToolSpec tool) {
  return o.Tool(
    function: o.ToolFunction(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    ),
  );
}

extension OllamaChatMessagesMapper on List<ChatMessage> {
  List<o.Message> toMessages() {
    return map(_mapMessage).expand((final msg) => msg).toList(growable: false);
  }

  List<o.Message> _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => [
        o.Message(
          role: o.MessageRole.system,
          content: msg.content,
        ),
      ],
      final HumanChatMessage msg => _mapHumanMessage(msg),
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => [
        o.Message(
          role: o.MessageRole.tool,
          content: msg.content,
        ),
      ],
      CustomChatMessage() => throw UnsupportedError(
        'Ollama does not support custom messages',
      ),
    };
  }

  List<o.Message> _mapHumanMessage(final HumanChatMessage message) {
    return switch (message.content) {
      final ChatMessageContentText c => [
        o.Message(
          role: o.MessageRole.user,
          content: c.text,
        ),
      ],
      final ChatMessageContentImage c => [
        o.Message(
          role: o.MessageRole.user,
          content: c.data,
        ),
      ],
      final ChatMessageContentMultiModal c => _mapContentMultiModal(c),
    };
  }

  List<o.Message> _mapContentMultiModal(
    final ChatMessageContentMultiModal content,
  ) {
    final parts = content.parts.groupListsBy((final p) => p.runtimeType);

    if ((parts[ChatMessageContentMultiModal]?.length ?? 0) > 0) {
      throw UnsupportedError(
        'Cannot have multimodal content in multimodal content',
      );
    }

    // If there's only one text part and the rest are images, then we combine them in one message
    if ((parts[ChatMessageContentText]?.length ?? 0) == 1) {
      return [
        o.Message(
          role: o.MessageRole.user,
          content:
              (parts[ChatMessageContentText]!.first as ChatMessageContentText)
                  .text,
          images: parts[ChatMessageContentImage]
              ?.map((final p) => (p as ChatMessageContentImage).data)
              .toList(growable: false),
        ),
      ];
    }

    // Otherwise, we return the parts as separate messages
    return content.parts
        .map(
          (final p) => switch (p) {
            final ChatMessageContentText c => o.Message(
              role: o.MessageRole.user,
              content: c.text,
            ),
            final ChatMessageContentImage c => o.Message(
              role: o.MessageRole.user,
              content: c.data,
            ),
            ChatMessageContentMultiModal() => throw UnsupportedError(
              'Cannot have multimodal content in multimodal content',
            ),
          },
        )
        .toList(growable: false);
  }

  List<o.Message> _mapAIMessage(final AIChatMessage message) {
    return [
      o.Message(
        role: o.MessageRole.assistant,
        content: message.content,
        toolCalls: message.toolCalls.isNotEmpty
            ? message.toolCalls.map(_mapToolCall).toList(growable: false)
            : null,
      ),
    ];
  }

  o.ToolCall _mapToolCall(final AIChatMessageToolCall toolCall) {
    return o.ToolCall(
      function: o.ToolCallFunction(
        name: toolCall.name,
        arguments: toolCall.arguments,
      ),
    );
  }
}

extension ChatResultMapper on o.GenerateChatCompletionResponse {
  ChatResult toChatResult(final String id, {final bool streaming = false}) {
    return ChatResult(
      id: id,
      output: AIChatMessage(
        content: message.content,
        toolCalls:
            message.toolCalls?.map(_mapToolCall).toList(growable: false) ??
            const [],
      ),
      finishReason: _mapFinishReason(doneReason),
      metadata: {
        'model': model,
        'created_at': createdAt,
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
      },
      usage: _mapUsage(),
      streaming: streaming,
    );
  }

  AIChatMessageToolCall _mapToolCall(final o.ToolCall toolCall) {
    return AIChatMessageToolCall(
      id: const Uuid().v4(),
      name: toolCall.function?.name ?? '',
      argumentsRaw: json.encode(toolCall.function?.arguments ?? const {}),
      arguments: toolCall.function?.arguments ?? const {},
    );
  }

  LanguageModelUsage _mapUsage() {
    return LanguageModelUsage(
      promptTokens: promptEvalCount,
      responseTokens: evalCount,
      totalTokens: (promptEvalCount != null || evalCount != null)
          ? (promptEvalCount ?? 0) + (evalCount ?? 0)
          : null,
    );
  }

  FinishReason _mapFinishReason(
    final o.DoneReason? reason,
  ) => switch (reason) {
    o.DoneReason.stop => FinishReason.stop,
    o.DoneReason.length => FinishReason.length,
    o.DoneReason.load => FinishReason.unspecified,
    null => FinishReason.unspecified,
  };
}
