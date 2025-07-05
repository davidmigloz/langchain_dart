import 'package:openai_dart/openai_dart.dart';
import '../../../language_models/language_models.dart';
import '../../tools/tool.dart';
import '../message.dart' as msg;
import 'openai_chat_options.dart';
import 'openai_message_mappers.dart';

/// Maps OpenAI finish reason to our FinishReason enum
FinishReason mapFinishReason(ChatCompletionFinishReason? reason) {
  if (reason == null) return FinishReason.unspecified;
  
  return switch (reason) {
    ChatCompletionFinishReason.stop => FinishReason.stop,
    ChatCompletionFinishReason.length => FinishReason.length,
    ChatCompletionFinishReason.toolCalls => FinishReason.toolCalls,
    ChatCompletionFinishReason.contentFilter => FinishReason.contentFilter,
    ChatCompletionFinishReason.functionCall => FinishReason.toolCalls,
  };
}

/// Maps OpenAI usage to our LanguageModelUsage
LanguageModelUsage mapUsage(CompletionUsage? usage) {
  if (usage == null) return const LanguageModelUsage();
  
  return LanguageModelUsage(
    promptTokens: usage.promptTokens,
    responseTokens: usage.completionTokens,
    totalTokens: usage.totalTokens,
  );
}

/// Creates a ChatCompletionRequest from the given input
CreateChatCompletionRequest createChatCompletionRequest(
  List<msg.Message> messages, {
  required String modelName,
  required OpenAIChatOptions defaultOptions,
  required bool stream,
  List<Tool>? tools,
  double? temperature,
  OpenAIChatOptions? options,
}) {
  return CreateChatCompletionRequest(
    model: ChatCompletionModel.modelId(modelName),
    messages: messages.toOpenAIMessages(),
    tools: tools?.map((tool) => ChatCompletionTool(
      type: ChatCompletionToolType.function,
      function: FunctionObject(
        name: tool.name,
        description: tool.description,
        parameters: tool.inputSchema.schemaMap as Map<String, dynamic>?,
        strict: null, // Explicitly pass null to override any defaults
      ),
    )).toList(),
    toolChoice: options?.toolChoice ?? defaultOptions.toolChoice,
    responseFormat: options?.responseFormat ?? defaultOptions.responseFormat,
    maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
    n: options?.n ?? defaultOptions.n,
    temperature: temperature ?? options?.temperature ?? defaultOptions.temperature,
    topP: options?.topP ?? defaultOptions.topP,
    stop: (options?.stop ?? defaultOptions.stop) != null
        ? ChatCompletionStop.listString(options?.stop ?? defaultOptions.stop!)
        : null,
    stream: stream,
    user: options?.user ?? defaultOptions.user,
    frequencyPenalty: options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
    logitBias: options?.logitBias ?? defaultOptions.logitBias,
    logprobs: options?.logprobs ?? defaultOptions.logprobs,
    presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
    seed: options?.seed ?? defaultOptions.seed,
    topLogprobs: options?.topLogprobs ?? defaultOptions.topLogprobs,
  );
}

/// Helper class to track streaming tool call state
class StreamingToolCall {
  String id;
  String name;
  String argumentsJson;
  
  StreamingToolCall({
    required this.id,
    required this.name,
    this.argumentsJson = '',
  });
}