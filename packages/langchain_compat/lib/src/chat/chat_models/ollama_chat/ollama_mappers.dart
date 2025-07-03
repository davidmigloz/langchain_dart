import 'package:collection/collection.dart';
import 'package:ollama_dart/ollama_dart.dart' as o;

import '../../../language_models/finish_reason.dart';
import '../../../language_models/language_model_usage.dart';
import '../../tools/tool_spec.dart';
import '../chat_message.dart';
import '../chat_result.dart';
import 'ollama_chat_options.dart';

/// Creates a [o.GenerateChatCompletionRequest] from the given input.
o.GenerateChatCompletionRequest generateChatCompletionRequest(
  List<ChatMessage> messages, {
  required String model,
  required OllamaChatOptions? options,
  required OllamaChatOptions defaultOptions,
  List<ToolSpec>? tools,
  double? temperature,
  bool stream = false,
}) => o.GenerateChatCompletionRequest(
  model: model,
  messages: messages.toMessages(),
  format: options?.format ?? defaultOptions.format,
  keepAlive: options?.keepAlive ?? defaultOptions.keepAlive,
  tools: tools?.toOllamaTools(),
  // Ollama does not currently support toolChoice on the wire, but we pass it
  // for future compatibility.
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
    temperature:
        temperature ?? options?.temperature ?? defaultOptions.temperature,
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

/// Extension on [List<ToolSpec>] to convert to Ollama SDK tool list.
extension OllamaToolListMapper on List<ToolSpec> {
  /// Converts this list of [ToolSpec]s to a list of Ollama SDK [o.Tool]s.
  List<o.Tool> toOllamaTools() => map(
    (tool) => o.Tool(
      type: o.ToolType.function,
      function: o.ToolFunction(
        name: tool.name,
        description: tool.description,
        parameters: tool.inputJsonSchema,
      ),
    ),
  ).toList(growable: false);
}

/// Extension on [List<ChatMessage>] to convert chat messages to Ollama SDK
/// messages.
extension OllamaChatMessagesMapper on List<ChatMessage> {
  /// Converts this list of [ChatMessage]s to a list of Ollama SDK [o.Message]s.
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
      toolCalls: message.toolCalls.isNotEmpty
          ? message.toolCalls.map(_mapToolCall).toList(growable: false)
          : null,
    ),
  ];

  o.ToolCall _mapToolCall(AIChatMessageToolCall toolCall) => o.ToolCall(
    function: o.ToolCallFunction(
      name: toolCall.name,
      arguments: toolCall.arguments,
    ),
  );
}

/// Extension on [o.GenerateChatCompletionResponse] to convert to [ChatResult].
extension ChatResultMapper on o.GenerateChatCompletionResponse {
  /// Converts this [o.GenerateChatCompletionResponse] to a [ChatResult].
  ChatResult toChatResult(String id, {bool streaming = false}) => ChatResult(
    id: id,
    output: AIChatMessage(
      content: message.content,
      toolCalls: message.toolCalls
              ?.map(_mapOllamaToolCall)
              .toList(growable: false) ??
          const [],
    ),
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
  );

  AIChatMessageToolCall _mapOllamaToolCall(o.ToolCall toolCall) {
    final function = toolCall.function;
    if (function == null) {
      return const AIChatMessageToolCall(
        id: '',
        name: '',
        argumentsRaw: '',
        arguments: {},
      );
    }
    return AIChatMessageToolCall(
      id: '', // Ollama does not provide a tool call id in the response
      name: function.name,
      argumentsRaw: function.arguments is String
          ? function.arguments as String
          : function.arguments.toString(),
      arguments: function.arguments,
    );
  }
}
