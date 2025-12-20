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
 List<ChatCompletionMessage> get messages;/// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
///
/// We generally recommend altering this or `top_p` but not both.
@JsonKey(includeIfNull: false) double? get temperature;/// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
///
/// We generally recommend altering this or `temperature` but not both.
@JsonKey(name: 'top_p', includeIfNull: false) double? get topP;/// The maximum number of tokens to generate in the completion.
///
/// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
@JsonKey(name: 'max_tokens', includeIfNull: false) int? get maxTokens;/// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
@JsonKey(includeIfNull: false) bool? get stream;/// Whether to inject a safety prompt before all conversations.
@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? get safePrompt;/// The seed to use for random sampling. If set, different calls will generate deterministic results.
@JsonKey(name: 'random_seed', includeIfNull: false) int? get randomSeed;
/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionRequestCopyWith<ChatCompletionRequest> get copyWith => _$ChatCompletionRequestCopyWithImpl<ChatCompletionRequest>(this as ChatCompletionRequest, _$identity);

  /// Serializes this ChatCompletionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.safePrompt, safePrompt) || other.safePrompt == safePrompt)&&(identical(other.randomSeed, randomSeed) || other.randomSeed == randomSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(messages),temperature,topP,maxTokens,stream,safePrompt,randomSeed);

@override
String toString() {
  return 'ChatCompletionRequest(model: $model, messages: $messages, temperature: $temperature, topP: $topP, maxTokens: $maxTokens, stream: $stream, safePrompt: $safePrompt, randomSeed: $randomSeed)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionRequestCopyWith<$Res>  {
  factory $ChatCompletionRequestCopyWith(ChatCompletionRequest value, $Res Function(ChatCompletionRequest) _then) = _$ChatCompletionRequestCopyWithImpl;
@useResult
$Res call({
@_ChatCompletionModelConverter() ChatCompletionModel model, List<ChatCompletionMessage> messages,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,@JsonKey(includeIfNull: false) bool? stream,@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,@JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed
});


$ChatCompletionModelCopyWith<$Res> get model;

}
/// @nodoc
class _$ChatCompletionRequestCopyWithImpl<$Res>
    implements $ChatCompletionRequestCopyWith<$Res> {
  _$ChatCompletionRequestCopyWithImpl(this._self, this._then);

  final ChatCompletionRequest _self;
  final $Res Function(ChatCompletionRequest) _then;

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,Object? temperature = freezed,Object? topP = freezed,Object? maxTokens = freezed,Object? stream = freezed,Object? safePrompt = freezed,Object? randomSeed = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ChatCompletionModel,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionMessage>,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,maxTokens: freezed == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,safePrompt: freezed == safePrompt ? _self.safePrompt : safePrompt // ignore: cast_nullable_to_non_nullable
as bool?,randomSeed: freezed == randomSeed ? _self.randomSeed : randomSeed // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.safePrompt,_that.randomSeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionRequest():
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.safePrompt,_that.randomSeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@_ChatCompletionModelConverter()  ChatCompletionModel model,  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'max_tokens', includeIfNull: false)  int? maxTokens, @JsonKey(includeIfNull: false)  bool? stream, @JsonKey(name: 'safe_prompt', includeIfNull: false)  bool? safePrompt, @JsonKey(name: 'random_seed', includeIfNull: false)  int? randomSeed)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.temperature,_that.topP,_that.maxTokens,_that.stream,_that.safePrompt,_that.randomSeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionRequest extends ChatCompletionRequest {
  const _ChatCompletionRequest({@_ChatCompletionModelConverter() required this.model, required final  List<ChatCompletionMessage> messages, @JsonKey(includeIfNull: false) this.temperature = 0.7, @JsonKey(name: 'top_p', includeIfNull: false) this.topP = 1.0, @JsonKey(name: 'max_tokens', includeIfNull: false) this.maxTokens, @JsonKey(includeIfNull: false) this.stream = false, @JsonKey(name: 'safe_prompt', includeIfNull: false) this.safePrompt = false, @JsonKey(name: 'random_seed', includeIfNull: false) this.randomSeed}): _messages = messages,super._();
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

/// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
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
/// Whether to inject a safety prompt before all conversations.
@override@JsonKey(name: 'safe_prompt', includeIfNull: false) final  bool? safePrompt;
/// The seed to use for random sampling. If set, different calls will generate deterministic results.
@override@JsonKey(name: 'random_seed', includeIfNull: false) final  int? randomSeed;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.maxTokens, maxTokens) || other.maxTokens == maxTokens)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.safePrompt, safePrompt) || other.safePrompt == safePrompt)&&(identical(other.randomSeed, randomSeed) || other.randomSeed == randomSeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_messages),temperature,topP,maxTokens,stream,safePrompt,randomSeed);

@override
String toString() {
  return 'ChatCompletionRequest(model: $model, messages: $messages, temperature: $temperature, topP: $topP, maxTokens: $maxTokens, stream: $stream, safePrompt: $safePrompt, randomSeed: $randomSeed)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionRequestCopyWith<$Res> implements $ChatCompletionRequestCopyWith<$Res> {
  factory _$ChatCompletionRequestCopyWith(_ChatCompletionRequest value, $Res Function(_ChatCompletionRequest) _then) = __$ChatCompletionRequestCopyWithImpl;
@override @useResult
$Res call({
@_ChatCompletionModelConverter() ChatCompletionModel model, List<ChatCompletionMessage> messages,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,@JsonKey(includeIfNull: false) bool? stream,@JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,@JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed
});


@override $ChatCompletionModelCopyWith<$Res> get model;

}
/// @nodoc
class __$ChatCompletionRequestCopyWithImpl<$Res>
    implements _$ChatCompletionRequestCopyWith<$Res> {
  __$ChatCompletionRequestCopyWithImpl(this._self, this._then);

  final _ChatCompletionRequest _self;
  final $Res Function(_ChatCompletionRequest) _then;

/// Create a copy of ChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,Object? temperature = freezed,Object? topP = freezed,Object? maxTokens = freezed,Object? stream = freezed,Object? safePrompt = freezed,Object? randomSeed = freezed,}) {
  return _then(_ChatCompletionRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ChatCompletionModel,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatCompletionMessage>,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,maxTokens: freezed == maxTokens ? _self.maxTokens : maxTokens // ignore: cast_nullable_to_non_nullable
as int?,stream: freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool?,safePrompt: freezed == safePrompt ? _self.safePrompt : safePrompt // ignore: cast_nullable_to_non_nullable
as bool?,randomSeed: freezed == randomSeed ? _self.randomSeed : randomSeed // ignore: cast_nullable_to_non_nullable
as int?,
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
 int get index;/// A message in a chat conversation.
@JsonKey(includeIfNull: false) ChatCompletionMessage? get message;/// The reason the model stopped generating tokens.
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
 int index,@JsonKey(includeIfNull: false) ChatCompletionMessage? message,@JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason
});


$ChatCompletionMessageCopyWith<$Res>? get message;

}
/// @nodoc
class _$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res>
    implements $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  _$ChatCompletionResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final ChatCompletionResponseChoicesInner _self;
  final $Res Function(ChatCompletionResponseChoicesInner) _then;

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? message = freezed,Object? finishReason = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessage?,finishReason: null == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason,
  ));
}
/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionMessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $ChatCompletionMessageCopyWith<$Res>(_self.message!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index, @JsonKey(includeIfNull: false)  ChatCompletionMessage? message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index, @JsonKey(includeIfNull: false)  ChatCompletionMessage? message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index, @JsonKey(includeIfNull: false)  ChatCompletionMessage? message, @JsonKey(name: 'finish_reason')  ChatCompletionFinishReason finishReason)?  $default,) {final _that = this;
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
  const _ChatCompletionResponseChoicesInner({required this.index, @JsonKey(includeIfNull: false) this.message, @JsonKey(name: 'finish_reason') required this.finishReason}): super._();
  factory _ChatCompletionResponseChoicesInner.fromJson(Map<String, dynamic> json) => _$ChatCompletionResponseChoicesInnerFromJson(json);

/// The index of this choice.
@override final  int index;
/// A message in a chat conversation.
@override@JsonKey(includeIfNull: false) final  ChatCompletionMessage? message;
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
 int index,@JsonKey(includeIfNull: false) ChatCompletionMessage? message,@JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason
});


@override $ChatCompletionMessageCopyWith<$Res>? get message;

}
/// @nodoc
class __$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res>
    implements _$ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  __$ChatCompletionResponseChoicesInnerCopyWithImpl(this._self, this._then);

  final _ChatCompletionResponseChoicesInner _self;
  final $Res Function(_ChatCompletionResponseChoicesInner) _then;

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? message = freezed,Object? finishReason = null,}) {
  return _then(_ChatCompletionResponseChoicesInner(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessage?,finishReason: null == finishReason ? _self.finishReason : finishReason // ignore: cast_nullable_to_non_nullable
as ChatCompletionFinishReason,
  ));
}

/// Create a copy of ChatCompletionResponseChoicesInner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCompletionMessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $ChatCompletionMessageCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$ChatCompletionMessage {

/// The role of the message.
 ChatCompletionMessageRole get role;/// The message content.
 String get content;
/// Create a copy of ChatCompletionMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionMessageCopyWith<ChatCompletionMessage> get copyWith => _$ChatCompletionMessageCopyWithImpl<ChatCompletionMessage>(this as ChatCompletionMessage, _$identity);

  /// Serializes this ChatCompletionMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'ChatCompletionMessage(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionMessageCopyWith<$Res>  {
  factory $ChatCompletionMessageCopyWith(ChatCompletionMessage value, $Res Function(ChatCompletionMessage) _then) = _$ChatCompletionMessageCopyWithImpl;
@useResult
$Res call({
 ChatCompletionMessageRole role, String content
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
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatCompletionMessageRole role,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatCompletionMessageRole role,  String content)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionMessage():
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatCompletionMessageRole role,  String content)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionMessage() when $default != null:
return $default(_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionMessage extends ChatCompletionMessage {
  const _ChatCompletionMessage({required this.role, required this.content}): super._();
  factory _ChatCompletionMessage.fromJson(Map<String, dynamic> json) => _$ChatCompletionMessageFromJson(json);

/// The role of the message.
@override final  ChatCompletionMessageRole role;
/// The message content.
@override final  String content;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'ChatCompletionMessage(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionMessageCopyWith<$Res> implements $ChatCompletionMessageCopyWith<$Res> {
  factory _$ChatCompletionMessageCopyWith(_ChatCompletionMessage value, $Res Function(_ChatCompletionMessage) _then) = __$ChatCompletionMessageCopyWithImpl;
@override @useResult
$Res call({
 ChatCompletionMessageRole role, String content
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
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(_ChatCompletionMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
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
@JsonKey(includeIfNull: false) String? get content;
/// Create a copy of ChatCompletionStreamDelta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionStreamDeltaCopyWith<ChatCompletionStreamDelta> get copyWith => _$ChatCompletionStreamDeltaCopyWithImpl<ChatCompletionStreamDelta>(this as ChatCompletionStreamDelta, _$identity);

  /// Serializes this ChatCompletionStreamDelta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionStreamDelta&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'ChatCompletionStreamDelta(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $ChatCompletionStreamDeltaCopyWith<$Res>  {
  factory $ChatCompletionStreamDeltaCopyWith(ChatCompletionStreamDelta value, $Res Function(ChatCompletionStreamDelta) _then) = _$ChatCompletionStreamDeltaCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionMessageRole? role,@JsonKey(includeIfNull: false) String? content
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
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta():
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ChatCompletionMessageRole? role, @JsonKey(includeIfNull: false)  String? content)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionStreamDelta() when $default != null:
return $default(_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionStreamDelta extends ChatCompletionStreamDelta {
  const _ChatCompletionStreamDelta({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.role, @JsonKey(includeIfNull: false) this.content}): super._();
  factory _ChatCompletionStreamDelta.fromJson(Map<String, dynamic> json) => _$ChatCompletionStreamDeltaFromJson(json);

/// The role of the message.
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ChatCompletionMessageRole? role;
/// The message content.
@override@JsonKey(includeIfNull: false) final  String? content;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionStreamDelta&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'ChatCompletionStreamDelta(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionStreamDeltaCopyWith<$Res> implements $ChatCompletionStreamDeltaCopyWith<$Res> {
  factory _$ChatCompletionStreamDeltaCopyWith(_ChatCompletionStreamDelta value, $Res Function(_ChatCompletionStreamDelta) _then) = __$ChatCompletionStreamDeltaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ChatCompletionMessageRole? role,@JsonKey(includeIfNull: false) String? content
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
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? content = freezed,}) {
  return _then(_ChatCompletionStreamDelta(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatCompletionMessageRole?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
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
