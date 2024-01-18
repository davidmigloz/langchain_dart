// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatCompletionRequestImpl _$$ChatCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionRequestImpl(
      model: const _ChatCompletionModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      maxTokens: json['max_tokens'] as int?,
      stream: json['stream'] as bool? ?? false,
      safePrompt: json['safe_prompt'] as bool? ?? false,
      randomSeed: json['random_seed'] as int?,
    );

Map<String, dynamic> _$$ChatCompletionRequestImplToJson(
    _$ChatCompletionRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _ChatCompletionModelConverter().toJson(instance.model),
    'messages': instance.messages.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('stream', instance.stream);
  writeNotNull('safe_prompt', instance.safePrompt);
  writeNotNull('random_seed', instance.randomSeed);
  return val;
}

_$ChatCompletionModelEnumerationImpl
    _$$ChatCompletionModelEnumerationImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionModelEnumerationImpl(
          $enumDecode(_$ChatCompletionModelsEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionModelEnumerationImplToJson(
        _$ChatCompletionModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionModelsEnumMap = {
  ChatCompletionModels.mistralMedium: 'mistral-medium',
  ChatCompletionModels.mistralSmall: 'mistral-small',
  ChatCompletionModels.mistralTiny: 'mistral-tiny',
};

_$ChatCompletionModelStringImpl _$$ChatCompletionModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionModelStringImplToJson(
        _$ChatCompletionModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionResponseImpl _$$ChatCompletionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChatCompletionResponseChoicesInner.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      usage:
          ChatCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCompletionResponseImplToJson(
        _$ChatCompletionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'usage': instance.usage.toJson(),
    };

_$ChatCompletionResponseChoicesInnerImpl
    _$$ChatCompletionResponseChoicesInnerImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionResponseChoicesInnerImpl(
          index: json['index'] as int,
          message: json['message'] == null
              ? null
              : ChatCompletionMessage.fromJson(
                  json['message'] as Map<String, dynamic>),
          finishReason: $enumDecode(
              _$ChatCompletionFinishReasonEnumMap, json['finish_reason']),
        );

Map<String, dynamic> _$$ChatCompletionResponseChoicesInnerImplToJson(
    _$ChatCompletionResponseChoicesInnerImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message?.toJson());
  val['finish_reason'] =
      _$ChatCompletionFinishReasonEnumMap[instance.finishReason]!;
  return val;
}

const _$ChatCompletionFinishReasonEnumMap = {
  ChatCompletionFinishReason.stop: 'stop',
  ChatCompletionFinishReason.length: 'length',
  ChatCompletionFinishReason.modelLength: 'model_length',
};

_$ChatCompletionMessageImpl _$$ChatCompletionMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionMessageImpl(
      role: $enumDecode(_$ChatCompletionMessageRoleEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$ChatCompletionMessageImplToJson(
        _$ChatCompletionMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
};

_$ChatCompletionUsageImpl _$$ChatCompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionUsageImpl(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$ChatCompletionUsageImplToJson(
        _$ChatCompletionUsageImpl instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };

_$ChatCompletionStreamResponseImpl _$$ChatCompletionStreamResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStreamResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChatCompletionStreamResponseChoicesInner.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatCompletionStreamResponseImplToJson(
    _$ChatCompletionStreamResponseImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('created', instance.created);
  val['model'] = instance.model;
  val['choices'] = instance.choices.map((e) => e.toJson()).toList();
  return val;
}

_$ChatCompletionStreamResponseChoicesInnerImpl
    _$$ChatCompletionStreamResponseChoicesInnerImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseChoicesInnerImpl(
          index: json['index'] as int,
          delta: ChatCompletionStreamDelta.fromJson(
              json['delta'] as Map<String, dynamic>),
          finishReason: $enumDecodeNullable(
              _$ChatCompletionFinishReasonEnumMap, json['finish_reason'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoicesInnerImplToJson(
    _$ChatCompletionStreamResponseChoicesInnerImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'delta': instance.delta.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('finish_reason',
      _$ChatCompletionFinishReasonEnumMap[instance.finishReason]);
  return val;
}

_$ChatCompletionStreamDeltaImpl _$$ChatCompletionStreamDeltaImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStreamDeltaImpl(
      role: $enumDecodeNullable(
          _$ChatCompletionMessageRoleEnumMap, json['role'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionStreamDeltaImplToJson(
    _$ChatCompletionStreamDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', _$ChatCompletionMessageRoleEnumMap[instance.role]);
  writeNotNull('content', instance.content);
  return val;
}

_$EmbeddingRequestImpl _$$EmbeddingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingRequestImpl(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: (json['input'] as List<dynamic>).map((e) => e as String).toList(),
      encodingFormat: $enumDecodeNullable(
              _$EmbeddingEncodingFormatEnumMap, json['encoding_format']) ??
          EmbeddingEncodingFormat.float,
    );

Map<String, dynamic> _$$EmbeddingRequestImplToJson(
        _$EmbeddingRequestImpl instance) =>
    <String, dynamic>{
      'model': const _EmbeddingModelConverter().toJson(instance.model),
      'input': instance.input,
      'encoding_format':
          _$EmbeddingEncodingFormatEnumMap[instance.encodingFormat]!,
    };

const _$EmbeddingEncodingFormatEnumMap = {
  EmbeddingEncodingFormat.float: 'float',
};

_$EmbeddingModelEnumerationImpl _$$EmbeddingModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingModelEnumerationImpl(
      $enumDecode(_$EmbeddingModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingModelEnumerationImplToJson(
        _$EmbeddingModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$EmbeddingModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$EmbeddingModelsEnumMap = {
  EmbeddingModels.mistralEmbed: 'mistral-embed',
};

_$EmbeddingModelStringImpl _$$EmbeddingModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingModelStringImplToJson(
        _$EmbeddingModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingResponseImpl _$$EmbeddingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Embedding.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      usage: EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmbeddingResponseImplToJson(
        _$EmbeddingResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'usage': instance.usage.toJson(),
    };

_$EmbeddingUsageImpl _$$EmbeddingUsageImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingUsageImpl(
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$EmbeddingUsageImplToJson(
        _$EmbeddingUsageImpl instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_$EmbeddingImpl _$$EmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingImpl(
      object: json['object'] as String,
      embedding: (json['embedding'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      index: json['index'] as int,
    );

Map<String, dynamic> _$$EmbeddingImplToJson(_$EmbeddingImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'embedding': instance.embedding,
      'index': instance.index,
    };

_$ModelListImpl _$$ModelListImplFromJson(Map<String, dynamic> json) =>
    _$ModelListImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ModelListImplToJson(_$ModelListImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      ownedBy: json['owned_by'] as String,
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'owned_by': instance.ownedBy,
    };
