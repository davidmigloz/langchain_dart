// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentBlockImpl _$$ContentBlockImplFromJson(Map<String, dynamic> json) =>
    _$ContentBlockImpl(
      text: json['text'] as String,
      type: $enumDecode(_$ContentBlockTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockImplToJson(_$ContentBlockImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$ContentBlockTypeEnumMap[instance.type]!,
    };

const _$ContentBlockTypeEnumMap = {
  ContentBlockType.text: 'text',
};

_$ImageBlockParamImpl _$$ImageBlockParamImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageBlockParamImpl(
      source: ImageBlockParamSource.fromJson(
          json['source'] as Map<String, dynamic>),
      type: $enumDecode(_$ImageBlockParamTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ImageBlockParamImplToJson(
        _$ImageBlockParamImpl instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'type': _$ImageBlockParamTypeEnumMap[instance.type]!,
    };

const _$ImageBlockParamTypeEnumMap = {
  ImageBlockParamType.image: 'image',
};

_$ImageBlockParamSourceImpl _$$ImageBlockParamSourceImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageBlockParamSourceImpl(
      data: json['data'] as String,
      mediaType: $enumDecode(
          _$ImageBlockParamSourceMediaTypeEnumMap, json['media_type']),
      type: $enumDecode(_$ImageBlockParamSourceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ImageBlockParamSourceImplToJson(
        _$ImageBlockParamSourceImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'media_type':
          _$ImageBlockParamSourceMediaTypeEnumMap[instance.mediaType]!,
      'type': _$ImageBlockParamSourceTypeEnumMap[instance.type]!,
    };

const _$ImageBlockParamSourceMediaTypeEnumMap = {
  ImageBlockParamSourceMediaType.imageJpeg: 'image/jpeg',
  ImageBlockParamSourceMediaType.imagePng: 'image/png',
  ImageBlockParamSourceMediaType.imageGif: 'image/gif',
  ImageBlockParamSourceMediaType.imageWebp: 'image/webp',
};

const _$ImageBlockParamSourceTypeEnumMap = {
  ImageBlockParamSourceType.base64: 'base64',
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => TextBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      stopReason: $enumDecodeNullable(
          _$MessageStopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'role': _$MessageRoleEnumMap[instance.role]!,
      'stop_reason': _$MessageStopReasonEnumMap[instance.stopReason],
      'stop_sequence': instance.stopSequence,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'usage': instance.usage.toJson(),
    };

const _$MessageRoleEnumMap = {
  MessageRole.assistant: 'assistant',
};

const _$MessageStopReasonEnumMap = {
  MessageStopReason.endTurn: 'end_turn',
  MessageStopReason.maxTokens: 'max_tokens',
  MessageStopReason.stopSequence: 'stop_sequence',
};

const _$MessageTypeEnumMap = {
  MessageType.message: 'message',
};

_$MessageDeltaEventDeltaImpl _$$MessageDeltaEventDeltaImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaEventDeltaImpl(
      stopReason: $enumDecodeNullable(
          _$MessageDeltaEventDeltaStopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
    );

Map<String, dynamic> _$$MessageDeltaEventDeltaImplToJson(
        _$MessageDeltaEventDeltaImpl instance) =>
    <String, dynamic>{
      'stop_reason':
          _$MessageDeltaEventDeltaStopReasonEnumMap[instance.stopReason],
      'stop_sequence': instance.stopSequence,
    };

const _$MessageDeltaEventDeltaStopReasonEnumMap = {
  MessageDeltaEventDeltaStopReason.endTurn: 'end_turn',
  MessageDeltaEventDeltaStopReason.maxTokens: 'max_tokens',
  MessageDeltaEventDeltaStopReason.stopSequence: 'stop_sequence',
};

_$MessageDeltaUsageImpl _$$MessageDeltaUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaUsageImpl(
      outputTokens: (json['output_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$MessageDeltaUsageImplToJson(
        _$MessageDeltaUsageImpl instance) =>
    <String, dynamic>{
      'output_tokens': instance.outputTokens,
    };

_$MessageParamImpl _$$MessageParamImplFromJson(Map<String, dynamic> json) =>
    _$MessageParamImpl(
      content: const _MessageParamContentConverter().fromJson(json['content']),
      role: $enumDecode(_$MessageParamRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$MessageParamImplToJson(_$MessageParamImpl instance) =>
    <String, dynamic>{
      'content': const _MessageParamContentConverter().toJson(instance.content),
      'role': _$MessageParamRoleEnumMap[instance.role]!,
    };

const _$MessageParamRoleEnumMap = {
  MessageParamRole.user: 'user',
  MessageParamRole.assistant: 'assistant',
};

_$MessageParamContentListMapStringDynamicImpl
    _$$MessageParamContentListMapStringDynamicImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageParamContentListMapStringDynamicImpl(
          (json['value'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$MessageParamContentListMapStringDynamicImplToJson(
        _$MessageParamContentListMapStringDynamicImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$MessageParamContentStringImpl _$$MessageParamContentStringImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageParamContentStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MessageParamContentStringImplToJson(
        _$MessageParamContentStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$TextBlockImpl _$$TextBlockImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockImpl(
      text: json['text'] as String,
      type: $enumDecode(_$TextBlockTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TextBlockImplToJson(_$TextBlockImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$TextBlockTypeEnumMap[instance.type]!,
    };

const _$TextBlockTypeEnumMap = {
  TextBlockType.text: 'text',
};

_$TextBlockParamImpl _$$TextBlockParamImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockParamImpl(
      text: json['text'] as String,
      type: $enumDecode(_$TextBlockParamTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TextBlockParamImplToJson(
        _$TextBlockParamImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$TextBlockParamTypeEnumMap[instance.type]!,
    };

const _$TextBlockParamTypeEnumMap = {
  TextBlockParamType.text: 'text',
};

_$TextDeltaImpl _$$TextDeltaImplFromJson(Map<String, dynamic> json) =>
    _$TextDeltaImpl(
      text: json['text'] as String,
      type: $enumDecode(_$TextDeltaTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TextDeltaImplToJson(_$TextDeltaImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$TextDeltaTypeEnumMap[instance.type]!,
    };

const _$TextDeltaTypeEnumMap = {
  TextDeltaType.textDelta: 'text_delta',
};

_$UsageImpl _$$UsageImplFromJson(Map<String, dynamic> json) => _$UsageImpl(
      inputTokens: (json['input_tokens'] as num).toInt(),
      outputTokens: (json['output_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$UsageImplToJson(_$UsageImpl instance) =>
    <String, dynamic>{
      'input_tokens': instance.inputTokens,
      'output_tokens': instance.outputTokens,
    };

_$MessageCreateParamsImpl _$$MessageCreateParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageCreateParamsImpl(
      maxTokens: (json['max_tokens'] as num).toInt(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: $enumDecode(_$MessageCreateParamsModelEnumMap, json['model']),
      metadata: json['metadata'] == null
          ? null
          : MessageCreateParamsMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      stopSequences: (json['stop_sequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stream: json['stream'] as bool,
      system: json['system'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topK: (json['top_k'] as num?)?.toInt(),
      topP: (json['top_p'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MessageCreateParamsImplToJson(
    _$MessageCreateParamsImpl instance) {
  final val = <String, dynamic>{
    'max_tokens': instance.maxTokens,
    'messages': instance.messages.map((e) => e.toJson()).toList(),
    'model': _$MessageCreateParamsModelEnumMap[instance.model]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.toJson());
  writeNotNull('stop_sequences', instance.stopSequences);
  val['stream'] = instance.stream;
  writeNotNull('system', instance.system);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_k', instance.topK);
  writeNotNull('top_p', instance.topP);
  return val;
}

const _$MessageCreateParamsModelEnumMap = {
  MessageCreateParamsModel.claude3Opus20240229: 'claude-3-opus-20240229',
  MessageCreateParamsModel.claude3Sonnet20240229: 'claude-3-sonnet-20240229',
  MessageCreateParamsModel.claude3Haiku20240307: 'claude-3-haiku-20240307',
  MessageCreateParamsModel.claude21: 'claude-2.1',
  MessageCreateParamsModel.claude20: 'claude-2.0',
  MessageCreateParamsModel.claudeInstant12: 'claude-instant-1.2',
};

_$MessageCreateParamsMetadataImpl _$$MessageCreateParamsMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageCreateParamsMetadataImpl(
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$MessageCreateParamsMetadataImplToJson(
    _$MessageCreateParamsMetadataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  return val;
}

_$MessageCreateParamsNonStreamingImpl
    _$$MessageCreateParamsNonStreamingImplFromJson(Map<String, dynamic> json) =>
        _$MessageCreateParamsNonStreamingImpl();

Map<String, dynamic> _$$MessageCreateParamsNonStreamingImplToJson(
        _$MessageCreateParamsNonStreamingImpl instance) =>
    <String, dynamic>{};

_$MessageCreateParamsStreamingImpl _$$MessageCreateParamsStreamingImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageCreateParamsStreamingImpl();

Map<String, dynamic> _$$MessageCreateParamsStreamingImplToJson(
        _$MessageCreateParamsStreamingImpl instance) =>
    <String, dynamic>{};

_$MessageStreamParamsImpl _$$MessageStreamParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStreamParamsImpl(
      maxTokens: (json['max_tokens'] as num).toInt(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: $enumDecode(_$MessageStreamParamsModelEnumMap, json['model']),
      metadata: json['metadata'] == null
          ? null
          : MessageStreamParamsMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      stopSequences: (json['stop_sequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      system: json['system'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topK: (json['top_k'] as num?)?.toInt(),
      topP: (json['top_p'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MessageStreamParamsImplToJson(
    _$MessageStreamParamsImpl instance) {
  final val = <String, dynamic>{
    'max_tokens': instance.maxTokens,
    'messages': instance.messages.map((e) => e.toJson()).toList(),
    'model': _$MessageStreamParamsModelEnumMap[instance.model]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.toJson());
  writeNotNull('stop_sequences', instance.stopSequences);
  writeNotNull('system', instance.system);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_k', instance.topK);
  writeNotNull('top_p', instance.topP);
  return val;
}

const _$MessageStreamParamsModelEnumMap = {
  MessageStreamParamsModel.claude3Opus20240229: 'claude-3-opus-20240229',
  MessageStreamParamsModel.claude3Sonnet20240229: 'claude-3-sonnet-20240229',
  MessageStreamParamsModel.claude3Haiku20240307: 'claude-3-haiku-20240307',
  MessageStreamParamsModel.claude21: 'claude-2.1',
  MessageStreamParamsModel.claude20: 'claude-2.0',
  MessageStreamParamsModel.claudeInstant12: 'claude-instant-1.2',
};

_$MessageStreamParamsMetadataImpl _$$MessageStreamParamsMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStreamParamsMetadataImpl(
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$MessageStreamParamsMetadataImplToJson(
    _$MessageStreamParamsMetadataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  return val;
}

_$MessageStartEventImpl _$$MessageStartEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStartEventImpl(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageStartEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageStartEventImplToJson(
        _$MessageStartEventImpl instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
      'type': _$MessageStartEventTypeEnumMap[instance.type]!,
    };

const _$MessageStartEventTypeEnumMap = {
  MessageStartEventType.messageStart: 'message_start',
};

_$MessageDeltaEventImpl _$$MessageDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaEventImpl(
      delta: MessageDeltaEventDelta.fromJson(
          json['delta'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageDeltaEventTypeEnumMap, json['type']),
      usage: MessageDeltaUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageDeltaEventImplToJson(
        _$MessageDeltaEventImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'type': _$MessageDeltaEventTypeEnumMap[instance.type]!,
      'usage': instance.usage.toJson(),
    };

const _$MessageDeltaEventTypeEnumMap = {
  MessageDeltaEventType.messageDelta: 'message_delta',
};

_$MessageStopEventImpl _$$MessageStopEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStopEventImpl(
      type: $enumDecode(_$MessageStopEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageStopEventImplToJson(
        _$MessageStopEventImpl instance) =>
    <String, dynamic>{
      'type': _$MessageStopEventTypeEnumMap[instance.type]!,
    };

const _$MessageStopEventTypeEnumMap = {
  MessageStopEventType.messageStop: 'message_stop',
};

_$ContentBlockStartEventImpl _$$ContentBlockStartEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockStartEventImpl(
      contentBlock:
          TextBlock.fromJson(json['content_block'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$ContentBlockStartEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockStartEventImplToJson(
        _$ContentBlockStartEventImpl instance) =>
    <String, dynamic>{
      'content_block': instance.contentBlock.toJson(),
      'index': instance.index,
      'type': _$ContentBlockStartEventTypeEnumMap[instance.type]!,
    };

const _$ContentBlockStartEventTypeEnumMap = {
  ContentBlockStartEventType.contentBlockStart: 'content_block_start',
};

_$ContentBlockDeltaEventImpl _$$ContentBlockDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockDeltaEventImpl(
      delta: TextDelta.fromJson(json['delta'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$ContentBlockDeltaEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockDeltaEventImplToJson(
        _$ContentBlockDeltaEventImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'index': instance.index,
      'type': _$ContentBlockDeltaEventTypeEnumMap[instance.type]!,
    };

const _$ContentBlockDeltaEventTypeEnumMap = {
  ContentBlockDeltaEventType.contentBlockDelta: 'content_block_delta',
};

_$ContentBlockStopEventImpl _$$ContentBlockStopEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockStopEventImpl(
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$ContentBlockStopEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockStopEventImplToJson(
        _$ContentBlockStopEventImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': _$ContentBlockStopEventTypeEnumMap[instance.type]!,
    };

const _$ContentBlockStopEventTypeEnumMap = {
  ContentBlockStopEventType.contentBlockStop: 'content_block_stop',
};
