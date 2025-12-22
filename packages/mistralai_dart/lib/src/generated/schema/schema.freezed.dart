// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatCompletionRequest {

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@_ChatCompletionModelConverter() ChatCompletionModel get model;/// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
 List<ChatCompletionMessage> get messages;/// What sampling temperature to use, between 0.0 and 1.5. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
///
/// We generally recommend altering this or `top_p` but not both.
@JsonKey(includeIfNull: false) double? get temperature;/// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
///
/// We generally recommend altering this or `temperature` but not both.
@JsonKey(name: 'top_p', includeIfNull: false) double? get topP;/// The maximum number of tokens to generate in the completion.
///
/// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
@JsonKey(name: 'max_tokens', includeIfNull: false) int? get maxTokens;/// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
@JsonKey(includeIfNull: false) bool? get stream;/// Stop generation if this token is detected, or if the end of the sequence is detected.
@_ChatCompletionStopConverter()@JsonKey(includeIfNull: false) ChatCompletionStop? get stop;/// The seed to use for random sampling. If set, different calls will generate deterministic results.
@JsonKey(name: 'random_seed', includeIfNull: false) int? get randomSeed;/// An object specifying the format that the model must output.
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message
/// the model generates is valid JSON.
/// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
/// which guarantees the model will match your supplied JSON schema.
@JsonKey(name: 'response_format', includeIfNull: false) ResponseFormat? get responseFormat;/// A list of tools the model may call. Currently, only functions are supported as a tool.
/// Use this to provide a list of functions the model may generate JSON inputs for.
@JsonKey(includeIfNull: false) List<Tool>? get tools;/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tool and instead generates a message.
/// `auto` means the model can pick between generating a message or calling one or more tools.
/// `any` means the model must call one or more tools.
/// `required` is an alias for `any`.
/// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}`
/// forces the model to call that tool.
@_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false) ChatCompletionToolChoice? get toolChoice;/// Positive values penalize new tokens based on whether they appear in the text so far,
/// increasing the model's likelihood to talk about new topics.
@JsonKey(name: 'presence_penalty', includeIfNull: false) double? get presencePenalty;/// Positive values penalize new tokens based on their existing frequency in the text so far,
/// decreasing the model's likelihood to repeat the same line verbatim.
@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? get frequencyPenalty;/// Number of completions to return for each request.
@JsonKey(includeIfNull: false) int? get n;/// Whether to enable parallel function calling during tool use.
@JsonKey(name: 'parallel_tool_calls', includeIfNull: false) bool? get parallelToolCalls;/// Whether to inject a safety prompt before all conversations.
@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? get safePrompt;/// Custom metadata to associate with the request.
@JsonKey(includeIfNull: false) Map<String, dynamic>? get metadata;/// A prediction object used to provide expected output for the model.
/// This can help reduce latency by allowing the model to skip generating tokens
/// that match the prediction.
@JsonKey(includeIfNull: false) Prediction? get prediction;/// The prompt mode to use for the request.
/// Use 'reasoning' to enable reasoning mode for supported models.
@JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MistralPromptMode? get promptMode;
/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionRequestCopyWith<ChatCompletionRequest> get copyWith => _$ChatCompletionRequestCopyWithImpl<ChatCompletionRequest>(this as ChatCompletionRequest, _$identity);

  /// Serializes this ChatCompletionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.stop, stop) || other.stop == stop)&&(identical(other.randomSeed, randomSeed) || other.randomSeed == randomSeed)&&(identical(other.responseFormat, responseFormat) || other.responseFormat == responseFormat)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&(identical(other.presencePenalty, presencePenalty) || other.presencePenalty == presencePenalty)&&(identical(other.frequencyPenalty, frequencyPenalty) || other.frequencyPenalty == frequencyPenalty)&&(identical(other.n, n) || other.n == n)&&(identical(other.parallelToolCalls, parallelToolCalls) || other.parallelToolCalls == parallelToolCalls)&&(identical(other.safePrompt, safePrompt) || other.safePrompt == safePrompt)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.prediction, prediction) || other.prediction == prediction)&&(identical(other.promptMode, promptMode) || other.promptMode == promptMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,model,const DeepCollectionEquality().hash(messages),temperature,topP,maxTokens,stream,stop,randomSeed,responseFormat,const DeepCollectionEquality().hash(tools),toolChoice,presencePenalty,frequencyPenalty,n,parallelToolCalls,safePrompt,const DeepCollectionEquality().hash(metadata),prediction,promptMode]);

@override
String toString() {
  return 'ChatCompletionRequest(model: $model, messages: $messages, temperature: $temperature, topP: $topP, maxTokens: $maxTokens, stream: $stream, stop: $stop, randomSeed: $randomSeed, responseFormat: $responseFormat, tools: $tools, toolChoice: $toolChoice, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, n: $n, parallelToolCalls: $parallelToolCalls, safePrompt: $safePrompt, metadata: $metadata, prediction: $prediction, promptMode: $promptMode)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionRequestCopyWith<$Res>  {
  factory $ChatCompletionRequestCopyWith(ChatCompletionRequest value, $Res Function(ChatCompletionRequest) _then) = _$ChatCompletionRequestCopyWithImpl;
@useResult
$Res call({
@_ChatCompletionModelConverter() ChatCompletionModel model, List<ChatCompletionMessage> messages,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,@JsonKey(includeIfNull: false) bool? stream,@_ChatCompletionStopConverter()@JsonKey(includeIfNull: false) ChatCompletionStop? stop,@JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed,@JsonKey(name: 'response_format', includeIfNull: false) ResponseFormat? responseFormat,@JsonKey(includeIfNull: false) List<Tool>? tools,@_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false) ChatCompletionToolChoice? toolChoice,@JsonKey(name: 'presence_penalty', includeIfNull: false) double? presencePenalty,@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? frequencyPenalty,@JsonKey(includeIfNull: false) int? n,@JsonKey(name: 'parallel_tool_calls', includeIfNull: false) bool? parallelToolCalls,@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,@JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,@JsonKey(includeIfNull: false) Prediction? prediction,@JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MistralPromptMode? promptMode
});


$ChatCompletionModelCopyWith<$Res> get model;$ChatCompletionStopCopyWith<$Res>? get stop;$ResponseFormatCopyWith<$Res>? get responseFormat;$ChatCompletionToolChoiceCopyWith<$Res>? get toolChoice;$PredictionCopyWith<$Res>? get prediction;

}
/// @nodoc
class _$ChatCompletionRequestCopyWithImpl<$Res>
    implements $ChatCompletionRequestCopyWith<$Res> {
  _$ChatCompletionRequestCopyWithImpl(this._self, this._then);

  final ChatCompletionRequest _self;
  final $Res Function(ChatCompletionRequest) _then;

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,Object? temperature = freezed,Object? topP = freezed,Object? maxTokens = freezed,Object? stream = freezed,Object? stop = freezed,Object? randomSeed = freezed,Object? responseFormat = freezed,Object? tools = freezed,Object? toolChoice = freezed,Object? presencePenalty = freezed,Object? frequencyPenalty = freezed,Object? n = freezed,Object? parallelToolCalls = freezed,Object? safePrompt = freezed,Object? metadata = freezed,Object? prediction = freezed,Object? promptMode = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ChatCompletionModel,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionMessage>,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,maxTokens: freezed == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,stop: freezed == stop ? _self.stop : stop // ignore: cast_nullable_to_non_nullable
as ChatCompletionStop?,randomSeed: freezed == randomSeed ? _self.randomSeed : randomSeed // ignore: cast_nullable_to_non_nullable
as int?,responseFormat: freezed == responseFormat ? _self.responseFormat : responseFormat // ignore: cast_nullable_to_non_nullable
as ResponseFormat?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ChatCompletionToolChoice?,presencePenalty: freezed == presencePenalty ? _self.presencePenalty : presencePenalty // ignore: cast_nullable_to_non_nullable
as double?,frequencyPenalty: freezed == frequencyPenalty ? _self.frequencyPenalty : frequencyPenalty // ignore: cast_nullable_to_non_nullable
as double?,n: freezed == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as int?,parallelToolCalls: freezed == parallelToolCalls ? _self.parallelToolCalls : parallelToolCalls // ignore: cast_nullable_to_non_nullable
as bool?,safePrompt: freezed == safePrompt ? _self.safePrompt : safePrompt // ignore: cast_nullable_to_non_nullable
as bool?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,prediction: freezed == prediction ? _self.prediction : prediction // ignore: cast_nullable_to_non_nullable
as Prediction?,promptMode: freezed == promptMode ? _self.promptMode : promptMode // ignore: cast_nullable_to_non_nullable
as MistralPromptMode?,
  ));
}
/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionModelCopyWith<$Res> get model {
  
  return $ChatCompletionModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionStopCopyWith<$Res>? get stop {
    if (_self.stop == null) {
    return null;
  }

  return $ChatCompletionStopCopyWith<$Res>(_self.stop!, (value) {
    return _then(_self.copyWith(stop: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseFormatCopyWith<$Res>? get responseFormat {
    if (_self.responseFormat == null) {
    return null;
  }

  return $ResponseFormatCopyWith<$Res>(_self.responseFormat!, (value) {
    return _then(_self.copyWith(responseFormat: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ChatCompletionToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PredictionCopyWith<$Res>? get prediction {
    if (_self.prediction == null) {
    return null;
  }

  return $PredictionCopyWith<$Res>(_self.prediction!, (value) {
    return _then(_self.copyWith(prediction: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatCompletionRequest].
extension ChatCompletionRequestPatterns on ChatCompletionRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @_ChatCompletionStopConverter()@JsonKey(includeIfNull: false)  ChatCompletionStop? stop, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed, @JsonKey(name: 'response_format', includeIfNull: false)  ResponseFormat? responseFormat, @JsonKey(includeIfNull: false)  List<Tool>? tools, @_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false)  ChatCompletionToolChoice? toolChoice, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? n, @JsonKey(name: 'parallel_tool_calls', includeIfNull: false)  bool? parallelToolCalls, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(includeIfNull: false)  Map<String, dynamic>? metadata, @JsonKey(includeIfNull: false)  Prediction? prediction, @JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MistralPromptMode? promptMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.stop,_that.randomSeed,_that.responseFormat,_that.tools,_that.toolChoice,_that.presencePenalty,_that.frequencyPenalty,_that.n,_that.parallelToolCalls,_that.safePrompt,_that.metadata,_that.prediction,_that.promptMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @_ChatCompletionStopConverter()@JsonKey(includeIfNull: false)  ChatCompletionStop? stop, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed, @JsonKey(name: 'response_format', includeIfNull: false)  ResponseFormat? responseFormat, @JsonKey(includeIfNull: false)  List<Tool>? tools, @_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false)  ChatCompletionToolChoice? toolChoice, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? n, @JsonKey(name: 'parallel_tool_calls', includeIfNull: false)  bool? parallelToolCalls, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(includeIfNull: false)  Map<String, dynamic>? metadata, @JsonKey(includeIfNull: false)  Prediction? prediction, @JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MistralPromptMode? promptMode)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionRequest():
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.stop,_that.randomSeed,_that.responseFormat,_that.tools,_that.toolChoice,_that.presencePenalty,_that.frequencyPenalty,_that.n,_that.parallelToolCalls,_that.safePrompt,_that.metadata,_that.prediction,_that.promptMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @_ChatCompletionStopConverter()@JsonKey(includeIfNull: false)  ChatCompletionStop? stop, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed, @JsonKey(name: 'response_format', includeIfNull: false)  ResponseFormat? responseFormat, @JsonKey(includeIfNull: false)  List<Tool>? tools, @_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false)  ChatCompletionToolChoice? toolChoice, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? n, @JsonKey(name: 'parallel_tool_calls', includeIfNull: false)  bool? parallelToolCalls, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(includeIfNull: false)  Map<String, dynamic>? metadata, @JsonKey(includeIfNull: false)  Prediction? prediction, @JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MistralPromptMode? promptMode)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.stop,_that.randomSeed,_that.responseFormat,_that.tools,_that.toolChoice,_that.presencePenalty,_that.frequencyPenalty,_that.n,_that.parallelToolCalls,_that.safePrompt,_that.metadata,_that.prediction,_that.promptMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionRequest extends ChatCompletionRequest {
  const _ChatCompletionRequest({@_ChatCompletionModelConverter() required this.model, required final  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false) this.temperature, @JsonKey(name: 'top_p', includeIfNull: false) this.topP, @JsonKey(name: 'max_tokens', includeIfNull: false) this.maxTokens, @JsonKey(includeIfNull: false) this.stream, @_ChatCompletionStopConverter()@JsonKey(includeIfNull: false) this.stop, @JsonKey(name: 'random_seed', includeIfNull: false) this.randomSeed, @JsonKey(name: 'response_format', includeIfNull: false) this.responseFormat, @JsonKey(includeIfNull: false) final  List<Tool>? tools, @_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false) this.toolChoice, @JsonKey(name: 'presence_penalty', includeIfNull: false) this.presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false) this.frequencyPenalty, @JsonKey(includeIfNull: false) this.n, @JsonKey(name: 'parallel_tool_calls', includeIfNull: false) this.parallelToolCalls = true, @JsonKey(name: 'safe_prompt', includeIfNull: false) this.safePrompt, @JsonKey(includeIfNull: false) final  Map<String, dynamic>? metadata, @JsonKey(includeIfNull: false) this.prediction, @JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.promptMode}): _messages = messages,_tools = tools,_metadata = metadata,super._();
  factory _ChatCompletionRequest.fromJson(Map<String, dynamic> json) => _$ChatCompletionRequestFromJson(json);

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@override@_ChatCompletionModelConverter() final  ChatCompletionModel model;
/// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
 final  List<ChatCompletionMessage> _messages;
/// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
@override List<ChatCompletionMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// What sampling temperature to use, between 0.0 and 1.5. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
///
/// We generally recommend altering this or `top_p` but not both.
@override@JsonKey(includeIfNull: false) final  double? temperature;
/// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
///
/// We generally recommend altering this or `temperature` but not both.
@override@JsonKey(name: 'top_p', includeIfNull: false) final  double? topP;
/// The maximum number of tokens to generate in the completion.
///
/// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
@override@JsonKey(name: 'max_tokens', includeIfNull: false) final  int? maxTokens;
/// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
@override@JsonKey(includeIfNull: false) final  bool? stream;
/// Stop generation if this token is detected, or if the end of the sequence is detected.
@override@_ChatCompletionStopConverter()@JsonKey(includeIfNull: false) final  ChatCompletionStop? stop;
/// The seed to use for random sampling. If set, different calls will generate deterministic results.
@override@JsonKey(name: 'random_seed', includeIfNull: false) final  int? randomSeed;
/// An object specifying the format that the model must output.
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message
/// the model generates is valid JSON.
/// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
/// which guarantees the model will match your supplied JSON schema.
@override@JsonKey(name: 'response_format', includeIfNull: false) final  ResponseFormat? responseFormat;
/// A list of tools the model may call. Currently, only functions are supported as a tool.
/// Use this to provide a list of functions the model may generate JSON inputs for.
 final  List<Tool>? _tools;
/// A list of tools the model may call. Currently, only functions are supported as a tool.
/// Use this to provide a list of functions the model may generate JSON inputs for.
@override@JsonKey(includeIfNull: false) List<Tool>? get tools {
  final value = _tools;
  if (value == null) return null;
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tool and instead generates a message.
/// `auto` means the model can pick between generating a message or calling one or more tools.
/// `any` means the model must call one or more tools.
/// `required` is an alias for `any`.
/// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}`
/// forces the model to call that tool.
@override@_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false) final  ChatCompletionToolChoice? toolChoice;
/// Positive values penalize new tokens based on whether they appear in the text so far,
/// increasing the model's likelihood to talk about new topics.
@override@JsonKey(name: 'presence_penalty', includeIfNull: false) final  double? presencePenalty;
/// Positive values penalize new tokens based on their existing frequency in the text so far,
/// decreasing the model's likelihood to repeat the same line verbatim.
@override@JsonKey(name: 'frequency_penalty', includeIfNull: false) final  double? frequencyPenalty;
/// Number of completions to return for each request.
@override@JsonKey(includeIfNull: false) final  int? n;
/// Whether to enable parallel function calling during tool use.
@override@JsonKey(name: 'parallel_tool_calls', includeIfNull: false) final  bool? parallelToolCalls;
/// Whether to inject a safety prompt before all conversations.
@override@JsonKey(name: 'safe_prompt', includeIfNull: false) final  bool? safePrompt;
/// Custom metadata to associate with the request.
 final  Map<String, dynamic>? _metadata;
/// Custom metadata to associate with the request.
@override@JsonKey(includeIfNull: false) Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// A prediction object used to provide expected output for the model.
/// This can help reduce latency by allowing the model to skip generating tokens
/// that match the prediction.
@override@JsonKey(includeIfNull: false) final  Prediction? prediction;
/// The prompt mode to use for the request.
/// Use 'reasoning' to enable reasoning mode for supported models.
@override@JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  MistralPromptMode? promptMode;

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionRequestCopyWith<_ChatCompletionRequest> get copyWith => __$ChatCompletionRequestCopyWithImpl<_ChatCompletionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.stop, stop) || other.stop == stop)&&(identical(other.randomSeed, randomSeed) || other.randomSeed == randomSeed)&&(identical(other.responseFormat, responseFormat) || other.responseFormat == responseFormat)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.toolChoice, toolChoice) || other.toolChoice == toolChoice)&&(identical(other.presencePenalty, presencePenalty) || other.presencePenalty == presencePenalty)&&(identical(other.frequencyPenalty, frequencyPenalty) || other.frequencyPenalty == frequencyPenalty)&&(identical(other.n, n) || other.n == n)&&(identical(other.parallelToolCalls, parallelToolCalls) || other.parallelToolCalls == parallelToolCalls)&&(identical(other.safePrompt, safePrompt) || other.safePrompt == safePrompt)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.prediction, prediction) || other.prediction == prediction)&&(identical(other.promptMode, promptMode) || other.promptMode == promptMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,model,const DeepCollectionEquality().hash(_messages),temperature,topP,maxTokens,stream,stop,randomSeed,responseFormat,const DeepCollectionEquality().hash(_tools),toolChoice,presencePenalty,frequencyPenalty,n,parallelToolCalls,safePrompt,const DeepCollectionEquality().hash(_metadata),prediction,promptMode]);

@override
String toString() {
  return 'ChatCompletionRequest(model: $model, messages: $messages, temperature: $temperature, topP: $topP, maxTokens: $maxTokens, stream: $stream, stop: $stop, randomSeed: $randomSeed, responseFormat: $responseFormat, tools: $tools, toolChoice: $toolChoice, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, n: $n, parallelToolCalls: $parallelToolCalls, safePrompt: $safePrompt, metadata: $metadata, prediction: $prediction, promptMode: $promptMode)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionRequestCopyWith<$Res> implements $ChatCompletionRequestCopyWith<$Res> {
  factory _$ChatCompletionRequestCopyWith(_ChatCompletionRequest value, $Res Function(_ChatCompletionRequest) _then) = __$ChatCompletionRequestCopyWithImpl;
@override @useResult
$Res call({
@_ChatCompletionModelConverter() ChatCompletionModel model, List<ChatCompletionMessage> messages,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,@JsonKey(includeIfNull: false) bool? stream,@_ChatCompletionStopConverter()@JsonKey(includeIfNull: false) ChatCompletionStop? stop,@JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed,@JsonKey(name: 'response_format', includeIfNull: false) ResponseFormat? responseFormat,@JsonKey(includeIfNull: false) List<Tool>? tools,@_ChatCompletionToolChoiceConverter()@JsonKey(name: 'tool_choice', includeIfNull: false) ChatCompletionToolChoice? toolChoice,@JsonKey(name: 'presence_penalty', includeIfNull: false) double? presencePenalty,@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? frequencyPenalty,@JsonKey(includeIfNull: false) int? n,@JsonKey(name: 'parallel_tool_calls', includeIfNull: false) bool? parallelToolCalls,@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,@JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,@JsonKey(includeIfNull: false) Prediction? prediction,@JsonKey(name: 'prompt_mode', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MistralPromptMode? promptMode
});


@override $ChatCompletionModelCopyWith<$Res> get model;@override $ChatCompletionStopCopyWith<$Res>? get stop;@override $ResponseFormatCopyWith<$Res>? get responseFormat;@override $ChatCompletionToolChoiceCopyWith<$Res>? get toolChoice;@override $PredictionCopyWith<$Res>? get prediction;

}
/// @nodoc
class __$ChatCompletionRequestCopyWithImpl<$Res>
    implements _$ChatCompletionRequestCopyWith<$Res> {
  __$ChatCompletionRequestCopyWithImpl(this._self, this._then);

  final _ChatCompletionRequest _self;
  final $Res Function(_ChatCompletionRequest) _then;

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,Object? temperature = freezed,Object? topP = freezed,Object? maxTokens = freezed,Object? stream = freezed,Object? stop = freezed,Object? randomSeed = freezed,Object? responseFormat = freezed,Object? tools = freezed,Object? toolChoice = freezed,Object? presencePenalty = freezed,Object? frequencyPenalty = freezed,Object? n = freezed,Object? parallelToolCalls = freezed,Object? safePrompt = freezed,Object? metadata = freezed,Object? prediction = freezed,Object? promptMode = freezed,}) {
  return _then(_ChatCompletionRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ChatCompletionModel,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionMessage>,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,maxTokens: freezed == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,stop: freezed == stop ? _self.stop : stop // ignore: cast_nullable_to_non_nullable
as ChatCompletionStop?,randomSeed: freezed == randomSeed ? _self.randomSeed : randomSeed // ignore: cast_nullable_to_non_nullable
as int?,responseFormat: freezed == responseFormat ? _self.responseFormat : responseFormat // ignore: cast_nullable_to_non_nullable
as ResponseFormat?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,toolChoice: freezed == toolChoice ? _self.toolChoice : toolChoice // ignore: cast_nullable_to_non_nullable
as ChatCompletionToolChoice?,presencePenalty: freezed == presencePenalty ? _self.presencePenalty : presencePenalty // ignore: cast_nullable_to_non_nullable
as double?,frequencyPenalty: freezed == frequencyPenalty ? _self.frequencyPenalty : frequencyPenalty // ignore: cast_nullable_to_non_nullable
as double?,n: freezed == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as int?,parallelToolCalls: freezed == parallelToolCalls ? _self.parallelToolCalls : parallelToolCalls // ignore: cast_nullable_to_non_nullable
as bool?,safePrompt: freezed == safePrompt ? _self.safePrompt : safePrompt // ignore: cast_nullable_to_non_nullable
as bool?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,prediction: freezed == prediction ? _self.prediction : prediction // ignore: cast_nullable_to_non_nullable
as Prediction?,promptMode: freezed == promptMode ? _self.promptMode : promptMode // ignore: cast_nullable_to_non_nullable
as MistralPromptMode?,
  ));
}

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionModelCopyWith<$Res> get model {
  
  return $ChatCompletionModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionStopCopyWith<$Res>? get stop {
    if (_self.stop == null) {
    return null;
  }

  return $ChatCompletionStopCopyWith<$Res>(_self.stop!, (value) {
    return _then(_self.copyWith(stop: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseFormatCopyWith<$Res>? get responseFormat {
    if (_self.responseFormat == null) {
    return null;
  }

  return $ResponseFormatCopyWith<$Res>(_self.responseFormat!, (value) {
    return _then(_self.copyWith(responseFormat: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionToolChoiceCopyWith<$Res>? get toolChoice {
    if (_self.toolChoice == null) {
    return null;
  }

  return $ChatCompletionToolChoiceCopyWith<$Res>(_self.toolChoice!, (value) {
    return _then(_self.copyWith(toolChoice: value));
  });
}/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PredictionCopyWith<$Res>? get prediction {
    if (_self.prediction == null) {
    return null;
  }

  return $PredictionCopyWith<$Res>(_self.prediction!, (value) {
    return _then(_self.copyWith(prediction: value));
  });
}
}

ChatCompletionModel _$ChatCompletionModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'model':
          return ChatCompletionModelEnumeration.fromJson(
            json
          );
                case 'modelId':
          return ChatCompletionModelString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ChatCompletionModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ChatCompletionModel {

 Object get value;

  /// Serializes this ChatCompletionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionModel&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ChatCompletionModel(value: $value)';
}


}

/// @nodoc
class $ChatCompletionModelCopyWith<$Res>  {
$ChatCompletionModelCopyWith(ChatCompletionModel _, $Res Function(ChatCompletionModel) __);
}


/// Adds pattern-matching-related methods to [ChatCompletionModel].
extension ChatCompletionModelPatterns on ChatCompletionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatCompletionModelEnumeration value)?  model,TResult Function( ChatCompletionModelString value)?  modelId,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration() when model != null:
return model(_that);case ChatCompletionModelString() when modelId != null:
return modelId(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatCompletionModelEnumeration value)  model,required TResult Function( ChatCompletionModelString value)  modelId,}){
final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration():
return model(_that);case ChatCompletionModelString():
return modelId(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatCompletionModelEnumeration value)?  model,TResult? Function( ChatCompletionModelString value)?  modelId,}){
final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration() when model != null:
return model(_that);case ChatCompletionModelString() when modelId != null:
return modelId(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ChatCompletionModels value)?  model,TResult Function( String value)?  modelId,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration() when model != null:
return model(_that.value);case ChatCompletionModelString() when modelId != null:
return modelId(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ChatCompletionModels value)  model,required TResult Function( String value)  modelId,}) {final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration():
return model(_that.value);case ChatCompletionModelString():
return modelId(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ChatCompletionModels value)?  model,TResult? Function( String value)?  modelId,}) {final _that = this;
switch (_that) {
case ChatCompletionModelEnumeration() when model != null:
return model(_that.value);case ChatCompletionModelString() when modelId != null:
return modelId(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ChatCompletionModelEnumeration extends ChatCompletionModel {
  const ChatCompletionModelEnumeration(this.value, {final  String? $type}): $type = $type ?? 'model',super._();
  factory ChatCompletionModelEnumeration.fromJson(Map<String, dynamic> json) => _$ChatCompletionModelEnumerationFromJson(json);

@override final  ChatCompletionModels value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionModelEnumerationCopyWith<ChatCompletionModelEnumeration> get copyWith => _$ChatCompletionModelEnumerationCopyWithImpl<ChatCompletionModelEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionModelEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionModelEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ChatCompletionModel.model(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionModelEnumerationCopyWith<$Res> implements $ChatCompletionModelCopyWith<$Res> {
  factory $ChatCompletionModelEnumerationCopyWith(ChatCompletionModelEnumeration value, $Res Function(ChatCompletionModelEnumeration) _then) = _$ChatCompletionModelEnumerationCopyWithImpl;
@useResult
$Res call({
 ChatCompletionModels value
});




}
/// @nodoc
class _$ChatCompletionModelEnumerationCopyWithImpl<$Res>
    implements $ChatCompletionModelEnumerationCopyWith<$Res> {
  _$ChatCompletionModelEnumerationCopyWithImpl(this._self, this._then);

  final ChatCompletionModelEnumeration _self;
  final $Res Function(ChatCompletionModelEnumeration) _then;

/// Create a copy of ChatCompletionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionModelEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ChatCompletionModels,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ChatCompletionModelString extends ChatCompletionModel {
  const ChatCompletionModelString(this.value, {final  String? $type}): $type = $type ?? 'modelId',super._();
  factory ChatCompletionModelString.fromJson(Map<String, dynamic> json) => _$ChatCompletionModelStringFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionModelStringCopyWith<ChatCompletionModelString> get copyWith => _$ChatCompletionModelStringCopyWithImpl<ChatCompletionModelString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionModelStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionModelString&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ChatCompletionModel.modelId(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionModelStringCopyWith<$Res> implements $ChatCompletionModelCopyWith<$Res> {
  factory $ChatCompletionModelStringCopyWith(ChatCompletionModelString value, $Res Function(ChatCompletionModelString) _then) = _$ChatCompletionModelStringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ChatCompletionModelStringCopyWithImpl<$Res>
    implements $ChatCompletionModelStringCopyWith<$Res> {
  _$ChatCompletionModelStringCopyWithImpl(this._self, this._then);

  final ChatCompletionModelString _self;
  final $Res Function(ChatCompletionModelString) _then;

/// Create a copy of ChatCompletionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionModelString(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

ChatCompletionStop _$ChatCompletionStopFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'listString':
          return ChatCompletionStopListString.fromJson(
            json
          );
                case 'string':
          return ChatCompletionStopString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ChatCompletionStop',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ChatCompletionStop {

 Object get value;

  /// Serializes this ChatCompletionStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStop&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ChatCompletionStop(value: $value)';
}


}

/// @nodoc
class $ChatCompletionStopCopyWith<$Res>  {
$ChatCompletionStopCopyWith(ChatCompletionStop _, $Res Function(ChatCompletionStop) __);
}


/// Adds pattern-matching-related methods to [ChatCompletionStop].
extension ChatCompletionStopPatterns on ChatCompletionStop {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatCompletionStopListString value)?  listString,TResult Function( ChatCompletionStopString value)?  string,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatCompletionStopListString() when listString != null:
return listString(_that);case ChatCompletionStopString() when string != null:
return string(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatCompletionStopListString value)  listString,required TResult Function( ChatCompletionStopString value)  string,}){
final _that = this;
switch (_that) {
case ChatCompletionStopListString():
return listString(_that);case ChatCompletionStopString():
return string(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatCompletionStopListString value)?  listString,TResult? Function( ChatCompletionStopString value)?  string,}){
final _that = this;
switch (_that) {
case ChatCompletionStopListString() when listString != null:
return listString(_that);case ChatCompletionStopString() when string != null:
return string(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> value)?  listString,TResult Function( String value)?  string,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatCompletionStopListString() when listString != null:
return listString(_that.value);case ChatCompletionStopString() when string != null:
return string(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> value)  listString,required TResult Function( String value)  string,}) {final _that = this;
switch (_that) {
case ChatCompletionStopListString():
return listString(_that.value);case ChatCompletionStopString():
return string(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> value)?  listString,TResult? Function( String value)?  string,}) {final _that = this;
switch (_that) {
case ChatCompletionStopListString() when listString != null:
return listString(_that.value);case ChatCompletionStopString() when string != null:
return string(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ChatCompletionStopListString extends ChatCompletionStop {
  const ChatCompletionStopListString(final  List<String> value, {final  String? $type}): _value = value,$type = $type ?? 'listString',super._();
  factory ChatCompletionStopListString.fromJson(Map<String, dynamic> json) => _$ChatCompletionStopListStringFromJson(json);

 final  List<String> _value;
@override List<String> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStopListStringCopyWith<ChatCompletionStopListString> get copyWith => _$ChatCompletionStopListStringCopyWithImpl<ChatCompletionStopListString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionStopListStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStopListString&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'ChatCompletionStop.listString(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStopListStringCopyWith<$Res> implements $ChatCompletionStopCopyWith<$Res> {
  factory $ChatCompletionStopListStringCopyWith(ChatCompletionStopListString value, $Res Function(ChatCompletionStopListString) _then) = _$ChatCompletionStopListStringCopyWithImpl;
@useResult
$Res call({
 List<String> value
});




}
/// @nodoc
class _$ChatCompletionStopListStringCopyWithImpl<$Res>
    implements $ChatCompletionStopListStringCopyWith<$Res> {
  _$ChatCompletionStopListStringCopyWithImpl(this._self, this._then);

  final ChatCompletionStopListString _self;
  final $Res Function(ChatCompletionStopListString) _then;

/// Create a copy of ChatCompletionStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionStopListString(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ChatCompletionStopString extends ChatCompletionStop {
  const ChatCompletionStopString(this.value, {final  String? $type}): $type = $type ?? 'string',super._();
  factory ChatCompletionStopString.fromJson(Map<String, dynamic> json) => _$ChatCompletionStopStringFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStopStringCopyWith<ChatCompletionStopString> get copyWith => _$ChatCompletionStopStringCopyWithImpl<ChatCompletionStopString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionStopStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStopString&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ChatCompletionStop.string(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStopStringCopyWith<$Res> implements $ChatCompletionStopCopyWith<$Res> {
  factory $ChatCompletionStopStringCopyWith(ChatCompletionStopString value, $Res Function(ChatCompletionStopString) _then) = _$ChatCompletionStopStringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ChatCompletionStopStringCopyWithImpl<$Res>
    implements $ChatCompletionStopStringCopyWith<$Res> {
  _$ChatCompletionStopStringCopyWithImpl(this._self, this._then);

  final ChatCompletionStopString _self;
  final $Res Function(ChatCompletionStopString) _then;

/// Create a copy of ChatCompletionStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionStopString(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

ChatCompletionToolChoice _$ChatCompletionToolChoiceFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'enumeration':
          return ChatCompletionToolChoiceEnumeration.fromJson(
            json
          );
                case 'toolChoiceTool':
          return ChatCompletionToolChoiceToolChoiceTool.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ChatCompletionToolChoice',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ChatCompletionToolChoice {

 Object get value;

  /// Serializes this ChatCompletionToolChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionToolChoice&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'ChatCompletionToolChoice(value: $value)';
}


}

/// @nodoc
class $ChatCompletionToolChoiceCopyWith<$Res>  {
$ChatCompletionToolChoiceCopyWith(ChatCompletionToolChoice _, $Res Function(ChatCompletionToolChoice) __);
}


/// Adds pattern-matching-related methods to [ChatCompletionToolChoice].
extension ChatCompletionToolChoicePatterns on ChatCompletionToolChoice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatCompletionToolChoiceEnumeration value)?  enumeration,TResult Function( ChatCompletionToolChoiceToolChoiceTool value)?  toolChoiceTool,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration() when enumeration != null:
return enumeration(_that);case ChatCompletionToolChoiceToolChoiceTool() when toolChoiceTool != null:
return toolChoiceTool(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatCompletionToolChoiceEnumeration value)  enumeration,required TResult Function( ChatCompletionToolChoiceToolChoiceTool value)  toolChoiceTool,}){
final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration():
return enumeration(_that);case ChatCompletionToolChoiceToolChoiceTool():
return toolChoiceTool(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatCompletionToolChoiceEnumeration value)?  enumeration,TResult? Function( ChatCompletionToolChoiceToolChoiceTool value)?  toolChoiceTool,}){
final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration() when enumeration != null:
return enumeration(_that);case ChatCompletionToolChoiceToolChoiceTool() when toolChoiceTool != null:
return toolChoiceTool(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ChatCompletionToolChoiceOption value)?  enumeration,TResult Function( ToolChoiceTool value)?  toolChoiceTool,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration() when enumeration != null:
return enumeration(_that.value);case ChatCompletionToolChoiceToolChoiceTool() when toolChoiceTool != null:
return toolChoiceTool(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ChatCompletionToolChoiceOption value)  enumeration,required TResult Function( ToolChoiceTool value)  toolChoiceTool,}) {final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration():
return enumeration(_that.value);case ChatCompletionToolChoiceToolChoiceTool():
return toolChoiceTool(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ChatCompletionToolChoiceOption value)?  enumeration,TResult? Function( ToolChoiceTool value)?  toolChoiceTool,}) {final _that = this;
switch (_that) {
case ChatCompletionToolChoiceEnumeration() when enumeration != null:
return enumeration(_that.value);case ChatCompletionToolChoiceToolChoiceTool() when toolChoiceTool != null:
return toolChoiceTool(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ChatCompletionToolChoiceEnumeration extends ChatCompletionToolChoice {
  const ChatCompletionToolChoiceEnumeration(this.value, {final  String? $type}): $type = $type ?? 'enumeration',super._();
  factory ChatCompletionToolChoiceEnumeration.fromJson(Map<String, dynamic> json) => _$ChatCompletionToolChoiceEnumerationFromJson(json);

@override final  ChatCompletionToolChoiceOption value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionToolChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionToolChoiceEnumerationCopyWith<ChatCompletionToolChoiceEnumeration> get copyWith => _$ChatCompletionToolChoiceEnumerationCopyWithImpl<ChatCompletionToolChoiceEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionToolChoiceEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionToolChoiceEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ChatCompletionToolChoice.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionToolChoiceEnumerationCopyWith<$Res> implements $ChatCompletionToolChoiceCopyWith<$Res> {
  factory $ChatCompletionToolChoiceEnumerationCopyWith(ChatCompletionToolChoiceEnumeration value, $Res Function(ChatCompletionToolChoiceEnumeration) _then) = _$ChatCompletionToolChoiceEnumerationCopyWithImpl;
@useResult
$Res call({
 ChatCompletionToolChoiceOption value
});




}
/// @nodoc
class _$ChatCompletionToolChoiceEnumerationCopyWithImpl<$Res>
    implements $ChatCompletionToolChoiceEnumerationCopyWith<$Res> {
  _$ChatCompletionToolChoiceEnumerationCopyWithImpl(this._self, this._then);

  final ChatCompletionToolChoiceEnumeration _self;
  final $Res Function(ChatCompletionToolChoiceEnumeration) _then;

/// Create a copy of ChatCompletionToolChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionToolChoiceEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ChatCompletionToolChoiceOption,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ChatCompletionToolChoiceToolChoiceTool extends ChatCompletionToolChoice {
  const ChatCompletionToolChoiceToolChoiceTool(this.value, {final  String? $type}): $type = $type ?? 'toolChoiceTool',super._();
  factory ChatCompletionToolChoiceToolChoiceTool.fromJson(Map<String, dynamic> json) => _$ChatCompletionToolChoiceToolChoiceToolFromJson(json);

@override final  ToolChoiceTool value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatCompletionToolChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionToolChoiceToolChoiceToolCopyWith<ChatCompletionToolChoiceToolChoiceTool> get copyWith => _$ChatCompletionToolChoiceToolChoiceToolCopyWithImpl<ChatCompletionToolChoiceToolChoiceTool>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionToolChoiceToolChoiceToolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionToolChoiceToolChoiceTool&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ChatCompletionToolChoice.toolChoiceTool(value: $value)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionToolChoiceToolChoiceToolCopyWith<$Res> implements $ChatCompletionToolChoiceCopyWith<$Res> {
  factory $ChatCompletionToolChoiceToolChoiceToolCopyWith(ChatCompletionToolChoiceToolChoiceTool value, $Res Function(ChatCompletionToolChoiceToolChoiceTool) _then) = _$ChatCompletionToolChoiceToolChoiceToolCopyWithImpl;
@useResult
$Res call({
 ToolChoiceTool value
});


$ToolChoiceToolCopyWith<$Res> get value;

}
/// @nodoc
class _$ChatCompletionToolChoiceToolChoiceToolCopyWithImpl<$Res>
    implements $ChatCompletionToolChoiceToolChoiceToolCopyWith<$Res> {
  _$ChatCompletionToolChoiceToolChoiceToolCopyWithImpl(this._self, this._then);

  final ChatCompletionToolChoiceToolChoiceTool _self;
  final $Res Function(ChatCompletionToolChoiceToolChoiceTool) _then;

/// Create a copy of ChatCompletionToolChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ChatCompletionToolChoiceToolChoiceTool(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ToolChoiceTool,
  ));
}

/// Create a copy of ChatCompletionToolChoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceToolCopyWith<$Res> get value {
  
  return $ToolChoiceToolCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionResponse {

/// The unique identifier for this completion.
 String get id;/// The object type, which is always `chat.completion`.
 String get object;/// The timestamp of when this completion was created.
 int get created;/// The model used for this completion.
 String get model;/// The list of choices for this completion.
 List<ChatCompletionResponseChoicesInner> get choices;/// The usage statistics for this completion.
 ChatCompletionUsage get usage;
/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionResponseCopyWith<ChatCompletionResponse> get copyWith => _$ChatCompletionResponseCopyWithImpl<ChatCompletionResponse>(this as ChatCompletionResponse, _$identity);

  /// Serializes this ChatCompletionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,model,const DeepCollectionEquality().hash(choices),usage);

@override
String toString() {
  return 'ChatCompletionResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionResponseCopyWith<$Res>  {
  factory $ChatCompletionResponseCopyWith(ChatCompletionResponse value, $Res Function(ChatCompletionResponse) _then) = _$ChatCompletionResponseCopyWithImpl;
@useResult
$Res call({
 String id, String object, int created, String model, List<ChatCompletionResponseChoicesInner> choices, ChatCompletionUsage usage
});


$ChatCompletionUsageCopyWith<$Res> get usage;

}
/// @nodoc
class _$ChatCompletionResponseCopyWithImpl<$Res>
    implements $ChatCompletionResponseCopyWith<$Res> {
  _$ChatCompletionResponseCopyWithImpl(this._self, this._then);

  final ChatCompletionResponse _self;
  final $Res Function(ChatCompletionResponse) _then;

/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? object = null,Object? created = null,Object? model = null,Object? choices = null,Object? usage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionResponseChoicesInner>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as ChatCompletionUsage,
  ));
}
/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionUsageCopyWith<$Res> get usage {
  
  return $ChatCompletionUsageCopyWith<$Res>(_self.usage, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatCompletionResponse].
extension ChatCompletionResponsePatterns on ChatCompletionResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String object,  int created,  String model,  List<ChatCompletionResponseChoicesInner> choices,  ChatCompletionUsage usage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionResponse() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String object,  int created,  String model,  List<ChatCompletionResponseChoicesInner> choices,  ChatCompletionUsage usage)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionResponse():
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String object,  int created,  String model,  List<ChatCompletionResponseChoicesInner> choices,  ChatCompletionUsage usage)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionResponse() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionResponse extends ChatCompletionResponse {
  const _ChatCompletionResponse({required this.id, required this.object, required this.created, required this.model, required final  List<ChatCompletionResponseChoicesInner> choices, required this.usage}): _choices = choices,super._();
  factory _ChatCompletionResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionResponseFromJson(json);

/// The unique identifier for this completion.
@override final  String id;
/// The object type, which is always `chat.completion`.
@override final  String object;
/// The timestamp of when this completion was created.
@override final  int created;
/// The model used for this completion.
@override final  String model;
/// The list of choices for this completion.
 final  List<ChatCompletionResponseChoicesInner> _choices;
/// The list of choices for this completion.
@override List<ChatCompletionResponseChoicesInner> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

/// The usage statistics for this completion.
@override final  ChatCompletionUsage usage;

/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionResponseCopyWith<_ChatCompletionResponse> get copyWith => __$ChatCompletionResponseCopyWithImpl<_ChatCompletionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,model,const DeepCollectionEquality().hash(_choices),usage);

@override
String toString() {
  return 'ChatCompletionResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionResponseCopyWith<$Res> implements $ChatCompletionResponseCopyWith<$Res> {
  factory _$ChatCompletionResponseCopyWith(_ChatCompletionResponse value, $Res Function(_ChatCompletionResponse) _then) = __$ChatCompletionResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String object, int created, String model, List<ChatCompletionResponseChoicesInner> choices, ChatCompletionUsage usage
});


@override $ChatCompletionUsageCopyWith<$Res> get usage;

}
/// @nodoc
class __$ChatCompletionResponseCopyWithImpl<$Res>
    implements _$ChatCompletionResponseCopyWith<$Res> {
  __$ChatCompletionResponseCopyWithImpl(this._self, this._then);

  final _ChatCompletionResponse _self;
  final $Res Function(_ChatCompletionResponse) _then;

/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? object = null,Object? created = null,Object? model = null,Object? choices = null,Object? usage = null,}) {
  return _then(_ChatCompletionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionResponseChoicesInner>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as ChatCompletionUsage,
  ));
}

/// Create a copy of ChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionUsageCopyWith<$Res> get usage {
  
  return $ChatCompletionUsageCopyWith<$Res>(_self.usage, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionResponseChoicesInner {

/// The index of this choice.
 int get index;/// A message from the assistant in a chat conversation.
 AssistantMessage get message;/// The reason the model stopped generating tokens.
@JsonKey(name: 'finish_reason') ChatCompletionFinishReason get finishReason;
/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionResponseChoicesInnerCopyWith<ChatCompletionResponseChoicesInner> get copyWith => _$ChatCompletionResponseChoicesInnerCopyWithImpl<ChatCompletionResponseChoicesInner>(this as ChatCompletionResponseChoicesInner, _$identity);

  /// Serializes this ChatCompletionResponseChoicesInner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionResponseChoicesInner&&(identical(other.index, index) || other.index == index)&&(identical(other.message, message) || other.message == message)&&(identical(other.finishReason, finishReason) || other.finishReason == finishReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,message,finishReason);

@override
String toString() {
  return 'ChatCompletionResponseChoicesInner(index: $index, message: $message, finishReason: $finishReason)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionResponseChoicesInnerCopyWith<$Res>  {
  factory $ChatCompletionResponseChoicesInnerCopyWith(ChatCompletionResponseChoicesInner value, $Res Function(ChatCompletionResponseChoicesInner) _then) = _$ChatCompletionResponseChoicesInnerCopyWithImpl;
@useResult
$Res call({
 int index, AssistantMessage message,@JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason
});


$AssistantMessageCopyWith<$Res> get message;

}
/// @nodoc
class _$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res>
    implements $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  _$ChatCompletionResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final ChatCompletionResponseChoicesInner _self;
  final $Res Function(ChatCompletionResponseChoicesInner) _then;

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? message = null,Object? finishReason = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AssistantMessage,finishReason: null == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason,
  ));
}
/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssistantMessageCopyWith<$Res> get message {
  
  return $AssistantMessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatCompletionResponseChoicesInner].
extension ChatCompletionResponseChoicesInnerPatterns on ChatCompletionResponseChoicesInner {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionResponseChoicesInner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionResponseChoicesInner value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionResponseChoicesInner value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  AssistantMessage message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner() when $default != null:
return $default(_that.index,_that.message,_that.finishReason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  AssistantMessage message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner():
return $default(_that.index,_that.message,_that.finishReason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  AssistantMessage message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionResponseChoicesInner() when $default != null:
return $default(_that.index,_that.message,_that.finishReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionResponseChoicesInner extends ChatCompletionResponseChoicesInner {
  const _ChatCompletionResponseChoicesInner({required this.index, required this.message, @JsonKey(name: 'finish_reason') required this.finishReason}): super._();
  factory _ChatCompletionResponseChoicesInner.fromJson(Map<String, dynamic> json) => _$ChatCompletionResponseChoicesInnerFromJson(json);

/// The index of this choice.
@override final  int index;
/// A message from the assistant in a chat conversation.
@override final  AssistantMessage message;
/// The reason the model stopped generating tokens.
@override@JsonKey(name: 'finish_reason') final  ChatCompletionFinishReason finishReason;

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionResponseChoicesInnerCopyWith<_ChatCompletionResponseChoicesInner> get copyWith => __$ChatCompletionResponseChoicesInnerCopyWithImpl<_ChatCompletionResponseChoicesInner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionResponseChoicesInnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionResponseChoicesInner&&(identical(other.index, index) || other.index == index)&&(identical(other.message, message) || other.message == message)&&(identical(other.finishReason, finishReason) || other.finishReason == finishReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,message,finishReason);

@override
String toString() {
  return 'ChatCompletionResponseChoicesInner(index: $index, message: $message, finishReason: $finishReason)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionResponseChoicesInnerCopyWith<$Res> implements $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  factory _$ChatCompletionResponseChoicesInnerCopyWith(_ChatCompletionResponseChoicesInner value, $Res Function(_ChatCompletionResponseChoicesInner) _then) = __$ChatCompletionResponseChoicesInnerCopyWithImpl;
@override @useResult
$Res call({
 int index, AssistantMessage message,@JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason
});


@override $AssistantMessageCopyWith<$Res> get message;

}
/// @nodoc
class __$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res>
    implements _$ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  __$ChatCompletionResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final _ChatCompletionResponseChoicesInner _self;
  final $Res Function(_ChatCompletionResponseChoicesInner) _then;

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? message = null,Object? finishReason = null,}) {
  return _then(_ChatCompletionResponseChoicesInner(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as AssistantMessage,finishReason: null == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason,
  ));
}

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssistantMessageCopyWith<$Res> get message {
  
  return $AssistantMessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionMessage {

/// The role of the message.
 ChatCompletionMessageRole get role;/// The message content.
@JsonKey(includeIfNull: false) String? get content;/// The tool calls generated by the model, such as function calls.
@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls;/// Tool call that this message is responding to (for tool messages).
@JsonKey(name: 'tool_call_id', includeIfNull: false) String? get toolCallId;/// The name of the tool that was called (for tool messages).
@JsonKey(includeIfNull: false) String? get name;/// Set this to true when adding an assistant message as a prefix for the next completion.
@JsonKey(includeIfNull: false) bool? get prefix;
/// Create a copy of ChatCompletionMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionMessageCopyWith<ChatCompletionMessage> get copyWith => _$ChatCompletionMessageCopyWithImpl<ChatCompletionMessage>(this as ChatCompletionMessage, _$identity);

  /// Serializes this ChatCompletionMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&(identical(other.toolCallId, toolCallId) || other.toolCallId == toolCallId)&&(identical(other.name, name) || other.name == name)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(toolCalls),toolCallId,name,prefix);

@override
String toString() {
  return 'ChatCompletionMessage(role: $role, content: $content, toolCalls: $toolCalls, toolCallId: $toolCallId, name: $name, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionMessageCopyWith<$Res>  {
  factory $ChatCompletionMessageCopyWith(ChatCompletionMessage value, $Res Function(ChatCompletionMessage) _then) = _$ChatCompletionMessageCopyWithImpl;
@useResult
$Res call({
 ChatCompletionMessageRole role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls,@JsonKey(name: 'tool_call_id', includeIfNull: false) String? toolCallId,@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) bool? prefix
});




}
/// @nodoc
class _$ChatCompletionMessageCopyWithImpl<$Res>
    implements $ChatCompletionMessageCopyWith<$Res> {
  _$ChatCompletionMessageCopyWithImpl(this._self, this._then);

  final ChatCompletionMessage _self;
  final $Res Function(ChatCompletionMessage) _then;

/// Create a copy of ChatCompletionMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = freezed,Object? toolCalls = freezed,Object? toolCallId = freezed,Object? name = freezed,Object? prefix = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,toolCallId: freezed == toolCallId ? _self.toolCallId : toolCallId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatCompletionMessage].
extension ChatCompletionMessagePatterns on ChatCompletionMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatCompletionMessageRole role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(name: 'tool_call_id', includeIfNull: false)  String? toolCallId, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  bool? prefix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls,_that.toolCallId,_that.name,_that.prefix);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatCompletionMessageRole role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(name: 'tool_call_id', includeIfNull: false)  String? toolCallId, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  bool? prefix)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionMessage():
return $default(_that.role,_that.content,_that.toolCalls,_that.toolCallId,_that.name,_that.prefix);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatCompletionMessageRole role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(name: 'tool_call_id', includeIfNull: false)  String? toolCallId, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  bool? prefix)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls,_that.toolCallId,_that.name,_that.prefix);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionMessage extends ChatCompletionMessage {
  const _ChatCompletionMessage({required this.role, @JsonKey(includeIfNull: false) this.content, @JsonKey(name: 'tool_calls', includeIfNull: false) final  List<ToolCall>? toolCalls, @JsonKey(name: 'tool_call_id', includeIfNull: false) this.toolCallId, @JsonKey(includeIfNull: false) this.name, @JsonKey(includeIfNull: false) this.prefix}): _toolCalls = toolCalls,super._();
  factory _ChatCompletionMessage.fromJson(Map<String, dynamic> json) => _$ChatCompletionMessageFromJson(json);

/// The role of the message.
@override final  ChatCompletionMessageRole role;
/// The message content.
@override@JsonKey(includeIfNull: false) final  String? content;
/// The tool calls generated by the model, such as function calls.
 final  List<ToolCall>? _toolCalls;
/// The tool calls generated by the model, such as function calls.
@override@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls {
  final value = _toolCalls;
  if (value == null) return null;
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Tool call that this message is responding to (for tool messages).
@override@JsonKey(name: 'tool_call_id', includeIfNull: false) final  String? toolCallId;
/// The name of the tool that was called (for tool messages).
@override@JsonKey(includeIfNull: false) final  String? name;
/// Set this to true when adding an assistant message as a prefix for the next completion.
@override@JsonKey(includeIfNull: false) final  bool? prefix;

/// Create a copy of ChatCompletionMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionMessageCopyWith<_ChatCompletionMessage> get copyWith => __$ChatCompletionMessageCopyWithImpl<_ChatCompletionMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls)&&(identical(other.toolCallId, toolCallId) || other.toolCallId == toolCallId)&&(identical(other.name, name) || other.name == name)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(_toolCalls),toolCallId,name,prefix);

@override
String toString() {
  return 'ChatCompletionMessage(role: $role, content: $content, toolCalls: $toolCalls, toolCallId: $toolCallId, name: $name, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionMessageCopyWith<$Res> implements $ChatCompletionMessageCopyWith<$Res> {
  factory _$ChatCompletionMessageCopyWith(_ChatCompletionMessage value, $Res Function(_ChatCompletionMessage) _then) = __$ChatCompletionMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatCompletionMessageRole role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls,@JsonKey(name: 'tool_call_id', includeIfNull: false) String? toolCallId,@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) bool? prefix
});




}
/// @nodoc
class __$ChatCompletionMessageCopyWithImpl<$Res>
    implements _$ChatCompletionMessageCopyWith<$Res> {
  __$ChatCompletionMessageCopyWithImpl(this._self, this._then);

  final _ChatCompletionMessage _self;
  final $Res Function(_ChatCompletionMessage) _then;

/// Create a copy of ChatCompletionMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = freezed,Object? toolCalls = freezed,Object? toolCallId = freezed,Object? name = freezed,Object? prefix = freezed,}) {
  return _then(_ChatCompletionMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,toolCallId: freezed == toolCallId ? _self.toolCallId : toolCallId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$AssistantMessage {

/// The role of the message, which is always `assistant`.
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) AssistantMessageRole? get role;/// The message content.
@JsonKey(includeIfNull: false) String? get content;/// The tool calls generated by the model, such as function calls.
@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls;/// Set this to true when adding an assistant message as a prefix for the next completion.
@JsonKey(includeIfNull: false) bool? get prefix;
/// Create a copy of AssistantMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssistantMessageCopyWith<AssistantMessage> get copyWith => _$AssistantMessageCopyWithImpl<AssistantMessage>(this as AssistantMessage, _$identity);

  /// Serializes this AssistantMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssistantMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(toolCalls),prefix);

@override
String toString() {
  return 'AssistantMessage(role: $role, content: $content, toolCalls: $toolCalls, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class $AssistantMessageCopyWith<$Res>  {
  factory $AssistantMessageCopyWith(AssistantMessage value, $Res Function(AssistantMessage) _then) = _$AssistantMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) AssistantMessageRole? role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls,@JsonKey(includeIfNull: false) bool? prefix
});




}
/// @nodoc
class _$AssistantMessageCopyWithImpl<$Res>
    implements $AssistantMessageCopyWith<$Res> {
  _$AssistantMessageCopyWithImpl(this._self, this._then);

  final AssistantMessage _self;
  final $Res Function(AssistantMessage) _then;

/// Create a copy of AssistantMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? content = freezed,Object? toolCalls = freezed,Object? prefix = freezed,}) {
  return _then(_self.copyWith(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AssistantMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssistantMessage].
extension AssistantMessagePatterns on AssistantMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssistantMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssistantMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssistantMessage value)  $default,){
final _that = this;
switch (_that) {
case _AssistantMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssistantMessage value)?  $default,){
final _that = this;
switch (_that) {
case _AssistantMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  AssistantMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(includeIfNull: false)  bool? prefix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssistantMessage() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls,_that.prefix);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  AssistantMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(includeIfNull: false)  bool? prefix)  $default,) {final _that = this;
switch (_that) {
case _AssistantMessage():
return $default(_that.role,_that.content,_that.toolCalls,_that.prefix);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  AssistantMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls, @JsonKey(includeIfNull: false)  bool? prefix)?  $default,) {final _that = this;
switch (_that) {
case _AssistantMessage() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls,_that.prefix);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssistantMessage extends AssistantMessage {
  const _AssistantMessage({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.role, @JsonKey(includeIfNull: false) this.content, @JsonKey(name: 'tool_calls', includeIfNull: false) final  List<ToolCall>? toolCalls, @JsonKey(includeIfNull: false) this.prefix}): _toolCalls = toolCalls,super._();
  factory _AssistantMessage.fromJson(Map<String, dynamic> json) => _$AssistantMessageFromJson(json);

/// The role of the message, which is always `assistant`.
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  AssistantMessageRole? role;
/// The message content.
@override@JsonKey(includeIfNull: false) final  String? content;
/// The tool calls generated by the model, such as function calls.
 final  List<ToolCall>? _toolCalls;
/// The tool calls generated by the model, such as function calls.
@override@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls {
  final value = _toolCalls;
  if (value == null) return null;
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Set this to true when adding an assistant message as a prefix for the next completion.
@override@JsonKey(includeIfNull: false) final  bool? prefix;

/// Create a copy of AssistantMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssistantMessageCopyWith<_AssistantMessage> get copyWith => __$AssistantMessageCopyWithImpl<_AssistantMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssistantMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssistantMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls)&&(identical(other.prefix, prefix) || other.prefix == prefix));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(_toolCalls),prefix);

@override
String toString() {
  return 'AssistantMessage(role: $role, content: $content, toolCalls: $toolCalls, prefix: $prefix)';
}


}

/// @nodoc
abstract mixin class _$AssistantMessageCopyWith<$Res> implements $AssistantMessageCopyWith<$Res> {
  factory _$AssistantMessageCopyWith(_AssistantMessage value, $Res Function(_AssistantMessage) _then) = __$AssistantMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) AssistantMessageRole? role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls,@JsonKey(includeIfNull: false) bool? prefix
});




}
/// @nodoc
class __$AssistantMessageCopyWithImpl<$Res>
    implements _$AssistantMessageCopyWith<$Res> {
  __$AssistantMessageCopyWithImpl(this._self, this._then);

  final _AssistantMessage _self;
  final $Res Function(_AssistantMessage) _then;

/// Create a copy of AssistantMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? content = freezed,Object? toolCalls = freezed,Object? prefix = freezed,}) {
  return _then(_AssistantMessage(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AssistantMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$ChatCompletionUsage {

/// The number of tokens in the prompt.
@JsonKey(name: 'prompt_tokens') int get promptTokens;/// The number of tokens in the completion.
@JsonKey(name: 'completion_tokens') int get completionTokens;/// The total number of tokens generated.
@JsonKey(name: 'total_tokens') int get totalTokens;
/// Create a copy of ChatCompletionUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionUsageCopyWith<ChatCompletionUsage> get copyWith => _$ChatCompletionUsageCopyWithImpl<ChatCompletionUsage>(this as ChatCompletionUsage, _$identity);

  /// Serializes this ChatCompletionUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionUsage&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens);

@override
String toString() {
  return 'ChatCompletionUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionUsageCopyWith<$Res>  {
  factory $ChatCompletionUsageCopyWith(ChatCompletionUsage value, $Res Function(ChatCompletionUsage) _then) = _$ChatCompletionUsageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens
});




}
/// @nodoc
class _$ChatCompletionUsageCopyWithImpl<$Res>
    implements $ChatCompletionUsageCopyWith<$Res> {
  _$ChatCompletionUsageCopyWithImpl(this._self, this._then);

  final ChatCompletionUsage _self;
  final $Res Function(ChatCompletionUsage) _then;

/// Create a copy of ChatCompletionUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,}) {
  return _then(_self.copyWith(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatCompletionUsage].
extension ChatCompletionUsagePatterns on ChatCompletionUsage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionUsage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionUsage value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionUsage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionUsage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionUsage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionUsage() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionUsage():
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionUsage() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionUsage extends ChatCompletionUsage {
  const _ChatCompletionUsage({@JsonKey(name: 'prompt_tokens') required this.promptTokens, @JsonKey(name: 'completion_tokens') required this.completionTokens, @JsonKey(name: 'total_tokens') required this.totalTokens}): super._();
  factory _ChatCompletionUsage.fromJson(Map<String, dynamic> json) => _$ChatCompletionUsageFromJson(json);

/// The number of tokens in the prompt.
@override@JsonKey(name: 'prompt_tokens') final  int promptTokens;
/// The number of tokens in the completion.
@override@JsonKey(name: 'completion_tokens') final  int completionTokens;
/// The total number of tokens generated.
@override@JsonKey(name: 'total_tokens') final  int totalTokens;

/// Create a copy of ChatCompletionUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionUsageCopyWith<_ChatCompletionUsage> get copyWith => __$ChatCompletionUsageCopyWithImpl<_ChatCompletionUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionUsage&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens);

@override
String toString() {
  return 'ChatCompletionUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionUsageCopyWith<$Res> implements $ChatCompletionUsageCopyWith<$Res> {
  factory _$ChatCompletionUsageCopyWith(_ChatCompletionUsage value, $Res Function(_ChatCompletionUsage) _then) = __$ChatCompletionUsageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens
});




}
/// @nodoc
class __$ChatCompletionUsageCopyWithImpl<$Res>
    implements _$ChatCompletionUsageCopyWith<$Res> {
  __$ChatCompletionUsageCopyWithImpl(this._self, this._then);

  final _ChatCompletionUsage _self;
  final $Res Function(_ChatCompletionUsage) _then;

/// Create a copy of ChatCompletionUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,}) {
  return _then(_ChatCompletionUsage(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChatCompletionStreamResponse {

/// The unique identifier for this completion.
 String get id;/// The object type, which is always `chat.completion.chunk`.
@JsonKey(includeIfNull: false) String? get object;/// The timestamp of when this completion was created.
@JsonKey(includeIfNull: false) int? get created;/// The model used for this completion.
 String get model;/// The list of choices for this completion.
 List<ChatCompletionStreamResponseChoicesInner> get choices;/// Token usage statistics for this completion. Only present in the final chunk of a streaming response.
@JsonKey(includeIfNull: false) ChatCompletionUsage? get usage;
/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStreamResponseCopyWith<ChatCompletionStreamResponse> get copyWith => _$ChatCompletionStreamResponseCopyWithImpl<ChatCompletionStreamResponse>(this as ChatCompletionStreamResponse, _$identity);

  /// Serializes this ChatCompletionStreamResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStreamResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,model,const DeepCollectionEquality().hash(choices),usage);

@override
String toString() {
  return 'ChatCompletionStreamResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStreamResponseCopyWith<$Res>  {
  factory $ChatCompletionStreamResponseCopyWith(ChatCompletionStreamResponse value, $Res Function(ChatCompletionStreamResponse) _then) = _$ChatCompletionStreamResponseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(includeIfNull: false) String? object,@JsonKey(includeIfNull: false) int? created, String model, List<ChatCompletionStreamResponseChoicesInner> choices,@JsonKey(includeIfNull: false) ChatCompletionUsage? usage
});


$ChatCompletionUsageCopyWith<$Res>? get usage;

}
/// @nodoc
class _$ChatCompletionStreamResponseCopyWithImpl<$Res>
    implements $ChatCompletionStreamResponseCopyWith<$Res> {
  _$ChatCompletionStreamResponseCopyWithImpl(this._self, this._then);

  final ChatCompletionStreamResponse _self;
  final $Res Function(ChatCompletionStreamResponse) _then;

/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? object = freezed,Object? created = freezed,Object? model = null,Object? choices = null,Object? usage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: freezed == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int?,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionStreamResponseChoicesInner>,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as ChatCompletionUsage?,
  ));
}
/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionUsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $ChatCompletionUsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatCompletionStreamResponse].
extension ChatCompletionStreamResponsePatterns on ChatCompletionStreamResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionStreamResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionStreamResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionStreamResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(includeIfNull: false)  String? object, @JsonKey(includeIfNull: false)  int? created,  String model,  List<ChatCompletionStreamResponseChoicesInner> choices, @JsonKey(includeIfNull: false)  ChatCompletionUsage? usage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(includeIfNull: false)  String? object, @JsonKey(includeIfNull: false)  int? created,  String model,  List<ChatCompletionStreamResponseChoicesInner> choices, @JsonKey(includeIfNull: false)  ChatCompletionUsage? usage)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse():
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(includeIfNull: false)  String? object, @JsonKey(includeIfNull: false)  int? created,  String model,  List<ChatCompletionStreamResponseChoicesInner> choices, @JsonKey(includeIfNull: false)  ChatCompletionUsage? usage)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponse() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.model,_that.choices,_that.usage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionStreamResponse extends ChatCompletionStreamResponse {
  const _ChatCompletionStreamResponse({required this.id, @JsonKey(includeIfNull: false) this.object, @JsonKey(includeIfNull: false) this.created, required this.model, required final  List<ChatCompletionStreamResponseChoicesInner> choices, @JsonKey(includeIfNull: false) this.usage}): _choices = choices,super._();
  factory _ChatCompletionStreamResponse.fromJson(Map<String, dynamic> json) => _$ChatCompletionStreamResponseFromJson(json);

/// The unique identifier for this completion.
@override final  String id;
/// The object type, which is always `chat.completion.chunk`.
@override@JsonKey(includeIfNull: false) final  String? object;
/// The timestamp of when this completion was created.
@override@JsonKey(includeIfNull: false) final  int? created;
/// The model used for this completion.
@override final  String model;
/// The list of choices for this completion.
 final  List<ChatCompletionStreamResponseChoicesInner> _choices;
/// The list of choices for this completion.
@override List<ChatCompletionStreamResponseChoicesInner> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

/// Token usage statistics for this completion. Only present in the final chunk of a streaming response.
@override@JsonKey(includeIfNull: false) final  ChatCompletionUsage? usage;

/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionStreamResponseCopyWith<_ChatCompletionStreamResponse> get copyWith => __$ChatCompletionStreamResponseCopyWithImpl<_ChatCompletionStreamResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionStreamResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionStreamResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,model,const DeepCollectionEquality().hash(_choices),usage);

@override
String toString() {
  return 'ChatCompletionStreamResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionStreamResponseCopyWith<$Res> implements $ChatCompletionStreamResponseCopyWith<$Res> {
  factory _$ChatCompletionStreamResponseCopyWith(_ChatCompletionStreamResponse value, $Res Function(_ChatCompletionStreamResponse) _then) = __$ChatCompletionStreamResponseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(includeIfNull: false) String? object,@JsonKey(includeIfNull: false) int? created, String model, List<ChatCompletionStreamResponseChoicesInner> choices,@JsonKey(includeIfNull: false) ChatCompletionUsage? usage
});


@override $ChatCompletionUsageCopyWith<$Res>? get usage;

}
/// @nodoc
class __$ChatCompletionStreamResponseCopyWithImpl<$Res>
    implements _$ChatCompletionStreamResponseCopyWith<$Res> {
  __$ChatCompletionStreamResponseCopyWithImpl(this._self, this._then);

  final _ChatCompletionStreamResponse _self;
  final $Res Function(_ChatCompletionStreamResponse) _then;

/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? object = freezed,Object? created = freezed,Object? model = null,Object? choices = null,Object? usage = freezed,}) {
  return _then(_ChatCompletionStreamResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: freezed == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int?,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionStreamResponseChoicesInner>,usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as ChatCompletionUsage?,
  ));
}

/// Create a copy of ChatCompletionStreamResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionUsageCopyWith<$Res>? get usage {
    if (_self.usage == null) {
    return null;
  }

  return $ChatCompletionUsageCopyWith<$Res>(_self.usage!, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionStreamResponseChoicesInner {

/// The index of this choice.
 int get index;/// A chat completion delta generated by streamed model responses.
 ChatCompletionStreamDelta get delta;/// The reason the model stopped generating tokens.
@JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionFinishReason? get finishReason;
/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStreamResponseChoicesInnerCopyWith<ChatCompletionStreamResponseChoicesInner> get copyWith => _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<ChatCompletionStreamResponseChoicesInner>(this as ChatCompletionStreamResponseChoicesInner, _$identity);

  /// Serializes this ChatCompletionStreamResponseChoicesInner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStreamResponseChoicesInner&&(identical(other.index, index) || other.index == index)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.finishReason, finishReason) || other.finishReason == finishReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,delta,finishReason);

@override
String toString() {
  return 'ChatCompletionStreamResponseChoicesInner(index: $index, delta: $delta, finishReason: $finishReason)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res>  {
  factory $ChatCompletionStreamResponseChoicesInnerCopyWith(ChatCompletionStreamResponseChoicesInner value, $Res Function(ChatCompletionStreamResponseChoicesInner) _then) = _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl;
@useResult
$Res call({
 int index, ChatCompletionStreamDelta delta,@JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionFinishReason? finishReason
});


$ChatCompletionStreamDeltaCopyWith<$Res> get delta;

}
/// @nodoc
class _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<$Res>
    implements $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final ChatCompletionStreamResponseChoicesInner _self;
  final $Res Function(ChatCompletionStreamResponseChoicesInner) _then;

/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? delta = null,Object? finishReason = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as ChatCompletionStreamDelta,finishReason: freezed == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason?,
  ));
}
/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionStreamDeltaCopyWith<$Res> get delta {
  
  return $ChatCompletionStreamDeltaCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatCompletionStreamResponseChoicesInner].
extension ChatCompletionStreamResponseChoicesInnerPatterns on ChatCompletionStreamResponseChoicesInner {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionStreamResponseChoicesInner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionStreamResponseChoicesInner value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionStreamResponseChoicesInner value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  ChatCompletionStreamDelta delta, @JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionFinishReason? finishReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner() when $default != null:
return $default(_that.index,_that.delta,_that.finishReason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  ChatCompletionStreamDelta delta, @JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionFinishReason? finishReason)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner():
return $default(_that.index,_that.delta,_that.finishReason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  ChatCompletionStreamDelta delta, @JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionFinishReason? finishReason)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamResponseChoicesInner() when $default != null:
return $default(_that.index,_that.delta,_that.finishReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionStreamResponseChoicesInner extends ChatCompletionStreamResponseChoicesInner {
  const _ChatCompletionStreamResponseChoicesInner({required this.index, required this.delta, @JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.finishReason}): super._();
  factory _ChatCompletionStreamResponseChoicesInner.fromJson(Map<String, dynamic> json) => _$ChatCompletionStreamResponseChoicesInnerFromJson(json);

/// The index of this choice.
@override final  int index;
/// A chat completion delta generated by streamed model responses.
@override final  ChatCompletionStreamDelta delta;
/// The reason the model stopped generating tokens.
@override@JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ChatCompletionFinishReason? finishReason;

/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionStreamResponseChoicesInnerCopyWith<_ChatCompletionStreamResponseChoicesInner> get copyWith => __$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<_ChatCompletionStreamResponseChoicesInner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionStreamResponseChoicesInnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionStreamResponseChoicesInner&&(identical(other.index, index) || other.index == index)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.finishReason, finishReason) || other.finishReason == finishReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,delta,finishReason);

@override
String toString() {
  return 'ChatCompletionStreamResponseChoicesInner(index: $index, delta: $delta, finishReason: $finishReason)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> implements $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  factory _$ChatCompletionStreamResponseChoicesInnerCopyWith(_ChatCompletionStreamResponseChoicesInner value, $Res Function(_ChatCompletionStreamResponseChoicesInner) _then) = __$ChatCompletionStreamResponseChoicesInnerCopyWithImpl;
@override @useResult
$Res call({
 int index, ChatCompletionStreamDelta delta,@JsonKey(name: 'finish_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionFinishReason? finishReason
});


@override $ChatCompletionStreamDeltaCopyWith<$Res> get delta;

}
/// @nodoc
class __$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<$Res>
    implements _$ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  __$ChatCompletionStreamResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final _ChatCompletionStreamResponseChoicesInner _self;
  final $Res Function(_ChatCompletionStreamResponseChoicesInner) _then;

/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? delta = null,Object? finishReason = freezed,}) {
  return _then(_ChatCompletionStreamResponseChoicesInner(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as ChatCompletionStreamDelta,finishReason: freezed == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason?,
  ));
}

/// Create a copy of ChatCompletionStreamResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionStreamDeltaCopyWith<$Res> get delta {
  
  return $ChatCompletionStreamDeltaCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionStreamDelta {

/// The role of the message.
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionMessageRole? get role;/// The message content.
@JsonKey(includeIfNull: false) String? get content;/// The tool calls generated by the model, such as function calls.
@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls;
/// Create a copy of ChatCompletionStreamDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStreamDeltaCopyWith<ChatCompletionStreamDelta> get copyWith => _$ChatCompletionStreamDeltaCopyWithImpl<ChatCompletionStreamDelta>(this as ChatCompletionStreamDelta, _$identity);

  /// Serializes this ChatCompletionStreamDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStreamDelta&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(toolCalls));

@override
String toString() {
  return 'ChatCompletionStreamDelta(role: $role, content: $content, toolCalls: $toolCalls)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStreamDeltaCopyWith<$Res>  {
  factory $ChatCompletionStreamDeltaCopyWith(ChatCompletionStreamDelta value, $Res Function(ChatCompletionStreamDelta) _then) = _$ChatCompletionStreamDeltaCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionMessageRole? role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls
});




}
/// @nodoc
class _$ChatCompletionStreamDeltaCopyWithImpl<$Res>
    implements $ChatCompletionStreamDeltaCopyWith<$Res> {
  _$ChatCompletionStreamDeltaCopyWithImpl(this._self, this._then);

  final ChatCompletionStreamDelta _self;
  final $Res Function(ChatCompletionStreamDelta) _then;

/// Create a copy of ChatCompletionStreamDelta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? content = freezed,Object? toolCalls = freezed,}) {
  return _then(_self.copyWith(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatCompletionStreamDelta].
extension ChatCompletionStreamDeltaPatterns on ChatCompletionStreamDelta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionStreamDelta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionStreamDelta value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionStreamDelta value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta():
return $default(_that.role,_that.content,_that.toolCalls);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that.role,_that.content,_that.toolCalls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionStreamDelta extends ChatCompletionStreamDelta {
  const _ChatCompletionStreamDelta({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.role, @JsonKey(includeIfNull: false) this.content, @JsonKey(name: 'tool_calls', includeIfNull: false) final  List<ToolCall>? toolCalls}): _toolCalls = toolCalls,super._();
  factory _ChatCompletionStreamDelta.fromJson(Map<String, dynamic> json) => _$ChatCompletionStreamDeltaFromJson(json);

/// The role of the message.
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ChatCompletionMessageRole? role;
/// The message content.
@override@JsonKey(includeIfNull: false) final  String? content;
/// The tool calls generated by the model, such as function calls.
 final  List<ToolCall>? _toolCalls;
/// The tool calls generated by the model, such as function calls.
@override@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls {
  final value = _toolCalls;
  if (value == null) return null;
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ChatCompletionStreamDelta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionStreamDeltaCopyWith<_ChatCompletionStreamDelta> get copyWith => __$ChatCompletionStreamDeltaCopyWithImpl<_ChatCompletionStreamDelta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionStreamDeltaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionStreamDelta&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,const DeepCollectionEquality().hash(_toolCalls));

@override
String toString() {
  return 'ChatCompletionStreamDelta(role: $role, content: $content, toolCalls: $toolCalls)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionStreamDeltaCopyWith<$Res> implements $ChatCompletionStreamDeltaCopyWith<$Res> {
  factory _$ChatCompletionStreamDeltaCopyWith(_ChatCompletionStreamDelta value, $Res Function(_ChatCompletionStreamDelta) _then) = __$ChatCompletionStreamDeltaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionMessageRole? role,@JsonKey(includeIfNull: false) String? content,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls
});




}
/// @nodoc
class __$ChatCompletionStreamDeltaCopyWithImpl<$Res>
    implements _$ChatCompletionStreamDeltaCopyWith<$Res> {
  __$ChatCompletionStreamDeltaCopyWithImpl(this._self, this._then);

  final _ChatCompletionStreamDelta _self;
  final $Res Function(_ChatCompletionStreamDelta) _then;

/// Create a copy of ChatCompletionStreamDelta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? content = freezed,Object? toolCalls = freezed,}) {
  return _then(_ChatCompletionStreamDelta(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,toolCalls: freezed == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,
  ));
}


}


/// @nodoc
mixin _$Tool {

/// The type of the tool.
 ToolType get type;/// A function that the model may call.
 FunctionDefinition get function;
/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCopyWith<Tool> get copyWith => _$ToolCopyWithImpl<Tool>(this as Tool, _$identity);

  /// Serializes this Tool to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tool&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,function);

@override
String toString() {
  return 'Tool(type: $type, function: $function)';
}


}

/// @nodoc
abstract mixin class $ToolCopyWith<$Res>  {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) _then) = _$ToolCopyWithImpl;
@useResult
$Res call({
 ToolType type, FunctionDefinition function
});


$FunctionDefinitionCopyWith<$Res> get function;

}
/// @nodoc
class _$ToolCopyWithImpl<$Res>
    implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._self, this._then);

  final Tool _self;
  final $Res Function(Tool) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? function = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as FunctionDefinition,
  ));
}
/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FunctionDefinitionCopyWith<$Res> get function {
  
  return $FunctionDefinitionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tool].
extension ToolPatterns on Tool {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tool value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tool() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tool value)  $default,){
final _that = this;
switch (_that) {
case _Tool():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tool value)?  $default,){
final _that = this;
switch (_that) {
case _Tool() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolType type,  FunctionDefinition function)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tool() when $default != null:
return $default(_that.type,_that.function);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolType type,  FunctionDefinition function)  $default,) {final _that = this;
switch (_that) {
case _Tool():
return $default(_that.type,_that.function);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolType type,  FunctionDefinition function)?  $default,) {final _that = this;
switch (_that) {
case _Tool() when $default != null:
return $default(_that.type,_that.function);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tool extends Tool {
  const _Tool({required this.type, required this.function}): super._();
  factory _Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

/// The type of the tool.
@override final  ToolType type;
/// A function that the model may call.
@override final  FunctionDefinition function;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCopyWith<_Tool> get copyWith => __$ToolCopyWithImpl<_Tool>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tool&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,function);

@override
String toString() {
  return 'Tool(type: $type, function: $function)';
}


}

/// @nodoc
abstract mixin class _$ToolCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory _$ToolCopyWith(_Tool value, $Res Function(_Tool) _then) = __$ToolCopyWithImpl;
@override @useResult
$Res call({
 ToolType type, FunctionDefinition function
});


@override $FunctionDefinitionCopyWith<$Res> get function;

}
/// @nodoc
class __$ToolCopyWithImpl<$Res>
    implements _$ToolCopyWith<$Res> {
  __$ToolCopyWithImpl(this._self, this._then);

  final _Tool _self;
  final $Res Function(_Tool) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? function = null,}) {
  return _then(_Tool(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as FunctionDefinition,
  ));
}

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FunctionDefinitionCopyWith<$Res> get function {
  
  return $FunctionDefinitionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$FunctionDefinition {

/// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes,
/// with a maximum length of 64.
 String get name;/// A description of what the function does, used by the model to choose when and how to call the function.
@JsonKey(includeIfNull: false) String? get description;/// The parameters the functions accepts, described as a JSON Schema object.
/// Omitting parameters defines a function with an empty parameter list.
 Map<String, dynamic> get parameters;
/// Create a copy of FunctionDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionDefinitionCopyWith<FunctionDefinition> get copyWith => _$FunctionDefinitionCopyWithImpl<FunctionDefinition>(this as FunctionDefinition, _$identity);

  /// Serializes this FunctionDefinition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionDefinition&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'FunctionDefinition(name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $FunctionDefinitionCopyWith<$Res>  {
  factory $FunctionDefinitionCopyWith(FunctionDefinition value, $Res Function(FunctionDefinition) _then) = _$FunctionDefinitionCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description, Map<String, dynamic> parameters
});




}
/// @nodoc
class _$FunctionDefinitionCopyWithImpl<$Res>
    implements $FunctionDefinitionCopyWith<$Res> {
  _$FunctionDefinitionCopyWithImpl(this._self, this._then);

  final FunctionDefinition _self;
  final $Res Function(FunctionDefinition) _then;

/// Create a copy of FunctionDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? parameters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [FunctionDefinition].
extension FunctionDefinitionPatterns on FunctionDefinition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FunctionDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FunctionDefinition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FunctionDefinition value)  $default,){
final _that = this;
switch (_that) {
case _FunctionDefinition():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FunctionDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _FunctionDefinition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FunctionDefinition() when $default != null:
return $default(_that.name,_that.description,_that.parameters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> parameters)  $default,) {final _that = this;
switch (_that) {
case _FunctionDefinition():
return $default(_that.name,_that.description,_that.parameters);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> parameters)?  $default,) {final _that = this;
switch (_that) {
case _FunctionDefinition() when $default != null:
return $default(_that.name,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FunctionDefinition extends FunctionDefinition {
  const _FunctionDefinition({required this.name, @JsonKey(includeIfNull: false) this.description, required final  Map<String, dynamic> parameters}): _parameters = parameters,super._();
  factory _FunctionDefinition.fromJson(Map<String, dynamic> json) => _$FunctionDefinitionFromJson(json);

/// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes,
/// with a maximum length of 64.
@override final  String name;
/// A description of what the function does, used by the model to choose when and how to call the function.
@override@JsonKey(includeIfNull: false) final  String? description;
/// The parameters the functions accepts, described as a JSON Schema object.
/// Omitting parameters defines a function with an empty parameter list.
 final  Map<String, dynamic> _parameters;
/// The parameters the functions accepts, described as a JSON Schema object.
/// Omitting parameters defines a function with an empty parameter list.
@override Map<String, dynamic> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of FunctionDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FunctionDefinitionCopyWith<_FunctionDefinition> get copyWith => __$FunctionDefinitionCopyWithImpl<_FunctionDefinition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FunctionDefinitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FunctionDefinition&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'FunctionDefinition(name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$FunctionDefinitionCopyWith<$Res> implements $FunctionDefinitionCopyWith<$Res> {
  factory _$FunctionDefinitionCopyWith(_FunctionDefinition value, $Res Function(_FunctionDefinition) _then) = __$FunctionDefinitionCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description, Map<String, dynamic> parameters
});




}
/// @nodoc
class __$FunctionDefinitionCopyWithImpl<$Res>
    implements _$FunctionDefinitionCopyWith<$Res> {
  __$FunctionDefinitionCopyWithImpl(this._self, this._then);

  final _FunctionDefinition _self;
  final $Res Function(_FunctionDefinition) _then;

/// Create a copy of FunctionDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? parameters = null,}) {
  return _then(_FunctionDefinition(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$ToolCall {

/// The unique identifier of the tool call.
@JsonKey(includeIfNull: false) String? get id;/// The type of the tool (currently only 'function').
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ToolCallType? get type;/// The function call details.
@JsonKey(includeIfNull: false) FunctionCall? get function;/// The index of the tool call in the list of tool calls.
@JsonKey(includeIfNull: false) int? get index;
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallCopyWith<ToolCall> get copyWith => _$ToolCallCopyWithImpl<ToolCall>(this as ToolCall, _$identity);

  /// Serializes this ToolCall to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCall&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,function,index);

@override
String toString() {
  return 'ToolCall(id: $id, type: $type, function: $function, index: $index)';
}


}

/// @nodoc
abstract mixin class $ToolCallCopyWith<$Res>  {
  factory $ToolCallCopyWith(ToolCall value, $Res Function(ToolCall) _then) = _$ToolCallCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ToolCallType? type,@JsonKey(includeIfNull: false) FunctionCall? function,@JsonKey(includeIfNull: false) int? index
});


$FunctionCallCopyWith<$Res>? get function;

}
/// @nodoc
class _$ToolCallCopyWithImpl<$Res>
    implements $ToolCallCopyWith<$Res> {
  _$ToolCallCopyWithImpl(this._self, this._then);

  final ToolCall _self;
  final $Res Function(ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? function = freezed,Object? index = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolCallType?,function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as FunctionCall?,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FunctionCallCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $FunctionCallCopyWith<$Res>(_self.function!, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToolCall].
extension ToolCallPatterns on ToolCall {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCall value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCall value)  $default,){
final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCall value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ToolCallType? type, @JsonKey(includeIfNull: false)  FunctionCall? function, @JsonKey(includeIfNull: false)  int? index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.id,_that.type,_that.function,_that.index);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ToolCallType? type, @JsonKey(includeIfNull: false)  FunctionCall? function, @JsonKey(includeIfNull: false)  int? index)  $default,) {final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that.id,_that.type,_that.function,_that.index);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ToolCallType? type, @JsonKey(includeIfNull: false)  FunctionCall? function, @JsonKey(includeIfNull: false)  int? index)?  $default,) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.id,_that.type,_that.function,_that.index);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCall extends ToolCall {
  const _ToolCall({@JsonKey(includeIfNull: false) this.id, @JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.type, @JsonKey(includeIfNull: false) this.function, @JsonKey(includeIfNull: false) this.index}): super._();
  factory _ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);

/// The unique identifier of the tool call.
@override@JsonKey(includeIfNull: false) final  String? id;
/// The type of the tool (currently only 'function').
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ToolCallType? type;
/// The function call details.
@override@JsonKey(includeIfNull: false) final  FunctionCall? function;
/// The index of the tool call in the list of tool calls.
@override@JsonKey(includeIfNull: false) final  int? index;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallCopyWith<_ToolCall> get copyWith => __$ToolCallCopyWithImpl<_ToolCall>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCall&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,function,index);

@override
String toString() {
  return 'ToolCall(id: $id, type: $type, function: $function, index: $index)';
}


}

/// @nodoc
abstract mixin class _$ToolCallCopyWith<$Res> implements $ToolCallCopyWith<$Res> {
  factory _$ToolCallCopyWith(_ToolCall value, $Res Function(_ToolCall) _then) = __$ToolCallCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ToolCallType? type,@JsonKey(includeIfNull: false) FunctionCall? function,@JsonKey(includeIfNull: false) int? index
});


@override $FunctionCallCopyWith<$Res>? get function;

}
/// @nodoc
class __$ToolCallCopyWithImpl<$Res>
    implements _$ToolCallCopyWith<$Res> {
  __$ToolCallCopyWithImpl(this._self, this._then);

  final _ToolCall _self;
  final $Res Function(_ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? function = freezed,Object? index = freezed,}) {
  return _then(_ToolCall(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolCallType?,function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as FunctionCall?,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FunctionCallCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $FunctionCallCopyWith<$Res>(_self.function!, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$FunctionCall {

/// The name of the function to call.
@JsonKey(includeIfNull: false) String? get name;/// The arguments to call the function with, as generated by the model in JSON format.
@JsonKey(includeIfNull: false) String? get arguments;
/// Create a copy of FunctionCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionCallCopyWith<FunctionCall> get copyWith => _$FunctionCallCopyWithImpl<FunctionCall>(this as FunctionCall, _$identity);

  /// Serializes this FunctionCall to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionCall&&(identical(other.name, name) || other.name == name)&&(identical(other.arguments, arguments) || other.arguments == arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,arguments);

@override
String toString() {
  return 'FunctionCall(name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $FunctionCallCopyWith<$Res>  {
  factory $FunctionCallCopyWith(FunctionCall value, $Res Function(FunctionCall) _then) = _$FunctionCallCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? arguments
});




}
/// @nodoc
class _$FunctionCallCopyWithImpl<$Res>
    implements $FunctionCallCopyWith<$Res> {
  _$FunctionCallCopyWithImpl(this._self, this._then);

  final FunctionCall _self;
  final $Res Function(FunctionCall) _then;

/// Create a copy of FunctionCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? arguments = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,arguments: freezed == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FunctionCall].
extension FunctionCallPatterns on FunctionCall {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FunctionCall value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FunctionCall() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FunctionCall value)  $default,){
final _that = this;
switch (_that) {
case _FunctionCall():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FunctionCall value)?  $default,){
final _that = this;
switch (_that) {
case _FunctionCall() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FunctionCall() when $default != null:
return $default(_that.name,_that.arguments);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? arguments)  $default,) {final _that = this;
switch (_that) {
case _FunctionCall():
return $default(_that.name,_that.arguments);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? arguments)?  $default,) {final _that = this;
switch (_that) {
case _FunctionCall() when $default != null:
return $default(_that.name,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FunctionCall extends FunctionCall {
  const _FunctionCall({@JsonKey(includeIfNull: false) this.name, @JsonKey(includeIfNull: false) this.arguments}): super._();
  factory _FunctionCall.fromJson(Map<String, dynamic> json) => _$FunctionCallFromJson(json);

/// The name of the function to call.
@override@JsonKey(includeIfNull: false) final  String? name;
/// The arguments to call the function with, as generated by the model in JSON format.
@override@JsonKey(includeIfNull: false) final  String? arguments;

/// Create a copy of FunctionCall
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FunctionCallCopyWith<_FunctionCall> get copyWith => __$FunctionCallCopyWithImpl<_FunctionCall>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FunctionCallToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FunctionCall&&(identical(other.name, name) || other.name == name)&&(identical(other.arguments, arguments) || other.arguments == arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,arguments);

@override
String toString() {
  return 'FunctionCall(name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$FunctionCallCopyWith<$Res> implements $FunctionCallCopyWith<$Res> {
  factory _$FunctionCallCopyWith(_FunctionCall value, $Res Function(_FunctionCall) _then) = __$FunctionCallCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? arguments
});




}
/// @nodoc
class __$FunctionCallCopyWithImpl<$Res>
    implements _$FunctionCallCopyWith<$Res> {
  __$FunctionCallCopyWithImpl(this._self, this._then);

  final _FunctionCall _self;
  final $Res Function(_FunctionCall) _then;

/// Create a copy of FunctionCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? arguments = freezed,}) {
  return _then(_FunctionCall(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,arguments: freezed == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ToolChoiceTool {

/// The type of the tool.
 ToolType get type;/// The function to force the model to call.
 ToolChoiceToolFunction get function;
/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolChoiceToolCopyWith<ToolChoiceTool> get copyWith => _$ToolChoiceToolCopyWithImpl<ToolChoiceTool>(this as ToolChoiceTool, _$identity);

  /// Serializes this ToolChoiceTool to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolChoiceTool&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,function);

@override
String toString() {
  return 'ToolChoiceTool(type: $type, function: $function)';
}


}

/// @nodoc
abstract mixin class $ToolChoiceToolCopyWith<$Res>  {
  factory $ToolChoiceToolCopyWith(ToolChoiceTool value, $Res Function(ToolChoiceTool) _then) = _$ToolChoiceToolCopyWithImpl;
@useResult
$Res call({
 ToolType type, ToolChoiceToolFunction function
});


$ToolChoiceToolFunctionCopyWith<$Res> get function;

}
/// @nodoc
class _$ToolChoiceToolCopyWithImpl<$Res>
    implements $ToolChoiceToolCopyWith<$Res> {
  _$ToolChoiceToolCopyWithImpl(this._self, this._then);

  final ToolChoiceTool _self;
  final $Res Function(ToolChoiceTool) _then;

/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? function = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolChoiceToolFunction,
  ));
}
/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceToolFunctionCopyWith<$Res> get function {
  
  return $ToolChoiceToolFunctionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// Adds pattern-matching-related methods to [ToolChoiceTool].
extension ToolChoiceToolPatterns on ToolChoiceTool {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolChoiceTool value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolChoiceTool() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolChoiceTool value)  $default,){
final _that = this;
switch (_that) {
case _ToolChoiceTool():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolChoiceTool value)?  $default,){
final _that = this;
switch (_that) {
case _ToolChoiceTool() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolType type,  ToolChoiceToolFunction function)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolChoiceTool() when $default != null:
return $default(_that.type,_that.function);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolType type,  ToolChoiceToolFunction function)  $default,) {final _that = this;
switch (_that) {
case _ToolChoiceTool():
return $default(_that.type,_that.function);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolType type,  ToolChoiceToolFunction function)?  $default,) {final _that = this;
switch (_that) {
case _ToolChoiceTool() when $default != null:
return $default(_that.type,_that.function);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolChoiceTool extends ToolChoiceTool {
  const _ToolChoiceTool({required this.type, required this.function}): super._();
  factory _ToolChoiceTool.fromJson(Map<String, dynamic> json) => _$ToolChoiceToolFromJson(json);

/// The type of the tool.
@override final  ToolType type;
/// The function to force the model to call.
@override final  ToolChoiceToolFunction function;

/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolChoiceToolCopyWith<_ToolChoiceTool> get copyWith => __$ToolChoiceToolCopyWithImpl<_ToolChoiceTool>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolChoiceToolToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolChoiceTool&&(identical(other.type, type) || other.type == type)&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,function);

@override
String toString() {
  return 'ToolChoiceTool(type: $type, function: $function)';
}


}

/// @nodoc
abstract mixin class _$ToolChoiceToolCopyWith<$Res> implements $ToolChoiceToolCopyWith<$Res> {
  factory _$ToolChoiceToolCopyWith(_ToolChoiceTool value, $Res Function(_ToolChoiceTool) _then) = __$ToolChoiceToolCopyWithImpl;
@override @useResult
$Res call({
 ToolType type, ToolChoiceToolFunction function
});


@override $ToolChoiceToolFunctionCopyWith<$Res> get function;

}
/// @nodoc
class __$ToolChoiceToolCopyWithImpl<$Res>
    implements _$ToolChoiceToolCopyWith<$Res> {
  __$ToolChoiceToolCopyWithImpl(this._self, this._then);

  final _ToolChoiceTool _self;
  final $Res Function(_ToolChoiceTool) _then;

/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? function = null,}) {
  return _then(_ToolChoiceTool(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: null == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolChoiceToolFunction,
  ));
}

/// Create a copy of ToolChoiceTool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolChoiceToolFunctionCopyWith<$Res> get function {
  
  return $ToolChoiceToolFunctionCopyWith<$Res>(_self.function, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$ToolChoiceToolFunction {

/// The name of the function to call.
 String get name;
/// Create a copy of ToolChoiceToolFunction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolChoiceToolFunctionCopyWith<ToolChoiceToolFunction> get copyWith => _$ToolChoiceToolFunctionCopyWithImpl<ToolChoiceToolFunction>(this as ToolChoiceToolFunction, _$identity);

  /// Serializes this ToolChoiceToolFunction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolChoiceToolFunction&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ToolChoiceToolFunction(name: $name)';
}


}

/// @nodoc
abstract mixin class $ToolChoiceToolFunctionCopyWith<$Res>  {
  factory $ToolChoiceToolFunctionCopyWith(ToolChoiceToolFunction value, $Res Function(ToolChoiceToolFunction) _then) = _$ToolChoiceToolFunctionCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$ToolChoiceToolFunctionCopyWithImpl<$Res>
    implements $ToolChoiceToolFunctionCopyWith<$Res> {
  _$ToolChoiceToolFunctionCopyWithImpl(this._self, this._then);

  final ToolChoiceToolFunction _self;
  final $Res Function(ToolChoiceToolFunction) _then;

/// Create a copy of ToolChoiceToolFunction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolChoiceToolFunction].
extension ToolChoiceToolFunctionPatterns on ToolChoiceToolFunction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolChoiceToolFunction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolChoiceToolFunction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolChoiceToolFunction value)  $default,){
final _that = this;
switch (_that) {
case _ToolChoiceToolFunction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolChoiceToolFunction value)?  $default,){
final _that = this;
switch (_that) {
case _ToolChoiceToolFunction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolChoiceToolFunction() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _ToolChoiceToolFunction():
return $default(_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _ToolChoiceToolFunction() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolChoiceToolFunction extends ToolChoiceToolFunction {
  const _ToolChoiceToolFunction({required this.name}): super._();
  factory _ToolChoiceToolFunction.fromJson(Map<String, dynamic> json) => _$ToolChoiceToolFunctionFromJson(json);

/// The name of the function to call.
@override final  String name;

/// Create a copy of ToolChoiceToolFunction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolChoiceToolFunctionCopyWith<_ToolChoiceToolFunction> get copyWith => __$ToolChoiceToolFunctionCopyWithImpl<_ToolChoiceToolFunction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolChoiceToolFunctionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolChoiceToolFunction&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ToolChoiceToolFunction(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ToolChoiceToolFunctionCopyWith<$Res> implements $ToolChoiceToolFunctionCopyWith<$Res> {
  factory _$ToolChoiceToolFunctionCopyWith(_ToolChoiceToolFunction value, $Res Function(_ToolChoiceToolFunction) _then) = __$ToolChoiceToolFunctionCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ToolChoiceToolFunctionCopyWithImpl<$Res>
    implements _$ToolChoiceToolFunctionCopyWith<$Res> {
  __$ToolChoiceToolFunctionCopyWithImpl(this._self, this._then);

  final _ToolChoiceToolFunction _self;
  final $Res Function(_ToolChoiceToolFunction) _then;

/// Create a copy of ToolChoiceToolFunction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ToolChoiceToolFunction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ResponseFormat {

/// The type of response format.
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ResponseFormatType? get type;/// The JSON schema for structured output.
@JsonKey(name: 'json_schema', includeIfNull: false) JsonSchema? get jsonSchema;
/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseFormatCopyWith<ResponseFormat> get copyWith => _$ResponseFormatCopyWithImpl<ResponseFormat>(this as ResponseFormat, _$identity);

  /// Serializes this ResponseFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseFormat&&(identical(other.type, type) || other.type == type)&&(identical(other.jsonSchema, jsonSchema) || other.jsonSchema == jsonSchema));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,jsonSchema);

@override
String toString() {
  return 'ResponseFormat(type: $type, jsonSchema: $jsonSchema)';
}


}

/// @nodoc
abstract mixin class $ResponseFormatCopyWith<$Res>  {
  factory $ResponseFormatCopyWith(ResponseFormat value, $Res Function(ResponseFormat) _then) = _$ResponseFormatCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ResponseFormatType? type,@JsonKey(name: 'json_schema', includeIfNull: false) JsonSchema? jsonSchema
});


$JsonSchemaCopyWith<$Res>? get jsonSchema;

}
/// @nodoc
class _$ResponseFormatCopyWithImpl<$Res>
    implements $ResponseFormatCopyWith<$Res> {
  _$ResponseFormatCopyWithImpl(this._self, this._then);

  final ResponseFormat _self;
  final $Res Function(ResponseFormat) _then;

/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? jsonSchema = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResponseFormatType?,jsonSchema: freezed == jsonSchema ? _self.jsonSchema : jsonSchema // ignore: cast_nullable_to_non_nullable
as JsonSchema?,
  ));
}
/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JsonSchemaCopyWith<$Res>? get jsonSchema {
    if (_self.jsonSchema == null) {
    return null;
  }

  return $JsonSchemaCopyWith<$Res>(_self.jsonSchema!, (value) {
    return _then(_self.copyWith(jsonSchema: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResponseFormat].
extension ResponseFormatPatterns on ResponseFormat {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseFormat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseFormat() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseFormat value)  $default,){
final _that = this;
switch (_that) {
case _ResponseFormat():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseFormat value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseFormat() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ResponseFormatType? type, @JsonKey(name: 'json_schema', includeIfNull: false)  JsonSchema? jsonSchema)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseFormat() when $default != null:
return $default(_that.type,_that.jsonSchema);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ResponseFormatType? type, @JsonKey(name: 'json_schema', includeIfNull: false)  JsonSchema? jsonSchema)  $default,) {final _that = this;
switch (_that) {
case _ResponseFormat():
return $default(_that.type,_that.jsonSchema);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ResponseFormatType? type, @JsonKey(name: 'json_schema', includeIfNull: false)  JsonSchema? jsonSchema)?  $default,) {final _that = this;
switch (_that) {
case _ResponseFormat() when $default != null:
return $default(_that.type,_that.jsonSchema);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponseFormat extends ResponseFormat {
  const _ResponseFormat({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.type, @JsonKey(name: 'json_schema', includeIfNull: false) this.jsonSchema}): super._();
  factory _ResponseFormat.fromJson(Map<String, dynamic> json) => _$ResponseFormatFromJson(json);

/// The type of response format.
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ResponseFormatType? type;
/// The JSON schema for structured output.
@override@JsonKey(name: 'json_schema', includeIfNull: false) final  JsonSchema? jsonSchema;

/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseFormatCopyWith<_ResponseFormat> get copyWith => __$ResponseFormatCopyWithImpl<_ResponseFormat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseFormatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseFormat&&(identical(other.type, type) || other.type == type)&&(identical(other.jsonSchema, jsonSchema) || other.jsonSchema == jsonSchema));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,jsonSchema);

@override
String toString() {
  return 'ResponseFormat(type: $type, jsonSchema: $jsonSchema)';
}


}

/// @nodoc
abstract mixin class _$ResponseFormatCopyWith<$Res> implements $ResponseFormatCopyWith<$Res> {
  factory _$ResponseFormatCopyWith(_ResponseFormat value, $Res Function(_ResponseFormat) _then) = __$ResponseFormatCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ResponseFormatType? type,@JsonKey(name: 'json_schema', includeIfNull: false) JsonSchema? jsonSchema
});


@override $JsonSchemaCopyWith<$Res>? get jsonSchema;

}
/// @nodoc
class __$ResponseFormatCopyWithImpl<$Res>
    implements _$ResponseFormatCopyWith<$Res> {
  __$ResponseFormatCopyWithImpl(this._self, this._then);

  final _ResponseFormat _self;
  final $Res Function(_ResponseFormat) _then;

/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? jsonSchema = freezed,}) {
  return _then(_ResponseFormat(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResponseFormatType?,jsonSchema: freezed == jsonSchema ? _self.jsonSchema : jsonSchema // ignore: cast_nullable_to_non_nullable
as JsonSchema?,
  ));
}

/// Create a copy of ResponseFormat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JsonSchemaCopyWith<$Res>? get jsonSchema {
    if (_self.jsonSchema == null) {
    return null;
  }

  return $JsonSchemaCopyWith<$Res>(_self.jsonSchema!, (value) {
    return _then(_self.copyWith(jsonSchema: value));
  });
}
}


/// @nodoc
mixin _$JsonSchema {

/// The name of the response format.
 String get name;/// A description of the response format.
@JsonKey(includeIfNull: false) String? get description;/// The JSON schema object.
 Map<String, dynamic> get schema;/// Whether to enable strict schema adherence.
@JsonKey(includeIfNull: false) bool? get strict;
/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsonSchemaCopyWith<JsonSchema> get copyWith => _$JsonSchemaCopyWithImpl<JsonSchema>(this as JsonSchema, _$identity);

  /// Serializes this JsonSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsonSchema&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.schema, schema)&&(identical(other.strict, strict) || other.strict == strict));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(schema),strict);

@override
String toString() {
  return 'JsonSchema(name: $name, description: $description, schema: $schema, strict: $strict)';
}


}

/// @nodoc
abstract mixin class $JsonSchemaCopyWith<$Res>  {
  factory $JsonSchemaCopyWith(JsonSchema value, $Res Function(JsonSchema) _then) = _$JsonSchemaCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description, Map<String, dynamic> schema,@JsonKey(includeIfNull: false) bool? strict
});




}
/// @nodoc
class _$JsonSchemaCopyWithImpl<$Res>
    implements $JsonSchemaCopyWith<$Res> {
  _$JsonSchemaCopyWithImpl(this._self, this._then);

  final JsonSchema _self;
  final $Res Function(JsonSchema) _then;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? schema = null,Object? strict = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,schema: null == schema ? _self.schema : schema // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,strict: freezed == strict ? _self.strict : strict // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [JsonSchema].
extension JsonSchemaPatterns on JsonSchema {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JsonSchema value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JsonSchema value)  $default,){
final _that = this;
switch (_that) {
case _JsonSchema():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JsonSchema value)?  $default,){
final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> schema, @JsonKey(includeIfNull: false)  bool? strict)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that.name,_that.description,_that.schema,_that.strict);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> schema, @JsonKey(includeIfNull: false)  bool? strict)  $default,) {final _that = this;
switch (_that) {
case _JsonSchema():
return $default(_that.name,_that.description,_that.schema,_that.strict);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(includeIfNull: false)  String? description,  Map<String, dynamic> schema, @JsonKey(includeIfNull: false)  bool? strict)?  $default,) {final _that = this;
switch (_that) {
case _JsonSchema() when $default != null:
return $default(_that.name,_that.description,_that.schema,_that.strict);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JsonSchema extends JsonSchema {
  const _JsonSchema({required this.name, @JsonKey(includeIfNull: false) this.description, required final  Map<String, dynamic> schema, @JsonKey(includeIfNull: false) this.strict}): _schema = schema,super._();
  factory _JsonSchema.fromJson(Map<String, dynamic> json) => _$JsonSchemaFromJson(json);

/// The name of the response format.
@override final  String name;
/// A description of the response format.
@override@JsonKey(includeIfNull: false) final  String? description;
/// The JSON schema object.
 final  Map<String, dynamic> _schema;
/// The JSON schema object.
@override Map<String, dynamic> get schema {
  if (_schema is EqualUnmodifiableMapView) return _schema;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_schema);
}

/// Whether to enable strict schema adherence.
@override@JsonKey(includeIfNull: false) final  bool? strict;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsonSchemaCopyWith<_JsonSchema> get copyWith => __$JsonSchemaCopyWithImpl<_JsonSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsonSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsonSchema&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._schema, _schema)&&(identical(other.strict, strict) || other.strict == strict));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_schema),strict);

@override
String toString() {
  return 'JsonSchema(name: $name, description: $description, schema: $schema, strict: $strict)';
}


}

/// @nodoc
abstract mixin class _$JsonSchemaCopyWith<$Res> implements $JsonSchemaCopyWith<$Res> {
  factory _$JsonSchemaCopyWith(_JsonSchema value, $Res Function(_JsonSchema) _then) = __$JsonSchemaCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(includeIfNull: false) String? description, Map<String, dynamic> schema,@JsonKey(includeIfNull: false) bool? strict
});




}
/// @nodoc
class __$JsonSchemaCopyWithImpl<$Res>
    implements _$JsonSchemaCopyWith<$Res> {
  __$JsonSchemaCopyWithImpl(this._self, this._then);

  final _JsonSchema _self;
  final $Res Function(_JsonSchema) _then;

/// Create a copy of JsonSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? schema = null,Object? strict = freezed,}) {
  return _then(_JsonSchema(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,schema: null == schema ? _self._schema : schema // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,strict: freezed == strict ? _self.strict : strict // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Prediction {

/// The type of prediction, currently only 'content' is supported.
 PredictionType get type;/// The predicted content that the model should generate.
 String get content;
/// Create a copy of Prediction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PredictionCopyWith<Prediction> get copyWith => _$PredictionCopyWithImpl<Prediction>(this as Prediction, _$identity);

  /// Serializes this Prediction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Prediction&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content);

@override
String toString() {
  return 'Prediction(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class $PredictionCopyWith<$Res>  {
  factory $PredictionCopyWith(Prediction value, $Res Function(Prediction) _then) = _$PredictionCopyWithImpl;
@useResult
$Res call({
 PredictionType type, String content
});




}
/// @nodoc
class _$PredictionCopyWithImpl<$Res>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._self, this._then);

  final Prediction _self;
  final $Res Function(Prediction) _then;

/// Create a copy of Prediction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? content = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PredictionType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Prediction].
extension PredictionPatterns on Prediction {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Prediction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Prediction() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Prediction value)  $default,){
final _that = this;
switch (_that) {
case _Prediction():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Prediction value)?  $default,){
final _that = this;
switch (_that) {
case _Prediction() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PredictionType type,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Prediction() when $default != null:
return $default(_that.type,_that.content);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PredictionType type,  String content)  $default,) {final _that = this;
switch (_that) {
case _Prediction():
return $default(_that.type,_that.content);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PredictionType type,  String content)?  $default,) {final _that = this;
switch (_that) {
case _Prediction() when $default != null:
return $default(_that.type,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Prediction extends Prediction {
  const _Prediction({required this.type, required this.content}): super._();
  factory _Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);

/// The type of prediction, currently only 'content' is supported.
@override final  PredictionType type;
/// The predicted content that the model should generate.
@override final  String content;

/// Create a copy of Prediction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PredictionCopyWith<_Prediction> get copyWith => __$PredictionCopyWithImpl<_Prediction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PredictionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Prediction&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,content);

@override
String toString() {
  return 'Prediction(type: $type, content: $content)';
}


}

/// @nodoc
abstract mixin class _$PredictionCopyWith<$Res> implements $PredictionCopyWith<$Res> {
  factory _$PredictionCopyWith(_Prediction value, $Res Function(_Prediction) _then) = __$PredictionCopyWithImpl;
@override @useResult
$Res call({
 PredictionType type, String content
});




}
/// @nodoc
class __$PredictionCopyWithImpl<$Res>
    implements _$PredictionCopyWith<$Res> {
  __$PredictionCopyWithImpl(this._self, this._then);

  final _Prediction _self;
  final $Res Function(_Prediction) _then;

/// Create a copy of Prediction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? content = null,}) {
  return _then(_Prediction(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PredictionType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmbeddingRequest {

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@_EmbeddingModelConverter() EmbeddingModel get model;/// The list of strings to embed.
 List<String> get input;/// The number of dimensions the resulting output embeddings should have.
/// Only supported by certain models (e.g., codestral-embed-2505).
@JsonKey(name: 'output_dimension', includeIfNull: false) int? get outputDimension;/// The data type of the output embeddings.
@JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingOutputDtype? get outputDtype;/// The format of the output data.
@JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingEncodingFormat? get encodingFormat;
/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingRequestCopyWith<EmbeddingRequest> get copyWith => _$EmbeddingRequestCopyWithImpl<EmbeddingRequest>(this as EmbeddingRequest, _$identity);

  /// Serializes this EmbeddingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.input, input)&&(identical(other.outputDimension, outputDimension) || other.outputDimension == outputDimension)&&(identical(other.outputDtype, outputDtype) || other.outputDtype == outputDtype)&&(identical(other.encodingFormat, encodingFormat) || other.encodingFormat == encodingFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(input),outputDimension,outputDtype,encodingFormat);

@override
String toString() {
  return 'EmbeddingRequest(model: $model, input: $input, outputDimension: $outputDimension, outputDtype: $outputDtype, encodingFormat: $encodingFormat)';
}


}

/// @nodoc
abstract mixin class $EmbeddingRequestCopyWith<$Res>  {
  factory $EmbeddingRequestCopyWith(EmbeddingRequest value, $Res Function(EmbeddingRequest) _then) = _$EmbeddingRequestCopyWithImpl;
@useResult
$Res call({
@_EmbeddingModelConverter() EmbeddingModel model, List<String> input,@JsonKey(name: 'output_dimension', includeIfNull: false) int? outputDimension,@JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingOutputDtype? outputDtype,@JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingEncodingFormat? encodingFormat
});


$EmbeddingModelCopyWith<$Res> get model;

}
/// @nodoc
class _$EmbeddingRequestCopyWithImpl<$Res>
    implements $EmbeddingRequestCopyWith<$Res> {
  _$EmbeddingRequestCopyWithImpl(this._self, this._then);

  final EmbeddingRequest _self;
  final $Res Function(EmbeddingRequest) _then;

/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? input = null,Object? outputDimension = freezed,Object? outputDtype = freezed,Object? encodingFormat = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as EmbeddingModel,input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as List<String>,outputDimension: freezed == outputDimension ? _self.outputDimension : outputDimension // ignore: cast_nullable_to_non_nullable
as int?,outputDtype: freezed == outputDtype ? _self.outputDtype : outputDtype // ignore: cast_nullable_to_non_nullable
as EmbeddingOutputDtype?,encodingFormat: freezed == encodingFormat ? _self.encodingFormat : encodingFormat // ignore: cast_nullable_to_non_nullable
as EmbeddingEncodingFormat?,
  ));
}
/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddingModelCopyWith<$Res> get model {
  
  return $EmbeddingModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmbeddingRequest].
extension EmbeddingRequestPatterns on EmbeddingRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbeddingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbeddingRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbeddingRequest value)  $default,){
final _that = this;
switch (_that) {
case _EmbeddingRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbeddingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EmbeddingRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@_EmbeddingModelConverter()  EmbeddingModel model,  List<String> input, @JsonKey(name: 'output_dimension', includeIfNull: false)  int? outputDimension, @JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingOutputDtype? outputDtype, @JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingEncodingFormat? encodingFormat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbeddingRequest() when $default != null:
return $default(_that.model,_that.input,_that.outputDimension,_that.outputDtype,_that.encodingFormat);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@_EmbeddingModelConverter()  EmbeddingModel model,  List<String> input, @JsonKey(name: 'output_dimension', includeIfNull: false)  int? outputDimension, @JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingOutputDtype? outputDtype, @JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingEncodingFormat? encodingFormat)  $default,) {final _that = this;
switch (_that) {
case _EmbeddingRequest():
return $default(_that.model,_that.input,_that.outputDimension,_that.outputDtype,_that.encodingFormat);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@_EmbeddingModelConverter()  EmbeddingModel model,  List<String> input, @JsonKey(name: 'output_dimension', includeIfNull: false)  int? outputDimension, @JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingOutputDtype? outputDtype, @JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  EmbeddingEncodingFormat? encodingFormat)?  $default,) {final _that = this;
switch (_that) {
case _EmbeddingRequest() when $default != null:
return $default(_that.model,_that.input,_that.outputDimension,_that.outputDtype,_that.encodingFormat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmbeddingRequest extends EmbeddingRequest {
  const _EmbeddingRequest({@_EmbeddingModelConverter() required this.model, required final  List<String> input, @JsonKey(name: 'output_dimension', includeIfNull: false) this.outputDimension, @JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.outputDtype, @JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.encodingFormat}): _input = input,super._();
  factory _EmbeddingRequest.fromJson(Map<String, dynamic> json) => _$EmbeddingRequestFromJson(json);

/// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
@override@_EmbeddingModelConverter() final  EmbeddingModel model;
/// The list of strings to embed.
 final  List<String> _input;
/// The list of strings to embed.
@override List<String> get input {
  if (_input is EqualUnmodifiableListView) return _input;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_input);
}

/// The number of dimensions the resulting output embeddings should have.
/// Only supported by certain models (e.g., codestral-embed-2505).
@override@JsonKey(name: 'output_dimension', includeIfNull: false) final  int? outputDimension;
/// The data type of the output embeddings.
@override@JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  EmbeddingOutputDtype? outputDtype;
/// The format of the output data.
@override@JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  EmbeddingEncodingFormat? encodingFormat;

/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddingRequestCopyWith<_EmbeddingRequest> get copyWith => __$EmbeddingRequestCopyWithImpl<_EmbeddingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddingRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._input, _input)&&(identical(other.outputDimension, outputDimension) || other.outputDimension == outputDimension)&&(identical(other.outputDtype, outputDtype) || other.outputDtype == outputDtype)&&(identical(other.encodingFormat, encodingFormat) || other.encodingFormat == encodingFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_input),outputDimension,outputDtype,encodingFormat);

@override
String toString() {
  return 'EmbeddingRequest(model: $model, input: $input, outputDimension: $outputDimension, outputDtype: $outputDtype, encodingFormat: $encodingFormat)';
}


}

/// @nodoc
abstract mixin class _$EmbeddingRequestCopyWith<$Res> implements $EmbeddingRequestCopyWith<$Res> {
  factory _$EmbeddingRequestCopyWith(_EmbeddingRequest value, $Res Function(_EmbeddingRequest) _then) = __$EmbeddingRequestCopyWithImpl;
@override @useResult
$Res call({
@_EmbeddingModelConverter() EmbeddingModel model, List<String> input,@JsonKey(name: 'output_dimension', includeIfNull: false) int? outputDimension,@JsonKey(name: 'output_dtype', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingOutputDtype? outputDtype,@JsonKey(name: 'encoding_format', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) EmbeddingEncodingFormat? encodingFormat
});


@override $EmbeddingModelCopyWith<$Res> get model;

}
/// @nodoc
class __$EmbeddingRequestCopyWithImpl<$Res>
    implements _$EmbeddingRequestCopyWith<$Res> {
  __$EmbeddingRequestCopyWithImpl(this._self, this._then);

  final _EmbeddingRequest _self;
  final $Res Function(_EmbeddingRequest) _then;

/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? input = null,Object? outputDimension = freezed,Object? outputDtype = freezed,Object? encodingFormat = freezed,}) {
  return _then(_EmbeddingRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as EmbeddingModel,input: null == input ? _self._input : input // ignore: cast_nullable_to_non_nullable
as List<String>,outputDimension: freezed == outputDimension ? _self.outputDimension : outputDimension // ignore: cast_nullable_to_non_nullable
as int?,outputDtype: freezed == outputDtype ? _self.outputDtype : outputDtype // ignore: cast_nullable_to_non_nullable
as EmbeddingOutputDtype?,encodingFormat: freezed == encodingFormat ? _self.encodingFormat : encodingFormat // ignore: cast_nullable_to_non_nullable
as EmbeddingEncodingFormat?,
  ));
}

/// Create a copy of EmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddingModelCopyWith<$Res> get model {
  
  return $EmbeddingModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

EmbeddingModel _$EmbeddingModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'model':
          return EmbeddingModelEnumeration.fromJson(
            json
          );
                case 'modelId':
          return EmbeddingModelString.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'EmbeddingModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$EmbeddingModel {

 Object get value;

  /// Serializes this EmbeddingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingModel&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'EmbeddingModel(value: $value)';
}


}

/// @nodoc
class $EmbeddingModelCopyWith<$Res>  {
$EmbeddingModelCopyWith(EmbeddingModel _, $Res Function(EmbeddingModel) __);
}


/// Adds pattern-matching-related methods to [EmbeddingModel].
extension EmbeddingModelPatterns on EmbeddingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmbeddingModelEnumeration value)?  model,TResult Function( EmbeddingModelString value)?  modelId,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmbeddingModelEnumeration() when model != null:
return model(_that);case EmbeddingModelString() when modelId != null:
return modelId(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmbeddingModelEnumeration value)  model,required TResult Function( EmbeddingModelString value)  modelId,}){
final _that = this;
switch (_that) {
case EmbeddingModelEnumeration():
return model(_that);case EmbeddingModelString():
return modelId(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmbeddingModelEnumeration value)?  model,TResult? Function( EmbeddingModelString value)?  modelId,}){
final _that = this;
switch (_that) {
case EmbeddingModelEnumeration() when model != null:
return model(_that);case EmbeddingModelString() when modelId != null:
return modelId(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EmbeddingModels value)?  model,TResult Function( String value)?  modelId,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmbeddingModelEnumeration() when model != null:
return model(_that.value);case EmbeddingModelString() when modelId != null:
return modelId(_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EmbeddingModels value)  model,required TResult Function( String value)  modelId,}) {final _that = this;
switch (_that) {
case EmbeddingModelEnumeration():
return model(_that.value);case EmbeddingModelString():
return modelId(_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EmbeddingModels value)?  model,TResult? Function( String value)?  modelId,}) {final _that = this;
switch (_that) {
case EmbeddingModelEnumeration() when model != null:
return model(_that.value);case EmbeddingModelString() when modelId != null:
return modelId(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class EmbeddingModelEnumeration extends EmbeddingModel {
  const EmbeddingModelEnumeration(this.value, {final  String? $type}): $type = $type ?? 'model',super._();
  factory EmbeddingModelEnumeration.fromJson(Map<String, dynamic> json) => _$EmbeddingModelEnumerationFromJson(json);

@override final  EmbeddingModels value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EmbeddingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingModelEnumerationCopyWith<EmbeddingModelEnumeration> get copyWith => _$EmbeddingModelEnumerationCopyWithImpl<EmbeddingModelEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingModelEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingModelEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'EmbeddingModel.model(value: $value)';
}


}

/// @nodoc
abstract mixin class $EmbeddingModelEnumerationCopyWith<$Res> implements $EmbeddingModelCopyWith<$Res> {
  factory $EmbeddingModelEnumerationCopyWith(EmbeddingModelEnumeration value, $Res Function(EmbeddingModelEnumeration) _then) = _$EmbeddingModelEnumerationCopyWithImpl;
@useResult
$Res call({
 EmbeddingModels value
});




}
/// @nodoc
class _$EmbeddingModelEnumerationCopyWithImpl<$Res>
    implements $EmbeddingModelEnumerationCopyWith<$Res> {
  _$EmbeddingModelEnumerationCopyWithImpl(this._self, this._then);

  final EmbeddingModelEnumeration _self;
  final $Res Function(EmbeddingModelEnumeration) _then;

/// Create a copy of EmbeddingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(EmbeddingModelEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as EmbeddingModels,
  ));
}


}

/// @nodoc
@JsonSerializable()

class EmbeddingModelString extends EmbeddingModel {
  const EmbeddingModelString(this.value, {final  String? $type}): $type = $type ?? 'modelId',super._();
  factory EmbeddingModelString.fromJson(Map<String, dynamic> json) => _$EmbeddingModelStringFromJson(json);

@override final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EmbeddingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingModelStringCopyWith<EmbeddingModelString> get copyWith => _$EmbeddingModelStringCopyWithImpl<EmbeddingModelString>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingModelStringToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingModelString&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'EmbeddingModel.modelId(value: $value)';
}


}

/// @nodoc
abstract mixin class $EmbeddingModelStringCopyWith<$Res> implements $EmbeddingModelCopyWith<$Res> {
  factory $EmbeddingModelStringCopyWith(EmbeddingModelString value, $Res Function(EmbeddingModelString) _then) = _$EmbeddingModelStringCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$EmbeddingModelStringCopyWithImpl<$Res>
    implements $EmbeddingModelStringCopyWith<$Res> {
  _$EmbeddingModelStringCopyWithImpl(this._self, this._then);

  final EmbeddingModelString _self;
  final $Res Function(EmbeddingModelString) _then;

/// Create a copy of EmbeddingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(EmbeddingModelString(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmbeddingResponse {

/// The unique identifier for this embedding response.
 String get id;/// The object type, which is always `list`.
 String get object;/// The list of embeddings.
 List<Embedding> get data;/// The model used for this embedding.
 String get model;/// Unix timestamp when the response was created.
@JsonKey(includeIfNull: false) int? get created;/// The usage statistics for this embedding.
 EmbeddingUsage get usage;
/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingResponseCopyWith<EmbeddingResponse> get copyWith => _$EmbeddingResponseCopyWithImpl<EmbeddingResponse>(this as EmbeddingResponse, _$identity);

  /// Serializes this EmbeddingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.model, model) || other.model == model)&&(identical(other.created, created) || other.created == created)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,const DeepCollectionEquality().hash(data),model,created,usage);

@override
String toString() {
  return 'EmbeddingResponse(id: $id, object: $object, data: $data, model: $model, created: $created, usage: $usage)';
}


}

/// @nodoc
abstract mixin class $EmbeddingResponseCopyWith<$Res>  {
  factory $EmbeddingResponseCopyWith(EmbeddingResponse value, $Res Function(EmbeddingResponse) _then) = _$EmbeddingResponseCopyWithImpl;
@useResult
$Res call({
 String id, String object, List<Embedding> data, String model,@JsonKey(includeIfNull: false) int? created, EmbeddingUsage usage
});


$EmbeddingUsageCopyWith<$Res> get usage;

}
/// @nodoc
class _$EmbeddingResponseCopyWithImpl<$Res>
    implements $EmbeddingResponseCopyWith<$Res> {
  _$EmbeddingResponseCopyWithImpl(this._self, this._then);

  final EmbeddingResponse _self;
  final $Res Function(EmbeddingResponse) _then;

/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? object = null,Object? data = null,Object? model = null,Object? created = freezed,Object? usage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Embedding>,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int?,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as EmbeddingUsage,
  ));
}
/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddingUsageCopyWith<$Res> get usage {
  
  return $EmbeddingUsageCopyWith<$Res>(_self.usage, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmbeddingResponse].
extension EmbeddingResponsePatterns on EmbeddingResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbeddingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbeddingResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbeddingResponse value)  $default,){
final _that = this;
switch (_that) {
case _EmbeddingResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbeddingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EmbeddingResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String object,  List<Embedding> data,  String model, @JsonKey(includeIfNull: false)  int? created,  EmbeddingUsage usage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbeddingResponse() when $default != null:
return $default(_that.id,_that.object,_that.data,_that.model,_that.created,_that.usage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String object,  List<Embedding> data,  String model, @JsonKey(includeIfNull: false)  int? created,  EmbeddingUsage usage)  $default,) {final _that = this;
switch (_that) {
case _EmbeddingResponse():
return $default(_that.id,_that.object,_that.data,_that.model,_that.created,_that.usage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String object,  List<Embedding> data,  String model, @JsonKey(includeIfNull: false)  int? created,  EmbeddingUsage usage)?  $default,) {final _that = this;
switch (_that) {
case _EmbeddingResponse() when $default != null:
return $default(_that.id,_that.object,_that.data,_that.model,_that.created,_that.usage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmbeddingResponse extends EmbeddingResponse {
  const _EmbeddingResponse({required this.id, required this.object, required final  List<Embedding> data, required this.model, @JsonKey(includeIfNull: false) this.created, required this.usage}): _data = data,super._();
  factory _EmbeddingResponse.fromJson(Map<String, dynamic> json) => _$EmbeddingResponseFromJson(json);

/// The unique identifier for this embedding response.
@override final  String id;
/// The object type, which is always `list`.
@override final  String object;
/// The list of embeddings.
 final  List<Embedding> _data;
/// The list of embeddings.
@override List<Embedding> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

/// The model used for this embedding.
@override final  String model;
/// Unix timestamp when the response was created.
@override@JsonKey(includeIfNull: false) final  int? created;
/// The usage statistics for this embedding.
@override final  EmbeddingUsage usage;

/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddingResponseCopyWith<_EmbeddingResponse> get copyWith => __$EmbeddingResponseCopyWithImpl<_EmbeddingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.model, model) || other.model == model)&&(identical(other.created, created) || other.created == created)&&(identical(other.usage, usage) || other.usage == usage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,const DeepCollectionEquality().hash(_data),model,created,usage);

@override
String toString() {
  return 'EmbeddingResponse(id: $id, object: $object, data: $data, model: $model, created: $created, usage: $usage)';
}


}

/// @nodoc
abstract mixin class _$EmbeddingResponseCopyWith<$Res> implements $EmbeddingResponseCopyWith<$Res> {
  factory _$EmbeddingResponseCopyWith(_EmbeddingResponse value, $Res Function(_EmbeddingResponse) _then) = __$EmbeddingResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String object, List<Embedding> data, String model,@JsonKey(includeIfNull: false) int? created, EmbeddingUsage usage
});


@override $EmbeddingUsageCopyWith<$Res> get usage;

}
/// @nodoc
class __$EmbeddingResponseCopyWithImpl<$Res>
    implements _$EmbeddingResponseCopyWith<$Res> {
  __$EmbeddingResponseCopyWithImpl(this._self, this._then);

  final _EmbeddingResponse _self;
  final $Res Function(_EmbeddingResponse) _then;

/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? object = null,Object? data = null,Object? model = null,Object? created = freezed,Object? usage = null,}) {
  return _then(_EmbeddingResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Embedding>,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int?,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as EmbeddingUsage,
  ));
}

/// Create a copy of EmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddingUsageCopyWith<$Res> get usage {
  
  return $EmbeddingUsageCopyWith<$Res>(_self.usage, (value) {
    return _then(_self.copyWith(usage: value));
  });
}
}


/// @nodoc
mixin _$EmbeddingUsage {

/// The number of tokens in the prompt.
@JsonKey(name: 'prompt_tokens') int get promptTokens;/// The number of completion tokens (typically 0 for embeddings).
@JsonKey(name: 'completion_tokens') int get completionTokens;/// The total number of tokens.
@JsonKey(name: 'total_tokens') int get totalTokens;/// Duration of audio input in seconds (if applicable).
@JsonKey(name: 'prompt_audio_seconds', includeIfNull: false) int? get promptAudioSeconds;
/// Create a copy of EmbeddingUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingUsageCopyWith<EmbeddingUsage> get copyWith => _$EmbeddingUsageCopyWithImpl<EmbeddingUsage>(this as EmbeddingUsage, _$identity);

  /// Serializes this EmbeddingUsage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddingUsage&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.promptAudioSeconds, promptAudioSeconds) || other.promptAudioSeconds == promptAudioSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens,promptAudioSeconds);

@override
String toString() {
  return 'EmbeddingUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens, promptAudioSeconds: $promptAudioSeconds)';
}


}

/// @nodoc
abstract mixin class $EmbeddingUsageCopyWith<$Res>  {
  factory $EmbeddingUsageCopyWith(EmbeddingUsage value, $Res Function(EmbeddingUsage) _then) = _$EmbeddingUsageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens,@JsonKey(name: 'prompt_audio_seconds', includeIfNull: false) int? promptAudioSeconds
});




}
/// @nodoc
class _$EmbeddingUsageCopyWithImpl<$Res>
    implements $EmbeddingUsageCopyWith<$Res> {
  _$EmbeddingUsageCopyWithImpl(this._self, this._then);

  final EmbeddingUsage _self;
  final $Res Function(EmbeddingUsage) _then;

/// Create a copy of EmbeddingUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,Object? promptAudioSeconds = freezed,}) {
  return _then(_self.copyWith(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,promptAudioSeconds: freezed == promptAudioSeconds ? _self.promptAudioSeconds : promptAudioSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmbeddingUsage].
extension EmbeddingUsagePatterns on EmbeddingUsage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbeddingUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbeddingUsage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbeddingUsage value)  $default,){
final _that = this;
switch (_that) {
case _EmbeddingUsage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbeddingUsage value)?  $default,){
final _that = this;
switch (_that) {
case _EmbeddingUsage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'prompt_audio_seconds', includeIfNull: false)  int? promptAudioSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbeddingUsage() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.promptAudioSeconds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'prompt_audio_seconds', includeIfNull: false)  int? promptAudioSeconds)  $default,) {final _that = this;
switch (_that) {
case _EmbeddingUsage():
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.promptAudioSeconds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'prompt_audio_seconds', includeIfNull: false)  int? promptAudioSeconds)?  $default,) {final _that = this;
switch (_that) {
case _EmbeddingUsage() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.promptAudioSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmbeddingUsage extends EmbeddingUsage {
  const _EmbeddingUsage({@JsonKey(name: 'prompt_tokens') required this.promptTokens, @JsonKey(name: 'completion_tokens') required this.completionTokens, @JsonKey(name: 'total_tokens') required this.totalTokens, @JsonKey(name: 'prompt_audio_seconds', includeIfNull: false) this.promptAudioSeconds}): super._();
  factory _EmbeddingUsage.fromJson(Map<String, dynamic> json) => _$EmbeddingUsageFromJson(json);

/// The number of tokens in the prompt.
@override@JsonKey(name: 'prompt_tokens') final  int promptTokens;
/// The number of completion tokens (typically 0 for embeddings).
@override@JsonKey(name: 'completion_tokens') final  int completionTokens;
/// The total number of tokens.
@override@JsonKey(name: 'total_tokens') final  int totalTokens;
/// Duration of audio input in seconds (if applicable).
@override@JsonKey(name: 'prompt_audio_seconds', includeIfNull: false) final  int? promptAudioSeconds;

/// Create a copy of EmbeddingUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddingUsageCopyWith<_EmbeddingUsage> get copyWith => __$EmbeddingUsageCopyWithImpl<_EmbeddingUsage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingUsageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddingUsage&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.promptAudioSeconds, promptAudioSeconds) || other.promptAudioSeconds == promptAudioSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens,promptAudioSeconds);

@override
String toString() {
  return 'EmbeddingUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens, promptAudioSeconds: $promptAudioSeconds)';
}


}

/// @nodoc
abstract mixin class _$EmbeddingUsageCopyWith<$Res> implements $EmbeddingUsageCopyWith<$Res> {
  factory _$EmbeddingUsageCopyWith(_EmbeddingUsage value, $Res Function(_EmbeddingUsage) _then) = __$EmbeddingUsageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens,@JsonKey(name: 'prompt_audio_seconds', includeIfNull: false) int? promptAudioSeconds
});




}
/// @nodoc
class __$EmbeddingUsageCopyWithImpl<$Res>
    implements _$EmbeddingUsageCopyWith<$Res> {
  __$EmbeddingUsageCopyWithImpl(this._self, this._then);

  final _EmbeddingUsage _self;
  final $Res Function(_EmbeddingUsage) _then;

/// Create a copy of EmbeddingUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,Object? promptAudioSeconds = freezed,}) {
  return _then(_EmbeddingUsage(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,promptAudioSeconds: freezed == promptAudioSeconds ? _self.promptAudioSeconds : promptAudioSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Embedding {

/// The object type, which is always `embedding`.
 String get object;/// The embedding vector.
 List<double> get embedding;/// The index of this embedding.
 int get index;
/// Create a copy of Embedding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddingCopyWith<Embedding> get copyWith => _$EmbeddingCopyWithImpl<Embedding>(this as Embedding, _$identity);

  /// Serializes this Embedding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Embedding&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other.embedding, embedding)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object,const DeepCollectionEquality().hash(embedding),index);

@override
String toString() {
  return 'Embedding(object: $object, embedding: $embedding, index: $index)';
}


}

/// @nodoc
abstract mixin class $EmbeddingCopyWith<$Res>  {
  factory $EmbeddingCopyWith(Embedding value, $Res Function(Embedding) _then) = _$EmbeddingCopyWithImpl;
@useResult
$Res call({
 String object, List<double> embedding, int index
});




}
/// @nodoc
class _$EmbeddingCopyWithImpl<$Res>
    implements $EmbeddingCopyWith<$Res> {
  _$EmbeddingCopyWithImpl(this._self, this._then);

  final Embedding _self;
  final $Res Function(Embedding) _then;

/// Create a copy of Embedding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? object = null,Object? embedding = null,Object? index = null,}) {
  return _then(_self.copyWith(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,embedding: null == embedding ? _self.embedding : embedding // ignore: cast_nullable_to_non_nullable
as List<double>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Embedding].
extension EmbeddingPatterns on Embedding {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Embedding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Embedding() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Embedding value)  $default,){
final _that = this;
switch (_that) {
case _Embedding():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Embedding value)?  $default,){
final _that = this;
switch (_that) {
case _Embedding() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String object,  List<double> embedding,  int index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Embedding() when $default != null:
return $default(_that.object,_that.embedding,_that.index);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String object,  List<double> embedding,  int index)  $default,) {final _that = this;
switch (_that) {
case _Embedding():
return $default(_that.object,_that.embedding,_that.index);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String object,  List<double> embedding,  int index)?  $default,) {final _that = this;
switch (_that) {
case _Embedding() when $default != null:
return $default(_that.object,_that.embedding,_that.index);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Embedding extends Embedding {
  const _Embedding({required this.object, required final  List<double> embedding, required this.index}): _embedding = embedding,super._();
  factory _Embedding.fromJson(Map<String, dynamic> json) => _$EmbeddingFromJson(json);

/// The object type, which is always `embedding`.
@override final  String object;
/// The embedding vector.
 final  List<double> _embedding;
/// The embedding vector.
@override List<double> get embedding {
  if (_embedding is EqualUnmodifiableListView) return _embedding;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_embedding);
}

/// The index of this embedding.
@override final  int index;

/// Create a copy of Embedding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddingCopyWith<_Embedding> get copyWith => __$EmbeddingCopyWithImpl<_Embedding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Embedding&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other._embedding, _embedding)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object,const DeepCollectionEquality().hash(_embedding),index);

@override
String toString() {
  return 'Embedding(object: $object, embedding: $embedding, index: $index)';
}


}

/// @nodoc
abstract mixin class _$EmbeddingCopyWith<$Res> implements $EmbeddingCopyWith<$Res> {
  factory _$EmbeddingCopyWith(_Embedding value, $Res Function(_Embedding) _then) = __$EmbeddingCopyWithImpl;
@override @useResult
$Res call({
 String object, List<double> embedding, int index
});




}
/// @nodoc
class __$EmbeddingCopyWithImpl<$Res>
    implements _$EmbeddingCopyWith<$Res> {
  __$EmbeddingCopyWithImpl(this._self, this._then);

  final _Embedding _self;
  final $Res Function(_Embedding) _then;

/// Create a copy of Embedding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? object = null,Object? embedding = null,Object? index = null,}) {
  return _then(_Embedding(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,embedding: null == embedding ? _self._embedding : embedding // ignore: cast_nullable_to_non_nullable
as List<double>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ModelList {

/// The object type, which is always `list`.
 String get object;/// The list of models.
 List<Model> get data;
/// Create a copy of ModelList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelListCopyWith<ModelList> get copyWith => _$ModelListCopyWithImpl<ModelList>(this as ModelList, _$identity);

  /// Serializes this ModelList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelList&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ModelList(object: $object, data: $data)';
}


}

/// @nodoc
abstract mixin class $ModelListCopyWith<$Res>  {
  factory $ModelListCopyWith(ModelList value, $Res Function(ModelList) _then) = _$ModelListCopyWithImpl;
@useResult
$Res call({
 String object, List<Model> data
});




}
/// @nodoc
class _$ModelListCopyWithImpl<$Res>
    implements $ModelListCopyWith<$Res> {
  _$ModelListCopyWithImpl(this._self, this._then);

  final ModelList _self;
  final $Res Function(ModelList) _then;

/// Create a copy of ModelList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? object = null,Object? data = null,}) {
  return _then(_self.copyWith(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Model>,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelList].
extension ModelListPatterns on ModelList {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelList() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelList value)  $default,){
final _that = this;
switch (_that) {
case _ModelList():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelList value)?  $default,){
final _that = this;
switch (_that) {
case _ModelList() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String object,  List<Model> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelList() when $default != null:
return $default(_that.object,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String object,  List<Model> data)  $default,) {final _that = this;
switch (_that) {
case _ModelList():
return $default(_that.object,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String object,  List<Model> data)?  $default,) {final _that = this;
switch (_that) {
case _ModelList() when $default != null:
return $default(_that.object,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelList extends ModelList {
  const _ModelList({required this.object, required final  List<Model> data}): _data = data,super._();
  factory _ModelList.fromJson(Map<String, dynamic> json) => _$ModelListFromJson(json);

/// The object type, which is always `list`.
@override final  String object;
/// The list of models.
 final  List<Model> _data;
/// The list of models.
@override List<Model> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ModelList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelListCopyWith<_ModelList> get copyWith => __$ModelListCopyWithImpl<_ModelList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelList&&(identical(other.object, object) || other.object == object)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ModelList(object: $object, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ModelListCopyWith<$Res> implements $ModelListCopyWith<$Res> {
  factory _$ModelListCopyWith(_ModelList value, $Res Function(_ModelList) _then) = __$ModelListCopyWithImpl;
@override @useResult
$Res call({
 String object, List<Model> data
});




}
/// @nodoc
class __$ModelListCopyWithImpl<$Res>
    implements _$ModelListCopyWith<$Res> {
  __$ModelListCopyWithImpl(this._self, this._then);

  final _ModelList _self;
  final $Res Function(_ModelList) _then;

/// Create a copy of ModelList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? object = null,Object? data = null,}) {
  return _then(_ModelList(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Model>,
  ));
}


}


/// @nodoc
mixin _$Model {

/// The unique identifier for this model.
 String get id;/// The object type, which is always `model`.
 String get object;/// The timestamp of when this model was created.
 int get created;/// The organization who owns this model.
@JsonKey(name: 'owned_by') String get ownedBy;
/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelCopyWith<Model> get copyWith => _$ModelCopyWithImpl<Model>(this as Model, _$identity);

  /// Serializes this Model to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Model&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.ownedBy, ownedBy) || other.ownedBy == ownedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,ownedBy);

@override
String toString() {
  return 'Model(id: $id, object: $object, created: $created, ownedBy: $ownedBy)';
}


}

/// @nodoc
abstract mixin class $ModelCopyWith<$Res>  {
  factory $ModelCopyWith(Model value, $Res Function(Model) _then) = _$ModelCopyWithImpl;
@useResult
$Res call({
 String id, String object, int created,@JsonKey(name: 'owned_by') String ownedBy
});




}
/// @nodoc
class _$ModelCopyWithImpl<$Res>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._self, this._then);

  final Model _self;
  final $Res Function(Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? object = null,Object? created = null,Object? ownedBy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,ownedBy: null == ownedBy ? _self.ownedBy : ownedBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Model].
extension ModelPatterns on Model {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Model value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Model value)  $default,){
final _that = this;
switch (_that) {
case _Model():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Model value)?  $default,){
final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String object,  int created, @JsonKey(name: 'owned_by')  String ownedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.ownedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String object,  int created, @JsonKey(name: 'owned_by')  String ownedBy)  $default,) {final _that = this;
switch (_that) {
case _Model():
return $default(_that.id,_that.object,_that.created,_that.ownedBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String object,  int created, @JsonKey(name: 'owned_by')  String ownedBy)?  $default,) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.id,_that.object,_that.created,_that.ownedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Model extends Model {
  const _Model({required this.id, required this.object, required this.created, @JsonKey(name: 'owned_by') required this.ownedBy}): super._();
  factory _Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

/// The unique identifier for this model.
@override final  String id;
/// The object type, which is always `model`.
@override final  String object;
/// The timestamp of when this model was created.
@override final  int created;
/// The organization who owns this model.
@override@JsonKey(name: 'owned_by') final  String ownedBy;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelCopyWith<_Model> get copyWith => __$ModelCopyWithImpl<_Model>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Model&&(identical(other.id, id) || other.id == id)&&(identical(other.object, object) || other.object == object)&&(identical(other.created, created) || other.created == created)&&(identical(other.ownedBy, ownedBy) || other.ownedBy == ownedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,object,created,ownedBy);

@override
String toString() {
  return 'Model(id: $id, object: $object, created: $created, ownedBy: $ownedBy)';
}


}

/// @nodoc
abstract mixin class _$ModelCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$ModelCopyWith(_Model value, $Res Function(_Model) _then) = __$ModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String object, int created,@JsonKey(name: 'owned_by') String ownedBy
});




}
/// @nodoc
class __$ModelCopyWithImpl<$Res>
    implements _$ModelCopyWith<$Res> {
  __$ModelCopyWithImpl(this._self, this._then);

  final _Model _self;
  final $Res Function(_Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? object = null,Object? created = null,Object? ownedBy = null,}) {
  return _then(_Model(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,ownedBy: null == ownedBy ? _self.ownedBy : ownedBy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
