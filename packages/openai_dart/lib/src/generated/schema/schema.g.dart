// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCompletionRequestImpl _$$CreateCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCompletionRequestImpl(
      model: const _CompletionModelConverter().fromJson(json['model']),
      prompt: const _CompletionPromptConverter().fromJson(json['prompt']),
      bestOf: (json['best_of'] as num?)?.toInt(),
      echo: json['echo'] as bool? ?? false,
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble() ?? 0.0,
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      logprobs: (json['logprobs'] as num?)?.toInt(),
      maxTokens: (json['max_tokens'] as num?)?.toInt() ?? 16,
      n: (json['n'] as num?)?.toInt() ?? 1,
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? 0.0,
      seed: (json['seed'] as num?)?.toInt(),
      stop: const _CompletionStopConverter().fromJson(json['stop']),
      stream: json['stream'] as bool? ?? false,
      streamOptions: json['stream_options'] == null
          ? null
          : ChatCompletionStreamOptions.fromJson(
              json['stream_options'] as Map<String, dynamic>),
      suffix: json['suffix'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateCompletionRequestImplToJson(
        _$CreateCompletionRequestImpl instance) =>
    <String, dynamic>{
      'model': const _CompletionModelConverter().toJson(instance.model),
      'prompt': _$JsonConverterToJson<Object?, CompletionPrompt>(
          instance.prompt, const _CompletionPromptConverter().toJson),
      if (instance.bestOf case final value?) 'best_of': value,
      if (instance.echo case final value?) 'echo': value,
      if (instance.frequencyPenalty case final value?)
        'frequency_penalty': value,
      if (instance.logitBias case final value?) 'logit_bias': value,
      if (instance.logprobs case final value?) 'logprobs': value,
      if (instance.maxTokens case final value?) 'max_tokens': value,
      if (instance.n case final value?) 'n': value,
      if (instance.presencePenalty case final value?) 'presence_penalty': value,
      if (instance.seed case final value?) 'seed': value,
      if (const _CompletionStopConverter().toJson(instance.stop)
          case final value?)
        'stop': value,
      if (instance.stream case final value?) 'stream': value,
      if (instance.streamOptions?.toJson() case final value?)
        'stream_options': value,
      if (instance.suffix case final value?) 'suffix': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (instance.user case final value?) 'user': value,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$CompletionModelEnumerationImpl _$$CompletionModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionModelEnumerationImpl(
      $enumDecode(_$CompletionModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionModelEnumerationImplToJson(
        _$CompletionModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$CompletionModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CompletionModelsEnumMap = {
  CompletionModels.gpt35TurboInstruct: 'gpt-3.5-turbo-instruct',
  CompletionModels.davinci002: 'davinci-002',
  CompletionModels.babbage002: 'babbage-002',
};

_$CompletionModelStringImpl _$$CompletionModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionModelStringImplToJson(
        _$CompletionModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionPromptListListIntImpl _$$CompletionPromptListListIntImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionPromptListListIntImpl(
      (json['value'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionPromptListListIntImplToJson(
        _$CompletionPromptListListIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionPromptListIntImpl _$$CompletionPromptListIntImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionPromptListIntImpl(
      (json['value'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionPromptListIntImplToJson(
        _$CompletionPromptListIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionPromptListStringImpl _$$CompletionPromptListStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionPromptListStringImpl(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionPromptListStringImplToJson(
        _$CompletionPromptListStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionPromptStringImpl _$$CompletionPromptStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionPromptStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionPromptStringImplToJson(
        _$CompletionPromptStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionStopListStringImpl _$$CompletionStopListStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionStopListStringImpl(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionStopListStringImplToJson(
        _$CompletionStopListStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CompletionStopStringImpl _$$CompletionStopStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionStopStringImpl(
      json['value'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletionStopStringImplToJson(
        _$CompletionStopStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateCompletionResponseImpl _$$CreateCompletionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCompletionResponseImpl(
      id: json['id'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => CompletionChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String?,
      object:
          $enumDecode(_$CreateCompletionResponseObjectEnumMap, json['object']),
      usage: json['usage'] == null
          ? null
          : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateCompletionResponseImplToJson(
        _$CreateCompletionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'created': instance.created,
      'model': instance.model,
      if (instance.systemFingerprint case final value?)
        'system_fingerprint': value,
      'object': _$CreateCompletionResponseObjectEnumMap[instance.object]!,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

const _$CreateCompletionResponseObjectEnumMap = {
  CreateCompletionResponseObject.textCompletion: 'text_completion',
};

_$CompletionChoiceImpl _$$CompletionChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionChoiceImpl(
      finishReason: $enumDecodeNullable(
          _$CompletionFinishReasonEnumMap, json['finish_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      index: (json['index'] as num).toInt(),
      logprobs: json['logprobs'] == null
          ? null
          : CompletionLogprobs.fromJson(
              json['logprobs'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$CompletionChoiceImplToJson(
        _$CompletionChoiceImpl instance) =>
    <String, dynamic>{
      'finish_reason': _$CompletionFinishReasonEnumMap[instance.finishReason],
      'index': instance.index,
      'logprobs': instance.logprobs?.toJson(),
      'text': instance.text,
    };

const _$CompletionFinishReasonEnumMap = {
  CompletionFinishReason.stop: 'stop',
  CompletionFinishReason.length: 'length',
  CompletionFinishReason.contentFilter: 'content_filter',
};

_$CompletionLogprobsImpl _$$CompletionLogprobsImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionLogprobsImpl(
      textOffset: (json['text_offset'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      tokenLogprobs: (json['token_logprobs'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      tokens:
          (json['tokens'] as List<dynamic>?)?.map((e) => e as String).toList(),
      topLogprobs: (json['top_logprobs'] as List<dynamic>?)
          ?.map((e) => (e as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ))
          .toList(),
    );

Map<String, dynamic> _$$CompletionLogprobsImplToJson(
        _$CompletionLogprobsImpl instance) =>
    <String, dynamic>{
      if (instance.textOffset case final value?) 'text_offset': value,
      if (instance.tokenLogprobs case final value?) 'token_logprobs': value,
      if (instance.tokens case final value?) 'tokens': value,
      if (instance.topLogprobs case final value?) 'top_logprobs': value,
    };

_$CreateChatCompletionRequestImpl _$$CreateChatCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatCompletionRequestImpl(
      model: const _ChatCompletionModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      store: json['store'] as bool?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble() ?? 0.0,
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      logprobs: json['logprobs'] as bool?,
      topLogprobs: (json['top_logprobs'] as num?)?.toInt(),
      maxTokens: (json['max_tokens'] as num?)?.toInt(),
      maxCompletionTokens: (json['max_completion_tokens'] as num?)?.toInt(),
      n: (json['n'] as num?)?.toInt() ?? 1,
      modalities: (json['modalities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ChatCompletionModalityEnumMap, e))
          .toList(),
      prediction: json['prediction'] == null
          ? null
          : PredictionContent.fromJson(
              json['prediction'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : ChatCompletionAudioOptions.fromJson(
              json['audio'] as Map<String, dynamic>),
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? 0.0,
      responseFormat: json['response_format'] == null
          ? null
          : ResponseFormat.fromJson(
              json['response_format'] as Map<String, dynamic>),
      seed: (json['seed'] as num?)?.toInt(),
      serviceTier: $enumDecodeNullable(
          _$CreateChatCompletionRequestServiceTierEnumMap, json['service_tier'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stop: const _ChatCompletionStopConverter().fromJson(json['stop']),
      stream: json['stream'] as bool? ?? false,
      streamOptions: json['stream_options'] == null
          ? null
          : ChatCompletionStreamOptions.fromJson(
              json['stream_options'] as Map<String, dynamic>),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => ChatCompletionTool.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolChoice: const _ChatCompletionToolChoiceOptionConverter()
          .fromJson(json['tool_choice']),
      parallelToolCalls: json['parallel_tool_calls'] as bool?,
      user: json['user'] as String?,
      functionCall: const _ChatCompletionFunctionCallConverter()
          .fromJson(json['function_call']),
      functions: (json['functions'] as List<dynamic>?)
          ?.map((e) => FunctionObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateChatCompletionRequestImplToJson(
        _$CreateChatCompletionRequestImpl instance) =>
    <String, dynamic>{
      'model': const _ChatCompletionModelConverter().toJson(instance.model),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      if (instance.store case final value?) 'store': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.frequencyPenalty case final value?)
        'frequency_penalty': value,
      if (instance.logitBias case final value?) 'logit_bias': value,
      if (instance.logprobs case final value?) 'logprobs': value,
      if (instance.topLogprobs case final value?) 'top_logprobs': value,
      if (instance.maxTokens case final value?) 'max_tokens': value,
      if (instance.maxCompletionTokens case final value?)
        'max_completion_tokens': value,
      if (instance.n case final value?) 'n': value,
      if (instance.modalities
              ?.map((e) => _$ChatCompletionModalityEnumMap[e]!)
              .toList()
          case final value?)
        'modalities': value,
      if (instance.prediction?.toJson() case final value?) 'prediction': value,
      if (instance.audio?.toJson() case final value?) 'audio': value,
      if (instance.presencePenalty case final value?) 'presence_penalty': value,
      if (instance.responseFormat?.toJson() case final value?)
        'response_format': value,
      if (instance.seed case final value?) 'seed': value,
      if (_$CreateChatCompletionRequestServiceTierEnumMap[instance.serviceTier]
          case final value?)
        'service_tier': value,
      if (const _ChatCompletionStopConverter().toJson(instance.stop)
          case final value?)
        'stop': value,
      if (instance.stream case final value?) 'stream': value,
      if (instance.streamOptions?.toJson() case final value?)
        'stream_options': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (const _ChatCompletionToolChoiceOptionConverter()
              .toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.parallelToolCalls case final value?)
        'parallel_tool_calls': value,
      if (instance.user case final value?) 'user': value,
      if (const _ChatCompletionFunctionCallConverter()
              .toJson(instance.functionCall)
          case final value?)
        'function_call': value,
      if (instance.functions?.map((e) => e.toJson()).toList() case final value?)
        'functions': value,
    };

const _$ChatCompletionModalityEnumMap = {
  ChatCompletionModality.text: 'text',
  ChatCompletionModality.audio: 'audio',
};

const _$CreateChatCompletionRequestServiceTierEnumMap = {
  CreateChatCompletionRequestServiceTier.auto: 'auto',
  CreateChatCompletionRequestServiceTier.vDefault: 'default',
};

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
  ChatCompletionModels.chatgpt4oLatest: 'chatgpt-4o-latest',
  ChatCompletionModels.gpt4: 'gpt-4',
  ChatCompletionModels.gpt432k: 'gpt-4-32k',
  ChatCompletionModels.gpt432k0314: 'gpt-4-32k-0314',
  ChatCompletionModels.gpt432k0613: 'gpt-4-32k-0613',
  ChatCompletionModels.gpt40125Preview: 'gpt-4-0125-preview',
  ChatCompletionModels.gpt40314: 'gpt-4-0314',
  ChatCompletionModels.gpt40613: 'gpt-4-0613',
  ChatCompletionModels.gpt41106Preview: 'gpt-4-1106-preview',
  ChatCompletionModels.gpt4Turbo: 'gpt-4-turbo',
  ChatCompletionModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  ChatCompletionModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  ChatCompletionModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ChatCompletionModels.gpt4o: 'gpt-4o',
  ChatCompletionModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  ChatCompletionModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  ChatCompletionModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  ChatCompletionModels.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  ChatCompletionModels.gpt4oAudioPreview20241001:
      'gpt-4o-audio-preview-2024-10-01',
  ChatCompletionModels.gpt4oMini: 'gpt-4o-mini',
  ChatCompletionModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  ChatCompletionModels.gpt4oRealtimePreview: 'gpt-4o-realtime-preview',
  ChatCompletionModels.gpt4oRealtimePreview20241001:
      'gpt-4o-realtime-preview-2024-10-01',
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  ChatCompletionModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ChatCompletionModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  ChatCompletionModels.o1Mini: 'o1-mini',
  ChatCompletionModels.o1Mini20240912: 'o1-mini-2024-09-12',
  ChatCompletionModels.o1Preview: 'o1-preview',
  ChatCompletionModels.o1Preview20240912: 'o1-preview-2024-09-12',
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

_$ChatCompletionStopListStringImpl _$$ChatCompletionStopListStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStopListStringImpl(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionStopListStringImplToJson(
        _$ChatCompletionStopListStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionStopStringImpl _$$ChatCompletionStopStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStopStringImpl(
      json['value'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionStopStringImplToJson(
        _$ChatCompletionStopStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionToolChoiceOptionEnumerationImpl
    _$$ChatCompletionToolChoiceOptionEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionToolChoiceOptionEnumerationImpl(
          $enumDecode(_$ChatCompletionToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionToolChoiceOptionEnumerationImplToJson(
        _$ChatCompletionToolChoiceOptionEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionToolChoiceModeEnumMap = {
  ChatCompletionToolChoiceMode.none: 'none',
  ChatCompletionToolChoiceMode.auto: 'auto',
  ChatCompletionToolChoiceMode.required: 'required',
};

_$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceImpl
    _$$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceImpl(
          ChatCompletionNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceImplToJson(
            _$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_$ChatCompletionFunctionCallEnumerationImpl
    _$$ChatCompletionFunctionCallEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionFunctionCallEnumerationImpl(
          $enumDecode(_$ChatCompletionFunctionCallModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionFunctionCallEnumerationImplToJson(
        _$ChatCompletionFunctionCallEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionFunctionCallModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionFunctionCallModeEnumMap = {
  ChatCompletionFunctionCallMode.none: 'none',
  ChatCompletionFunctionCallMode.auto: 'auto',
};

_$ChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl
    _$$ChatCompletionFunctionCallChatCompletionFunctionCallOptionImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl(
          ChatCompletionFunctionCallOption.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$ChatCompletionFunctionCallChatCompletionFunctionCallOptionImplToJson(
            _$ChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_$ChatCompletionMessageFunctionCallImpl
    _$$ChatCompletionMessageFunctionCallImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageFunctionCallImpl(
          name: json['name'] as String,
          arguments: json['arguments'] as String,
        );

Map<String, dynamic> _$$ChatCompletionMessageFunctionCallImplToJson(
        _$ChatCompletionMessageFunctionCallImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

_$ChatCompletionFunctionCallOptionImpl
    _$$ChatCompletionFunctionCallOptionImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionFunctionCallOptionImpl(
          name: json['name'] as String,
        );

Map<String, dynamic> _$$ChatCompletionFunctionCallOptionImplToJson(
        _$ChatCompletionFunctionCallOptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$FunctionObjectImpl _$$FunctionObjectImplFromJson(Map<String, dynamic> json) =>
    _$FunctionObjectImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>?,
      strict: json['strict'] as bool? ?? false,
    );

Map<String, dynamic> _$$FunctionObjectImplToJson(
        _$FunctionObjectImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.parameters case final value?) 'parameters': value,
      if (instance.strict case final value?) 'strict': value,
    };

_$JsonSchemaObjectImpl _$$JsonSchemaObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$JsonSchemaObjectImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      schema: json['schema'] as Map<String, dynamic>,
      strict: json['strict'] as bool? ?? false,
    );

Map<String, dynamic> _$$JsonSchemaObjectImplToJson(
        _$JsonSchemaObjectImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'schema': instance.schema,
      if (instance.strict case final value?) 'strict': value,
    };

_$ChatCompletionToolImpl _$$ChatCompletionToolImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionToolImpl(
      type: $enumDecode(_$ChatCompletionToolTypeEnumMap, json['type']),
      function:
          FunctionObject.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCompletionToolImplToJson(
        _$ChatCompletionToolImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionToolTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionToolTypeEnumMap = {
  ChatCompletionToolType.function: 'function',
};

_$ChatCompletionNamedToolChoiceImpl
    _$$ChatCompletionNamedToolChoiceImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionNamedToolChoiceImpl(
          type: $enumDecode(
              _$ChatCompletionNamedToolChoiceTypeEnumMap, json['type']),
          function: ChatCompletionFunctionCallOption.fromJson(
              json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionNamedToolChoiceImplToJson(
        _$ChatCompletionNamedToolChoiceImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionNamedToolChoiceTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionNamedToolChoiceTypeEnumMap = {
  ChatCompletionNamedToolChoiceType.function: 'function',
};

_$ChatCompletionMessageToolCallImpl
    _$$ChatCompletionMessageToolCallImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionMessageToolCallImpl(
          id: json['id'] as String,
          type: $enumDecode(
              _$ChatCompletionMessageToolCallTypeEnumMap, json['type']),
          function: ChatCompletionMessageFunctionCall.fromJson(
              json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionMessageToolCallImplToJson(
        _$ChatCompletionMessageToolCallImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ChatCompletionMessageToolCallTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionMessageToolCallTypeEnumMap = {
  ChatCompletionMessageToolCallType.function: 'function',
};

_$PredictionContentImpl _$$PredictionContentImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionContentImpl(
      type: json['type'] as String? ?? 'content',
      content:
          const _PredictionContentContentConverter().fromJson(json['content']),
    );

Map<String, dynamic> _$$PredictionContentImplToJson(
        _$PredictionContentImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content':
          const _PredictionContentContentConverter().toJson(instance.content),
    };

_$PredictionContentContentListChatCompletionMessageContentPartTextImpl
    _$$PredictionContentContentListChatCompletionMessageContentPartTextImplFromJson(
            Map<String, dynamic> json) =>
        _$PredictionContentContentListChatCompletionMessageContentPartTextImpl(
          (json['value'] as List<dynamic>)
              .map((e) => ChatCompletionMessageContentPartText.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$PredictionContentContentListChatCompletionMessageContentPartTextImplToJson(
            _$PredictionContentContentListChatCompletionMessageContentPartTextImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.map((e) => e.toJson()).toList(),
          'runtimeType': instance.$type,
        };

_$PredictionContentContentStringImpl
    _$$PredictionContentContentStringImplFromJson(Map<String, dynamic> json) =>
        _$PredictionContentContentStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$PredictionContentContentStringImplToJson(
        _$PredictionContentContentStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionAudioOptionsImpl _$$ChatCompletionAudioOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionAudioOptionsImpl(
      voice: $enumDecode(_$ChatCompletionAudioVoiceEnumMap, json['voice']),
      format: $enumDecode(_$ChatCompletionAudioFormatEnumMap, json['format']),
    );

Map<String, dynamic> _$$ChatCompletionAudioOptionsImplToJson(
        _$ChatCompletionAudioOptionsImpl instance) =>
    <String, dynamic>{
      'voice': _$ChatCompletionAudioVoiceEnumMap[instance.voice]!,
      'format': _$ChatCompletionAudioFormatEnumMap[instance.format]!,
    };

const _$ChatCompletionAudioVoiceEnumMap = {
  ChatCompletionAudioVoice.alloy: 'alloy',
  ChatCompletionAudioVoice.ash: 'ash',
  ChatCompletionAudioVoice.ballad: 'ballad',
  ChatCompletionAudioVoice.coral: 'coral',
  ChatCompletionAudioVoice.echo: 'echo',
  ChatCompletionAudioVoice.sage: 'sage',
  ChatCompletionAudioVoice.shimmer: 'shimmer',
  ChatCompletionAudioVoice.verse: 'verse',
};

const _$ChatCompletionAudioFormatEnumMap = {
  ChatCompletionAudioFormat.wav: 'wav',
  ChatCompletionAudioFormat.mp3: 'mp3',
  ChatCompletionAudioFormat.flac: 'flac',
  ChatCompletionAudioFormat.opus: 'opus',
  ChatCompletionAudioFormat.pcm16: 'pcm16',
};

_$ChatCompletionStreamOptionsImpl _$$ChatCompletionStreamOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStreamOptionsImpl(
      includeUsage: json['include_usage'] as bool?,
    );

Map<String, dynamic> _$$ChatCompletionStreamOptionsImplToJson(
        _$ChatCompletionStreamOptionsImpl instance) =>
    <String, dynamic>{
      if (instance.includeUsage case final value?) 'include_usage': value,
    };

_$CreateChatCompletionResponseImpl _$$CreateChatCompletionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatCompletionResponseImpl(
      id: json['id'] as String?,
      choices: (json['choices'] as List<dynamic>)
          .map((e) =>
              ChatCompletionResponseChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      serviceTier: $enumDecodeNullable(
          _$ServiceTierEnumMap, json['service_tier'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      systemFingerprint: json['system_fingerprint'] as String?,
      object: json['object'] as String,
      usage: json['usage'] == null
          ? null
          : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateChatCompletionResponseImplToJson(
        _$CreateChatCompletionResponseImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'created': instance.created,
      'model': instance.model,
      if (_$ServiceTierEnumMap[instance.serviceTier] case final value?)
        'service_tier': value,
      if (instance.systemFingerprint case final value?)
        'system_fingerprint': value,
      'object': instance.object,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

const _$ServiceTierEnumMap = {
  ServiceTier.scale: 'scale',
  ServiceTier.vDefault: 'default',
};

_$ChatCompletionResponseChoiceImpl _$$ChatCompletionResponseChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionResponseChoiceImpl(
      finishReason: $enumDecodeNullable(
          _$ChatCompletionFinishReasonEnumMap, json['finish_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      index: (json['index'] as num?)?.toInt(),
      message: ChatCompletionAssistantMessage.fromJson(
          json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'] == null
          ? null
          : ChatCompletionLogprobs.fromJson(
              json['logprobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCompletionResponseChoiceImplToJson(
        _$ChatCompletionResponseChoiceImpl instance) =>
    <String, dynamic>{
      'finish_reason':
          _$ChatCompletionFinishReasonEnumMap[instance.finishReason],
      if (instance.index case final value?) 'index': value,
      'message': instance.message.toJson(),
      'logprobs': instance.logprobs?.toJson(),
    };

const _$ChatCompletionFinishReasonEnumMap = {
  ChatCompletionFinishReason.stop: 'stop',
  ChatCompletionFinishReason.length: 'length',
  ChatCompletionFinishReason.toolCalls: 'tool_calls',
  ChatCompletionFinishReason.contentFilter: 'content_filter',
  ChatCompletionFinishReason.functionCall: 'function_call',
};

_$ChatCompletionLogprobsImpl _$$ChatCompletionLogprobsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionLogprobsImpl(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionTokenLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
      refusal: (json['refusal'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionTokenLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatCompletionLogprobsImplToJson(
        _$ChatCompletionLogprobsImpl instance) =>
    <String, dynamic>{
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
      if (instance.refusal?.map((e) => e.toJson()).toList() case final value?)
        'refusal': value,
    };

_$ChatCompletionTokenLogprobImpl _$$ChatCompletionTokenLogprobImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionTokenLogprobImpl(
      token: json['token'] as String,
      logprob: (json['logprob'] as num).toDouble(),
      bytes: (json['bytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      topLogprobs: (json['top_logprobs'] as List<dynamic>)
          .map((e) =>
              ChatCompletionTokenTopLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatCompletionTokenLogprobImplToJson(
        _$ChatCompletionTokenLogprobImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
      'top_logprobs': instance.topLogprobs.map((e) => e.toJson()).toList(),
    };

_$ChatCompletionTokenTopLogprobImpl
    _$$ChatCompletionTokenTopLogprobImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionTokenTopLogprobImpl(
          token: json['token'] as String,
          logprob: (json['logprob'] as num).toDouble(),
          bytes: (json['bytes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
        );

Map<String, dynamic> _$$ChatCompletionTokenTopLogprobImplToJson(
        _$ChatCompletionTokenTopLogprobImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
    };

_$CreateChatCompletionStreamResponseImpl
    _$$CreateChatCompletionStreamResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateChatCompletionStreamResponseImpl(
          id: json['id'] as String?,
          choices: (json['choices'] as List<dynamic>)
              .map((e) => ChatCompletionStreamResponseChoice.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          created: (json['created'] as num?)?.toInt(),
          model: json['model'] as String?,
          serviceTier: $enumDecodeNullable(
              _$ServiceTierEnumMap, json['service_tier'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          systemFingerprint: json['system_fingerprint'] as String?,
          object: json['object'] as String?,
          usage: json['usage'] == null
              ? null
              : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateChatCompletionStreamResponseImplToJson(
        _$CreateChatCompletionStreamResponseImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      if (instance.created case final value?) 'created': value,
      if (instance.model case final value?) 'model': value,
      if (_$ServiceTierEnumMap[instance.serviceTier] case final value?)
        'service_tier': value,
      if (instance.systemFingerprint case final value?)
        'system_fingerprint': value,
      if (instance.object case final value?) 'object': value,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

_$ChatCompletionStreamResponseChoiceImpl
    _$$ChatCompletionStreamResponseChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseChoiceImpl(
          delta: ChatCompletionStreamResponseDelta.fromJson(
              json['delta'] as Map<String, dynamic>),
          logprobs: json['logprobs'] == null
              ? null
              : ChatCompletionStreamResponseChoiceLogprobs.fromJson(
                  json['logprobs'] as Map<String, dynamic>),
          finishReason: $enumDecodeNullable(
              _$ChatCompletionFinishReasonEnumMap, json['finish_reason'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          index: (json['index'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoiceImplToJson(
        _$ChatCompletionStreamResponseChoiceImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      if (instance.logprobs?.toJson() case final value?) 'logprobs': value,
      'finish_reason':
          _$ChatCompletionFinishReasonEnumMap[instance.finishReason],
      if (instance.index case final value?) 'index': value,
    };

_$ChatCompletionStreamResponseChoiceLogprobsImpl
    _$$ChatCompletionStreamResponseChoiceLogprobsImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseChoiceLogprobsImpl(
          content: (json['content'] as List<dynamic>?)
              ?.map((e) => ChatCompletionTokenLogprob.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          refusal: (json['refusal'] as List<dynamic>?)
              ?.map((e) => ChatCompletionTokenLogprob.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoiceLogprobsImplToJson(
        _$ChatCompletionStreamResponseChoiceLogprobsImpl instance) =>
    <String, dynamic>{
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
      if (instance.refusal?.map((e) => e.toJson()).toList() case final value?)
        'refusal': value,
    };

_$ChatCompletionStreamResponseDeltaImpl
    _$$ChatCompletionStreamResponseDeltaImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseDeltaImpl(
          role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          content: json['content'] as String?,
          refusal: json['refusal'] as String?,
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => ChatCompletionStreamMessageToolCallChunk.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          functionCall: json['function_call'] == null
              ? null
              : ChatCompletionStreamMessageFunctionCall.fromJson(
                  json['function_call'] as Map<String, dynamic>),
          audio: json['audio'] == null
              ? null
              : ChatCompletionStreamResponseDeltaAudio.fromJson(
                  json['audio'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseDeltaImplToJson(
        _$ChatCompletionStreamResponseDeltaImpl instance) =>
    <String, dynamic>{
      if (_$ChatCompletionMessageRoleEnumMap[instance.role] case final value?)
        'role': value,
      if (instance.content case final value?) 'content': value,
      if (instance.refusal case final value?) 'refusal': value,
      if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
        'tool_calls': value,
      if (instance.functionCall?.toJson() case final value?)
        'function_call': value,
      if (instance.audio?.toJson() case final value?) 'audio': value,
    };

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
  ChatCompletionMessageRole.tool: 'tool',
  ChatCompletionMessageRole.function: 'function',
};

_$ChatCompletionStreamResponseDeltaAudioImpl
    _$$ChatCompletionStreamResponseDeltaAudioImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseDeltaAudioImpl(
          id: json['id'] as String?,
          expiresAt: (json['expires_at'] as num?)?.toInt(),
          data: json['data'] as String?,
          transcript: json['transcript'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseDeltaAudioImplToJson(
        _$ChatCompletionStreamResponseDeltaAudioImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      if (instance.data case final value?) 'data': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

_$ChatCompletionStreamMessageFunctionCallImpl
    _$$ChatCompletionStreamMessageFunctionCallImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamMessageFunctionCallImpl(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionStreamMessageFunctionCallImplToJson(
        _$ChatCompletionStreamMessageFunctionCallImpl instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.arguments case final value?) 'arguments': value,
    };

_$ChatCompletionStreamMessageToolCallChunkImpl
    _$$ChatCompletionStreamMessageToolCallChunkImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamMessageToolCallChunkImpl(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: $enumDecodeNullable(
              _$ChatCompletionStreamMessageToolCallChunkTypeEnumMap,
              json['type'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          function: json['function'] == null
              ? null
              : ChatCompletionStreamMessageFunctionCall.fromJson(
                  json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionStreamMessageToolCallChunkImplToJson(
        _$ChatCompletionStreamMessageToolCallChunkImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      if (instance.id case final value?) 'id': value,
      if (_$ChatCompletionStreamMessageToolCallChunkTypeEnumMap[instance.type]
          case final value?)
        'type': value,
      if (instance.function?.toJson() case final value?) 'function': value,
    };

const _$ChatCompletionStreamMessageToolCallChunkTypeEnumMap = {
  ChatCompletionStreamMessageToolCallChunkType.function: 'function',
};

_$CompletionUsageImpl _$$CompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionUsageImpl(
      completionTokens: (json['completion_tokens'] as num?)?.toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      completionTokensDetails: json['completion_tokens_details'] == null
          ? null
          : CompletionTokensDetails.fromJson(
              json['completion_tokens_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompletionUsageImplToJson(
        _$CompletionUsageImpl instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
      if (instance.completionTokensDetails?.toJson() case final value?)
        'completion_tokens_details': value,
    };

_$CompletionTokensDetailsImpl _$$CompletionTokensDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionTokensDetailsImpl(
      acceptedPredictionTokens:
          (json['accepted_prediction_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
      reasoningTokens: (json['reasoning_tokens'] as num?)?.toInt(),
      rejectedPredictionTokens:
          (json['rejected_prediction_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CompletionTokensDetailsImplToJson(
        _$CompletionTokensDetailsImpl instance) =>
    <String, dynamic>{
      if (instance.acceptedPredictionTokens case final value?)
        'accepted_prediction_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
      if (instance.reasoningTokens case final value?) 'reasoning_tokens': value,
      if (instance.rejectedPredictionTokens case final value?)
        'rejected_prediction_tokens': value,
    };

_$CreateEmbeddingRequestImpl _$$CreateEmbeddingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEmbeddingRequestImpl(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: const _EmbeddingInputConverter().fromJson(json['input']),
      encodingFormat: $enumDecodeNullable(
              _$EmbeddingEncodingFormatEnumMap, json['encoding_format']) ??
          EmbeddingEncodingFormat.float,
      dimensions: (json['dimensions'] as num?)?.toInt(),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateEmbeddingRequestImplToJson(
        _$CreateEmbeddingRequestImpl instance) =>
    <String, dynamic>{
      'model': const _EmbeddingModelConverter().toJson(instance.model),
      'input': const _EmbeddingInputConverter().toJson(instance.input),
      'encoding_format':
          _$EmbeddingEncodingFormatEnumMap[instance.encodingFormat]!,
      if (instance.dimensions case final value?) 'dimensions': value,
      if (instance.user case final value?) 'user': value,
    };

const _$EmbeddingEncodingFormatEnumMap = {
  EmbeddingEncodingFormat.float: 'float',
  EmbeddingEncodingFormat.base64: 'base64',
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
  EmbeddingModels.textEmbeddingAda002: 'text-embedding-ada-002',
  EmbeddingModels.textEmbedding3Small: 'text-embedding-3-small',
  EmbeddingModels.textEmbedding3Large: 'text-embedding-3-large',
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

_$EmbeddingInputListListIntImpl _$$EmbeddingInputListListIntImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingInputListListIntImpl(
      (json['value'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingInputListListIntImplToJson(
        _$EmbeddingInputListListIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingInputListIntImpl _$$EmbeddingInputListIntImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingInputListIntImpl(
      (json['value'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingInputListIntImplToJson(
        _$EmbeddingInputListIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingInputListStringImpl _$$EmbeddingInputListStringImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingInputListStringImpl(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingInputListStringImplToJson(
        _$EmbeddingInputListStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingInputStringImpl _$$EmbeddingInputStringImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingInputStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingInputStringImplToJson(
        _$EmbeddingInputStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateEmbeddingResponseImpl _$$CreateEmbeddingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEmbeddingResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Embedding.fromJson(e as Map<String, dynamic>))
          .toList(),
      model: json['model'] as String,
      object:
          $enumDecode(_$CreateEmbeddingResponseObjectEnumMap, json['object']),
      usage: json['usage'] == null
          ? null
          : EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateEmbeddingResponseImplToJson(
        _$CreateEmbeddingResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'object': _$CreateEmbeddingResponseObjectEnumMap[instance.object]!,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

const _$CreateEmbeddingResponseObjectEnumMap = {
  CreateEmbeddingResponseObject.list: 'list',
};

_$EmbeddingImpl _$$EmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingImpl(
      index: (json['index'] as num).toInt(),
      embedding: const _EmbeddingVectorConverter().fromJson(json['embedding']),
      object: $enumDecode(_$EmbeddingObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$EmbeddingImplToJson(_$EmbeddingImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'embedding': const _EmbeddingVectorConverter().toJson(instance.embedding),
      'object': _$EmbeddingObjectEnumMap[instance.object]!,
    };

const _$EmbeddingObjectEnumMap = {
  EmbeddingObject.embedding: 'embedding',
};

_$EmbeddingVectorListDoubleImpl _$$EmbeddingVectorListDoubleImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingVectorListDoubleImpl(
      (json['value'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingVectorListDoubleImplToJson(
        _$EmbeddingVectorListDoubleImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingVectorStringImpl _$$EmbeddingVectorStringImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingVectorStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmbeddingVectorStringImplToJson(
        _$EmbeddingVectorStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$EmbeddingUsageImpl _$$EmbeddingUsageImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingUsageImpl(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$EmbeddingUsageImplToJson(
        _$EmbeddingUsageImpl instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_$CreateFineTuningJobRequestImpl _$$CreateFineTuningJobRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFineTuningJobRequestImpl(
      model: const _FineTuningModelConverter().fromJson(json['model']),
      trainingFile: json['training_file'] as String,
      hyperparameters: json['hyperparameters'] == null
          ? null
          : FineTuningJobHyperparameters.fromJson(
              json['hyperparameters'] as Map<String, dynamic>),
      suffix: json['suffix'] as String?,
      validationFile: json['validation_file'] as String?,
      integrations: (json['integrations'] as List<dynamic>?)
          ?.map(
              (e) => FineTuningIntegration.fromJson(e as Map<String, dynamic>))
          .toList(),
      seed: (json['seed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreateFineTuningJobRequestImplToJson(
        _$CreateFineTuningJobRequestImpl instance) =>
    <String, dynamic>{
      'model': const _FineTuningModelConverter().toJson(instance.model),
      'training_file': instance.trainingFile,
      if (instance.hyperparameters?.toJson() case final value?)
        'hyperparameters': value,
      if (instance.suffix case final value?) 'suffix': value,
      if (instance.validationFile case final value?) 'validation_file': value,
      if (instance.integrations?.map((e) => e.toJson()).toList()
          case final value?)
        'integrations': value,
      if (instance.seed case final value?) 'seed': value,
    };

_$FineTuningModelEnumerationImpl _$$FineTuningModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningModelEnumerationImpl(
      $enumDecode(_$FineTuningModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FineTuningModelEnumerationImplToJson(
        _$FineTuningModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$FineTuningModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$FineTuningModelsEnumMap = {
  FineTuningModels.babbage002: 'babbage-002',
  FineTuningModels.davinci002: 'davinci-002',
  FineTuningModels.gpt35Turbo: 'gpt-3.5-turbo',
  FineTuningModels.gpt4oMini: 'gpt-4o-mini',
};

_$FineTuningModelStringImpl _$$FineTuningModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FineTuningModelStringImplToJson(
        _$FineTuningModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$FineTuningJobImpl _$$FineTuningJobImplFromJson(Map<String, dynamic> json) =>
    _$FineTuningJobImpl(
      id: json['id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      error: json['error'] == null
          ? null
          : FineTuningJobError.fromJson(json['error'] as Map<String, dynamic>),
      fineTunedModel: json['fine_tuned_model'] as String?,
      finishedAt: (json['finished_at'] as num?)?.toInt(),
      hyperparameters: FineTuningJobHyperparameters.fromJson(
          json['hyperparameters'] as Map<String, dynamic>),
      model: json['model'] as String,
      object: $enumDecode(_$FineTuningJobObjectEnumMap, json['object']),
      organizationId: json['organization_id'] as String,
      resultFiles: (json['result_files'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$FineTuningJobStatusEnumMap, json['status']),
      trainedTokens: (json['trained_tokens'] as num?)?.toInt(),
      trainingFile: json['training_file'] as String,
      validationFile: json['validation_file'] as String?,
      integrations: (json['integrations'] as List<dynamic>?)
          ?.map(
              (e) => FineTuningIntegration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FineTuningJobImplToJson(_$FineTuningJobImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'error': instance.error?.toJson(),
      'fine_tuned_model': instance.fineTunedModel,
      'finished_at': instance.finishedAt,
      'hyperparameters': instance.hyperparameters.toJson(),
      'model': instance.model,
      'object': _$FineTuningJobObjectEnumMap[instance.object]!,
      'organization_id': instance.organizationId,
      'result_files': instance.resultFiles,
      'status': _$FineTuningJobStatusEnumMap[instance.status]!,
      'trained_tokens': instance.trainedTokens,
      'training_file': instance.trainingFile,
      'validation_file': instance.validationFile,
      if (instance.integrations?.map((e) => e.toJson()).toList()
          case final value?)
        'integrations': value,
    };

const _$FineTuningJobObjectEnumMap = {
  FineTuningJobObject.fineTuningJob: 'fine_tuning.job',
};

const _$FineTuningJobStatusEnumMap = {
  FineTuningJobStatus.validatingFiles: 'validating_files',
  FineTuningJobStatus.queued: 'queued',
  FineTuningJobStatus.running: 'running',
  FineTuningJobStatus.succeeded: 'succeeded',
  FineTuningJobStatus.failed: 'failed',
  FineTuningJobStatus.cancelled: 'cancelled',
};

_$FineTuningIntegrationImpl _$$FineTuningIntegrationImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningIntegrationImpl(
      type: $enumDecode(_$FineTuningIntegrationTypeEnumMap, json['type']),
      wandb: FineTuningIntegrationWandb.fromJson(
          json['wandb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FineTuningIntegrationImplToJson(
        _$FineTuningIntegrationImpl instance) =>
    <String, dynamic>{
      'type': _$FineTuningIntegrationTypeEnumMap[instance.type]!,
      'wandb': instance.wandb.toJson(),
    };

const _$FineTuningIntegrationTypeEnumMap = {
  FineTuningIntegrationType.wandb: 'wandb',
};

_$FineTuningIntegrationWandbImpl _$$FineTuningIntegrationWandbImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningIntegrationWandbImpl(
      project: json['project'] as String,
      name: json['name'] as String?,
      entity: json['entity'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FineTuningIntegrationWandbImplToJson(
        _$FineTuningIntegrationWandbImpl instance) =>
    <String, dynamic>{
      'project': instance.project,
      if (instance.name case final value?) 'name': value,
      if (instance.entity case final value?) 'entity': value,
      if (instance.tags case final value?) 'tags': value,
    };

_$FineTuningJobErrorImpl _$$FineTuningJobErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$$FineTuningJobErrorImplToJson(
        _$FineTuningJobErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
    };

_$FineTuningJobHyperparametersImpl _$$FineTuningJobHyperparametersImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobHyperparametersImpl(
      nEpochs: const _FineTuningNEpochsConverter().fromJson(json['n_epochs']),
    );

Map<String, dynamic> _$$FineTuningJobHyperparametersImplToJson(
        _$FineTuningJobHyperparametersImpl instance) =>
    <String, dynamic>{
      'n_epochs': const _FineTuningNEpochsConverter().toJson(instance.nEpochs),
    };

_$FineTuningNEpochsEnumerationImpl _$$FineTuningNEpochsEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningNEpochsEnumerationImpl(
      $enumDecode(_$FineTuningNEpochsOptionsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FineTuningNEpochsEnumerationImplToJson(
        _$FineTuningNEpochsEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$FineTuningNEpochsOptionsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$FineTuningNEpochsOptionsEnumMap = {
  FineTuningNEpochsOptions.auto: 'auto',
};

_$FineTuningNEpochsIntImpl _$$FineTuningNEpochsIntImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningNEpochsIntImpl(
      (json['value'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FineTuningNEpochsIntImplToJson(
        _$FineTuningNEpochsIntImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ListPaginatedFineTuningJobsResponseImpl
    _$$ListPaginatedFineTuningJobsResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$ListPaginatedFineTuningJobsResponseImpl(
          data: (json['data'] as List<dynamic>)
              .map((e) => FineTuningJob.fromJson(e as Map<String, dynamic>))
              .toList(),
          hasMore: json['has_more'] as bool,
          object: $enumDecode(
              _$ListPaginatedFineTuningJobsResponseObjectEnumMap,
              json['object']),
        );

Map<String, dynamic> _$$ListPaginatedFineTuningJobsResponseImplToJson(
        _$ListPaginatedFineTuningJobsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
      'object':
          _$ListPaginatedFineTuningJobsResponseObjectEnumMap[instance.object]!,
    };

const _$ListPaginatedFineTuningJobsResponseObjectEnumMap = {
  ListPaginatedFineTuningJobsResponseObject.list: 'list',
};

_$ListFineTuningJobEventsResponseImpl
    _$$ListFineTuningJobEventsResponseImplFromJson(Map<String, dynamic> json) =>
        _$ListFineTuningJobEventsResponseImpl(
          data: (json['data'] as List<dynamic>)
              .map(
                  (e) => FineTuningJobEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
          object: $enumDecode(
              _$ListFineTuningJobEventsResponseObjectEnumMap, json['object']),
        );

Map<String, dynamic> _$$ListFineTuningJobEventsResponseImplToJson(
        _$ListFineTuningJobEventsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'object':
          _$ListFineTuningJobEventsResponseObjectEnumMap[instance.object]!,
    };

const _$ListFineTuningJobEventsResponseObjectEnumMap = {
  ListFineTuningJobEventsResponseObject.list: 'list',
};

_$ListFineTuningJobCheckpointsResponseImpl
    _$$ListFineTuningJobCheckpointsResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$ListFineTuningJobCheckpointsResponseImpl(
          data: (json['data'] as List<dynamic>)
              .map((e) =>
                  FineTuningJobCheckpoint.fromJson(e as Map<String, dynamic>))
              .toList(),
          object: $enumDecode(
              _$ListFineTuningJobCheckpointsResponseObjectEnumMap,
              json['object']),
          firstId: json['first_id'] as String?,
          lastId: json['last_id'] as String?,
          hasMore: json['has_more'] as bool,
        );

Map<String, dynamic> _$$ListFineTuningJobCheckpointsResponseImplToJson(
        _$ListFineTuningJobCheckpointsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'object':
          _$ListFineTuningJobCheckpointsResponseObjectEnumMap[instance.object]!,
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

const _$ListFineTuningJobCheckpointsResponseObjectEnumMap = {
  ListFineTuningJobCheckpointsResponseObject.list: 'list',
};

_$FineTuningJobEventImpl _$$FineTuningJobEventImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobEventImpl(
      id: json['id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      level: $enumDecode(_$FineTuningJobEventLevelEnumMap, json['level']),
      message: json['message'] as String,
      object: $enumDecode(_$FineTuningJobEventObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$FineTuningJobEventImplToJson(
        _$FineTuningJobEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'level': _$FineTuningJobEventLevelEnumMap[instance.level]!,
      'message': instance.message,
      'object': _$FineTuningJobEventObjectEnumMap[instance.object]!,
    };

const _$FineTuningJobEventLevelEnumMap = {
  FineTuningJobEventLevel.info: 'info',
  FineTuningJobEventLevel.warn: 'warn',
  FineTuningJobEventLevel.error: 'error',
};

const _$FineTuningJobEventObjectEnumMap = {
  FineTuningJobEventObject.fineTuningJobEvent: 'fine_tuning.job.event',
};

_$FineTuningJobCheckpointImpl _$$FineTuningJobCheckpointImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobCheckpointImpl(
      id: json['id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      fineTunedModelCheckpoint: json['fine_tuned_model_checkpoint'] as String,
      stepNumber: (json['step_number'] as num).toInt(),
      metrics: FineTuningJobCheckpointMetrics.fromJson(
          json['metrics'] as Map<String, dynamic>),
      fineTuningJobId: json['fine_tuning_job_id'] as String,
      object:
          $enumDecode(_$FineTuningJobCheckpointObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$FineTuningJobCheckpointImplToJson(
        _$FineTuningJobCheckpointImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'fine_tuned_model_checkpoint': instance.fineTunedModelCheckpoint,
      'step_number': instance.stepNumber,
      'metrics': instance.metrics.toJson(),
      'fine_tuning_job_id': instance.fineTuningJobId,
      'object': _$FineTuningJobCheckpointObjectEnumMap[instance.object]!,
    };

const _$FineTuningJobCheckpointObjectEnumMap = {
  FineTuningJobCheckpointObject.fineTuningJobCheckpoint:
      'fine_tuning.job.checkpoint',
};

_$FineTuningJobCheckpointMetricsImpl
    _$$FineTuningJobCheckpointMetricsImplFromJson(Map<String, dynamic> json) =>
        _$FineTuningJobCheckpointMetricsImpl(
          step: (json['step'] as num?)?.toDouble(),
          trainLoss: (json['train_loss'] as num?)?.toDouble(),
          trainMeanTokenAccuracy:
              (json['train_mean_token_accuracy'] as num?)?.toDouble(),
          validLoss: (json['valid_loss'] as num?)?.toDouble(),
          validMeanTokenAccuracy:
              (json['valid_mean_token_accuracy'] as num?)?.toDouble(),
          fullValidLoss: (json['full_valid_loss'] as num?)?.toDouble(),
          fullValidMeanTokenAccuracy:
              (json['full_valid_mean_token_accuracy'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$$FineTuningJobCheckpointMetricsImplToJson(
        _$FineTuningJobCheckpointMetricsImpl instance) =>
    <String, dynamic>{
      if (instance.step case final value?) 'step': value,
      if (instance.trainLoss case final value?) 'train_loss': value,
      if (instance.trainMeanTokenAccuracy case final value?)
        'train_mean_token_accuracy': value,
      if (instance.validLoss case final value?) 'valid_loss': value,
      if (instance.validMeanTokenAccuracy case final value?)
        'valid_mean_token_accuracy': value,
      if (instance.fullValidLoss case final value?) 'full_valid_loss': value,
      if (instance.fullValidMeanTokenAccuracy case final value?)
        'full_valid_mean_token_accuracy': value,
    };

_$CreateImageRequestImpl _$$CreateImageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateImageRequestImpl(
      prompt: json['prompt'] as String,
      model: json['model'] == null
          ? const CreateImageRequestModelString('dall-e-2')
          : const _CreateImageRequestModelConverter().fromJson(json['model']),
      n: (json['n'] as num?)?.toInt() ?? 1,
      quality: $enumDecodeNullable(_$ImageQualityEnumMap, json['quality']) ??
          ImageQuality.standard,
      responseFormat: $enumDecodeNullable(
              _$ImageResponseFormatEnumMap, json['response_format'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          ImageResponseFormat.url,
      size: $enumDecodeNullable(_$ImageSizeEnumMap, json['size'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          ImageSize.v1024x1024,
      style: $enumDecodeNullable(_$ImageStyleEnumMap, json['style'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          ImageStyle.vivid,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateImageRequestImplToJson(
        _$CreateImageRequestImpl instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      if (const _CreateImageRequestModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      if (instance.n case final value?) 'n': value,
      'quality': _$ImageQualityEnumMap[instance.quality]!,
      if (_$ImageResponseFormatEnumMap[instance.responseFormat]
          case final value?)
        'response_format': value,
      if (_$ImageSizeEnumMap[instance.size] case final value?) 'size': value,
      if (_$ImageStyleEnumMap[instance.style] case final value?) 'style': value,
      if (instance.user case final value?) 'user': value,
    };

const _$ImageQualityEnumMap = {
  ImageQuality.standard: 'standard',
  ImageQuality.hd: 'hd',
};

const _$ImageResponseFormatEnumMap = {
  ImageResponseFormat.url: 'url',
  ImageResponseFormat.b64Json: 'b64_json',
};

const _$ImageSizeEnumMap = {
  ImageSize.v256x256: '256x256',
  ImageSize.v512x512: '512x512',
  ImageSize.v1024x1024: '1024x1024',
  ImageSize.v1792x1024: '1792x1024',
  ImageSize.v1024x1792: '1024x1792',
};

const _$ImageStyleEnumMap = {
  ImageStyle.vivid: 'vivid',
  ImageStyle.natural: 'natural',
};

_$CreateImageRequestModelEnumerationImpl
    _$$CreateImageRequestModelEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateImageRequestModelEnumerationImpl(
          $enumDecode(_$ImageModelsEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateImageRequestModelEnumerationImplToJson(
        _$CreateImageRequestModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ImageModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ImageModelsEnumMap = {
  ImageModels.dallE2: 'dall-e-2',
  ImageModels.dallE3: 'dall-e-3',
};

_$CreateImageRequestModelStringImpl
    _$$CreateImageRequestModelStringImplFromJson(Map<String, dynamic> json) =>
        _$CreateImageRequestModelStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateImageRequestModelStringImplToJson(
        _$CreateImageRequestModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ImagesResponseImpl _$$ImagesResponseImplFromJson(Map<String, dynamic> json) =>
    _$ImagesResponseImpl(
      created: (json['created'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImagesResponseImplToJson(
        _$ImagesResponseImpl instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      b64Json: json['b64_json'] as String?,
      url: json['url'] as String?,
      revisedPrompt: json['revised_prompt'] as String?,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      if (instance.b64Json case final value?) 'b64_json': value,
      if (instance.url case final value?) 'url': value,
      if (instance.revisedPrompt case final value?) 'revised_prompt': value,
    };

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      id: json['id'] as String,
      created: (json['created'] as num).toInt(),
      object: $enumDecode(_$ModelObjectEnumMap, json['object']),
      ownedBy: json['owned_by'] as String,
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'object': _$ModelObjectEnumMap[instance.object]!,
      'owned_by': instance.ownedBy,
    };

const _$ModelObjectEnumMap = {
  ModelObject.model: 'model',
};

_$ListModelsResponseImpl _$$ListModelsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListModelsResponseImpl(
      object: $enumDecode(_$ListModelsResponseObjectEnumMap, json['object']),
      data: (json['data'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListModelsResponseImplToJson(
        _$ListModelsResponseImpl instance) =>
    <String, dynamic>{
      'object': _$ListModelsResponseObjectEnumMap[instance.object]!,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

const _$ListModelsResponseObjectEnumMap = {
  ListModelsResponseObject.list: 'list',
};

_$DeleteModelResponseImpl _$$DeleteModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteModelResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: json['object'] as String,
    );

Map<String, dynamic> _$$DeleteModelResponseImplToJson(
        _$DeleteModelResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_$CreateModerationRequestImpl _$$CreateModerationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateModerationRequestImpl(
      model: json['model'] == null
          ? const ModerationModelString('omni-moderation-latest')
          : const _ModerationModelConverter().fromJson(json['model']),
      input: const _ModerationInputConverter().fromJson(json['input']),
    );

Map<String, dynamic> _$$CreateModerationRequestImplToJson(
        _$CreateModerationRequestImpl instance) =>
    <String, dynamic>{
      if (const _ModerationModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      'input': const _ModerationInputConverter().toJson(instance.input),
    };

_$ModerationModelEnumerationImpl _$$ModerationModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationModelEnumerationImpl(
      $enumDecode(_$ModerationModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModerationModelEnumerationImplToJson(
        _$ModerationModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ModerationModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ModerationModelsEnumMap = {
  ModerationModels.omniModerationLatest: 'omni-moderation-latest',
  ModerationModels.omniModeration20240926: 'omni-moderation-2024-09-26',
  ModerationModels.textModerationLatest: 'text-moderation-latest',
  ModerationModels.textModerationStable: 'text-moderation-stable',
};

_$ModerationModelStringImpl _$$ModerationModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModerationModelStringImplToJson(
        _$ModerationModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ModerationInputListModerationInputObjectImpl
    _$$ModerationInputListModerationInputObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$ModerationInputListModerationInputObjectImpl(
          (json['value'] as List<dynamic>)
              .map((e) =>
                  ModerationInputObject.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ModerationInputListModerationInputObjectImplToJson(
        _$ModerationInputListModerationInputObjectImpl instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$ModerationInputListStringImpl _$$ModerationInputListStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationInputListStringImpl(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModerationInputListStringImplToJson(
        _$ModerationInputListStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ModerationInputStringImpl _$$ModerationInputStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationInputStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModerationInputStringImplToJson(
        _$ModerationInputStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateModerationResponseImpl _$$CreateModerationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateModerationResponseImpl(
      id: json['id'] as String,
      model: json['model'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => Moderation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateModerationResponseImplToJson(
        _$CreateModerationResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_$ModerationImpl _$$ModerationImplFromJson(Map<String, dynamic> json) =>
    _$ModerationImpl(
      flagged: json['flagged'] as bool,
      categories: ModerationCategories.fromJson(
          json['categories'] as Map<String, dynamic>),
      categoryScores: ModerationCategoriesScores.fromJson(
          json['category_scores'] as Map<String, dynamic>),
      categoryAppliedInputTypes: ModerationCategoriesAppliedInputTypes.fromJson(
          json['category_applied_input_types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModerationImplToJson(_$ModerationImpl instance) =>
    <String, dynamic>{
      'flagged': instance.flagged,
      'categories': instance.categories.toJson(),
      'category_scores': instance.categoryScores.toJson(),
      'category_applied_input_types':
          instance.categoryAppliedInputTypes.toJson(),
    };

_$ModerationCategoriesImpl _$$ModerationCategoriesImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationCategoriesImpl(
      hate: json['hate'] as bool,
      hateThreatening: json['hate/threatening'] as bool,
      harassment: json['harassment'] as bool,
      harassmentThreatening: json['harassment/threatening'] as bool,
      illicit: json['illicit'] as bool,
      illicitViolent: json['illicit/violent'] as bool,
      selfHarm: json['self-harm'] as bool,
      selfHarmIntent: json['self-harm/intent'] as bool,
      selfHarmInstructions: json['self-harm/instructions'] as bool,
      sexual: json['sexual'] as bool,
      sexualMinors: json['sexual/minors'] as bool,
      violence: json['violence'] as bool,
      violenceGraphic: json['violence/graphic'] as bool,
    );

Map<String, dynamic> _$$ModerationCategoriesImplToJson(
        _$ModerationCategoriesImpl instance) =>
    <String, dynamic>{
      'hate': instance.hate,
      'hate/threatening': instance.hateThreatening,
      'harassment': instance.harassment,
      'harassment/threatening': instance.harassmentThreatening,
      'illicit': instance.illicit,
      'illicit/violent': instance.illicitViolent,
      'self-harm': instance.selfHarm,
      'self-harm/intent': instance.selfHarmIntent,
      'self-harm/instructions': instance.selfHarmInstructions,
      'sexual': instance.sexual,
      'sexual/minors': instance.sexualMinors,
      'violence': instance.violence,
      'violence/graphic': instance.violenceGraphic,
    };

_$ModerationCategoriesScoresImpl _$$ModerationCategoriesScoresImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationCategoriesScoresImpl(
      hate: (json['hate'] as num).toDouble(),
      hateThreatening: (json['hate/threatening'] as num).toDouble(),
      harassment: (json['harassment'] as num).toDouble(),
      harassmentThreatening: (json['harassment/threatening'] as num).toDouble(),
      illicit: (json['illicit'] as num).toDouble(),
      illicitViolent: (json['illicit/violent'] as num).toDouble(),
      selfHarm: (json['self-harm'] as num).toDouble(),
      selfHarmIntent: (json['self-harm/intent'] as num).toDouble(),
      selfHarmInstructions: (json['self-harm/instructions'] as num).toDouble(),
      sexual: (json['sexual'] as num).toDouble(),
      sexualMinors: (json['sexual/minors'] as num).toDouble(),
      violence: (json['violence'] as num).toDouble(),
      violenceGraphic: (json['violence/graphic'] as num).toDouble(),
    );

Map<String, dynamic> _$$ModerationCategoriesScoresImplToJson(
        _$ModerationCategoriesScoresImpl instance) =>
    <String, dynamic>{
      'hate': instance.hate,
      'hate/threatening': instance.hateThreatening,
      'harassment': instance.harassment,
      'harassment/threatening': instance.harassmentThreatening,
      'illicit': instance.illicit,
      'illicit/violent': instance.illicitViolent,
      'self-harm': instance.selfHarm,
      'self-harm/intent': instance.selfHarmIntent,
      'self-harm/instructions': instance.selfHarmInstructions,
      'sexual': instance.sexual,
      'sexual/minors': instance.sexualMinors,
      'violence': instance.violence,
      'violence/graphic': instance.violenceGraphic,
    };

_$ModerationCategoriesAppliedInputTypesImpl
    _$$ModerationCategoriesAppliedInputTypesImplFromJson(
            Map<String, dynamic> json) =>
        _$ModerationCategoriesAppliedInputTypesImpl(
          hate:
              (json['hate'] as List<dynamic>).map((e) => e as String).toList(),
          hateThreatening: (json['hate/threatening'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          harassment: (json['harassment'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          harassmentThreatening:
              (json['harassment/threatening'] as List<dynamic>)
                  .map((e) => e as String)
                  .toList(),
          illicit: (json['illicit'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          illicitViolent: (json['illicit/violent'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          selfHarm: (json['self-harm'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          selfHarmIntent: (json['self-harm/intent'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          selfHarmInstructions:
              (json['self-harm/instructions'] as List<dynamic>)
                  .map((e) => e as String)
                  .toList(),
          sexual: (json['sexual'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          sexualMinors: (json['sexual/minors'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          violence: (json['violence'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          violenceGraphic: (json['violence/graphic'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$$ModerationCategoriesAppliedInputTypesImplToJson(
        _$ModerationCategoriesAppliedInputTypesImpl instance) =>
    <String, dynamic>{
      'hate': instance.hate,
      'hate/threatening': instance.hateThreatening,
      'harassment': instance.harassment,
      'harassment/threatening': instance.harassmentThreatening,
      'illicit': instance.illicit,
      'illicit/violent': instance.illicitViolent,
      'self-harm': instance.selfHarm,
      'self-harm/intent': instance.selfHarmIntent,
      'self-harm/instructions': instance.selfHarmInstructions,
      'sexual': instance.sexual,
      'sexual/minors': instance.sexualMinors,
      'violence': instance.violence,
      'violence/graphic': instance.violenceGraphic,
    };

_$AssistantObjectImpl _$$AssistantObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$AssistantObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      model: json['model'] as String,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      responseFormat: const _AssistantObjectResponseFormatConverter()
          .fromJson(json['response_format']),
    );

Map<String, dynamic> _$$AssistantObjectImplToJson(
        _$AssistantObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$AssistantObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'name': instance.name,
      'description': instance.description,
      'model': instance.model,
      'instructions': instance.instructions,
      'tools': instance.tools.map((e) => e.toJson()).toList(),
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      'metadata': instance.metadata,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (const _AssistantObjectResponseFormatConverter()
              .toJson(instance.responseFormat)
          case final value?)
        'response_format': value,
    };

const _$AssistantObjectObjectEnumMap = {
  AssistantObjectObject.assistant: 'assistant',
};

_$AssistantObjectResponseFormatEnumerationImpl
    _$$AssistantObjectResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$AssistantObjectResponseFormatEnumerationImpl(
          $enumDecode(_$AssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AssistantObjectResponseFormatEnumerationImplToJson(
        _$AssistantObjectResponseFormatEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$AssistantResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$AssistantResponseFormatModeEnumMap = {
  AssistantResponseFormatMode.auto: 'auto',
};

_$AssistantObjectResponseFormatResponseFormatImpl
    _$$AssistantObjectResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$AssistantObjectResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AssistantObjectResponseFormatResponseFormatImplToJson(
        _$AssistantObjectResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$CreateAssistantRequestImpl _$$CreateAssistantRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAssistantRequestImpl(
      model: const _AssistantModelConverter().fromJson(json['model']),
      name: json['name'] as String?,
      description: json['description'] as String?,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
              ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      responseFormat: const _CreateAssistantRequestResponseFormatConverter()
          .fromJson(json['response_format']),
    );

Map<String, dynamic> _$$CreateAssistantRequestImplToJson(
        _$CreateAssistantRequestImpl instance) =>
    <String, dynamic>{
      'model': const _AssistantModelConverter().toJson(instance.model),
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.instructions case final value?) 'instructions': value,
      'tools': instance.tools.map((e) => e.toJson()).toList(),
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (const _CreateAssistantRequestResponseFormatConverter()
              .toJson(instance.responseFormat)
          case final value?)
        'response_format': value,
    };

_$AssistantModelEnumerationImpl _$$AssistantModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantModelEnumerationImpl(
      $enumDecode(_$AssistantModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssistantModelEnumerationImplToJson(
        _$AssistantModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$AssistantModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$AssistantModelsEnumMap = {
  AssistantModels.gpt4: 'gpt-4',
  AssistantModels.gpt432k: 'gpt-4-32k',
  AssistantModels.gpt432k0314: 'gpt-4-32k-0314',
  AssistantModels.gpt432k0613: 'gpt-4-32k-0613',
  AssistantModels.gpt40125Preview: 'gpt-4-0125-preview',
  AssistantModels.gpt40314: 'gpt-4-0314',
  AssistantModels.gpt40613: 'gpt-4-0613',
  AssistantModels.gpt41106Preview: 'gpt-4-1106-preview',
  AssistantModels.gpt4Turbo: 'gpt-4-turbo',
  AssistantModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  AssistantModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  AssistantModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  AssistantModels.gpt4o: 'gpt-4o',
  AssistantModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  AssistantModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  AssistantModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  AssistantModels.gpt4oMini: 'gpt-4o-mini',
  AssistantModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  AssistantModels.gpt35Turbo: 'gpt-3.5-turbo',
  AssistantModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  AssistantModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  AssistantModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  AssistantModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  AssistantModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
};

_$AssistantModelStringImpl _$$AssistantModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AssistantModelStringImplToJson(
        _$AssistantModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateAssistantRequestResponseFormatEnumerationImpl
    _$$CreateAssistantRequestResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateAssistantRequestResponseFormatEnumerationImpl(
          $enumDecode(
              _$CreateAssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateAssistantRequestResponseFormatEnumerationImplToJson(
            _$CreateAssistantRequestResponseFormatEnumerationImpl instance) =>
        <String, dynamic>{
          'value': _$CreateAssistantResponseFormatModeEnumMap[instance.value]!,
          'runtimeType': instance.$type,
        };

const _$CreateAssistantResponseFormatModeEnumMap = {
  CreateAssistantResponseFormatMode.auto: 'auto',
};

_$CreateAssistantRequestResponseFormatResponseFormatImpl
    _$$CreateAssistantRequestResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateAssistantRequestResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$CreateAssistantRequestResponseFormatResponseFormatImplToJson(
        _$CreateAssistantRequestResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$ModifyAssistantRequestImpl _$$ModifyAssistantRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyAssistantRequestImpl(
      model: json['model'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
              ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      responseFormat: const _ModifyAssistantRequestResponseFormatConverter()
          .fromJson(json['response_format']),
    );

Map<String, dynamic> _$$ModifyAssistantRequestImplToJson(
        _$ModifyAssistantRequestImpl instance) =>
    <String, dynamic>{
      if (instance.model case final value?) 'model': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.instructions case final value?) 'instructions': value,
      'tools': instance.tools.map((e) => e.toJson()).toList(),
      'file_ids': instance.fileIds,
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (const _ModifyAssistantRequestResponseFormatConverter()
              .toJson(instance.responseFormat)
          case final value?)
        'response_format': value,
    };

_$ModifyAssistantRequestResponseFormatEnumerationImpl
    _$$ModifyAssistantRequestResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$ModifyAssistantRequestResponseFormatEnumerationImpl(
          $enumDecode(
              _$ModifyAssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$ModifyAssistantRequestResponseFormatEnumerationImplToJson(
            _$ModifyAssistantRequestResponseFormatEnumerationImpl instance) =>
        <String, dynamic>{
          'value': _$ModifyAssistantResponseFormatModeEnumMap[instance.value]!,
          'runtimeType': instance.$type,
        };

const _$ModifyAssistantResponseFormatModeEnumMap = {
  ModifyAssistantResponseFormatMode.auto: 'auto',
};

_$ModifyAssistantRequestResponseFormatResponseFormatImpl
    _$$ModifyAssistantRequestResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$ModifyAssistantRequestResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$ModifyAssistantRequestResponseFormatResponseFormatImplToJson(
        _$ModifyAssistantRequestResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$DeleteAssistantResponseImpl _$$DeleteAssistantResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteAssistantResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object:
          $enumDecode(_$DeleteAssistantResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$DeleteAssistantResponseImplToJson(
        _$DeleteAssistantResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteAssistantResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteAssistantResponseObjectEnumMap = {
  DeleteAssistantResponseObject.assistantDeleted: 'assistant.deleted',
};

_$ListAssistantsResponseImpl _$$ListAssistantsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListAssistantsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AssistantObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListAssistantsResponseImplToJson(
        _$ListAssistantsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$FileSearchRankingOptionsImpl _$$FileSearchRankingOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$FileSearchRankingOptionsImpl(
      ranker: $enumDecodeNullable(_$FileSearchRankerEnumMap, json['ranker'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      scoreThreshold: (json['score_threshold'] as num).toDouble(),
    );

Map<String, dynamic> _$$FileSearchRankingOptionsImplToJson(
        _$FileSearchRankingOptionsImpl instance) =>
    <String, dynamic>{
      if (_$FileSearchRankerEnumMap[instance.ranker] case final value?)
        'ranker': value,
      'score_threshold': instance.scoreThreshold,
    };

const _$FileSearchRankerEnumMap = {
  FileSearchRanker.auto: 'auto',
  FileSearchRanker.default20240821: 'default_2024_08_21',
};

_$AssistantsNamedToolChoiceImpl _$$AssistantsNamedToolChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantsNamedToolChoiceImpl(
      type: $enumDecode(_$AssistantsToolTypeEnumMap, json['type']),
      function: json['function'] == null
          ? null
          : AssistantsFunctionCallOption.fromJson(
              json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssistantsNamedToolChoiceImplToJson(
        _$AssistantsNamedToolChoiceImpl instance) =>
    <String, dynamic>{
      'type': _$AssistantsToolTypeEnumMap[instance.type]!,
      if (instance.function?.toJson() case final value?) 'function': value,
    };

const _$AssistantsToolTypeEnumMap = {
  AssistantsToolType.function: 'function',
  AssistantsToolType.codeInterpreter: 'code_interpreter',
  AssistantsToolType.fileSearch: 'file_search',
};

_$AssistantsFunctionCallOptionImpl _$$AssistantsFunctionCallOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantsFunctionCallOptionImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AssistantsFunctionCallOptionImplToJson(
        _$AssistantsFunctionCallOptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$TruncationObjectImpl _$$TruncationObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$TruncationObjectImpl(
      type: $enumDecode(_$TruncationObjectTypeEnumMap, json['type']),
      lastMessages: (json['last_messages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TruncationObjectImplToJson(
        _$TruncationObjectImpl instance) =>
    <String, dynamic>{
      'type': _$TruncationObjectTypeEnumMap[instance.type]!,
      if (instance.lastMessages case final value?) 'last_messages': value,
    };

const _$TruncationObjectTypeEnumMap = {
  TruncationObjectType.auto: 'auto',
  TruncationObjectType.lastMessages: 'last_messages',
};

_$RunObjectImpl _$$RunObjectImplFromJson(Map<String, dynamic> json) =>
    _$RunObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$RunObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      threadId: json['thread_id'] as String,
      assistantId: json['assistant_id'] as String,
      status: $enumDecode(_$RunStatusEnumMap, json['status']),
      requiredAction: json['required_action'] == null
          ? null
          : RunRequiredAction.fromJson(
              json['required_action'] as Map<String, dynamic>),
      lastError: json['last_error'] == null
          ? null
          : RunLastError.fromJson(json['last_error'] as Map<String, dynamic>),
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      startedAt: (json['started_at'] as num?)?.toInt(),
      cancelledAt: (json['cancelled_at'] as num?)?.toInt(),
      failedAt: (json['failed_at'] as num?)?.toInt(),
      completedAt: (json['completed_at'] as num?)?.toInt(),
      incompleteDetails: json['incomplete_details'] == null
          ? null
          : RunObjectIncompleteDetails.fromJson(
              json['incomplete_details'] as Map<String, dynamic>),
      model: json['model'] as String,
      instructions: json['instructions'] as String,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      usage: json['usage'] == null
          ? null
          : RunCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['top_p'] as num?)?.toDouble(),
      maxPromptTokens: (json['max_prompt_tokens'] as num?)?.toInt(),
      maxCompletionTokens: (json['max_completion_tokens'] as num?)?.toInt(),
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice:
          const _RunObjectToolChoiceConverter().fromJson(json['tool_choice']),
      parallelToolCalls: json['parallel_tool_calls'] as bool?,
      responseFormat: const _RunObjectResponseFormatConverter()
          .fromJson(json['response_format']),
    );

Map<String, dynamic> _$$RunObjectImplToJson(_$RunObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$RunObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'thread_id': instance.threadId,
      'assistant_id': instance.assistantId,
      'status': _$RunStatusEnumMap[instance.status]!,
      'required_action': instance.requiredAction?.toJson(),
      'last_error': instance.lastError?.toJson(),
      'expires_at': instance.expiresAt,
      'started_at': instance.startedAt,
      'cancelled_at': instance.cancelledAt,
      'failed_at': instance.failedAt,
      'completed_at': instance.completedAt,
      'incomplete_details': instance.incompleteDetails?.toJson(),
      'model': instance.model,
      'instructions': instance.instructions,
      'tools': instance.tools.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
      'usage': instance.usage?.toJson(),
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      'max_prompt_tokens': instance.maxPromptTokens,
      'max_completion_tokens': instance.maxCompletionTokens,
      'truncation_strategy': instance.truncationStrategy?.toJson(),
      'tool_choice': _$JsonConverterToJson<Object?, RunObjectToolChoice>(
          instance.toolChoice, const _RunObjectToolChoiceConverter().toJson),
      'parallel_tool_calls': instance.parallelToolCalls,
      'response_format': const _RunObjectResponseFormatConverter()
          .toJson(instance.responseFormat),
    };

const _$RunObjectObjectEnumMap = {
  RunObjectObject.threadRun: 'thread.run',
};

const _$RunStatusEnumMap = {
  RunStatus.queued: 'queued',
  RunStatus.inProgress: 'in_progress',
  RunStatus.requiresAction: 'requires_action',
  RunStatus.cancelling: 'cancelling',
  RunStatus.cancelled: 'cancelled',
  RunStatus.failed: 'failed',
  RunStatus.completed: 'completed',
  RunStatus.incomplete: 'incomplete',
  RunStatus.expired: 'expired',
};

_$RunRequiredActionImpl _$$RunRequiredActionImplFromJson(
        Map<String, dynamic> json) =>
    _$RunRequiredActionImpl(
      type: $enumDecode(_$RunRequiredActionTypeEnumMap, json['type']),
      submitToolOutputs: RunSubmitToolOutputs.fromJson(
          json['submit_tool_outputs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunRequiredActionImplToJson(
        _$RunRequiredActionImpl instance) =>
    <String, dynamic>{
      'type': _$RunRequiredActionTypeEnumMap[instance.type]!,
      'submit_tool_outputs': instance.submitToolOutputs.toJson(),
    };

const _$RunRequiredActionTypeEnumMap = {
  RunRequiredActionType.submitToolOutputs: 'submit_tool_outputs',
};

_$RunLastErrorImpl _$$RunLastErrorImplFromJson(Map<String, dynamic> json) =>
    _$RunLastErrorImpl(
      code: $enumDecode(_$RunLastErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$RunLastErrorImplToJson(_$RunLastErrorImpl instance) =>
    <String, dynamic>{
      'code': _$RunLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$RunLastErrorCodeEnumMap = {
  RunLastErrorCode.serverError: 'server_error',
  RunLastErrorCode.rateLimitExceeded: 'rate_limit_exceeded',
  RunLastErrorCode.invalidPrompt: 'invalid_prompt',
};

_$RunObjectIncompleteDetailsImpl _$$RunObjectIncompleteDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$RunObjectIncompleteDetailsImpl(
      reason: $enumDecodeNullable(
          _$RunObjectIncompleteDetailsReasonEnumMap, json['reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$RunObjectIncompleteDetailsImplToJson(
        _$RunObjectIncompleteDetailsImpl instance) =>
    <String, dynamic>{
      if (_$RunObjectIncompleteDetailsReasonEnumMap[instance.reason]
          case final value?)
        'reason': value,
    };

const _$RunObjectIncompleteDetailsReasonEnumMap = {
  RunObjectIncompleteDetailsReason.maxCompletionTokens: 'max_completion_tokens',
  RunObjectIncompleteDetailsReason.maxPromptTokens: 'max_prompt_tokens',
};

_$RunObjectToolChoiceEnumerationImpl
    _$$RunObjectToolChoiceEnumerationImplFromJson(Map<String, dynamic> json) =>
        _$RunObjectToolChoiceEnumerationImpl(
          $enumDecode(_$RunObjectToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RunObjectToolChoiceEnumerationImplToJson(
        _$RunObjectToolChoiceEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$RunObjectToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunObjectToolChoiceModeEnumMap = {
  RunObjectToolChoiceMode.none: 'none',
  RunObjectToolChoiceMode.auto: 'auto',
  RunObjectToolChoiceMode.required: 'required',
};

_$RunObjectToolChoiceAssistantsNamedToolChoiceImpl
    _$$RunObjectToolChoiceAssistantsNamedToolChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$RunObjectToolChoiceAssistantsNamedToolChoiceImpl(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RunObjectToolChoiceAssistantsNamedToolChoiceImplToJson(
        _$RunObjectToolChoiceAssistantsNamedToolChoiceImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$RunObjectResponseFormatEnumerationImpl
    _$$RunObjectResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$RunObjectResponseFormatEnumerationImpl(
          $enumDecode(_$RunObjectResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RunObjectResponseFormatEnumerationImplToJson(
        _$RunObjectResponseFormatEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$RunObjectResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunObjectResponseFormatModeEnumMap = {
  RunObjectResponseFormatMode.auto: 'auto',
};

_$RunObjectResponseFormatResponseFormatImpl
    _$$RunObjectResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$RunObjectResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$RunObjectResponseFormatResponseFormatImplToJson(
        _$RunObjectResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$RunSubmitToolOutputsImpl _$$RunSubmitToolOutputsImplFromJson(
        Map<String, dynamic> json) =>
    _$RunSubmitToolOutputsImpl(
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) => RunToolCallObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RunSubmitToolOutputsImplToJson(
        _$RunSubmitToolOutputsImpl instance) =>
    <String, dynamic>{
      'tool_calls': instance.toolCalls.map((e) => e.toJson()).toList(),
    };

_$RunCompletionUsageImpl _$$RunCompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$RunCompletionUsageImpl(
      completionTokens: (json['completion_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$RunCompletionUsageImplToJson(
        _$RunCompletionUsageImpl instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_$CreateRunRequestImpl _$$CreateRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRunRequestImpl(
      assistantId: json['assistant_id'] as String,
      model: const _CreateRunRequestModelConverter().fromJson(json['model']),
      instructions: json['instructions'] as String?,
      additionalInstructions: json['additional_instructions'] as String?,
      additionalMessages: (json['additional_messages'] as List<dynamic>?)
          ?.map((e) => CreateMessageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      maxPromptTokens: (json['max_prompt_tokens'] as num?)?.toInt(),
      maxCompletionTokens: (json['max_completion_tokens'] as num?)?.toInt(),
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice: const _CreateRunRequestToolChoiceConverter()
          .fromJson(json['tool_choice']),
      parallelToolCalls: json['parallel_tool_calls'] as bool?,
      responseFormat: const _CreateRunRequestResponseFormatConverter()
          .fromJson(json['response_format']),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$CreateRunRequestImplToJson(
        _$CreateRunRequestImpl instance) =>
    <String, dynamic>{
      'assistant_id': instance.assistantId,
      if (const _CreateRunRequestModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (instance.additionalInstructions case final value?)
        'additional_instructions': value,
      if (instance.additionalMessages?.map((e) => e.toJson()).toList()
          case final value?)
        'additional_messages': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (instance.maxPromptTokens case final value?)
        'max_prompt_tokens': value,
      if (instance.maxCompletionTokens case final value?)
        'max_completion_tokens': value,
      if (instance.truncationStrategy?.toJson() case final value?)
        'truncation_strategy': value,
      if (const _CreateRunRequestToolChoiceConverter()
              .toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.parallelToolCalls case final value?)
        'parallel_tool_calls': value,
      if (const _CreateRunRequestResponseFormatConverter()
              .toJson(instance.responseFormat)
          case final value?)
        'response_format': value,
      if (instance.stream case final value?) 'stream': value,
    };

_$CreateRunRequestModelEnumerationImpl
    _$$CreateRunRequestModelEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestModelEnumerationImpl(
          $enumDecode(_$RunModelsEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateRunRequestModelEnumerationImplToJson(
        _$CreateRunRequestModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$RunModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunModelsEnumMap = {
  RunModels.gpt4: 'gpt-4',
  RunModels.gpt432k: 'gpt-4-32k',
  RunModels.gpt432k0314: 'gpt-4-32k-0314',
  RunModels.gpt432k0613: 'gpt-4-32k-0613',
  RunModels.gpt40125Preview: 'gpt-4-0125-preview',
  RunModels.gpt40314: 'gpt-4-0314',
  RunModels.gpt40613: 'gpt-4-0613',
  RunModels.gpt41106Preview: 'gpt-4-1106-preview',
  RunModels.gpt4Turbo: 'gpt-4-turbo',
  RunModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  RunModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  RunModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  RunModels.gpt4o: 'gpt-4o',
  RunModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  RunModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  RunModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  RunModels.gpt4oMini: 'gpt-4o-mini',
  RunModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  RunModels.gpt35Turbo: 'gpt-3.5-turbo',
  RunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  RunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  RunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  RunModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  RunModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
};

_$CreateRunRequestModelStringImpl _$$CreateRunRequestModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRunRequestModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateRunRequestModelStringImplToJson(
        _$CreateRunRequestModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateRunRequestToolChoiceEnumerationImpl
    _$$CreateRunRequestToolChoiceEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestToolChoiceEnumerationImpl(
          $enumDecode(_$CreateRunRequestToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateRunRequestToolChoiceEnumerationImplToJson(
        _$CreateRunRequestToolChoiceEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$CreateRunRequestToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateRunRequestToolChoiceModeEnumMap = {
  CreateRunRequestToolChoiceMode.none: 'none',
  CreateRunRequestToolChoiceMode.auto: 'auto',
  CreateRunRequestToolChoiceMode.required: 'required',
};

_$CreateRunRequestToolChoiceAssistantsNamedToolChoiceImpl
    _$$CreateRunRequestToolChoiceAssistantsNamedToolChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestToolChoiceAssistantsNamedToolChoiceImpl(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$CreateRunRequestToolChoiceAssistantsNamedToolChoiceImplToJson(
        _$CreateRunRequestToolChoiceAssistantsNamedToolChoiceImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$CreateRunRequestResponseFormatEnumerationImpl
    _$$CreateRunRequestResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestResponseFormatEnumerationImpl(
          $enumDecode(
              _$CreateRunRequestResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateRunRequestResponseFormatEnumerationImplToJson(
        _$CreateRunRequestResponseFormatEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$CreateRunRequestResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateRunRequestResponseFormatModeEnumMap = {
  CreateRunRequestResponseFormatMode.auto: 'auto',
};

_$CreateRunRequestResponseFormatResponseFormatImpl
    _$$CreateRunRequestResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateRunRequestResponseFormatResponseFormatImplToJson(
        _$CreateRunRequestResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$ListRunsResponseImpl _$$ListRunsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListRunsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RunObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListRunsResponseImplToJson(
        _$ListRunsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$ModifyRunRequestImpl _$$ModifyRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyRunRequestImpl(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ModifyRunRequestImplToJson(
        _$ModifyRunRequestImpl instance) =>
    <String, dynamic>{
      if (instance.metadata case final value?) 'metadata': value,
    };

_$SubmitToolOutputsRunRequestImpl _$$SubmitToolOutputsRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitToolOutputsRunRequestImpl(
      toolOutputs: (json['tool_outputs'] as List<dynamic>)
          .map((e) => RunSubmitToolOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$SubmitToolOutputsRunRequestImplToJson(
        _$SubmitToolOutputsRunRequestImpl instance) =>
    <String, dynamic>{
      'tool_outputs': instance.toolOutputs.map((e) => e.toJson()).toList(),
      if (instance.stream case final value?) 'stream': value,
    };

_$RunSubmitToolOutputImpl _$$RunSubmitToolOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$RunSubmitToolOutputImpl(
      toolCallId: json['tool_call_id'] as String?,
      output: json['output'] as String?,
    );

Map<String, dynamic> _$$RunSubmitToolOutputImplToJson(
        _$RunSubmitToolOutputImpl instance) =>
    <String, dynamic>{
      if (instance.toolCallId case final value?) 'tool_call_id': value,
      if (instance.output case final value?) 'output': value,
    };

_$RunToolCallObjectImpl _$$RunToolCallObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RunToolCallObjectImpl(
      id: json['id'] as String,
      type: $enumDecode(_$RunToolCallObjectTypeEnumMap, json['type']),
      function: RunToolCallFunction.fromJson(
          json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunToolCallObjectImplToJson(
        _$RunToolCallObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RunToolCallObjectTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$RunToolCallObjectTypeEnumMap = {
  RunToolCallObjectType.function: 'function',
};

_$RunToolCallFunctionImpl _$$RunToolCallFunctionImplFromJson(
        Map<String, dynamic> json) =>
    _$RunToolCallFunctionImpl(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$$RunToolCallFunctionImplToJson(
        _$RunToolCallFunctionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

_$CreateThreadAndRunRequestImpl _$$CreateThreadAndRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateThreadAndRunRequestImpl(
      assistantId: json['assistant_id'] as String,
      thread: json['thread'] == null
          ? null
          : CreateThreadRequest.fromJson(
              json['thread'] as Map<String, dynamic>),
      model: const _ThreadAndRunModelConverter().fromJson(json['model']),
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      maxPromptTokens: (json['max_prompt_tokens'] as num?)?.toInt(),
      maxCompletionTokens: (json['max_completion_tokens'] as num?)?.toInt(),
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice: const _CreateThreadAndRunRequestToolChoiceConverter()
          .fromJson(json['tool_choice']),
      parallelToolCalls: json['parallel_tool_calls'] as bool?,
      responseFormat: const _CreateThreadAndRunRequestResponseFormatConverter()
          .fromJson(json['response_format']),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$CreateThreadAndRunRequestImplToJson(
        _$CreateThreadAndRunRequestImpl instance) =>
    <String, dynamic>{
      'assistant_id': instance.assistantId,
      if (instance.thread?.toJson() case final value?) 'thread': value,
      if (const _ThreadAndRunModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      if (instance.instructions case final value?) 'instructions': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topP case final value?) 'top_p': value,
      if (instance.maxPromptTokens case final value?)
        'max_prompt_tokens': value,
      if (instance.maxCompletionTokens case final value?)
        'max_completion_tokens': value,
      if (instance.truncationStrategy?.toJson() case final value?)
        'truncation_strategy': value,
      if (const _CreateThreadAndRunRequestToolChoiceConverter()
              .toJson(instance.toolChoice)
          case final value?)
        'tool_choice': value,
      if (instance.parallelToolCalls case final value?)
        'parallel_tool_calls': value,
      if (const _CreateThreadAndRunRequestResponseFormatConverter()
              .toJson(instance.responseFormat)
          case final value?)
        'response_format': value,
      if (instance.stream case final value?) 'stream': value,
    };

_$ThreadAndRunModelEnumerationImpl _$$ThreadAndRunModelEnumerationImplFromJson(
        Map<String, dynamic> json) =>
    _$ThreadAndRunModelEnumerationImpl(
      $enumDecode(_$ThreadAndRunModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ThreadAndRunModelEnumerationImplToJson(
        _$ThreadAndRunModelEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ThreadAndRunModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ThreadAndRunModelsEnumMap = {
  ThreadAndRunModels.gpt4: 'gpt-4',
  ThreadAndRunModels.gpt432k: 'gpt-4-32k',
  ThreadAndRunModels.gpt432k0314: 'gpt-4-32k-0314',
  ThreadAndRunModels.gpt432k0613: 'gpt-4-32k-0613',
  ThreadAndRunModels.gpt40125Preview: 'gpt-4-0125-preview',
  ThreadAndRunModels.gpt40314: 'gpt-4-0314',
  ThreadAndRunModels.gpt40613: 'gpt-4-0613',
  ThreadAndRunModels.gpt41106Preview: 'gpt-4-1106-preview',
  ThreadAndRunModels.gpt4Turbo: 'gpt-4-turbo',
  ThreadAndRunModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  ThreadAndRunModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  ThreadAndRunModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ThreadAndRunModels.gpt4o: 'gpt-4o',
  ThreadAndRunModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  ThreadAndRunModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  ThreadAndRunModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  ThreadAndRunModels.gpt4oMini: 'gpt-4o-mini',
  ThreadAndRunModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  ThreadAndRunModels.gpt35Turbo: 'gpt-3.5-turbo',
  ThreadAndRunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ThreadAndRunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  ThreadAndRunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ThreadAndRunModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ThreadAndRunModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
};

_$ThreadAndRunModelStringImpl _$$ThreadAndRunModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$ThreadAndRunModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ThreadAndRunModelStringImplToJson(
        _$ThreadAndRunModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$CreateThreadAndRunRequestToolChoiceEnumerationImpl
    _$$CreateThreadAndRunRequestToolChoiceEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateThreadAndRunRequestToolChoiceEnumerationImpl(
          $enumDecode(
              _$CreateThreadAndRunRequestToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateThreadAndRunRequestToolChoiceEnumerationImplToJson(
            _$CreateThreadAndRunRequestToolChoiceEnumerationImpl instance) =>
        <String, dynamic>{
          'value':
              _$CreateThreadAndRunRequestToolChoiceModeEnumMap[instance.value]!,
          'runtimeType': instance.$type,
        };

const _$CreateThreadAndRunRequestToolChoiceModeEnumMap = {
  CreateThreadAndRunRequestToolChoiceMode.none: 'none',
  CreateThreadAndRunRequestToolChoiceMode.auto: 'auto',
  CreateThreadAndRunRequestToolChoiceMode.required: 'required',
};

_$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceImpl
    _$$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceImpl(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceImplToJson(
            _$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_$CreateThreadAndRunRequestResponseFormatEnumerationImpl
    _$$CreateThreadAndRunRequestResponseFormatEnumerationImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateThreadAndRunRequestResponseFormatEnumerationImpl(
          $enumDecode(_$CreateThreadAndRunRequestResponseFormatModeEnumMap,
              json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$CreateThreadAndRunRequestResponseFormatEnumerationImplToJson(
        _$CreateThreadAndRunRequestResponseFormatEnumerationImpl instance) =>
    <String, dynamic>{
      'value':
          _$CreateThreadAndRunRequestResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateThreadAndRunRequestResponseFormatModeEnumMap = {
  CreateThreadAndRunRequestResponseFormatMode.auto: 'auto',
};

_$CreateThreadAndRunRequestResponseFormatResponseFormatImpl
    _$$CreateThreadAndRunRequestResponseFormatResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateThreadAndRunRequestResponseFormatResponseFormatImpl(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$CreateThreadAndRunRequestResponseFormatResponseFormatImplToJson(
        _$CreateThreadAndRunRequestResponseFormatResponseFormatImpl instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_$ThreadObjectImpl _$$ThreadObjectImplFromJson(Map<String, dynamic> json) =>
    _$ThreadObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$ThreadObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ThreadObjectImplToJson(_$ThreadObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ThreadObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'tool_resources': instance.toolResources?.toJson(),
      'metadata': instance.metadata,
    };

const _$ThreadObjectObjectEnumMap = {
  ThreadObjectObject.thread: 'thread',
};

_$CreateThreadRequestImpl _$$CreateThreadRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateThreadRequestImpl(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => CreateMessageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateThreadRequestImplToJson(
        _$CreateThreadRequestImpl instance) =>
    <String, dynamic>{
      if (instance.messages?.map((e) => e.toJson()).toList() case final value?)
        'messages': value,
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$ModifyThreadRequestImpl _$$ModifyThreadRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyThreadRequestImpl(
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ModifyThreadRequestImplToJson(
        _$ModifyThreadRequestImpl instance) =>
    <String, dynamic>{
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$ToolResourcesImpl _$$ToolResourcesImplFromJson(Map<String, dynamic> json) =>
    _$ToolResourcesImpl(
      codeInterpreter: json['code_interpreter'] == null
          ? null
          : ToolResourcesCodeInterpreter.fromJson(
              json['code_interpreter'] as Map<String, dynamic>),
      fileSearch: json['file_search'] == null
          ? null
          : ToolResourcesFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ToolResourcesImplToJson(_$ToolResourcesImpl instance) =>
    <String, dynamic>{
      if (instance.codeInterpreter?.toJson() case final value?)
        'code_interpreter': value,
      if (instance.fileSearch?.toJson() case final value?) 'file_search': value,
    };

_$ToolResourcesCodeInterpreterImpl _$$ToolResourcesCodeInterpreterImplFromJson(
        Map<String, dynamic> json) =>
    _$ToolResourcesCodeInterpreterImpl(
      fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ToolResourcesCodeInterpreterImplToJson(
        _$ToolResourcesCodeInterpreterImpl instance) =>
    <String, dynamic>{
      'file_ids': instance.fileIds,
    };

_$ToolResourcesFileSearchImpl _$$ToolResourcesFileSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$ToolResourcesFileSearchImpl(
      vectorStoreIds: (json['vector_store_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vectorStores: (json['vector_stores'] as List<dynamic>?)
          ?.map((e) => ToolResourcesFileSearchVectorStore.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ToolResourcesFileSearchImplToJson(
        _$ToolResourcesFileSearchImpl instance) =>
    <String, dynamic>{
      if (instance.vectorStoreIds case final value?) 'vector_store_ids': value,
      if (instance.vectorStores?.map((e) => e.toJson()).toList()
          case final value?)
        'vector_stores': value,
    };

_$ToolResourcesFileSearchVectorStoreImpl
    _$$ToolResourcesFileSearchVectorStoreImplFromJson(
            Map<String, dynamic> json) =>
        _$ToolResourcesFileSearchVectorStoreImpl(
          fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          chunkingStrategy: json['chunking_strategy'] == null
              ? null
              : ChunkingStrategyRequestParam.fromJson(
                  json['chunking_strategy'] as Map<String, dynamic>),
          metadata: json['metadata'],
        );

Map<String, dynamic> _$$ToolResourcesFileSearchVectorStoreImplToJson(
        _$ToolResourcesFileSearchVectorStoreImpl instance) =>
    <String, dynamic>{
      if (instance.fileIds case final value?) 'file_ids': value,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$DeleteThreadResponseImpl _$$DeleteThreadResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteThreadResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: $enumDecode(_$DeleteThreadResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$DeleteThreadResponseImplToJson(
        _$DeleteThreadResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteThreadResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteThreadResponseObjectEnumMap = {
  DeleteThreadResponseObject.threadDeleted: 'thread.deleted',
};

_$ListThreadsResponseImpl _$$ListThreadsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListThreadsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ThreadObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListThreadsResponseImplToJson(
        _$ListThreadsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$MessageObjectImpl _$$MessageObjectImplFromJson(Map<String, dynamic> json) =>
    _$MessageObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$MessageObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      threadId: json['thread_id'] as String,
      status: $enumDecodeNullable(_$MessageObjectStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      incompleteDetails: json['incomplete_details'] == null
          ? null
          : MessageObjectIncompleteDetails.fromJson(
              json['incomplete_details'] as Map<String, dynamic>),
      completedAt: (json['completed_at'] as num?)?.toInt(),
      incompleteAt: (json['incomplete_at'] as num?)?.toInt(),
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      content: (json['content'] as List<dynamic>)
          .map((e) => MessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      assistantId: json['assistant_id'] as String?,
      runId: json['run_id'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageObjectImplToJson(_$MessageObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$MessageObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'thread_id': instance.threadId,
      'status': _$MessageObjectStatusEnumMap[instance.status],
      'incomplete_details': instance.incompleteDetails?.toJson(),
      'completed_at': instance.completedAt,
      'incomplete_at': instance.incompleteAt,
      'role': _$MessageRoleEnumMap[instance.role]!,
      'content': instance.content.map((e) => e.toJson()).toList(),
      'assistant_id': instance.assistantId,
      'run_id': instance.runId,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };

const _$MessageObjectObjectEnumMap = {
  MessageObjectObject.threadMessage: 'thread.message',
};

const _$MessageObjectStatusEnumMap = {
  MessageObjectStatus.inProgress: 'in_progress',
  MessageObjectStatus.incomplete: 'incomplete',
  MessageObjectStatus.completed: 'completed',
};

const _$MessageRoleEnumMap = {
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
};

_$MessageObjectIncompleteDetailsImpl
    _$$MessageObjectIncompleteDetailsImplFromJson(Map<String, dynamic> json) =>
        _$MessageObjectIncompleteDetailsImpl(
          reason: $enumDecode(
              _$MessageObjectIncompleteDetailsReasonEnumMap, json['reason']),
        );

Map<String, dynamic> _$$MessageObjectIncompleteDetailsImplToJson(
        _$MessageObjectIncompleteDetailsImpl instance) =>
    <String, dynamic>{
      'reason': _$MessageObjectIncompleteDetailsReasonEnumMap[instance.reason]!,
    };

const _$MessageObjectIncompleteDetailsReasonEnumMap = {
  MessageObjectIncompleteDetailsReason.contentFilter: 'content_filter',
  MessageObjectIncompleteDetailsReason.maxTokens: 'max_tokens',
  MessageObjectIncompleteDetailsReason.runCancelled: 'run_cancelled',
  MessageObjectIncompleteDetailsReason.runExpired: 'run_expired',
  MessageObjectIncompleteDetailsReason.runFailed: 'run_failed',
};

_$MessageAttachmentImpl _$$MessageAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageAttachmentImpl(
      fileId: json['file_id'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageAttachmentImplToJson(
        _$MessageAttachmentImpl instance) =>
    <String, dynamic>{
      if (instance.fileId case final value?) 'file_id': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
    };

_$MessageDeltaObjectImpl _$$MessageDeltaObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$MessageDeltaObjectObjectEnumMap, json['object']),
      delta: MessageDelta.fromJson(json['delta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageDeltaObjectImplToJson(
        _$MessageDeltaObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$MessageDeltaObjectObjectEnumMap[instance.object]!,
      'delta': instance.delta.toJson(),
    };

const _$MessageDeltaObjectObjectEnumMap = {
  MessageDeltaObjectObject.threadMessageDelta: 'thread.message.delta',
};

_$MessageDeltaImpl _$$MessageDeltaImplFromJson(Map<String, dynamic> json) =>
    _$MessageDeltaImpl(
      role: $enumDecodeNullable(_$MessageRoleEnumMap, json['role'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => MessageDeltaContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageDeltaImplToJson(_$MessageDeltaImpl instance) =>
    <String, dynamic>{
      if (_$MessageRoleEnumMap[instance.role] case final value?) 'role': value,
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
    };

_$CreateMessageRequestImpl _$$CreateMessageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateMessageRequestImpl(
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      content: const _CreateMessageRequestContentConverter()
          .fromJson(json['content']),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateMessageRequestImplToJson(
        _$CreateMessageRequestImpl instance) =>
    <String, dynamic>{
      'role': _$MessageRoleEnumMap[instance.role]!,
      'content': const _CreateMessageRequestContentConverter()
          .toJson(instance.content),
      if (instance.attachments?.map((e) => e.toJson()).toList()
          case final value?)
        'attachments': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$CreateMessageRequestContentListMessageContentImpl
    _$$CreateMessageRequestContentListMessageContentImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateMessageRequestContentListMessageContentImpl(
          (json['value'] as List<dynamic>)
              .map((e) => MessageContent.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateMessageRequestContentListMessageContentImplToJson(
        _$CreateMessageRequestContentListMessageContentImpl instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$CreateMessageRequestContentStringImpl
    _$$CreateMessageRequestContentStringImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateMessageRequestContentStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateMessageRequestContentStringImplToJson(
        _$CreateMessageRequestContentStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ModifyMessageRequestImpl _$$ModifyMessageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyMessageRequestImpl(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ModifyMessageRequestImplToJson(
        _$ModifyMessageRequestImpl instance) =>
    <String, dynamic>{
      if (instance.metadata case final value?) 'metadata': value,
    };

_$DeleteMessageResponseImpl _$$DeleteMessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteMessageResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: $enumDecode(_$DeleteMessageResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$DeleteMessageResponseImplToJson(
        _$DeleteMessageResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteMessageResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteMessageResponseObjectEnumMap = {
  DeleteMessageResponseObject.threadMessageDeleted: 'thread.message.deleted',
};

_$ListMessagesResponseImpl _$$ListMessagesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListMessagesResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListMessagesResponseImplToJson(
        _$ListMessagesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$MessageContentImageFileImpl _$$MessageContentImageFileImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentImageFileImpl(
      fileId: json['file_id'] as String,
      detail: $enumDecodeNullable(
              _$MessageContentImageDetailEnumMap, json['detail']) ??
          MessageContentImageDetail.auto,
    );

Map<String, dynamic> _$$MessageContentImageFileImplToJson(
        _$MessageContentImageFileImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'detail': _$MessageContentImageDetailEnumMap[instance.detail]!,
    };

const _$MessageContentImageDetailEnumMap = {
  MessageContentImageDetail.auto: 'auto',
  MessageContentImageDetail.low: 'low',
  MessageContentImageDetail.high: 'high',
};

_$MessageContentImageUrlImpl _$$MessageContentImageUrlImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentImageUrlImpl(
      url: json['url'] as String,
      detail: $enumDecodeNullable(
              _$MessageContentImageDetailEnumMap, json['detail']) ??
          MessageContentImageDetail.auto,
    );

Map<String, dynamic> _$$MessageContentImageUrlImplToJson(
        _$MessageContentImageUrlImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'detail': _$MessageContentImageDetailEnumMap[instance.detail]!,
    };

_$MessageRequestContentTextObjectImpl
    _$$MessageRequestContentTextObjectImplFromJson(Map<String, dynamic> json) =>
        _$MessageRequestContentTextObjectImpl(
          type: json['type'] as String,
          text: json['text'] as String,
        );

Map<String, dynamic> _$$MessageRequestContentTextObjectImplToJson(
        _$MessageRequestContentTextObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

_$MessageContentTextImpl _$$MessageContentTextImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentTextImpl(
      value: json['value'] as String,
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) =>
              MessageContentTextAnnotations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageContentTextImplToJson(
        _$MessageContentTextImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      if (instance.annotations?.map((e) => e.toJson()).toList()
          case final value?)
        'annotations': value,
    };

_$MessageContentTextAnnotationsFileCitationImpl
    _$$MessageContentTextAnnotationsFileCitationImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFileCitationImpl(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$$MessageContentTextAnnotationsFileCitationImplToJson(
        _$MessageContentTextAnnotationsFileCitationImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$MessageDeltaContentTextImpl _$$MessageDeltaContentTextImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageDeltaContentTextImpl(
      value: json['value'] as String?,
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) => MessageDeltaContentTextAnnotations.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageDeltaContentTextImplToJson(
        _$MessageDeltaContentTextImpl instance) =>
    <String, dynamic>{
      if (instance.value case final value?) 'value': value,
      if (instance.annotations?.map((e) => e.toJson()).toList()
          case final value?)
        'annotations': value,
    };

_$MessageDeltaContentTextAnnotationsFileCitationImpl
    _$$MessageDeltaContentTextAnnotationsFileCitationImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFileCitationImpl(
          fileId: json['file_id'] as String?,
          quote: json['quote'] as String?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFileCitationImplToJson(
            _$MessageDeltaContentTextAnnotationsFileCitationImpl instance) =>
        <String, dynamic>{
          if (instance.fileId case final value?) 'file_id': value,
          if (instance.quote case final value?) 'quote': value,
        };

_$RunStepObjectImpl _$$RunStepObjectImplFromJson(Map<String, dynamic> json) =>
    _$RunStepObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$RunStepObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      assistantId: json['assistant_id'] as String,
      threadId: json['thread_id'] as String,
      runId: json['run_id'] as String,
      type: $enumDecode(_$RunStepTypeEnumMap, json['type']),
      status: $enumDecode(_$RunStepStatusEnumMap, json['status']),
      stepDetails:
          RunStepDetails.fromJson(json['step_details'] as Map<String, dynamic>),
      lastError: json['last_error'] == null
          ? null
          : RunStepLastError.fromJson(
              json['last_error'] as Map<String, dynamic>),
      expiredAt: (json['expired_at'] as num?)?.toInt(),
      cancelledAt: (json['cancelled_at'] as num?)?.toInt(),
      failedAt: (json['failed_at'] as num?)?.toInt(),
      completedAt: (json['completed_at'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      usage: json['usage'] == null
          ? null
          : RunStepCompletionUsage.fromJson(
              json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStepObjectImplToJson(_$RunStepObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$RunStepObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'assistant_id': instance.assistantId,
      'thread_id': instance.threadId,
      'run_id': instance.runId,
      'type': _$RunStepTypeEnumMap[instance.type]!,
      'status': _$RunStepStatusEnumMap[instance.status]!,
      'step_details': instance.stepDetails.toJson(),
      'last_error': instance.lastError?.toJson(),
      'expired_at': instance.expiredAt,
      'cancelled_at': instance.cancelledAt,
      'failed_at': instance.failedAt,
      'completed_at': instance.completedAt,
      'metadata': instance.metadata,
      'usage': instance.usage?.toJson(),
    };

const _$RunStepObjectObjectEnumMap = {
  RunStepObjectObject.threadRunStep: 'thread.run.step',
};

const _$RunStepTypeEnumMap = {
  RunStepType.messageCreation: 'message_creation',
  RunStepType.toolCalls: 'tool_calls',
};

const _$RunStepStatusEnumMap = {
  RunStepStatus.inProgress: 'in_progress',
  RunStepStatus.cancelled: 'cancelled',
  RunStepStatus.failed: 'failed',
  RunStepStatus.completed: 'completed',
  RunStepStatus.expired: 'expired',
};

_$RunStepLastErrorImpl _$$RunStepLastErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepLastErrorImpl(
      code: $enumDecode(_$RunStepLastErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$RunStepLastErrorImplToJson(
        _$RunStepLastErrorImpl instance) =>
    <String, dynamic>{
      'code': _$RunStepLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$RunStepLastErrorCodeEnumMap = {
  RunStepLastErrorCode.serverError: 'server_error',
  RunStepLastErrorCode.rateLimitExceeded: 'rate_limit_exceeded',
};

_$RunStepDeltaObjectImpl _$$RunStepDeltaObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepDeltaObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$RunStepDeltaObjectObjectEnumMap, json['object']),
      delta: RunStepDelta.fromJson(json['delta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStepDeltaObjectImplToJson(
        _$RunStepDeltaObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$RunStepDeltaObjectObjectEnumMap[instance.object]!,
      'delta': instance.delta.toJson(),
    };

const _$RunStepDeltaObjectObjectEnumMap = {
  RunStepDeltaObjectObject.threadRunStepDelta: 'thread.run.step.delta',
};

_$RunStepDeltaImpl _$$RunStepDeltaImplFromJson(Map<String, dynamic> json) =>
    _$RunStepDeltaImpl(
      stepDetails: json['step_details'] == null
          ? null
          : RunStepDeltaDetails.fromJson(
              json['step_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStepDeltaImplToJson(_$RunStepDeltaImpl instance) =>
    <String, dynamic>{
      if (instance.stepDetails?.toJson() case final value?)
        'step_details': value,
    };

_$ListRunStepsResponseImpl _$$ListRunStepsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListRunStepsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RunStepObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListRunStepsResponseImplToJson(
        _$ListRunStepsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$RunStepDetailsMessageCreationImpl
    _$$RunStepDetailsMessageCreationImplFromJson(Map<String, dynamic> json) =>
        _$RunStepDetailsMessageCreationImpl(
          messageId: json['message_id'] as String,
        );

Map<String, dynamic> _$$RunStepDetailsMessageCreationImplToJson(
        _$RunStepDetailsMessageCreationImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
    };

_$RunStepDeltaStepDetailsMessageCreationImpl
    _$$RunStepDeltaStepDetailsMessageCreationImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsMessageCreationImpl(
          messageId: json['message_id'] as String?,
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsMessageCreationImplToJson(
        _$RunStepDeltaStepDetailsMessageCreationImpl instance) =>
    <String, dynamic>{
      if (instance.messageId case final value?) 'message_id': value,
    };

_$RunStepDetailsToolCallsCodeObjectCodeInterpreterImpl
    _$$RunStepDetailsToolCallsCodeObjectCodeInterpreterImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeObjectCodeInterpreterImpl(
          input: json['input'] as String,
          outputs: (json['outputs'] as List<dynamic>)
              .map((e) => RunStepDetailsToolCallsCodeOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic>
    _$$RunStepDetailsToolCallsCodeObjectCodeInterpreterImplToJson(
            _$RunStepDetailsToolCallsCodeObjectCodeInterpreterImpl instance) =>
        <String, dynamic>{
          'input': instance.input,
          'outputs': instance.outputs.map((e) => e.toJson()).toList(),
        };

_$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterImpl(
          input: json['input'] as String?,
          outputs: (json['outputs'] as List<dynamic>?)
              ?.map((e) => RunStepDeltaStepDetailsToolCallsCodeOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterImplToJson(
            _$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterImpl
                instance) =>
        <String, dynamic>{
          if (instance.input case final value?) 'input': value,
          if (instance.outputs?.map((e) => e.toJson()).toList()
              case final value?)
            'outputs': value,
        };

_$RunStepDetailsToolCallsCodeOutputImageImpl
    _$$RunStepDetailsToolCallsCodeOutputImageImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeOutputImageImpl(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeOutputImageImplToJson(
        _$RunStepDetailsToolCallsCodeOutputImageImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$RunStepDeltaStepDetailsToolCallsCodeOutputImageImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageImpl(
          fileId: json['file_id'] as String?,
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageImplToJson(
            _$RunStepDeltaStepDetailsToolCallsCodeOutputImageImpl instance) =>
        <String, dynamic>{
          if (instance.fileId case final value?) 'file_id': value,
        };

_$RunStepDetailsToolCallsFileSearchImpl
    _$$RunStepDetailsToolCallsFileSearchImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFileSearchImpl(
          rankingOptions: json['ranking_options'] == null
              ? null
              : RunStepDetailsToolCallsFileSearchRankingOptionsObject.fromJson(
                  json['ranking_options'] as Map<String, dynamic>),
          results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  RunStepDetailsToolCallsFileSearchResultObject.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFileSearchImplToJson(
        _$RunStepDetailsToolCallsFileSearchImpl instance) =>
    <String, dynamic>{
      if (instance.rankingOptions?.toJson() case final value?)
        'ranking_options': value,
      if (instance.results?.map((e) => e.toJson()).toList() case final value?)
        'results': value,
    };

_$RunStepDetailsToolCallsFileSearchRankingOptionsObjectImpl
    _$$RunStepDetailsToolCallsFileSearchRankingOptionsObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFileSearchRankingOptionsObjectImpl(
          ranker: $enumDecode(_$FileSearchRankerEnumMap, json['ranker']),
          scoreThreshold: (json['score_threshold'] as num).toDouble(),
        );

Map<String,
    dynamic> _$$RunStepDetailsToolCallsFileSearchRankingOptionsObjectImplToJson(
        _$RunStepDetailsToolCallsFileSearchRankingOptionsObjectImpl instance) =>
    <String, dynamic>{
      'ranker': _$FileSearchRankerEnumMap[instance.ranker]!,
      'score_threshold': instance.scoreThreshold,
    };

_$RunStepDetailsToolCallsFileSearchResultObjectImpl
    _$$RunStepDetailsToolCallsFileSearchResultObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFileSearchResultObjectImpl(
          fileId: json['file_id'] as String,
          fileName: json['file_name'] as String,
          score: (json['score'] as num).toDouble(),
          content: (json['content'] as List<dynamic>?)
              ?.map((e) =>
                  RunStepDetailsToolCallsFileSearchResultContent.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFileSearchResultObjectImplToJson(
        _$RunStepDetailsToolCallsFileSearchResultObjectImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'file_name': instance.fileName,
      'score': instance.score,
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
    };

_$RunStepDetailsToolCallsFileSearchResultContentImpl
    _$$RunStepDetailsToolCallsFileSearchResultContentImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFileSearchResultContentImpl(
          type: json['type'] as String? ?? 'text',
          text: json['text'] as String?,
        );

Map<String, dynamic>
    _$$RunStepDetailsToolCallsFileSearchResultContentImplToJson(
            _$RunStepDetailsToolCallsFileSearchResultContentImpl instance) =>
        <String, dynamic>{
          'type': instance.type,
          if (instance.text case final value?) 'text': value,
        };

_$RunStepCompletionUsageImpl _$$RunStepCompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepCompletionUsageImpl(
      completionTokens: (json['completion_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$RunStepCompletionUsageImplToJson(
        _$RunStepCompletionUsageImpl instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_$VectorStoreExpirationAfterImpl _$$VectorStoreExpirationAfterImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreExpirationAfterImpl(
      anchor: $enumDecode(
          _$VectorStoreExpirationAfterAnchorEnumMap, json['anchor']),
      days: (json['days'] as num).toInt(),
    );

Map<String, dynamic> _$$VectorStoreExpirationAfterImplToJson(
        _$VectorStoreExpirationAfterImpl instance) =>
    <String, dynamic>{
      'anchor': _$VectorStoreExpirationAfterAnchorEnumMap[instance.anchor]!,
      'days': instance.days,
    };

const _$VectorStoreExpirationAfterAnchorEnumMap = {
  VectorStoreExpirationAfterAnchor.lastActiveAt: 'last_active_at',
};

_$VectorStoreObjectImpl _$$VectorStoreObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreObjectImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      name: json['name'] as String?,
      usageBytes: (json['usage_bytes'] as num).toInt(),
      fileCounts: VectorStoreObjectFileCounts.fromJson(
          json['file_counts'] as Map<String, dynamic>),
      status: $enumDecode(_$VectorStoreObjectStatusEnumMap, json['status']),
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      lastActiveAt: (json['last_active_at'] as num?)?.toInt(),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$VectorStoreObjectImplToJson(
        _$VectorStoreObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created_at': instance.createdAt,
      'name': instance.name,
      'usage_bytes': instance.usageBytes,
      'file_counts': instance.fileCounts.toJson(),
      'status': _$VectorStoreObjectStatusEnumMap[instance.status]!,
      if (instance.expiresAfter?.toJson() case final value?)
        'expires_after': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      'last_active_at': instance.lastActiveAt,
      'metadata': instance.metadata,
    };

const _$VectorStoreObjectStatusEnumMap = {
  VectorStoreObjectStatus.expired: 'expired',
  VectorStoreObjectStatus.inProgress: 'in_progress',
  VectorStoreObjectStatus.completed: 'completed',
};

_$VectorStoreObjectFileCountsImpl _$$VectorStoreObjectFileCountsImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreObjectFileCountsImpl(
      inProgress: (json['in_progress'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
      cancelled: (json['cancelled'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$VectorStoreObjectFileCountsImplToJson(
        _$VectorStoreObjectFileCountsImpl instance) =>
    <String, dynamic>{
      'in_progress': instance.inProgress,
      'completed': instance.completed,
      'failed': instance.failed,
      'cancelled': instance.cancelled,
      'total': instance.total,
    };

_$CreateVectorStoreRequestImpl _$$CreateVectorStoreRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVectorStoreRequestImpl(
      name: json['name'] as String?,
      fileIds: (json['file_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      chunkingStrategy: json['chunking_strategy'] == null
          ? null
          : ChunkingStrategyRequestParam.fromJson(
              json['chunking_strategy'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$CreateVectorStoreRequestImplToJson(
        _$CreateVectorStoreRequestImpl instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.fileIds case final value?) 'file_ids': value,
      if (instance.expiresAfter?.toJson() case final value?)
        'expires_after': value,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$UpdateVectorStoreRequestImpl _$$UpdateVectorStoreRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateVectorStoreRequestImpl(
      name: json['name'] as String?,
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$UpdateVectorStoreRequestImplToJson(
        _$UpdateVectorStoreRequestImpl instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.expiresAfter?.toJson() case final value?)
        'expires_after': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_$ListVectorStoresResponseImpl _$$ListVectorStoresResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListVectorStoresResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VectorStoreObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListVectorStoresResponseImplToJson(
        _$ListVectorStoresResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$DeleteVectorStoreResponseImpl _$$DeleteVectorStoreResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteVectorStoreResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: json['object'] as String,
    );

Map<String, dynamic> _$$DeleteVectorStoreResponseImplToJson(
        _$DeleteVectorStoreResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_$VectorStoreFileObjectImpl _$$VectorStoreFileObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreFileObjectImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      usageBytes: (json['usage_bytes'] as num).toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      vectorStoreId: json['vector_store_id'] as String,
      status: $enumDecode(_$VectorStoreFileStatusEnumMap, json['status']),
      lastError: json['last_error'] == null
          ? null
          : VectorStoreFileObjectLastError.fromJson(
              json['last_error'] as Map<String, dynamic>),
      chunkingStrategy: json['chunking_strategy'] == null
          ? null
          : ChunkingStrategyResponseParam.fromJson(
              json['chunking_strategy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VectorStoreFileObjectImplToJson(
        _$VectorStoreFileObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'usage_bytes': instance.usageBytes,
      'created_at': instance.createdAt,
      'vector_store_id': instance.vectorStoreId,
      'status': _$VectorStoreFileStatusEnumMap[instance.status]!,
      'last_error': instance.lastError?.toJson(),
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
    };

const _$VectorStoreFileStatusEnumMap = {
  VectorStoreFileStatus.inProgress: 'in_progress',
  VectorStoreFileStatus.completed: 'completed',
  VectorStoreFileStatus.cancelled: 'cancelled',
  VectorStoreFileStatus.failed: 'failed',
};

_$VectorStoreFileObjectLastErrorImpl
    _$$VectorStoreFileObjectLastErrorImplFromJson(Map<String, dynamic> json) =>
        _$VectorStoreFileObjectLastErrorImpl(
          code: $enumDecode(
              _$VectorStoreFileObjectLastErrorCodeEnumMap, json['code']),
          message: json['message'] as String,
        );

Map<String, dynamic> _$$VectorStoreFileObjectLastErrorImplToJson(
        _$VectorStoreFileObjectLastErrorImpl instance) =>
    <String, dynamic>{
      'code': _$VectorStoreFileObjectLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$VectorStoreFileObjectLastErrorCodeEnumMap = {
  VectorStoreFileObjectLastErrorCode.serverError: 'server_error',
  VectorStoreFileObjectLastErrorCode.unsupportedFile: 'unsupported_file',
  VectorStoreFileObjectLastErrorCode.invalidFile: 'invalid_file',
};

_$StaticChunkingStrategyImpl _$$StaticChunkingStrategyImplFromJson(
        Map<String, dynamic> json) =>
    _$StaticChunkingStrategyImpl(
      maxChunkSizeTokens: (json['max_chunk_size_tokens'] as num).toInt(),
      chunkOverlapTokens: (json['chunk_overlap_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$StaticChunkingStrategyImplToJson(
        _$StaticChunkingStrategyImpl instance) =>
    <String, dynamic>{
      'max_chunk_size_tokens': instance.maxChunkSizeTokens,
      'chunk_overlap_tokens': instance.chunkOverlapTokens,
    };

_$CreateVectorStoreFileRequestImpl _$$CreateVectorStoreFileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVectorStoreFileRequestImpl(
      fileId: json['file_id'] as String,
      chunkingStrategy: json['chunking_strategy'] == null
          ? null
          : ChunkingStrategyRequestParam.fromJson(
              json['chunking_strategy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateVectorStoreFileRequestImplToJson(
        _$CreateVectorStoreFileRequestImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
    };

_$ListVectorStoreFilesResponseImpl _$$ListVectorStoreFilesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListVectorStoreFilesResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VectorStoreFileObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListVectorStoreFilesResponseImplToJson(
        _$ListVectorStoreFilesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_$DeleteVectorStoreFileResponseImpl
    _$$DeleteVectorStoreFileResponseImplFromJson(Map<String, dynamic> json) =>
        _$DeleteVectorStoreFileResponseImpl(
          id: json['id'] as String,
          deleted: json['deleted'] as bool,
          object: json['object'] as String,
        );

Map<String, dynamic> _$$DeleteVectorStoreFileResponseImplToJson(
        _$DeleteVectorStoreFileResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_$VectorStoreFileBatchObjectImpl _$$VectorStoreFileBatchObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreFileBatchObjectImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      vectorStoreId: json['vector_store_id'] as String,
      status: $enumDecode(
          _$VectorStoreFileBatchObjectStatusEnumMap, json['status']),
      fileCounts: VectorStoreFileBatchObjectFileCounts.fromJson(
          json['file_counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VectorStoreFileBatchObjectImplToJson(
        _$VectorStoreFileBatchObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created_at': instance.createdAt,
      'vector_store_id': instance.vectorStoreId,
      'status': _$VectorStoreFileBatchObjectStatusEnumMap[instance.status]!,
      'file_counts': instance.fileCounts.toJson(),
    };

const _$VectorStoreFileBatchObjectStatusEnumMap = {
  VectorStoreFileBatchObjectStatus.inProgress: 'in_progress',
  VectorStoreFileBatchObjectStatus.completed: 'completed',
  VectorStoreFileBatchObjectStatus.cancelled: 'cancelled',
  VectorStoreFileBatchObjectStatus.failed: 'failed',
};

_$VectorStoreFileBatchObjectFileCountsImpl
    _$$VectorStoreFileBatchObjectFileCountsImplFromJson(
            Map<String, dynamic> json) =>
        _$VectorStoreFileBatchObjectFileCountsImpl(
          inProgress: (json['in_progress'] as num).toInt(),
          completed: (json['completed'] as num).toInt(),
          failed: (json['failed'] as num).toInt(),
          cancelled: (json['cancelled'] as num).toInt(),
          total: (json['total'] as num).toInt(),
        );

Map<String, dynamic> _$$VectorStoreFileBatchObjectFileCountsImplToJson(
        _$VectorStoreFileBatchObjectFileCountsImpl instance) =>
    <String, dynamic>{
      'in_progress': instance.inProgress,
      'completed': instance.completed,
      'failed': instance.failed,
      'cancelled': instance.cancelled,
      'total': instance.total,
    };

_$CreateVectorStoreFileBatchRequestImpl
    _$$CreateVectorStoreFileBatchRequestImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateVectorStoreFileBatchRequestImpl(
          fileIds: (json['file_ids'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
          chunkingStrategy: json['chunking_strategy'] == null
              ? null
              : ChunkingStrategyRequestParam.fromJson(
                  json['chunking_strategy'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateVectorStoreFileBatchRequestImplToJson(
        _$CreateVectorStoreFileBatchRequestImpl instance) =>
    <String, dynamic>{
      'file_ids': instance.fileIds,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      code: json['code'] as String?,
      message: json['message'] as String,
      param: json['param'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
      'type': instance.type,
    };

_$CreateBatchRequestImpl _$$CreateBatchRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBatchRequestImpl(
      inputFileId: json['input_file_id'] as String,
      endpoint: $enumDecode(_$BatchEndpointEnumMap, json['endpoint']),
      completionWindow: $enumDecode(
          _$BatchCompletionWindowEnumMap, json['completion_window']),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$CreateBatchRequestImplToJson(
        _$CreateBatchRequestImpl instance) =>
    <String, dynamic>{
      'input_file_id': instance.inputFileId,
      'endpoint': _$BatchEndpointEnumMap[instance.endpoint]!,
      'completion_window':
          _$BatchCompletionWindowEnumMap[instance.completionWindow]!,
      if (instance.metadata case final value?) 'metadata': value,
    };

const _$BatchEndpointEnumMap = {
  BatchEndpoint.v1ChatCompletions: '/v1/chat/completions',
  BatchEndpoint.v1Embeddings: '/v1/embeddings',
  BatchEndpoint.v1Completions: '/v1/completions',
};

const _$BatchCompletionWindowEnumMap = {
  BatchCompletionWindow.v24h: '24h',
};

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      id: json['id'] as String,
      object: $enumDecode(_$BatchObjectEnumMap, json['object']),
      endpoint: $enumDecode(_$BatchEndpointEnumMap, json['endpoint']),
      errors: json['errors'] == null
          ? null
          : BatchErrors.fromJson(json['errors'] as Map<String, dynamic>),
      inputFileId: json['input_file_id'] as String,
      completionWindow: $enumDecode(
          _$BatchCompletionWindowEnumMap, json['completion_window']),
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
      outputFileId: json['output_file_id'] as String?,
      errorFileId: json['error_file_id'] as String?,
      createdAt: (json['created_at'] as num).toInt(),
      inProgressAt: (json['in_progress_at'] as num?)?.toInt(),
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      finalizingAt: (json['finalizing_at'] as num?)?.toInt(),
      completedAt: (json['completed_at'] as num?)?.toInt(),
      failedAt: (json['failed_at'] as num?)?.toInt(),
      expiredAt: (json['expired_at'] as num?)?.toInt(),
      cancellingAt: (json['cancelling_at'] as num?)?.toInt(),
      cancelledAt: (json['cancelled_at'] as num?)?.toInt(),
      requestCounts: json['request_counts'] == null
          ? null
          : BatchRequestCounts.fromJson(
              json['request_counts'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$BatchObjectEnumMap[instance.object]!,
      'endpoint': _$BatchEndpointEnumMap[instance.endpoint]!,
      if (instance.errors?.toJson() case final value?) 'errors': value,
      'input_file_id': instance.inputFileId,
      'completion_window':
          _$BatchCompletionWindowEnumMap[instance.completionWindow]!,
      'status': _$BatchStatusEnumMap[instance.status]!,
      if (instance.outputFileId case final value?) 'output_file_id': value,
      if (instance.errorFileId case final value?) 'error_file_id': value,
      'created_at': instance.createdAt,
      if (instance.inProgressAt case final value?) 'in_progress_at': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      if (instance.finalizingAt case final value?) 'finalizing_at': value,
      if (instance.completedAt case final value?) 'completed_at': value,
      if (instance.failedAt case final value?) 'failed_at': value,
      if (instance.expiredAt case final value?) 'expired_at': value,
      if (instance.cancellingAt case final value?) 'cancelling_at': value,
      if (instance.cancelledAt case final value?) 'cancelled_at': value,
      if (instance.requestCounts?.toJson() case final value?)
        'request_counts': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

const _$BatchObjectEnumMap = {
  BatchObject.batch: 'batch',
};

const _$BatchStatusEnumMap = {
  BatchStatus.validating: 'validating',
  BatchStatus.failed: 'failed',
  BatchStatus.inProgress: 'in_progress',
  BatchStatus.finalizing: 'finalizing',
  BatchStatus.completed: 'completed',
  BatchStatus.expired: 'expired',
  BatchStatus.cancelling: 'cancelling',
  BatchStatus.cancelled: 'cancelled',
};

_$BatchErrorsImpl _$$BatchErrorsImplFromJson(Map<String, dynamic> json) =>
    _$BatchErrorsImpl(
      object: json['object'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BatchErrorsDataInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BatchErrorsImplToJson(_$BatchErrorsImpl instance) =>
    <String, dynamic>{
      if (instance.object case final value?) 'object': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };

_$BatchRequestCountsImpl _$$BatchRequestCountsImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchRequestCountsImpl(
      total: (json['total'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
    );

Map<String, dynamic> _$$BatchRequestCountsImplToJson(
        _$BatchRequestCountsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'completed': instance.completed,
      'failed': instance.failed,
    };

_$BatchErrorsDataInnerImpl _$$BatchErrorsDataInnerImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchErrorsDataInnerImpl(
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
      line: (json['line'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BatchErrorsDataInnerImplToJson(
        _$BatchErrorsDataInnerImpl instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
      if (instance.line case final value?) 'line': value,
    };

_$ListBatchesResponseImpl _$$ListBatchesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListBatchesResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
      object: $enumDecode(_$ListBatchesResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$ListBatchesResponseImplToJson(
        _$ListBatchesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
      'object': _$ListBatchesResponseObjectEnumMap[instance.object]!,
    };

const _$ListBatchesResponseObjectEnumMap = {
  ListBatchesResponseObject.list: 'list',
};

_$ChatCompletionSystemMessageImpl _$$ChatCompletionSystemMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionSystemMessageImpl(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.system,
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionSystemMessageImplToJson(
        _$ChatCompletionSystemMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      if (instance.name case final value?) 'name': value,
    };

_$ChatCompletionUserMessageImpl _$$ChatCompletionUserMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionUserMessageImpl(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.user,
      content: const _ChatCompletionUserMessageContentConverter()
          .fromJson(json['content']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionUserMessageImplToJson(
        _$ChatCompletionUserMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': const _ChatCompletionUserMessageContentConverter()
          .toJson(instance.content),
      if (instance.name case final value?) 'name': value,
    };

_$ChatCompletionAssistantMessageImpl
    _$$ChatCompletionAssistantMessageImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionAssistantMessageImpl(
          role: $enumDecodeNullable(
                  _$ChatCompletionMessageRoleEnumMap, json['role']) ??
              ChatCompletionMessageRole.assistant,
          content: json['content'] as String?,
          refusal: json['refusal'] as String?,
          name: json['name'] as String?,
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => ChatCompletionMessageToolCall.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          functionCall: json['function_call'] == null
              ? null
              : ChatCompletionMessageFunctionCall.fromJson(
                  json['function_call'] as Map<String, dynamic>),
          audio: json['audio'] == null
              ? null
              : ChatCompletionAssistantMessageAudio.fromJson(
                  json['audio'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionAssistantMessageImplToJson(
        _$ChatCompletionAssistantMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      if (instance.content case final value?) 'content': value,
      if (instance.refusal case final value?) 'refusal': value,
      if (instance.name case final value?) 'name': value,
      if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
        'tool_calls': value,
      if (instance.functionCall?.toJson() case final value?)
        'function_call': value,
      if (instance.audio?.toJson() case final value?) 'audio': value,
    };

_$ChatCompletionToolMessageImpl _$$ChatCompletionToolMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionToolMessageImpl(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.tool,
      content: json['content'] as String,
      toolCallId: json['tool_call_id'] as String,
    );

Map<String, dynamic> _$$ChatCompletionToolMessageImplToJson(
        _$ChatCompletionToolMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'tool_call_id': instance.toolCallId,
    };

_$ChatCompletionFunctionMessageImpl
    _$$ChatCompletionFunctionMessageImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionFunctionMessageImpl(
          role: $enumDecodeNullable(
                  _$ChatCompletionMessageRoleEnumMap, json['role']) ??
              ChatCompletionMessageRole.function,
          content: json['content'] as String?,
          name: json['name'] as String,
        );

Map<String, dynamic> _$$ChatCompletionFunctionMessageImplToJson(
        _$ChatCompletionFunctionMessageImpl instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'name': instance.name,
    };

_$ChatCompletionMessageContentPartsImpl
    _$$ChatCompletionMessageContentPartsImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageContentPartsImpl(
          (json['value'] as List<dynamic>)
              .map((e) => ChatCompletionMessageContentPart.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionMessageContentPartsImplToJson(
        _$ChatCompletionMessageContentPartsImpl instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$ChatCompletionUserMessageContentStringImpl
    _$$ChatCompletionUserMessageContentStringImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionUserMessageContentStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionUserMessageContentStringImplToJson(
        _$ChatCompletionUserMessageContentStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionAssistantMessageAudioImpl
    _$$ChatCompletionAssistantMessageAudioImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionAssistantMessageAudioImpl(
          id: json['id'] as String,
          expiresAt: (json['expires_at'] as num).toInt(),
          data: json['data'] as String,
          transcript: json['transcript'] as String,
        );

Map<String, dynamic> _$$ChatCompletionAssistantMessageAudioImplToJson(
        _$ChatCompletionAssistantMessageAudioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expires_at': instance.expiresAt,
      'data': instance.data,
      'transcript': instance.transcript,
    };

_$ChatCompletionMessageContentPartTextImpl
    _$$ChatCompletionMessageContentPartTextImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageContentPartTextImpl(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.text,
          text: json['text'] as String,
        );

Map<String, dynamic> _$$ChatCompletionMessageContentPartTextImplToJson(
        _$ChatCompletionMessageContentPartTextImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

const _$ChatCompletionMessageContentPartTypeEnumMap = {
  ChatCompletionMessageContentPartType.text: 'text',
  ChatCompletionMessageContentPartType.imageUrl: 'image_url',
  ChatCompletionMessageContentPartType.inputAudio: 'input_audio',
  ChatCompletionMessageContentPartType.refusal: 'refusal',
};

_$ChatCompletionMessageContentPartImageImpl
    _$$ChatCompletionMessageContentPartImageImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageContentPartImageImpl(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.imageUrl,
          imageUrl: ChatCompletionMessageImageUrl.fromJson(
              json['image_url'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionMessageContentPartImageImplToJson(
        _$ChatCompletionMessageContentPartImageImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'image_url': instance.imageUrl.toJson(),
    };

_$ChatCompletionMessageContentPartAudioImpl
    _$$ChatCompletionMessageContentPartAudioImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageContentPartAudioImpl(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.inputAudio,
          inputAudio: ChatCompletionMessageInputAudio.fromJson(
              json['input_audio'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionMessageContentPartAudioImplToJson(
        _$ChatCompletionMessageContentPartAudioImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'input_audio': instance.inputAudio.toJson(),
    };

_$ChatCompletionMessageContentPartRefusalImpl
    _$$ChatCompletionMessageContentPartRefusalImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionMessageContentPartRefusalImpl(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.refusal,
          refusal: json['refusal'] as String,
        );

Map<String, dynamic> _$$ChatCompletionMessageContentPartRefusalImplToJson(
        _$ChatCompletionMessageContentPartRefusalImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'refusal': instance.refusal,
    };

_$ChatCompletionMessageImageUrlImpl
    _$$ChatCompletionMessageImageUrlImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionMessageImageUrlImpl(
          url: json['url'] as String,
          detail: $enumDecodeNullable(
                  _$ChatCompletionMessageImageDetailEnumMap, json['detail']) ??
              ChatCompletionMessageImageDetail.auto,
        );

Map<String, dynamic> _$$ChatCompletionMessageImageUrlImplToJson(
        _$ChatCompletionMessageImageUrlImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'detail': _$ChatCompletionMessageImageDetailEnumMap[instance.detail]!,
    };

const _$ChatCompletionMessageImageDetailEnumMap = {
  ChatCompletionMessageImageDetail.auto: 'auto',
  ChatCompletionMessageImageDetail.low: 'low',
  ChatCompletionMessageImageDetail.high: 'high',
};

_$ChatCompletionMessageInputAudioImpl
    _$$ChatCompletionMessageInputAudioImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionMessageInputAudioImpl(
          data: json['data'] as String,
          format: $enumDecode(
              _$ChatCompletionMessageInputAudioFormatEnumMap, json['format']),
        );

Map<String, dynamic> _$$ChatCompletionMessageInputAudioImplToJson(
        _$ChatCompletionMessageInputAudioImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'format':
          _$ChatCompletionMessageInputAudioFormatEnumMap[instance.format]!,
    };

const _$ChatCompletionMessageInputAudioFormatEnumMap = {
  ChatCompletionMessageInputAudioFormat.wav: 'wav',
  ChatCompletionMessageInputAudioFormat.mp3: 'mp3',
};

_$ResponseFormatTextImpl _$$ResponseFormatTextImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseFormatTextImpl(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.text,
    );

Map<String, dynamic> _$$ResponseFormatTextImplToJson(
        _$ResponseFormatTextImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
    };

const _$ResponseFormatTypeEnumMap = {
  ResponseFormatType.text: 'text',
  ResponseFormatType.jsonObject: 'json_object',
  ResponseFormatType.jsonSchema: 'json_schema',
};

_$ResponseFormatJsonObjectImpl _$$ResponseFormatJsonObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseFormatJsonObjectImpl(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.jsonObject,
    );

Map<String, dynamic> _$$ResponseFormatJsonObjectImplToJson(
        _$ResponseFormatJsonObjectImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
    };

_$ResponseFormatJsonSchemaImpl _$$ResponseFormatJsonSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseFormatJsonSchemaImpl(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.jsonSchema,
      jsonSchema: JsonSchemaObject.fromJson(
          json['json_schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseFormatJsonSchemaImplToJson(
        _$ResponseFormatJsonSchemaImpl instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
      'json_schema': instance.jsonSchema.toJson(),
    };

_$ModerationInputObjectImageUrlImpl
    _$$ModerationInputObjectImageUrlImplFromJson(Map<String, dynamic> json) =>
        _$ModerationInputObjectImageUrlImpl(
          type: $enumDecodeNullable(
                  _$ModerationInputObjectTypeEnumMap, json['type']) ??
              ModerationInputObjectType.imageUrl,
          imageUrl: ModerationInputObjectImageUrlImageUrl.fromJson(
              json['image_url'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ModerationInputObjectImageUrlImplToJson(
        _$ModerationInputObjectImageUrlImpl instance) =>
    <String, dynamic>{
      'type': _$ModerationInputObjectTypeEnumMap[instance.type]!,
      'image_url': instance.imageUrl.toJson(),
    };

const _$ModerationInputObjectTypeEnumMap = {
  ModerationInputObjectType.imageUrl: 'image_url',
  ModerationInputObjectType.text: 'text',
};

_$ModerationInputObjectTextImpl _$$ModerationInputObjectTextImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationInputObjectTextImpl(
      type: $enumDecodeNullable(
              _$ModerationInputObjectTypeEnumMap, json['type']) ??
          ModerationInputObjectType.text,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$ModerationInputObjectTextImplToJson(
        _$ModerationInputObjectTextImpl instance) =>
    <String, dynamic>{
      'type': _$ModerationInputObjectTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

_$ModerationInputObjectImageUrlImageUrlImpl
    _$$ModerationInputObjectImageUrlImageUrlImplFromJson(
            Map<String, dynamic> json) =>
        _$ModerationInputObjectImageUrlImageUrlImpl(
          url: json['url'] as String,
        );

Map<String, dynamic> _$$ModerationInputObjectImageUrlImageUrlImplToJson(
        _$ModerationInputObjectImageUrlImageUrlImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$AssistantToolsCodeInterpreterImpl
    _$$AssistantToolsCodeInterpreterImplFromJson(Map<String, dynamic> json) =>
        _$AssistantToolsCodeInterpreterImpl(
          type: json['type'] as String? ?? 'code_interpreter',
        );

Map<String, dynamic> _$$AssistantToolsCodeInterpreterImplToJson(
        _$AssistantToolsCodeInterpreterImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_$AssistantToolsFileSearchImpl _$$AssistantToolsFileSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantToolsFileSearchImpl(
      type: json['type'] as String,
      fileSearch: json['file_search'] == null
          ? null
          : AssistantToolsFileSearchFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssistantToolsFileSearchImplToJson(
        _$AssistantToolsFileSearchImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.fileSearch?.toJson() case final value?) 'file_search': value,
    };

_$AssistantToolsFunctionImpl _$$AssistantToolsFunctionImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantToolsFunctionImpl(
      type: json['type'] as String? ?? 'function',
      function:
          FunctionObject.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssistantToolsFunctionImplToJson(
        _$AssistantToolsFunctionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'function': instance.function.toJson(),
    };

_$AssistantToolsFileSearchFileSearchImpl
    _$$AssistantToolsFileSearchFileSearchImplFromJson(
            Map<String, dynamic> json) =>
        _$AssistantToolsFileSearchFileSearchImpl(
          maxNumResults: (json['max_num_results'] as num?)?.toInt(),
          rankingOptions: json['ranking_options'] == null
              ? null
              : FileSearchRankingOptions.fromJson(
                  json['ranking_options'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$AssistantToolsFileSearchFileSearchImplToJson(
        _$AssistantToolsFileSearchFileSearchImpl instance) =>
    <String, dynamic>{
      if (instance.maxNumResults case final value?) 'max_num_results': value,
      if (instance.rankingOptions?.toJson() case final value?)
        'ranking_options': value,
    };

_$MessageContentImageFileObjectImpl
    _$$MessageContentImageFileObjectImplFromJson(Map<String, dynamic> json) =>
        _$MessageContentImageFileObjectImpl(
          type: json['type'] as String? ?? 'image_file',
          imageFile: MessageContentImageFile.fromJson(
              json['image_file'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageContentImageFileObjectImplToJson(
        _$MessageContentImageFileObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image_file': instance.imageFile.toJson(),
    };

_$MessageContentImageUrlObjectImpl _$$MessageContentImageUrlObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentImageUrlObjectImpl(
      type: json['type'] as String? ?? 'image_url',
      imageUrl: MessageContentImageUrl.fromJson(
          json['image_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageContentImageUrlObjectImplToJson(
        _$MessageContentImageUrlObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image_url': instance.imageUrl.toJson(),
    };

_$MessageContentTextObjectImpl _$$MessageContentTextObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentTextObjectImpl(
      type: json['type'] as String? ?? 'text',
      text: MessageContentText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageContentTextObjectImplToJson(
        _$MessageContentTextObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text.toJson(),
    };

_$MessageContentRefusalObjectImpl _$$MessageContentRefusalObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentRefusalObjectImpl(
      type: json['type'] as String,
      refusal: json['refusal'] as String,
    );

Map<String, dynamic> _$$MessageContentRefusalObjectImplToJson(
        _$MessageContentRefusalObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'refusal': instance.refusal,
    };

_$MessageDeltaContentImageFileObjectImpl
    _$$MessageDeltaContentImageFileObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentImageFileObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          imageFile: json['image_file'] == null
              ? null
              : MessageContentImageFile.fromJson(
                  json['image_file'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentImageFileObjectImplToJson(
        _$MessageDeltaContentImageFileObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.imageFile?.toJson() case final value?) 'image_file': value,
    };

_$MessageDeltaContentTextObjectImpl
    _$$MessageDeltaContentTextObjectImplFromJson(Map<String, dynamic> json) =>
        _$MessageDeltaContentTextObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          text: json['text'] == null
              ? null
              : MessageDeltaContentText.fromJson(
                  json['text'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentTextObjectImplToJson(
        _$MessageDeltaContentTextObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.text?.toJson() case final value?) 'text': value,
    };

_$MessageDeltaContentRefusalObjectImpl
    _$$MessageDeltaContentRefusalObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentRefusalObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          refusal: json['refusal'] as String?,
        );

Map<String, dynamic> _$$MessageDeltaContentRefusalObjectImplToJson(
        _$MessageDeltaContentRefusalObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.refusal case final value?) 'refusal': value,
    };

_$MessageDeltaContentImageUrlObjectImpl
    _$$MessageDeltaContentImageUrlObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentImageUrlObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          imageUrl: json['image_url'] == null
              ? null
              : MessageContentImageUrl.fromJson(
                  json['image_url'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentImageUrlObjectImplToJson(
        _$MessageDeltaContentImageUrlObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.imageUrl?.toJson() case final value?) 'image_url': value,
    };

_$MessageContentTextAnnotationsFileCitationObjectImpl
    _$$MessageContentTextAnnotationsFileCitationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFileCitationObjectImpl(
          type: json['type'] as String,
          text: json['text'] as String,
          fileCitation: MessageContentTextAnnotationsFileCitation.fromJson(
              json['file_citation'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num).toInt(),
          endIndex: (json['end_index'] as num).toInt(),
        );

Map<String, dynamic>
    _$$MessageContentTextAnnotationsFileCitationObjectImplToJson(
            _$MessageContentTextAnnotationsFileCitationObjectImpl instance) =>
        <String, dynamic>{
          'type': instance.type,
          'text': instance.text,
          'file_citation': instance.fileCitation.toJson(),
          'start_index': instance.startIndex,
          'end_index': instance.endIndex,
        };

_$MessageContentTextAnnotationsFilePathObjectImpl
    _$$MessageContentTextAnnotationsFilePathObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFilePathObjectImpl(
          type: json['type'] as String,
          text: json['text'] as String,
          filePath: MessageContentTextAnnotationsFilePath.fromJson(
              json['file_path'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num).toInt(),
          endIndex: (json['end_index'] as num).toInt(),
        );

Map<String, dynamic> _$$MessageContentTextAnnotationsFilePathObjectImplToJson(
        _$MessageContentTextAnnotationsFilePathObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'file_path': instance.filePath.toJson(),
      'start_index': instance.startIndex,
      'end_index': instance.endIndex,
    };

_$MessageContentTextAnnotationsFilePathImpl
    _$$MessageContentTextAnnotationsFilePathImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFilePathImpl(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$$MessageContentTextAnnotationsFilePathImplToJson(
        _$MessageContentTextAnnotationsFilePathImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$MessageDeltaContentTextAnnotationsFileCitationObjectImpl
    _$$MessageDeltaContentTextAnnotationsFileCitationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFileCitationObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          text: json['text'] as String?,
          fileCitation: json['file_citation'] == null
              ? null
              : MessageDeltaContentTextAnnotationsFileCitation.fromJson(
                  json['file_citation'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num?)?.toInt(),
          endIndex: (json['end_index'] as num?)?.toInt(),
        );

Map<String,
    dynamic> _$$MessageDeltaContentTextAnnotationsFileCitationObjectImplToJson(
        _$MessageDeltaContentTextAnnotationsFileCitationObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.text case final value?) 'text': value,
      if (instance.fileCitation?.toJson() case final value?)
        'file_citation': value,
      if (instance.startIndex case final value?) 'start_index': value,
      if (instance.endIndex case final value?) 'end_index': value,
    };

_$MessageDeltaContentTextAnnotationsFilePathObjectImpl
    _$$MessageDeltaContentTextAnnotationsFilePathObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFilePathObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          text: json['text'] as String?,
          filePath: json['file_path'] == null
              ? null
              : MessageDeltaContentTextAnnotationsFilePathObjectFilePath
                  .fromJson(json['file_path'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num?)?.toInt(),
          endIndex: (json['end_index'] as num?)?.toInt(),
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFilePathObjectImplToJson(
            _$MessageDeltaContentTextAnnotationsFilePathObjectImpl instance) =>
        <String, dynamic>{
          'index': instance.index,
          'type': instance.type,
          if (instance.text case final value?) 'text': value,
          if (instance.filePath?.toJson() case final value?) 'file_path': value,
          if (instance.startIndex case final value?) 'start_index': value,
          if (instance.endIndex case final value?) 'end_index': value,
        };

_$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl
    _$$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl(
          fileId: json['file_id'] as String?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImplToJson(
            _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl
                instance) =>
        <String, dynamic>{
          if (instance.fileId case final value?) 'file_id': value,
        };

_$RunStepDetailsMessageCreationObjectImpl
    _$$RunStepDetailsMessageCreationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsMessageCreationObjectImpl(
          type: json['type'] as String,
          messageCreation: RunStepDetailsMessageCreation.fromJson(
              json['message_creation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsMessageCreationObjectImplToJson(
        _$RunStepDetailsMessageCreationObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'message_creation': instance.messageCreation.toJson(),
    };

_$RunStepDetailsToolCallsObjectImpl
    _$$RunStepDetailsToolCallsObjectImplFromJson(Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsObjectImpl(
          type: json['type'] as String,
          toolCalls: (json['tool_calls'] as List<dynamic>)
              .map((e) =>
                  RunStepDetailsToolCalls.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsObjectImplToJson(
        _$RunStepDetailsToolCallsObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tool_calls': instance.toolCalls.map((e) => e.toJson()).toList(),
    };

_$RunStepDeltaStepDetailsMessageCreationObjectImpl
    _$$RunStepDeltaStepDetailsMessageCreationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsMessageCreationObjectImpl(
          type: json['type'] as String,
          messageCreation: json['message_creation'] == null
              ? null
              : RunStepDeltaStepDetailsMessageCreation.fromJson(
                  json['message_creation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsMessageCreationObjectImplToJson(
        _$RunStepDeltaStepDetailsMessageCreationObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.messageCreation?.toJson() case final value?)
        'message_creation': value,
    };

_$RunStepDeltaStepDetailsToolCallsObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsObjectImpl(
          type: json['type'] as String,
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => RunStepDeltaStepDetailsToolCalls.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsToolCallsObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
        'tool_calls': value,
    };

_$RunStepDetailsToolCallsCodeObjectImpl
    _$$RunStepDetailsToolCallsCodeObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeObjectImpl(
          id: json['id'] as String,
          type: json['type'] as String,
          codeInterpreter:
              RunStepDetailsToolCallsCodeObjectCodeInterpreter.fromJson(
                  json['code_interpreter'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeObjectImplToJson(
        _$RunStepDetailsToolCallsCodeObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code_interpreter': instance.codeInterpreter.toJson(),
    };

_$RunStepDetailsToolCallsFileSearchObjectImpl
    _$$RunStepDetailsToolCallsFileSearchObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFileSearchObjectImpl(
          id: json['id'] as String,
          type: json['type'] as String,
          fileSearch: RunStepDetailsToolCallsFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFileSearchObjectImplToJson(
        _$RunStepDetailsToolCallsFileSearchObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'file_search': instance.fileSearch.toJson(),
    };

_$RunStepDetailsToolCallsFunctionObjectImpl
    _$$RunStepDetailsToolCallsFunctionObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFunctionObjectImpl(
          id: json['id'] as String,
          type: json['type'] as String,
          function: RunStepDetailsToolCallsFunction.fromJson(
              json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFunctionObjectImplToJson(
        _$RunStepDetailsToolCallsFunctionObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function.toJson(),
    };

_$RunStepDetailsToolCallsFunctionImpl
    _$$RunStepDetailsToolCallsFunctionImplFromJson(Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFunctionImpl(
          name: json['name'] as String,
          arguments: json['arguments'] as String,
          output: json['output'] as String?,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFunctionImplToJson(
        _$RunStepDetailsToolCallsFunctionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
      'output': instance.output,
    };

_$RunStepDeltaStepDetailsToolCallsCodeObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeObjectImpl(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          codeInterpreter: json['code_interpreter'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter
                  .fromJson(json['code_interpreter'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsToolCallsCodeObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsCodeObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      if (instance.id case final value?) 'id': value,
      'type': instance.type,
      if (instance.codeInterpreter?.toJson() case final value?)
        'code_interpreter': value,
    };

_$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsFileSearchObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          fileSearch: json['file_search'] as Map<String, dynamic>,
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsFileSearchObjectImplToJson(
            _$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl instance) =>
        <String, dynamic>{
          'index': instance.index,
          if (instance.id case final value?) 'id': value,
          'type': instance.type,
          'file_search': instance.fileSearch,
        };

_$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsFunctionObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          function: json['function'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsFunction.fromJson(
                  json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsFunctionObjectImplToJson(
            _$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl instance) =>
        <String, dynamic>{
          'index': instance.index,
          if (instance.id case final value?) 'id': value,
          'type': instance.type,
          if (instance.function?.toJson() case final value?) 'function': value,
        };

_$RunStepDeltaStepDetailsToolCallsFunctionImpl
    _$$RunStepDeltaStepDetailsToolCallsFunctionImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFunctionImpl(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
          output: json['output'] as String?,
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsToolCallsFunctionImplToJson(
        _$RunStepDeltaStepDetailsToolCallsFunctionImpl instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.arguments case final value?) 'arguments': value,
      if (instance.output case final value?) 'output': value,
    };

_$RunStepDetailsToolCallsCodeOutputLogsObjectImpl
    _$$RunStepDetailsToolCallsCodeOutputLogsObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeOutputLogsObjectImpl(
          type: json['type'] as String,
          logs: json['logs'] as String,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeOutputLogsObjectImplToJson(
        _$RunStepDetailsToolCallsCodeOutputLogsObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'logs': instance.logs,
    };

_$RunStepDetailsToolCallsCodeOutputImageObjectImpl
    _$$RunStepDetailsToolCallsCodeOutputImageObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeOutputImageObjectImpl(
          type: json['type'] as String,
          image: RunStepDetailsToolCallsCodeOutputImage.fromJson(
              json['image'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeOutputImageObjectImplToJson(
        _$RunStepDetailsToolCallsCodeOutputImageObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image': instance.image.toJson(),
    };

_$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          logs: json['logs'] as String?,
        );

Map<String,
    dynamic> _$$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.logs case final value?) 'logs': value,
    };

_$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          image: json['image'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeOutputImage.fromJson(
                  json['image'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.image?.toJson() case final value?) 'image': value,
    };

_$AutoChunkingStrategyRequestParamImpl
    _$$AutoChunkingStrategyRequestParamImplFromJson(
            Map<String, dynamic> json) =>
        _$AutoChunkingStrategyRequestParamImpl(
          type: json['type'] as String,
        );

Map<String, dynamic> _$$AutoChunkingStrategyRequestParamImplToJson(
        _$AutoChunkingStrategyRequestParamImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_$StaticChunkingStrategyRequestParamImpl
    _$$StaticChunkingStrategyRequestParamImplFromJson(
            Map<String, dynamic> json) =>
        _$StaticChunkingStrategyRequestParamImpl(
          type: json['type'] as String,
          static: StaticChunkingStrategy.fromJson(
              json['static'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$StaticChunkingStrategyRequestParamImplToJson(
        _$StaticChunkingStrategyRequestParamImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'static': instance.static.toJson(),
    };

_$StaticChunkingStrategyResponseParamImpl
    _$$StaticChunkingStrategyResponseParamImplFromJson(
            Map<String, dynamic> json) =>
        _$StaticChunkingStrategyResponseParamImpl(
          type: json['type'] as String,
          static: StaticChunkingStrategy.fromJson(
              json['static'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$StaticChunkingStrategyResponseParamImplToJson(
        _$StaticChunkingStrategyResponseParamImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'static': instance.static.toJson(),
    };

_$OtherChunkingStrategyResponseParamImpl
    _$$OtherChunkingStrategyResponseParamImplFromJson(
            Map<String, dynamic> json) =>
        _$OtherChunkingStrategyResponseParamImpl(
          type: json['type'] as String,
        );

Map<String, dynamic> _$$OtherChunkingStrategyResponseParamImplToJson(
        _$OtherChunkingStrategyResponseParamImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

_$ThreadStreamEventImpl _$$ThreadStreamEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ThreadStreamEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: ThreadObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ThreadStreamEventImplToJson(
        _$ThreadStreamEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

const _$EventTypeEnumMap = {
  EventType.threadCreated: 'thread.created',
  EventType.threadRunCreated: 'thread.run.created',
  EventType.threadRunQueued: 'thread.run.queued',
  EventType.threadRunInProgress: 'thread.run.in_progress',
  EventType.threadRunRequiresAction: 'thread.run.requires_action',
  EventType.threadRunCompleted: 'thread.run.completed',
  EventType.threadRunFailed: 'thread.run.failed',
  EventType.threadRunCancelling: 'thread.run.cancelling',
  EventType.threadRunCancelled: 'thread.run.cancelled',
  EventType.threadRunExpired: 'thread.run.expired',
  EventType.threadRunStepCreated: 'thread.run.step.created',
  EventType.threadRunStepInProgress: 'thread.run.step.in_progress',
  EventType.threadRunStepDelta: 'thread.run.step.delta',
  EventType.threadRunStepCompleted: 'thread.run.step.completed',
  EventType.threadRunStepFailed: 'thread.run.step.failed',
  EventType.threadRunStepCancelled: 'thread.run.step.cancelled',
  EventType.threadRunStepExpired: 'thread.run.step.expired',
  EventType.threadMessageCreated: 'thread.message.created',
  EventType.threadMessageInProgress: 'thread.message.in_progress',
  EventType.threadMessageDelta: 'thread.message.delta',
  EventType.threadMessageCompleted: 'thread.message.completed',
  EventType.threadMessageFailed: 'thread.message.failed',
  EventType.error: 'error',
  EventType.done: 'done',
};

_$RunStreamEventImpl _$$RunStreamEventImplFromJson(Map<String, dynamic> json) =>
    _$RunStreamEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStreamEventImplToJson(
        _$RunStreamEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$RunStepStreamEventImpl _$$RunStepStreamEventImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepStreamEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunStepObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStepStreamEventImplToJson(
        _$RunStepStreamEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$RunStepStreamDeltaEventImpl _$$RunStepStreamDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepStreamDeltaEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunStepDeltaObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RunStepStreamDeltaEventImplToJson(
        _$RunStepStreamDeltaEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$MessageStreamEventImpl _$$MessageStreamEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStreamEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: MessageObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageStreamEventImplToJson(
        _$MessageStreamEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$MessageStreamDeltaEventImpl _$$MessageStreamDeltaEventImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageStreamDeltaEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: MessageDeltaObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageStreamDeltaEventImplToJson(
        _$MessageStreamDeltaEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$ErrorEventImpl _$$ErrorEventImplFromJson(Map<String, dynamic> json) =>
    _$ErrorEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: Error.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ErrorEventImplToJson(_$ErrorEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

_$DoneEventImpl _$$DoneEventImplFromJson(Map<String, dynamic> json) =>
    _$DoneEventImpl(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: json['data'] as String,
    );

Map<String, dynamic> _$$DoneEventImplToJson(_$DoneEventImpl instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data,
    };
