import 'package:json_schema/json_schema.dart';
import 'package:openai_dart/openai_dart.dart';

import '../../../language_models/language_models.dart';
import '../../tools/tool.dart';
import '../chat_message.dart' as msg;
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

/// Creates OpenAI ResponseFormat from JsonSchema
ResponseFormat? _createResponseFormat(JsonSchema? outputSchema) {
  if (outputSchema == null) return null;

  return ResponseFormat.jsonSchema(
    jsonSchema: JsonSchemaObject(
      name: 'output_schema',
      description: 'Generated response following the provided schema',
      schema: _openaiSchemaFrom(
        Map<String, dynamic>.from(outputSchema.schemaMap ?? {}),
      ),
      strict: true,
    ),
  );
}

/// Converts JsonSchema to OpenAI-compatible schema format.
///
/// OpenAI requires:
/// - additionalProperties: false at every object level
/// - format field removed from all properties
/// - required array with all property keys for objects
Map<String, dynamic> _openaiSchemaFrom(Map<String, dynamic> schema) {
  final result = Map<String, dynamic>.from(schema);

  // Remove format field if present
  result.remove('format');

  // If this is an object, ensure additionalProperties: false and required array
  if (result['type'] == 'object') {
    result['additionalProperties'] = false;

    // Recursively process properties
    final properties = result['properties'] as Map<String, dynamic>?;
    if (properties != null) {
      final processedProperties = <String, dynamic>{};
      for (final entry in properties.entries) {
        processedProperties[entry.key] = _openaiSchemaFrom(
          entry.value as Map<String, dynamic>,
        );
      }
      result['properties'] = processedProperties;

      // OpenAI requires all properties to be in the required array
      if (!result.containsKey('required')) {
        result['required'] = properties.keys.toList();
      }
    }
  }

  // Process array items
  if (result['type'] == 'array') {
    final items = result['items'] as Map<String, dynamic>?;
    if (items != null) {
      result['items'] = _openaiSchemaFrom(items);
    }
  }

  // Process definitions if present
  final definitions = result['definitions'] as Map<String, dynamic>?;
  if (definitions != null) {
    final processedDefinitions = <String, dynamic>{};
    for (final entry in definitions.entries) {
      processedDefinitions[entry.key] = _openaiSchemaFrom(
        entry.value as Map<String, dynamic>,
      );
    }
    result['definitions'] = processedDefinitions;
  }

  return result;
}

/// Creates a ChatCompletionRequest from the given input
CreateChatCompletionRequest createChatCompletionRequest(
  List<msg.ChatMessage> messages, {
  required String modelName,
  required OpenAIChatOptions defaultOptions,
  required bool stream,
  List<Tool>? tools,
  double? temperature,
  OpenAIChatOptions? options,
  JsonSchema? outputSchema,
}) => CreateChatCompletionRequest(
  model: ChatCompletionModel.modelId(modelName),
  messages: messages.toOpenAIMessages(),
  tools: tools
      ?.map(
        (tool) => ChatCompletionTool(
          type: ChatCompletionToolType.function,
          function: FunctionObject(
            name: tool.name,
            description: tool.description,
            parameters: tool.inputSchema.schemaMap as Map<String, dynamic>?,
            strict: null, // Explicitly pass null to override any defaults
          ),
        ),
      )
      .toList(),
  toolChoice: options?.toolChoice ?? defaultOptions.toolChoice,
  responseFormat:
      _createResponseFormat(outputSchema) ??
      options?.responseFormat ??
      defaultOptions.responseFormat,
  maxTokens: options?.maxTokens ?? defaultOptions.maxTokens,
  n: options?.n ?? defaultOptions.n,
  temperature:
      temperature ?? options?.temperature ?? defaultOptions.temperature,
  topP: options?.topP ?? defaultOptions.topP,
  stop: (options?.stop ?? defaultOptions.stop) != null
      ? ChatCompletionStop.listString(options?.stop ?? defaultOptions.stop!)
      : null,
  stream: stream,
  user: options?.user ?? defaultOptions.user,
  frequencyPenalty:
      options?.frequencyPenalty ?? defaultOptions.frequencyPenalty,
  logitBias: options?.logitBias ?? defaultOptions.logitBias,
  logprobs: options?.logprobs ?? defaultOptions.logprobs,
  presencePenalty: options?.presencePenalty ?? defaultOptions.presencePenalty,
  seed: options?.seed ?? defaultOptions.seed,
  topLogprobs: options?.topLogprobs ?? defaultOptions.topLogprobs,
);

/// Helper class to track streaming tool call state
class StreamingToolCall {
  /// Creates a new streaming tool call.
  StreamingToolCall({
    required this.id,
    required this.name,
    this.argumentsJson = '',
  });

  /// The ID of the tool call.
  String id;

  /// The name of the tool.
  String name;

  /// The arguments of the tool call.
  String argumentsJson;
}
