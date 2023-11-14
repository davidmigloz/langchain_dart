// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names

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
  CompletionModels.babbage002: 'babbage-002',
  CompletionModels.davinci002: 'davinci-002',
  CompletionModels.gpt35TurboInstruct: 'gpt-3.5-turbo-instruct',
  CompletionModels.textDavinci003: 'text-davinci-003',
  CompletionModels.textDavinci002: 'text-davinci-002',
  CompletionModels.textDavinci001: 'text-davinci-001',
  CompletionModels.codeDavinci002: 'code-davinci-002',
  CompletionModels.textCurie001: 'text-curie-001',
  CompletionModels.textBabbage001: 'text-babbage-001',
  CompletionModels.textAda001: 'text-ada-001',
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
  ChatCompletionModels.gpt41106Preview: 'gpt-4-1106-preview',
  ChatCompletionModels.gpt4VisionPreview: 'gpt-4-vision-preview',
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
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
          $enumDecode(
              _$ChatCompletionToolChoiceOptionEnumEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChatCompletionToolChoiceOptionEnumerationImplToJson(
        _$ChatCompletionToolChoiceOptionEnumerationImpl instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionToolChoiceOptionEnumEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionToolChoiceOptionEnumEnumMap = {
  ChatCompletionToolChoiceOptionEnum.none: 'none',
  ChatCompletionToolChoiceOptionEnum.auto: 'auto',
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

_$ChatCompletionMessageImpl _$$ChatCompletionMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionMessageImpl(
      role: $enumDecode(_$ChatCompletionMessageRoleEnumMap, json['role']),
      content: json['content'] as String?,
      toolCalls: (json['tool_calls'] as List<dynamic>?)
          ?.map((e) =>
              ChatCompletionMessageToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
      functionCall: json['function_call'] == null
          ? null
          : ChatCompletionMessageFunctionCall.fromJson(
              json['function_call'] as Map<String, dynamic>),
      toolCallId: json['tool_call_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionMessageImplToJson(
    _$ChatCompletionMessageImpl instance) {
  final val = <String, dynamic>{
    'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'tool_calls', instance.toolCalls?.map((e) => e.toJson()).toList());
  writeNotNull('function_call', instance.functionCall?.toJson());
  writeNotNull('tool_call_id', instance.toolCallId);
  writeNotNull('name', instance.name);
  return val;
}

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
  ChatCompletionMessageRole.tool: 'tool',
  ChatCompletionMessageRole.function: 'function',
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
      parameters: json['parameters'] as Map<String, dynamic>,
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
  val['parameters'] = instance.parameters;
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
          type: $enumDecodeNullable(
              _$ChatCompletionNamedToolChoiceTypeEnumMap, json['type'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          function: json['function'] == null
              ? null
              : ChatCompletionFunctionCallOption.fromJson(
                  json['function'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ChatCompletionNamedToolChoiceImplToJson(
    _$ChatCompletionNamedToolChoiceImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'type', _$ChatCompletionNamedToolChoiceTypeEnumMap[instance.type]);
  writeNotNull('function', instance.function?.toJson());
  return val;
}

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
      id: json['id'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) =>
              ChatCompletionResponseChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String?,
      object: $enumDecode(
          _$CreateChatCompletionResponseObjectEnumMap, json['object']),
      usage: json['usage'] == null
          ? null
          : CompletionUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateChatCompletionResponseImplToJson(
    _$CreateChatCompletionResponseImpl instance) {
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
  val['object'] = _$CreateChatCompletionResponseObjectEnumMap[instance.object]!;
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

const _$CreateChatCompletionResponseObjectEnumMap = {
  CreateChatCompletionResponseObject.chatCompletion: 'chat.completion',
};

_$ChatCompletionResponseChoiceImpl _$$ChatCompletionResponseChoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionResponseChoiceImpl(
      finishReason: $enumDecode(
          _$ChatCompletionFinishReasonEnumMap, json['finish_reason']),
      index: json['index'] as int,
      message: ChatCompletionMessage.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatCompletionResponseChoiceImplToJson(
        _$ChatCompletionResponseChoiceImpl instance) =>
    <String, dynamic>{
      'finish_reason':
          _$ChatCompletionFinishReasonEnumMap[instance.finishReason]!,
      'index': instance.index,
      'message': instance.message.toJson(),
    };

const _$ChatCompletionFinishReasonEnumMap = {
  ChatCompletionFinishReason.stop: 'stop',
  ChatCompletionFinishReason.length: 'length',
  ChatCompletionFinishReason.toolCalls: 'tool_calls',
  ChatCompletionFinishReason.contentFilter: 'content_filter',
  ChatCompletionFinishReason.functionCall: 'function_call',
};

_$CreateChatCompletionStreamResponseImpl
    _$$CreateChatCompletionStreamResponseImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateChatCompletionStreamResponseImpl(
          id: json['id'] as String,
          choices: (json['choices'] as List<dynamic>)
              .map((e) => ChatCompletionStreamResponseChoice.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          created: json['created'] as int,
          model: json['model'] as String,
          systemFingerprint: json['system_fingerprint'] as String?,
          object: $enumDecode(_$CreateChatCompletionStreamResponseObjectEnumMap,
              json['object']),
        );

Map<String, dynamic> _$$CreateChatCompletionStreamResponseImplToJson(
    _$CreateChatCompletionStreamResponseImpl instance) {
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
  val['object'] =
      _$CreateChatCompletionStreamResponseObjectEnumMap[instance.object]!;
  return val;
}

const _$CreateChatCompletionStreamResponseObjectEnumMap = {
  CreateChatCompletionStreamResponseObject.chatCompletionChunk:
      'chat.completion.chunk',
};

_$ChatCompletionStreamResponseChoiceImpl
    _$$ChatCompletionStreamResponseChoiceImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseChoiceImpl(
          delta: ChatCompletionStreamResponseDelta.fromJson(
              json['delta'] as Map<String, dynamic>),
          finishReason: $enumDecodeNullable(
              _$ChatCompletionFinishReasonEnumMap, json['finish_reason'],
              unknownValue: JsonKey.nullForUndefinedEnumValue),
          index: json['index'] as int,
        );

Map<String, dynamic> _$$ChatCompletionStreamResponseChoiceImplToJson(
        _$ChatCompletionStreamResponseChoiceImpl instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'finish_reason':
          _$ChatCompletionFinishReasonEnumMap[instance.finishReason],
      'index': instance.index,
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
      usage: EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateEmbeddingResponseImplToJson(
        _$CreateEmbeddingResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'object': _$CreateEmbeddingResponseObjectEnumMap[instance.object]!,
      'usage': instance.usage.toJson(),
    };

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
