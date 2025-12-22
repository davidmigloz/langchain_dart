// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatCompletionRequest _$ChatCompletionRequestFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionRequest(
  model: const _ChatCompletionModelConverter().fromJson(json['model']),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
  temperature: (json['temperature'] as num?)?.toDouble(),
  topP: (json['top_p'] as num?)?.toDouble(),
  maxTokens: (json['max_tokens'] as num?)?.toInt(),
  stream: json['stream'] as bool?,
  stop: const _ChatCompletionStopConverter().fromJson(json['stop']),
  randomSeed: (json['random_seed'] as num?)?.toInt(),
  responseFormat: json['response_format'] == null
      ? null
      : ResponseFormat.fromJson(
          json['response_format'] as Map<String, dynamic>,
        ),
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
  toolChoice: const _ChatCompletionToolChoiceConverter().fromJson(
    json['tool_choice'],
  ),
  presencePenalty: (json['presence_penalty'] as num?)?.toDouble(),
  frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble(),
  n: (json['n'] as num?)?.toInt(),
  parallelToolCalls: json['parallel_tool_calls'] as bool? ?? true,
  safePrompt: json['safe_prompt'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  prediction: json['prediction'] == null
      ? null
      : Prediction.fromJson(json['prediction'] as Map<String, dynamic>),
  promptMode: $enumDecodeNullable(
    _$MistralPromptModeEnumMap,
    json['prompt_mode'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
);

Map<String, dynamic> _$ChatCompletionRequestToJson(
  _ChatCompletionRequest instance,
) => <String, dynamic>{
  'model': const _ChatCompletionModelConverter().toJson(instance.model),
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  'temperature': ?instance.temperature,
  'top_p': ?instance.topP,
  'max_tokens': ?instance.maxTokens,
  'stream': ?instance.stream,
  'stop': ?const _ChatCompletionStopConverter().toJson(instance.stop),
  'random_seed': ?instance.randomSeed,
  'response_format': ?instance.responseFormat?.toJson(),
  'tools': ?instance.tools?.map((e) => e.toJson()).toList(),
  'tool_choice': ?const _ChatCompletionToolChoiceConverter().toJson(
    instance.toolChoice,
  ),
  'presence_penalty': ?instance.presencePenalty,
  'frequency_penalty': ?instance.frequencyPenalty,
  'n': ?instance.n,
  'parallel_tool_calls': ?instance.parallelToolCalls,
  'safe_prompt': ?instance.safePrompt,
  'metadata': ?instance.metadata,
  'prediction': ?instance.prediction?.toJson(),
  'prompt_mode': ?_$MistralPromptModeEnumMap[instance.promptMode],
};

const _$MistralPromptModeEnumMap = {MistralPromptMode.reasoning: 'reasoning'};

ChatCompletionModelEnumeration _$ChatCompletionModelEnumerationFromJson(
  Map<String, dynamic> json,
) => ChatCompletionModelEnumeration(
  $enumDecode(_$ChatCompletionModelsEnumMap, json['value']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ChatCompletionModelEnumerationToJson(
  ChatCompletionModelEnumeration instance,
) => <String, dynamic>{
  'value': _$ChatCompletionModelsEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$ChatCompletionModelsEnumMap = {
  ChatCompletionModels.mistralLargeLatest: 'mistral-large-latest',
  ChatCompletionModels.mistralSmallLatest: 'mistral-small-latest',
  ChatCompletionModels.codestralLatest: 'codestral-latest',
  ChatCompletionModels.ministral3bLatest: 'ministral-3b-latest',
  ChatCompletionModels.ministral8bLatest: 'ministral-8b-latest',
  ChatCompletionModels.openMistralNemo: 'open-mistral-nemo',
  ChatCompletionModels.pixtralLargeLatest: 'pixtral-large-latest',
};

ChatCompletionModelString _$ChatCompletionModelStringFromJson(
  Map<String, dynamic> json,
) => ChatCompletionModelString(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ChatCompletionModelStringToJson(
  ChatCompletionModelString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ChatCompletionStopListString _$ChatCompletionStopListStringFromJson(
  Map<String, dynamic> json,
) => ChatCompletionStopListString(
  (json['value'] as List<dynamic>).map((e) => e as String).toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ChatCompletionStopListStringToJson(
  ChatCompletionStopListString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ChatCompletionStopString _$ChatCompletionStopStringFromJson(
  Map<String, dynamic> json,
) => ChatCompletionStopString(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ChatCompletionStopStringToJson(
  ChatCompletionStopString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

ChatCompletionToolChoiceEnumeration
_$ChatCompletionToolChoiceEnumerationFromJson(Map<String, dynamic> json) =>
    ChatCompletionToolChoiceEnumeration(
      $enumDecode(_$ChatCompletionToolChoiceOptionEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionToolChoiceEnumerationToJson(
  ChatCompletionToolChoiceEnumeration instance,
) => <String, dynamic>{
  'value': _$ChatCompletionToolChoiceOptionEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$ChatCompletionToolChoiceOptionEnumMap = {
  ChatCompletionToolChoiceOption.none: 'none',
  ChatCompletionToolChoiceOption.auto: 'auto',
  ChatCompletionToolChoiceOption.any: 'any',
  ChatCompletionToolChoiceOption.required: 'required',
};

ChatCompletionToolChoiceToolChoiceTool
_$ChatCompletionToolChoiceToolChoiceToolFromJson(Map<String, dynamic> json) =>
    ChatCompletionToolChoiceToolChoiceTool(
      ToolChoiceTool.fromJson(json['value'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionToolChoiceToolChoiceToolToJson(
  ChatCompletionToolChoiceToolChoiceTool instance,
) => <String, dynamic>{
  'value': instance.value.toJson(),
  'runtimeType': instance.$type,
};

_ChatCompletionResponse _$ChatCompletionResponseFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionResponse(
  id: json['id'] as String,
  object: json['object'] as String,
  created: (json['created'] as num).toInt(),
  model: json['model'] as String,
  choices: (json['choices'] as List<dynamic>)
      .map(
        (e) => ChatCompletionResponseChoicesInner.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  usage: ChatCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatCompletionResponseToJson(
  _ChatCompletionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'created': instance.created,
  'model': instance.model,
  'choices': instance.choices.map((e) => e.toJson()).toList(),
  'usage': instance.usage.toJson(),
};

_ChatCompletionResponseChoicesInner
_$ChatCompletionResponseChoicesInnerFromJson(Map<String, dynamic> json) =>
    _ChatCompletionResponseChoicesInner(
      index: (json['index'] as num).toInt(),
      message: AssistantMessage.fromJson(
        json['message'] as Map<String, dynamic>,
      ),
      finishReason: $enumDecode(
        _$ChatCompletionFinishReasonEnumMap,
        json['finish_reason'],
      ),
    );

Map<String, dynamic> _$ChatCompletionResponseChoicesInnerToJson(
  _ChatCompletionResponseChoicesInner instance,
) => <String, dynamic>{
  'index': instance.index,
  'message': instance.message.toJson(),
  'finish_reason': _$ChatCompletionFinishReasonEnumMap[instance.finishReason]!,
};

const _$ChatCompletionFinishReasonEnumMap = {
  ChatCompletionFinishReason.stop: 'stop',
  ChatCompletionFinishReason.length: 'length',
  ChatCompletionFinishReason.modelLength: 'model_length',
  ChatCompletionFinishReason.error: 'error',
  ChatCompletionFinishReason.toolCalls: 'tool_calls',
};

_ChatCompletionMessage _$ChatCompletionMessageFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionMessage(
  role: $enumDecode(_$ChatCompletionMessageRoleEnumMap, json['role']),
  content: json['content'] as String?,
  toolCalls: (json['tool_calls'] as List<dynamic>?)
      ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
      .toList(),
  toolCallId: json['tool_call_id'] as String?,
  name: json['name'] as String?,
  prefix: json['prefix'] as bool?,
);

Map<String, dynamic> _$ChatCompletionMessageToJson(
  _ChatCompletionMessage instance,
) => <String, dynamic>{
  'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
  'content': ?instance.content,
  'tool_calls': ?instance.toolCalls?.map((e) => e.toJson()).toList(),
  'tool_call_id': ?instance.toolCallId,
  'name': ?instance.name,
  'prefix': ?instance.prefix,
};

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
  ChatCompletionMessageRole.tool: 'tool',
};

_AssistantMessage _$AssistantMessageFromJson(Map<String, dynamic> json) =>
    _AssistantMessage(
      role: $enumDecodeNullable(
        _$AssistantMessageRoleEnumMap,
        json['role'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      content: json['content'] as String?,
      toolCalls: (json['tool_calls'] as List<dynamic>?)
          ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
      prefix: json['prefix'] as bool?,
    );

Map<String, dynamic> _$AssistantMessageToJson(_AssistantMessage instance) =>
    <String, dynamic>{
      'role': ?_$AssistantMessageRoleEnumMap[instance.role],
      'content': ?instance.content,
      'tool_calls': ?instance.toolCalls?.map((e) => e.toJson()).toList(),
      'prefix': ?instance.prefix,
    };

const _$AssistantMessageRoleEnumMap = {
  AssistantMessageRole.assistant: 'assistant',
};

_ChatCompletionUsage _$ChatCompletionUsageFromJson(Map<String, dynamic> json) =>
    _ChatCompletionUsage(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      completionTokens: (json['completion_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$ChatCompletionUsageToJson(
  _ChatCompletionUsage instance,
) => <String, dynamic>{
  'prompt_tokens': instance.promptTokens,
  'completion_tokens': instance.completionTokens,
  'total_tokens': instance.totalTokens,
};

_ChatCompletionStreamResponse _$ChatCompletionStreamResponseFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionStreamResponse(
  id: json['id'] as String,
  object: json['object'] as String?,
  created: (json['created'] as num?)?.toInt(),
  model: json['model'] as String,
  choices: (json['choices'] as List<dynamic>)
      .map(
        (e) => ChatCompletionStreamResponseChoicesInner.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  usage: json['usage'] == null
      ? null
      : ChatCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatCompletionStreamResponseToJson(
  _ChatCompletionStreamResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': ?instance.object,
  'created': ?instance.created,
  'model': instance.model,
  'choices': instance.choices.map((e) => e.toJson()).toList(),
  'usage': ?instance.usage?.toJson(),
};

_ChatCompletionStreamResponseChoicesInner
_$ChatCompletionStreamResponseChoicesInnerFromJson(Map<String, dynamic> json) =>
    _ChatCompletionStreamResponseChoicesInner(
      index: (json['index'] as num).toInt(),
      delta: ChatCompletionStreamDelta.fromJson(
        json['delta'] as Map<String, dynamic>,
      ),
      finishReason: $enumDecodeNullable(
        _$ChatCompletionFinishReasonEnumMap,
        json['finish_reason'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
    );

Map<String, dynamic> _$ChatCompletionStreamResponseChoicesInnerToJson(
  _ChatCompletionStreamResponseChoicesInner instance,
) => <String, dynamic>{
  'index': instance.index,
  'delta': instance.delta.toJson(),
  'finish_reason': ?_$ChatCompletionFinishReasonEnumMap[instance.finishReason],
};

_ChatCompletionStreamDelta _$ChatCompletionStreamDeltaFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionStreamDelta(
  role: $enumDecodeNullable(
    _$ChatCompletionMessageRoleEnumMap,
    json['role'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  content: json['content'] as String?,
  toolCalls: (json['tool_calls'] as List<dynamic>?)
      ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChatCompletionStreamDeltaToJson(
  _ChatCompletionStreamDelta instance,
) => <String, dynamic>{
  'role': ?_$ChatCompletionMessageRoleEnumMap[instance.role],
  'content': ?instance.content,
  'tool_calls': ?instance.toolCalls?.map((e) => e.toJson()).toList(),
};

_Tool _$ToolFromJson(Map<String, dynamic> json) => _Tool(
  type: $enumDecode(_$ToolTypeEnumMap, json['type']),
  function: FunctionDefinition.fromJson(
    json['function'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ToolToJson(_Tool instance) => <String, dynamic>{
  'type': _$ToolTypeEnumMap[instance.type]!,
  'function': instance.function.toJson(),
};

const _$ToolTypeEnumMap = {ToolType.function: 'function'};

_FunctionDefinition _$FunctionDefinitionFromJson(Map<String, dynamic> json) =>
    _FunctionDefinition(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FunctionDefinitionToJson(_FunctionDefinition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': ?instance.description,
      'parameters': instance.parameters,
    };

_ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => _ToolCall(
  id: json['id'] as String?,
  type: $enumDecodeNullable(
    _$ToolCallTypeEnumMap,
    json['type'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  function: json['function'] == null
      ? null
      : FunctionCall.fromJson(json['function'] as Map<String, dynamic>),
  index: (json['index'] as num?)?.toInt(),
);

Map<String, dynamic> _$ToolCallToJson(_ToolCall instance) => <String, dynamic>{
  'id': ?instance.id,
  'type': ?_$ToolCallTypeEnumMap[instance.type],
  'function': ?instance.function?.toJson(),
  'index': ?instance.index,
};

const _$ToolCallTypeEnumMap = {ToolCallType.function: 'function'};

_FunctionCall _$FunctionCallFromJson(Map<String, dynamic> json) =>
    _FunctionCall(
      name: json['name'] as String?,
      arguments: json['arguments'] as String?,
    );

Map<String, dynamic> _$FunctionCallToJson(_FunctionCall instance) =>
    <String, dynamic>{'name': ?instance.name, 'arguments': ?instance.arguments};

_ToolChoiceTool _$ToolChoiceToolFromJson(Map<String, dynamic> json) =>
    _ToolChoiceTool(
      type: $enumDecode(_$ToolTypeEnumMap, json['type']),
      function: ToolChoiceToolFunction.fromJson(
        json['function'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ToolChoiceToolToJson(_ToolChoiceTool instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

_ToolChoiceToolFunction _$ToolChoiceToolFunctionFromJson(
  Map<String, dynamic> json,
) => _ToolChoiceToolFunction(name: json['name'] as String);

Map<String, dynamic> _$ToolChoiceToolFunctionToJson(
  _ToolChoiceToolFunction instance,
) => <String, dynamic>{'name': instance.name};

_ResponseFormat _$ResponseFormatFromJson(Map<String, dynamic> json) =>
    _ResponseFormat(
      type: $enumDecodeNullable(
        _$ResponseFormatTypeEnumMap,
        json['type'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      jsonSchema: json['json_schema'] == null
          ? null
          : JsonSchema.fromJson(json['json_schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseFormatToJson(_ResponseFormat instance) =>
    <String, dynamic>{
      'type': ?_$ResponseFormatTypeEnumMap[instance.type],
      'json_schema': ?instance.jsonSchema?.toJson(),
    };

const _$ResponseFormatTypeEnumMap = {
  ResponseFormatType.text: 'text',
  ResponseFormatType.jsonObject: 'json_object',
  ResponseFormatType.jsonSchema: 'json_schema',
};

_JsonSchema _$JsonSchemaFromJson(Map<String, dynamic> json) => _JsonSchema(
  name: json['name'] as String,
  description: json['description'] as String?,
  schema: json['schema'] as Map<String, dynamic>,
  strict: json['strict'] as bool?,
);

Map<String, dynamic> _$JsonSchemaToJson(_JsonSchema instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': ?instance.description,
      'schema': instance.schema,
      'strict': ?instance.strict,
    };

_Prediction _$PredictionFromJson(Map<String, dynamic> json) => _Prediction(
  type: $enumDecode(_$PredictionTypeEnumMap, json['type']),
  content: json['content'] as String,
);

Map<String, dynamic> _$PredictionToJson(_Prediction instance) =>
    <String, dynamic>{
      'type': _$PredictionTypeEnumMap[instance.type]!,
      'content': instance.content,
    };

const _$PredictionTypeEnumMap = {PredictionType.content: 'content'};

_EmbeddingRequest _$EmbeddingRequestFromJson(Map<String, dynamic> json) =>
    _EmbeddingRequest(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: (json['input'] as List<dynamic>).map((e) => e as String).toList(),
      outputDimension: (json['output_dimension'] as num?)?.toInt(),
      outputDtype: $enumDecodeNullable(
        _$EmbeddingOutputDtypeEnumMap,
        json['output_dtype'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      encodingFormat: $enumDecodeNullable(
        _$EmbeddingEncodingFormatEnumMap,
        json['encoding_format'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
    );

Map<String, dynamic> _$EmbeddingRequestToJson(
  _EmbeddingRequest instance,
) => <String, dynamic>{
  'model': const _EmbeddingModelConverter().toJson(instance.model),
  'input': instance.input,
  'output_dimension': ?instance.outputDimension,
  'output_dtype': ?_$EmbeddingOutputDtypeEnumMap[instance.outputDtype],
  'encoding_format': ?_$EmbeddingEncodingFormatEnumMap[instance.encodingFormat],
};

const _$EmbeddingOutputDtypeEnumMap = {
  EmbeddingOutputDtype.float: 'float',
  EmbeddingOutputDtype.int8: 'int8',
  EmbeddingOutputDtype.uint8: 'uint8',
  EmbeddingOutputDtype.binary: 'binary',
  EmbeddingOutputDtype.ubinary: 'ubinary',
};

const _$EmbeddingEncodingFormatEnumMap = {
  EmbeddingEncodingFormat.float: 'float',
  EmbeddingEncodingFormat.base64: 'base64',
};

EmbeddingModelEnumeration _$EmbeddingModelEnumerationFromJson(
  Map<String, dynamic> json,
) => EmbeddingModelEnumeration(
  $enumDecode(_$EmbeddingModelsEnumMap, json['value']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$EmbeddingModelEnumerationToJson(
  EmbeddingModelEnumeration instance,
) => <String, dynamic>{
  'value': _$EmbeddingModelsEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$EmbeddingModelsEnumMap = {
  EmbeddingModels.mistralEmbed: 'mistral-embed',
  EmbeddingModels.codestralEmbed2505: 'codestral-embed-2505',
};

EmbeddingModelString _$EmbeddingModelStringFromJson(
  Map<String, dynamic> json,
) => EmbeddingModelString(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$EmbeddingModelStringToJson(
  EmbeddingModelString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_EmbeddingResponse _$EmbeddingResponseFromJson(Map<String, dynamic> json) =>
    _EmbeddingResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Embedding.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      created: (json['created'] as num?)?.toInt(),
      usage: EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmbeddingResponseToJson(_EmbeddingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'created': ?instance.created,
      'usage': instance.usage.toJson(),
    };

_EmbeddingUsage _$EmbeddingUsageFromJson(Map<String, dynamic> json) =>
    _EmbeddingUsage(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      completionTokens: (json['completion_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      promptAudioSeconds: (json['prompt_audio_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmbeddingUsageToJson(_EmbeddingUsage instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
      'prompt_audio_seconds': ?instance.promptAudioSeconds,
    };

_Embedding _$EmbeddingFromJson(Map<String, dynamic> json) => _Embedding(
  object: json['object'] as String,
  embedding: (json['embedding'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  index: (json['index'] as num).toInt(),
);

Map<String, dynamic> _$EmbeddingToJson(_Embedding instance) =>
    <String, dynamic>{
      'object': instance.object,
      'embedding': instance.embedding,
      'index': instance.index,
    };

_ModelList _$ModelListFromJson(Map<String, dynamic> json) => _ModelList(
  object: json['object'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Model.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ModelListToJson(_ModelList instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
  id: json['id'] as String,
  object: json['object'] as String,
  created: (json['created'] as num).toInt(),
  ownedBy: json['owned_by'] as String,
);

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'created': instance.created,
  'owned_by': instance.ownedBy,
};
