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
  temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
  topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
  maxTokens: (json['max_tokens'] as num?)?.toInt(),
  stream: json['stream'] as bool? ?? false,
  safePrompt: json['safe_prompt'] as bool? ?? false,
  randomSeed: (json['random_seed'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChatCompletionRequestToJson(
  _ChatCompletionRequest instance,
) => <String, dynamic>{
  'model': const _ChatCompletionModelConverter().toJson(instance.model),
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.topP case final value?) 'top_p': value,
  if (instance.maxTokens case final value?) 'max_tokens': value,
  if (instance.stream case final value?) 'stream': value,
  if (instance.safePrompt case final value?) 'safe_prompt': value,
  if (instance.randomSeed case final value?) 'random_seed': value,
};

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
  ChatCompletionModels.mistralMedium: 'mistral-medium',
  ChatCompletionModels.mistralSmall: 'mistral-small',
  ChatCompletionModels.mistralTiny: 'mistral-tiny',
};

ChatCompletionModelString _$ChatCompletionModelStringFromJson(
  Map<String, dynamic> json,
) => ChatCompletionModelString(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ChatCompletionModelStringToJson(
  ChatCompletionModelString instance,
) => <String, dynamic>{
  'value': instance.value,
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
      message: json['message'] == null
          ? null
          : ChatCompletionMessage.fromJson(
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
  if (instance.message?.toJson() case final value?) 'message': value,
  'finish_reason': _$ChatCompletionFinishReasonEnumMap[instance.finishReason]!,
};

const _$ChatCompletionFinishReasonEnumMap = {
  ChatCompletionFinishReason.stop: 'stop',
  ChatCompletionFinishReason.length: 'length',
  ChatCompletionFinishReason.modelLength: 'model_length',
};

_ChatCompletionMessage _$ChatCompletionMessageFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionMessage(
  role: $enumDecode(_$ChatCompletionMessageRoleEnumMap, json['role']),
  content: json['content'] as String,
);

Map<String, dynamic> _$ChatCompletionMessageToJson(
  _ChatCompletionMessage instance,
) => <String, dynamic>{
  'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
  'content': instance.content,
};

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
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
);

Map<String, dynamic> _$ChatCompletionStreamResponseToJson(
  _ChatCompletionStreamResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.object case final value?) 'object': value,
  if (instance.created case final value?) 'created': value,
  'model': instance.model,
  'choices': instance.choices.map((e) => e.toJson()).toList(),
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
  if (_$ChatCompletionFinishReasonEnumMap[instance.finishReason]
      case final value?)
    'finish_reason': value,
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
);

Map<String, dynamic> _$ChatCompletionStreamDeltaToJson(
  _ChatCompletionStreamDelta instance,
) => <String, dynamic>{
  if (_$ChatCompletionMessageRoleEnumMap[instance.role] case final value?)
    'role': value,
  if (instance.content case final value?) 'content': value,
};

_EmbeddingRequest _$EmbeddingRequestFromJson(Map<String, dynamic> json) =>
    _EmbeddingRequest(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: (json['input'] as List<dynamic>).map((e) => e as String).toList(),
      encodingFormat:
          $enumDecodeNullable(
            _$EmbeddingEncodingFormatEnumMap,
            json['encoding_format'],
          ) ??
          EmbeddingEncodingFormat.float,
    );

Map<String, dynamic> _$EmbeddingRequestToJson(
  _EmbeddingRequest instance,
) => <String, dynamic>{
  'model': const _EmbeddingModelConverter().toJson(instance.model),
  'input': instance.input,
  'encoding_format': _$EmbeddingEncodingFormatEnumMap[instance.encodingFormat]!,
};

const _$EmbeddingEncodingFormatEnumMap = {
  EmbeddingEncodingFormat.float: 'float',
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
};

EmbeddingModelString _$EmbeddingModelStringFromJson(
  Map<String, dynamic> json,
) => EmbeddingModelString(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$EmbeddingModelStringToJson(
  EmbeddingModelString instance,
) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

_EmbeddingResponse _$EmbeddingResponseFromJson(Map<String, dynamic> json) =>
    _EmbeddingResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Embedding.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      usage: EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmbeddingResponseToJson(_EmbeddingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'usage': instance.usage.toJson(),
    };

_EmbeddingUsage _$EmbeddingUsageFromJson(Map<String, dynamic> json) =>
    _EmbeddingUsage(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$EmbeddingUsageToJson(_EmbeddingUsage instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
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
