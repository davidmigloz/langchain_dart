// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateMessageRequestImpl _$$CreateMessageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateMessageRequestImpl(
      model: const _ModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxTokens: (json['max_tokens'] as num).toInt(),
      metadata: json['metadata'] == null
          ? null
          : CreateMessageRequestMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      stopSequences: (json['stop_sequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      system: json['system'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topK: (json['top_k'] as num?)?.toInt(),
      topP: (json['top_p'] as num?)?.toDouble(),
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateMessageRequestImplToJson(
    _$CreateMessageRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _ModelConverter().toJson(instance.model),
    'messages': instance.messages.map((e) => e.toJson()).toList(),
    'max_tokens': instance.maxTokens,
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
  val['stream'] = instance.stream;
  return val;
}

_$ModelEnumerationImpl _$$ModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$ModelEnumerationImpl(
      $enumDecode(_$ModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModelEnumerationImplToJson(
        _$ModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ModelsEnumMap = {
  Models.claude3Opus20240229: 'claude-3-opus-20240229',
  Models.claude3Sonnet20240229: 'claude-3-sonnet-20240229',
  Models.claude3Haiku20240307: 'claude-3-haiku-20240307',
  Models.claude21: 'claude-2.1',
  Models.claude20: 'claude-2.0',
  Models.claudeInstant12: 'claude-instant-1.2',
};

_$ModelStringImpl _$$ModelStringImplFromJson(Map<String, dynamic> json) =>
    _$ModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModelStringImplToJson(_$ModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateMessageRequestMetadataImpl _$$CreateMessageRequestMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateMessageRequestMetadataImpl(
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$CreateMessageRequestMetadataImplToJson(
    _$CreateMessageRequestMetadataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  return val;
}

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      content: const _MessageContentConverter().fromJson(json['content']),
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      model: json['model'] as String?,
      stopReason: $enumDecodeNullable(_$StopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
      type: json['type'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = const _MessageContentConverter().toJson(instance.content);
  val['role'] = _$MessageRoleEnumMap[instance.role]!;
  writeNotNull('model', instance.model);
  writeNotNull('stop_reason', _$StopReasonEnumMap[instance.stopReason]);
  writeNotNull('stop_sequence', instance.stopSequence);
  writeNotNull('type', instance.type);
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

const _$MessageRoleEnumMap = {
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
};

const _$StopReasonEnumMap = {
  StopReason.endTurn: 'end_turn',
  StopReason.maxTokens: 'max_tokens',
  StopReason.stopSequence: 'stop_sequence',
};

_$MessageContentListBlockImpl _$$MessageContentListBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentListBlockImpl(
      (json['value'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MessageContentListBlockImplToJson(
        _$MessageContentListBlockImpl instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$MessageContentStringImpl _$$MessageContentStringImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MessageContentStringImplToJson(
        _$MessageContentStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ImageBlockSourceImpl _$$ImageBlockSourceImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageBlockSourceImpl(
      data: json['data'] as String,
      mediaType:
          $enumDecode(_$ImageBlockSourceMediaTypeEnumMap, json['media_type']),
      type: $enumDecode(_$ImageBlockSourceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ImageBlockSourceImplToJson(
        _$ImageBlockSourceImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'media_type': _$ImageBlockSourceMediaTypeEnumMap[instance.mediaType]!,
      'type': _$ImageBlockSourceTypeEnumMap[instance.type]!,
    };

const _$ImageBlockSourceMediaTypeEnumMap = {
  ImageBlockSourceMediaType.imageJpeg: 'image/jpeg',
  ImageBlockSourceMediaType.imagePng: 'image/png',
  ImageBlockSourceMediaType.imageGif: 'image/gif',
  ImageBlockSourceMediaType.imageWebp: 'image/webp',
};

const _$ImageBlockSourceTypeEnumMap = {
  ImageBlockSourceType.base64: 'base64',
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

_$MessageDeltaImpl _$$MessageDeltaImplFromJson(Map<String, dynamic> json) =>
    _$MessageDeltaImpl(
      stopReason: $enumDecodeNullable(_$StopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
    );

Map<String, dynamic> _$$MessageDeltaImplToJson(_$MessageDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stop_reason', _$StopReasonEnumMap[instance.stopReason]);
  writeNotNull('stop_sequence', instance.stopSequence);
  return val;
}

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

_$TextBlockDeltaImpl _$$TextBlockDeltaImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockDeltaImpl(
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$TextBlockDeltaImplToJson(
        _$TextBlockDeltaImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

_$TextBlockImpl _$$TextBlockImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockImpl(
      text: json['text'] as String,
      type: json['type'] as String? ?? 'text',
    );

Map<String, dynamic> _$$TextBlockImplToJson(_$TextBlockImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

_$ImageBlockImpl _$$ImageBlockImplFromJson(Map<String, dynamic> json) =>
    _$ImageBlockImpl(
      source: ImageBlockSource.fromJson(json['source'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'image',
    );

Map<String, dynamic> _$$ImageBlockImplToJson(_$ImageBlockImpl instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'type': instance.type,
    };

_$MessageStartEventImpl _$$MessageStartEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStartEventImpl(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageStartEventImplToJson(
        _$MessageStartEventImpl instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

const _$MessageStreamEventTypeEnumMap = {
  MessageStreamEventType.messageStart: 'message_start',
  MessageStreamEventType.messageDelta: 'message_delta',
  MessageStreamEventType.messageStop: 'message_stop',
  MessageStreamEventType.contentBlockStart: 'content_block_start',
  MessageStreamEventType.contentBlockDelta: 'content_block_delta',
  MessageStreamEventType.contentBlockStop: 'content_block_stop',
  MessageStreamEventType.ping: 'ping',
};

_$MessageDeltaEventImpl _$$MessageDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaEventImpl(
      delta: MessageDelta.fromJson(json['delta'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
      usage: MessageDeltaUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageDeltaEventImplToJson(
        _$MessageDeltaEventImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
      'usage': instance.usage.toJson(),
    };

_$MessageStopEventImpl _$$MessageStopEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStopEventImpl(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageStopEventImplToJson(
        _$MessageStopEventImpl instance) =>
    <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

_$ContentBlockStartEventImpl _$$ContentBlockStartEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockStartEventImpl(
      contentBlock:
          TextBlock.fromJson(json['content_block'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockStartEventImplToJson(
        _$ContentBlockStartEventImpl instance) =>
    <String, dynamic>{
      'content_block': instance.contentBlock.toJson(),
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

_$ContentBlockDeltaEventImpl _$$ContentBlockDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockDeltaEventImpl(
      delta: TextBlockDelta.fromJson(json['delta'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockDeltaEventImplToJson(
        _$ContentBlockDeltaEventImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

_$ContentBlockStopEventImpl _$$ContentBlockStopEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentBlockStopEventImpl(
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ContentBlockStopEventImplToJson(
        _$ContentBlockStopEventImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

_$PingEventImpl _$$PingEventImplFromJson(Map<String, dynamic> json) =>
    _$PingEventImpl(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$PingEventImplToJson(_$PingEventImpl instance) =>
    <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };
