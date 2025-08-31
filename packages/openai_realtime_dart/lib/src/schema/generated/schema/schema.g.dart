// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolDefinition _$ToolDefinitionFromJson(Map<String, dynamic> json) =>
    _ToolDefinition(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'],
    );

Map<String, dynamic> _$ToolDefinitionToJson(_ToolDefinition instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.parameters case final value?) 'parameters': value,
    };

const _$ToolTypeEnumMap = {
  ToolType.function: 'function',
};

_ToolChoiceForced _$ToolChoiceForcedFromJson(Map<String, dynamic> json) =>
    _ToolChoiceForced(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ToolChoiceForcedToJson(_ToolChoiceForced instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

_ContentPartItemReference _$ContentPartItemReferenceFromJson(
        Map<String, dynamic> json) =>
    _ContentPartItemReference(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.itemReference,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ContentPartItemReferenceToJson(
        _ContentPartItemReference instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      if (instance.id case final value?) 'id': value,
    };

const _$ContentTypeEnumMap = {
  ContentType.inputText: 'input_text',
  ContentType.inputAudio: 'input_audio',
  ContentType.itemReference: 'item_reference',
  ContentType.text: 'text',
  ContentType.audio: 'audio',
};

_InputAudioTranscriptionConfig _$InputAudioTranscriptionConfigFromJson(
        Map<String, dynamic> json) =>
    _InputAudioTranscriptionConfig(
      model: json['model'] as String?,
      language: json['language'] as String?,
      prompt: json['prompt'] as String?,
    );

Map<String, dynamic> _$InputAudioTranscriptionConfigToJson(
        _InputAudioTranscriptionConfig instance) =>
    <String, dynamic>{
      if (instance.model case final value?) 'model': value,
      if (instance.language case final value?) 'language': value,
      if (instance.prompt case final value?) 'prompt': value,
    };

_TurnDetection _$TurnDetectionFromJson(Map<String, dynamic> json) =>
    _TurnDetection(
      type: $enumDecode(_$TurnDetectionTypeEnumMap, json['type']),
      threshold: (json['threshold'] as num?)?.toDouble(),
      prefixPaddingMs: (json['prefix_padding_ms'] as num?)?.toInt(),
      silenceDurationMs: (json['silence_duration_ms'] as num?)?.toInt(),
      createResponse: json['create_response'] as bool? ?? true,
    );

Map<String, dynamic> _$TurnDetectionToJson(_TurnDetection instance) =>
    <String, dynamic>{
      'type': _$TurnDetectionTypeEnumMap[instance.type]!,
      if (instance.threshold case final value?) 'threshold': value,
      if (instance.prefixPaddingMs case final value?)
        'prefix_padding_ms': value,
      if (instance.silenceDurationMs case final value?)
        'silence_duration_ms': value,
      'create_response': instance.createResponse,
    };

const _$TurnDetectionTypeEnumMap = {
  TurnDetectionType.serverVad: 'server_vad',
};

_RateLimit _$RateLimitFromJson(Map<String, dynamic> json) => _RateLimit(
      name: $enumDecode(_$RateLimitNameEnumMap, json['name']),
      limit: (json['limit'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
      resetSeconds: (json['reset_seconds'] as num).toDouble(),
    );

Map<String, dynamic> _$RateLimitToJson(_RateLimit instance) =>
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

_Response _$ResponseFromJson(Map<String, dynamic> json) => _Response(
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
      metadata: json['metadata'] as Map<String, dynamic>?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(_Response instance) => <String, dynamic>{
      'id': instance.id,
      'object': _$ObjectTypeEnumMap[instance.object]!,
      'status': _$ResponseStatusEnumMap[instance.status]!,
      if (instance.statusDetails?.toJson() case final value?)
        'status_details': value,
      'output': instance.output.map((e) => e.toJson()).toList(),
      if (instance.metadata case final value?) 'metadata': value,
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

_ResponseConfig _$ResponseConfigFromJson(Map<String, dynamic> json) =>
    _ResponseConfig(
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
      conversation: const _ResponseConfigConversationConverter()
          .fromJson(json['conversation']),
      metadata: json['metadata'] as Map<String, dynamic>?,
      input: (json['input'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseConfigToJson(_ResponseConfig instance) =>
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
      if (const _ResponseConfigConversationConverter()
              .toJson(instance.conversation)
          case final value?)
        'conversation': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.input?.map((e) => e.toJson()).toList() case final value?)
        'input': value,
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

ResponseConfigToolChoiceEnumeration
    _$ResponseConfigToolChoiceEnumerationFromJson(Map<String, dynamic> json) =>
        ResponseConfigToolChoiceEnumeration(
          $enumDecode(_$ResponseConfigToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ResponseConfigToolChoiceEnumerationToJson(
        ResponseConfigToolChoiceEnumeration instance) =>
    <String, dynamic>{
      'value': _$ResponseConfigToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ResponseConfigToolChoiceModeEnumMap = {
  ResponseConfigToolChoiceMode.none: 'none',
  ResponseConfigToolChoiceMode.auto: 'auto',
  ResponseConfigToolChoiceMode.required: 'required',
};

ResponseConfigToolChoiceToolChoiceForced
    _$ResponseConfigToolChoiceToolChoiceForcedFromJson(
            Map<String, dynamic> json) =>
        ResponseConfigToolChoiceToolChoiceForced(
          ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ResponseConfigToolChoiceToolChoiceForcedToJson(
        ResponseConfigToolChoiceToolChoiceForced instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

ResponseConfigMaxResponseOutputTokensInt
    _$ResponseConfigMaxResponseOutputTokensIntFromJson(
            Map<String, dynamic> json) =>
        ResponseConfigMaxResponseOutputTokensInt(
          (json['value'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ResponseConfigMaxResponseOutputTokensIntToJson(
        ResponseConfigMaxResponseOutputTokensInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ResponseConfigMaxResponseOutputTokensString
    _$ResponseConfigMaxResponseOutputTokensStringFromJson(
            Map<String, dynamic> json) =>
        ResponseConfigMaxResponseOutputTokensString(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ResponseConfigMaxResponseOutputTokensStringToJson(
        ResponseConfigMaxResponseOutputTokensString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ResponseConfigConversationEnumeration
    _$ResponseConfigConversationEnumerationFromJson(
            Map<String, dynamic> json) =>
        ResponseConfigConversationEnumeration(
          $enumDecode(_$ResponseConfigConversationEnumEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ResponseConfigConversationEnumerationToJson(
        ResponseConfigConversationEnumeration instance) =>
    <String, dynamic>{
      'value': _$ResponseConfigConversationEnumEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ResponseConfigConversationEnumEnumMap = {
  ResponseConfigConversationEnum.auto: 'auto',
  ResponseConfigConversationEnum.none: 'none',
};

ResponseConfigConversationString _$ResponseConfigConversationStringFromJson(
        Map<String, dynamic> json) =>
    ResponseConfigConversationString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ResponseConfigConversationStringToJson(
        ResponseConfigConversationString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_Usage _$UsageFromJson(Map<String, dynamic> json) => _Usage(
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

Map<String, dynamic> _$UsageToJson(_Usage instance) => <String, dynamic>{
      if (instance.totalTokens case final value?) 'total_tokens': value,
      if (instance.inputTokens case final value?) 'input_tokens': value,
      if (instance.outputTokens case final value?) 'output_tokens': value,
      if (instance.inputTokenDetails?.toJson() case final value?)
        'input_token_details': value,
      if (instance.outputTokenDetails?.toJson() case final value?)
        'output_token_details': value,
    };

_UsageInputTokenDetails _$UsageInputTokenDetailsFromJson(
        Map<String, dynamic> json) =>
    _UsageInputTokenDetails(
      cachedTokens: (json['cached_tokens'] as num?)?.toInt(),
      textTokens: (json['text_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageInputTokenDetailsToJson(
        _UsageInputTokenDetails instance) =>
    <String, dynamic>{
      if (instance.cachedTokens case final value?) 'cached_tokens': value,
      if (instance.textTokens case final value?) 'text_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
    };

_UsageOutputTokenDetails _$UsageOutputTokenDetailsFromJson(
        Map<String, dynamic> json) =>
    _UsageOutputTokenDetails(
      textTokens: (json['text_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageOutputTokenDetailsToJson(
        _UsageOutputTokenDetails instance) =>
    <String, dynamic>{
      if (instance.textTokens case final value?) 'text_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
    };

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
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

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
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

SessionToolChoiceEnumeration _$SessionToolChoiceEnumerationFromJson(
        Map<String, dynamic> json) =>
    SessionToolChoiceEnumeration(
      $enumDecode(_$SessionToolChoiceModeEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionToolChoiceEnumerationToJson(
        SessionToolChoiceEnumeration instance) =>
    <String, dynamic>{
      'value': _$SessionToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$SessionToolChoiceModeEnumMap = {
  SessionToolChoiceMode.none: 'none',
  SessionToolChoiceMode.auto: 'auto',
  SessionToolChoiceMode.required: 'required',
};

SessionToolChoiceToolChoiceForced _$SessionToolChoiceToolChoiceForcedFromJson(
        Map<String, dynamic> json) =>
    SessionToolChoiceToolChoiceForced(
      ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionToolChoiceToolChoiceForcedToJson(
        SessionToolChoiceToolChoiceForced instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

SessionMaxResponseOutputTokensInt _$SessionMaxResponseOutputTokensIntFromJson(
        Map<String, dynamic> json) =>
    SessionMaxResponseOutputTokensInt(
      (json['value'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionMaxResponseOutputTokensIntToJson(
        SessionMaxResponseOutputTokensInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

SessionMaxResponseOutputTokensString
    _$SessionMaxResponseOutputTokensStringFromJson(Map<String, dynamic> json) =>
        SessionMaxResponseOutputTokensString(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$SessionMaxResponseOutputTokensStringToJson(
        SessionMaxResponseOutputTokensString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_SessionConfig _$SessionConfigFromJson(Map<String, dynamic> json) =>
    _SessionConfig(
      clientSecret: json['client_secret'] == null
          ? null
          : SessionConfigClientSecret.fromJson(
              json['client_secret'] as Map<String, dynamic>),
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

Map<String, dynamic> _$SessionConfigToJson(_SessionConfig instance) =>
    <String, dynamic>{
      if (instance.clientSecret?.toJson() case final value?)
        'client_secret': value,
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
      'turn_detection': instance.turnDetection?.toJson(),
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

_SessionConfigClientSecret _$SessionConfigClientSecretFromJson(
        Map<String, dynamic> json) =>
    _SessionConfigClientSecret(
      value: json['value'] as String?,
      expiresAt: (json['expires_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SessionConfigClientSecretToJson(
        _SessionConfigClientSecret instance) =>
    <String, dynamic>{
      if (instance.value case final value?) 'value': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
    };

SessionConfigToolChoiceEnumeration _$SessionConfigToolChoiceEnumerationFromJson(
        Map<String, dynamic> json) =>
    SessionConfigToolChoiceEnumeration(
      $enumDecode(_$SessionConfigToolChoiceModeEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SessionConfigToolChoiceEnumerationToJson(
        SessionConfigToolChoiceEnumeration instance) =>
    <String, dynamic>{
      'value': _$SessionConfigToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$SessionConfigToolChoiceModeEnumMap = {
  SessionConfigToolChoiceMode.none: 'none',
  SessionConfigToolChoiceMode.auto: 'auto',
  SessionConfigToolChoiceMode.required: 'required',
};

SessionConfigToolChoiceToolChoiceForced
    _$SessionConfigToolChoiceToolChoiceForcedFromJson(
            Map<String, dynamic> json) =>
        SessionConfigToolChoiceToolChoiceForced(
          ToolChoiceForced.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$SessionConfigToolChoiceToolChoiceForcedToJson(
        SessionConfigToolChoiceToolChoiceForced instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

SessionConfigMaxResponseOutputTokensInt
    _$SessionConfigMaxResponseOutputTokensIntFromJson(
            Map<String, dynamic> json) =>
        SessionConfigMaxResponseOutputTokensInt(
          (json['value'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$SessionConfigMaxResponseOutputTokensIntToJson(
        SessionConfigMaxResponseOutputTokensInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

SessionConfigMaxResponseOutputTokensString
    _$SessionConfigMaxResponseOutputTokensStringFromJson(
            Map<String, dynamic> json) =>
        SessionConfigMaxResponseOutputTokensString(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$SessionConfigMaxResponseOutputTokensStringToJson(
        SessionConfigMaxResponseOutputTokensString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      object: $enumDecodeNullable(_$ObjectTypeEnumMap, json['object']) ??
          ObjectType.realtimeConversation,
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ObjectTypeEnumMap[instance.object]!,
    };

_Delta _$DeltaFromJson(Map<String, dynamic> json) => _Delta(
      transcript: json['transcript'] as String?,
      audio: _$JsonConverterFromJson<List<int>, Uint8List>(
          json['audio'], const Uint8ListConverter().fromJson),
      text: json['text'] as String?,
      arguments: json['arguments'] as String?,
    );

Map<String, dynamic> _$DeltaToJson(_Delta instance) => <String, dynamic>{
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

_FormattedTool _$FormattedToolFromJson(Map<String, dynamic> json) =>
    _FormattedTool(
      type: $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ??
          ToolType.function,
      name: json['name'] as String,
      callId: json['call_id'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$FormattedToolToJson(_FormattedTool instance) =>
    <String, dynamic>{
      'type': _$ToolTypeEnumMap[instance.type]!,
      'name': instance.name,
      'call_id': instance.callId,
      'arguments': instance.arguments,
    };

_FormattedProperty _$FormattedPropertyFromJson(Map<String, dynamic> json) =>
    _FormattedProperty(
      audio: const Uint8ListConverter().fromJson(json['audio'] as List<int>),
      text: json['text'] as String,
      transcript: json['transcript'] as String,
      tool: json['tool'] == null
          ? null
          : FormattedTool.fromJson(json['tool'] as Map<String, dynamic>),
      output: json['output'] as String?,
    );

Map<String, dynamic> _$FormattedPropertyToJson(_FormattedProperty instance) =>
    <String, dynamic>{
      'audio': const Uint8ListConverter().toJson(instance.audio),
      'text': instance.text,
      'transcript': instance.transcript,
      if (instance.tool?.toJson() case final value?) 'tool': value,
      if (instance.output case final value?) 'output': value,
    };

_FormattedItem _$FormattedItemFromJson(Map<String, dynamic> json) =>
    _FormattedItem(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      formatted: json['formatted'] == null
          ? null
          : FormattedProperty.fromJson(
              json['formatted'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormattedItemToJson(_FormattedItem instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'formatted': instance.formatted?.toJson(),
    };

_ItemSpeech _$ItemSpeechFromJson(Map<String, dynamic> json) => _ItemSpeech(
      audioStartMs: (json['audioStartMs'] as num).toInt(),
      audioEndMs: (json['audioEndMs'] as num?)?.toInt(),
      audio: _$JsonConverterFromJson<List<int>, Uint8List>(
          json['audio'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$ItemSpeechToJson(_ItemSpeech instance) =>
    <String, dynamic>{
      'audioStartMs': instance.audioStartMs,
      if (instance.audioEndMs case final value?) 'audioEndMs': value,
      if (_$JsonConverterToJson<List<int>, Uint8List>(
              instance.audio, const Uint8ListConverter().toJson)
          case final value?)
        'audio': value,
    };

_ItemTranscript _$ItemTranscriptFromJson(Map<String, dynamic> json) =>
    _ItemTranscript(
      transcript: json['transcript'] as String,
    );

Map<String, dynamic> _$ItemTranscriptToJson(_ItemTranscript instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
    };

_EventHandlerResult _$EventHandlerResultFromJson(Map<String, dynamic> json) =>
    _EventHandlerResult(
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

Map<String, dynamic> _$EventHandlerResultToJson(_EventHandlerResult instance) =>
    <String, dynamic>{
      if (instance.item?.toJson() case final value?) 'item': value,
      if (instance.delta?.toJson() case final value?) 'delta': value,
      if (instance.response?.toJson() case final value?) 'response': value,
    };

_TranscriptionError _$TranscriptionErrorFromJson(Map<String, dynamic> json) =>
    _TranscriptionError(
      type: json['type'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$TranscriptionErrorToJson(_TranscriptionError instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
    };

_APIError _$APIErrorFromJson(Map<String, dynamic> json) => _APIError(
      type: json['type'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
      eventId: json['event_id'] as String?,
    );

Map<String, dynamic> _$APIErrorToJson(_APIError instance) => <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
      if (instance.eventId case final value?) 'event_id': value,
    };

ContentPartInputText _$ContentPartInputTextFromJson(
        Map<String, dynamic> json) =>
    ContentPartInputText(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.inputText,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ContentPartInputTextToJson(
        ContentPartInputText instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

ContentPartInputAudio _$ContentPartInputAudioFromJson(
        Map<String, dynamic> json) =>
    ContentPartInputAudio(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.inputAudio,
      audio: json['audio'] as String?,
      transcript: json['transcript'] as String?,
    );

Map<String, dynamic> _$ContentPartInputAudioToJson(
        ContentPartInputAudio instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      if (instance.audio case final value?) 'audio': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

ContentPartText _$ContentPartTextFromJson(Map<String, dynamic> json) =>
    ContentPartText(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.text,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ContentPartTextToJson(ContentPartText instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

ContentPartAudio _$ContentPartAudioFromJson(Map<String, dynamic> json) =>
    ContentPartAudio(
      type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']) ??
          ContentType.audio,
      audio: json['audio'] as String?,
      transcript: json['transcript'] as String?,
    );

Map<String, dynamic> _$ContentPartAudioToJson(ContentPartAudio instance) =>
    <String, dynamic>{
      'type': _$ContentTypeEnumMap[instance.type]!,
      if (instance.audio case final value?) 'audio': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

ItemMessage _$ItemMessageFromJson(Map<String, dynamic> json) => ItemMessage(
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

Map<String, dynamic> _$ItemMessageToJson(ItemMessage instance) =>
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

ItemFunctionCall _$ItemFunctionCallFromJson(Map<String, dynamic> json) =>
    ItemFunctionCall(
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

Map<String, dynamic> _$ItemFunctionCallToJson(ItemFunctionCall instance) =>
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

ItemFunctionCallOutput _$ItemFunctionCallOutputFromJson(
        Map<String, dynamic> json) =>
    ItemFunctionCallOutput(
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

Map<String, dynamic> _$ItemFunctionCallOutputToJson(
        ItemFunctionCallOutput instance) =>
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

ResponseStatusDetailsCompleted _$ResponseStatusDetailsCompletedFromJson(
        Map<String, dynamic> json) =>
    ResponseStatusDetailsCompleted(
      type: $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
          ResponseStatusType.completed,
      reason: $enumDecodeNullable(_$ResponseStatusReasonEnumMap, json['reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$ResponseStatusDetailsCompletedToJson(
        ResponseStatusDetailsCompleted instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (_$ResponseStatusReasonEnumMap[instance.reason] case final value?)
        'reason': value,
    };

const _$ResponseStatusTypeEnumMap = {
  ResponseStatusType.completed: 'completed',
  ResponseStatusType.cancelled: 'cancelled',
  ResponseStatusType.incomplete: 'incomplete',
  ResponseStatusType.failed: 'failed',
};

const _$ResponseStatusReasonEnumMap = {
  ResponseStatusReason.turnDetected: 'turn_detected',
  ResponseStatusReason.clientCancelled: 'client_cancelled',
  ResponseStatusReason.interruption: 'interruption',
  ResponseStatusReason.maxOutputTokens: 'max_output_tokens',
  ResponseStatusReason.contentFilter: 'content_filter',
};

ResponseStatusDetailsCancelled _$ResponseStatusDetailsCancelledFromJson(
        Map<String, dynamic> json) =>
    ResponseStatusDetailsCancelled(
      type: $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
          ResponseStatusType.cancelled,
      reason: $enumDecodeNullable(_$ResponseStatusReasonEnumMap, json['reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$ResponseStatusDetailsCancelledToJson(
        ResponseStatusDetailsCancelled instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (_$ResponseStatusReasonEnumMap[instance.reason] case final value?)
        'reason': value,
    };

ResponseStatusDetailsIncomplete _$ResponseStatusDetailsIncompleteFromJson(
        Map<String, dynamic> json) =>
    ResponseStatusDetailsIncomplete(
      type: $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
          ResponseStatusType.incomplete,
      reason: $enumDecodeNullable(_$ResponseStatusReasonEnumMap, json['reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$ResponseStatusDetailsIncompleteToJson(
        ResponseStatusDetailsIncomplete instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (_$ResponseStatusReasonEnumMap[instance.reason] case final value?)
        'reason': value,
    };

ResponseStatusDetailsFailed _$ResponseStatusDetailsFailedFromJson(
        Map<String, dynamic> json) =>
    ResponseStatusDetailsFailed(
      type: $enumDecodeNullable(_$ResponseStatusTypeEnumMap, json['type']) ??
          ResponseStatusType.failed,
      error: json['error'] == null
          ? null
          : APIError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseStatusDetailsFailedToJson(
        ResponseStatusDetailsFailed instance) =>
    <String, dynamic>{
      'type': _$ResponseStatusTypeEnumMap[instance.type]!,
      if (instance.error?.toJson() case final value?) 'error': value,
    };

RealtimeEventConversationItemCreate
    _$RealtimeEventConversationItemCreateFromJson(Map<String, dynamic> json) =>
        RealtimeEventConversationItemCreate(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCreate,
          previousItemId: json['previous_item_id'] as String?,
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventConversationItemCreateToJson(
        RealtimeEventConversationItemCreate instance) =>
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
  RealtimeEventType.conversationItemInputAudioTranscriptionDelta:
      'conversation.item.input_audio_transcription.delta',
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

RealtimeEventConversationItemDelete
    _$RealtimeEventConversationItemDeleteFromJson(Map<String, dynamic> json) =>
        RealtimeEventConversationItemDelete(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemDelete,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$RealtimeEventConversationItemDeleteToJson(
        RealtimeEventConversationItemDelete instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
    };

RealtimeEventConversationItemTruncate
    _$RealtimeEventConversationItemTruncateFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemTruncate(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemTruncate,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
        );

Map<String, dynamic> _$RealtimeEventConversationItemTruncateToJson(
        RealtimeEventConversationItemTruncate instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      'content_index': instance.contentIndex,
      'audio_end_ms': instance.audioEndMs,
    };

RealtimeEventInputAudioBufferAppend
    _$RealtimeEventInputAudioBufferAppendFromJson(Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferAppend(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferAppend,
          audio: json['audio'] as String,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferAppendToJson(
        RealtimeEventInputAudioBufferAppend instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio': instance.audio,
    };

RealtimeEventInputAudioBufferClear _$RealtimeEventInputAudioBufferClearFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventInputAudioBufferClear(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.inputAudioBufferClear,
    );

Map<String, dynamic> _$RealtimeEventInputAudioBufferClearToJson(
        RealtimeEventInputAudioBufferClear instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

RealtimeEventInputAudioBufferCommit
    _$RealtimeEventInputAudioBufferCommitFromJson(Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferCommit(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCommit,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferCommitToJson(
        RealtimeEventInputAudioBufferCommit instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

RealtimeEventResponseCancel _$RealtimeEventResponseCancelFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseCancel(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCancel,
      responseId: json['response_id'] as String?,
    );

Map<String, dynamic> _$RealtimeEventResponseCancelToJson(
        RealtimeEventResponseCancel instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.responseId case final value?) 'response_id': value,
    };

RealtimeEventResponseCreate _$RealtimeEventResponseCreateFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseCreate(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCreate,
      response: json['response'] == null
          ? null
          : ResponseConfig.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventResponseCreateToJson(
        RealtimeEventResponseCreate instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.response?.toJson() case final value?) 'response': value,
    };

RealtimeEventSessionUpdate _$RealtimeEventSessionUpdateFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventSessionUpdate(
      eventId: json['event_id'] as String?,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionUpdate,
      session: SessionConfig.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventSessionUpdateToJson(
        RealtimeEventSessionUpdate instance) =>
    <String, dynamic>{
      if (instance.eventId case final value?) 'event_id': value,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

RealtimeEventConversationCreated _$RealtimeEventConversationCreatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventConversationCreated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.conversationCreated,
      conversation:
          Conversation.fromJson(json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventConversationCreatedToJson(
        RealtimeEventConversationCreated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'conversation': instance.conversation.toJson(),
    };

RealtimeEventConversationItemCreated
    _$RealtimeEventConversationItemCreatedFromJson(Map<String, dynamic> json) =>
        RealtimeEventConversationItemCreated(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCreated,
          previousItemId: json['previous_item_id'] as String?,
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventConversationItemCreatedToJson(
        RealtimeEventConversationItemCreated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.previousItemId case final value?) 'previous_item_id': value,
      'item': instance.item.toJson(),
    };

RealtimeEventConversationItemDeleted
    _$RealtimeEventConversationItemDeletedFromJson(Map<String, dynamic> json) =>
        RealtimeEventConversationItemDeleted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemDeleted,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$RealtimeEventConversationItemDeletedToJson(
        RealtimeEventConversationItemDeleted instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
    };

RealtimeEventConversationItemInputAudioTranscriptionCompleted
    _$RealtimeEventConversationItemInputAudioTranscriptionCompletedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemInputAudioTranscriptionCompleted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType
                  .conversationItemInputAudioTranscriptionCompleted,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          transcript: json['transcript'] as String,
        );

Map<String, dynamic>
    _$RealtimeEventConversationItemInputAudioTranscriptionCompletedToJson(
            RealtimeEventConversationItemInputAudioTranscriptionCompleted
                instance) =>
        <String, dynamic>{
          'event_id': instance.eventId,
          'type': _$RealtimeEventTypeEnumMap[instance.type]!,
          'item_id': instance.itemId,
          'content_index': instance.contentIndex,
          'transcript': instance.transcript,
        };

RealtimeEventConversationItemInputAudioTranscriptionFailed
    _$RealtimeEventConversationItemInputAudioTranscriptionFailedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemInputAudioTranscriptionFailed(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemInputAudioTranscriptionFailed,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          error: TranscriptionError.fromJson(
              json['error'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$RealtimeEventConversationItemInputAudioTranscriptionFailedToJson(
        RealtimeEventConversationItemInputAudioTranscriptionFailed instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      'content_index': instance.contentIndex,
      'error': instance.error.toJson(),
    };

RealtimeEventConversationItemInputAudioTranscriptionDelta
    _$RealtimeEventConversationItemInputAudioTranscriptionDeltaFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemInputAudioTranscriptionDelta(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemInputAudioTranscriptionDelta,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num?)?.toInt(),
          delta: json['delta'] as String?,
        );

Map<String,
    dynamic> _$RealtimeEventConversationItemInputAudioTranscriptionDeltaToJson(
        RealtimeEventConversationItemInputAudioTranscriptionDelta instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      if (instance.contentIndex case final value?) 'content_index': value,
      if (instance.delta case final value?) 'delta': value,
    };

RealtimeEventConversationItemTruncated
    _$RealtimeEventConversationItemTruncatedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemTruncated(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemTruncated,
          itemId: json['item_id'] as String,
          contentIndex: (json['content_index'] as num).toInt(),
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
        );

Map<String, dynamic> _$RealtimeEventConversationItemTruncatedToJson(
        RealtimeEventConversationItemTruncated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item_id': instance.itemId,
      'content_index': instance.contentIndex,
      'audio_end_ms': instance.audioEndMs,
    };

RealtimeEventError _$RealtimeEventErrorFromJson(Map<String, dynamic> json) =>
    RealtimeEventError(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.error,
      error: APIError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventErrorToJson(RealtimeEventError instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'error': instance.error.toJson(),
    };

RealtimeEventInputAudioBufferCleared
    _$RealtimeEventInputAudioBufferClearedFromJson(Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferCleared(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCleared,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferClearedToJson(
        RealtimeEventInputAudioBufferCleared instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

RealtimeEventInputAudioBufferCommitted
    _$RealtimeEventInputAudioBufferCommittedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferCommitted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferCommitted,
          previousItemId: json['previous_item_id'] as String?,
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferCommittedToJson(
        RealtimeEventInputAudioBufferCommitted instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      if (instance.previousItemId case final value?) 'previous_item_id': value,
      'item_id': instance.itemId,
    };

RealtimeEventInputAudioBufferSpeechStarted
    _$RealtimeEventInputAudioBufferSpeechStartedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferSpeechStarted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferSpeechStarted,
          audioStartMs: (json['audio_start_ms'] as num).toInt(),
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferSpeechStartedToJson(
        RealtimeEventInputAudioBufferSpeechStarted instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio_start_ms': instance.audioStartMs,
      'item_id': instance.itemId,
    };

RealtimeEventInputAudioBufferSpeechStopped
    _$RealtimeEventInputAudioBufferSpeechStoppedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventInputAudioBufferSpeechStopped(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.inputAudioBufferSpeechStopped,
          audioEndMs: (json['audio_end_ms'] as num).toInt(),
          itemId: json['item_id'] as String,
        );

Map<String, dynamic> _$RealtimeEventInputAudioBufferSpeechStoppedToJson(
        RealtimeEventInputAudioBufferSpeechStopped instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'audio_end_ms': instance.audioEndMs,
      'item_id': instance.itemId,
    };

RealtimeEventRateLimitsUpdated _$RealtimeEventRateLimitsUpdatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventRateLimitsUpdated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.rateLimitsUpdated,
      rateLimits: (json['rate_limits'] as List<dynamic>)
          .map((e) => RateLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RealtimeEventRateLimitsUpdatedToJson(
        RealtimeEventRateLimitsUpdated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'rate_limits': instance.rateLimits.map((e) => e.toJson()).toList(),
    };

RealtimeEventResponseAudioDelta _$RealtimeEventResponseAudioDeltaFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseAudioDelta(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseAudioDelta,
      responseId: json['response_id'] as String,
      itemId: json['item_id'] as String,
      outputIndex: (json['output_index'] as num).toInt(),
      contentIndex: (json['content_index'] as num).toInt(),
      delta: json['delta'] as String,
    );

Map<String, dynamic> _$RealtimeEventResponseAudioDeltaToJson(
        RealtimeEventResponseAudioDelta instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

RealtimeEventResponseAudioDone _$RealtimeEventResponseAudioDoneFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseAudioDone(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseAudioDone,
      responseId: json['response_id'] as String,
      itemId: json['item_id'] as String,
      outputIndex: (json['output_index'] as num).toInt(),
      contentIndex: (json['content_index'] as num).toInt(),
    );

Map<String, dynamic> _$RealtimeEventResponseAudioDoneToJson(
        RealtimeEventResponseAudioDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
    };

RealtimeEventResponseAudioTranscriptDelta
    _$RealtimeEventResponseAudioTranscriptDeltaFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventResponseAudioTranscriptDelta(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioTranscriptDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          delta: json['delta'] as String,
        );

Map<String, dynamic> _$RealtimeEventResponseAudioTranscriptDeltaToJson(
        RealtimeEventResponseAudioTranscriptDelta instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

RealtimeEventResponseAudioTranscriptDone
    _$RealtimeEventResponseAudioTranscriptDoneFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventResponseAudioTranscriptDone(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseAudioTranscriptDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          transcript: json['transcript'] as String,
        );

Map<String, dynamic> _$RealtimeEventResponseAudioTranscriptDoneToJson(
        RealtimeEventResponseAudioTranscriptDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'transcript': instance.transcript,
    };

RealtimeEventResponseContentPartAdded
    _$RealtimeEventResponseContentPartAddedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventResponseContentPartAdded(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseContentPartAdded,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          part: ContentPart.fromJson(json['part'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventResponseContentPartAddedToJson(
        RealtimeEventResponseContentPartAdded instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'part': instance.part.toJson(),
    };

RealtimeEventResponseContentPartDone
    _$RealtimeEventResponseContentPartDoneFromJson(Map<String, dynamic> json) =>
        RealtimeEventResponseContentPartDone(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseContentPartDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          contentIndex: (json['content_index'] as num).toInt(),
          part: ContentPart.fromJson(json['part'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventResponseContentPartDoneToJson(
        RealtimeEventResponseContentPartDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'part': instance.part.toJson(),
    };

RealtimeEventResponseCreated _$RealtimeEventResponseCreatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseCreated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseCreated,
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventResponseCreatedToJson(
        RealtimeEventResponseCreated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response': instance.response.toJson(),
    };

RealtimeEventResponseDone _$RealtimeEventResponseDoneFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseDone(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseDone,
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventResponseDoneToJson(
        RealtimeEventResponseDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response': instance.response.toJson(),
    };

RealtimeEventResponseFunctionCallArgumentsDelta
    _$RealtimeEventResponseFunctionCallArgumentsDeltaFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventResponseFunctionCallArgumentsDelta(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseFunctionCallArgumentsDelta,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          callId: json['call_id'] as String,
          delta: json['delta'] as String,
        );

Map<String, dynamic> _$RealtimeEventResponseFunctionCallArgumentsDeltaToJson(
        RealtimeEventResponseFunctionCallArgumentsDelta instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'call_id': instance.callId,
      'delta': instance.delta,
    };

RealtimeEventResponseFunctionCallArgumentsDone
    _$RealtimeEventResponseFunctionCallArgumentsDoneFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventResponseFunctionCallArgumentsDone(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseFunctionCallArgumentsDone,
          responseId: json['response_id'] as String,
          itemId: json['item_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          callId: json['call_id'] as String,
          arguments: json['arguments'] as String,
        );

Map<String, dynamic> _$RealtimeEventResponseFunctionCallArgumentsDoneToJson(
        RealtimeEventResponseFunctionCallArgumentsDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'call_id': instance.callId,
      'arguments': instance.arguments,
    };

RealtimeEventResponseOutputItemAdded
    _$RealtimeEventResponseOutputItemAddedFromJson(Map<String, dynamic> json) =>
        RealtimeEventResponseOutputItemAdded(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseOutputItemAdded,
          responseId: json['response_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventResponseOutputItemAddedToJson(
        RealtimeEventResponseOutputItemAdded instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'output_index': instance.outputIndex,
      'item': instance.item.toJson(),
    };

RealtimeEventResponseOutputItemDone
    _$RealtimeEventResponseOutputItemDoneFromJson(Map<String, dynamic> json) =>
        RealtimeEventResponseOutputItemDone(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.responseOutputItemDone,
          responseId: json['response_id'] as String,
          outputIndex: (json['output_index'] as num).toInt(),
          item: Item.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventResponseOutputItemDoneToJson(
        RealtimeEventResponseOutputItemDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'output_index': instance.outputIndex,
      'item': instance.item.toJson(),
    };

RealtimeEventResponseTextDelta _$RealtimeEventResponseTextDeltaFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseTextDelta(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseTextDelta,
      responseId: json['response_id'] as String,
      itemId: json['item_id'] as String,
      outputIndex: (json['output_index'] as num).toInt(),
      contentIndex: (json['content_index'] as num).toInt(),
      delta: json['delta'] as String,
    );

Map<String, dynamic> _$RealtimeEventResponseTextDeltaToJson(
        RealtimeEventResponseTextDelta instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'delta': instance.delta,
    };

RealtimeEventResponseTextDone _$RealtimeEventResponseTextDoneFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventResponseTextDone(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.responseTextDone,
      responseId: json['response_id'] as String,
      itemId: json['item_id'] as String,
      outputIndex: (json['output_index'] as num).toInt(),
      contentIndex: (json['content_index'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$RealtimeEventResponseTextDoneToJson(
        RealtimeEventResponseTextDone instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'response_id': instance.responseId,
      'item_id': instance.itemId,
      'output_index': instance.outputIndex,
      'content_index': instance.contentIndex,
      'text': instance.text,
    };

RealtimeEventSessionCreated _$RealtimeEventSessionCreatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventSessionCreated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionCreated,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventSessionCreatedToJson(
        RealtimeEventSessionCreated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

RealtimeEventSessionUpdated _$RealtimeEventSessionUpdatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventSessionUpdated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.sessionUpdated,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventSessionUpdatedToJson(
        RealtimeEventSessionUpdated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'session': instance.session.toJson(),
    };

RealtimeEventClose _$RealtimeEventCloseFromJson(Map<String, dynamic> json) =>
    RealtimeEventClose(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.close,
      error: json['error'] as bool,
    );

Map<String, dynamic> _$RealtimeEventCloseToJson(RealtimeEventClose instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'error': instance.error,
    };

RealtimeEventConversationInterrupted
    _$RealtimeEventConversationInterruptedFromJson(Map<String, dynamic> json) =>
        RealtimeEventConversationInterrupted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationInterrupted,
        );

Map<String, dynamic> _$RealtimeEventConversationInterruptedToJson(
        RealtimeEventConversationInterrupted instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
    };

RealtimeEventConversationUpdated _$RealtimeEventConversationUpdatedFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventConversationUpdated(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.conversationUpdated,
      result:
          EventHandlerResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventConversationUpdatedToJson(
        RealtimeEventConversationUpdated instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'result': instance.result.toJson(),
    };

RealtimeEventConversationItemAppended
    _$RealtimeEventConversationItemAppendedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemAppended(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemAppended,
          item: FormattedItem.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventConversationItemAppendedToJson(
        RealtimeEventConversationItemAppended instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item': instance.item.toJson(),
    };

RealtimeEventConversationItemCompleted
    _$RealtimeEventConversationItemCompletedFromJson(
            Map<String, dynamic> json) =>
        RealtimeEventConversationItemCompleted(
          eventId: json['event_id'] as String,
          type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
              RealtimeEventType.conversationItemCompleted,
          item: FormattedItem.fromJson(json['item'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RealtimeEventConversationItemCompletedToJson(
        RealtimeEventConversationItemCompleted instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'item': instance.item.toJson(),
    };

RealtimeEventGeneric _$RealtimeEventGenericFromJson(
        Map<String, dynamic> json) =>
    RealtimeEventGeneric(
      eventId: json['event_id'] as String,
      type: $enumDecodeNullable(_$RealtimeEventTypeEnumMap, json['type']) ??
          RealtimeEventType.realtimeEvent,
      event: RealtimeEvent.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeEventGenericToJson(
        RealtimeEventGeneric instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'type': _$RealtimeEventTypeEnumMap[instance.type]!,
      'event': instance.event.toJson(),
    };
