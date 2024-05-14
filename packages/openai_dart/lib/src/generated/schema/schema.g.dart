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
      bestOf: json['best_of'] as int?,
      echo: json['echo'] as bool? ?? false,
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble() ?? 0.0,
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      logprobs: json['logprobs'] as int?,
      maxTokens: json['max_tokens'] as int? ?? 16,
      n: json['n'] as int? ?? 1,
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? 0.0,
      seed: json['seed'] as int?,
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
    _$CreateCompletionRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _CompletionModelConverter().toJson(instance.model),
    'prompt': _$JsonConverterToJson<Object?, CompletionPrompt>(
        instance.prompt, const _CompletionPromptConverter().toJson),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('best_of', instance.bestOf);
  writeNotNull('echo', instance.echo);
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('logit_bias', instance.logitBias);
  writeNotNull('logprobs', instance.logprobs);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('n', instance.n);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull('seed', instance.seed);
  writeNotNull('stop', const _CompletionStopConverter().toJson(instance.stop));
  writeNotNull('stream', instance.stream);
  writeNotNull('stream_options', instance.streamOptions?.toJson());
  writeNotNull('suffix', instance.suffix);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('user', instance.user);
  return val;
}

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
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
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
      (json['value'] as List<dynamic>).map((e) => e as int).toList(),
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
      created: json['created'] as int,
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String?,
      object:
          $enumDecode(_$CreateCompletionResponseObjectEnumMap, json['object']),
      usage: json['usage'] == null
          ? null
          : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateCompletionResponseImplToJson(
    _$CreateCompletionResponseImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'choices': instance.choices.map((e) => e.toJson()).toList(),
    'created': instance.created,
    'model': instance.model,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('system_fingerprint', instance.systemFingerprint);
  val['object'] = _$CreateCompletionResponseObjectEnumMap[instance.object]!;
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

const _$CreateCompletionResponseObjectEnumMap = {
  CreateCompletionResponseObject.textCompletion: 'text_completion',
};

_$CompletionChoiceImpl _$$CompletionChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionChoiceImpl(
      finishReason: $enumDecodeNullable(
          _$CompletionFinishReasonEnumMap, json['finish_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      index: json['index'] as int,
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
          ?.map((e) => e as int)
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
    _$CompletionLogprobsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text_offset', instance.textOffset);
  writeNotNull('token_logprobs', instance.tokenLogprobs);
  writeNotNull('tokens', instance.tokens);
  writeNotNull('top_logprobs', instance.topLogprobs);
  return val;
}

_$CreateChatCompletionRequestImpl _$$CreateChatCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatCompletionRequestImpl(
      model: const _ChatCompletionModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble() ?? 0.0,
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      logprobs: json['logprobs'] as bool?,
      topLogprobs: json['top_logprobs'] as int?,
      maxTokens: json['max_tokens'] as int?,
      n: json['n'] as int? ?? 1,
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? 0.0,
      responseFormat: json['response_format'] == null
          ? null
          : ChatCompletionResponseFormat.fromJson(
              json['response_format'] as Map<String, dynamic>),
      seed: json['seed'] as int?,
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
      user: json['user'] as String?,
      functionCall: const _ChatCompletionFunctionCallConverter()
          .fromJson(json['function_call']),
      functions: (json['functions'] as List<dynamic>?)
          ?.map((e) => FunctionObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateChatCompletionRequestImplToJson(
    _$CreateChatCompletionRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _ChatCompletionModelConverter().toJson(instance.model),
    'messages': instance.messages.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('logit_bias', instance.logitBias);
  writeNotNull('logprobs', instance.logprobs);
  writeNotNull('top_logprobs', instance.topLogprobs);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('n', instance.n);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull('response_format', instance.responseFormat?.toJson());
  writeNotNull('seed', instance.seed);
  writeNotNull(
      'stop', const _ChatCompletionStopConverter().toJson(instance.stop));
  writeNotNull('stream', instance.stream);
  writeNotNull('stream_options', instance.streamOptions?.toJson());
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tool_choice',
      const _ChatCompletionToolChoiceOptionConverter()
          .toJson(instance.toolChoice));
  writeNotNull('user', instance.user);
  writeNotNull(
      'function_call',
      const _ChatCompletionFunctionCallConverter()
          .toJson(instance.functionCall));
  writeNotNull(
      'functions', instance.functions?.map((e) => e.toJson()).toList());
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
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  ChatCompletionModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ChatCompletionModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
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

_$ChatCompletionResponseFormatImpl _$$ChatCompletionResponseFormatImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionResponseFormatImpl(
      type: $enumDecodeNullable(
              _$ChatCompletionResponseFormatTypeEnumMap, json['type']) ??
          ChatCompletionResponseFormatType.text,
    );

Map<String, dynamic> _$$ChatCompletionResponseFormatImplToJson(
        _$ChatCompletionResponseFormatImpl instance) =>
    <String, dynamic>{
      'type': _$ChatCompletionResponseFormatTypeEnumMap[instance.type]!,
    };

const _$ChatCompletionResponseFormatTypeEnumMap = {
  ChatCompletionResponseFormatType.text: 'text',
  ChatCompletionResponseFormatType.jsonObject: 'json_object',
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
    );

Map<String, dynamic> _$$FunctionObjectImplToJson(
    _$FunctionObjectImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  return val;
}

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

_$ChatCompletionStreamOptionsImpl _$$ChatCompletionStreamOptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionStreamOptionsImpl(
      includeUsage: json['include_usage'] as bool?,
    );

Map<String, dynamic> _$$ChatCompletionStreamOptionsImplToJson(
    _$ChatCompletionStreamOptionsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('include_usage', instance.includeUsage);
  return val;
}

_$CreateChatCompletionResponseImpl _$$CreateChatCompletionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatCompletionResponseImpl(
      id: json['id'] as String?,
      choices: (json['choices'] as List<dynamic>)
          .map((e) =>
              ChatCompletionResponseChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String?,
      object: json['object'] as String,
      usage: json['usage'] == null
          ? null
          : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateChatCompletionResponseImplToJson(
    _$CreateChatCompletionResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['choices'] = instance.choices.map((e) => e.toJson()).toList();
  val['created'] = instance.created;
  val['model'] = instance.model;
  writeNotNull('system_fingerprint', instance.systemFingerprint);
  val['object'] = instance.object;
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

_$ChatCompletionResponseChoiceImpl _$$ChatCompletionResponseChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionResponseChoiceImpl(
      finishReason: $enumDecodeNullable(
          _$ChatCompletionFinishReasonEnumMap, json['finish_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      index: json['index'] as int?,
      message: ChatCompletionAssistantMessage.fromJson(
          json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'] == null
          ? null
          : ChatCompletionLogprobs.fromJson(
              json['logprobs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCompletionResponseChoiceImplToJson(
    _$ChatCompletionResponseChoiceImpl instance) {
  final val = <String, dynamic>{
    'finish_reason': _$ChatCompletionFinishReasonEnumMap[instance.finishReason],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('index', instance.index);
  val['message'] = instance.message.toJson();
  val['logprobs'] = instance.logprobs?.toJson();
  return val;
}

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
    );

Map<String, dynamic> _$$ChatCompletionLogprobsImplToJson(
        _$ChatCompletionLogprobsImpl instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
    };

_$ChatCompletionTokenLogprobImpl _$$ChatCompletionTokenLogprobImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionTokenLogprobImpl(
      token: json['token'] as String,
      logprob: (json['logprob'] as num).toDouble(),
      bytes: (json['bytes'] as List<dynamic>?)?.map((e) => e as int).toList(),
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
          bytes:
              (json['bytes'] as List<dynamic>?)?.map((e) => e as int).toList(),
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
          created: json['created'] as int,
          model: json['model'] as String?,
          systemFingerprint: json['system_fingerprint'] as String?,
          object: json['object'] as String,
          usage: json['usage'] == null
              ? null
              : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateChatCompletionStreamResponseImplToJson(
    _$CreateChatCompletionStreamResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['choices'] = instance.choices.map((e) => e.toJson()).toList();
  val['created'] = instance.created;
  writeNotNull('model', instance.model);
  writeNotNull('system_fingerprint', instance.systemFingerprint);
  val['object'] = instance.object;
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

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
          index: json['index'] as int?,
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoiceImplToJson(
    _$ChatCompletionStreamResponseChoiceImpl instance) {
  final val = <String, dynamic>{
    'delta': instance.delta.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logprobs', instance.logprobs?.toJson());
  val['finish_reason'] =
      _$ChatCompletionFinishReasonEnumMap[instance.finishReason];
  writeNotNull('index', instance.index);
  return val;
}

_$ChatCompletionStreamResponseChoiceLogprobsImpl
    _$$ChatCompletionStreamResponseChoiceLogprobsImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseChoiceLogprobsImpl(
          content: (json['content'] as List<dynamic>?)
              ?.map((e) => ChatCompletionTokenLogprob.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoiceLogprobsImplToJson(
        _$ChatCompletionStreamResponseChoiceLogprobsImpl instance) =>
    <String, dynamic>{
      'content': instance.content?.map((e) => e.toJson()).toList(),
    };

_$ChatCompletionStreamResponseDeltaImpl
    _$$ChatCompletionStreamResponseDeltaImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseDeltaImpl(
          content: json['content'] as String?,
          functionCall: json['function_call'] == null
              ? null
              : ChatCompletionStreamMessageFunctionCall.fromJson(
                  json['function_call'] as Map<String, dynamic>),
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => ChatCompletionStreamMessageToolCallChunk.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          role: $enumDecodeNullable(
              _$ChatCompletionMessageRoleEnumMap, json['role'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseDeltaImplToJson(
    _$ChatCompletionStreamResponseDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('function_call', instance.functionCall?.toJson());
  writeNotNull(
      'tool_calls', instance.toolCalls?.map((e) => e.toJson()).toList());
  writeNotNull('role', _$ChatCompletionMessageRoleEnumMap[instance.role]);
  return val;
}

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
  ChatCompletionMessageRole.tool: 'tool',
  ChatCompletionMessageRole.function: 'function',
};

_$ChatCompletionStreamMessageFunctionCallImpl
    _$$ChatCompletionStreamMessageFunctionCallImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamMessageFunctionCallImpl(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionStreamMessageFunctionCallImplToJson(
    _$ChatCompletionStreamMessageFunctionCallImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('arguments', instance.arguments);
  return val;
}

_$ChatCompletionStreamMessageToolCallChunkImpl
    _$$ChatCompletionStreamMessageToolCallChunkImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamMessageToolCallChunkImpl(
          index: json['index'] as int,
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
    _$ChatCompletionStreamMessageToolCallChunkImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type',
      _$ChatCompletionStreamMessageToolCallChunkTypeEnumMap[instance.type]);
  writeNotNull('function', instance.function?.toJson());
  return val;
}

const _$ChatCompletionStreamMessageToolCallChunkTypeEnumMap = {
  ChatCompletionStreamMessageToolCallChunkType.function: 'function',
};

_$CompletionUsageImpl _$$CompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionUsageImpl(
      completionTokens: json['completion_tokens'] as int?,
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$CompletionUsageImplToJson(
        _$CompletionUsageImpl instance) =>
    <String, dynamic>{
      'completion_tokens': instance.completionTokens,
      'prompt_tokens': instance.promptTokens,
      'total_tokens': instance.totalTokens,
    };

_$CreateEmbeddingRequestImpl _$$CreateEmbeddingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEmbeddingRequestImpl(
      model: const _EmbeddingModelConverter().fromJson(json['model']),
      input: const _EmbeddingInputConverter().fromJson(json['input']),
      encodingFormat: $enumDecodeNullable(
              _$EmbeddingEncodingFormatEnumMap, json['encoding_format']) ??
          EmbeddingEncodingFormat.float,
      dimensions: json['dimensions'] as int?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateEmbeddingRequestImplToJson(
    _$CreateEmbeddingRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _EmbeddingModelConverter().toJson(instance.model),
    'input': const _EmbeddingInputConverter().toJson(instance.input),
    'encoding_format':
        _$EmbeddingEncodingFormatEnumMap[instance.encodingFormat]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dimensions', instance.dimensions);
  writeNotNull('user', instance.user);
  return val;
}

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
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
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
      (json['value'] as List<dynamic>).map((e) => e as int).toList(),
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
    _$CreateEmbeddingResponseImpl instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
    'model': instance.model,
    'object': _$CreateEmbeddingResponseObjectEnumMap[instance.object]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

const _$CreateEmbeddingResponseObjectEnumMap = {
  CreateEmbeddingResponseObject.list: 'list',
};

_$EmbeddingImpl _$$EmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingImpl(
      index: json['index'] as int,
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
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
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
      seed: json['seed'] as int?,
    );

Map<String, dynamic> _$$CreateFineTuningJobRequestImplToJson(
    _$CreateFineTuningJobRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _FineTuningModelConverter().toJson(instance.model),
    'training_file': instance.trainingFile,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hyperparameters', instance.hyperparameters?.toJson());
  writeNotNull('suffix', instance.suffix);
  writeNotNull('validation_file', instance.validationFile);
  writeNotNull(
      'integrations', instance.integrations?.map((e) => e.toJson()).toList());
  writeNotNull('seed', instance.seed);
  return val;
}

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
      createdAt: json['created_at'] as int,
      error: json['error'] == null
          ? null
          : FineTuningJobError.fromJson(json['error'] as Map<String, dynamic>),
      fineTunedModel: json['fine_tuned_model'] as String?,
      finishedAt: json['finished_at'] as int?,
      hyperparameters: FineTuningJobHyperparameters.fromJson(
          json['hyperparameters'] as Map<String, dynamic>),
      model: json['model'] as String,
      object: $enumDecode(_$FineTuningJobObjectEnumMap, json['object']),
      organizationId: json['organization_id'] as String,
      resultFiles: (json['result_files'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$FineTuningJobStatusEnumMap, json['status']),
      trainedTokens: json['trained_tokens'] as int?,
      trainingFile: json['training_file'] as String,
      validationFile: json['validation_file'] as String?,
      integrations: (json['integrations'] as List<dynamic>?)
          ?.map(
              (e) => FineTuningIntegration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FineTuningJobImplToJson(_$FineTuningJobImpl instance) {
  final val = <String, dynamic>{
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
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'integrations', instance.integrations?.map((e) => e.toJson()).toList());
  return val;
}

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
    _$FineTuningIntegrationWandbImpl instance) {
  final val = <String, dynamic>{
    'project': instance.project,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('entity', instance.entity);
  writeNotNull('tags', instance.tags);
  return val;
}

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
      json['value'] as int,
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
    _$ListFineTuningJobCheckpointsResponseImpl instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
    'object':
        _$ListFineTuningJobCheckpointsResponseObjectEnumMap[instance.object]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_id', instance.firstId);
  writeNotNull('last_id', instance.lastId);
  val['has_more'] = instance.hasMore;
  return val;
}

const _$ListFineTuningJobCheckpointsResponseObjectEnumMap = {
  ListFineTuningJobCheckpointsResponseObject.list: 'list',
};

_$FineTuningJobEventImpl _$$FineTuningJobEventImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobEventImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as int,
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
      createdAt: json['created_at'] as int,
      fineTunedModelCheckpoint: json['fine_tuned_model_checkpoint'] as String,
      stepNumber: json['step_number'] as int,
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
    _$FineTuningJobCheckpointMetricsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('step', instance.step);
  writeNotNull('train_loss', instance.trainLoss);
  writeNotNull('train_mean_token_accuracy', instance.trainMeanTokenAccuracy);
  writeNotNull('valid_loss', instance.validLoss);
  writeNotNull('valid_mean_token_accuracy', instance.validMeanTokenAccuracy);
  writeNotNull('full_valid_loss', instance.fullValidLoss);
  writeNotNull(
      'full_valid_mean_token_accuracy', instance.fullValidMeanTokenAccuracy);
  return val;
}

_$CreateImageRequestImpl _$$CreateImageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateImageRequestImpl(
      prompt: json['prompt'] as String,
      model: json['model'] == null
          ? const CreateImageRequestModelString('dall-e-2')
          : const _CreateImageRequestModelConverter().fromJson(json['model']),
      n: json['n'] as int? ?? 1,
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
    _$CreateImageRequestImpl instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model',
      const _CreateImageRequestModelConverter().toJson(instance.model));
  writeNotNull('n', instance.n);
  val['quality'] = _$ImageQualityEnumMap[instance.quality]!;
  writeNotNull(
      'response_format', _$ImageResponseFormatEnumMap[instance.responseFormat]);
  writeNotNull('size', _$ImageSizeEnumMap[instance.size]);
  writeNotNull('style', _$ImageStyleEnumMap[instance.style]);
  writeNotNull('user', instance.user);
  return val;
}

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
      created: json['created'] as int,
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

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('b64_json', instance.b64Json);
  writeNotNull('url', instance.url);
  writeNotNull('revised_prompt', instance.revisedPrompt);
  return val;
}

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      id: json['id'] as String,
      created: json['created'] as int,
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
          ? const ModerationModelString('text-moderation-latest')
          : const _ModerationModelConverter().fromJson(json['model']),
      input: const _ModerationInputConverter().fromJson(json['input']),
    );

Map<String, dynamic> _$$CreateModerationRequestImplToJson(
    _$CreateModerationRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _ModerationModelConverter().toJson(instance.model));
  val['input'] = const _ModerationInputConverter().toJson(instance.input);
  return val;
}

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
    );

Map<String, dynamic> _$$ModerationImplToJson(_$ModerationImpl instance) =>
    <String, dynamic>{
      'flagged': instance.flagged,
      'categories': instance.categories.toJson(),
      'category_scores': instance.categoryScores.toJson(),
    };

_$ModerationCategoriesImpl _$$ModerationCategoriesImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationCategoriesImpl(
      hate: json['hate'] as bool,
      hateThreatening: json['hate/threatening'] as bool,
      harassment: json['harassment'] as bool,
      harassmentThreatening: json['harassment/threatening'] as bool,
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
      createdAt: json['created_at'] as int,
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
    _$AssistantObjectImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': _$AssistantObjectObjectEnumMap[instance.object]!,
    'created_at': instance.createdAt,
    'name': instance.name,
    'description': instance.description,
    'model': instance.model,
    'instructions': instance.instructions,
    'tools': instance.tools.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tool_resources', instance.toolResources?.toJson());
  val['metadata'] = instance.metadata;
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull(
      'response_format',
      const _AssistantObjectResponseFormatConverter()
          .toJson(instance.responseFormat));
  return val;
}

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
  AssistantResponseFormatMode.none: 'none',
  AssistantResponseFormatMode.auto: 'auto',
};

_$AssistantObjectResponseFormatAssistantsResponseFormatImpl
    _$$AssistantObjectResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$AssistantObjectResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String,
    dynamic> _$$AssistantObjectResponseFormatAssistantsResponseFormatImplToJson(
        _$AssistantObjectResponseFormatAssistantsResponseFormatImpl instance) =>
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
    _$CreateAssistantRequestImpl instance) {
  final val = <String, dynamic>{
    'model': const _AssistantModelConverter().toJson(instance.model),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('instructions', instance.instructions);
  val['tools'] = instance.tools.map((e) => e.toJson()).toList();
  writeNotNull('tool_resources', instance.toolResources?.toJson());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull(
      'response_format',
      const _CreateAssistantRequestResponseFormatConverter()
          .toJson(instance.responseFormat));
  return val;
}

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
  AssistantModels.gpt35Turbo: 'gpt-3.5-turbo',
  AssistantModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  AssistantModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  AssistantModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  AssistantModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
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
  CreateAssistantResponseFormatMode.none: 'none',
  CreateAssistantResponseFormatMode.auto: 'auto',
};

_$CreateAssistantRequestResponseFormatAssistantsResponseFormatImpl
    _$$CreateAssistantRequestResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateAssistantRequestResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateAssistantRequestResponseFormatAssistantsResponseFormatImplToJson(
            _$CreateAssistantRequestResponseFormatAssistantsResponseFormatImpl
                instance) =>
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
    _$ModifyAssistantRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model', instance.model);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('instructions', instance.instructions);
  val['tools'] = instance.tools.map((e) => e.toJson()).toList();
  val['file_ids'] = instance.fileIds;
  writeNotNull('tool_resources', instance.toolResources?.toJson());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull(
      'response_format',
      const _ModifyAssistantRequestResponseFormatConverter()
          .toJson(instance.responseFormat));
  return val;
}

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
  ModifyAssistantResponseFormatMode.none: 'none',
  ModifyAssistantResponseFormatMode.auto: 'auto',
};

_$ModifyAssistantRequestResponseFormatAssistantsResponseFormatImpl
    _$$ModifyAssistantRequestResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$ModifyAssistantRequestResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$ModifyAssistantRequestResponseFormatAssistantsResponseFormatImplToJson(
            _$ModifyAssistantRequestResponseFormatAssistantsResponseFormatImpl
                instance) =>
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
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListAssistantsResponseImplToJson(
        _$ListAssistantsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
      'has_more': instance.hasMore,
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
    _$AssistantsNamedToolChoiceImpl instance) {
  final val = <String, dynamic>{
    'type': _$AssistantsToolTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('function', instance.function?.toJson());
  return val;
}

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

_$AssistantsResponseFormatImpl _$$AssistantsResponseFormatImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantsResponseFormatImpl(
      type: $enumDecodeNullable(
              _$AssistantsResponseFormatTypeEnumMap, json['type']) ??
          AssistantsResponseFormatType.text,
    );

Map<String, dynamic> _$$AssistantsResponseFormatImplToJson(
        _$AssistantsResponseFormatImpl instance) =>
    <String, dynamic>{
      'type': _$AssistantsResponseFormatTypeEnumMap[instance.type]!,
    };

const _$AssistantsResponseFormatTypeEnumMap = {
  AssistantsResponseFormatType.text: 'text',
  AssistantsResponseFormatType.jsonObject: 'json_object',
};

_$TruncationObjectImpl _$$TruncationObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$TruncationObjectImpl(
      type: $enumDecode(_$TruncationObjectTypeEnumMap, json['type']),
      lastMessages: json['last_messages'] as int?,
    );

Map<String, dynamic> _$$TruncationObjectImplToJson(
    _$TruncationObjectImpl instance) {
  final val = <String, dynamic>{
    'type': _$TruncationObjectTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_messages', instance.lastMessages);
  return val;
}

const _$TruncationObjectTypeEnumMap = {
  TruncationObjectType.auto: 'auto',
  TruncationObjectType.lastMessages: 'last_messages',
};

_$RunObjectImpl _$$RunObjectImplFromJson(Map<String, dynamic> json) =>
    _$RunObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$RunObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
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
      expiresAt: json['expires_at'] as int?,
      startedAt: json['started_at'] as int?,
      cancelledAt: json['cancelled_at'] as int?,
      failedAt: json['failed_at'] as int?,
      completedAt: json['completed_at'] as int?,
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
      maxPromptTokens: json['max_prompt_tokens'] as int?,
      maxCompletionTokens: json['max_completion_tokens'] as int?,
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice:
          const _RunObjectToolChoiceConverter().fromJson(json['tool_choice']),
      responseFormat: const _RunObjectResponseFormatConverter()
          .fromJson(json['response_format']),
    );

Map<String, dynamic> _$$RunObjectImplToJson(_$RunObjectImpl instance) {
  final val = <String, dynamic>{
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
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  val['max_prompt_tokens'] = instance.maxPromptTokens;
  val['max_completion_tokens'] = instance.maxCompletionTokens;
  val['truncation_strategy'] = instance.truncationStrategy?.toJson();
  val['tool_choice'] = _$JsonConverterToJson<Object?, RunObjectToolChoice>(
      instance.toolChoice, const _RunObjectToolChoiceConverter().toJson);
  val['response_format'] =
      const _RunObjectResponseFormatConverter().toJson(instance.responseFormat);
  return val;
}

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
    _$RunObjectIncompleteDetailsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'reason', _$RunObjectIncompleteDetailsReasonEnumMap[instance.reason]);
  return val;
}

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
  RunObjectResponseFormatMode.none: 'none',
  RunObjectResponseFormatMode.auto: 'auto',
};

_$RunObjectResponseFormatAssistantsResponseFormatImpl
    _$$RunObjectResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$RunObjectResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$RunObjectResponseFormatAssistantsResponseFormatImplToJson(
            _$RunObjectResponseFormatAssistantsResponseFormatImpl instance) =>
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
      completionTokens: json['completion_tokens'] as int,
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
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
      maxPromptTokens: json['max_prompt_tokens'] as int?,
      maxCompletionTokens: json['max_completion_tokens'] as int?,
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice: const _CreateRunRequestToolChoiceConverter()
          .fromJson(json['tool_choice']),
      responseFormat: const _CreateRunRequestResponseFormatConverter()
          .fromJson(json['response_format']),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$CreateRunRequestImplToJson(
    _$CreateRunRequestImpl instance) {
  final val = <String, dynamic>{
    'assistant_id': instance.assistantId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _CreateRunRequestModelConverter().toJson(instance.model));
  writeNotNull('instructions', instance.instructions);
  writeNotNull('additional_instructions', instance.additionalInstructions);
  writeNotNull('additional_messages',
      instance.additionalMessages?.map((e) => e.toJson()).toList());
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('max_prompt_tokens', instance.maxPromptTokens);
  writeNotNull('max_completion_tokens', instance.maxCompletionTokens);
  writeNotNull('truncation_strategy', instance.truncationStrategy?.toJson());
  writeNotNull('tool_choice',
      const _CreateRunRequestToolChoiceConverter().toJson(instance.toolChoice));
  writeNotNull(
      'response_format',
      const _CreateRunRequestResponseFormatConverter()
          .toJson(instance.responseFormat));
  writeNotNull('stream', instance.stream);
  return val;
}

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
  RunModels.gpt35Turbo: 'gpt-3.5-turbo',
  RunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  RunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  RunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  RunModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
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
  CreateRunRequestResponseFormatMode.none: 'none',
  CreateRunRequestResponseFormatMode.auto: 'auto',
};

_$CreateRunRequestResponseFormatAssistantsResponseFormatImpl
    _$$CreateRunRequestResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateRunRequestResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateRunRequestResponseFormatAssistantsResponseFormatImplToJson(
            _$CreateRunRequestResponseFormatAssistantsResponseFormatImpl
                instance) =>
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
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListRunsResponseImplToJson(
        _$ListRunsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
      'has_more': instance.hasMore,
    };

_$ModifyRunRequestImpl _$$ModifyRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyRunRequestImpl(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ModifyRunRequestImplToJson(
    _$ModifyRunRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}

_$SubmitToolOutputsRunRequestImpl _$$SubmitToolOutputsRunRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitToolOutputsRunRequestImpl(
      toolOutputs: (json['tool_outputs'] as List<dynamic>)
          .map((e) => RunSubmitToolOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$SubmitToolOutputsRunRequestImplToJson(
    _$SubmitToolOutputsRunRequestImpl instance) {
  final val = <String, dynamic>{
    'tool_outputs': instance.toolOutputs.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stream', instance.stream);
  return val;
}

_$RunSubmitToolOutputImpl _$$RunSubmitToolOutputImplFromJson(
        Map<String, dynamic> json) =>
    _$RunSubmitToolOutputImpl(
      toolCallId: json['tool_call_id'] as String?,
      output: json['output'] as String?,
    );

Map<String, dynamic> _$$RunSubmitToolOutputImplToJson(
    _$RunSubmitToolOutputImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tool_call_id', instance.toolCallId);
  writeNotNull('output', instance.output);
  return val;
}

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
      maxPromptTokens: json['max_prompt_tokens'] as int?,
      maxCompletionTokens: json['max_completion_tokens'] as int?,
      truncationStrategy: json['truncation_strategy'] == null
          ? null
          : TruncationObject.fromJson(
              json['truncation_strategy'] as Map<String, dynamic>),
      toolChoice: const _CreateThreadAndRunRequestToolChoiceConverter()
          .fromJson(json['tool_choice']),
      responseFormat: const _CreateThreadAndRunRequestResponseFormatConverter()
          .fromJson(json['response_format']),
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$CreateThreadAndRunRequestImplToJson(
    _$CreateThreadAndRunRequestImpl instance) {
  final val = <String, dynamic>{
    'assistant_id': instance.assistantId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thread', instance.thread?.toJson());
  writeNotNull(
      'model', const _ThreadAndRunModelConverter().toJson(instance.model));
  writeNotNull('instructions', instance.instructions);
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull('tool_resources', instance.toolResources?.toJson());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('max_prompt_tokens', instance.maxPromptTokens);
  writeNotNull('max_completion_tokens', instance.maxCompletionTokens);
  writeNotNull('truncation_strategy', instance.truncationStrategy?.toJson());
  writeNotNull(
      'tool_choice',
      const _CreateThreadAndRunRequestToolChoiceConverter()
          .toJson(instance.toolChoice));
  writeNotNull(
      'response_format',
      const _CreateThreadAndRunRequestResponseFormatConverter()
          .toJson(instance.responseFormat));
  writeNotNull('stream', instance.stream);
  return val;
}

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
  ThreadAndRunModels.gpt35Turbo: 'gpt-3.5-turbo',
  ThreadAndRunModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ThreadAndRunModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
  ThreadAndRunModels.gpt35Turbo0125: 'gpt-3.5-turbo-0125',
  ThreadAndRunModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
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
  CreateThreadAndRunRequestResponseFormatMode.none: 'none',
  CreateThreadAndRunRequestResponseFormatMode.auto: 'auto',
};

_$CreateThreadAndRunRequestResponseFormatAssistantsResponseFormatImpl
    _$$CreateThreadAndRunRequestResponseFormatAssistantsResponseFormatImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateThreadAndRunRequestResponseFormatAssistantsResponseFormatImpl(
          AssistantsResponseFormat.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$CreateThreadAndRunRequestResponseFormatAssistantsResponseFormatImplToJson(
            _$CreateThreadAndRunRequestResponseFormatAssistantsResponseFormatImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_$ThreadObjectImpl _$$ThreadObjectImplFromJson(Map<String, dynamic> json) =>
    _$ThreadObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$ThreadObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
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
    _$CreateThreadRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('messages', instance.messages?.map((e) => e.toJson()).toList());
  writeNotNull('tool_resources', instance.toolResources?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
    _$ModifyThreadRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tool_resources', instance.toolResources?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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

Map<String, dynamic> _$$ToolResourcesImplToJson(_$ToolResourcesImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code_interpreter', instance.codeInterpreter?.toJson());
  writeNotNull('file_search', instance.fileSearch?.toJson());
  return val;
}

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
    _$ToolResourcesFileSearchImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vector_store_ids', instance.vectorStoreIds);
  writeNotNull(
      'vector_stores', instance.vectorStores?.map((e) => e.toJson()).toList());
  return val;
}

_$ToolResourcesFileSearchVectorStoreImpl
    _$$ToolResourcesFileSearchVectorStoreImplFromJson(
            Map<String, dynamic> json) =>
        _$ToolResourcesFileSearchVectorStoreImpl(
          fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          metadata: json['metadata'],
        );

Map<String, dynamic> _$$ToolResourcesFileSearchVectorStoreImplToJson(
    _$ToolResourcesFileSearchVectorStoreImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_ids', instance.fileIds);
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListThreadsResponseImplToJson(
        _$ListThreadsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
      'has_more': instance.hasMore,
    };

_$MessageObjectImpl _$$MessageObjectImplFromJson(Map<String, dynamic> json) =>
    _$MessageObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$MessageObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
      threadId: json['thread_id'] as String,
      status: $enumDecodeNullable(_$MessageObjectStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      incompleteDetails: json['incomplete_details'] == null
          ? null
          : MessageObjectIncompleteDetails.fromJson(
              json['incomplete_details'] as Map<String, dynamic>),
      completedAt: json['completed_at'] as int?,
      incompleteAt: json['incomplete_at'] as int?,
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
    _$MessageAttachmentImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.fileId);
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  return val;
}

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

Map<String, dynamic> _$$MessageDeltaImplToJson(_$MessageDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', _$MessageRoleEnumMap[instance.role]);
  writeNotNull('content', instance.content?.map((e) => e.toJson()).toList());
  return val;
}

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
    _$CreateMessageRequestImpl instance) {
  final val = <String, dynamic>{
    'role': _$MessageRoleEnumMap[instance.role]!,
    'content':
        const _CreateMessageRequestContentConverter().toJson(instance.content),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'attachments', instance.attachments?.map((e) => e.toJson()).toList());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
    _$ModifyMessageRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}

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
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListMessagesResponseImplToJson(
        _$ListMessagesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
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
    _$MessageContentTextImpl instance) {
  final val = <String, dynamic>{
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'annotations', instance.annotations?.map((e) => e.toJson()).toList());
  return val;
}

_$MessageContentTextAnnotationsFileCitationImpl
    _$$MessageContentTextAnnotationsFileCitationImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFileCitationImpl(
          fileId: json['file_id'] as String,
          quote: json['quote'] as String,
        );

Map<String, dynamic> _$$MessageContentTextAnnotationsFileCitationImplToJson(
        _$MessageContentTextAnnotationsFileCitationImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'quote': instance.quote,
    };

_$MessageDeltaContentImageUrlObjectImpl
    _$$MessageDeltaContentImageUrlObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentImageUrlObjectImpl(
          index: json['index'] as int?,
          type: json['type'] as String?,
          imageUrl: json['image_url'] == null
              ? null
              : MessageContentImageUrl.fromJson(
                  json['image_url'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentImageUrlObjectImplToJson(
    _$MessageDeltaContentImageUrlObjectImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('index', instance.index);
  writeNotNull('type', instance.type);
  writeNotNull('image_url', instance.imageUrl?.toJson());
  return val;
}

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
    _$MessageDeltaContentTextImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull(
      'annotations', instance.annotations?.map((e) => e.toJson()).toList());
  return val;
}

_$MessageDeltaContentTextAnnotationsFileCitationImpl
    _$$MessageDeltaContentTextAnnotationsFileCitationImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFileCitationImpl(
          fileId: json['file_id'] as String?,
          quote: json['quote'] as String?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFileCitationImplToJson(
        _$MessageDeltaContentTextAnnotationsFileCitationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.fileId);
  writeNotNull('quote', instance.quote);
  return val;
}

_$RunStepObjectImpl _$$RunStepObjectImplFromJson(Map<String, dynamic> json) =>
    _$RunStepObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$RunStepObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
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
      expiredAt: json['expired_at'] as int?,
      cancelledAt: json['cancelled_at'] as int?,
      failedAt: json['failed_at'] as int?,
      completedAt: json['completed_at'] as int?,
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

Map<String, dynamic> _$$RunStepDeltaImplToJson(_$RunStepDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('step_details', instance.stepDetails?.toJson());
  return val;
}

_$ListRunStepsResponseImpl _$$ListRunStepsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListRunStepsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RunStepObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListRunStepsResponseImplToJson(
        _$ListRunStepsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
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
    _$RunStepDeltaStepDetailsMessageCreationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_id', instance.messageId);
  return val;
}

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
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('input', instance.input);
  writeNotNull('outputs', instance.outputs?.map((e) => e.toJson()).toList());
  return val;
}

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
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.fileId);
  return val;
}

_$RunStepCompletionUsageImpl _$$RunStepCompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStepCompletionUsageImpl(
      completionTokens: json['completion_tokens'] as int,
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
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
      days: json['days'] as int,
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
      createdAt: json['created_at'] as int,
      name: json['name'] as String?,
      usageBytes: json['usage_bytes'] as int,
      fileCounts: VectorStoreObjectFileCounts.fromJson(
          json['file_counts'] as Map<String, dynamic>),
      status: $enumDecode(_$VectorStoreObjectStatusEnumMap, json['status']),
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      expiresAt: json['expires_at'] as int?,
      lastActiveAt: json['last_active_at'] as int?,
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$VectorStoreObjectImplToJson(
    _$VectorStoreObjectImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created_at': instance.createdAt,
    'name': instance.name,
    'usage_bytes': instance.usageBytes,
    'file_counts': instance.fileCounts.toJson(),
    'status': _$VectorStoreObjectStatusEnumMap[instance.status]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expires_after', instance.expiresAfter?.toJson());
  writeNotNull('expires_at', instance.expiresAt);
  val['last_active_at'] = instance.lastActiveAt;
  val['metadata'] = instance.metadata;
  return val;
}

const _$VectorStoreObjectStatusEnumMap = {
  VectorStoreObjectStatus.expired: 'expired',
  VectorStoreObjectStatus.inProgress: 'in_progress',
  VectorStoreObjectStatus.completed: 'completed',
};

_$VectorStoreObjectFileCountsImpl _$$VectorStoreObjectFileCountsImplFromJson(
        Map<String, dynamic> json) =>
    _$VectorStoreObjectFileCountsImpl(
      inProgress: json['in_progress'] as int,
      completed: json['completed'] as int,
      failed: json['failed'] as int,
      cancelled: json['cancelled'] as int,
      total: json['total'] as int,
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
      fileIds: (json['file_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      expiresAfter: json['expires_after'] == null
          ? null
          : VectorStoreExpirationAfter.fromJson(
              json['expires_after'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$CreateVectorStoreRequestImplToJson(
    _$CreateVectorStoreRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_ids', instance.fileIds);
  val['name'] = instance.name;
  writeNotNull('expires_after', instance.expiresAfter?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
    _$UpdateVectorStoreRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('expires_after', instance.expiresAfter?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
      'first_id': instance.firstId,
      'last_id': instance.lastId,
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
      usageBytes: json['usage_bytes'] as int,
      createdAt: json['created_at'] as int,
      vectorStoreId: json['vector_store_id'] as String,
      status: $enumDecode(_$VectorStoreFileStatusEnumMap, json['status']),
      lastError: json['last_error'] == null
          ? null
          : VectorStoreFileObjectLastError.fromJson(
              json['last_error'] as Map<String, dynamic>),
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
  VectorStoreFileObjectLastErrorCode.internalError: 'internal_error',
  VectorStoreFileObjectLastErrorCode.fileNotFound: 'file_not_found',
  VectorStoreFileObjectLastErrorCode.parsingError: 'parsing_error',
  VectorStoreFileObjectLastErrorCode.unhandledMimeType: 'unhandled_mime_type',
};

_$CreateVectorStoreFileRequestImpl _$$CreateVectorStoreFileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVectorStoreFileRequestImpl(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$$CreateVectorStoreFileRequestImplToJson(
        _$CreateVectorStoreFileRequestImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$ListVectorStoreFilesResponseImpl _$$ListVectorStoreFilesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListVectorStoreFilesResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VectorStoreFileObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListVectorStoreFilesResponseImplToJson(
        _$ListVectorStoreFilesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
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
      createdAt: json['created_at'] as int,
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
          inProgress: json['in_progress'] as int,
          completed: json['completed'] as int,
          failed: json['failed'] as int,
          cancelled: json['cancelled'] as int,
          total: json['total'] as int,
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
        );

Map<String, dynamic> _$$CreateVectorStoreFileBatchRequestImplToJson(
        _$CreateVectorStoreFileBatchRequestImpl instance) =>
    <String, dynamic>{
      'file_ids': instance.fileIds,
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
    _$CreateBatchRequestImpl instance) {
  final val = <String, dynamic>{
    'input_file_id': instance.inputFileId,
    'endpoint': _$BatchEndpointEnumMap[instance.endpoint]!,
    'completion_window':
        _$BatchCompletionWindowEnumMap[instance.completionWindow]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}

const _$BatchEndpointEnumMap = {
  BatchEndpoint.v1ChatCompletions: '/v1/chat/completions',
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
      createdAt: json['created_at'] as int,
      inProgressAt: json['in_progress_at'] as int?,
      expiresAt: json['expires_at'] as int?,
      finalizingAt: json['finalizing_at'] as int?,
      completedAt: json['completed_at'] as int?,
      failedAt: json['failed_at'] as int?,
      expiredAt: json['expired_at'] as int?,
      cancellingAt: json['cancelling_at'] as int?,
      cancelledAt: json['cancelled_at'] as int?,
      requestCounts: json['request_counts'] == null
          ? null
          : BatchRequestCounts.fromJson(
              json['request_counts'] as Map<String, dynamic>),
      metadata: json['metadata'],
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': _$BatchObjectEnumMap[instance.object]!,
    'endpoint': _$BatchEndpointEnumMap[instance.endpoint]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.errors?.toJson());
  val['input_file_id'] = instance.inputFileId;
  val['completion_window'] =
      _$BatchCompletionWindowEnumMap[instance.completionWindow]!;
  val['status'] = _$BatchStatusEnumMap[instance.status]!;
  writeNotNull('output_file_id', instance.outputFileId);
  writeNotNull('error_file_id', instance.errorFileId);
  val['created_at'] = instance.createdAt;
  writeNotNull('in_progress_at', instance.inProgressAt);
  writeNotNull('expires_at', instance.expiresAt);
  writeNotNull('finalizing_at', instance.finalizingAt);
  writeNotNull('completed_at', instance.completedAt);
  writeNotNull('failed_at', instance.failedAt);
  writeNotNull('expired_at', instance.expiredAt);
  writeNotNull('cancelling_at', instance.cancellingAt);
  writeNotNull('cancelled_at', instance.cancelledAt);
  writeNotNull('request_counts', instance.requestCounts?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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

Map<String, dynamic> _$$BatchErrorsImplToJson(_$BatchErrorsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  return val;
}

_$BatchRequestCountsImpl _$$BatchRequestCountsImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchRequestCountsImpl(
      total: json['total'] as int,
      completed: json['completed'] as int,
      failed: json['failed'] as int,
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
      line: json['line'] as int?,
    );

Map<String, dynamic> _$$BatchErrorsDataInnerImplToJson(
    _$BatchErrorsDataInnerImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  writeNotNull('param', instance.param);
  writeNotNull('line', instance.line);
  return val;
}

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
    _$ListBatchesResponseImpl instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_id', instance.firstId);
  writeNotNull('last_id', instance.lastId);
  val['has_more'] = instance.hasMore;
  val['object'] = _$ListBatchesResponseObjectEnumMap[instance.object]!;
  return val;
}

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
    _$ChatCompletionSystemMessageImpl instance) {
  final val = <String, dynamic>{
    'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

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
    _$ChatCompletionUserMessageImpl instance) {
  final val = <String, dynamic>{
    'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
    'content': const _ChatCompletionUserMessageContentConverter()
        .toJson(instance.content),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

_$ChatCompletionAssistantMessageImpl
    _$$ChatCompletionAssistantMessageImplFromJson(Map<String, dynamic> json) =>
        _$ChatCompletionAssistantMessageImpl(
          role: $enumDecodeNullable(
                  _$ChatCompletionMessageRoleEnumMap, json['role']) ??
              ChatCompletionMessageRole.assistant,
          content: json['content'] as String?,
          name: json['name'] as String?,
          toolCalls: (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => ChatCompletionMessageToolCall.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          functionCall: json['function_call'] == null
              ? null
              : ChatCompletionMessageFunctionCall.fromJson(
                  json['function_call'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionAssistantMessageImplToJson(
    _$ChatCompletionAssistantMessageImpl instance) {
  final val = <String, dynamic>{
    'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('name', instance.name);
  writeNotNull(
      'tool_calls', instance.toolCalls?.map((e) => e.toJson()).toList());
  writeNotNull('function_call', instance.functionCall?.toJson());
  return val;
}

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
      type: json['type'] as String? ?? 'file_search',
    );

Map<String, dynamic> _$$AssistantToolsFileSearchImplToJson(
        _$AssistantToolsFileSearchImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
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

_$MessageDeltaContentImageFileObjectImpl
    _$$MessageDeltaContentImageFileObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentImageFileObjectImpl(
          index: json['index'] as int,
          type: json['type'] as String,
          imageFile: json['image_file'] == null
              ? null
              : MessageContentImageFile.fromJson(
                  json['image_file'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentImageFileObjectImplToJson(
    _$MessageDeltaContentImageFileObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image_file', instance.imageFile?.toJson());
  return val;
}

_$MessageDeltaContentTextObjectImpl
    _$$MessageDeltaContentTextObjectImplFromJson(Map<String, dynamic> json) =>
        _$MessageDeltaContentTextObjectImpl(
          index: json['index'] as int,
          type: json['type'] as String,
          text: json['text'] == null
              ? null
              : MessageDeltaContentText.fromJson(
                  json['text'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageDeltaContentTextObjectImplToJson(
    _$MessageDeltaContentTextObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text?.toJson());
  return val;
}

_$MessageContentTextAnnotationsFileCitationObjectImpl
    _$$MessageContentTextAnnotationsFileCitationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFileCitationObjectImpl(
          type: json['type'] as String,
          text: json['text'] as String,
          fileCitation: MessageContentTextAnnotationsFileCitation.fromJson(
              json['file_citation'] as Map<String, dynamic>),
          startIndex: json['start_index'] as int,
          endIndex: json['end_index'] as int,
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
          startIndex: json['start_index'] as int,
          endIndex: json['end_index'] as int,
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
          index: json['index'] as int,
          type: json['type'] as String,
          text: json['text'] as String?,
          fileCitation: json['file_citation'] == null
              ? null
              : MessageDeltaContentTextAnnotationsFileCitation.fromJson(
                  json['file_citation'] as Map<String, dynamic>),
          startIndex: json['start_index'] as int?,
          endIndex: json['end_index'] as int?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFileCitationObjectImplToJson(
        _$MessageDeltaContentTextAnnotationsFileCitationObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('file_citation', instance.fileCitation?.toJson());
  writeNotNull('start_index', instance.startIndex);
  writeNotNull('end_index', instance.endIndex);
  return val;
}

_$MessageDeltaContentTextAnnotationsFilePathObjectImpl
    _$$MessageDeltaContentTextAnnotationsFilePathObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFilePathObjectImpl(
          index: json['index'] as int,
          type: json['type'] as String,
          text: json['text'] as String?,
          filePath: json['file_path'] == null
              ? null
              : MessageDeltaContentTextAnnotationsFilePathObjectFilePath
                  .fromJson(json['file_path'] as Map<String, dynamic>),
          startIndex: json['start_index'] as int?,
          endIndex: json['end_index'] as int?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFilePathObjectImplToJson(
        _$MessageDeltaContentTextAnnotationsFilePathObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('file_path', instance.filePath?.toJson());
  writeNotNull('start_index', instance.startIndex);
  writeNotNull('end_index', instance.endIndex);
  return val;
}

_$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl
    _$$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl(
          fileId: json['file_id'] as String?,
        );

Map<String, dynamic>
    _$$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImplToJson(
        _$MessageDeltaContentTextAnnotationsFilePathObjectFilePathImpl
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_id', instance.fileId);
  return val;
}

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
    _$RunStepDeltaStepDetailsMessageCreationObjectImpl instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message_creation', instance.messageCreation?.toJson());
  return val;
}

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
    _$RunStepDeltaStepDetailsToolCallsObjectImpl instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'tool_calls', instance.toolCalls?.map((e) => e.toJson()).toList());
  return val;
}

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
          fileSearch: json['file_search'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFileSearchObjectImplToJson(
        _$RunStepDetailsToolCallsFileSearchObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'file_search': instance.fileSearch,
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
          index: json['index'] as int,
          id: json['id'] as String?,
          type: json['type'] as String,
          codeInterpreter: json['code_interpreter'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter
                  .fromJson(json['code_interpreter'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsToolCallsCodeObjectImplToJson(
    _$RunStepDeltaStepDetailsToolCallsCodeObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = instance.type;
  writeNotNull('code_interpreter', instance.codeInterpreter?.toJson());
  return val;
}

_$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsFileSearchObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl(
          index: json['index'] as int,
          id: json['id'] as String?,
          type: json['type'] as String,
          fileSearch: json['file_search'] as Map<String, dynamic>,
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsFileSearchObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsFileSearchObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = instance.type;
  val['file_search'] = instance.fileSearch;
  return val;
}

_$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsFunctionObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl(
          index: json['index'] as int,
          id: json['id'] as String?,
          type: json['type'] as String,
          function: json['function'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsFunction.fromJson(
                  json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsFunctionObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsFunctionObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = instance.type;
  writeNotNull('function', instance.function?.toJson());
  return val;
}

_$RunStepDeltaStepDetailsToolCallsFunctionImpl
    _$$RunStepDeltaStepDetailsToolCallsFunctionImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsFunctionImpl(
          name: json['name'] as String?,
          arguments: json['arguments'] as String?,
          output: json['output'] as String?,
        );

Map<String, dynamic> _$$RunStepDeltaStepDetailsToolCallsFunctionImplToJson(
    _$RunStepDeltaStepDetailsToolCallsFunctionImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('arguments', instance.arguments);
  writeNotNull('output', instance.output);
  return val;
}

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
          index: json['index'] as int,
          type: json['type'] as String,
          logs: json['logs'] as String?,
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsCodeOutputLogsObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logs', instance.logs);
  return val;
}

_$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl(
          index: json['index'] as int,
          type: json['type'] as String,
          image: json['image'] == null
              ? null
              : RunStepDeltaStepDetailsToolCallsCodeOutputImage.fromJson(
                  json['image'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImplToJson(
        _$RunStepDeltaStepDetailsToolCallsCodeOutputImageObjectImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image?.toJson());
  return val;
}

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
