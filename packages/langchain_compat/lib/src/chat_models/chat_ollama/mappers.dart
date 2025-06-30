// ignore_for_file: public_member_api_docs
import 'package:collection/collection.dart';
import 'package:ollama_dart/ollama_dart.dart' as o;

import '../../../chat_models.dart';
import '../../../language_models.dart' show FinishReason, LanguageModelUsage;
import 'types.dart';

/// Creates a [o.GenerateChatCompletionRequest] from the given input.
o.GenerateChatCompletionRequest generateChatCompletionRequest(
  List<ChatMessage> messages, {
  required ChatOllamaOptions? options,
  required ChatOllamaOptions defaultOptions,
  bool stream = false,
}) => o.GenerateChatCompletionRequest(
  model: options?.model ?? defaultOptions.model ?? ChatOllama.defaultModel,
  messages: messages.toMessages(),
  format: options?.format ?? defaultOptions.format,
  keepAlive: options?.keepAlive ?? defaultOptions.keepAlive,
  tools: null, // Tool mapping omitted for brevity
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
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    frequencyPenalty:
        options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    mirostat: options?.mirostat ?? defaultOptions.mirostat,
    mirostatTau: options?.mirostatTau ?? defaultOptions.mirostatTau,
    mirostatEta: options?.mirostatEta ?? defaultOptions.mirostatEta,
    penalizeNewline: options?.penalizeNewline ?? defaultOptions.penalizeNewline,
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

extension OllamaChatMessagesMapper on List<ChatMessage> {
  List<o.Message> toMessages() =>
      map(_mapMessage).expand((msg) => msg).toList(growable: false);

  List<o.Message> _mapMessage(ChatMessage msg) => switch (msg) {
    final SystemChatMessage msg => [
      o.Message(role: o.MessageRole.system, content: msg.content),
    ],
    final HumanChatMessage msg => _mapHumanMessage(msg),
    final AIChatMessage msg => _mapAIMessage(msg),
    final ToolChatMessage msg => [
      o.Message(role: o.MessageRole.tool, content: msg.content),
    ],
    CustomChatMessage() => throw UnsupportedError(
      'Ollama does not support custom messages',
    ),
  };

  List<o.Message> _mapHumanMessage(HumanChatMessage message) =>
      switch (message.content) {
        final ChatMessageContentText c => [
          o.Message(role: o.MessageRole.user, content: c.text),
        ],
        final ChatMessageContentImage c => [
          o.Message(role: o.MessageRole.user, content: c.data),
        ],
        final ChatMessageContentMultiModal c => _mapContentMultiModal(c),
      };

  List<o.Message> _mapContentMultiModal(ChatMessageContentMultiModal content) {
    final parts = content.parts.groupListsBy((p) => p.runtimeType);

    if ((parts[ChatMessageContentMultiModal]?.length ?? 0) > 0) {
      throw UnsupportedError(
        'Cannot have multimodal content in multimodal content',
      );
    }

    if ((parts[ChatMessageContentText]?.length ?? 0) == 1) {
      return [
        o.Message(
          role: o.MessageRole.user,
          content:
              (parts[ChatMessageContentText]!.first as ChatMessageContentText)
                  .text,
          images: parts[ChatMessageContentImage]
              ?.map((p) => (p as ChatMessageContentImage).data)
              .toList(growable: false),
        ),
      ];
    }

    return content.parts
        .map(
          (p) => switch (p) {
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

  List<o.Message> _mapAIMessage(AIChatMessage message) => [
    o.Message(
      role: o.MessageRole.assistant,
      content: message.content,
      toolCalls: null,
    ),
  ];
}

extension ChatResultMapper on o.GenerateChatCompletionResponse {
  ChatResult toChatResult(String id, {bool streaming = false}) => ChatResult(
    id: id,
    output: AIChatMessage(content: message.content, toolCalls: const []),
    finishReason: FinishReason.unspecified,
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
    usage: const LanguageModelUsage(),
    streaming: streaming,
  );
}
