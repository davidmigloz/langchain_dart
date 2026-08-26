// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/tools.dart';
import 'package:ollama_dart/ollama_dart.dart' as o;

import '../../llms/types.dart';
import '../../utils.dart';
import 'chat_ollama.dart';
import 'types.dart';

extension _OllamaResponseFormatChatMapper on OllamaResponseFormat {
  o.ResponseFormat toChatFormat() {
    return switch (this) {
      OllamaResponseFormat.json => const o.JsonFormat(),
    };
  }
}

extension _OllamaThinkingLevelChatMapper on OllamaThinkingLevel {
  o.ThinkValue toThinkValue() {
    return switch (this) {
      OllamaThinkingLevel.high => const o.ThinkWithLevel(o.ThinkLevel.high),
      OllamaThinkingLevel.medium => const o.ThinkWithLevel(o.ThinkLevel.medium),
      OllamaThinkingLevel.low => const o.ThinkWithLevel(o.ThinkLevel.low),
    };
  }
}

/// Creates a [ChatRequest] from the given input.
o.ChatRequest createChatRequest(
  final List<ChatMessage> messages, {
  required final ChatOllamaOptions? options,
  required final ChatOllamaOptions defaultOptions,
  final bool stream = false,
}) {
  return o.ChatRequest(
    model: options?.model ?? defaultOptions.model ?? ChatOllama.defaultModel,
    messages: messages.toMessages(),
    format: (options?.format ?? defaultOptions.format)?.toChatFormat(),
    keepAlive: mapKeepAlive(options?.keepAlive ?? defaultOptions.keepAlive),
    think: (options?.think ?? defaultOptions.think)?.toThinkValue(),
    tools: _mapTools(
      tools: options?.tools ?? defaultOptions.tools,
      toolChoice: options?.toolChoice ?? defaultOptions.toolChoice,
    ),
    stream: stream,
    options: o.ModelOptions(
      seed: options?.seed ?? defaultOptions.seed,
      numPredict: options?.numPredict ?? defaultOptions.numPredict,
      topK: options?.topK ?? defaultOptions.topK,
      topP: options?.topP ?? defaultOptions.topP,
      minP: options?.minP ?? defaultOptions.minP,
      temperature: options?.temperature ?? defaultOptions.temperature,
      stop: mapStopSequences(options?.stop ?? defaultOptions.stop),
      numCtx: options?.numCtx ?? defaultOptions.numCtx,
      numKeep: options?.numKeep ?? defaultOptions.numKeep,
      tfsZ: options?.tfsZ ?? defaultOptions.tfsZ,
      typicalP: options?.typicalP ?? defaultOptions.typicalP,
      repeatLastN: options?.repeatLastN ?? defaultOptions.repeatLastN,
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
      numa: options?.numa ?? defaultOptions.numa,
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

List<o.ToolDefinition>? _mapTools({
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

o.ToolDefinition _mapTool(final ToolSpec tool) {
  return o.ToolDefinition(
    function: o.ToolFunction(
      name: tool.name,
      description: tool.description,
      parameters: tool.inputJsonSchema,
    ),
  );
}

extension OllamaChatMessagesMapper on List<ChatMessage> {
  List<o.ChatMessage> toMessages() {
    return map(_mapMessage).expand((final msg) => msg).toList(growable: false);
  }

  List<o.ChatMessage> _mapMessage(final ChatMessage msg) {
    return switch (msg) {
      final SystemChatMessage msg => [o.ChatMessage.system(msg.content)],
      final HumanChatMessage msg => _mapHumanMessage(msg),
      final AIChatMessage msg => _mapAIMessage(msg),
      final ToolChatMessage msg => [o.ChatMessage.tool(msg.content)],
      CustomChatMessage() => throw UnsupportedError(
        'Ollama does not support custom messages',
      ),
    };
  }

  List<o.ChatMessage> _mapHumanMessage(final HumanChatMessage message) {
    return switch (message.content) {
      final ChatMessageContentText c => [o.ChatMessage.user(c.text)],
      final ChatMessageContentImage c => [o.ChatMessage.user(c.data)],
      final ChatMessageContentMultiModal c => _mapContentMultiModal(c),
    };
  }

  List<o.ChatMessage> _mapContentMultiModal(
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
        o.ChatMessage.user(
          (parts[ChatMessageContentText]!.first as ChatMessageContentText).text,
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
            final ChatMessageContentText c => o.ChatMessage.user(c.text),
            final ChatMessageContentImage c => o.ChatMessage.user(c.data),
            ChatMessageContentMultiModal() => throw UnsupportedError(
              'Cannot have multimodal content in multimodal content',
            ),
          },
        )
        .toList(growable: false);
  }

  List<o.ChatMessage> _mapAIMessage(final AIChatMessage message) {
    final reasoning = message.content
        .whereType<AIChatMessageReasoningBlock>()
        .map((block) => block.reasoning)
        .join();
    final content = message.content
        .whereType<AIChatMessageTextBlock>()
        .map((block) => block.text)
        .join();
    final images = message.content
        .whereType<AIChatMessageMediaBlock>()
        .map((block) => block.data)
        .toList(growable: false);
    return [
      o.ChatMessage(
        role: o.MessageRole.assistant,
        content: content,
        thinking: reasoning.isNotEmpty ? reasoning : null,
        images: images.isNotEmpty ? images : null,
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

extension ChatResultMapper on o.ChatResponse {
  ChatResult toChatResult(final String id, {final bool streaming = false}) {
    final contentBlocks = _mapOllamaMessage(message, responseId: id);
    return ChatResult(
      id: id,
      output: AIChatMessage(content: contentBlocks),
      finishReason: _mapFinishReason(doneReason),
      metadata: {
        'model': model,
        'remote_model': remoteModel,
        'remote_host': remoteHost,
        'created_at': createdAt,
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
        'logprobs': logprobs?.map((item) => item.toJson()).toList(),
      },
      usage: _mapUsage(),
      streaming: streaming,
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

  FinishReason _mapFinishReason(final o.DoneReason? reason) => switch (reason) {
    o.DoneReason.stop => FinishReason.stop,
    o.DoneReason.length => FinishReason.length,
    o.DoneReason.load => FinishReason.unspecified,
    o.DoneReason.unload => FinishReason.unspecified,
    null => FinishReason.unspecified,
  };
}

extension ChatStreamResultMapper on o.ChatStreamEvent {
  ChatResult toChatResult(final String id, {final bool streaming = false}) {
    final contentBlocks = _mapOllamaMessage(message, responseId: id);
    return ChatResult(
      id: id,
      output: AIChatMessage(content: contentBlocks),
      finishReason: doneReason != null
          ? _mapOllamaFinishReason(doneReason)
          : (done ?? false)
          ? FinishReason.stop
          : FinishReason.unspecified,
      metadata: {
        'model': model,
        'remote_model': remoteModel,
        'remote_host': remoteHost,
        'created_at': createdAt,
        'done': done,
        'total_duration': totalDuration,
        'load_duration': loadDuration,
        'prompt_eval_count': promptEvalCount,
        'prompt_eval_duration': promptEvalDuration,
        'eval_count': evalCount,
        'eval_duration': evalDuration,
        'logprobs': logprobs?.map((item) => item.toJson()).toList(),
      },
      usage: LanguageModelUsage(
        promptTokens: promptEvalCount,
        responseTokens: evalCount,
        totalTokens: (promptEvalCount != null || evalCount != null)
            ? (promptEvalCount ?? 0) + (evalCount ?? 0)
            : null,
      ),
      streaming: streaming,
    );
  }
}

List<AIChatMessageContentBlock> _mapOllamaMessage(
  final o.ChatResponseMessage? message, {
  required final String responseId,
}) {
  if (message == null) return const [];
  final rawMessage = message.toJson();
  final providerData = {
    'ollama': {'message': rawMessage},
  };
  return [
    if ((message.thinking ?? '').isNotEmpty)
      AIChatMessageReasoningBlock(
        reasoning: message.thinking!,
        id: 'ollama:$responseId:thinking',
        index: 0,
        providerData: providerData,
      ),
    if ((message.content ?? '').isNotEmpty)
      AIChatMessageTextBlock(
        text: message.content!,
        id: 'ollama:$responseId:content',
        index: 1,
        providerData: providerData,
      ),
    for (final (index, image) in (message.images ?? const <String>[]).indexed)
      AIChatMessageMediaBlock(
        data: image,
        id: 'ollama:$responseId:image:$index',
        index: index + 2,
        providerData: providerData,
      ),
    for (final (index, toolCall)
        in (message.toolCalls ?? const <o.ToolCall>[]).indexed)
      _mapOllamaToolCall(toolCall, responseId: responseId, index: index),
  ];
}

AIChatMessageToolCall _mapOllamaToolCall(
  final o.ToolCall toolCall, {
  required final String responseId,
  required final int index,
}) {
  final arguments = toolCall.function?.arguments ?? const <String, dynamic>{};
  return AIChatMessageToolCall(
    id: 'ollama:$responseId:tool:$index',
    index: index,
    name: toolCall.function?.name ?? '',
    argumentsRaw: json.encode(arguments),
    arguments: arguments,
    providerData: {
      'ollama': {'toolCall': toolCall.toJson()},
    },
  );
}

FinishReason _mapOllamaFinishReason(final o.DoneReason? reason) =>
    switch (reason) {
      o.DoneReason.stop => FinishReason.stop,
      o.DoneReason.length => FinishReason.length,
      o.DoneReason.load => FinishReason.unspecified,
      o.DoneReason.unload => FinishReason.unspecified,
      null => FinishReason.unspecified,
    };
