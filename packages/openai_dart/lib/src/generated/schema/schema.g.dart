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
  ChatCompletionModels.gpt40314: 'gpt-4-0314',
  ChatCompletionModels.gpt40613: 'gpt-4-0613',
  ChatCompletionModels.gpt432k: 'gpt-4-32k',
  ChatCompletionModels.gpt432k0314: 'gpt-4-32k-0314',
  ChatCompletionModels.gpt432k0613: 'gpt-4-32k-0613',
  ChatCompletionModels.gpt4TurboPreview: 'gpt-4-turbo-preview',
  ChatCompletionModels.gpt41106Preview: 'gpt-4-1106-preview',
  ChatCompletionModels.gpt40125Preview: 'gpt-4-0125-preview',
  ChatCompletionModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ChatCompletionModels.gpt35Turbo1106: 'gpt-3.5-turbo-1106',
  ChatCompletionModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
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
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
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
      'file_ids': instance.fileIds,
      'metadata': instance.metadata,
    };

const _$AssistantObjectObjectEnumMap = {
  AssistantObjectObject.assistant: 'assistant',
};

_$CreateAssistantRequestImpl _$$CreateAssistantRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAssistantRequestImpl(
      model:
          const _CreateAssistantRequestModelConverter().fromJson(json['model']),
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
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateAssistantRequestImplToJson(
    _$CreateAssistantRequestImpl instance) {
  final val = <String, dynamic>{
    'model':
        const _CreateAssistantRequestModelConverter().toJson(instance.model),
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
  val['file_ids'] = instance.fileIds;
  writeNotNull('metadata', instance.metadata);
  return val;
}

_$CreateAssistantRequestModelStringImpl
    _$$CreateAssistantRequestModelStringImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateAssistantRequestModelStringImpl(
          json['value'] as String,
        );

Map<String, dynamic> _$$CreateAssistantRequestModelStringImplToJson(
        _$CreateAssistantRequestModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
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
      metadata: json['metadata'] as Map<String, dynamic>?,
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
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
      model: json['model'] as String,
      instructions: json['instructions'] as String,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      usage: json['usage'] == null
          ? null
          : RunCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
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
      'model': instance.model,
      'instructions': instance.instructions,
      'tools': instance.tools.map((e) => e.toJson()).toList(),
      'file_ids': instance.fileIds,
      'metadata': instance.metadata,
      'usage': instance.usage?.toJson(),
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
      model: json['model'] as String?,
      instructions: json['instructions'] as String?,
      additionalInstructions: json['additional_instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
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

  writeNotNull('model', instance.model);
  writeNotNull('instructions', instance.instructions);
  writeNotNull('additional_instructions', instance.additionalInstructions);
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
    );

Map<String, dynamic> _$$SubmitToolOutputsRunRequestImplToJson(
        _$SubmitToolOutputsRunRequestImpl instance) =>
    <String, dynamic>{
      'tool_outputs': instance.toolOutputs.map((e) => e.toJson()).toList(),
    };

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
      model: json['model'] as String?,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTools.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
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
  writeNotNull('model', instance.model);
  writeNotNull('instructions', instance.instructions);
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull('metadata', instance.metadata);
  return val;
}

_$ThreadObjectImpl _$$ThreadObjectImplFromJson(Map<String, dynamic> json) =>
    _$ThreadObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$ThreadObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ThreadObjectImplToJson(_$ThreadObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$ThreadObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
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
  writeNotNull('metadata', instance.metadata);
  return val;
}

_$ModifyThreadRequestImpl _$$ModifyThreadRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyThreadRequestImpl(
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
      role: $enumDecode(_$MessageObjectRoleEnumMap, json['role']),
      content: (json['content'] as List<dynamic>)
          .map((e) => MessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      assistantId: json['assistant_id'] as String?,
      runId: json['run_id'] as String?,
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageObjectImplToJson(_$MessageObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$MessageObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'thread_id': instance.threadId,
      'role': _$MessageObjectRoleEnumMap[instance.role]!,
      'content': instance.content.map((e) => e.toJson()).toList(),
      'assistant_id': instance.assistantId,
      'run_id': instance.runId,
      'file_ids': instance.fileIds,
      'metadata': instance.metadata,
    };

const _$MessageObjectObjectEnumMap = {
  MessageObjectObject.threadMessage: 'thread.message',
};

const _$MessageObjectRoleEnumMap = {
  MessageObjectRole.user: 'user',
  MessageObjectRole.assistant: 'assistant',
};

_$CreateMessageRequestImpl _$$CreateMessageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateMessageRequestImpl(
      role: $enumDecode(_$CreateMessageRequestRoleEnumMap, json['role']),
      content: json['content'] as String,
      fileIds: (json['file_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateMessageRequestImplToJson(
    _$CreateMessageRequestImpl instance) {
  final val = <String, dynamic>{
    'role': _$CreateMessageRequestRoleEnumMap[instance.role]!,
    'content': instance.content,
    'file_ids': instance.fileIds,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}

const _$CreateMessageRequestRoleEnumMap = {
  CreateMessageRequestRole.user: 'user',
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
    );

Map<String, dynamic> _$$MessageContentImageFileImplToJson(
        _$MessageContentImageFileImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$MessageContentTextImpl _$$MessageContentTextImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentTextImpl(
      value: json['value'] as String,
      annotations: (json['annotations'] as List<dynamic>)
          .map((e) =>
              MessageContentTextAnnotations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MessageContentTextImplToJson(
        _$MessageContentTextImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'annotations': instance.annotations.map((e) => e.toJson()).toList(),
    };

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

_$AssistantFileObjectImpl _$$AssistantFileObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantFileObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$AssistantFileObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
      assistantId: json['assistant_id'] as String,
    );

Map<String, dynamic> _$$AssistantFileObjectImplToJson(
        _$AssistantFileObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$AssistantFileObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'assistant_id': instance.assistantId,
    };

const _$AssistantFileObjectObjectEnumMap = {
  AssistantFileObjectObject.assistantFile: 'assistant.file',
};

_$CreateAssistantFileRequestImpl _$$CreateAssistantFileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAssistantFileRequestImpl(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$$CreateAssistantFileRequestImplToJson(
        _$CreateAssistantFileRequestImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

_$DeleteAssistantFileResponseImpl _$$DeleteAssistantFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteAssistantFileResponseImpl(
      id: json['id'] as String,
      deleted: json['deleted'] as bool,
      object: $enumDecode(
          _$DeleteAssistantFileResponseObjectEnumMap, json['object']),
    );

Map<String, dynamic> _$$DeleteAssistantFileResponseImplToJson(
        _$DeleteAssistantFileResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'object': _$DeleteAssistantFileResponseObjectEnumMap[instance.object]!,
    };

const _$DeleteAssistantFileResponseObjectEnumMap = {
  DeleteAssistantFileResponseObject.assistantFileDeleted:
      'assistant.file.deleted',
};

_$ListAssistantFilesResponseImpl _$$ListAssistantFilesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListAssistantFilesResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AssistantFileObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListAssistantFilesResponseImplToJson(
        _$ListAssistantFilesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
      'has_more': instance.hasMore,
    };

_$MessageFileObjectImpl _$$MessageFileObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageFileObjectImpl(
      id: json['id'] as String,
      object: $enumDecode(_$MessageFileObjectObjectEnumMap, json['object']),
      createdAt: json['created_at'] as int,
      messageId: json['message_id'] as String,
    );

Map<String, dynamic> _$$MessageFileObjectImplToJson(
        _$MessageFileObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': _$MessageFileObjectObjectEnumMap[instance.object]!,
      'created_at': instance.createdAt,
      'message_id': instance.messageId,
    };

const _$MessageFileObjectObjectEnumMap = {
  MessageFileObjectObject.threadMessageFile: 'thread.message.file',
};

_$ListMessageFilesResponseImpl _$$ListMessageFilesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListMessageFilesResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageFileObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstId: json['first_id'] as String,
      lastId: json['last_id'] as String,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$ListMessageFilesResponseImplToJson(
        _$ListMessageFilesResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_id': instance.firstId,
      'last_id': instance.lastId,
      'has_more': instance.hasMore,
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

_$AssistantToolsRetrievalImpl _$$AssistantToolsRetrievalImplFromJson(
        Map<String, dynamic> json) =>
    _$AssistantToolsRetrievalImpl(
      type: json['type'] as String? ?? 'retrieval',
    );

Map<String, dynamic> _$$AssistantToolsRetrievalImplToJson(
        _$AssistantToolsRetrievalImpl instance) =>
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
          type: json['type'] as String,
          imageFile: MessageContentImageFile.fromJson(
              json['image_file'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$MessageContentImageFileObjectImplToJson(
        _$MessageContentImageFileObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image_file': instance.imageFile.toJson(),
    };

_$MessageContentTextObjectImpl _$$MessageContentTextObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageContentTextObjectImpl(
      type: json['type'] as String,
      text: MessageContentText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageContentTextObjectImplToJson(
        _$MessageContentTextObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text.toJson(),
    };

_$MessageContentTextAnnotationsFileCitationObjectImpl
    _$$MessageContentTextAnnotationsFileCitationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFileCitationObjectImpl(
          type: $enumDecode(
              _$MessageContentTextAnnotationsFileCitationObjectTypeEnumMap,
              json['type']),
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
          'type': _$MessageContentTextAnnotationsFileCitationObjectTypeEnumMap[
              instance.type]!,
          'text': instance.text,
          'file_citation': instance.fileCitation.toJson(),
          'start_index': instance.startIndex,
          'end_index': instance.endIndex,
        };

const _$MessageContentTextAnnotationsFileCitationObjectTypeEnumMap = {
  MessageContentTextAnnotationsFileCitationObjectType.fileCitation:
      'file_citation',
};

_$MessageContentTextAnnotationsFilePathObjectImpl
    _$$MessageContentTextAnnotationsFilePathObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$MessageContentTextAnnotationsFilePathObjectImpl(
          type: $enumDecode(
              _$MessageContentTextAnnotationsFilePathObjectTypeEnumMap,
              json['type']),
          text: json['text'] as String,
          filePath: MessageContentTextAnnotationsFilePath.fromJson(
              json['file_path'] as Map<String, dynamic>),
          startIndex: json['start_index'] as int,
          endIndex: json['end_index'] as int,
        );

Map<String, dynamic> _$$MessageContentTextAnnotationsFilePathObjectImplToJson(
        _$MessageContentTextAnnotationsFilePathObjectImpl instance) =>
    <String, dynamic>{
      'type': _$MessageContentTextAnnotationsFilePathObjectTypeEnumMap[
          instance.type]!,
      'text': instance.text,
      'file_path': instance.filePath.toJson(),
      'start_index': instance.startIndex,
      'end_index': instance.endIndex,
    };

const _$MessageContentTextAnnotationsFilePathObjectTypeEnumMap = {
  MessageContentTextAnnotationsFilePathObjectType.filePath: 'file_path',
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

_$RunStepDetailsMessageCreationObjectImpl
    _$$RunStepDetailsMessageCreationObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsMessageCreationObjectImpl(
          type: $enumDecode(
              _$RunStepDetailsMessageCreationObjectTypeEnumMap, json['type']),
          messageCreation: RunStepDetailsMessageCreation.fromJson(
              json['message_creation'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsMessageCreationObjectImplToJson(
        _$RunStepDetailsMessageCreationObjectImpl instance) =>
    <String, dynamic>{
      'type': _$RunStepDetailsMessageCreationObjectTypeEnumMap[instance.type]!,
      'message_creation': instance.messageCreation.toJson(),
    };

const _$RunStepDetailsMessageCreationObjectTypeEnumMap = {
  RunStepDetailsMessageCreationObjectType.messageCreation: 'message_creation',
};

_$RunStepDetailsToolCallsObjectImpl
    _$$RunStepDetailsToolCallsObjectImplFromJson(Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsObjectImpl(
          type: $enumDecode(
              _$RunStepDetailsToolCallsObjectTypeEnumMap, json['type']),
          toolCalls: (json['tool_calls'] as List<dynamic>)
              .map((e) =>
                  RunStepDetailsToolCalls.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsObjectImplToJson(
        _$RunStepDetailsToolCallsObjectImpl instance) =>
    <String, dynamic>{
      'type': _$RunStepDetailsToolCallsObjectTypeEnumMap[instance.type]!,
      'tool_calls': instance.toolCalls.map((e) => e.toJson()).toList(),
    };

const _$RunStepDetailsToolCallsObjectTypeEnumMap = {
  RunStepDetailsToolCallsObjectType.toolCalls: 'tool_calls',
};

_$RunStepDetailsToolCallsCodeObjectImpl
    _$$RunStepDetailsToolCallsCodeObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeObjectImpl(
          id: json['id'] as String,
          type: $enumDecode(
              _$RunStepDetailsToolCallsCodeObjectTypeEnumMap, json['type']),
          codeInterpreter:
              RunStepDetailsToolCallsCodeObjectCodeInterpreter.fromJson(
                  json['code_interpreter'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeObjectImplToJson(
        _$RunStepDetailsToolCallsCodeObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RunStepDetailsToolCallsCodeObjectTypeEnumMap[instance.type]!,
      'code_interpreter': instance.codeInterpreter.toJson(),
    };

const _$RunStepDetailsToolCallsCodeObjectTypeEnumMap = {
  RunStepDetailsToolCallsCodeObjectType.codeInterpreter: 'code_interpreter',
};

_$RunStepDetailsToolCallsRetrievalObjectImpl
    _$$RunStepDetailsToolCallsRetrievalObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsRetrievalObjectImpl(
          id: json['id'] as String,
          type: $enumDecode(_$RunStepDetailsToolCallsRetrievalObjectTypeEnumMap,
              json['type']),
          retrieval: json['retrieval'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsRetrievalObjectImplToJson(
        _$RunStepDetailsToolCallsRetrievalObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type':
          _$RunStepDetailsToolCallsRetrievalObjectTypeEnumMap[instance.type]!,
      'retrieval': instance.retrieval,
    };

const _$RunStepDetailsToolCallsRetrievalObjectTypeEnumMap = {
  RunStepDetailsToolCallsRetrievalObjectType.retrieval: 'retrieval',
};

_$RunStepDetailsToolCallsFunctionObjectImpl
    _$$RunStepDetailsToolCallsFunctionObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsFunctionObjectImpl(
          id: json['id'] as String,
          type: $enumDecode(
              _$RunStepDetailsToolCallsFunctionObjectTypeEnumMap, json['type']),
          function: RunStepDetailsToolCallsFunction.fromJson(
              json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsFunctionObjectImplToJson(
        _$RunStepDetailsToolCallsFunctionObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type':
          _$RunStepDetailsToolCallsFunctionObjectTypeEnumMap[instance.type]!,
      'function': instance.function.toJson(),
    };

const _$RunStepDetailsToolCallsFunctionObjectTypeEnumMap = {
  RunStepDetailsToolCallsFunctionObjectType.function: 'function',
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

_$RunStepDetailsToolCallsCodeOutputLogsObjectImpl
    _$$RunStepDetailsToolCallsCodeOutputLogsObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeOutputLogsObjectImpl(
          type: $enumDecode(
              _$RunStepDetailsToolCallsCodeOutputLogsObjectTypeEnumMap,
              json['type']),
          logs: json['logs'] as String,
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeOutputLogsObjectImplToJson(
        _$RunStepDetailsToolCallsCodeOutputLogsObjectImpl instance) =>
    <String, dynamic>{
      'type': _$RunStepDetailsToolCallsCodeOutputLogsObjectTypeEnumMap[
          instance.type]!,
      'logs': instance.logs,
    };

const _$RunStepDetailsToolCallsCodeOutputLogsObjectTypeEnumMap = {
  RunStepDetailsToolCallsCodeOutputLogsObjectType.logs: 'logs',
};

_$RunStepDetailsToolCallsCodeOutputImageObjectImpl
    _$$RunStepDetailsToolCallsCodeOutputImageObjectImplFromJson(
            Map<String, dynamic> json) =>
        _$RunStepDetailsToolCallsCodeOutputImageObjectImpl(
          type: $enumDecode(
              _$RunStepDetailsToolCallsCodeOutputImageObjectTypeEnumMap,
              json['type']),
          image: RunStepDetailsToolCallsCodeOutputImage.fromJson(
              json['image'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$RunStepDetailsToolCallsCodeOutputImageObjectImplToJson(
        _$RunStepDetailsToolCallsCodeOutputImageObjectImpl instance) =>
    <String, dynamic>{
      'type': _$RunStepDetailsToolCallsCodeOutputImageObjectTypeEnumMap[
          instance.type]!,
      'image': instance.image.toJson(),
    };

const _$RunStepDetailsToolCallsCodeOutputImageObjectTypeEnumMap = {
  RunStepDetailsToolCallsCodeOutputImageObjectType.image: 'image',
};
