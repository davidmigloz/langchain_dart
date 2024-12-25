// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolDefinitionImpl _$$ToolDefinitionImplFromJson(Map<String, dynamic> json) =>
    _$ToolDefinitionImpl(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'],
    );

Map<String, dynamic> _$$ToolDefinitionImplToJson(
        _$ToolDefinitionImpl instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.parameters case final value?) 'parameters': value,
    };

const _$ToolTypeEnumMap = {
  ToolType.function: 'function',
};

_$ToolChoiceForcedImpl _$$ToolChoiceForcedImplFromJson(
        Map<String, dynamic> json) =>
    _$ToolChoiceForcedImpl(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ToolChoiceForcedImplToJson(
        _$ToolChoiceForcedImpl instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

_$InputAudioTranscriptionConfigImpl
    _$$InputAudioTranscriptionConfigImplFromJson(Map<String, dynamic> json) =>
        _$InputAudioTranscriptionConfigImpl(
          model: json['model'] as String?,
        );

Map<String, dynamic> _$$InputAudioTranscriptionConfigImplToJson(
        _$InputAudioTranscriptionConfigImpl instance) =>
    <String, dynamic>{
      if (instance.model case final value?) 'model': value,
    };

_$TurnDetectionImpl _$$TurnDetectionImplFromJson(Map<String, dynamic> json) =>
    _$TurnDetectionImpl(
      type: $enumDecode(_$TurnDetectionTypeEnumMap, json['type']),
      threshold: (json['threshold'] as num?)?.toDouble(),
      prefixPaddingMs: (json['prefix_padding_ms'] as num?)?.toInt(),
      silenceDurationMs: (json['silence_duration_ms'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TurnDetectionImplToJson(_$TurnDetectionImpl instance) =>
    <String, dynamic>{
      'type': _$TurnDetectionTypeEnumMap[instance.type]!,
      if (instance.threshold case final value?) 'threshold': value,
      if (instance.prefixPaddingMs case final value?)
        'prefix_padding_ms': value,
      if (instance.silenceDurationMs case final value?)
        'silence_duration_ms': value,
    };

const _$TurnDetectionTypeEnumMap = {
  TurnDetectionType.serverVad: 'server_vad',
};

_$RateLimitImpl _$$RateLimitImplFromJson(Map<String, dynamic> json) =>
    _$RateLimitImpl(
      name: $enumDecode(_$RateLimitNameEnumMap, json['name']),
      limit: (json['limit'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
      resetSeconds: (json['reset_seconds'] as num).toDouble(),
    );

Map<String, dynamic> _$$RateLimitImplToJson(_$RateLimitImpl instance) =>
    <String, dynamic>{
      'name': _$RateLimitNameEnumMap[instance.name]!,
      'limit': instance.limit,
      'remaining': instance.remaining,
      'reset_seconds': instance.resetSeconds,
    };

const _$RateLimitNameEnumMap = {
  RateLimitName.requests: 'requests',
  RateLimitName.tokens: 'tokens',
  RateLimitName.inputTokens: 'input_tokens',
  RateLimitName.outputTokens: 'output_tokens',
};

_$ResponseImpl _$$ResponseImplFromJson(Map<String, dynamic> json) =>
    _$ResponseImpl(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object']) ??
          ObjectType.realtimeResponse,
      status: $enumDecode(_$ResponseStatusEnumMap, json['status']),
      statusDetails: json['status_details'] == null
          ? null
          : ResponseStatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>),
      output: (json['output'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseImplToJson(_$ResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ObjectTypeEnumMap[instance.object]!,
      'status': _$ResponseStatusEnumMap[instance.status]!,
      if (instance.statusDetails?.toJson() case final value?)
        'status_details': value,
      'output': instance.output.map((e) => e.toJson()).toList(),
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

const _$ObjectTypeEnumMap = {
  ObjectType.realtimeItem: 'realtime.item',
  ObjectType.realtimeResponse: 'realtime.response',
  ObjectType.realtimeSession: 'realtime.session',
  ObjectType.realtimeConversation: 'realtime.conversation',
};

const _$ResponseStatusEnumMap = {
  ResponseStatus.inProgress: 'in_progress',
  ResponseStatus.completed: 'completed',
  ResponseStatus.cancelled: 'cancelled',
  ResponseStatus.failed: 'failed',
  ResponseStatus.incomplete: 'incomplete',
};

_$ResponseConfigImpl _$$ResponseConfigImplFromJson(Map<String, dynamic> json) =>
    _$ResponseConfigImpl(
      modalities: (json['modalities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ModalityEnumMap, e))
          .toList(),
      instructions: json['instructions'] as String?,
      voice: $enumDecodeNullable(_$VoiceEnumMap, json['voice'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      outputAudioFormat: $enumDecodeNullable(
          _$AudioFormatEnumMap, json['output_audio_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => ToolDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolChoice: const _ResponseConfigToolChoiceConverter()
          .fromJson(json['tool_choice']),
      temperature: (json['temperature'] as num?)?.toDouble(),
      maxResponseOutputTokens:
          const _ResponseConfigMaxResponseOutputTokensConverter()
              .fromJson(json['max_response_output_tokens']),
    );

Map<String, dynamic> _$$ResponseConfigImplToJson(
        _$ResponseConfigImpl instance) =>
    <String, dynamic>{
      if (instance.modalities?.map((e) => _$ModalityEnumMap[e]!).toList()
          case final value?)
        'modalities': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (_$VoiceEnumMap[instance.voice] case final value?) 'voice': value,
      if (_$AudioFormatEnumMap[instance.outputAudioFormat] case final value?)
        'output_audio_format': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (const _ResponseConfigToolChoiceConverter().toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (const _ResponseConfigMaxResponseOutputTokensConverter()
              .toJson(instance.maxResponseOutputTokens)
          case final value?)
        'max_response_output_tokens': value,
    };

const _$ModalityEnumMap = {
  Modality.text: 'text',
  Modality.audio: 'audio',
};

const _$VoiceEnumMap = {
  Voice.alloy: 'alloy',
  Voice.ash: 'ash',
  Voice.ballad: 'ballad',
  Voice.coral: 'coral',
  Voice.echo: 'echo',
  Voice.sage: 'sage',
  Voice.shimmer: 'shimmer',
  Voice.verse: 'verse',
};

const _$AudioFormatEnumMap = {
  AudioFormat.pcm16: 'pcm16',
  AudioFormat.g711Ulaw: 'g711_ulaw',
  AudioFormat.g711Alaw: 'g711_alaw',
};

_$ResponseConfigToolChoiceEnumerationImpl
    _$$ResponseConfigToolChoiceEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$ResponseConfigToolChoiceEnumerationImpl(
          $enumDecode(_$ResponseConfigToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ResponseConfigToolChoiceEnumerationImplToJson(
        _$ResponseConfigToolChoiceEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ResponseConfigToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ResponseConfigToolChoiceModeEnumMap = {
  ResponseConfigToolChoiceMode.none: 'none',
  ResponseConfigToolChoiceMode.auto: 'auto',
  ResponseConfigToolChoiceMode.required: 'required',
};

_$ResponseConfigToolChoiceToolChoiceForcedImpl
    _$$ResponseConfigToolChoiceToolChoiceForcedImplFromJson(
            Map<String, dynamic> json) =>
        _$ResponseConfigToolChoiceToolChoiceForcedImpl(
          ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ResponseConfigToolChoiceToolChoiceForcedImplToJson(
        _$ResponseConfigToolChoiceToolChoiceForcedImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$ResponseConfigMaxResponseOutputTokensIntImpl
    _$$ResponseConfigMaxResponseOutputTokensIntImplFromJson(
            Map<String, dynamic> json) =>
        _$ResponseConfigMaxResponseOutputTokensIntImpl(
          (json['value'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ResponseConfigMaxResponseOutputTokensIntImplToJson(
        _$ResponseConfigMaxResponseOutputTokensIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ResponseConfigMaxResponseOutputTokensStringImpl
    _$$ResponseConfigMaxResponseOutputTokensStringImplFromJson(
            Map<String, dynamic> json) =>
        _$ResponseConfigMaxResponseOutputTokensStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ResponseConfigMaxResponseOutputTokensStringImplToJson(
        _$ResponseConfigMaxResponseOutputTokensStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UsageImpl _$$UsageImplFromJson(Map<String, dynamic> json) => _$UsageImpl(
      totalTokens: (json['total_tokens'] as num?)?.toInt(),
      inputTokens: (json['input_tokens'] as num?)?.toInt(),
      outputTokens: (json['output_tokens'] as num?)?.toInt(),
      inputTokenDetails: json['input_token_details'] == null
          ? null
          : UsageInputTokenDetails.fromJson(
              json['input_token_details'] as Map<String, dynamic>),
      outputTokenDetails: json['output_token_details'] == null
          ? null
          : UsageOutputTokenDetails.fromJson(
              json['output_token_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UsageImplToJson(_$UsageImpl instance) =>
    <String, dynamic>{
      if (instance.totalTokens case final value?) 'total_tokens': value,
      if (instance.inputTokens case final value?) 'input_tokens': value,
      if (instance.outputTokens case final value?) 'output_tokens': value,
      if (instance.inputTokenDetails?.toJson() case final value?)
        'input_token_details': value,
      if (instance.outputTokenDetails?.toJson() case final value?)
        'output_token_details': value,
    };

_$UsageInputTokenDetailsImpl _$$UsageInputTokenDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageInputTokenDetailsImpl(
      cachedTokens: (json['cached_tokens'] as num?)?.toInt(),
      textTokens: (json['text_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UsageInputTokenDetailsImplToJson(
        _$UsageInputTokenDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.cachedTokens case final value?) 'cached_tokens': value,
      if (instance.textTokens case final value?) 'text_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
    };

_$UsageOutputTokenDetailsImpl _$$UsageOutputTokenDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageOutputTokenDetailsImpl(
      textTokens: (json['text_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UsageOutputTokenDetailsImplToJson(
        _$UsageOutputTokenDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.textTokens case final value?) 'text_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
    };

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String?,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object']) ??
          ObjectType.realtimeSession,
      model: json['model'] as String?,
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      modalities: (json['modalities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ModalityEnumMap, e))
          .toList(),
      instructions: json['instructions'] as String?,
      voice: $enumDecodeNullable(_$VoiceEnumMap, json['voice'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      inputAudioFormat: $enumDecodeNullable(
          _$AudioFormatEnumMap, json['input_audio_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      outputAudioFormat: $enumDecodeNullable(
          _$AudioFormatEnumMap, json['output_audio_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      inputAudioTranscription: json['input_audio_transcription'] == null
          ? null
          : InputAudioTranscriptionConfig.fromJson(
              json['input_audio_transcription'] as Map<String, dynamic>),
      turnDetection: json['turn_detection'] == null
          ? null
          : TurnDetection.fromJson(
              json['turn_detection'] as Map<String, dynamic>),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => ToolDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolChoice:
          const _SessionToolChoiceConverter().fromJson(json['tool_choice']),
      temperature: (json['temperature'] as num?)?.toDouble(),
      maxResponseOutputTokens: const _SessionMaxResponseOutputTokensConverter()
          .fromJson(json['max_response_output_tokens']),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'object': _$ObjectTypeEnumMap[instance.object]!,
      if (instance.model case final value?) 'model': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      if (instance.modalities?.map((e) => _$ModalityEnumMap[e]!).toList()
          case final value?)
        'modalities': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (_$VoiceEnumMap[instance.voice] case final value?) 'voice': value,
      if (_$AudioFormatEnumMap[instance.inputAudioFormat] case final value?)
        'input_audio_format': value,
      if (_$AudioFormatEnumMap[instance.outputAudioFormat] case final value?)
        'output_audio_format': value,
      if (instance.inputAudioTranscription?.toJson() case final value?)
        'input_audio_transcription': value,
      if (instance.turnDetection?.toJson() case final value?)
        'turn_detection': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (const _SessionToolChoiceConverter().toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (const _SessionMaxResponseOutputTokensConverter()
              .toJson(instance.maxResponseOutputTokens)
          case final value?)
        'max_response_output_tokens': value,
    };

_$SessionToolChoiceEnumerationImpl _$$SessionToolChoiceEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionToolChoiceEnumerationImpl(
      $enumDecode(_$SessionToolChoiceModeEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SessionToolChoiceEnumerationImplToJson(
        _$SessionToolChoiceEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$SessionToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$SessionToolChoiceModeEnumMap = {
  SessionToolChoiceMode.none: 'none',
  SessionToolChoiceMode.auto: 'auto',
  SessionToolChoiceMode.required: 'required',
};

_$SessionToolChoiceToolChoiceForcedImpl
    _$$SessionToolChoiceToolChoiceForcedImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionToolChoiceToolChoiceForcedImpl(
          ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionToolChoiceToolChoiceForcedImplToJson(
        _$SessionToolChoiceToolChoiceForcedImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$SessionMaxResponseOutputTokensIntImpl
    _$$SessionMaxResponseOutputTokensIntImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionMaxResponseOutputTokensIntImpl(
          (json['value'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionMaxResponseOutputTokensIntImplToJson(
        _$SessionMaxResponseOutputTokensIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$SessionMaxResponseOutputTokensStringImpl
    _$$SessionMaxResponseOutputTokensStringImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionMaxResponseOutputTokensStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionMaxResponseOutputTokensStringImplToJson(
        _$SessionMaxResponseOutputTokensStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$SessionConfigImpl _$$SessionConfigImplFromJson(Map<String, dynamic> json) =>
    _$SessionConfigImpl(
      modalities: (json['modalities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ModalityEnumMap, e))
          .toList(),
      instructions: json['instructions'] as String?,
      voice: $enumDecodeNullable(_$VoiceEnumMap, json['voice'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      inputAudioFormat: $enumDecodeNullable(
          _$AudioFormatEnumMap, json['input_audio_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      outputAudioFormat: $enumDecodeNullable(
          _$AudioFormatEnumMap, json['output_audio_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      inputAudioTranscription: json['input_audio_transcription'] == null
          ? null
          : InputAudioTranscriptionConfig.fromJson(
              json['input_audio_transcription'] as Map<String, dynamic>),
      turnDetection: json['turn_detection'] == null
          ? null
          : TurnDetection.fromJson(
              json['turn_detection'] as Map<String, dynamic>),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => ToolDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolChoice: const _SessionConfigToolChoiceConverter()
          .fromJson(json['tool_choice']),
      temperature: (json['temperature'] as num?)?.toDouble(),
      maxResponseOutputTokens:
          const _SessionConfigMaxResponseOutputTokensConverter()
              .fromJson(json['max_response_output_tokens']),
    );

Map<String, dynamic> _$$SessionConfigImplToJson(_$SessionConfigImpl instance) =>
    <String, dynamic>{
      if (instance.modalities?.map((e) => _$ModalityEnumMap[e]!).toList()
          case final value?)
        'modalities': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (_$VoiceEnumMap[instance.voice] case final value?) 'voice': value,
      if (_$AudioFormatEnumMap[instance.inputAudioFormat] case final value?)
        'input_audio_format': value,
      if (_$AudioFormatEnumMap[instance.outputAudioFormat] case final value?)
        'output_audio_format': value,
      if (instance.inputAudioTranscription?.toJson() case final value?)
        'input_audio_transcription': value,
      if (instance.turnDetection?.toJson() case final value?)
        'turn_detection': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (const _SessionConfigToolChoiceConverter().toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (const _SessionConfigMaxResponseOutputTokensConverter()
              .toJson(instance.maxResponseOutputTokens)
          case final value?)
        'max_response_output_tokens': value,
    };

_$SessionConfigToolChoiceEnumerationImpl
    _$$SessionConfigToolChoiceEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionConfigToolChoiceEnumerationImpl(
          $enumDecode(_$SessionConfigToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionConfigToolChoiceEnumerationImplToJson(
        _$SessionConfigToolChoiceEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$SessionConfigToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$SessionConfigToolChoiceModeEnumMap = {
  SessionConfigToolChoiceMode.none: 'none',
  SessionConfigToolChoiceMode.auto: 'auto',
  SessionConfigToolChoiceMode.required: 'required',
};

_$SessionConfigToolChoiceToolChoiceForcedImpl
    _$$SessionConfigToolChoiceToolChoiceForcedImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionConfigToolChoiceToolChoiceForcedImpl(
          ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionConfigToolChoiceToolChoiceForcedImplToJson(
        _$SessionConfigToolChoiceToolChoiceForcedImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$SessionConfigMaxResponseOutputTokensIntImpl
    _$$SessionConfigMaxResponseOutputTokensIntImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionConfigMaxResponseOutputTokensIntImpl(
          (json['value'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionConfigMaxResponseOutputTokensIntImplToJson(
        _$SessionConfigMaxResponseOutputTokensIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$SessionConfigMaxResponseOutputTokensStringImpl
    _$$SessionConfigMaxResponseOutputTokensStringImplFromJson(
            Map<String, dynamic> json) =>
        _$SessionConfigMaxResponseOutputTokensStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SessionConfigMaxResponseOutputTokensStringImplToJson(
        _$SessionConfigMaxResponseOutputTokensStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object']) ??
          ObjectType.realtimeConversation,
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ObjectTypeEnumMap[instance.object]!,
    };

_$DeltaImpl _$$DeltaImplFromJson(Map<String, dynamic> json) => _$DeltaImpl(
      transcript: json['transcript'] as String?,
      audio: _$JsonConverterFromJson<List<int>, Uint8List>(
          json['audio'], const Uint8ListConverter().fromJson),
      text: json['text'] as String?,
      arguments: json['arguments'] as String?,
    );

Map<String, dynamic> _$$DeltaImplToJson(_$DeltaImpl instance) =>
    <String, dynamic>{
      if (instance.transcript case final value?) 'transcript': value,
      if (_$JsonConverterToJson<List<int>, Uint8List>(
              instance.audio, const Uint8ListConverter().toJson)
          case final value?)
        'audio': value,
      if (instance.text case final value?) 'text': value,
      if (instance.arguments case final value?) 'arguments': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$FormattedToolImpl _$$FormattedToolImplFromJson(Map<String, dynamic> json) =>
    _$FormattedToolImpl(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
      callId: json['call_id'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$$FormattedToolImplToJson(_$FormattedToolImpl instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
      'call_id': instance.callId,
      'arguments': instance.arguments,
    };

_$FormattedPropertyImpl _$$FormattedPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$FormattedPropertyImpl(
      audio: const Uint8ListConverter().fromJson(json['audio'] as List<int>),
      text: json['text'] as String,
      transcript: json['transcript'] as String,
      tool: json['tool'] == null
          ? null
          : FormattedTool.fromJson(json['tool'] as Map<String, dynamic>),
      output: json['output'] as String?,
    );

Map<String, dynamic> _$$FormattedPropertyImplToJson(
        _$FormattedPropertyImpl instance) =>
    <String, dynamic>{
      'audio': const Uint8ListConverter().toJson(instance.audio),
      'text': instance.text,
      'transcript': instance.transcript,
      if (instance.tool?.toJson() case final value?) 'tool': value,
      if (instance.output case final value?) 'output': value,
    };

_$FormattedItemImpl _$$FormattedItemImplFromJson(Map<String, dynamic> json) =>
    _$FormattedItemImpl(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      formatted: json['formatted'] == null
          ? null
          : FormattedProperty.fromJson(
              json['formatted'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FormattedItemImplToJson(_$FormattedItemImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'formatted': instance.formatted?.toJson(),
    };

_$ItemSpeechImpl _$$ItemSpeechImplFromJson(Map<String, dynamic> json) =>
    _$ItemSpeechImpl(
      audioStartMs: (json['audioStartMs'] as num).toInt(),
      audioEndMs: (json['audioEndMs'] as num?)?.toInt(),
      audio: _$JsonConverterFromJson<List<int>, Uint8List>(
          json['audio'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$$ItemSpeechImplToJson(_$ItemSpeechImpl instance) =>
    <String, dynamic>{
      'audioStartMs': instance.audioStartMs,
      if (instance.audioEndMs case final value?) 'audioEndMs': value,
      if (_$JsonConverterToJson<List<int>, Uint8List>(
              instance.audio, const Uint8ListConverter().toJson)
          case final value?)
        'audio': value,
    };

_$ItemTranscriptImpl _$$ItemTranscriptImplFromJson(Map<String, dynamic> json) =>
    _$ItemTranscriptImpl(
      transcript: json['transcript'] as String,
    );

Map<String, dynamic> _$$ItemTranscriptImplToJson(
        _$ItemTranscriptImpl instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
    };

_$EventHandlerResultImpl _$$EventHandlerResultImplFromJson(
        Map<String, dynamic> json) =>
    _$EventHandlerResultImpl(
      item: json['item'] == null
          ? null
          : FormattedItem.fromJson(json['item'] as Map<String, dynamic>),
      delta: json['delta'] == null
          ? null
          : Delta.fromJson(json['delta'] as Map<String, dynamic>),
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventHandlerResultImplToJson(
        _$EventHandlerResultImpl instance) =>
    <String, dynamic>{
      if (instance.item?.toJson() case final value?) 'item': value,
      if (instance.delta?.toJson() case final value?) 'delta': value,
      if (instance.response?.toJson() case final value?) 'response': value,
    };

_$TranscriptionErrorImpl _$$TranscriptionErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptionErrorImpl(
      type: json['type'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$$TranscriptionErrorImplToJson(
        _$TranscriptionErrorImpl instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
    };

_$APIErrorImpl _$$APIErrorImplFromJson(Map<String, dynamic> json) =>
    _$APIErrorImpl(
      type: json['type'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
      eventId: json['event_id'] as String?,
    );

Map<String, dynamic> _$$APIErrorImplToJson(_$APIErrorImpl instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
      if (instance.eventId case final value?) 'event_id': value,
    };

_$ContentPartInputTextImpl _$$ContentPartInputTextImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPartInputTextImpl(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.inputText,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$ContentPartInputTextImplToJson(
        _$ContentPartInputTextImpl instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

const _$ContentTypeEnumMap = {
  ContentType.inputText: 'input_text',
  ContentType.inputAudio: 'input_audio',
  ContentType.text: 'text',
  ContentType.audio: 'audio',
};

_$ContentPartInputAudioImpl _$$ContentPartInputAudioImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPartInputAudioImpl(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.inputAudio,
      audio: json['audio'] as String?,
      transcript: json['transcript'] as String?,
    );

Map<String, dynamic> _$$ContentPartInputAudioImplToJson(
        _$ContentPartInputAudioImpl instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      if (instance.audio case final value?) 'audio': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

_$ContentPartTextImpl _$$ContentPartTextImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPartTextImpl(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.text,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$ContentPartTextImplToJson(
        _$ContentPartTextImpl instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

_$ContentPartAudioImpl _$$ContentPartAudioImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPartAudioImpl(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.audio,
      audio: json['audio'] as String?,
      transcript: json['transcript'] as String?,
    );

Map<String, dynamic> _$$ContentPartAudioImplToJson(
        _$ContentPartAudioImpl instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      if (instance.audio case final value?) 'audio': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

_$ItemMessageImpl _$$ItemMessageImplFromJson(Map<String, dynamic> json) =>
    _$ItemMessageImpl(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      type: $enumDecodeNullable(_$ItemTypeEnumMap, json['type']) ??
          ItemType.message,
      status: $enumDecodeNullable(_$ItemStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      role: $enumDecode(_$ItemRoleEnumMap, json['role']),
      content: (json['content'] as List<dynamic>)
          .map((e) => ContentPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ItemMessageImplToJson(_$ItemMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (_$ObjectTypeEnumMap[instance.object] case final value?)
        'object': value,
      'type': _$ItemTypeEnumMap[instance.type]!,
      if (_$ItemStatusEnumMap[instance.status] case final value?)
        'status': value,
      'role': _$ItemRoleEnumMap[instance.role]!,
      'content': instance.content.map((e) => e.toJson()).toList(),
    };

const _$ItemTypeEnumMap = {
  ItemType.message: 'message',
  ItemType.functionCall: 'function_call',
  ItemType.functionCallOutput: 'function_call_output',
};

const _$ItemStatusEnumMap = {
  ItemStatus.completed: 'completed',
  ItemStatus.inProgress: 'in_progress',
  ItemStatus.incomplete: 'incomplete',
};

const _$ItemRoleEnumMap = {
  ItemRole.user: 'user',
  ItemRole.assistant: 'assistant',
  ItemRole.system: 'system',
};

_$ItemFunctionCallImpl _$$ItemFunctionCallImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemFunctionCallImpl(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object']) ??
          ObjectType.realtimeItem,
      type: $enumDecodeNullable(_$ItemTypeEnumMap, json['type']) ??
          ItemType.functionCall,
      status: $enumDecodeNullable(_$ItemStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      callId: json['call_id'] as String,
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$$ItemFunctionCallImplToJson(
        _$ItemFunctionCallImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ObjectTypeEnumMap[instance.object]!,
      'type': _$ItemTypeEnumMap[instance.type]!,
      if (_$ItemStatusEnumMap[instance.status] case final value?)
        'status': value,
      'call_id': instance.callId,
      'name': instance.name,
      'arguments': instance.arguments,
    };

_$ItemFunctionCallOutputImpl _$$ItemFunctionCallOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemFunctionCallOutputImpl(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      type: $enumDecodeNullable(_$ItemTypeEnumMap, json['type']) ??
          ItemType.functionCallOutput,
      status: $enumDecodeNullable(_$ItemStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      callId: json['call_id'] as String,
      output: json['output'] as String,
    );

Map<String, dynamic> _$$ItemFunctionCallOutputImplToJson(
        _$ItemFunctionCallOutputImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (_$ObjectTypeEnumMap[instance.object] case final value?)
        'object': value,
      'type': _$ItemTypeEnumMap[instance.type]!,
      if (_$ItemStatusEnumMap[instance.status] case final value?)
        'status': value,
      'call_id': instance.callId,
      'output': instance.output,
    };

_$ResponseStatusDetailsCancelledImpl
    _$$ResponseStatusDetailsCancelledImplFromJson(Map<String, dynamic> json) =>
        _$ResponseStatusDetailsCancelledImpl(
          type:
              $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
                  ResponseStatusType.cancelled,
          reason: $enumDecodeNullable(
              _$ResponseStatusIncompleteReasonEnumMap, json['reason'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
        );

Map<String, dynamic> _$$ResponseStatusDetailsCancelledImplToJson(
        _$ResponseStatusDetailsCancelledImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (_$ResponseStatusIncompleteReasonEnumMap[instance.reason]
          case final value?)
        'reason': value,
    };

const _$ResponseStatusTypeEnumMap = {
  ResponseStatusType.cancelled: 'cancelled',
  ResponseStatusType.incomplete: 'incomplete',
  ResponseStatusType.failed: 'failed',
};

const _$ResponseStatusIncompleteReasonEnumMap = {
  ResponseStatusIncompleteReason.turnDetected: 'turn_detected',
  ResponseStatusIncompleteReason.clientCancelled: 'client_cancelled',
  ResponseStatusIncompleteReason.interruption: 'interruption',
  ResponseStatusIncompleteReason.maxOutputTokens: 'max_output_tokens',
  ResponseStatusIncompleteReason.contentFilter: 'content_filter',
};

_$ResponseStatusDetailsIncompleteImpl
    _$$ResponseStatusDetailsIncompleteImplFromJson(Map<String, dynamic> json) =>
        _$ResponseStatusDetailsIncompleteImpl(
          type:
              $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
                  ResponseStatusType.incomplete,
          reason: $enumDecodeNullable(
              _$ResponseStatusIncompleteReasonEnumMap, json['reason'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
        );

Map<String, dynamic> _$$ResponseStatusDetailsIncompleteImplToJson(
        _$ResponseStatusDetailsIncompleteImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (_$ResponseStatusIncompleteReasonEnumMap[instance.reason]
          case final value?)
        'reason': value,
    };

_$ResponseStatusDetailsFailedImpl _$$ResponseStatusDetailsFailedImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseStatusDetailsFailedImpl(
      type: $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
          ResponseStatusType.failed,
      error: json['error'] == null
          ? null
          : APIError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseStatusDetailsFailedImplToJson(
        _$ResponseStatusDetailsFailedImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (instance.error?.toJson() case final value?) 'error': value,
    };

_$RealtimeEventConversationItemCreateImpl
    _$$RealtimeEventConversationItemCreateImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemCreateImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCreate,
          previousItemId: json['previous_item_id'] as String?,
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemCreateImplToJson(
        _$RealtimeEventConversationItemCreateImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.previousItemId case final value?) 'previous_item_id': value,
      'item': instance.item.toJson(),
    };

const _$RealtimeEventTypeEnumMap = {
  RealtimeEventType.conversationItemCreate: 'conversation.item.create',
  RealtimeEventType.conversationItemDelete: 'conversation.item.delete',
  RealtimeEventType.conversationItemTruncate: 'conversation.item.truncate',
  RealtimeEventType.inputAudioBufferAppend: 'input_audio_buffer.append',
  RealtimeEventType.inputAudioBufferClear: 'input_audio_buffer.clear',
  RealtimeEventType.inputAudioBufferCommit: 'input_audio_buffer.commit',
  RealtimeEventType.responseCancel: 'response.cancel',
  RealtimeEventType.responseCreate: 'response.create',
  RealtimeEventType.sessionUpdate: 'session.update',
  RealtimeEventType.conversationCreated: 'conversation.created',
  RealtimeEventType.conversationItemCreated: 'conversation.item.created',
  RealtimeEventType.conversationItemDeleted: 'conversation.item.deleted',
  RealtimeEventType.conversationItemInputAudioTranscriptionCompleted:
      'conversation.item.input_audio_transcription.completed',
  RealtimeEventType.conversationItemInputAudioTranscriptionFailed:
      'conversation.item.input_audio_transcription.failed',
  RealtimeEventType.conversationItemTruncated: 'conversation.item.truncated',
  RealtimeEventType.error: 'error',
  RealtimeEventType.inputAudioBufferCleared: 'input_audio_buffer.cleared',
  RealtimeEventType.inputAudioBufferCommitted: 'input_audio_buffer.committed',
  RealtimeEventType.inputAudioBufferSpeechStarted:
      'input_audio_buffer.speech_started',
  RealtimeEventType.inputAudioBufferSpeechStopped:
      'input_audio_buffer.speech_stopped',
  RealtimeEventType.rateLimitsUpdated: 'rate_limits.updated',
  RealtimeEventType.responseAudioDelta: 'response.audio.delta',
  RealtimeEventType.responseAudioDone: 'response.audio.done',
  RealtimeEventType.responseAudioTranscriptDelta:
      'response.audio_transcript.delta',
  RealtimeEventType.responseAudioTranscriptDone:
      'response.audio_transcript.done',
  RealtimeEventType.responseContentPartAdded: 'response.content_part.added',
  RealtimeEventType.responseContentPartDone: 'response.content_part.done',
  RealtimeEventType.responseCreated: 'response.created',
  RealtimeEventType.responseDone: 'response.done',
  RealtimeEventType.responseFunctionCallArgumentsDelta:
      'response.function_call_arguments.delta',
  RealtimeEventType.responseFunctionCallArgumentsDone:
      'response.function_call_arguments.done',
  RealtimeEventType.responseOutputItemAdded: 'response.output_item.added',
  RealtimeEventType.responseOutputItemDone: 'response.output_item.done',
  RealtimeEventType.responseTextDelta: 'response.text.delta',
  RealtimeEventType.responseTextDone: 'response.text.done',
  RealtimeEventType.sessionCreated: 'session.created',
  RealtimeEventType.sessionUpdated: 'session.updated',
  RealtimeEventType.close: 'close',
  RealtimeEventType.conversationInterrupted: 'conversation.interrupted',
  RealtimeEventType.conversationUpdated: 'conversation.updated',
  RealtimeEventType.conversationItemAppended: 'conversation.item.appended',
  RealtimeEventType.conversationItemCompleted: 'conversation.item.completed',
  RealtimeEventType.realtimeEvent: 'realtime.event',
  RealtimeEventType.all: 'all',
  RealtimeEventType.serverAll: 'server.all',
  RealtimeEventType.clientAll: 'client.all',
};

_$RealtimeEventConversationItemDeleteImpl
    _$$RealtimeEventConversationItemDeleteImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemDeleteImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemDelete,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$$RealtimeEventConversationItemDeleteImplToJson(
        _$RealtimeEventConversationItemDeleteImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
    };

_$RealtimeEventConversationItemTruncateImpl
    _$$RealtimeEventConversationItemTruncateImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemTruncateImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemTruncate,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemTruncateImplToJson(
        _$RealtimeEventConversationItemTruncateImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      'content_index': instance.contentIndex,
      'audio_end_ms': instance.audioEndMs,
    };

_$RealtimeEventInputAudioBufferAppendImpl
    _$$RealtimeEventInputAudioBufferAppendImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferAppendImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferAppend,
          audio: json['audio'] as String,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferAppendImplToJson(
        _$RealtimeEventInputAudioBufferAppendImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio': instance.audio,
    };

_$RealtimeEventInputAudioBufferClearImpl
    _$$RealtimeEventInputAudioBufferClearImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferClearImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferClear,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferClearImplToJson(
        _$RealtimeEventInputAudioBufferClearImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

_$RealtimeEventInputAudioBufferCommitImpl
    _$$RealtimeEventInputAudioBufferCommitImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferCommitImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCommit,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferCommitImplToJson(
        _$RealtimeEventInputAudioBufferCommitImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

_$RealtimeEventResponseCancelImpl _$$RealtimeEventResponseCancelImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventResponseCancelImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCancel,
    );

Map<String, dynamic> _$$RealtimeEventResponseCancelImplToJson(
        _$RealtimeEventResponseCancelImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

_$RealtimeEventResponseCreateImpl _$$RealtimeEventResponseCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventResponseCreateImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCreate,
      response: json['response'] == null
          ? null
          : ResponseConfig.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventResponseCreateImplToJson(
        _$RealtimeEventResponseCreateImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.response?.toJson() case final value?) 'response': value,
    };

_$RealtimeEventSessionUpdateImpl _$$RealtimeEventSessionUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventSessionUpdateImpl(
      eventId: json['event_id'] as String?,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionUpdate,
      session: SessionConfig.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventSessionUpdateImplToJson(
        _$RealtimeEventSessionUpdateImpl instance) =>
    <String, dynamic>{
      if (instance.eventId case final value?) 'event_id': value,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

_$RealtimeEventConversationCreatedImpl
    _$$RealtimeEventConversationCreatedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationCreatedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationCreated,
          conversation: Conversation.fromJson(
              json['conversation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationCreatedImplToJson(
        _$RealtimeEventConversationCreatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'conversation': instance.conversation.toJson(),
    };

_$RealtimeEventConversationItemCreatedImpl
    _$$RealtimeEventConversationItemCreatedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemCreatedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCreated,
          previousItemId: json['previous_item_id'] as String?,
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemCreatedImplToJson(
        _$RealtimeEventConversationItemCreatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'previous_item_id': instance.previousItemId,
      'item': instance.item.toJson(),
    };

_$RealtimeEventConversationItemDeletedImpl
    _$$RealtimeEventConversationItemDeletedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemDeletedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemDeleted,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$$RealtimeEventConversationItemDeletedImplToJson(
        _$RealtimeEventConversationItemDeletedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
    };

_$RealtimeEventConversationItemInputAudioTranscriptionCompletedImpl
    _$$RealtimeEventConversationItemInputAudioTranscriptionCompletedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemInputAudioTranscriptionCompletedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType
                  .conversationItemInputAudioTranscriptionCompleted,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          transcript: json['transcript'] as String,
        );

Map<String, dynamic>
    _$$RealtimeEventConversationItemInputAudioTranscriptionCompletedImplToJson(
            _$RealtimeEventConversationItemInputAudioTranscriptionCompletedImpl
                instance) =>
        <String, dynamic>{
          'event_id': instance.eventId,
          'type': _$RealtimeEventTypeEnumMap[instance.type]!,
          'item_id': instance.itemId,
          'content_index': instance.contentIndex,
          'transcript': instance.transcript,
        };

_$RealtimeEventConversationItemInputAudioTranscriptionFailedImpl
    _$$RealtimeEventConversationItemInputAudioTranscriptionFailedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemInputAudioTranscriptionFailedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemInputAudioTranscriptionFailed,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          error: TranscriptionError.fromJson(
              json['error'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$RealtimeEventConversationItemInputAudioTranscriptionFailedImplToJson(
            _$RealtimeEventConversationItemInputAudioTranscriptionFailedImpl
                instance) =>
        <String, dynamic>{
          'event_id': instance.eventId,
          'type': _$RealtimeEventTypeEnumMap[instance.type]!,
          'item_id': instance.itemId,
          'content_index': instance.contentIndex,
          'error': instance.error.toJson(),
        };

_$RealtimeEventConversationItemTruncatedImpl
    _$$RealtimeEventConversationItemTruncatedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemTruncatedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemTruncated,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemTruncatedImplToJson(
        _$RealtimeEventConversationItemTruncatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      'content_index': instance.contentIndex,
      'audio_end_ms': instance.audioEndMs,
    };

_$RealtimeEventErrorImpl _$$RealtimeEventErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventErrorImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.error,
      error: APIError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventErrorImplToJson(
        _$RealtimeEventErrorImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'error': instance.error.toJson(),
    };

_$RealtimeEventInputAudioBufferClearedImpl
    _$$RealtimeEventInputAudioBufferClearedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferClearedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCleared,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferClearedImplToJson(
        _$RealtimeEventInputAudioBufferClearedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

_$RealtimeEventInputAudioBufferCommittedImpl
    _$$RealtimeEventInputAudioBufferCommittedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferCommittedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCommitted,
          previousItemId: json['previous_item_id'] as String,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferCommittedImplToJson(
        _$RealtimeEventInputAudioBufferCommittedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'previous_item_id': instance.previousItemId,
      'item_id': instance.itemId,
    };

_$RealtimeEventInputAudioBufferSpeechStartedImpl
    _$$RealtimeEventInputAudioBufferSpeechStartedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferSpeechStartedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferSpeechStarted,
          audioStartMs: (json['audio_start_ms'] as num).toInt(),
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferSpeechStartedImplToJson(
        _$RealtimeEventInputAudioBufferSpeechStartedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio_start_ms': instance.audioStartMs,
      'item_id': instance.itemId,
    };

_$RealtimeEventInputAudioBufferSpeechStoppedImpl
    _$$RealtimeEventInputAudioBufferSpeechStoppedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventInputAudioBufferSpeechStoppedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferSpeechStopped,
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$$RealtimeEventInputAudioBufferSpeechStoppedImplToJson(
        _$RealtimeEventInputAudioBufferSpeechStoppedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio_end_ms': instance.audioEndMs,
      'item_id': instance.itemId,
    };

_$RealtimeEventRateLimitsUpdatedImpl
    _$$RealtimeEventRateLimitsUpdatedImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeEventRateLimitsUpdatedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.rateLimitsUpdated,
          rateLimits: (json['rate_limits'] as List<dynamic>)
              .map((e) => RateLimit.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RealtimeEventRateLimitsUpdatedImplToJson(
        _$RealtimeEventRateLimitsUpdatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'rate_limits': instance.rateLimits.map((e) => e.toJson()).toList(),
    };

_$RealtimeEventResponseAudioDeltaImpl
    _$$RealtimeEventResponseAudioDeltaImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeEventResponseAudioDeltaImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          delta: json['delta'] as String,
        );

Map<String, dynamic> _$$RealtimeEventResponseAudioDeltaImplToJson(
        _$RealtimeEventResponseAudioDeltaImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

_$RealtimeEventResponseAudioDoneImpl
    _$$RealtimeEventResponseAudioDoneImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeEventResponseAudioDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
        );

Map<String, dynamic> _$$RealtimeEventResponseAudioDoneImplToJson(
        _$RealtimeEventResponseAudioDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
    };

_$RealtimeEventResponseAudioTranscriptDeltaImpl
    _$$RealtimeEventResponseAudioTranscriptDeltaImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseAudioTranscriptDeltaImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioTranscriptDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          delta: json['delta'] as String,
        );

Map<String, dynamic> _$$RealtimeEventResponseAudioTranscriptDeltaImplToJson(
        _$RealtimeEventResponseAudioTranscriptDeltaImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

_$RealtimeEventResponseAudioTranscriptDoneImpl
    _$$RealtimeEventResponseAudioTranscriptDoneImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseAudioTranscriptDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioTranscriptDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          transcript: json['transcript'] as String,
        );

Map<String, dynamic> _$$RealtimeEventResponseAudioTranscriptDoneImplToJson(
        _$RealtimeEventResponseAudioTranscriptDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'transcript': instance.transcript,
    };

_$RealtimeEventResponseContentPartAddedImpl
    _$$RealtimeEventResponseContentPartAddedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseContentPartAddedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseContentPartAdded,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          part: ContentPart.fromJson(json['part'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventResponseContentPartAddedImplToJson(
        _$RealtimeEventResponseContentPartAddedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'part': instance.part.toJson(),
    };

_$RealtimeEventResponseContentPartDoneImpl
    _$$RealtimeEventResponseContentPartDoneImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseContentPartDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseContentPartDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          part: ContentPart.fromJson(json['part'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventResponseContentPartDoneImplToJson(
        _$RealtimeEventResponseContentPartDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'part': instance.part.toJson(),
    };

_$RealtimeEventResponseCreatedImpl _$$RealtimeEventResponseCreatedImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventResponseCreatedImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCreated,
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventResponseCreatedImplToJson(
        _$RealtimeEventResponseCreatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response': instance.response.toJson(),
    };

_$RealtimeEventResponseDoneImpl _$$RealtimeEventResponseDoneImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventResponseDoneImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseDone,
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventResponseDoneImplToJson(
        _$RealtimeEventResponseDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response': instance.response.toJson(),
    };

_$RealtimeEventResponseFunctionCallArgumentsDeltaImpl
    _$$RealtimeEventResponseFunctionCallArgumentsDeltaImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseFunctionCallArgumentsDeltaImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseFunctionCallArgumentsDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          callId: json['call_id'] as String,
          delta: json['delta'] as String,
        );

Map<String, dynamic>
    _$$RealtimeEventResponseFunctionCallArgumentsDeltaImplToJson(
            _$RealtimeEventResponseFunctionCallArgumentsDeltaImpl instance) =>
        <String, dynamic>{
          'event_id': instance.eventId,
          'type': _$RealtimeEventTypeEnumMap[instance.type]!,
          'response_id': instance.responseId,
          'item_id': instance.itemId,
          'output_index': instance.outputIndex,
          'call_id': instance.callId,
          'delta': instance.delta,
        };

_$RealtimeEventResponseFunctionCallArgumentsDoneImpl
    _$$RealtimeEventResponseFunctionCallArgumentsDoneImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseFunctionCallArgumentsDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseFunctionCallArgumentsDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          callId: json['call_id'] as String,
          arguments: json['arguments'] as String,
        );

Map<String, dynamic>
    _$$RealtimeEventResponseFunctionCallArgumentsDoneImplToJson(
            _$RealtimeEventResponseFunctionCallArgumentsDoneImpl instance) =>
        <String, dynamic>{
          'event_id': instance.eventId,
          'type': _$RealtimeEventTypeEnumMap[instance.type]!,
          'response_id': instance.responseId,
          'item_id': instance.itemId,
          'output_index': instance.outputIndex,
          'call_id': instance.callId,
          'arguments': instance.arguments,
        };

_$RealtimeEventResponseOutputItemAddedImpl
    _$$RealtimeEventResponseOutputItemAddedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseOutputItemAddedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseOutputItemAdded,
          responseId: json['response_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventResponseOutputItemAddedImplToJson(
        _$RealtimeEventResponseOutputItemAddedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'output_index': instance.outputIndex,
      'item': instance.item.toJson(),
    };

_$RealtimeEventResponseOutputItemDoneImpl
    _$$RealtimeEventResponseOutputItemDoneImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventResponseOutputItemDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseOutputItemDone,
          responseId: json['response_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventResponseOutputItemDoneImplToJson(
        _$RealtimeEventResponseOutputItemDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'output_index': instance.outputIndex,
      'item': instance.item.toJson(),
    };

_$RealtimeEventResponseTextDeltaImpl
    _$$RealtimeEventResponseTextDeltaImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeEventResponseTextDeltaImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseTextDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          delta: json['delta'] as String,
        );

Map<String, dynamic> _$$RealtimeEventResponseTextDeltaImplToJson(
        _$RealtimeEventResponseTextDeltaImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

_$RealtimeEventResponseTextDoneImpl
    _$$RealtimeEventResponseTextDoneImplFromJson(Map<String, dynamic> json) =>
        _$RealtimeEventResponseTextDoneImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseTextDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          text: json['text'] as String,
        );

Map<String, dynamic> _$$RealtimeEventResponseTextDoneImplToJson(
        _$RealtimeEventResponseTextDoneImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'text': instance.text,
    };

_$RealtimeEventSessionCreatedImpl _$$RealtimeEventSessionCreatedImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventSessionCreatedImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionCreated,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventSessionCreatedImplToJson(
        _$RealtimeEventSessionCreatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

_$RealtimeEventSessionUpdatedImpl _$$RealtimeEventSessionUpdatedImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventSessionUpdatedImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionUpdated,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventSessionUpdatedImplToJson(
        _$RealtimeEventSessionUpdatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

_$RealtimeEventCloseImpl _$$RealtimeEventCloseImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventCloseImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.close,
      error: json['error'] as bool,
    );

Map<String, dynamic> _$$RealtimeEventCloseImplToJson(
        _$RealtimeEventCloseImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'error': instance.error,
    };

_$RealtimeEventConversationInterruptedImpl
    _$$RealtimeEventConversationInterruptedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationInterruptedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationInterrupted,
        );

Map<String, dynamic> _$$RealtimeEventConversationInterruptedImplToJson(
        _$RealtimeEventConversationInterruptedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

_$RealtimeEventConversationUpdatedImpl
    _$$RealtimeEventConversationUpdatedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationUpdatedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationUpdated,
          result: EventHandlerResult.fromJson(
              json['result'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationUpdatedImplToJson(
        _$RealtimeEventConversationUpdatedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'result': instance.result.toJson(),
    };

_$RealtimeEventConversationItemAppendedImpl
    _$$RealtimeEventConversationItemAppendedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemAppendedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemAppended,
          item: FormattedItem.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemAppendedImplToJson(
        _$RealtimeEventConversationItemAppendedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item': instance.item.toJson(),
    };

_$RealtimeEventConversationItemCompletedImpl
    _$$RealtimeEventConversationItemCompletedImplFromJson(
            Map<String, dynamic> json) =>
        _$RealtimeEventConversationItemCompletedImpl(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCompleted,
          item: FormattedItem.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RealtimeEventConversationItemCompletedImplToJson(
        _$RealtimeEventConversationItemCompletedImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item': instance.item.toJson(),
    };

_$RealtimeEventGenericImpl _$$RealtimeEventGenericImplFromJson(
        Map<String, dynamic> json) =>
    _$RealtimeEventGenericImpl(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.realtimeEvent,
      event: RealtimeEvent.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RealtimeEventGenericImplToJson(
        _$RealtimeEventGenericImpl instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'event': instance.event.toJson(),
    };
