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
      stop: const _CompletionStopConverter().fromJson(json['stop']),
      stream: json['stream'] as bool? ?? false,
      suffix: json['suffix'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateCompletionRequestImplToJson(
    _$CreateCompletionRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _CompletionModelConverter().toJson(instance.model));
  writeNotNull(
      'prompt',
      _$JsonConverterToJson<Object?, CompletionPrompt>(
          instance.prompt, const _CompletionPromptConverter().toJson));
  writeNotNull('best_of', instance.bestOf);
  writeNotNull('echo', instance.echo);
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('logit_bias', instance.logitBias);
  writeNotNull('logprobs', instance.logprobs);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('n', instance.n);
  writeNotNull('presence_penalty', instance.presencePenalty);
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

_$UnionCompletionModelEnumImpl _$$UnionCompletionModelEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionCompletionModelEnumImpl(
      $enumDecode(_$CompletionModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionCompletionModelEnumImplToJson(
        _$UnionCompletionModelEnumImpl instance) =>
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

_$UnionCompletionModelStringImpl _$$UnionCompletionModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionCompletionModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionCompletionModelStringImplToJson(
        _$UnionCompletionModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionPromptArrayImpl _$$UnionCompletionPromptArrayImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionCompletionPromptArrayImpl(
      (json['value'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionCompletionPromptArrayImplToJson(
        _$UnionCompletionPromptArrayImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionPromptArrayIntegerImpl
    _$$UnionCompletionPromptArrayIntegerImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionCompletionPromptArrayIntegerImpl(
          (json['value'] as List<dynamic>).map((e) => e as int).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionCompletionPromptArrayIntegerImplToJson(
        _$UnionCompletionPromptArrayIntegerImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionPromptArrayStringImpl
    _$$UnionCompletionPromptArrayStringImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionCompletionPromptArrayStringImpl(
          (json['value'] as List<dynamic>).map((e) => e as String).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionCompletionPromptArrayStringImplToJson(
        _$UnionCompletionPromptArrayStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionPromptStringImpl _$$UnionCompletionPromptStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionCompletionPromptStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionCompletionPromptStringImplToJson(
        _$UnionCompletionPromptStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionStopArrayStringImpl
    _$$UnionCompletionStopArrayStringImplFromJson(Map<String, dynamic> json) =>
        _$UnionCompletionStopArrayStringImpl(
          (json['value'] as List<dynamic>).map((e) => e as String).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionCompletionStopArrayStringImplToJson(
        _$UnionCompletionStopArrayStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionCompletionStopStringImpl _$$UnionCompletionStopStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionCompletionStopStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionCompletionStopStringImplToJson(
        _$UnionCompletionStopStringImpl instance) =>
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
      object: json['object'] as String,
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
    'object': instance.object,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

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
    _$CompletionChoiceImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'finish_reason', _$CompletionFinishReasonEnumMap[instance.finishReason]);
  val['index'] = instance.index;
  writeNotNull('logprobs', instance.logprobs?.toJson());
  val['text'] = instance.text;
  return val;
}

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
      functionCall: const _ChatCompletionFunctionCallConverter()
          .fromJson(json['function_call']),
      functions: (json['functions'] as List<dynamic>?)
          ?.map(
              (e) => ChatCompletionFunction.fromJson(e as Map<String, dynamic>))
          .toList(),
      logitBias: (json['logit_bias'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      maxTokens: json['max_tokens'] as int?,
      n: json['n'] as int? ?? 1,
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble() ?? 0.0,
      stop: const _ChatCompletionStopConverter().fromJson(json['stop']),
      stream: json['stream'] as bool? ?? false,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 1.0,
      topP: (json['top_p'] as num?)?.toDouble() ?? 1.0,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$CreateChatCompletionRequestImplToJson(
    _$CreateChatCompletionRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _ChatCompletionModelConverter().toJson(instance.model));
  val['messages'] = instance.messages.map((e) => e.toJson()).toList();
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull(
      'function_call',
      const _ChatCompletionFunctionCallConverter()
          .toJson(instance.functionCall));
  writeNotNull(
      'functions', instance.functions?.map((e) => e.toJson()).toList());
  writeNotNull('logit_bias', instance.logitBias);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('n', instance.n);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull(
      'stop', const _ChatCompletionStopConverter().toJson(instance.stop));
  writeNotNull('stream', instance.stream);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('user', instance.user);
  return val;
}

_$UnionChatCompletionModelEnumImpl _$$UnionChatCompletionModelEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionChatCompletionModelEnumImpl(
      $enumDecode(_$ChatCompletionModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionChatCompletionModelEnumImplToJson(
        _$UnionChatCompletionModelEnumImpl instance) =>
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
  ChatCompletionModels.gpt35Turbo: 'gpt-3.5-turbo',
  ChatCompletionModels.gpt35Turbo16k: 'gpt-3.5-turbo-16k',
  ChatCompletionModels.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatCompletionModels.gpt35Turbo0613: 'gpt-3.5-turbo-0613',
  ChatCompletionModels.gpt35Turbo16k0613: 'gpt-3.5-turbo-16k-0613',
};

_$UnionChatCompletionModelStringImpl
    _$$UnionChatCompletionModelStringImplFromJson(Map<String, dynamic> json) =>
        _$UnionChatCompletionModelStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionChatCompletionModelStringImplToJson(
        _$UnionChatCompletionModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionChatCompletionFunctionCallEnumImpl
    _$$UnionChatCompletionFunctionCallEnumImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionChatCompletionFunctionCallEnumImpl(
          $enumDecode(_$ChatCompletionFunctionCallModeEnumMap, json['value']),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionChatCompletionFunctionCallEnumImplToJson(
        _$UnionChatCompletionFunctionCallEnumImpl instance) =>
    <String, dynamic>{
      'value': _$ChatCompletionFunctionCallModeEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ChatCompletionFunctionCallModeEnumMap = {
  ChatCompletionFunctionCallMode.none: 'none',
  ChatCompletionFunctionCallMode.auto: 'auto',
};

_$UnionChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl
    _$$UnionChatCompletionFunctionCallChatCompletionFunctionCallOptionImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl(
          ChatCompletionFunctionCallOption.fromJson(
              json['value'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic>
    _$$UnionChatCompletionFunctionCallChatCompletionFunctionCallOptionImplToJson(
            _$UnionChatCompletionFunctionCallChatCompletionFunctionCallOptionImpl
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
          'runtimeType': instance.$type,
        };

_$UnionChatCompletionStopArrayStringImpl
    _$$UnionChatCompletionStopArrayStringImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionChatCompletionStopArrayStringImpl(
          (json['value'] as List<dynamic>).map((e) => e as String).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionChatCompletionStopArrayStringImplToJson(
        _$UnionChatCompletionStopArrayStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionChatCompletionStopStringImpl
    _$$UnionChatCompletionStopStringImplFromJson(Map<String, dynamic> json) =>
        _$UnionChatCompletionStopStringImpl(
          json['value'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionChatCompletionStopStringImplToJson(
        _$UnionChatCompletionStopStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$ChatCompletionMessageImpl _$$ChatCompletionMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionMessageImpl(
      role: $enumDecode(_$ChatCompletionMessageRoleEnumMap, json['role']),
      content: json['content'] as String?,
      functionCall: json['function_call'] == null
          ? null
          : ChatCompletionMessageFunctionCall.fromJson(
              json['function_call'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ChatCompletionMessageImplToJson(
    _$ChatCompletionMessageImpl instance) {
  final val = <String, dynamic>{
    'role': _$ChatCompletionMessageRoleEnumMap[instance.role]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('function_call', instance.functionCall?.toJson());
  writeNotNull('name', instance.name);
  return val;
}

const _$ChatCompletionMessageRoleEnumMap = {
  ChatCompletionMessageRole.system: 'system',
  ChatCompletionMessageRole.user: 'user',
  ChatCompletionMessageRole.assistant: 'assistant',
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

_$ChatCompletionFunctionImpl _$$ChatCompletionFunctionImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCompletionFunctionImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      parameters: json['parameters'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ChatCompletionFunctionImplToJson(
    _$ChatCompletionFunctionImpl instance) {
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
      object: json['object'] as String,
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
    'object': instance.object,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

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
  ChatCompletionFinishReason.functionCall: 'function_call',
  ChatCompletionFinishReason.contentFilter: 'content_filter',
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
          object: json['object'] as String,
        );

Map<String, dynamic> _$$CreateChatCompletionStreamResponseImplToJson(
        _$CreateChatCompletionStreamResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'created': instance.created,
      'model': instance.model,
      'object': instance.object,
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
    _$ChatCompletionStreamResponseChoiceImpl instance) {
  final val = <String, dynamic>{
    'delta': instance.delta.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('finish_reason',
      _$ChatCompletionFinishReasonEnumMap[instance.finishReason]);
  val['index'] = instance.index;
  return val;
}

_$ChatCompletionStreamResponseDeltaImpl
    _$$ChatCompletionStreamResponseDeltaImplFromJson(
            Map<String, dynamic> json) =>
        _$ChatCompletionStreamResponseDeltaImpl(
          content: json['content'] as String?,
          functionCall: json['function_call'] == null
              ? null
              : ChatCompletionMessageFunctionCall.fromJson(
                  json['function_call'] as Map<String, dynamic>),
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
  writeNotNull('role', _$ChatCompletionMessageRoleEnumMap[instance.role]);
  return val;
}

_$CompletionUsageImpl _$$CompletionUsageImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionUsageImpl(
      completionTokens: json['completion_tokens'] as int?,
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$CompletionUsageImplToJson(
    _$CompletionUsageImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('completion_tokens', instance.completionTokens);
  val['prompt_tokens'] = instance.promptTokens;
  val['total_tokens'] = instance.totalTokens;
  return val;
}

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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _EmbeddingModelConverter().toJson(instance.model));
  writeNotNull(
      'input', const _EmbeddingInputConverter().toJson(instance.input));
  val['encoding_format'] =
      _$EmbeddingEncodingFormatEnumMap[instance.encodingFormat]!;
  writeNotNull('user', instance.user);
  return val;
}

const _$EmbeddingEncodingFormatEnumMap = {
  EmbeddingEncodingFormat.float: 'float',
  EmbeddingEncodingFormat.base64: 'base64',
};

_$UnionEmbeddingModelEnumImpl _$$UnionEmbeddingModelEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionEmbeddingModelEnumImpl(
      $enumDecode(_$EmbeddingModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionEmbeddingModelEnumImplToJson(
        _$UnionEmbeddingModelEnumImpl instance) =>
    <String, dynamic>{
      'value': _$EmbeddingModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$EmbeddingModelsEnumMap = {
  EmbeddingModels.textEmbeddingAda002: 'text-embedding-ada-002',
};

_$UnionEmbeddingModelStringImpl _$$UnionEmbeddingModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionEmbeddingModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionEmbeddingModelStringImplToJson(
        _$UnionEmbeddingModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionEmbeddingInputArrayImpl _$$UnionEmbeddingInputArrayImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionEmbeddingInputArrayImpl(
      (json['value'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionEmbeddingInputArrayImplToJson(
        _$UnionEmbeddingInputArrayImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionEmbeddingInputArrayIntegerImpl
    _$$UnionEmbeddingInputArrayIntegerImplFromJson(Map<String, dynamic> json) =>
        _$UnionEmbeddingInputArrayIntegerImpl(
          (json['value'] as List<dynamic>).map((e) => e as int).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionEmbeddingInputArrayIntegerImplToJson(
        _$UnionEmbeddingInputArrayIntegerImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionEmbeddingInputArrayStringImpl
    _$$UnionEmbeddingInputArrayStringImplFromJson(Map<String, dynamic> json) =>
        _$UnionEmbeddingInputArrayStringImpl(
          (json['value'] as List<dynamic>).map((e) => e as String).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionEmbeddingInputArrayStringImplToJson(
        _$UnionEmbeddingInputArrayStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionEmbeddingInputStringImpl _$$UnionEmbeddingInputStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionEmbeddingInputStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionEmbeddingInputStringImplToJson(
        _$UnionEmbeddingInputStringImpl instance) =>
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
      object: json['object'] as String,
      usage: EmbeddingUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateEmbeddingResponseImplToJson(
        _$CreateEmbeddingResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'model': instance.model,
      'object': instance.object,
      'usage': instance.usage.toJson(),
    };

_$EmbeddingImpl _$$EmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$EmbeddingImpl(
      index: json['index'] as int,
      embedding: const _EmbeddingVectorConverter().fromJson(json['embedding']),
      object: json['object'] as String,
    );

Map<String, dynamic> _$$EmbeddingImplToJson(_$EmbeddingImpl instance) {
  final val = <String, dynamic>{
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embedding',
      const _EmbeddingVectorConverter().toJson(instance.embedding));
  val['object'] = instance.object;
  return val;
}

_$UnionEmbeddingVectorArrayNumberImpl
    _$$UnionEmbeddingVectorArrayNumberImplFromJson(Map<String, dynamic> json) =>
        _$UnionEmbeddingVectorArrayNumberImpl(
          (json['value'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionEmbeddingVectorArrayNumberImplToJson(
        _$UnionEmbeddingVectorArrayNumberImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionEmbeddingVectorStringImpl _$$UnionEmbeddingVectorStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionEmbeddingVectorStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionEmbeddingVectorStringImplToJson(
        _$UnionEmbeddingVectorStringImpl instance) =>
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'model', const _FineTuningModelConverter().toJson(instance.model));
  val['training_file'] = instance.trainingFile;
  writeNotNull('hyperparameters', instance.hyperparameters?.toJson());
  writeNotNull('suffix', instance.suffix);
  writeNotNull('validation_file', instance.validationFile);
  return val;
}

_$UnionFineTuningModelEnumImpl _$$UnionFineTuningModelEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionFineTuningModelEnumImpl(
      $enumDecode(_$FineTuningModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionFineTuningModelEnumImplToJson(
        _$UnionFineTuningModelEnumImpl instance) =>
    <String, dynamic>{
      'value': _$FineTuningModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$FineTuningModelsEnumMap = {
  FineTuningModels.babbage002: 'babbage-002',
  FineTuningModels.davinci002: 'davinci-002',
  FineTuningModels.gpt35Turbo: 'gpt-3.5-turbo',
};

_$UnionFineTuningModelStringImpl _$$UnionFineTuningModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionFineTuningModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionFineTuningModelStringImplToJson(
        _$UnionFineTuningModelStringImpl instance) =>
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
      object: json['object'] as String,
      organizationId: json['organization_id'] as String,
      resultFiles: (json['result_files'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$FineTuningJobStatusEnumMap, json['status']),
      trainedTokens: json['trained_tokens'] as int?,
      trainingFile: json['training_file'] as String,
      validationFile: json['validation_file'] as String?,
    );

Map<String, dynamic> _$$FineTuningJobImplToJson(_$FineTuningJobImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error?.toJson());
  writeNotNull('fine_tuned_model', instance.fineTunedModel);
  writeNotNull('finished_at', instance.finishedAt);
  val['hyperparameters'] = instance.hyperparameters.toJson();
  val['model'] = instance.model;
  val['object'] = instance.object;
  val['organization_id'] = instance.organizationId;
  val['result_files'] = instance.resultFiles;
  val['status'] = _$FineTuningJobStatusEnumMap[instance.status]!;
  writeNotNull('trained_tokens', instance.trainedTokens);
  val['training_file'] = instance.trainingFile;
  writeNotNull('validation_file', instance.validationFile);
  return val;
}

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
    _$FineTuningJobErrorImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('param', instance.param);
  return val;
}

_$FineTuningJobHyperparametersImpl _$$FineTuningJobHyperparametersImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobHyperparametersImpl(
      nEpochs: const _FineTuningNEpochsConverter().fromJson(json['n_epochs']),
    );

Map<String, dynamic> _$$FineTuningJobHyperparametersImplToJson(
    _$FineTuningJobHyperparametersImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'n_epochs', const _FineTuningNEpochsConverter().toJson(instance.nEpochs));
  return val;
}

_$UnionFineTuningNEpochsEnumImpl _$$UnionFineTuningNEpochsEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionFineTuningNEpochsEnumImpl(
      $enumDecode(_$FineTuningNEpochsOptionsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionFineTuningNEpochsEnumImplToJson(
        _$UnionFineTuningNEpochsEnumImpl instance) =>
    <String, dynamic>{
      'value': _$FineTuningNEpochsOptionsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$FineTuningNEpochsOptionsEnumMap = {
  FineTuningNEpochsOptions.auto: 'auto',
};

_$UnionFineTuningNEpochsIntegerImpl
    _$$UnionFineTuningNEpochsIntegerImplFromJson(Map<String, dynamic> json) =>
        _$UnionFineTuningNEpochsIntegerImpl(
          json['value'] as int,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionFineTuningNEpochsIntegerImplToJson(
        _$UnionFineTuningNEpochsIntegerImpl instance) =>
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
          object: json['object'] as String,
        );

Map<String, dynamic> _$$ListPaginatedFineTuningJobsResponseImplToJson(
        _$ListPaginatedFineTuningJobsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
      'object': instance.object,
    };

_$ListFineTuningJobEventsResponseImpl
    _$$ListFineTuningJobEventsResponseImplFromJson(Map<String, dynamic> json) =>
        _$ListFineTuningJobEventsResponseImpl(
          data: (json['data'] as List<dynamic>)
              .map(
                  (e) => FineTuningJobEvent.fromJson(e as Map<String, dynamic>))
              .toList(),
          object: json['object'] as String,
        );

Map<String, dynamic> _$$ListFineTuningJobEventsResponseImplToJson(
        _$ListFineTuningJobEventsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'object': instance.object,
    };

_$FineTuningJobEventImpl _$$FineTuningJobEventImplFromJson(
        Map<String, dynamic> json) =>
    _$FineTuningJobEventImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as int,
      level: $enumDecode(_$FineTuningJobEventLevelEnumMap, json['level']),
      message: json['message'] as String,
      object: json['object'] as String,
    );

Map<String, dynamic> _$$FineTuningJobEventImplToJson(
        _$FineTuningJobEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'level': _$FineTuningJobEventLevelEnumMap[instance.level]!,
      'message': instance.message,
      'object': instance.object,
    };

const _$FineTuningJobEventLevelEnumMap = {
  FineTuningJobEventLevel.info: 'info',
  FineTuningJobEventLevel.warn: 'warn',
  FineTuningJobEventLevel.error: 'error',
};

_$CreateImageRequestImpl _$$CreateImageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateImageRequestImpl(
      prompt: json['prompt'] as String,
      n: json['n'] as int? ?? 1,
      responseFormat: $enumDecodeNullable(
              _$ImageResponseFormatEnumMap, json['response_format'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          ImageResponseFormat.url,
      size: $enumDecodeNullable(_$ImageSizeEnumMap, json['size'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          ImageSize.v1024x1024,
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

  writeNotNull('n', instance.n);
  writeNotNull(
      'response_format', _$ImageResponseFormatEnumMap[instance.responseFormat]);
  writeNotNull('size', _$ImageSizeEnumMap[instance.size]);
  writeNotNull('user', instance.user);
  return val;
}

const _$ImageResponseFormatEnumMap = {
  ImageResponseFormat.url: 'url',
  ImageResponseFormat.b64Json: 'b64_json',
};

const _$ImageSizeEnumMap = {
  ImageSize.v256x256: '256x256',
  ImageSize.v512x512: '512x512',
  ImageSize.v1024x1024: '1024x1024',
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
  return val;
}

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      id: json['id'] as String,
      created: json['created'] as int,
      object: json['object'] as String,
      ownedBy: json['owned_by'] as String,
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'object': instance.object,
      'owned_by': instance.ownedBy,
    };

_$ListModelsResponseImpl _$$ListModelsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListModelsResponseImpl(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListModelsResponseImplToJson(
        _$ListModelsResponseImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map((e) => e.toJson()).toList(),
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
          ? const ModerationModel.string('text-moderation-latest')
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
  writeNotNull(
      'input', const _ModerationInputConverter().toJson(instance.input));
  return val;
}

_$UnionModerationModelEnumImpl _$$UnionModerationModelEnumImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionModerationModelEnumImpl(
      $enumDecode(_$ModerationModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionModerationModelEnumImplToJson(
        _$UnionModerationModelEnumImpl instance) =>
    <String, dynamic>{
      'value': _$ModerationModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ModerationModelsEnumMap = {
  ModerationModels.textModerationLatest: 'text-moderation-latest',
  ModerationModels.textModerationStable: 'text-moderation-stable',
};

_$UnionModerationModelStringImpl _$$UnionModerationModelStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionModerationModelStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionModerationModelStringImplToJson(
        _$UnionModerationModelStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionModerationInputArrayStringImpl
    _$$UnionModerationInputArrayStringImplFromJson(Map<String, dynamic> json) =>
        _$UnionModerationInputArrayStringImpl(
          (json['value'] as List<dynamic>).map((e) => e as String).toList(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$UnionModerationInputArrayStringImplToJson(
        _$UnionModerationInputArrayStringImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$UnionModerationInputStringImpl _$$UnionModerationInputStringImplFromJson(
        Map<String, dynamic> json) =>
    _$UnionModerationInputStringImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnionModerationInputStringImplToJson(
        _$UnionModerationInputStringImpl instance) =>
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

_$UnionCompletionFunctionCallOptionChatImpl
    _$$UnionCompletionFunctionCallOptionChatImplFromJson(
            Map<String, dynamic> json) =>
        _$UnionCompletionFunctionCallOptionChatImpl(
          name: json['name'] as String,
        );

Map<String, dynamic> _$$UnionCompletionFunctionCallOptionChatImplToJson(
        _$UnionCompletionFunctionCallOptionChatImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
