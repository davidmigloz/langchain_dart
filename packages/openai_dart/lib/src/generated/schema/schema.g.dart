// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCompletionRequest _$CreateCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateCompletionRequest(
      model: const _CompletionModelConverter().fromJson(json['model']),
      prompt: const _CompletionPromptConverter().fromJson(json['prompt']),
      bestOf: (json['best_of'] as num?)?.toInt(),
      echo: json['echo'] as bool? ?? false,
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble(),
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      logprobs: (json['logprobs'] as num?)?.toInt(),
      maxTokens: (json['max_tokens'] as num?)?.toInt() ?? 16,
      n: (json['n'] as num?)?.toInt(),
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble(),
      seed: (json['seed'] as num?)?.toInt(),
      stop: const _CompletionStopConverter().fromJson(json['stop']),
      stream: json['stream'] as bool? ?? false,
      streamOptions: json['stream_options'] == null
          ? null
          : ChatCompletionStreamOptions.fromJson(
              json['stream_options'] as Map<String, dynamic>),
      suffix: json['suffix'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['top_p'] as num?)?.toDouble(),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$CreateCompletionRequestToJson(
        _CreateCompletionRequest instance) =>
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

CompletionModelEnumeration _$CompletionModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    CompletionModelEnumeration(
      $enumDecode(_$CompletionModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionModelEnumerationToJson(
        CompletionModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$CompletionModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CompletionModelsEnumMap = {
  CompletionModels.gpt35TurboInstruct: 'gpt-3.5-turbo-instruct',
  CompletionModels.davinci002: 'davinci-002',
  CompletionModels.babbage002: 'babbage-002',
};

CompletionModelString _$CompletionModelStringFromJson(
        Map<String, dynamic> json) =>
    CompletionModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionModelStringToJson(
        CompletionModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionPromptListListInt _$CompletionPromptListListIntFromJson(
        Map<String, dynamic> json) =>
    CompletionPromptListListInt(
      (json['value'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionPromptListListIntToJson(
        CompletionPromptListListInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionPromptListInt _$CompletionPromptListIntFromJson(
        Map<String, dynamic> json) =>
    CompletionPromptListInt(
      (json['value'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionPromptListIntToJson(
        CompletionPromptListInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionPromptListString _$CompletionPromptListStringFromJson(
        Map<String, dynamic> json) =>
    CompletionPromptListString(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionPromptListStringToJson(
        CompletionPromptListString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionPromptString _$CompletionPromptStringFromJson(
        Map<String, dynamic> json) =>
    CompletionPromptString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionPromptStringToJson(
        CompletionPromptString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionStopListString _$CompletionStopListStringFromJson(
        Map<String, dynamic> json) =>
    CompletionStopListString(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionStopListStringToJson(
        CompletionStopListString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CompletionStopString _$CompletionStopStringFromJson(
        Map<String, dynamic> json) =>
    CompletionStopString(
      json['value'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CompletionStopStringToJson(
        CompletionStopString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_CreateCompletionResponse _$CreateCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    _CreateCompletionResponse(
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

Map<String, dynamic> _$CreateCompletionResponseToJson(
        _CreateCompletionResponse instance) =>
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

_CompletionChoice _$CompletionChoiceFromJson(Map<String, dynamic> json) =>
    _CompletionChoice(
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

Map<String, dynamic> _$CompletionChoiceToJson(_CompletionChoice instance) =>
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

_CompletionLogprobs _$CompletionLogprobsFromJson(Map<String, dynamic> json) =>
    _CompletionLogprobs(
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

Map<String, dynamic> _$CompletionLogprobsToJson(_CompletionLogprobs instance) =>
    <String, dynamic>{
      if (instance.textOffset case final value?) 'text_offset': value,
      if (instance.tokenLogprobs case final value?) 'token_logprobs': value,
      if (instance.tokens case final value?) 'tokens': value,
      if (instance.topLogprobs case final value?) 'top_logprobs': value,
    };

_CreateChatCompletionRequest _$CreateChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateChatCompletionRequest(
      model: const _ChatCompletionModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      store: json['store'] as bool?,
      reasoningEffort: $enumDecodeNullable(
          _$ReasoningEffortEnumMap, json['reasoning_effort'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble(),
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      logprobs: json['logprobs'] as bool?,
      topLogprobs: (json['top_logprobs'] as num?)?.toInt(),
      maxTokens: (json['max_tokens'] as num?)?.toInt(),
      maxCompletionTokens: (json['max_completion_tokens'] as num?)?.toInt(),
      n: (json['n'] as num?)?.toInt(),
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
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble(),
      webSearchOptions: json['web_search_options'] == null
          ? null
          : WebSearchOptions.fromJson(
              json['web_search_options'] as Map<String, dynamic>),
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
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['top_p'] as num?)?.toDouble(),
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
      verbosity: $enumDecodeNullable(_$VerbosityEnumMap, json['verbosity'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$CreateChatCompletionRequestToJson(
        _CreateChatCompletionRequest instance) =>
    <String, dynamic>{
      'model': const _ChatCompletionModelConverter().toJson(instance.model),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      if (instance.store case final value?) 'store': value,
      if (_$ReasoningEffortEnumMap[instance.reasoningEffort] case final value?)
        'reasoning_effort': value,
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
      if (instance.webSearchOptions?.toJson() case final value?)
        'web_search_options': value,
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
      if (_$VerbosityEnumMap[instance.verbosity] case final value?)
        'verbosity': value,
    };

const _$ReasoningEffortEnumMap = {
  ReasoningEffort.minimal: 'minimal',
  ReasoningEffort.low: 'low',
  ReasoningEffort.medium: 'medium',
  ReasoningEffort.high: 'high',
};

const _$ChatCompletionModalityEnumMap = {
  ChatCompletionModality.text: 'text',
  ChatCompletionModality.audio: 'audio',
};

const _$CreateChatCompletionRequestServiceTierEnumMap = {
  CreateChatCompletionRequestServiceTier.auto: 'auto',
  CreateChatCompletionRequestServiceTier.vDefault: 'default',
  CreateChatCompletionRequestServiceTier.flex: 'flex',
};

const _$VerbosityEnumMap = {
  Verbosity.low: 'low',
  Verbosity.medium: 'medium',
  Verbosity.high: 'high',
};

ChatCompletionModelEnumeration _$ChatCompletionModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionModelEnumeration(
      $enumDecode(_$ChatCompletionModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionModelEnumerationToJson(
        ChatCompletionModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionModelsEnumMap = {
  ChatCompletionModels.gpt5: 'gpt-5',
  ChatCompletionModels.gpt5Mini: 'gpt-5-mini',
  ChatCompletionModels.gpt5Nano: 'gpt-5-nano',
  ChatCompletionModels.gpt520250807: 'gpt-5-2025-08-07',
  ChatCompletionModels.gpt5Mini20250807: 'gpt-5-mini-2025-08-07',
  ChatCompletionModels.gpt5Nano20250807: 'gpt-5-nano-2025-08-07',
  ChatCompletionModels.gpt5ChatLatest: 'gpt-5-chat-latest',
  ChatCompletionModels.gpt41: 'gpt-4.1',
  ChatCompletionModels.gpt41Mini: 'gpt-4.1-mini',
  ChatCompletionModels.gpt41Nano: 'gpt-4.1-nano',
  ChatCompletionModels.gpt4120250414: 'gpt-4.1-2025-04-14',
  ChatCompletionModels.gpt41Mini20250414: 'gpt-4.1-mini-2025-04-14',
  ChatCompletionModels.gpt41Nano20250414: 'gpt-4.1-nano-2025-04-14',
  ChatCompletionModels.o4Mini: 'o4-mini',
  ChatCompletionModels.o4Mini20250416: 'o4-mini-2025-04-16',
  ChatCompletionModels.o3: 'o3',
  ChatCompletionModels.o320250416: 'o3-2025-04-16',
  ChatCompletionModels.o3Mini: 'o3-mini',
  ChatCompletionModels.o3Mini20250131: 'o3-mini-2025-01-31',
  ChatCompletionModels.o1: 'o1',
  ChatCompletionModels.o120241217: 'o1-2024-12-17',
  ChatCompletionModels.o1Preview: 'o1-preview',
  ChatCompletionModels.o1Preview20240912: 'o1-preview-2024-09-12',
  ChatCompletionModels.o1Mini: 'o1-mini',
  ChatCompletionModels.o1Mini20240912: 'o1-mini-2024-09-12',
  ChatCompletionModels.gpt4o: 'gpt-4o',
  ChatCompletionModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  ChatCompletionModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  ChatCompletionModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  ChatCompletionModels.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  ChatCompletionModels.gpt4oAudioPreview20241001:
      'gpt-4o-audio-preview-2024-10-01',
  ChatCompletionModels.gpt4oAudioPreview20241217:
      'gpt-4o-audio-preview-2024-12-17',
  ChatCompletionModels.gpt4oAudioPreview20250603:
      'gpt-4o-audio-preview-2025-06-03',
  ChatCompletionModels.gpt4oMiniAudioPreview: 'gpt-4o-mini-audio-preview',
  ChatCompletionModels.gpt4oMiniAudioPreview20241217:
      'gpt-4o-mini-audio-preview-2024-12-17',
  ChatCompletionModels.gpt4oSearchPreview: 'gpt-4o-search-preview',
  ChatCompletionModels.gpt4oMiniSearchPreview: 'gpt-4o-mini-search-preview',
  ChatCompletionModels.gpt4oSearchPreview20250311:
      'gpt-4o-search-preview-2025-03-11',
  ChatCompletionModels.gpt4oMiniSearchPreview20250311:
      'gpt-4o-mini-search-preview-2025-03-11',
  ChatCompletionModels.chatgpt4oLatest: 'chatgpt-4o-latest',
  ChatCompletionModels.codexMiniLatest: 'codex-mini-latest',
  ChatCompletionModels.gpt4oMini: 'gpt-4o-mini',
  ChatCompletionModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  ChatCompletionModels.gpt45Preview: 'gpt-4.5-preview',
  ChatCompletionModels.gpt45Preview20250227: 'gpt-4.5-preview-2025-02-27',
  ChatCompletionModels.gpt4Turbo: 'gpt-4-turbo',
  ChatCompletionModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  ChatCompletionModels.gpt40125Preview: 'gpt-4-0125-preview',
  ChatCompletionModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  ChatCompletionModels.gpt41106Preview: 'gpt-4-1106-preview',
  ChatCompletionModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ChatCompletionModels.gpt4: 'gpt-4',
  ChatCompletionModels.gpt40314: 'gpt-4-0314',
  ChatCompletionModels.gpt40613: 'gpt-4-0613',
  ChatCompletionModels.gpt432k: 'gpt-4-32k',
  ChatCompletionModels.gpt432k0314: 'gpt-4-32k-0314',
  ChatCompletionModels.gpt432k0613: 'gpt-4-32k-0613',
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ChatCompletionModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  ChatCompletionModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ChatCompletionModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
};

ChatCompletionModelString _$ChatCompletionModelStringFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionModelStringToJson(
        ChatCompletionModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ChatCompletionStopListString _$ChatCompletionStopListStringFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionStopListString(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionStopListStringToJson(
        ChatCompletionStopListString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ChatCompletionStopString _$ChatCompletionStopStringFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionStopString(
      json['value'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionStopStringToJson(
        ChatCompletionStopString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ChatCompletionToolChoiceOptionEnumeration
    _$ChatCompletionToolChoiceOptionEnumerationFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionToolChoiceOptionEnumeration(
          $enumDecode(_$ChatCompletionToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ChatCompletionToolChoiceOptionEnumerationToJson(
        ChatCompletionToolChoiceOptionEnumeration instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionToolChoiceModeEnumMap = {
  ChatCompletionToolChoiceMode.none: 'none',
  ChatCompletionToolChoiceMode.auto: 'auto',
  ChatCompletionToolChoiceMode.required: 'required',
};

ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice
    _$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice(
          ChatCompletionNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$ChatCompletionToolChoiceOptionChatCompletionNamedToolChoiceToJson(
            ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

ChatCompletionFunctionCallEnumeration
    _$ChatCompletionFunctionCallEnumerationFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionFunctionCallEnumeration(
          $enumDecode(_$ChatCompletionFunctionCallModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ChatCompletionFunctionCallEnumerationToJson(
        ChatCompletionFunctionCallEnumeration instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionFunctionCallModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionFunctionCallModeEnumMap = {
  ChatCompletionFunctionCallMode.none: 'none',
  ChatCompletionFunctionCallMode.auto: 'auto',
};

ChatCompletionFunctionCallChatCompletionFunctionCallOption
    _$ChatCompletionFunctionCallChatCompletionFunctionCallOptionFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionFunctionCallChatCompletionFunctionCallOption(
          ChatCompletionFunctionCallOption.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$ChatCompletionFunctionCallChatCompletionFunctionCallOptionToJson(
        ChatCompletionFunctionCallChatCompletionFunctionCallOption instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_ChatCompletionMessageFunctionCall _$ChatCompletionMessageFunctionCallFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionMessageFunctionCall(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$ChatCompletionMessageFunctionCallToJson(
        _ChatCompletionMessageFunctionCall instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

_ChatCompletionFunctionCallOption _$ChatCompletionFunctionCallOptionFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionFunctionCallOption(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ChatCompletionFunctionCallOptionToJson(
        _ChatCompletionFunctionCallOption instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_FunctionObject _$FunctionObjectFromJson(Map<String, dynamic> json) =>
    _FunctionObject(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>?,
      strict: json['strict'] as bool? ?? false,
    );

Map<String, dynamic> _$FunctionObjectToJson(_FunctionObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      if (instance.parameters case final value?) 'parameters': value,
      if (instance.strict case final value?) 'strict': value,
    };

_JsonSchemaObject _$JsonSchemaObjectFromJson(Map<String, dynamic> json) =>
    _JsonSchemaObject(
      name: json['name'] as String,
      description: json['description'] as String?,
      schema: json['schema'] as Map<String, dynamic>,
      strict: json['strict'] as bool? ?? false,
    );

Map<String, dynamic> _$JsonSchemaObjectToJson(_JsonSchemaObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'schema': instance.schema,
      if (instance.strict case final value?) 'strict': value,
    };

_ChatCompletionTool _$ChatCompletionToolFromJson(Map<String, dynamic> json) =>
    _ChatCompletionTool(
      type: $enumDecode(_$ChatCompletionToolTypeEnumMap, json['type']),
      function:
          FunctionObject.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionToolToJson(_ChatCompletionTool instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionToolTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionToolTypeEnumMap = {
  ChatCompletionToolType.function: 'function',
};

_ChatCompletionNamedToolChoice _$ChatCompletionNamedToolChoiceFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionNamedToolChoice(
      type:
          $enumDecode(_$ChatCompletionNamedToolChoiceTypeEnumMap, json['type']),
      function: ChatCompletionFunctionCallOption.fromJson(
          json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionNamedToolChoiceToJson(
        _ChatCompletionNamedToolChoice instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionNamedToolChoiceTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionNamedToolChoiceTypeEnumMap = {
  ChatCompletionNamedToolChoiceType.function: 'function',
};

_ChatCompletionMessageToolCall _$ChatCompletionMessageToolCallFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionMessageToolCall(
      id: json['id'] as String,
      type:
          $enumDecode(_$ChatCompletionMessageToolCallTypeEnumMap, json['type']),
      function: ChatCompletionMessageFunctionCall.fromJson(
          json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatCompletionMessageToolCallToJson(
        _ChatCompletionMessageToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ChatCompletionMessageToolCallTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$ChatCompletionMessageToolCallTypeEnumMap = {
  ChatCompletionMessageToolCallType.function: 'function',
};

_Annotation _$AnnotationFromJson(Map<String, dynamic> json) => _Annotation(
      type: $enumDecode(_$AnnotationTypeEnumMap, json['type']),
      urlCitation: AnnotationUrlCitation.fromJson(
          json['url_citation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnotationToJson(_Annotation instance) =>
    <String, dynamic>{
      'type': _$AnnotationTypeEnumMap[instance.type]!,
      'url_citation': instance.urlCitation.toJson(),
    };

const _$AnnotationTypeEnumMap = {
  AnnotationType.urlCitation: 'url_citation',
};

_AnnotationUrlCitation _$AnnotationUrlCitationFromJson(
        Map<String, dynamic> json) =>
    _AnnotationUrlCitation(
      endIndex: (json['end_index'] as num?)?.toInt(),
      startIndex: (json['start_index'] as num?)?.toInt(),
      url: json['url'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$AnnotationUrlCitationToJson(
        _AnnotationUrlCitation instance) =>
    <String, dynamic>{
      if (instance.endIndex case final value?) 'end_index': value,
      if (instance.startIndex case final value?) 'start_index': value,
      if (instance.url case final value?) 'url': value,
      if (instance.title case final value?) 'title': value,
    };

_PredictionContent _$PredictionContentFromJson(Map<String, dynamic> json) =>
    _PredictionContent(
      type: json['type'] as String? ?? 'content',
      content:
          const _PredictionContentContentConverter().fromJson(json['content']),
    );

Map<String, dynamic> _$PredictionContentToJson(_PredictionContent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content':
          const _PredictionContentContentConverter().toJson(instance.content),
    };

PredictionContentContentListChatCompletionMessageContentPartText
    _$PredictionContentContentListChatCompletionMessageContentPartTextFromJson(
            Map<String, dynamic> json) =>
        PredictionContentContentListChatCompletionMessageContentPartText(
          (json['value'] as List<dynamic>)
              .map((e) => ChatCompletionMessageContentPartText.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$PredictionContentContentListChatCompletionMessageContentPartTextToJson(
            PredictionContentContentListChatCompletionMessageContentPartText
                instance) =>
        <String, dynamic>{
          'value': instance.value.map((e) => e.toJson()).toList(),
          'runtimeType': instance.$type,
        };

PredictionContentContentString _$PredictionContentContentStringFromJson(
        Map<String, dynamic> json) =>
    PredictionContentContentString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PredictionContentContentStringToJson(
        PredictionContentContentString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ChatCompletionAudioOptions _$ChatCompletionAudioOptionsFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionAudioOptions(
      voice: $enumDecode(_$ChatCompletionAudioVoiceEnumMap, json['voice']),
      format: $enumDecode(_$ChatCompletionAudioFormatEnumMap, json['format']),
    );

Map<String, dynamic> _$ChatCompletionAudioOptionsToJson(
        _ChatCompletionAudioOptions instance) =>
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

_ChatCompletionStreamOptions _$ChatCompletionStreamOptionsFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionStreamOptions(
      includeUsage: json['include_usage'] as bool?,
    );

Map<String, dynamic> _$ChatCompletionStreamOptionsToJson(
        _ChatCompletionStreamOptions instance) =>
    <String, dynamic>{
      if (instance.includeUsage case final value?) 'include_usage': value,
    };

_CreateChatCompletionResponse _$CreateChatCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    _CreateChatCompletionResponse(
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

Map<String, dynamic> _$CreateChatCompletionResponseToJson(
        _CreateChatCompletionResponse instance) =>
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
  ServiceTier.auto: 'auto',
  ServiceTier.vDefault: 'default',
  ServiceTier.flex: 'flex',
};

_ChatCompletionResponseChoice _$ChatCompletionResponseChoiceFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionResponseChoice(
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

Map<String, dynamic> _$ChatCompletionResponseChoiceToJson(
        _ChatCompletionResponseChoice instance) =>
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

_ChatCompletionLogprobs _$ChatCompletionLogprobsFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionLogprobs(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionTokenLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
      refusal: (json['refusal'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionTokenLogprob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionLogprobsToJson(
        _ChatCompletionLogprobs instance) =>
    <String, dynamic>{
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
      if (instance.refusal?.map((e) => e.toJson()).toList() case final value?)
        'refusal': value,
    };

_ChatCompletionTokenLogprob _$ChatCompletionTokenLogprobFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionTokenLogprob(
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

Map<String, dynamic> _$ChatCompletionTokenLogprobToJson(
        _ChatCompletionTokenLogprob instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
      'top_logprobs': instance.topLogprobs.map((e) => e.toJson()).toList(),
    };

_ChatCompletionTokenTopLogprob _$ChatCompletionTokenTopLogprobFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionTokenTopLogprob(
      token: json['token'] as String,
      logprob: (json['logprob'] as num).toDouble(),
      bytes: (json['bytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ChatCompletionTokenTopLogprobToJson(
        _ChatCompletionTokenTopLogprob instance) =>
    <String, dynamic>{
      'token': instance.token,
      'logprob': instance.logprob,
      'bytes': instance.bytes,
    };

_CreateChatCompletionStreamResponse
    _$CreateChatCompletionStreamResponseFromJson(Map<String, dynamic> json) =>
        _CreateChatCompletionStreamResponse(
          id: json['id'] as String?,
          choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => ChatCompletionStreamResponseChoice.fromJson(
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

Map<String, dynamic> _$CreateChatCompletionStreamResponseToJson(
        _CreateChatCompletionStreamResponse instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.choices?.map((e) => e.toJson()).toList() case final value?)
        'choices': value,
      if (instance.created case final value?) 'created': value,
      if (instance.model case final value?) 'model': value,
      if (_$ServiceTierEnumMap[instance.serviceTier] case final value?)
        'service_tier': value,
      if (instance.systemFingerprint case final value?)
        'system_fingerprint': value,
      if (instance.object case final value?) 'object': value,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

_ChatCompletionStreamResponseChoice
    _$ChatCompletionStreamResponseChoiceFromJson(Map<String, dynamic> json) =>
        _ChatCompletionStreamResponseChoice(
          delta: json['delta'] == null
              ? null
              : ChatCompletionStreamResponseDelta.fromJson(
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

Map<String, dynamic> _$ChatCompletionStreamResponseChoiceToJson(
        _ChatCompletionStreamResponseChoice instance) =>
    <String, dynamic>{
      if (instance.delta?.toJson() case final value?) 'delta': value,
      if (instance.logprobs?.toJson() case final value?) 'logprobs': value,
      if (_$ChatCompletionFinishReasonEnumMap[instance.finishReason]
          case final value?)
        'finish_reason': value,
      if (instance.index case final value?) 'index': value,
    };

_ChatCompletionStreamResponseChoiceLogprobs
    _$ChatCompletionStreamResponseChoiceLogprobsFromJson(
            Map<String, dynamic> json) =>
        _ChatCompletionStreamResponseChoiceLogprobs(
          content: (json['content'] as List<dynamic>?)
              ?.map((e) => ChatCompletionTokenLogprob.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          refusal: (json['refusal'] as List<dynamic>?)
              ?.map((e) => ChatCompletionTokenLogprob.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$ChatCompletionStreamResponseChoiceLogprobsToJson(
        _ChatCompletionStreamResponseChoiceLogprobs instance) =>
    <String, dynamic>{
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
      if (instance.refusal?.map((e) => e.toJson()).toList() case final value?)
        'refusal': value,
    };

_ChatCompletionStreamResponseDelta _$ChatCompletionStreamResponseDeltaFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionStreamResponseDelta(
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

Map<String, dynamic> _$ChatCompletionStreamResponseDeltaToJson(
        _ChatCompletionStreamResponseDelta instance) =>
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
  ChatCompletionMessageRole.developer: 'developer',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
  ChatCompletionMessageRole.tool: 'tool',
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.function: 'function',
};

_ChatCompletionStreamResponseDeltaAudio
    _$ChatCompletionStreamResponseDeltaAudioFromJson(
            Map<String, dynamic> json) =>
        _ChatCompletionStreamResponseDeltaAudio(
          id: json['id'] as String?,
          expiresAt: (json['expires_at'] as num?)?.toInt(),
          data: json['data'] as String?,
          transcript: json['transcript'] as String?,
        );

Map<String, dynamic> _$ChatCompletionStreamResponseDeltaAudioToJson(
        _ChatCompletionStreamResponseDeltaAudio instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      if (instance.data case final value?) 'data': value,
      if (instance.transcript case final value?) 'transcript': value,
    };

_ChatCompletionStreamMessageFunctionCall
    _$ChatCompletionStreamMessageFunctionCallFromJson(
            Map<String, dynamic> json) =>
        _ChatCompletionStreamMessageFunctionCall(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
        );

Map<String, dynamic> _$ChatCompletionStreamMessageFunctionCallToJson(
        _ChatCompletionStreamMessageFunctionCall instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.arguments case final value?) 'arguments': value,
    };

_ChatCompletionStreamMessageToolCallChunk
    _$ChatCompletionStreamMessageToolCallChunkFromJson(
            Map<String, dynamic> json) =>
        _ChatCompletionStreamMessageToolCallChunk(
          index: (json['index'] as num?)?.toInt(),
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

Map<String, dynamic> _$ChatCompletionStreamMessageToolCallChunkToJson(
        _ChatCompletionStreamMessageToolCallChunk instance) =>
    <String, dynamic>{
      if (instance.index case final value?) 'index': value,
      if (instance.id case final value?) 'id': value,
      if (_$ChatCompletionStreamMessageToolCallChunkTypeEnumMap[instance.type]
          case final value?)
        'type': value,
      if (instance.function?.toJson() case final value?) 'function': value,
    };

const _$ChatCompletionStreamMessageToolCallChunkTypeEnumMap = {
  ChatCompletionStreamMessageToolCallChunkType.function: 'function',
};

_ChatCompletionList _$ChatCompletionListFromJson(Map<String, dynamic> json) =>
    _ChatCompletionList(
      object: $enumDecode(_$ChatCompletionListObjectEnumMap, json['object']),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              CreateChatCompletionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ChatCompletionListToJson(_ChatCompletionList instance) =>
    <String, dynamic>{
      'object': _$ChatCompletionListObjectEnumMap[instance.object]!,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

const _$ChatCompletionListObjectEnumMap = {
  ChatCompletionListObject.list: 'list',
};

_CompletionUsage _$CompletionUsageFromJson(Map<String, dynamic> json) =>
    _CompletionUsage(
      completionTokens: (json['completion_tokens'] as num?)?.toInt(),
      promptTokens: (json['prompt_tokens'] as num?)?.toInt(),
      totalTokens: (json['total_tokens'] as num?)?.toInt(),
      completionTokensDetails: json['completion_tokens_details'] == null
          ? null
          : CompletionTokensDetails.fromJson(
              json['completion_tokens_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompletionUsageToJson(_CompletionUsage instance) =>
    <String, dynamic>{
      if (instance.completionTokens case final value?)
        'completion_tokens': value,
      if (instance.promptTokens case final value?) 'prompt_tokens': value,
      if (instance.totalTokens case final value?) 'total_tokens': value,
      if (instance.completionTokensDetails?.toJson() case final value?)
        'completion_tokens_details': value,
    };

_CompletionTokensDetails _$CompletionTokensDetailsFromJson(
        Map<String, dynamic> json) =>
    _CompletionTokensDetails(
      acceptedPredictionTokens:
          (json['accepted_prediction_tokens'] as num?)?.toInt(),
      audioTokens: (json['audio_tokens'] as num?)?.toInt(),
      reasoningTokens: (json['reasoning_tokens'] as num?)?.toInt(),
      rejectedPredictionTokens:
          (json['rejected_prediction_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompletionTokensDetailsToJson(
        _CompletionTokensDetails instance) =>
    <String, dynamic>{
      if (instance.acceptedPredictionTokens case final value?)
        'accepted_prediction_tokens': value,
      if (instance.audioTokens case final value?) 'audio_tokens': value,
      if (instance.reasoningTokens case final value?) 'reasoning_tokens': value,
      if (instance.rejectedPredictionTokens case final value?)
        'rejected_prediction_tokens': value,
    };

_CreateEmbeddingRequest _$CreateEmbeddingRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateEmbeddingRequest(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: const _EmbeddingInputConverter().fromJson(json['input']),
      encodingFormat: $enumDecodeNullable(
              _$EmbeddingEncodingFormatEnumMap, json['encoding_format']) ??
          EmbeddingEncodingFormat.float,
      dimensions: (json['dimensions'] as num?)?.toInt(),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$CreateEmbeddingRequestToJson(
        _CreateEmbeddingRequest instance) =>
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

EmbeddingModelEnumeration _$EmbeddingModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    EmbeddingModelEnumeration(
      $enumDecode(_$EmbeddingModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingModelEnumerationToJson(
        EmbeddingModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$EmbeddingModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$EmbeddingModelsEnumMap = {
  EmbeddingModels.textEmbeddingAda002: 'text-embedding-ada-002',
  EmbeddingModels.textEmbedding3Small: 'text-embedding-3-small',
  EmbeddingModels.textEmbedding3Large: 'text-embedding-3-large',
};

EmbeddingModelString _$EmbeddingModelStringFromJson(
        Map<String, dynamic> json) =>
    EmbeddingModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingModelStringToJson(
        EmbeddingModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

EmbeddingInputListListInt _$EmbeddingInputListListIntFromJson(
        Map<String, dynamic> json) =>
    EmbeddingInputListListInt(
      (json['value'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingInputListListIntToJson(
        EmbeddingInputListListInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

EmbeddingInputListInt _$EmbeddingInputListIntFromJson(
        Map<String, dynamic> json) =>
    EmbeddingInputListInt(
      (json['value'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingInputListIntToJson(
        EmbeddingInputListInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

EmbeddingInputListString _$EmbeddingInputListStringFromJson(
        Map<String, dynamic> json) =>
    EmbeddingInputListString(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingInputListStringToJson(
        EmbeddingInputListString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

EmbeddingInputString _$EmbeddingInputStringFromJson(
        Map<String, dynamic> json) =>
    EmbeddingInputString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingInputStringToJson(
        EmbeddingInputString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_CreateEmbeddingResponse _$CreateEmbeddingResponseFromJson(
        Map<String, dynamic> json) =>
    _CreateEmbeddingResponse(
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

Map<String, dynamic> _$CreateEmbeddingResponseToJson(
        _CreateEmbeddingResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'object': _$CreateEmbeddingResponseObjectEnumMap[instance.object]!,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

const _$CreateEmbeddingResponseObjectEnumMap = {
  CreateEmbeddingResponseObject.list: 'list',
};

_Embedding _$EmbeddingFromJson(Map<String, dynamic> json) => _Embedding(
      index: (json['index'] as num?)?.toInt(),
      embedding: const _EmbeddingVectorConverter().fromJson(json['embedding']),
      object: $enumDecode(_$EmbeddingObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$EmbeddingToJson(_Embedding instance) =>
    <String, dynamic>{
      if (instance.index case final value?) 'index': value,
      'embedding': const _EmbeddingVectorConverter().toJson(instance.embedding),
      'object': _$EmbeddingObjectEnumMap[instance.object]!,
    };

const _$EmbeddingObjectEnumMap = {
  EmbeddingObject.embedding: 'embedding',
};

EmbeddingVectorListDouble _$EmbeddingVectorListDoubleFromJson(
        Map<String, dynamic> json) =>
    EmbeddingVectorListDouble(
      (json['value'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingVectorListDoubleToJson(
        EmbeddingVectorListDouble instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

EmbeddingVectorString _$EmbeddingVectorStringFromJson(
        Map<String, dynamic> json) =>
    EmbeddingVectorString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$EmbeddingVectorStringToJson(
        EmbeddingVectorString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
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

_CreateFineTuningJobRequest _$CreateFineTuningJobRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateFineTuningJobRequest(
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

Map<String, dynamic> _$CreateFineTuningJobRequestToJson(
        _CreateFineTuningJobRequest instance) =>
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

FineTuningModelEnumeration _$FineTuningModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    FineTuningModelEnumeration(
      $enumDecode(_$FineTuningModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FineTuningModelEnumerationToJson(
        FineTuningModelEnumeration instance) =>
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

FineTuningModelString _$FineTuningModelStringFromJson(
        Map<String, dynamic> json) =>
    FineTuningModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FineTuningModelStringToJson(
        FineTuningModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_FineTuningJob _$FineTuningJobFromJson(Map<String, dynamic> json) =>
    _FineTuningJob(
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

Map<String, dynamic> _$FineTuningJobToJson(_FineTuningJob instance) =>
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

_FineTuningIntegration _$FineTuningIntegrationFromJson(
        Map<String, dynamic> json) =>
    _FineTuningIntegration(
      type: $enumDecode(_$FineTuningIntegrationTypeEnumMap, json['type']),
      wandb: FineTuningIntegrationWandb.fromJson(
          json['wandb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FineTuningIntegrationToJson(
        _FineTuningIntegration instance) =>
    <String, dynamic>{
      'type': _$FineTuningIntegrationTypeEnumMap[instance.type]!,
      'wandb': instance.wandb.toJson(),
    };

const _$FineTuningIntegrationTypeEnumMap = {
  FineTuningIntegrationType.wandb: 'wandb',
};

_FineTuningIntegrationWandb _$FineTuningIntegrationWandbFromJson(
        Map<String, dynamic> json) =>
    _FineTuningIntegrationWandb(
      project: json['project'] as String,
      name: json['name'] as String?,
      entity: json['entity'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FineTuningIntegrationWandbToJson(
        _FineTuningIntegrationWandb instance) =>
    <String, dynamic>{
      'project': instance.project,
      if (instance.name case final value?) 'name': value,
      if (instance.entity case final value?) 'entity': value,
      if (instance.tags case final value?) 'tags': value,
    };

_FineTuningJobError _$FineTuningJobErrorFromJson(Map<String, dynamic> json) =>
    _FineTuningJobError(
      code: json['code'] as String,
      message: json['message'] as String,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$FineTuningJobErrorToJson(_FineTuningJobError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
    };

_FineTuningJobHyperparameters _$FineTuningJobHyperparametersFromJson(
        Map<String, dynamic> json) =>
    _FineTuningJobHyperparameters(
      nEpochs: const _FineTuningNEpochsConverter().fromJson(json['n_epochs']),
    );

Map<String, dynamic> _$FineTuningJobHyperparametersToJson(
        _FineTuningJobHyperparameters instance) =>
    <String, dynamic>{
      'n_epochs': const _FineTuningNEpochsConverter().toJson(instance.nEpochs),
    };

FineTuningNEpochsEnumeration _$FineTuningNEpochsEnumerationFromJson(
        Map<String, dynamic> json) =>
    FineTuningNEpochsEnumeration(
      $enumDecode(_$FineTuningNEpochsOptionsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FineTuningNEpochsEnumerationToJson(
        FineTuningNEpochsEnumeration instance) =>
    <String, dynamic>{
      'value': _$FineTuningNEpochsOptionsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$FineTuningNEpochsOptionsEnumMap = {
  FineTuningNEpochsOptions.auto: 'auto',
};

FineTuningNEpochsInt _$FineTuningNEpochsIntFromJson(
        Map<String, dynamic> json) =>
    FineTuningNEpochsInt(
      (json['value'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$FineTuningNEpochsIntToJson(
        FineTuningNEpochsInt instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ListPaginatedFineTuningJobsResponse
    _$ListPaginatedFineTuningJobsResponseFromJson(Map<String, dynamic> json) =>
        _ListPaginatedFineTuningJobsResponse(
          data: (json['data'] as List<dynamic>)
              .map((e) => FineTuningJob.fromJson(e as Map<String, dynamic>))
              .toList(),
          hasMore: json['has_more'] as bool,
          object: $enumDecode(
              _$ListPaginatedFineTuningJobsResponseObjectEnumMap,
              json['object']),
        );

Map<String, dynamic> _$ListPaginatedFineTuningJobsResponseToJson(
        _ListPaginatedFineTuningJobsResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
      'object':
          _$ListPaginatedFineTuningJobsResponseObjectEnumMap[instance.object]!,
    };

const _$ListPaginatedFineTuningJobsResponseObjectEnumMap = {
  ListPaginatedFineTuningJobsResponseObject.list: 'list',
};

_ListFineTuningJobEventsResponse _$ListFineTuningJobEventsResponseFromJson(
        Map<String, dynamic> json) =>
    _ListFineTuningJobEventsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => FineTuningJobEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      object: $enumDecode(
          _$ListFineTuningJobEventsResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$ListFineTuningJobEventsResponseToJson(
        _ListFineTuningJobEventsResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'object':
          _$ListFineTuningJobEventsResponseObjectEnumMap[instance.object]!,
    };

const _$ListFineTuningJobEventsResponseObjectEnumMap = {
  ListFineTuningJobEventsResponseObject.list: 'list',
};

_ListFineTuningJobCheckpointsResponse
    _$ListFineTuningJobCheckpointsResponseFromJson(Map<String, dynamic> json) =>
        _ListFineTuningJobCheckpointsResponse(
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

Map<String, dynamic> _$ListFineTuningJobCheckpointsResponseToJson(
        _ListFineTuningJobCheckpointsResponse instance) =>
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

_FineTuningJobEvent _$FineTuningJobEventFromJson(Map<String, dynamic> json) =>
    _FineTuningJobEvent(
      id: json['id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      level: $enumDecode(_$FineTuningJobEventLevelEnumMap, json['level']),
      message: json['message'] as String,
      object: $enumDecode(_$FineTuningJobEventObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$FineTuningJobEventToJson(_FineTuningJobEvent instance) =>
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

_FineTuningJobCheckpoint _$FineTuningJobCheckpointFromJson(
        Map<String, dynamic> json) =>
    _FineTuningJobCheckpoint(
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

Map<String, dynamic> _$FineTuningJobCheckpointToJson(
        _FineTuningJobCheckpoint instance) =>
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

_FineTuningJobCheckpointMetrics _$FineTuningJobCheckpointMetricsFromJson(
        Map<String, dynamic> json) =>
    _FineTuningJobCheckpointMetrics(
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

Map<String, dynamic> _$FineTuningJobCheckpointMetricsToJson(
        _FineTuningJobCheckpointMetrics instance) =>
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

_CreateImageRequest _$CreateImageRequestFromJson(Map<String, dynamic> json) =>
    _CreateImageRequest(
      prompt: json['prompt'] as String,
      model: const _CreateImageRequestModelConverter().fromJson(json['model']),
      n: (json['n'] as num?)?.toInt(),
      quality: $enumDecodeNullable(_$ImageQualityEnumMap, json['quality'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      responseFormat: $enumDecodeNullable(
          _$ImageResponseFormatEnumMap, json['response_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      outputFormat: $enumDecodeNullable(
          _$ImageOutputFormatEnumMap, json['output_format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      outputCompression: (json['output_compression'] as num?)?.toInt(),
      size: $enumDecodeNullable(_$ImageSizeEnumMap, json['size'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      moderation: $enumDecodeNullable(
          _$ImageModerationEnumMap, json['moderation'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      background: $enumDecodeNullable(
          _$ImageBackgroundEnumMap, json['background'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      style: $enumDecodeNullable(_$ImageStyleEnumMap, json['style'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$CreateImageRequestToJson(_CreateImageRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      if (const _CreateImageRequestModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      if (instance.n case final value?) 'n': value,
      if (_$ImageQualityEnumMap[instance.quality] case final value?)
        'quality': value,
      if (_$ImageResponseFormatEnumMap[instance.responseFormat]
          case final value?)
        'response_format': value,
      if (_$ImageOutputFormatEnumMap[instance.outputFormat] case final value?)
        'output_format': value,
      if (instance.outputCompression case final value?)
        'output_compression': value,
      if (_$ImageSizeEnumMap[instance.size] case final value?) 'size': value,
      if (_$ImageModerationEnumMap[instance.moderation] case final value?)
        'moderation': value,
      if (_$ImageBackgroundEnumMap[instance.background] case final value?)
        'background': value,
      if (_$ImageStyleEnumMap[instance.style] case final value?) 'style': value,
      if (instance.user case final value?) 'user': value,
    };

const _$ImageQualityEnumMap = {
  ImageQuality.standard: 'standard',
  ImageQuality.hd: 'hd',
  ImageQuality.low: 'low',
  ImageQuality.medium: 'medium',
  ImageQuality.high: 'high',
  ImageQuality.auto: 'auto',
};

const _$ImageResponseFormatEnumMap = {
  ImageResponseFormat.url: 'url',
  ImageResponseFormat.b64Json: 'b64_json',
};

const _$ImageOutputFormatEnumMap = {
  ImageOutputFormat.png: 'png',
  ImageOutputFormat.jpeg: 'jpeg',
  ImageOutputFormat.webp: 'webp',
};

const _$ImageSizeEnumMap = {
  ImageSize.auto: 'auto',
  ImageSize.v1024x1024: '1024x1024',
  ImageSize.v1536x1024: '1536x1024',
  ImageSize.v1024x1536: '1024x1536',
  ImageSize.v256x256: '256x256',
  ImageSize.v512x512: '512x512',
  ImageSize.v1792x1024: '1792x1024',
  ImageSize.v1024x1792: '1024x1792',
};

const _$ImageModerationEnumMap = {
  ImageModeration.low: 'low',
  ImageModeration.auto: 'auto',
};

const _$ImageBackgroundEnumMap = {
  ImageBackground.transparent: 'transparent',
  ImageBackground.opaque: 'opaque',
  ImageBackground.auto: 'auto',
};

const _$ImageStyleEnumMap = {
  ImageStyle.vivid: 'vivid',
  ImageStyle.natural: 'natural',
};

CreateImageRequestModelEnumeration _$CreateImageRequestModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    CreateImageRequestModelEnumeration(
      $enumDecode(_$ImageModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateImageRequestModelEnumerationToJson(
        CreateImageRequestModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$ImageModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ImageModelsEnumMap = {
  ImageModels.dallE2: 'dall-e-2',
  ImageModels.dallE3: 'dall-e-3',
  ImageModels.gptImage1: 'gpt-image-1',
};

CreateImageRequestModelString _$CreateImageRequestModelStringFromJson(
        Map<String, dynamic> json) =>
    CreateImageRequestModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateImageRequestModelStringToJson(
        CreateImageRequestModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    _ImagesResponse(
      created: (json['created'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImagesResponseToJson(_ImagesResponse instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_Image _$ImageFromJson(Map<String, dynamic> json) => _Image(
      b64Json: json['b64_json'] as String?,
      url: json['url'] as String?,
      revisedPrompt: json['revised_prompt'] as String?,
    );

Map<String, dynamic> _$ImageToJson(_Image instance) => <String, dynamic>{
      if (instance.b64Json case final value?) 'b64_json': value,
      if (instance.url case final value?) 'url': value,
      if (instance.revisedPrompt case final value?) 'revised_prompt': value,
    };

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
      id: json['id'] as String,
      created: (json['created'] as num?)?.toInt(),
      object: $enumDecodeNullable(_$ModelObjectEnumMap, json['object'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      ownedBy: json['owned_by'] as String?,
    );

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
      'id': instance.id,
      if (instance.created case final value?) 'created': value,
      if (_$ModelObjectEnumMap[instance.object] case final value?)
        'object': value,
      if (instance.ownedBy case final value?) 'owned_by': value,
    };

const _$ModelObjectEnumMap = {
  ModelObject.model: 'model',
};

_ListModelsResponse _$ListModelsResponseFromJson(Map<String, dynamic> json) =>
    _ListModelsResponse(
      object: $enumDecodeNullable(
          _$ListModelsResponseObjectEnumMap, json['object'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      data: (json['data'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListModelsResponseToJson(_ListModelsResponse instance) =>
    <String, dynamic>{
      if (_$ListModelsResponseObjectEnumMap[instance.object] case final value?)
        'object': value,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

const _$ListModelsResponseObjectEnumMap = {
  ListModelsResponseObject.list: 'list',
};

_DeleteModelResponse _$DeleteModelResponseFromJson(Map<String, dynamic> json) =>
    _DeleteModelResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: json['object'] as String,
    );

Map<String, dynamic> _$DeleteModelResponseToJson(
        _DeleteModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_CreateModerationRequest _$CreateModerationRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateModerationRequest(
      model: json['model'] == null
          ? const ModerationModelString('omni-moderation-latest')
          : const _ModerationModelConverter().fromJson(json['model']),
      input: const _ModerationInputConverter().fromJson(json['input']),
    );

Map<String, dynamic> _$CreateModerationRequestToJson(
        _CreateModerationRequest instance) =>
    <String, dynamic>{
      if (const _ModerationModelConverter().toJson(instance.model)
          case final value?)
        'model': value,
      'input': const _ModerationInputConverter().toJson(instance.input),
    };

ModerationModelEnumeration _$ModerationModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    ModerationModelEnumeration(
      $enumDecode(_$ModerationModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModerationModelEnumerationToJson(
        ModerationModelEnumeration instance) =>
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

ModerationModelString _$ModerationModelStringFromJson(
        Map<String, dynamic> json) =>
    ModerationModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModerationModelStringToJson(
        ModerationModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ModerationInputListModerationInputObject
    _$ModerationInputListModerationInputObjectFromJson(
            Map<String, dynamic> json) =>
        ModerationInputListModerationInputObject(
          (json['value'] as List<dynamic>)
              .map((e) =>
                  ModerationInputObject.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ModerationInputListModerationInputObjectToJson(
        ModerationInputListModerationInputObject instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

ModerationInputListString _$ModerationInputListStringFromJson(
        Map<String, dynamic> json) =>
    ModerationInputListString(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModerationInputListStringToJson(
        ModerationInputListString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ModerationInputString _$ModerationInputStringFromJson(
        Map<String, dynamic> json) =>
    ModerationInputString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModerationInputStringToJson(
        ModerationInputString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_CreateModerationResponse _$CreateModerationResponseFromJson(
        Map<String, dynamic> json) =>
    _CreateModerationResponse(
      id: json['id'] as String,
      model: json['model'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => Moderation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateModerationResponseToJson(
        _CreateModerationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_Moderation _$ModerationFromJson(Map<String, dynamic> json) => _Moderation(
      flagged: json['flagged'] as bool,
      categories: ModerationCategories.fromJson(
          json['categories'] as Map<String, dynamic>),
      categoryScores: ModerationCategoriesScores.fromJson(
          json['category_scores'] as Map<String, dynamic>),
      categoryAppliedInputTypes: ModerationCategoriesAppliedInputTypes.fromJson(
          json['category_applied_input_types'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModerationToJson(_Moderation instance) =>
    <String, dynamic>{
      'flagged': instance.flagged,
      'categories': instance.categories.toJson(),
      'category_scores': instance.categoryScores.toJson(),
      'category_applied_input_types':
          instance.categoryAppliedInputTypes.toJson(),
    };

_ModerationCategories _$ModerationCategoriesFromJson(
        Map<String, dynamic> json) =>
    _ModerationCategories(
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

Map<String, dynamic> _$ModerationCategoriesToJson(
        _ModerationCategories instance) =>
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

_ModerationCategoriesScores _$ModerationCategoriesScoresFromJson(
        Map<String, dynamic> json) =>
    _ModerationCategoriesScores(
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

Map<String, dynamic> _$ModerationCategoriesScoresToJson(
        _ModerationCategoriesScores instance) =>
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

_ModerationCategoriesAppliedInputTypes
    _$ModerationCategoriesAppliedInputTypesFromJson(
            Map<String, dynamic> json) =>
        _ModerationCategoriesAppliedInputTypes(
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

Map<String, dynamic> _$ModerationCategoriesAppliedInputTypesToJson(
        _ModerationCategoriesAppliedInputTypes instance) =>
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

_AssistantObject _$AssistantObjectFromJson(Map<String, dynamic> json) =>
    _AssistantObject(
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

Map<String, dynamic> _$AssistantObjectToJson(_AssistantObject instance) =>
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

AssistantObjectResponseFormatEnumeration
    _$AssistantObjectResponseFormatEnumerationFromJson(
            Map<String, dynamic> json) =>
        AssistantObjectResponseFormatEnumeration(
          $enumDecode(_$AssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$AssistantObjectResponseFormatEnumerationToJson(
        AssistantObjectResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value': _$AssistantResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$AssistantResponseFormatModeEnumMap = {
  AssistantResponseFormatMode.auto: 'auto',
};

AssistantObjectResponseFormatResponseFormat
    _$AssistantObjectResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        AssistantObjectResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$AssistantObjectResponseFormatResponseFormatToJson(
        AssistantObjectResponseFormatResponseFormat instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_CreateAssistantRequest _$CreateAssistantRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateAssistantRequest(
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

Map<String, dynamic> _$CreateAssistantRequestToJson(
        _CreateAssistantRequest instance) =>
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

AssistantModelEnumeration _$AssistantModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    AssistantModelEnumeration(
      $enumDecode(_$AssistantModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AssistantModelEnumerationToJson(
        AssistantModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$AssistantModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$AssistantModelsEnumMap = {
  AssistantModels.gpt5: 'gpt-5',
  AssistantModels.gpt5Mini: 'gpt-5-mini',
  AssistantModels.gpt5Nano: 'gpt-5-nano',
  AssistantModels.gpt520250807: 'gpt-5-2025-08-07',
  AssistantModels.gpt5Mini20250807: 'gpt-5-mini-2025-08-07',
  AssistantModels.gpt5Nano20250807: 'gpt-5-nano-2025-08-07',
  AssistantModels.gpt5ChatLatest: 'gpt-5-chat-latest',
  AssistantModels.gpt41: 'gpt-4.1',
  AssistantModels.gpt41Mini: 'gpt-4.1-mini',
  AssistantModels.gpt41Nano: 'gpt-4.1-nano',
  AssistantModels.gpt4120250414: 'gpt-4.1-2025-04-14',
  AssistantModels.gpt41Mini20250414: 'gpt-4.1-mini-2025-04-14',
  AssistantModels.gpt41Nano20250414: 'gpt-4.1-nano-2025-04-14',
  AssistantModels.o4Mini: 'o4-mini',
  AssistantModels.o4Mini20250416: 'o4-mini-2025-04-16',
  AssistantModels.o3: 'o3',
  AssistantModels.o320250416: 'o3-2025-04-16',
  AssistantModels.o3Mini: 'o3-mini',
  AssistantModels.o3Mini20250131: 'o3-mini-2025-01-31',
  AssistantModels.o1: 'o1',
  AssistantModels.o120241217: 'o1-2024-12-17',
  AssistantModels.o1Preview: 'o1-preview',
  AssistantModels.o1Preview20240912: 'o1-preview-2024-09-12',
  AssistantModels.o1Mini: 'o1-mini',
  AssistantModels.o1Mini20240912: 'o1-mini-2024-09-12',
  AssistantModels.gpt4o: 'gpt-4o',
  AssistantModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  AssistantModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  AssistantModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  AssistantModels.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  AssistantModels.gpt4oAudioPreview20241001: 'gpt-4o-audio-preview-2024-10-01',
  AssistantModels.gpt4oAudioPreview20241217: 'gpt-4o-audio-preview-2024-12-17',
  AssistantModels.gpt4oAudioPreview20250603: 'gpt-4o-audio-preview-2025-06-03',
  AssistantModels.gpt4oMiniAudioPreview: 'gpt-4o-mini-audio-preview',
  AssistantModels.gpt4oMiniAudioPreview20241217:
      'gpt-4o-mini-audio-preview-2024-12-17',
  AssistantModels.gpt4oSearchPreview: 'gpt-4o-search-preview',
  AssistantModels.gpt4oMiniSearchPreview: 'gpt-4o-mini-search-preview',
  AssistantModels.gpt4oSearchPreview20250311:
      'gpt-4o-search-preview-2025-03-11',
  AssistantModels.gpt4oMiniSearchPreview20250311:
      'gpt-4o-mini-search-preview-2025-03-11',
  AssistantModels.chatgpt4oLatest: 'chatgpt-4o-latest',
  AssistantModels.codexMiniLatest: 'codex-mini-latest',
  AssistantModels.gpt4oMini: 'gpt-4o-mini',
  AssistantModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  AssistantModels.gpt45Preview: 'gpt-4.5-preview',
  AssistantModels.gpt45Preview20250227: 'gpt-4.5-preview-2025-02-27',
  AssistantModels.gpt4Turbo: 'gpt-4-turbo',
  AssistantModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  AssistantModels.gpt40125Preview: 'gpt-4-0125-preview',
  AssistantModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  AssistantModels.gpt41106Preview: 'gpt-4-1106-preview',
  AssistantModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  AssistantModels.gpt4: 'gpt-4',
  AssistantModels.gpt40314: 'gpt-4-0314',
  AssistantModels.gpt40613: 'gpt-4-0613',
  AssistantModels.gpt432k: 'gpt-4-32k',
  AssistantModels.gpt432k0314: 'gpt-4-32k-0314',
  AssistantModels.gpt432k0613: 'gpt-4-32k-0613',
  AssistantModels.gpt35Turbo: 'gpt-3.5-turbo',
  AssistantModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  AssistantModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  AssistantModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  AssistantModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  AssistantModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  AssistantModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
};

AssistantModelString _$AssistantModelStringFromJson(
        Map<String, dynamic> json) =>
    AssistantModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AssistantModelStringToJson(
        AssistantModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CreateAssistantRequestResponseFormatEnumeration
    _$CreateAssistantRequestResponseFormatEnumerationFromJson(
            Map<String, dynamic> json) =>
        CreateAssistantRequestResponseFormatEnumeration(
          $enumDecode(
              _$CreateAssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateAssistantRequestResponseFormatEnumerationToJson(
        CreateAssistantRequestResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value': _$CreateAssistantResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateAssistantResponseFormatModeEnumMap = {
  CreateAssistantResponseFormatMode.auto: 'auto',
};

CreateAssistantRequestResponseFormatResponseFormat
    _$CreateAssistantRequestResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        CreateAssistantRequestResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateAssistantRequestResponseFormatResponseFormatToJson(
        CreateAssistantRequestResponseFormatResponseFormat instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_ModifyAssistantRequest _$ModifyAssistantRequestFromJson(
        Map<String, dynamic> json) =>
    _ModifyAssistantRequest(
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

Map<String, dynamic> _$ModifyAssistantRequestToJson(
        _ModifyAssistantRequest instance) =>
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

ModifyAssistantRequestResponseFormatEnumeration
    _$ModifyAssistantRequestResponseFormatEnumerationFromJson(
            Map<String, dynamic> json) =>
        ModifyAssistantRequestResponseFormatEnumeration(
          $enumDecode(
              _$ModifyAssistantResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ModifyAssistantRequestResponseFormatEnumerationToJson(
        ModifyAssistantRequestResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value': _$ModifyAssistantResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ModifyAssistantResponseFormatModeEnumMap = {
  ModifyAssistantResponseFormatMode.auto: 'auto',
};

ModifyAssistantRequestResponseFormatResponseFormat
    _$ModifyAssistantRequestResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        ModifyAssistantRequestResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ModifyAssistantRequestResponseFormatResponseFormatToJson(
        ModifyAssistantRequestResponseFormatResponseFormat instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_DeleteAssistantResponse _$DeleteAssistantResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteAssistantResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object:
          $enumDecode(_$DeleteAssistantResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$DeleteAssistantResponseToJson(
        _DeleteAssistantResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteAssistantResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteAssistantResponseObjectEnumMap = {
  DeleteAssistantResponseObject.assistantDeleted: 'assistant.deleted',
};

_ListAssistantsResponse _$ListAssistantsResponseFromJson(
        Map<String, dynamic> json) =>
    _ListAssistantsResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AssistantObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListAssistantsResponseToJson(
        _ListAssistantsResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_FileSearchRankingOptions _$FileSearchRankingOptionsFromJson(
        Map<String, dynamic> json) =>
    _FileSearchRankingOptions(
      ranker: $enumDecodeNullable(_$FileSearchRankerEnumMap, json['ranker'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      scoreThreshold: (json['score_threshold'] as num).toDouble(),
    );

Map<String, dynamic> _$FileSearchRankingOptionsToJson(
        _FileSearchRankingOptions instance) =>
    <String, dynamic>{
      if (_$FileSearchRankerEnumMap[instance.ranker] case final value?)
        'ranker': value,
      'score_threshold': instance.scoreThreshold,
    };

const _$FileSearchRankerEnumMap = {
  FileSearchRanker.auto: 'auto',
  FileSearchRanker.default20240821: 'default_2024_08_21',
};

_AssistantsNamedToolChoice _$AssistantsNamedToolChoiceFromJson(
        Map<String, dynamic> json) =>
    _AssistantsNamedToolChoice(
      type: $enumDecode(_$AssistantsToolTypeEnumMap, json['type']),
      function: json['function'] == null
          ? null
          : AssistantsFunctionCallOption.fromJson(
              json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssistantsNamedToolChoiceToJson(
        _AssistantsNamedToolChoice instance) =>
    <String, dynamic>{
      'type': _$AssistantsToolTypeEnumMap[instance.type]!,
      if (instance.function?.toJson() case final value?) 'function': value,
    };

const _$AssistantsToolTypeEnumMap = {
  AssistantsToolType.function: 'function',
  AssistantsToolType.codeInterpreter: 'code_interpreter',
  AssistantsToolType.fileSearch: 'file_search',
};

_AssistantsFunctionCallOption _$AssistantsFunctionCallOptionFromJson(
        Map<String, dynamic> json) =>
    _AssistantsFunctionCallOption(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AssistantsFunctionCallOptionToJson(
        _AssistantsFunctionCallOption instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_TruncationObject _$TruncationObjectFromJson(Map<String, dynamic> json) =>
    _TruncationObject(
      type: $enumDecode(_$TruncationObjectTypeEnumMap, json['type']),
      lastMessages: (json['last_messages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TruncationObjectToJson(_TruncationObject instance) =>
    <String, dynamic>{
      'type': _$TruncationObjectTypeEnumMap[instance.type]!,
      if (instance.lastMessages case final value?) 'last_messages': value,
    };

const _$TruncationObjectTypeEnumMap = {
  TruncationObjectType.auto: 'auto',
  TruncationObjectType.lastMessages: 'last_messages',
};

_RunObject _$RunObjectFromJson(Map<String, dynamic> json) => _RunObject(
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

Map<String, dynamic> _$RunObjectToJson(_RunObject instance) =>
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

_RunRequiredAction _$RunRequiredActionFromJson(Map<String, dynamic> json) =>
    _RunRequiredAction(
      type: $enumDecode(_$RunRequiredActionTypeEnumMap, json['type']),
      submitToolOutputs: RunSubmitToolOutputs.fromJson(
          json['submit_tool_outputs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunRequiredActionToJson(_RunRequiredAction instance) =>
    <String, dynamic>{
      'type': _$RunRequiredActionTypeEnumMap[instance.type]!,
      'submit_tool_outputs': instance.submitToolOutputs.toJson(),
    };

const _$RunRequiredActionTypeEnumMap = {
  RunRequiredActionType.submitToolOutputs: 'submit_tool_outputs',
};

_RunLastError _$RunLastErrorFromJson(Map<String, dynamic> json) =>
    _RunLastError(
      code: $enumDecode(_$RunLastErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$RunLastErrorToJson(_RunLastError instance) =>
    <String, dynamic>{
      'code': _$RunLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$RunLastErrorCodeEnumMap = {
  RunLastErrorCode.serverError: 'server_error',
  RunLastErrorCode.rateLimitExceeded: 'rate_limit_exceeded',
  RunLastErrorCode.invalidPrompt: 'invalid_prompt',
};

_RunObjectIncompleteDetails _$RunObjectIncompleteDetailsFromJson(
        Map<String, dynamic> json) =>
    _RunObjectIncompleteDetails(
      reason: $enumDecodeNullable(
          _$RunObjectIncompleteDetailsReasonEnumMap, json['reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$RunObjectIncompleteDetailsToJson(
        _RunObjectIncompleteDetails instance) =>
    <String, dynamic>{
      if (_$RunObjectIncompleteDetailsReasonEnumMap[instance.reason]
          case final value?)
        'reason': value,
    };

const _$RunObjectIncompleteDetailsReasonEnumMap = {
  RunObjectIncompleteDetailsReason.maxCompletionTokens: 'max_completion_tokens',
  RunObjectIncompleteDetailsReason.maxPromptTokens: 'max_prompt_tokens',
};

RunObjectToolChoiceEnumeration _$RunObjectToolChoiceEnumerationFromJson(
        Map<String, dynamic> json) =>
    RunObjectToolChoiceEnumeration(
      $enumDecode(_$RunObjectToolChoiceModeEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RunObjectToolChoiceEnumerationToJson(
        RunObjectToolChoiceEnumeration instance) =>
    <String, dynamic>{
      'value': _$RunObjectToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunObjectToolChoiceModeEnumMap = {
  RunObjectToolChoiceMode.none: 'none',
  RunObjectToolChoiceMode.auto: 'auto',
  RunObjectToolChoiceMode.required: 'required',
};

RunObjectToolChoiceAssistantsNamedToolChoice
    _$RunObjectToolChoiceAssistantsNamedToolChoiceFromJson(
            Map<String, dynamic> json) =>
        RunObjectToolChoiceAssistantsNamedToolChoice(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$RunObjectToolChoiceAssistantsNamedToolChoiceToJson(
        RunObjectToolChoiceAssistantsNamedToolChoice instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

RunObjectResponseFormatEnumeration _$RunObjectResponseFormatEnumerationFromJson(
        Map<String, dynamic> json) =>
    RunObjectResponseFormatEnumeration(
      $enumDecode(_$RunObjectResponseFormatModeEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RunObjectResponseFormatEnumerationToJson(
        RunObjectResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value': _$RunObjectResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunObjectResponseFormatModeEnumMap = {
  RunObjectResponseFormatMode.auto: 'auto',
};

RunObjectResponseFormatResponseFormat
    _$RunObjectResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        RunObjectResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$RunObjectResponseFormatResponseFormatToJson(
        RunObjectResponseFormatResponseFormat instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_RunSubmitToolOutputs _$RunSubmitToolOutputsFromJson(
        Map<String, dynamic> json) =>
    _RunSubmitToolOutputs(
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) => RunToolCallObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RunSubmitToolOutputsToJson(
        _RunSubmitToolOutputs instance) =>
    <String, dynamic>{
      'tool_calls': instance.toolCalls.map((e) => e.toJson()).toList(),
    };

_RunCompletionUsage _$RunCompletionUsageFromJson(Map<String, dynamic> json) =>
    _RunCompletionUsage(
      completionTokens: (json['completion_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$RunCompletionUsageToJson(_RunCompletionUsage instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_CreateRunRequest _$CreateRunRequestFromJson(Map<String, dynamic> json) =>
    _CreateRunRequest(
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

Map<String, dynamic> _$CreateRunRequestToJson(_CreateRunRequest instance) =>
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

CreateRunRequestModelEnumeration _$CreateRunRequestModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    CreateRunRequestModelEnumeration(
      $enumDecode(_$RunModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateRunRequestModelEnumerationToJson(
        CreateRunRequestModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$RunModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$RunModelsEnumMap = {
  RunModels.gpt5: 'gpt-5',
  RunModels.gpt5Mini: 'gpt-5-mini',
  RunModels.gpt5Nano: 'gpt-5-nano',
  RunModels.gpt520250807: 'gpt-5-2025-08-07',
  RunModels.gpt5Mini20250807: 'gpt-5-mini-2025-08-07',
  RunModels.gpt5Nano20250807: 'gpt-5-nano-2025-08-07',
  RunModels.gpt5ChatLatest: 'gpt-5-chat-latest',
  RunModels.gpt41: 'gpt-4.1',
  RunModels.gpt41Mini: 'gpt-4.1-mini',
  RunModels.gpt41Nano: 'gpt-4.1-nano',
  RunModels.gpt4120250414: 'gpt-4.1-2025-04-14',
  RunModels.gpt41Mini20250414: 'gpt-4.1-mini-2025-04-14',
  RunModels.gpt41Nano20250414: 'gpt-4.1-nano-2025-04-14',
  RunModels.o4Mini: 'o4-mini',
  RunModels.o4Mini20250416: 'o4-mini-2025-04-16',
  RunModels.o3: 'o3',
  RunModels.o320250416: 'o3-2025-04-16',
  RunModels.o3Mini: 'o3-mini',
  RunModels.o3Mini20250131: 'o3-mini-2025-01-31',
  RunModels.o1: 'o1',
  RunModels.o120241217: 'o1-2024-12-17',
  RunModels.o1Preview: 'o1-preview',
  RunModels.o1Preview20240912: 'o1-preview-2024-09-12',
  RunModels.o1Mini: 'o1-mini',
  RunModels.o1Mini20240912: 'o1-mini-2024-09-12',
  RunModels.gpt4o: 'gpt-4o',
  RunModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  RunModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  RunModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  RunModels.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  RunModels.gpt4oAudioPreview20241001: 'gpt-4o-audio-preview-2024-10-01',
  RunModels.gpt4oAudioPreview20241217: 'gpt-4o-audio-preview-2024-12-17',
  RunModels.gpt4oAudioPreview20250603: 'gpt-4o-audio-preview-2025-06-03',
  RunModels.gpt4oMiniAudioPreview: 'gpt-4o-mini-audio-preview',
  RunModels.gpt4oMiniAudioPreview20241217:
      'gpt-4o-mini-audio-preview-2024-12-17',
  RunModels.gpt4oSearchPreview: 'gpt-4o-search-preview',
  RunModels.gpt4oMiniSearchPreview: 'gpt-4o-mini-search-preview',
  RunModels.gpt4oSearchPreview20250311: 'gpt-4o-search-preview-2025-03-11',
  RunModels.gpt4oMiniSearchPreview20250311:
      'gpt-4o-mini-search-preview-2025-03-11',
  RunModels.chatgpt4oLatest: 'chatgpt-4o-latest',
  RunModels.codexMiniLatest: 'codex-mini-latest',
  RunModels.gpt4oMini: 'gpt-4o-mini',
  RunModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  RunModels.gpt45Preview: 'gpt-4.5-preview',
  RunModels.gpt45Preview20250227: 'gpt-4.5-preview-2025-02-27',
  RunModels.gpt4Turbo: 'gpt-4-turbo',
  RunModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  RunModels.gpt40125Preview: 'gpt-4-0125-preview',
  RunModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  RunModels.gpt41106Preview: 'gpt-4-1106-preview',
  RunModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  RunModels.gpt4: 'gpt-4',
  RunModels.gpt40314: 'gpt-4-0314',
  RunModels.gpt40613: 'gpt-4-0613',
  RunModels.gpt432k: 'gpt-4-32k',
  RunModels.gpt432k0314: 'gpt-4-32k-0314',
  RunModels.gpt432k0613: 'gpt-4-32k-0613',
  RunModels.gpt35Turbo: 'gpt-3.5-turbo',
  RunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  RunModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  RunModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  RunModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  RunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  RunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
};

CreateRunRequestModelString _$CreateRunRequestModelStringFromJson(
        Map<String, dynamic> json) =>
    CreateRunRequestModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateRunRequestModelStringToJson(
        CreateRunRequestModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CreateRunRequestToolChoiceEnumeration
    _$CreateRunRequestToolChoiceEnumerationFromJson(
            Map<String, dynamic> json) =>
        CreateRunRequestToolChoiceEnumeration(
          $enumDecode(_$CreateRunRequestToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateRunRequestToolChoiceEnumerationToJson(
        CreateRunRequestToolChoiceEnumeration instance) =>
    <String, dynamic>{
      'value': _$CreateRunRequestToolChoiceModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateRunRequestToolChoiceModeEnumMap = {
  CreateRunRequestToolChoiceMode.none: 'none',
  CreateRunRequestToolChoiceMode.auto: 'auto',
  CreateRunRequestToolChoiceMode.required: 'required',
};

CreateRunRequestToolChoiceAssistantsNamedToolChoice
    _$CreateRunRequestToolChoiceAssistantsNamedToolChoiceFromJson(
            Map<String, dynamic> json) =>
        CreateRunRequestToolChoiceAssistantsNamedToolChoice(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$CreateRunRequestToolChoiceAssistantsNamedToolChoiceToJson(
            CreateRunRequestToolChoiceAssistantsNamedToolChoice instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

CreateRunRequestResponseFormatEnumeration
    _$CreateRunRequestResponseFormatEnumerationFromJson(
            Map<String, dynamic> json) =>
        CreateRunRequestResponseFormatEnumeration(
          $enumDecode(
              _$CreateRunRequestResponseFormatModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateRunRequestResponseFormatEnumerationToJson(
        CreateRunRequestResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value': _$CreateRunRequestResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateRunRequestResponseFormatModeEnumMap = {
  CreateRunRequestResponseFormatMode.auto: 'auto',
};

CreateRunRequestResponseFormatResponseFormat
    _$CreateRunRequestResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        CreateRunRequestResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateRunRequestResponseFormatResponseFormatToJson(
        CreateRunRequestResponseFormatResponseFormat instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
      'runtimeType': instance.$type,
    };

_ListRunsResponse _$ListRunsResponseFromJson(Map<String, dynamic> json) =>
    _ListRunsResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RunObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListRunsResponseToJson(_ListRunsResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_ModifyRunRequest _$ModifyRunRequestFromJson(Map<String, dynamic> json) =>
    _ModifyRunRequest(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ModifyRunRequestToJson(_ModifyRunRequest instance) =>
    <String, dynamic>{
      if (instance.metadata case final value?) 'metadata': value,
    };

_SubmitToolOutputsRunRequest _$SubmitToolOutputsRunRequestFromJson(
        Map<String, dynamic> json) =>
    _SubmitToolOutputsRunRequest(
      toolOutputs: (json['tool_outputs'] as List<dynamic>)
          .map((e) => RunSubmitToolOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$SubmitToolOutputsRunRequestToJson(
        _SubmitToolOutputsRunRequest instance) =>
    <String, dynamic>{
      'tool_outputs': instance.toolOutputs.map((e) => e.toJson()).toList(),
      if (instance.stream case final value?) 'stream': value,
    };

_RunSubmitToolOutput _$RunSubmitToolOutputFromJson(Map<String, dynamic> json) =>
    _RunSubmitToolOutput(
      toolCallId: json['tool_call_id'] as String?,
      output: json['output'] as String?,
    );

Map<String, dynamic> _$RunSubmitToolOutputToJson(
        _RunSubmitToolOutput instance) =>
    <String, dynamic>{
      if (instance.toolCallId case final value?) 'tool_call_id': value,
      if (instance.output case final value?) 'output': value,
    };

_RunToolCallObject _$RunToolCallObjectFromJson(Map<String, dynamic> json) =>
    _RunToolCallObject(
      id: json['id'] as String,
      type: $enumDecode(_$RunToolCallObjectTypeEnumMap, json['type']),
      function: RunToolCallFunction.fromJson(
          json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunToolCallObjectToJson(_RunToolCallObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RunToolCallObjectTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$RunToolCallObjectTypeEnumMap = {
  RunToolCallObjectType.function: 'function',
};

_RunToolCallFunction _$RunToolCallFunctionFromJson(Map<String, dynamic> json) =>
    _RunToolCallFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$RunToolCallFunctionToJson(
        _RunToolCallFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

_CreateThreadAndRunRequest _$CreateThreadAndRunRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateThreadAndRunRequest(
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

Map<String, dynamic> _$CreateThreadAndRunRequestToJson(
        _CreateThreadAndRunRequest instance) =>
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

ThreadAndRunModelEnumeration _$ThreadAndRunModelEnumerationFromJson(
        Map<String, dynamic> json) =>
    ThreadAndRunModelEnumeration(
      $enumDecode(_$ThreadAndRunModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ThreadAndRunModelEnumerationToJson(
        ThreadAndRunModelEnumeration instance) =>
    <String, dynamic>{
      'value': _$ThreadAndRunModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ThreadAndRunModelsEnumMap = {
  ThreadAndRunModels.gpt5: 'gpt-5',
  ThreadAndRunModels.gpt5Mini: 'gpt-5-mini',
  ThreadAndRunModels.gpt5Nano: 'gpt-5-nano',
  ThreadAndRunModels.gpt520250807: 'gpt-5-2025-08-07',
  ThreadAndRunModels.gpt5Mini20250807: 'gpt-5-mini-2025-08-07',
  ThreadAndRunModels.gpt5Nano20250807: 'gpt-5-nano-2025-08-07',
  ThreadAndRunModels.gpt5ChatLatest: 'gpt-5-chat-latest',
  ThreadAndRunModels.gpt41: 'gpt-4.1',
  ThreadAndRunModels.gpt41Mini: 'gpt-4.1-mini',
  ThreadAndRunModels.gpt41Nano: 'gpt-4.1-nano',
  ThreadAndRunModels.gpt4120250414: 'gpt-4.1-2025-04-14',
  ThreadAndRunModels.gpt41Mini20250414: 'gpt-4.1-mini-2025-04-14',
  ThreadAndRunModels.gpt41Nano20250414: 'gpt-4.1-nano-2025-04-14',
  ThreadAndRunModels.o4Mini: 'o4-mini',
  ThreadAndRunModels.o4Mini20250416: 'o4-mini-2025-04-16',
  ThreadAndRunModels.o3: 'o3',
  ThreadAndRunModels.o320250416: 'o3-2025-04-16',
  ThreadAndRunModels.o3Mini: 'o3-mini',
  ThreadAndRunModels.o3Mini20250131: 'o3-mini-2025-01-31',
  ThreadAndRunModels.o1: 'o1',
  ThreadAndRunModels.o120241217: 'o1-2024-12-17',
  ThreadAndRunModels.o1Preview: 'o1-preview',
  ThreadAndRunModels.o1Preview20240912: 'o1-preview-2024-09-12',
  ThreadAndRunModels.o1Mini: 'o1-mini',
  ThreadAndRunModels.o1Mini20240912: 'o1-mini-2024-09-12',
  ThreadAndRunModels.gpt4o: 'gpt-4o',
  ThreadAndRunModels.gpt4o20241120: 'gpt-4o-2024-11-20',
  ThreadAndRunModels.gpt4o20240806: 'gpt-4o-2024-08-06',
  ThreadAndRunModels.gpt4o20240513: 'gpt-4o-2024-05-13',
  ThreadAndRunModels.gpt4oAudioPreview: 'gpt-4o-audio-preview',
  ThreadAndRunModels.gpt4oAudioPreview20241001:
      'gpt-4o-audio-preview-2024-10-01',
  ThreadAndRunModels.gpt4oAudioPreview20241217:
      'gpt-4o-audio-preview-2024-12-17',
  ThreadAndRunModels.gpt4oAudioPreview20250603:
      'gpt-4o-audio-preview-2025-06-03',
  ThreadAndRunModels.gpt4oMiniAudioPreview: 'gpt-4o-mini-audio-preview',
  ThreadAndRunModels.gpt4oMiniAudioPreview20241217:
      'gpt-4o-mini-audio-preview-2024-12-17',
  ThreadAndRunModels.gpt4oSearchPreview: 'gpt-4o-search-preview',
  ThreadAndRunModels.gpt4oMiniSearchPreview: 'gpt-4o-mini-search-preview',
  ThreadAndRunModels.gpt4oSearchPreview20250311:
      'gpt-4o-search-preview-2025-03-11',
  ThreadAndRunModels.gpt4oMiniSearchPreview20250311:
      'gpt-4o-mini-search-preview-2025-03-11',
  ThreadAndRunModels.chatgpt4oLatest: 'chatgpt-4o-latest',
  ThreadAndRunModels.codexMiniLatest: 'codex-mini-latest',
  ThreadAndRunModels.gpt4oMini: 'gpt-4o-mini',
  ThreadAndRunModels.gpt4oMini20240718: 'gpt-4o-mini-2024-07-18',
  ThreadAndRunModels.gpt45Preview: 'gpt-4.5-preview',
  ThreadAndRunModels.gpt45Preview20250227: 'gpt-4.5-preview-2025-02-27',
  ThreadAndRunModels.gpt4Turbo: 'gpt-4-turbo',
  ThreadAndRunModels.gpt4Turbo20240409: 'gpt-4-turbo-2024-04-09',
  ThreadAndRunModels.gpt40125Preview: 'gpt-4-0125-preview',
  ThreadAndRunModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  ThreadAndRunModels.gpt41106Preview: 'gpt-4-1106-preview',
  ThreadAndRunModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ThreadAndRunModels.gpt4: 'gpt-4',
  ThreadAndRunModels.gpt40314: 'gpt-4-0314',
  ThreadAndRunModels.gpt40613: 'gpt-4-0613',
  ThreadAndRunModels.gpt432k: 'gpt-4-32k',
  ThreadAndRunModels.gpt432k0314: 'gpt-4-32k-0314',
  ThreadAndRunModels.gpt432k0613: 'gpt-4-32k-0613',
  ThreadAndRunModels.gpt35Turbo: 'gpt-3.5-turbo',
  ThreadAndRunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ThreadAndRunModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ThreadAndRunModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ThreadAndRunModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  ThreadAndRunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ThreadAndRunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
};

ThreadAndRunModelString _$ThreadAndRunModelStringFromJson(
        Map<String, dynamic> json) =>
    ThreadAndRunModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ThreadAndRunModelStringToJson(
        ThreadAndRunModelString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

CreateThreadAndRunRequestToolChoiceEnumeration
    _$CreateThreadAndRunRequestToolChoiceEnumerationFromJson(
            Map<String, dynamic> json) =>
        CreateThreadAndRunRequestToolChoiceEnumeration(
          $enumDecode(
              _$CreateThreadAndRunRequestToolChoiceModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateThreadAndRunRequestToolChoiceEnumerationToJson(
        CreateThreadAndRunRequestToolChoiceEnumeration instance) =>
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

CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice
    _$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceFromJson(
            Map<String, dynamic> json) =>
        CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice(
          AssistantsNamedToolChoice.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoiceToJson(
            CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

CreateThreadAndRunRequestResponseFormatEnumeration
    _$CreateThreadAndRunRequestResponseFormatEnumerationFromJson(
            Map<String, dynamic> json) =>
        CreateThreadAndRunRequestResponseFormatEnumeration(
          $enumDecode(_$CreateThreadAndRunRequestResponseFormatModeEnumMap,
              json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateThreadAndRunRequestResponseFormatEnumerationToJson(
        CreateThreadAndRunRequestResponseFormatEnumeration instance) =>
    <String, dynamic>{
      'value':
          _$CreateThreadAndRunRequestResponseFormatModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$CreateThreadAndRunRequestResponseFormatModeEnumMap = {
  CreateThreadAndRunRequestResponseFormatMode.auto: 'auto',
};

CreateThreadAndRunRequestResponseFormatResponseFormat
    _$CreateThreadAndRunRequestResponseFormatResponseFormatFromJson(
            Map<String, dynamic> json) =>
        CreateThreadAndRunRequestResponseFormatResponseFormat(
          ResponseFormat.fromJson(json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$CreateThreadAndRunRequestResponseFormatResponseFormatToJson(
            CreateThreadAndRunRequestResponseFormatResponseFormat instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_ThreadObject _$ThreadObjectFromJson(Map<String, dynamic> json) =>
    _ThreadObject(
      id: json['id'] as String,
      object: $enumDecode(_$ThreadObjectObjectEnumMap, json['object']),
      createdAt: (json['created_at'] as num).toInt(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ThreadObjectToJson(_ThreadObject instance) =>
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

_CreateThreadRequest _$CreateThreadRequestFromJson(Map<String, dynamic> json) =>
    _CreateThreadRequest(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => CreateMessageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateThreadRequestToJson(
        _CreateThreadRequest instance) =>
    <String, dynamic>{
      if (instance.messages?.map((e) => e.toJson()).toList() case final value?)
        'messages': value,
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_ModifyThreadRequest _$ModifyThreadRequestFromJson(Map<String, dynamic> json) =>
    _ModifyThreadRequest(
      toolResources: json['tool_resources'] == null
          ? null
          : ToolResources.fromJson(
              json['tool_resources'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ModifyThreadRequestToJson(
        _ModifyThreadRequest instance) =>
    <String, dynamic>{
      if (instance.toolResources?.toJson() case final value?)
        'tool_resources': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_ToolResources _$ToolResourcesFromJson(Map<String, dynamic> json) =>
    _ToolResources(
      codeInterpreter: json['code_interpreter'] == null
          ? null
          : ToolResourcesCodeInterpreter.fromJson(
              json['code_interpreter'] as Map<String, dynamic>),
      fileSearch: json['file_search'] == null
          ? null
          : ToolResourcesFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolResourcesToJson(_ToolResources instance) =>
    <String, dynamic>{
      if (instance.codeInterpreter?.toJson() case final value?)
        'code_interpreter': value,
      if (instance.fileSearch?.toJson() case final value?) 'file_search': value,
    };

_ToolResourcesCodeInterpreter _$ToolResourcesCodeInterpreterFromJson(
        Map<String, dynamic> json) =>
    _ToolResourcesCodeInterpreter(
      fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ToolResourcesCodeInterpreterToJson(
        _ToolResourcesCodeInterpreter instance) =>
    <String, dynamic>{
      'file_ids': instance.fileIds,
    };

_ToolResourcesFileSearch _$ToolResourcesFileSearchFromJson(
        Map<String, dynamic> json) =>
    _ToolResourcesFileSearch(
      vectorStoreIds: (json['vector_store_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vectorStores: (json['vector_stores'] as List<dynamic>?)
          ?.map((e) => ToolResourcesFileSearchVectorStore.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ToolResourcesFileSearchToJson(
        _ToolResourcesFileSearch instance) =>
    <String, dynamic>{
      if (instance.vectorStoreIds case final value?) 'vector_store_ids': value,
      if (instance.vectorStores?.map((e) => e.toJson()).toList()
          case final value?)
        'vector_stores': value,
    };

_ToolResourcesFileSearchVectorStore
    _$ToolResourcesFileSearchVectorStoreFromJson(Map<String, dynamic> json) =>
        _ToolResourcesFileSearchVectorStore(
          fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          chunkingStrategy: json['chunking_strategy'] == null
              ? null
              : ChunkingStrategyRequestParam.fromJson(
                  json['chunking_strategy'] as Map<String, dynamic>),
          metadata: json['metadata'],
        );

Map<String, dynamic> _$ToolResourcesFileSearchVectorStoreToJson(
        _ToolResourcesFileSearchVectorStore instance) =>
    <String, dynamic>{
      if (instance.fileIds case final value?) 'file_ids': value,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_DeleteThreadResponse _$DeleteThreadResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteThreadResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: $enumDecode(_$DeleteThreadResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$DeleteThreadResponseToJson(
        _DeleteThreadResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteThreadResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteThreadResponseObjectEnumMap = {
  DeleteThreadResponseObject.threadDeleted: 'thread.deleted',
};

_ListThreadsResponse _$ListThreadsResponseFromJson(Map<String, dynamic> json) =>
    _ListThreadsResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ThreadObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListThreadsResponseToJson(
        _ListThreadsResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_MessageObject _$MessageObjectFromJson(Map<String, dynamic> json) =>
    _MessageObject(
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

Map<String, dynamic> _$MessageObjectToJson(_MessageObject instance) =>
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

_MessageObjectIncompleteDetails _$MessageObjectIncompleteDetailsFromJson(
        Map<String, dynamic> json) =>
    _MessageObjectIncompleteDetails(
      reason: $enumDecode(
          _$MessageObjectIncompleteDetailsReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$MessageObjectIncompleteDetailsToJson(
        _MessageObjectIncompleteDetails instance) =>
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

_MessageAttachment _$MessageAttachmentFromJson(Map<String, dynamic> json) =>
    _MessageAttachment(
      fileId: json['file_id'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageAttachmentToJson(_MessageAttachment instance) =>
    <String, dynamic>{
      if (instance.fileId case final value?) 'file_id': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
    };

_MessageDeltaObject _$MessageDeltaObjectFromJson(Map<String, dynamic> json) =>
    _MessageDeltaObject(
      id: json['id'] as String,
      object: $enumDecode(_$MessageDeltaObjectObjectEnumMap, json['object']),
      delta: MessageDelta.fromJson(json['delta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageDeltaObjectToJson(_MessageDeltaObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$MessageDeltaObjectObjectEnumMap[instance.object]!,
      'delta': instance.delta.toJson(),
    };

const _$MessageDeltaObjectObjectEnumMap = {
  MessageDeltaObjectObject.threadMessageDelta: 'thread.message.delta',
};

_MessageDelta _$MessageDeltaFromJson(Map<String, dynamic> json) =>
    _MessageDelta(
      role: $enumDecodeNullable(_$MessageRoleEnumMap, json['role'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => MessageDeltaContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageDeltaToJson(_MessageDelta instance) =>
    <String, dynamic>{
      if (_$MessageRoleEnumMap[instance.role] case final value?) 'role': value,
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
    };

_CreateMessageRequest _$CreateMessageRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateMessageRequest(
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      content: const _CreateMessageRequestContentConverter()
          .fromJson(json['content']),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateMessageRequestToJson(
        _CreateMessageRequest instance) =>
    <String, dynamic>{
      'role': _$MessageRoleEnumMap[instance.role]!,
      'content': const _CreateMessageRequestContentConverter()
          .toJson(instance.content),
      if (instance.attachments?.map((e) => e.toJson()).toList()
          case final value?)
        'attachments': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

CreateMessageRequestContentListMessageContent
    _$CreateMessageRequestContentListMessageContentFromJson(
            Map<String, dynamic> json) =>
        CreateMessageRequestContentListMessageContent(
          (json['value'] as List<dynamic>)
              .map((e) => MessageContent.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$CreateMessageRequestContentListMessageContentToJson(
        CreateMessageRequestContentListMessageContent instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

CreateMessageRequestContentString _$CreateMessageRequestContentStringFromJson(
        Map<String, dynamic> json) =>
    CreateMessageRequestContentString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateMessageRequestContentStringToJson(
        CreateMessageRequestContentString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ModifyMessageRequest _$ModifyMessageRequestFromJson(
        Map<String, dynamic> json) =>
    _ModifyMessageRequest(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ModifyMessageRequestToJson(
        _ModifyMessageRequest instance) =>
    <String, dynamic>{
      if (instance.metadata case final value?) 'metadata': value,
    };

_DeleteMessageResponse _$DeleteMessageResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteMessageResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: $enumDecode(_$DeleteMessageResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$DeleteMessageResponseToJson(
        _DeleteMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteMessageResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteMessageResponseObjectEnumMap = {
  DeleteMessageResponseObject.threadMessageDeleted: 'thread.message.deleted',
};

_ListMessagesResponse _$ListMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    _ListMessagesResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListMessagesResponseToJson(
        _ListMessagesResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_MessageContentImageFile _$MessageContentImageFileFromJson(
        Map<String, dynamic> json) =>
    _MessageContentImageFile(
      fileId: json['file_id'] as String,
      detail: $enumDecodeNullable(
              _$MessageContentImageDetailEnumMap, json['detail']) ??
          MessageContentImageDetail.auto,
    );

Map<String, dynamic> _$MessageContentImageFileToJson(
        _MessageContentImageFile instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'detail': _$MessageContentImageDetailEnumMap[instance.detail]!,
    };

const _$MessageContentImageDetailEnumMap = {
  MessageContentImageDetail.auto: 'auto',
  MessageContentImageDetail.low: 'low',
  MessageContentImageDetail.high: 'high',
};

_MessageContentImageUrl _$MessageContentImageUrlFromJson(
        Map<String, dynamic> json) =>
    _MessageContentImageUrl(
      url: json['url'] as String,
      detail: $enumDecodeNullable(
              _$MessageContentImageDetailEnumMap, json['detail']) ??
          MessageContentImageDetail.auto,
    );

Map<String, dynamic> _$MessageContentImageUrlToJson(
        _MessageContentImageUrl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'detail': _$MessageContentImageDetailEnumMap[instance.detail]!,
    };

_MessageRequestContentTextObject _$MessageRequestContentTextObjectFromJson(
        Map<String, dynamic> json) =>
    _MessageRequestContentTextObject(
      type: json['type'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$MessageRequestContentTextObjectToJson(
        _MessageRequestContentTextObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

_MessageContentText _$MessageContentTextFromJson(Map<String, dynamic> json) =>
    _MessageContentText(
      value: json['value'] as String,
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) =>
              MessageContentTextAnnotations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageContentTextToJson(_MessageContentText instance) =>
    <String, dynamic>{
      'value': instance.value,
      if (instance.annotations?.map((e) => e.toJson()).toList()
          case final value?)
        'annotations': value,
    };

_MessageContentTextAnnotationsFileCitation
    _$MessageContentTextAnnotationsFileCitationFromJson(
            Map<String, dynamic> json) =>
        _MessageContentTextAnnotationsFileCitation(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$MessageContentTextAnnotationsFileCitationToJson(
        _MessageContentTextAnnotationsFileCitation instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_MessageDeltaContentText _$MessageDeltaContentTextFromJson(
        Map<String, dynamic> json) =>
    _MessageDeltaContentText(
      value: json['value'] as String?,
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) => MessageDeltaContentTextAnnotations.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageDeltaContentTextToJson(
        _MessageDeltaContentText instance) =>
    <String, dynamic>{
      if (instance.value case final value?) 'value': value,
      if (instance.annotations?.map((e) => e.toJson()).toList()
          case final value?)
        'annotations': value,
    };

_MessageDeltaContentTextAnnotationsFileCitation
    _$MessageDeltaContentTextAnnotationsFileCitationFromJson(
            Map<String, dynamic> json) =>
        _MessageDeltaContentTextAnnotationsFileCitation(
          fileId: json['file_id'] as String?,
          quote: json['quote'] as String?,
        );

Map<String, dynamic> _$MessageDeltaContentTextAnnotationsFileCitationToJson(
        _MessageDeltaContentTextAnnotationsFileCitation instance) =>
    <String, dynamic>{
      if (instance.fileId case final value?) 'file_id': value,
      if (instance.quote case final value?) 'quote': value,
    };

_RunStepObject _$RunStepObjectFromJson(Map<String, dynamic> json) =>
    _RunStepObject(
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

Map<String, dynamic> _$RunStepObjectToJson(_RunStepObject instance) =>
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

_RunStepLastError _$RunStepLastErrorFromJson(Map<String, dynamic> json) =>
    _RunStepLastError(
      code: $enumDecode(_$RunStepLastErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$RunStepLastErrorToJson(_RunStepLastError instance) =>
    <String, dynamic>{
      'code': _$RunStepLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$RunStepLastErrorCodeEnumMap = {
  RunStepLastErrorCode.serverError: 'server_error',
  RunStepLastErrorCode.rateLimitExceeded: 'rate_limit_exceeded',
};

_RunStepDeltaObject _$RunStepDeltaObjectFromJson(Map<String, dynamic> json) =>
    _RunStepDeltaObject(
      id: json['id'] as String,
      object: $enumDecode(_$RunStepDeltaObjectObjectEnumMap, json['object']),
      delta: RunStepDelta.fromJson(json['delta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStepDeltaObjectToJson(_RunStepDeltaObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$RunStepDeltaObjectObjectEnumMap[instance.object]!,
      'delta': instance.delta.toJson(),
    };

const _$RunStepDeltaObjectObjectEnumMap = {
  RunStepDeltaObjectObject.threadRunStepDelta: 'thread.run.step.delta',
};

_RunStepDelta _$RunStepDeltaFromJson(Map<String, dynamic> json) =>
    _RunStepDelta(
      stepDetails: json['step_details'] == null
          ? null
          : RunStepDeltaDetails.fromJson(
              json['step_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStepDeltaToJson(_RunStepDelta instance) =>
    <String, dynamic>{
      if (instance.stepDetails?.toJson() case final value?)
        'step_details': value,
    };

_ListRunStepsResponse _$ListRunStepsResponseFromJson(
        Map<String, dynamic> json) =>
    _ListRunStepsResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RunStepObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListRunStepsResponseToJson(
        _ListRunStepsResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_RunStepDetailsMessageCreation _$RunStepDetailsMessageCreationFromJson(
        Map<String, dynamic> json) =>
    _RunStepDetailsMessageCreation(
      messageId: json['message_id'] as String,
    );

Map<String, dynamic> _$RunStepDetailsMessageCreationToJson(
        _RunStepDetailsMessageCreation instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
    };

_RunStepDeltaStepDetailsMessageCreation
    _$RunStepDeltaStepDetailsMessageCreationFromJson(
            Map<String, dynamic> json) =>
        _RunStepDeltaStepDetailsMessageCreation(
          messageId: json['message_id'] as String?,
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsMessageCreationToJson(
        _RunStepDeltaStepDetailsMessageCreation instance) =>
    <String, dynamic>{
      if (instance.messageId case final value?) 'message_id': value,
    };

_RunStepDetailsToolCallsCodeObjectCodeInterpreter
    _$RunStepDetailsToolCallsCodeObjectCodeInterpreterFromJson(
            Map<String, dynamic> json) =>
        _RunStepDetailsToolCallsCodeObjectCodeInterpreter(
          input: json['input'] as String,
          outputs: (json['outputs'] as List<dynamic>)
              .map((e) => RunStepDetailsToolCallsCodeOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RunStepDetailsToolCallsCodeObjectCodeInterpreterToJson(
        _RunStepDetailsToolCallsCodeObjectCodeInterpreter instance) =>
    <String, dynamic>{
      'input': instance.input,
      'outputs': instance.outputs.map((e) => e.toJson()).toList(),
    };

_RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter
    _$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterFromJson(
            Map<String, dynamic> json) =>
        _RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter(
          input: json['input'] as String?,
          outputs: (json['outputs'] as List<dynamic>?)
              ?.map((e) => RunStepDeltaStepDetailsToolCallsCodeOutput.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String,
    dynamic> _$RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreterToJson(
        _RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter instance) =>
    <String, dynamic>{
      if (instance.input case final value?) 'input': value,
      if (instance.outputs?.map((e) => e.toJson()).toList() case final value?)
        'outputs': value,
    };

_RunStepDetailsToolCallsCodeOutputImage
    _$RunStepDetailsToolCallsCodeOutputImageFromJson(
            Map<String, dynamic> json) =>
        _RunStepDetailsToolCallsCodeOutputImage(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$RunStepDetailsToolCallsCodeOutputImageToJson(
        _RunStepDetailsToolCallsCodeOutputImage instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_RunStepDeltaStepDetailsToolCallsCodeOutputImage
    _$RunStepDeltaStepDetailsToolCallsCodeOutputImageFromJson(
            Map<String, dynamic> json) =>
        _RunStepDeltaStepDetailsToolCallsCodeOutputImage(
          fileId: json['file_id'] as String?,
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsCodeOutputImageToJson(
        _RunStepDeltaStepDetailsToolCallsCodeOutputImage instance) =>
    <String, dynamic>{
      if (instance.fileId case final value?) 'file_id': value,
    };

_RunStepDetailsToolCallsFileSearch _$RunStepDetailsToolCallsFileSearchFromJson(
        Map<String, dynamic> json) =>
    _RunStepDetailsToolCallsFileSearch(
      rankingOptions: json['ranking_options'] == null
          ? null
          : RunStepDetailsToolCallsFileSearchRankingOptionsObject.fromJson(
              json['ranking_options'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => RunStepDetailsToolCallsFileSearchResultObject.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RunStepDetailsToolCallsFileSearchToJson(
        _RunStepDetailsToolCallsFileSearch instance) =>
    <String, dynamic>{
      if (instance.rankingOptions?.toJson() case final value?)
        'ranking_options': value,
      if (instance.results?.map((e) => e.toJson()).toList() case final value?)
        'results': value,
    };

_RunStepDetailsToolCallsFileSearchRankingOptionsObject
    _$RunStepDetailsToolCallsFileSearchRankingOptionsObjectFromJson(
            Map<String, dynamic> json) =>
        _RunStepDetailsToolCallsFileSearchRankingOptionsObject(
          ranker: $enumDecode(_$FileSearchRankerEnumMap, json['ranker']),
          scoreThreshold: (json['score_threshold'] as num).toDouble(),
        );

Map<String, dynamic>
    _$RunStepDetailsToolCallsFileSearchRankingOptionsObjectToJson(
            _RunStepDetailsToolCallsFileSearchRankingOptionsObject instance) =>
        <String, dynamic>{
          'ranker': _$FileSearchRankerEnumMap[instance.ranker]!,
          'score_threshold': instance.scoreThreshold,
        };

_RunStepDetailsToolCallsFileSearchResultObject
    _$RunStepDetailsToolCallsFileSearchResultObjectFromJson(
            Map<String, dynamic> json) =>
        _RunStepDetailsToolCallsFileSearchResultObject(
          fileId: json['file_id'] as String,
          fileName: json['file_name'] as String,
          score: (json['score'] as num).toDouble(),
          content: (json['content'] as List<dynamic>?)
              ?.map((e) =>
                  RunStepDetailsToolCallsFileSearchResultContent.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RunStepDetailsToolCallsFileSearchResultObjectToJson(
        _RunStepDetailsToolCallsFileSearchResultObject instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'file_name': instance.fileName,
      'score': instance.score,
      if (instance.content?.map((e) => e.toJson()).toList() case final value?)
        'content': value,
    };

_RunStepDetailsToolCallsFileSearchResultContent
    _$RunStepDetailsToolCallsFileSearchResultContentFromJson(
            Map<String, dynamic> json) =>
        _RunStepDetailsToolCallsFileSearchResultContent(
          type: json['type'] as String? ?? 'text',
          text: json['text'] as String?,
        );

Map<String, dynamic> _$RunStepDetailsToolCallsFileSearchResultContentToJson(
        _RunStepDetailsToolCallsFileSearchResultContent instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.text case final value?) 'text': value,
    };

_RunStepCompletionUsage _$RunStepCompletionUsageFromJson(
        Map<String, dynamic> json) =>
    _RunStepCompletionUsage(
      completionTokens: (json['completion_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$RunStepCompletionUsageToJson(
        _RunStepCompletionUsage instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_VectorStoreExpirationAfter _$VectorStoreExpirationAfterFromJson(
        Map<String, dynamic> json) =>
    _VectorStoreExpirationAfter(
      anchor: $enumDecode(
          _$VectorStoreExpirationAfterAnchorEnumMap, json['anchor']),
      days: (json['days'] as num).toInt(),
    );

Map<String, dynamic> _$VectorStoreExpirationAfterToJson(
        _VectorStoreExpirationAfter instance) =>
    <String, dynamic>{
      'anchor': _$VectorStoreExpirationAfterAnchorEnumMap[instance.anchor]!,
      'days': instance.days,
    };

const _$VectorStoreExpirationAfterAnchorEnumMap = {
  VectorStoreExpirationAfterAnchor.lastActiveAt: 'last_active_at',
};

_VectorStoreObject _$VectorStoreObjectFromJson(Map<String, dynamic> json) =>
    _VectorStoreObject(
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

Map<String, dynamic> _$VectorStoreObjectToJson(_VectorStoreObject instance) =>
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

_VectorStoreObjectFileCounts _$VectorStoreObjectFileCountsFromJson(
        Map<String, dynamic> json) =>
    _VectorStoreObjectFileCounts(
      inProgress: (json['in_progress'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
      cancelled: (json['cancelled'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$VectorStoreObjectFileCountsToJson(
        _VectorStoreObjectFileCounts instance) =>
    <String, dynamic>{
      'in_progress': instance.inProgress,
      'completed': instance.completed,
      'failed': instance.failed,
      'cancelled': instance.cancelled,
      'total': instance.total,
    };

_CreateVectorStoreRequest _$CreateVectorStoreRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateVectorStoreRequest(
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

Map<String, dynamic> _$CreateVectorStoreRequestToJson(
        _CreateVectorStoreRequest instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.fileIds case final value?) 'file_ids': value,
      if (instance.expiresAfter?.toJson() case final value?)
        'expires_after': value,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_UpdateVectorStoreRequest _$UpdateVectorStoreRequestFromJson(
        Map<String, dynamic> json) =>
    _UpdateVectorStoreRequest(
      name: json['name'] as String?,
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$UpdateVectorStoreRequestToJson(
        _UpdateVectorStoreRequest instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.expiresAfter?.toJson() case final value?)
        'expires_after': value,
      if (instance.metadata case final value?) 'metadata': value,
    };

_ListVectorStoresResponse _$ListVectorStoresResponseFromJson(
        Map<String, dynamic> json) =>
    _ListVectorStoresResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VectorStoreObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListVectorStoresResponseToJson(
        _ListVectorStoresResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_DeleteVectorStoreResponse _$DeleteVectorStoreResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteVectorStoreResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: json['object'] as String,
    );

Map<String, dynamic> _$DeleteVectorStoreResponseToJson(
        _DeleteVectorStoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_VectorStoreFileObject _$VectorStoreFileObjectFromJson(
        Map<String, dynamic> json) =>
    _VectorStoreFileObject(
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

Map<String, dynamic> _$VectorStoreFileObjectToJson(
        _VectorStoreFileObject instance) =>
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

_VectorStoreFileObjectLastError _$VectorStoreFileObjectLastErrorFromJson(
        Map<String, dynamic> json) =>
    _VectorStoreFileObjectLastError(
      code: $enumDecode(
          _$VectorStoreFileObjectLastErrorCodeEnumMap, json['code']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$VectorStoreFileObjectLastErrorToJson(
        _VectorStoreFileObjectLastError instance) =>
    <String, dynamic>{
      'code': _$VectorStoreFileObjectLastErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$VectorStoreFileObjectLastErrorCodeEnumMap = {
  VectorStoreFileObjectLastErrorCode.serverError: 'server_error',
  VectorStoreFileObjectLastErrorCode.unsupportedFile: 'unsupported_file',
  VectorStoreFileObjectLastErrorCode.invalidFile: 'invalid_file',
};

_StaticChunkingStrategy _$StaticChunkingStrategyFromJson(
        Map<String, dynamic> json) =>
    _StaticChunkingStrategy(
      maxChunkSizeTokens: (json['max_chunk_size_tokens'] as num).toInt(),
      chunkOverlapTokens: (json['chunk_overlap_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$StaticChunkingStrategyToJson(
        _StaticChunkingStrategy instance) =>
    <String, dynamic>{
      'max_chunk_size_tokens': instance.maxChunkSizeTokens,
      'chunk_overlap_tokens': instance.chunkOverlapTokens,
    };

_CreateVectorStoreFileRequest _$CreateVectorStoreFileRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateVectorStoreFileRequest(
      fileId: json['file_id'] as String,
      chunkingStrategy: json['chunking_strategy'] == null
          ? null
          : ChunkingStrategyRequestParam.fromJson(
              json['chunking_strategy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateVectorStoreFileRequestToJson(
        _CreateVectorStoreFileRequest instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
    };

_ListVectorStoreFilesResponse _$ListVectorStoreFilesResponseFromJson(
        Map<String, dynamic> json) =>
    _ListVectorStoreFilesResponse(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VectorStoreFileObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$ListVectorStoreFilesResponseToJson(
        _ListVectorStoreFilesResponse instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      if (instance.firstId case final value?) 'first_id': value,
      if (instance.lastId case final value?) 'last_id': value,
      'has_more': instance.hasMore,
    };

_DeleteVectorStoreFileResponse _$DeleteVectorStoreFileResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteVectorStoreFileResponse(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: json['object'] as String,
    );

Map<String, dynamic> _$DeleteVectorStoreFileResponseToJson(
        _DeleteVectorStoreFileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': instance.object,
    };

_VectorStoreFileBatchObject _$VectorStoreFileBatchObjectFromJson(
        Map<String, dynamic> json) =>
    _VectorStoreFileBatchObject(
      id: json['id'] as String,
      object: json['object'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      vectorStoreId: json['vector_store_id'] as String,
      status: $enumDecode(
          _$VectorStoreFileBatchObjectStatusEnumMap, json['status']),
      fileCounts: VectorStoreFileBatchObjectFileCounts.fromJson(
          json['file_counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VectorStoreFileBatchObjectToJson(
        _VectorStoreFileBatchObject instance) =>
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

_VectorStoreFileBatchObjectFileCounts
    _$VectorStoreFileBatchObjectFileCountsFromJson(Map<String, dynamic> json) =>
        _VectorStoreFileBatchObjectFileCounts(
          inProgress: (json['in_progress'] as num).toInt(),
          completed: (json['completed'] as num).toInt(),
          failed: (json['failed'] as num).toInt(),
          cancelled: (json['cancelled'] as num).toInt(),
          total: (json['total'] as num).toInt(),
        );

Map<String, dynamic> _$VectorStoreFileBatchObjectFileCountsToJson(
        _VectorStoreFileBatchObjectFileCounts instance) =>
    <String, dynamic>{
      'in_progress': instance.inProgress,
      'completed': instance.completed,
      'failed': instance.failed,
      'cancelled': instance.cancelled,
      'total': instance.total,
    };

_CreateVectorStoreFileBatchRequest _$CreateVectorStoreFileBatchRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateVectorStoreFileBatchRequest(
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      chunkingStrategy: json['chunking_strategy'] == null
          ? null
          : ChunkingStrategyRequestParam.fromJson(
              json['chunking_strategy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateVectorStoreFileBatchRequestToJson(
        _CreateVectorStoreFileBatchRequest instance) =>
    <String, dynamic>{
      'file_ids': instance.fileIds,
      if (instance.chunkingStrategy?.toJson() case final value?)
        'chunking_strategy': value,
    };

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
      code: json['code'] as String?,
      message: json['message'] as String,
      param: json['param'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
      'type': instance.type,
    };

_CreateBatchRequest _$CreateBatchRequestFromJson(Map<String, dynamic> json) =>
    _CreateBatchRequest(
      inputFileId: json['input_file_id'] as String,
      endpoint: $enumDecode(_$BatchEndpointEnumMap, json['endpoint']),
      completionWindow: $enumDecode(
          _$BatchCompletionWindowEnumMap, json['completion_window']),
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$CreateBatchRequestToJson(_CreateBatchRequest instance) =>
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

_Batch _$BatchFromJson(Map<String, dynamic> json) => _Batch(
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

Map<String, dynamic> _$BatchToJson(_Batch instance) => <String, dynamic>{
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

_BatchErrors _$BatchErrorsFromJson(Map<String, dynamic> json) => _BatchErrors(
      object: json['object'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BatchErrorsDataInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchErrorsToJson(_BatchErrors instance) =>
    <String, dynamic>{
      if (instance.object case final value?) 'object': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };

_BatchRequestCounts _$BatchRequestCountsFromJson(Map<String, dynamic> json) =>
    _BatchRequestCounts(
      total: (json['total'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
    );

Map<String, dynamic> _$BatchRequestCountsToJson(_BatchRequestCounts instance) =>
    <String, dynamic>{
      'total': instance.total,
      'completed': instance.completed,
      'failed': instance.failed,
    };

_BatchErrorsDataInner _$BatchErrorsDataInnerFromJson(
        Map<String, dynamic> json) =>
    _BatchErrorsDataInner(
      code: json['code'] as String?,
      message: json['message'] as String?,
      param: json['param'] as String?,
      line: (json['line'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BatchErrorsDataInnerToJson(
        _BatchErrorsDataInner instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.param case final value?) 'param': value,
      if (instance.line case final value?) 'line': value,
    };

_ListBatchesResponse _$ListBatchesResponseFromJson(Map<String, dynamic> json) =>
    _ListBatchesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
      hasMore: json['has_more'] as bool,
      object: $enumDecode(_$ListBatchesResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$ListBatchesResponseToJson(
        _ListBatchesResponse instance) =>
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

_WebSearchOptions _$WebSearchOptionsFromJson(Map<String, dynamic> json) =>
    _WebSearchOptions(
      userLocation: json['user_location'] == null
          ? null
          : WebSearchOptionsUserLocation.fromJson(
              json['user_location'] as Map<String, dynamic>),
      searchContextSize: $enumDecodeNullable(
              _$WebSearchContextSizeEnumMap, json['search_context_size']) ??
          WebSearchContextSize.medium,
    );

Map<String, dynamic> _$WebSearchOptionsToJson(_WebSearchOptions instance) =>
    <String, dynamic>{
      if (instance.userLocation?.toJson() case final value?)
        'user_location': value,
      'search_context_size':
          _$WebSearchContextSizeEnumMap[instance.searchContextSize]!,
    };

const _$WebSearchContextSizeEnumMap = {
  WebSearchContextSize.low: 'low',
  WebSearchContextSize.medium: 'medium',
  WebSearchContextSize.high: 'high',
};

_WebSearchOptionsUserLocation _$WebSearchOptionsUserLocationFromJson(
        Map<String, dynamic> json) =>
    _WebSearchOptionsUserLocation(
      type:
          $enumDecode(_$WebSearchOptionsUserLocationTypeEnumMap, json['type']),
      approximate: WebSearchLocation.fromJson(
          json['approximate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebSearchOptionsUserLocationToJson(
        _WebSearchOptionsUserLocation instance) =>
    <String, dynamic>{
      'type': _$WebSearchOptionsUserLocationTypeEnumMap[instance.type]!,
      'approximate': instance.approximate.toJson(),
    };

const _$WebSearchOptionsUserLocationTypeEnumMap = {
  WebSearchOptionsUserLocationType.approximate: 'approximate',
};

_WebSearchLocation _$WebSearchLocationFromJson(Map<String, dynamic> json) =>
    _WebSearchLocation(
      country: json['country'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$WebSearchLocationToJson(_WebSearchLocation instance) =>
    <String, dynamic>{
      if (instance.country case final value?) 'country': value,
      if (instance.region case final value?) 'region': value,
      if (instance.city case final value?) 'city': value,
      if (instance.timezone case final value?) 'timezone': value,
    };

ChatCompletionDeveloperMessage _$ChatCompletionDeveloperMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionDeveloperMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.developer,
      content: const _ChatCompletionDeveloperMessageContentConverter()
          .fromJson(json['content']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ChatCompletionDeveloperMessageToJson(
        ChatCompletionDeveloperMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': const _ChatCompletionDeveloperMessageContentConverter()
          .toJson(instance.content),
      if (instance.name case final value?) 'name': value,
    };

ChatCompletionSystemMessage _$ChatCompletionSystemMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionSystemMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.system,
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ChatCompletionSystemMessageToJson(
        ChatCompletionSystemMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      if (instance.name case final value?) 'name': value,
    };

ChatCompletionUserMessage _$ChatCompletionUserMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionUserMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.user,
      content: const _ChatCompletionUserMessageContentConverter()
          .fromJson(json['content']),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ChatCompletionUserMessageToJson(
        ChatCompletionUserMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': const _ChatCompletionUserMessageContentConverter()
          .toJson(instance.content),
      if (instance.name case final value?) 'name': value,
    };

ChatCompletionAssistantMessage _$ChatCompletionAssistantMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionAssistantMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.assistant,
      content: json['content'] as String?,
      refusal: json['refusal'] as String?,
      name: json['name'] as String?,
      toolCalls: (json['tool_calls'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionMessageToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotations: (json['annotations'] as List<dynamic>?)
          ?.map((e) => Annotation.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ChatCompletionAssistantMessageToJson(
        ChatCompletionAssistantMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      if (instance.content case final value?) 'content': value,
      if (instance.refusal case final value?) 'refusal': value,
      if (instance.name case final value?) 'name': value,
      if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
        'tool_calls': value,
      if (instance.annotations?.map((e) => e.toJson()).toList()
          case final value?)
        'annotations': value,
      if (instance.functionCall?.toJson() case final value?)
        'function_call': value,
      if (instance.audio?.toJson() case final value?) 'audio': value,
    };

ChatCompletionToolMessage _$ChatCompletionToolMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionToolMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.tool,
      content: json['content'] as String,
      toolCallId: json['tool_call_id'] as String,
    );

Map<String, dynamic> _$ChatCompletionToolMessageToJson(
        ChatCompletionToolMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'tool_call_id': instance.toolCallId,
    };

ChatCompletionFunctionMessage _$ChatCompletionFunctionMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionFunctionMessage(
      role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role']) ??
          ChatCompletionMessageRole.function,
      content: json['content'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ChatCompletionFunctionMessageToJson(
        ChatCompletionFunctionMessage instance) =>
    <String, dynamic>{
      'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
      'content': instance.content,
      'name': instance.name,
    };

ChatCompletionDeveloperMessageContentParts
    _$ChatCompletionDeveloperMessageContentPartsFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionDeveloperMessageContentParts(
          (json['value'] as List<dynamic>)
              .map((e) => ChatCompletionMessageContentPart.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ChatCompletionDeveloperMessageContentPartsToJson(
        ChatCompletionDeveloperMessageContentParts instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

ChatCompletionDeveloperMessageContentString
    _$ChatCompletionDeveloperMessageContentStringFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionDeveloperMessageContentString(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ChatCompletionDeveloperMessageContentStringToJson(
        ChatCompletionDeveloperMessageContentString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

ChatCompletionMessageContentParts _$ChatCompletionMessageContentPartsFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionMessageContentParts(
      (json['value'] as List<dynamic>)
          .map((e) => ChatCompletionMessageContentPart.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChatCompletionMessageContentPartsToJson(
        ChatCompletionMessageContentParts instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

ChatCompletionUserMessageContentString
    _$ChatCompletionUserMessageContentStringFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionUserMessageContentString(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$ChatCompletionUserMessageContentStringToJson(
        ChatCompletionUserMessageContentString instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ChatCompletionAssistantMessageAudio
    _$ChatCompletionAssistantMessageAudioFromJson(Map<String, dynamic> json) =>
        _ChatCompletionAssistantMessageAudio(
          id: json['id'] as String,
          expiresAt: (json['expires_at'] as num).toInt(),
          data: json['data'] as String,
          transcript: json['transcript'] as String,
        );

Map<String, dynamic> _$ChatCompletionAssistantMessageAudioToJson(
        _ChatCompletionAssistantMessageAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expires_at': instance.expiresAt,
      'data': instance.data,
      'transcript': instance.transcript,
    };

ChatCompletionMessageContentPartText
    _$ChatCompletionMessageContentPartTextFromJson(Map<String, dynamic> json) =>
        ChatCompletionMessageContentPartText(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.text,
          text: json['text'] as String,
        );

Map<String, dynamic> _$ChatCompletionMessageContentPartTextToJson(
        ChatCompletionMessageContentPartText instance) =>
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

ChatCompletionMessageContentPartImage
    _$ChatCompletionMessageContentPartImageFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionMessageContentPartImage(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.imageUrl,
          imageUrl: ChatCompletionMessageImageUrl.fromJson(
              json['image_url'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ChatCompletionMessageContentPartImageToJson(
        ChatCompletionMessageContentPartImage instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'image_url': instance.imageUrl.toJson(),
    };

ChatCompletionMessageContentPartAudio
    _$ChatCompletionMessageContentPartAudioFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionMessageContentPartAudio(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.inputAudio,
          inputAudio: ChatCompletionMessageInputAudio.fromJson(
              json['input_audio'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ChatCompletionMessageContentPartAudioToJson(
        ChatCompletionMessageContentPartAudio instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'input_audio': instance.inputAudio.toJson(),
    };

ChatCompletionMessageContentPartRefusal
    _$ChatCompletionMessageContentPartRefusalFromJson(
            Map<String, dynamic> json) =>
        ChatCompletionMessageContentPartRefusal(
          type: $enumDecodeNullable(
                  _$ChatCompletionMessageContentPartTypeEnumMap,
                  json['type']) ??
              ChatCompletionMessageContentPartType.refusal,
          refusal: json['refusal'] as String,
        );

Map<String, dynamic> _$ChatCompletionMessageContentPartRefusalToJson(
        ChatCompletionMessageContentPartRefusal instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionMessageContentPartTypeEnumMap[instance.type]!,
      'refusal': instance.refusal,
    };

_ChatCompletionMessageImageUrl _$ChatCompletionMessageImageUrlFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionMessageImageUrl(
      url: json['url'] as String,
      detail: $enumDecodeNullable(
              _$ChatCompletionMessageImageDetailEnumMap, json['detail']) ??
          ChatCompletionMessageImageDetail.auto,
    );

Map<String, dynamic> _$ChatCompletionMessageImageUrlToJson(
        _ChatCompletionMessageImageUrl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'detail': _$ChatCompletionMessageImageDetailEnumMap[instance.detail]!,
    };

const _$ChatCompletionMessageImageDetailEnumMap = {
  ChatCompletionMessageImageDetail.auto: 'auto',
  ChatCompletionMessageImageDetail.low: 'low',
  ChatCompletionMessageImageDetail.high: 'high',
};

_ChatCompletionMessageInputAudio _$ChatCompletionMessageInputAudioFromJson(
        Map<String, dynamic> json) =>
    _ChatCompletionMessageInputAudio(
      data: json['data'] as String,
      format: $enumDecode(
          _$ChatCompletionMessageInputAudioFormatEnumMap, json['format']),
    );

Map<String, dynamic> _$ChatCompletionMessageInputAudioToJson(
        _ChatCompletionMessageInputAudio instance) =>
    <String, dynamic>{
      'data': instance.data,
      'format':
          _$ChatCompletionMessageInputAudioFormatEnumMap[instance.format]!,
    };

const _$ChatCompletionMessageInputAudioFormatEnumMap = {
  ChatCompletionMessageInputAudioFormat.wav: 'wav',
  ChatCompletionMessageInputAudioFormat.mp3: 'mp3',
};

ResponseFormatText _$ResponseFormatTextFromJson(Map<String, dynamic> json) =>
    ResponseFormatText(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.text,
    );

Map<String, dynamic> _$ResponseFormatTextToJson(ResponseFormatText instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
    };

const _$ResponseFormatTypeEnumMap = {
  ResponseFormatType.text: 'text',
  ResponseFormatType.jsonObject: 'json_object',
  ResponseFormatType.jsonSchema: 'json_schema',
};

ResponseFormatJsonObject _$ResponseFormatJsonObjectFromJson(
        Map<String, dynamic> json) =>
    ResponseFormatJsonObject(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.jsonObject,
    );

Map<String, dynamic> _$ResponseFormatJsonObjectToJson(
        ResponseFormatJsonObject instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
    };

ResponseFormatJsonSchema _$ResponseFormatJsonSchemaFromJson(
        Map<String, dynamic> json) =>
    ResponseFormatJsonSchema(
      type: $enumDecodeNullable(_$ResponseFormatTypeEnumMap, json['type']) ??
          ResponseFormatType.jsonSchema,
      jsonSchema: JsonSchemaObject.fromJson(
          json['json_schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseFormatJsonSchemaToJson(
        ResponseFormatJsonSchema instance) =>
    <String, dynamic>{
      'type': _$ResponseFormatTypeEnumMap[instance.type]!,
      'json_schema': instance.jsonSchema.toJson(),
    };

ModerationInputObjectImageUrl _$ModerationInputObjectImageUrlFromJson(
        Map<String, dynamic> json) =>
    ModerationInputObjectImageUrl(
      type: $enumDecodeNullable(
              _$ModerationInputObjectTypeEnumMap, json['type']) ??
          ModerationInputObjectType.imageUrl,
      imageUrl: ModerationInputObjectImageUrlImageUrl.fromJson(
          json['image_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModerationInputObjectImageUrlToJson(
        ModerationInputObjectImageUrl instance) =>
    <String, dynamic>{
      'type': _$ModerationInputObjectTypeEnumMap[instance.type]!,
      'image_url': instance.imageUrl.toJson(),
    };

const _$ModerationInputObjectTypeEnumMap = {
  ModerationInputObjectType.imageUrl: 'image_url',
  ModerationInputObjectType.text: 'text',
};

ModerationInputObjectText _$ModerationInputObjectTextFromJson(
        Map<String, dynamic> json) =>
    ModerationInputObjectText(
      type: $enumDecodeNullable(
              _$ModerationInputObjectTypeEnumMap, json['type']) ??
          ModerationInputObjectType.text,
      text: json['text'] as String,
    );

Map<String, dynamic> _$ModerationInputObjectTextToJson(
        ModerationInputObjectText instance) =>
    <String, dynamic>{
      'type': _$ModerationInputObjectTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

_ModerationInputObjectImageUrlImageUrl
    _$ModerationInputObjectImageUrlImageUrlFromJson(
            Map<String, dynamic> json) =>
        _ModerationInputObjectImageUrlImageUrl(
          url: json['url'] as String,
        );

Map<String, dynamic> _$ModerationInputObjectImageUrlImageUrlToJson(
        _ModerationInputObjectImageUrlImageUrl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

AssistantToolsCodeInterpreter _$AssistantToolsCodeInterpreterFromJson(
        Map<String, dynamic> json) =>
    AssistantToolsCodeInterpreter(
      type: json['type'] as String? ?? 'code_interpreter',
    );

Map<String, dynamic> _$AssistantToolsCodeInterpreterToJson(
        AssistantToolsCodeInterpreter instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

AssistantToolsFileSearch _$AssistantToolsFileSearchFromJson(
        Map<String, dynamic> json) =>
    AssistantToolsFileSearch(
      type: json['type'] as String,
      fileSearch: json['file_search'] == null
          ? null
          : AssistantToolsFileSearchFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssistantToolsFileSearchToJson(
        AssistantToolsFileSearch instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.fileSearch?.toJson() case final value?) 'file_search': value,
    };

AssistantToolsFunction _$AssistantToolsFunctionFromJson(
        Map<String, dynamic> json) =>
    AssistantToolsFunction(
      type: json['type'] as String? ?? 'function',
      function:
          FunctionObject.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssistantToolsFunctionToJson(
        AssistantToolsFunction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'function': instance.function.toJson(),
    };

_AssistantToolsFileSearchFileSearch
    _$AssistantToolsFileSearchFileSearchFromJson(Map<String, dynamic> json) =>
        _AssistantToolsFileSearchFileSearch(
          maxNumResults: (json['max_num_results'] as num?)?.toInt(),
          rankingOptions: json['ranking_options'] == null
              ? null
              : FileSearchRankingOptions.fromJson(
                  json['ranking_options'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$AssistantToolsFileSearchFileSearchToJson(
        _AssistantToolsFileSearchFileSearch instance) =>
    <String, dynamic>{
      if (instance.maxNumResults case final value?) 'max_num_results': value,
      if (instance.rankingOptions?.toJson() case final value?)
        'ranking_options': value,
    };

MessageContentImageFileObject _$MessageContentImageFileObjectFromJson(
        Map<String, dynamic> json) =>
    MessageContentImageFileObject(
      type: json['type'] as String? ?? 'image_file',
      imageFile: MessageContentImageFile.fromJson(
          json['image_file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageContentImageFileObjectToJson(
        MessageContentImageFileObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image_file': instance.imageFile.toJson(),
    };

MessageContentImageUrlObject _$MessageContentImageUrlObjectFromJson(
        Map<String, dynamic> json) =>
    MessageContentImageUrlObject(
      type: json['type'] as String? ?? 'image_url',
      imageUrl: MessageContentImageUrl.fromJson(
          json['image_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageContentImageUrlObjectToJson(
        MessageContentImageUrlObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image_url': instance.imageUrl.toJson(),
    };

MessageContentTextObject _$MessageContentTextObjectFromJson(
        Map<String, dynamic> json) =>
    MessageContentTextObject(
      type: json['type'] as String? ?? 'text',
      text: MessageContentText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageContentTextObjectToJson(
        MessageContentTextObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text.toJson(),
    };

MessageContentRefusalObject _$MessageContentRefusalObjectFromJson(
        Map<String, dynamic> json) =>
    MessageContentRefusalObject(
      type: json['type'] as String,
      refusal: json['refusal'] as String,
    );

Map<String, dynamic> _$MessageContentRefusalObjectToJson(
        MessageContentRefusalObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'refusal': instance.refusal,
    };

MessageDeltaContentImageFileObject _$MessageDeltaContentImageFileObjectFromJson(
        Map<String, dynamic> json) =>
    MessageDeltaContentImageFileObject(
      index: (json['index'] as num).toInt(),
      type: json['type'] as String,
      imageFile: json['image_file'] == null
          ? null
          : MessageContentImageFile.fromJson(
              json['image_file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageDeltaContentImageFileObjectToJson(
        MessageDeltaContentImageFileObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.imageFile?.toJson() case final value?) 'image_file': value,
    };

MessageDeltaContentTextObject _$MessageDeltaContentTextObjectFromJson(
        Map<String, dynamic> json) =>
    MessageDeltaContentTextObject(
      index: (json['index'] as num).toInt(),
      type: json['type'] as String,
      text: json['text'] == null
          ? null
          : MessageDeltaContentText.fromJson(
              json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageDeltaContentTextObjectToJson(
        MessageDeltaContentTextObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.text?.toJson() case final value?) 'text': value,
    };

MessageDeltaContentRefusalObject _$MessageDeltaContentRefusalObjectFromJson(
        Map<String, dynamic> json) =>
    MessageDeltaContentRefusalObject(
      index: (json['index'] as num).toInt(),
      type: json['type'] as String,
      refusal: json['refusal'] as String?,
    );

Map<String, dynamic> _$MessageDeltaContentRefusalObjectToJson(
        MessageDeltaContentRefusalObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.refusal case final value?) 'refusal': value,
    };

MessageDeltaContentImageUrlObject _$MessageDeltaContentImageUrlObjectFromJson(
        Map<String, dynamic> json) =>
    MessageDeltaContentImageUrlObject(
      index: (json['index'] as num).toInt(),
      type: json['type'] as String,
      imageUrl: json['image_url'] == null
          ? null
          : MessageContentImageUrl.fromJson(
              json['image_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageDeltaContentImageUrlObjectToJson(
        MessageDeltaContentImageUrlObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.imageUrl?.toJson() case final value?) 'image_url': value,
    };

MessageContentTextAnnotationsFileCitationObject
    _$MessageContentTextAnnotationsFileCitationObjectFromJson(
            Map<String, dynamic> json) =>
        MessageContentTextAnnotationsFileCitationObject(
          type: json['type'] as String,
          text: json['text'] as String,
          fileCitation: MessageContentTextAnnotationsFileCitation.fromJson(
              json['file_citation'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num).toInt(),
          endIndex: (json['end_index'] as num).toInt(),
        );

Map<String, dynamic> _$MessageContentTextAnnotationsFileCitationObjectToJson(
        MessageContentTextAnnotationsFileCitationObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'file_citation': instance.fileCitation.toJson(),
      'start_index': instance.startIndex,
      'end_index': instance.endIndex,
    };

MessageContentTextAnnotationsFilePathObject
    _$MessageContentTextAnnotationsFilePathObjectFromJson(
            Map<String, dynamic> json) =>
        MessageContentTextAnnotationsFilePathObject(
          type: json['type'] as String,
          text: json['text'] as String,
          filePath: MessageContentTextAnnotationsFilePath.fromJson(
              json['file_path'] as Map<String, dynamic>),
          startIndex: (json['start_index'] as num).toInt(),
          endIndex: (json['end_index'] as num).toInt(),
        );

Map<String, dynamic> _$MessageContentTextAnnotationsFilePathObjectToJson(
        MessageContentTextAnnotationsFilePathObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'file_path': instance.filePath.toJson(),
      'start_index': instance.startIndex,
      'end_index': instance.endIndex,
    };

_MessageContentTextAnnotationsFilePath
    _$MessageContentTextAnnotationsFilePathFromJson(
            Map<String, dynamic> json) =>
        _MessageContentTextAnnotationsFilePath(
          fileId: json['file_id'] as String,
        );

Map<String, dynamic> _$MessageContentTextAnnotationsFilePathToJson(
        _MessageContentTextAnnotationsFilePath instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

MessageDeltaContentTextAnnotationsFileCitationObject
    _$MessageDeltaContentTextAnnotationsFileCitationObjectFromJson(
            Map<String, dynamic> json) =>
        MessageDeltaContentTextAnnotationsFileCitationObject(
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

Map<String, dynamic>
    _$MessageDeltaContentTextAnnotationsFileCitationObjectToJson(
            MessageDeltaContentTextAnnotationsFileCitationObject instance) =>
        <String, dynamic>{
          'index': instance.index,
          'type': instance.type,
          if (instance.text case final value?) 'text': value,
          if (instance.fileCitation?.toJson() case final value?)
            'file_citation': value,
          if (instance.startIndex case final value?) 'start_index': value,
          if (instance.endIndex case final value?) 'end_index': value,
        };

MessageDeltaContentTextAnnotationsFilePathObject
    _$MessageDeltaContentTextAnnotationsFilePathObjectFromJson(
            Map<String, dynamic> json) =>
        MessageDeltaContentTextAnnotationsFilePathObject(
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

Map<String, dynamic> _$MessageDeltaContentTextAnnotationsFilePathObjectToJson(
        MessageDeltaContentTextAnnotationsFilePathObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      if (instance.text case final value?) 'text': value,
      if (instance.filePath?.toJson() case final value?) 'file_path': value,
      if (instance.startIndex case final value?) 'start_index': value,
      if (instance.endIndex case final value?) 'end_index': value,
    };

_MessageDeltaContentTextAnnotationsFilePathObjectFilePath
    _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathFromJson(
            Map<String, dynamic> json) =>
        _MessageDeltaContentTextAnnotationsFilePathObjectFilePath(
          fileId: json['file_id'] as String?,
        );

Map<String,
    dynamic> _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathToJson(
        _MessageDeltaContentTextAnnotationsFilePathObjectFilePath instance) =>
    <String, dynamic>{
      if (instance.fileId case final value?) 'file_id': value,
    };

RunStepDetailsMessageCreationObject
    _$RunStepDetailsMessageCreationObjectFromJson(Map<String, dynamic> json) =>
        RunStepDetailsMessageCreationObject(
          type: json['type'] as String,
          messageCreation: RunStepDetailsMessageCreation.fromJson(
              json['message_creation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDetailsMessageCreationObjectToJson(
        RunStepDetailsMessageCreationObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'message_creation': instance.messageCreation.toJson(),
    };

RunStepDetailsToolCallsObject _$RunStepDetailsToolCallsObjectFromJson(
        Map<String, dynamic> json) =>
    RunStepDetailsToolCallsObject(
      type: json['type'] as String,
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) =>
              RunStepDetailsToolCalls.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RunStepDetailsToolCallsObjectToJson(
        RunStepDetailsToolCallsObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tool_calls': instance.toolCalls.map((e) => e.toJson()).toList(),
    };

RunStepDeltaStepDetailsMessageCreationObject
    _$RunStepDeltaStepDetailsMessageCreationObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsMessageCreationObject(
          type: json['type'] as String,
          messageCreation: json['message_creation'] == null
              ? null
              : RunStepDeltaStepDetailsMessageCreation.fromJson(
                  json['message_creation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsMessageCreationObjectToJson(
        RunStepDeltaStepDetailsMessageCreationObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.messageCreation?.toJson() case final value?)
        'message_creation': value,
    };

RunStepDeltaStepDetailsToolCallsObject
    _$RunStepDeltaStepDetailsToolCallsObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsObject(
          type: json['type'] as String,
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => RunStepDeltaStepDetailsToolCalls.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsObjectToJson(
        RunStepDeltaStepDetailsToolCallsObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
        'tool_calls': value,
    };

RunStepDetailsToolCallsCodeObject _$RunStepDetailsToolCallsCodeObjectFromJson(
        Map<String, dynamic> json) =>
    RunStepDetailsToolCallsCodeObject(
      id: json['id'] as String,
      type: json['type'] as String,
      codeInterpreter:
          RunStepDetailsToolCallsCodeObjectCodeInterpreter.fromJson(
              json['code_interpreter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStepDetailsToolCallsCodeObjectToJson(
        RunStepDetailsToolCallsCodeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code_interpreter': instance.codeInterpreter.toJson(),
    };

RunStepDetailsToolCallsFileSearchObject
    _$RunStepDetailsToolCallsFileSearchObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDetailsToolCallsFileSearchObject(
          id: json['id'] as String,
          type: json['type'] as String,
          fileSearch: RunStepDetailsToolCallsFileSearch.fromJson(
              json['file_search'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDetailsToolCallsFileSearchObjectToJson(
        RunStepDetailsToolCallsFileSearchObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'file_search': instance.fileSearch.toJson(),
    };

RunStepDetailsToolCallsFunctionObject
    _$RunStepDetailsToolCallsFunctionObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDetailsToolCallsFunctionObject(
          id: json['id'] as String,
          type: json['type'] as String,
          function: RunStepDetailsToolCallsFunction.fromJson(
              json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDetailsToolCallsFunctionObjectToJson(
        RunStepDetailsToolCallsFunctionObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function.toJson(),
    };

_RunStepDetailsToolCallsFunction _$RunStepDetailsToolCallsFunctionFromJson(
        Map<String, dynamic> json) =>
    _RunStepDetailsToolCallsFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
      output: json['output'] as String?,
    );

Map<String, dynamic> _$RunStepDetailsToolCallsFunctionToJson(
        _RunStepDetailsToolCallsFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
      'output': instance.output,
    };

RunStepDeltaStepDetailsToolCallsCodeObject
    _$RunStepDeltaStepDetailsToolCallsCodeObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsCodeObject(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          codeInterpreter: json['code_interpreter'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter
                  .fromJson(json['code_interpreter'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsCodeObjectToJson(
        RunStepDeltaStepDetailsToolCallsCodeObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      if (instance.id case final value?) 'id': value,
      'type': instance.type,
      if (instance.codeInterpreter?.toJson() case final value?)
        'code_interpreter': value,
    };

RunStepDeltaStepDetailsToolCallsFileSearchObject
    _$RunStepDeltaStepDetailsToolCallsFileSearchObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsFileSearchObject(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          fileSearch: json['file_search'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsFileSearchObjectToJson(
        RunStepDeltaStepDetailsToolCallsFileSearchObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      if (instance.id case final value?) 'id': value,
      'type': instance.type,
      'file_search': instance.fileSearch,
    };

RunStepDeltaStepDetailsToolCallsFunctionObject
    _$RunStepDeltaStepDetailsToolCallsFunctionObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsFunctionObject(
          index: (json['index'] as num).toInt(),
          id: json['id'] as String?,
          type: json['type'] as String,
          function: json['function'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsFunction.fromJson(
                  json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsFunctionObjectToJson(
        RunStepDeltaStepDetailsToolCallsFunctionObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      if (instance.id case final value?) 'id': value,
      'type': instance.type,
      if (instance.function?.toJson() case final value?) 'function': value,
    };

_RunStepDeltaStepDetailsToolCallsFunction
    _$RunStepDeltaStepDetailsToolCallsFunctionFromJson(
            Map<String, dynamic> json) =>
        _RunStepDeltaStepDetailsToolCallsFunction(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
          output: json['output'] as String?,
        );

Map<String, dynamic> _$RunStepDeltaStepDetailsToolCallsFunctionToJson(
        _RunStepDeltaStepDetailsToolCallsFunction instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.arguments case final value?) 'arguments': value,
      if (instance.output case final value?) 'output': value,
    };

RunStepDetailsToolCallsCodeOutputLogsObject
    _$RunStepDetailsToolCallsCodeOutputLogsObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDetailsToolCallsCodeOutputLogsObject(
          type: json['type'] as String,
          logs: json['logs'] as String,
        );

Map<String, dynamic> _$RunStepDetailsToolCallsCodeOutputLogsObjectToJson(
        RunStepDetailsToolCallsCodeOutputLogsObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'logs': instance.logs,
    };

RunStepDetailsToolCallsCodeOutputImageObject
    _$RunStepDetailsToolCallsCodeOutputImageObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDetailsToolCallsCodeOutputImageObject(
          type: json['type'] as String,
          image: RunStepDetailsToolCallsCodeOutputImage.fromJson(
              json['image'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RunStepDetailsToolCallsCodeOutputImageObjectToJson(
        RunStepDetailsToolCallsCodeOutputImageObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image': instance.image.toJson(),
    };

RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject
    _$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          logs: json['logs'] as String?,
        );

Map<String, dynamic>
    _$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectToJson(
            RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject instance) =>
        <String, dynamic>{
          'index': instance.index,
          'type': instance.type,
          if (instance.logs case final value?) 'logs': value,
        };

RunStepDeltaStepDetailsToolCallsCodeOutputImageObject
    _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectFromJson(
            Map<String, dynamic> json) =>
        RunStepDeltaStepDetailsToolCallsCodeOutputImageObject(
          index: (json['index'] as num).toInt(),
          type: json['type'] as String,
          image: json['image'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeOutputImage.fromJson(
                  json['image'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectToJson(
            RunStepDeltaStepDetailsToolCallsCodeOutputImageObject instance) =>
        <String, dynamic>{
          'index': instance.index,
          'type': instance.type,
          if (instance.image?.toJson() case final value?) 'image': value,
        };

AutoChunkingStrategyRequestParam _$AutoChunkingStrategyRequestParamFromJson(
        Map<String, dynamic> json) =>
    AutoChunkingStrategyRequestParam(
      type: json['type'] as String,
    );

Map<String, dynamic> _$AutoChunkingStrategyRequestParamToJson(
        AutoChunkingStrategyRequestParam instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

StaticChunkingStrategyRequestParam _$StaticChunkingStrategyRequestParamFromJson(
        Map<String, dynamic> json) =>
    StaticChunkingStrategyRequestParam(
      type: json['type'] as String,
      static: StaticChunkingStrategy.fromJson(
          json['static'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StaticChunkingStrategyRequestParamToJson(
        StaticChunkingStrategyRequestParam instance) =>
    <String, dynamic>{
      'type': instance.type,
      'static': instance.static.toJson(),
    };

StaticChunkingStrategyResponseParam
    _$StaticChunkingStrategyResponseParamFromJson(Map<String, dynamic> json) =>
        StaticChunkingStrategyResponseParam(
          type: json['type'] as String,
          static: StaticChunkingStrategy.fromJson(
              json['static'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$StaticChunkingStrategyResponseParamToJson(
        StaticChunkingStrategyResponseParam instance) =>
    <String, dynamic>{
      'type': instance.type,
      'static': instance.static.toJson(),
    };

OtherChunkingStrategyResponseParam _$OtherChunkingStrategyResponseParamFromJson(
        Map<String, dynamic> json) =>
    OtherChunkingStrategyResponseParam(
      type: json['type'] as String,
    );

Map<String, dynamic> _$OtherChunkingStrategyResponseParamToJson(
        OtherChunkingStrategyResponseParam instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

ThreadStreamEvent _$ThreadStreamEventFromJson(Map<String, dynamic> json) =>
    ThreadStreamEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: ThreadObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThreadStreamEventToJson(ThreadStreamEvent instance) =>
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

RunStreamEvent _$RunStreamEventFromJson(Map<String, dynamic> json) =>
    RunStreamEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStreamEventToJson(RunStreamEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

RunStepStreamEvent _$RunStepStreamEventFromJson(Map<String, dynamic> json) =>
    RunStepStreamEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunStepObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStepStreamEventToJson(RunStepStreamEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

RunStepStreamDeltaEvent _$RunStepStreamDeltaEventFromJson(
        Map<String, dynamic> json) =>
    RunStepStreamDeltaEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: RunStepDeltaObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RunStepStreamDeltaEventToJson(
        RunStepStreamDeltaEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

MessageStreamEvent _$MessageStreamEventFromJson(Map<String, dynamic> json) =>
    MessageStreamEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: MessageObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageStreamEventToJson(MessageStreamEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

MessageStreamDeltaEvent _$MessageStreamDeltaEventFromJson(
        Map<String, dynamic> json) =>
    MessageStreamDeltaEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: MessageDeltaObject.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageStreamDeltaEventToJson(
        MessageStreamDeltaEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

ErrorEvent _$ErrorEventFromJson(Map<String, dynamic> json) => ErrorEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: Error.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorEventToJson(ErrorEvent instance) =>
    <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data.toJson(),
    };

DoneEvent _$DoneEventFromJson(Map<String, dynamic> json) => DoneEvent(
      event: $enumDecode(_$EventTypeEnumMap, json['event']),
      data: json['data'] as String,
    );

Map<String, dynamic> _$DoneEventToJson(DoneEvent instance) => <String, dynamic>{
      'event': _$EventTypeEnumMap[instance.event]!,
      'data': instance.data,
    };
