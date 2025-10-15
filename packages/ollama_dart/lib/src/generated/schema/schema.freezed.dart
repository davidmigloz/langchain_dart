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
mixin _$GenerateCompletionRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// The prompt to generate a response.
 String get prompt;/// The text that comes after the inserted text.
@JsonKey(includeIfNull: false) String? get suffix;/// The system prompt to (overrides what is defined in the Modelfile).
@JsonKey(includeIfNull: false) String? get system;/// The full prompt or prompt template (overrides what is defined in the Modelfile).
@JsonKey(includeIfNull: false) String? get template;/// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
@JsonKey(includeIfNull: false) List<int>? get context;/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
 bool get stream;/// If `true` no formatting will be applied to the prompt and no context will be returned.
///
/// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
@JsonKey(includeIfNull: false) bool? get raw;/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestFormat? get format;/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@JsonKey(name: 'keep_alive', includeIfNull: false) int? get keepAlive;/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
@JsonKey(includeIfNull: false) List<String>? get images;/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@JsonKey(includeIfNull: false) RequestOptions? get options;/// Controls whether thinking/reasoning models will think before responding.
/// Can be:
/// - boolean: true/false to enable/disable thinking
/// - string: "high", "medium", "low" to set thinking intensity level
@_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestThink? get think;/// Truncates the end of the prompt if it exceeds the context length
@JsonKey(includeIfNull: false) bool? get truncate;/// Shifts the oldest parts out of the context window when the context limit is reached
@JsonKey(includeIfNull: false) bool? get shift;
/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionRequestCopyWith<GenerateCompletionRequest> get copyWith => _$GenerateCompletionRequestCopyWithImpl<GenerateCompletionRequest>(this as GenerateCompletionRequest, _$identity);

  /// Serializes this GenerateCompletionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.system, system) || other.system == system)&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other.context, context)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.format, format) || other.format == format)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.options, options) || other.options == options)&&(identical(other.think, think) || other.think == think)&&(identical(other.truncate, truncate) || other.truncate == truncate)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,suffix,system,template,const DeepCollectionEquality().hash(context),stream,raw,format,keepAlive,const DeepCollectionEquality().hash(images),options,think,truncate,shift);

@override
String toString() {
  return 'GenerateCompletionRequest(model: $model, prompt: $prompt, suffix: $suffix, system: $system, template: $template, context: $context, stream: $stream, raw: $raw, format: $format, keepAlive: $keepAlive, images: $images, options: $options, think: $think, truncate: $truncate, shift: $shift)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionRequestCopyWith<$Res>  {
  factory $GenerateCompletionRequestCopyWith(GenerateCompletionRequest value, $Res Function(GenerateCompletionRequest) _then) = _$GenerateCompletionRequestCopyWithImpl;
@useResult
$Res call({
 String model, String prompt,@JsonKey(includeIfNull: false) String? suffix,@JsonKey(includeIfNull: false) String? system,@JsonKey(includeIfNull: false) String? template,@JsonKey(includeIfNull: false) List<int>? context, bool stream,@JsonKey(includeIfNull: false) bool? raw,@_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestFormat? format,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(includeIfNull: false) RequestOptions? options,@_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestThink? think,@JsonKey(includeIfNull: false) bool? truncate,@JsonKey(includeIfNull: false) bool? shift
});


$GenerateCompletionRequestFormatCopyWith<$Res>? get format;$RequestOptionsCopyWith<$Res>? get options;$GenerateCompletionRequestThinkCopyWith<$Res>? get think;

}
/// @nodoc
class _$GenerateCompletionRequestCopyWithImpl<$Res>
    implements $GenerateCompletionRequestCopyWith<$Res> {
  _$GenerateCompletionRequestCopyWithImpl(this._self, this._then);

  final GenerateCompletionRequest _self;
  final $Res Function(GenerateCompletionRequest) _then;

/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? prompt = null,Object? suffix = freezed,Object? system = freezed,Object? template = freezed,Object? context = freezed,Object? stream = null,Object? raw = freezed,Object? format = freezed,Object? keepAlive = freezed,Object? images = freezed,Object? options = freezed,Object? think = freezed,Object? truncate = freezed,Object? shift = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as List<int>?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,raw: freezed == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as bool?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestFormat?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,think: freezed == think ? _self.think : think // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestThink?,truncate: freezed == truncate ? _self.truncate : truncate // ignore: cast_nullable_to_non_nullable
as bool?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateCompletionRequestFormatCopyWith<$Res>? get format {
    if (_self.format == null) {
    return null;
  }

  return $GenerateCompletionRequestFormatCopyWith<$Res>(_self.format!, (value) {
    return _then(_self.copyWith(format: value));
  });
}/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateCompletionRequestThinkCopyWith<$Res>? get think {
    if (_self.think == null) {
    return null;
  }

  return $GenerateCompletionRequestThinkCopyWith<$Res>(_self.think!, (value) {
    return _then(_self.copyWith(think: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenerateCompletionRequest].
extension GenerateCompletionRequestPatterns on GenerateCompletionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateCompletionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateCompletionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateCompletionRequest value)  $default,){
final _that = this;
switch (_that) {
case _GenerateCompletionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateCompletionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateCompletionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  String prompt, @JsonKey(includeIfNull: false)  String? suffix, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  List<int>? context,  bool stream, @JsonKey(includeIfNull: false)  bool? raw, @_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateCompletionRequest() when $default != null:
return $default(_that.model,_that.prompt,_that.suffix,_that.system,_that.template,_that.context,_that.stream,_that.raw,_that.format,_that.keepAlive,_that.images,_that.options,_that.think,_that.truncate,_that.shift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  String prompt, @JsonKey(includeIfNull: false)  String? suffix, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  List<int>? context,  bool stream, @JsonKey(includeIfNull: false)  bool? raw, @_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)  $default,) {final _that = this;
switch (_that) {
case _GenerateCompletionRequest():
return $default(_that.model,_that.prompt,_that.suffix,_that.system,_that.template,_that.context,_that.stream,_that.raw,_that.format,_that.keepAlive,_that.images,_that.options,_that.think,_that.truncate,_that.shift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  String prompt, @JsonKey(includeIfNull: false)  String? suffix, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  List<int>? context,  bool stream, @JsonKey(includeIfNull: false)  bool? raw, @_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)?  $default,) {final _that = this;
switch (_that) {
case _GenerateCompletionRequest() when $default != null:
return $default(_that.model,_that.prompt,_that.suffix,_that.system,_that.template,_that.context,_that.stream,_that.raw,_that.format,_that.keepAlive,_that.images,_that.options,_that.think,_that.truncate,_that.shift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateCompletionRequest extends GenerateCompletionRequest {
  const _GenerateCompletionRequest({required this.model, required this.prompt, @JsonKey(includeIfNull: false) this.suffix, @JsonKey(includeIfNull: false) this.system, @JsonKey(includeIfNull: false) this.template, @JsonKey(includeIfNull: false) final  List<int>? context, this.stream = false, @JsonKey(includeIfNull: false) this.raw, @_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) this.format, @JsonKey(name: 'keep_alive', includeIfNull: false) this.keepAlive, @JsonKey(includeIfNull: false) final  List<String>? images, @JsonKey(includeIfNull: false) this.options, @_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) this.think, @JsonKey(includeIfNull: false) this.truncate, @JsonKey(includeIfNull: false) this.shift}): _context = context,_images = images,super._();
  factory _GenerateCompletionRequest.fromJson(Map<String, dynamic> json) => _$GenerateCompletionRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// The prompt to generate a response.
@override final  String prompt;
/// The text that comes after the inserted text.
@override@JsonKey(includeIfNull: false) final  String? suffix;
/// The system prompt to (overrides what is defined in the Modelfile).
@override@JsonKey(includeIfNull: false) final  String? system;
/// The full prompt or prompt template (overrides what is defined in the Modelfile).
@override@JsonKey(includeIfNull: false) final  String? template;
/// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
 final  List<int>? _context;
/// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
@override@JsonKey(includeIfNull: false) List<int>? get context {
  final value = _context;
  if (value == null) return null;
  if (_context is EqualUnmodifiableListView) return _context;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
@override@JsonKey() final  bool stream;
/// If `true` no formatting will be applied to the prompt and no context will be returned.
///
/// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
@override@JsonKey(includeIfNull: false) final  bool? raw;
/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@override@_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) final  GenerateCompletionRequestFormat? format;
/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@override@JsonKey(name: 'keep_alive', includeIfNull: false) final  int? keepAlive;
/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
 final  List<String>? _images;
/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
@override@JsonKey(includeIfNull: false) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@override@JsonKey(includeIfNull: false) final  RequestOptions? options;
/// Controls whether thinking/reasoning models will think before responding.
/// Can be:
/// - boolean: true/false to enable/disable thinking
/// - string: "high", "medium", "low" to set thinking intensity level
@override@_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) final  GenerateCompletionRequestThink? think;
/// Truncates the end of the prompt if it exceeds the context length
@override@JsonKey(includeIfNull: false) final  bool? truncate;
/// Shifts the oldest parts out of the context window when the context limit is reached
@override@JsonKey(includeIfNull: false) final  bool? shift;

/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateCompletionRequestCopyWith<_GenerateCompletionRequest> get copyWith => __$GenerateCompletionRequestCopyWithImpl<_GenerateCompletionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateCompletionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateCompletionRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.system, system) || other.system == system)&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other._context, _context)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.format, format) || other.format == format)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.options, options) || other.options == options)&&(identical(other.think, think) || other.think == think)&&(identical(other.truncate, truncate) || other.truncate == truncate)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,suffix,system,template,const DeepCollectionEquality().hash(_context),stream,raw,format,keepAlive,const DeepCollectionEquality().hash(_images),options,think,truncate,shift);

@override
String toString() {
  return 'GenerateCompletionRequest(model: $model, prompt: $prompt, suffix: $suffix, system: $system, template: $template, context: $context, stream: $stream, raw: $raw, format: $format, keepAlive: $keepAlive, images: $images, options: $options, think: $think, truncate: $truncate, shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$GenerateCompletionRequestCopyWith<$Res> implements $GenerateCompletionRequestCopyWith<$Res> {
  factory _$GenerateCompletionRequestCopyWith(_GenerateCompletionRequest value, $Res Function(_GenerateCompletionRequest) _then) = __$GenerateCompletionRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, String prompt,@JsonKey(includeIfNull: false) String? suffix,@JsonKey(includeIfNull: false) String? system,@JsonKey(includeIfNull: false) String? template,@JsonKey(includeIfNull: false) List<int>? context, bool stream,@JsonKey(includeIfNull: false) bool? raw,@_GenerateCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestFormat? format,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(includeIfNull: false) RequestOptions? options,@_GenerateCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateCompletionRequestThink? think,@JsonKey(includeIfNull: false) bool? truncate,@JsonKey(includeIfNull: false) bool? shift
});


@override $GenerateCompletionRequestFormatCopyWith<$Res>? get format;@override $RequestOptionsCopyWith<$Res>? get options;@override $GenerateCompletionRequestThinkCopyWith<$Res>? get think;

}
/// @nodoc
class __$GenerateCompletionRequestCopyWithImpl<$Res>
    implements _$GenerateCompletionRequestCopyWith<$Res> {
  __$GenerateCompletionRequestCopyWithImpl(this._self, this._then);

  final _GenerateCompletionRequest _self;
  final $Res Function(_GenerateCompletionRequest) _then;

/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? prompt = null,Object? suffix = freezed,Object? system = freezed,Object? template = freezed,Object? context = freezed,Object? stream = null,Object? raw = freezed,Object? format = freezed,Object? keepAlive = freezed,Object? images = freezed,Object? options = freezed,Object? think = freezed,Object? truncate = freezed,Object? shift = freezed,}) {
  return _then(_GenerateCompletionRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,context: freezed == context ? _self._context : context // ignore: cast_nullable_to_non_nullable
as List<int>?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,raw: freezed == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as bool?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestFormat?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,think: freezed == think ? _self.think : think // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestThink?,truncate: freezed == truncate ? _self.truncate : truncate // ignore: cast_nullable_to_non_nullable
as bool?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateCompletionRequestFormatCopyWith<$Res>? get format {
    if (_self.format == null) {
    return null;
  }

  return $GenerateCompletionRequestFormatCopyWith<$Res>(_self.format!, (value) {
    return _then(_self.copyWith(format: value));
  });
}/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of GenerateCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateCompletionRequestThinkCopyWith<$Res>? get think {
    if (_self.think == null) {
    return null;
  }

  return $GenerateCompletionRequestThinkCopyWith<$Res>(_self.think!, (value) {
    return _then(_self.copyWith(think: value));
  });
}
}

GenerateCompletionRequestFormat _$GenerateCompletionRequestFormatFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'enumeration':
          return GenerateCompletionRequestFormatEnumeration.fromJson(
            json
          );
                case 'mapStringDynamic':
          return GenerateCompletionRequestFormatMapStringDynamic.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GenerateCompletionRequestFormat',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GenerateCompletionRequestFormat {

 Object get value;

  /// Serializes this GenerateCompletionRequestFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequestFormat&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'GenerateCompletionRequestFormat(value: $value)';
}


}

/// @nodoc
class $GenerateCompletionRequestFormatCopyWith<$Res>  {
$GenerateCompletionRequestFormatCopyWith(GenerateCompletionRequestFormat _, $Res Function(GenerateCompletionRequestFormat) __);
}


/// Adds pattern-matching-related methods to [GenerateCompletionRequestFormat].
extension GenerateCompletionRequestFormatPatterns on GenerateCompletionRequestFormat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GenerateCompletionRequestFormatEnumeration value)?  enumeration,TResult Function( GenerateCompletionRequestFormatMapStringDynamic value)?  mapStringDynamic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that);case GenerateCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GenerateCompletionRequestFormatEnumeration value)  enumeration,required TResult Function( GenerateCompletionRequestFormatMapStringDynamic value)  mapStringDynamic,}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration():
return enumeration(_that);case GenerateCompletionRequestFormatMapStringDynamic():
return mapStringDynamic(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GenerateCompletionRequestFormatEnumeration value)?  enumeration,TResult? Function( GenerateCompletionRequestFormatMapStringDynamic value)?  mapStringDynamic,}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that);case GenerateCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GenerateCompletionRequestFormatEnum value)?  enumeration,TResult Function( Map<String, dynamic> value)?  mapStringDynamic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that.value);case GenerateCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GenerateCompletionRequestFormatEnum value)  enumeration,required TResult Function( Map<String, dynamic> value)  mapStringDynamic,}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration():
return enumeration(_that.value);case GenerateCompletionRequestFormatMapStringDynamic():
return mapStringDynamic(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GenerateCompletionRequestFormatEnum value)?  enumeration,TResult? Function( Map<String, dynamic> value)?  mapStringDynamic,}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that.value);case GenerateCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GenerateCompletionRequestFormatEnumeration extends GenerateCompletionRequestFormat {
  const GenerateCompletionRequestFormatEnumeration(this.value, {final  String? $type}): $type = $type ?? 'enumeration',super._();
  factory GenerateCompletionRequestFormatEnumeration.fromJson(Map<String, dynamic> json) => _$GenerateCompletionRequestFormatEnumerationFromJson(json);

@override final  GenerateCompletionRequestFormatEnum value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GenerateCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionRequestFormatEnumerationCopyWith<GenerateCompletionRequestFormatEnumeration> get copyWith => _$GenerateCompletionRequestFormatEnumerationCopyWithImpl<GenerateCompletionRequestFormatEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateCompletionRequestFormatEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequestFormatEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateCompletionRequestFormat.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionRequestFormatEnumerationCopyWith<$Res> implements $GenerateCompletionRequestFormatCopyWith<$Res> {
  factory $GenerateCompletionRequestFormatEnumerationCopyWith(GenerateCompletionRequestFormatEnumeration value, $Res Function(GenerateCompletionRequestFormatEnumeration) _then) = _$GenerateCompletionRequestFormatEnumerationCopyWithImpl;
@useResult
$Res call({
 GenerateCompletionRequestFormatEnum value
});




}
/// @nodoc
class _$GenerateCompletionRequestFormatEnumerationCopyWithImpl<$Res>
    implements $GenerateCompletionRequestFormatEnumerationCopyWith<$Res> {
  _$GenerateCompletionRequestFormatEnumerationCopyWithImpl(this._self, this._then);

  final GenerateCompletionRequestFormatEnumeration _self;
  final $Res Function(GenerateCompletionRequestFormatEnumeration) _then;

/// Create a copy of GenerateCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateCompletionRequestFormatEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestFormatEnum,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GenerateCompletionRequestFormatMapStringDynamic extends GenerateCompletionRequestFormat {
  const GenerateCompletionRequestFormatMapStringDynamic(final  Map<String, dynamic> value, {final  String? $type}): _value = value,$type = $type ?? 'mapStringDynamic',super._();
  factory GenerateCompletionRequestFormatMapStringDynamic.fromJson(Map<String, dynamic> json) => _$GenerateCompletionRequestFormatMapStringDynamicFromJson(json);

 final  Map<String, dynamic> _value;
@override Map<String, dynamic> get value {
  if (_value is EqualUnmodifiableMapView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GenerateCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionRequestFormatMapStringDynamicCopyWith<GenerateCompletionRequestFormatMapStringDynamic> get copyWith => _$GenerateCompletionRequestFormatMapStringDynamicCopyWithImpl<GenerateCompletionRequestFormatMapStringDynamic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateCompletionRequestFormatMapStringDynamicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequestFormatMapStringDynamic&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'GenerateCompletionRequestFormat.mapStringDynamic(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionRequestFormatMapStringDynamicCopyWith<$Res> implements $GenerateCompletionRequestFormatCopyWith<$Res> {
  factory $GenerateCompletionRequestFormatMapStringDynamicCopyWith(GenerateCompletionRequestFormatMapStringDynamic value, $Res Function(GenerateCompletionRequestFormatMapStringDynamic) _then) = _$GenerateCompletionRequestFormatMapStringDynamicCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> value
});




}
/// @nodoc
class _$GenerateCompletionRequestFormatMapStringDynamicCopyWithImpl<$Res>
    implements $GenerateCompletionRequestFormatMapStringDynamicCopyWith<$Res> {
  _$GenerateCompletionRequestFormatMapStringDynamicCopyWithImpl(this._self, this._then);

  final GenerateCompletionRequestFormatMapStringDynamic _self;
  final $Res Function(GenerateCompletionRequestFormatMapStringDynamic) _then;

/// Create a copy of GenerateCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateCompletionRequestFormatMapStringDynamic(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

GenerateCompletionRequestThink _$GenerateCompletionRequestThinkFromJson(
  Map<String, dynamic> json
) {
    return GenerateCompletionRequestThinkEnumeration.fromJson(
      json
    );
}

/// @nodoc
mixin _$GenerateCompletionRequestThink {

 GenerateCompletionRequestThinkEnum get value;
/// Create a copy of GenerateCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionRequestThinkCopyWith<GenerateCompletionRequestThink> get copyWith => _$GenerateCompletionRequestThinkCopyWithImpl<GenerateCompletionRequestThink>(this as GenerateCompletionRequestThink, _$identity);

  /// Serializes this GenerateCompletionRequestThink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequestThink&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateCompletionRequestThink(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionRequestThinkCopyWith<$Res>  {
  factory $GenerateCompletionRequestThinkCopyWith(GenerateCompletionRequestThink value, $Res Function(GenerateCompletionRequestThink) _then) = _$GenerateCompletionRequestThinkCopyWithImpl;
@useResult
$Res call({
 GenerateCompletionRequestThinkEnum value
});




}
/// @nodoc
class _$GenerateCompletionRequestThinkCopyWithImpl<$Res>
    implements $GenerateCompletionRequestThinkCopyWith<$Res> {
  _$GenerateCompletionRequestThinkCopyWithImpl(this._self, this._then);

  final GenerateCompletionRequestThink _self;
  final $Res Function(GenerateCompletionRequestThink) _then;

/// Create a copy of GenerateCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestThinkEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateCompletionRequestThink].
extension GenerateCompletionRequestThinkPatterns on GenerateCompletionRequestThink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GenerateCompletionRequestThinkEnumeration value)?  enumeration,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GenerateCompletionRequestThinkEnumeration value)  enumeration,}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration():
return enumeration(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GenerateCompletionRequestThinkEnumeration value)?  enumeration,}){
final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GenerateCompletionRequestThinkEnum value)?  enumeration,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GenerateCompletionRequestThinkEnum value)  enumeration,}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration():
return enumeration(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GenerateCompletionRequestThinkEnum value)?  enumeration,}) {final _that = this;
switch (_that) {
case GenerateCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GenerateCompletionRequestThinkEnumeration extends GenerateCompletionRequestThink {
  const GenerateCompletionRequestThinkEnumeration(this.value): super._();
  factory GenerateCompletionRequestThinkEnumeration.fromJson(Map<String, dynamic> json) => _$GenerateCompletionRequestThinkEnumerationFromJson(json);

@override final  GenerateCompletionRequestThinkEnum value;

/// Create a copy of GenerateCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionRequestThinkEnumerationCopyWith<GenerateCompletionRequestThinkEnumeration> get copyWith => _$GenerateCompletionRequestThinkEnumerationCopyWithImpl<GenerateCompletionRequestThinkEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateCompletionRequestThinkEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionRequestThinkEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateCompletionRequestThink.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionRequestThinkEnumerationCopyWith<$Res> implements $GenerateCompletionRequestThinkCopyWith<$Res> {
  factory $GenerateCompletionRequestThinkEnumerationCopyWith(GenerateCompletionRequestThinkEnumeration value, $Res Function(GenerateCompletionRequestThinkEnumeration) _then) = _$GenerateCompletionRequestThinkEnumerationCopyWithImpl;
@override @useResult
$Res call({
 GenerateCompletionRequestThinkEnum value
});




}
/// @nodoc
class _$GenerateCompletionRequestThinkEnumerationCopyWithImpl<$Res>
    implements $GenerateCompletionRequestThinkEnumerationCopyWith<$Res> {
  _$GenerateCompletionRequestThinkEnumerationCopyWithImpl(this._self, this._then);

  final GenerateCompletionRequestThinkEnumeration _self;
  final $Res Function(GenerateCompletionRequestThinkEnumeration) _then;

/// Create a copy of GenerateCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateCompletionRequestThinkEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateCompletionRequestThinkEnum,
  ));
}


}


/// @nodoc
mixin _$RequestOptions {

/// Number of tokens to keep from the prompt.
@JsonKey(name: 'num_keep', includeIfNull: false) int? get numKeep;/// Sets the random number seed to use for generation. Setting this to a specific number will make the model
/// generate the same text for the same prompt. (Default: 0)
@JsonKey(includeIfNull: false) int? get seed;/// Maximum number of tokens to predict when generating text.
/// (Default: 128, -1 = infinite generation, -2 = fill context)
@JsonKey(name: 'num_predict', includeIfNull: false) int? get numPredict;/// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers,
/// while a lower value (e.g. 10) will be more conservative. (Default: 40)
@JsonKey(name: 'top_k', includeIfNull: false) int? get topK;/// Works together with top_k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value
/// (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
@JsonKey(name: 'top_p', includeIfNull: false) double? get topP;/// Alternative to the top_p, and aims to ensure a balance of quality and variety. min_p represents the minimum
/// probability for a token to be considered, relative to the probability of the most likely token. For
/// example, with min_p=0.05 and the most likely token having a probability of 0.9, logits with a value less
/// than 0.05*0.9=0.045 are filtered out. (Default: 0.0)
@JsonKey(name: 'min_p', includeIfNull: false) double? get minP;/// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value
/// (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
@JsonKey(name: 'tfs_z', includeIfNull: false) double? get tfsZ;/// Typical p is used to reduce the impact of less probable tokens from the output. (default: 1)
@JsonKey(name: 'typical_p', includeIfNull: false) double? get typicalP;/// Sets how far back for the model to look back to prevent repetition.
/// (Default: 64, 0 = disabled, -1 = num_ctx)
@JsonKey(name: 'repeat_last_n', includeIfNull: false) int? get repeatLastN;/// The temperature of the model. Increasing the temperature will make the model answer more creatively.
/// (Default: 0.8)
@JsonKey(includeIfNull: false) double? get temperature;/// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more
/// strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
@JsonKey(name: 'repeat_penalty', includeIfNull: false) double? get repeatPenalty;/// Positive values penalize new tokens based on whether they appear in the text so far, increasing the
/// model's likelihood to talk about new topics. (Default: 0)
@JsonKey(name: 'presence_penalty', includeIfNull: false) double? get presencePenalty;/// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the
/// model's likelihood to repeat the same line verbatim. (Default: 0)
@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? get frequencyPenalty;/// Enable Mirostat sampling for controlling perplexity.
/// (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
@JsonKey(includeIfNull: false) int? get mirostat;/// Controls the balance between coherence and diversity of the output. A lower value will result in more
/// focused and coherent text. (Default: 5.0)
@JsonKey(name: 'mirostat_tau', includeIfNull: false) double? get mirostatTau;/// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate
/// will result in slower adjustments, while a higher learning rate will make the algorithm more responsive.
/// (Default: 0.1)
@JsonKey(name: 'mirostat_eta', includeIfNull: false) double? get mirostatEta;/// Penalize newlines in the output. (Default: true)
@JsonKey(name: 'penalize_newline', includeIfNull: false) bool? get penalizeNewline;/// Sequences where the API will stop generating further tokens. The returned text will not contain the stop
/// sequence.
@JsonKey(includeIfNull: false) List<String>? get stop;/// Enable NUMA support. (Default: false)
@JsonKey(includeIfNull: false) bool? get numa;/// Sets the size of the context window used to generate the next token. (Default: 2048)
@JsonKey(name: 'num_ctx', includeIfNull: false) int? get numCtx;/// Sets the number of batches to use for generation. (Default: 512)
@JsonKey(name: 'num_batch', includeIfNull: false) int? get numBatch;/// The number of layers to send to the GPU(s).
/// On macOS it defaults to 1 to enable metal support, 0 to disable.
@JsonKey(name: 'num_gpu', includeIfNull: false) int? get numGpu;/// The GPU to use for the main model. Default is 0.
@JsonKey(name: 'main_gpu', includeIfNull: false) int? get mainGpu;/// Enable low VRAM mode. (Default: false)
@JsonKey(name: 'low_vram', includeIfNull: false) bool? get lowVram;/// Enable f16 key/value. (Default: true)
@JsonKey(name: 'f16_kv', includeIfNull: false) bool? get f16Kv;/// Enable logits all. (Default: false)
@JsonKey(name: 'logits_all', includeIfNull: false) bool? get logitsAll;/// Enable vocab only. (Default: false)
@JsonKey(name: 'vocab_only', includeIfNull: false) bool? get vocabOnly;/// Enable mmap. (Default: false)
@JsonKey(name: 'use_mmap', includeIfNull: false) bool? get useMmap;/// Enable mlock. (Default: false)
@JsonKey(name: 'use_mlock', includeIfNull: false) bool? get useMlock;/// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal
/// performance. It is recommended to set this value to the number of physical CPU cores your system has
/// (as opposed to the logical number of cores).
@JsonKey(name: 'num_thread', includeIfNull: false) int? get numThread;
/// Create a copy of RequestOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<RequestOptions> get copyWith => _$RequestOptionsCopyWithImpl<RequestOptions>(this as RequestOptions, _$identity);

  /// Serializes this RequestOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestOptions&&(identical(other.numKeep, numKeep) || other.numKeep == numKeep)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.numPredict, numPredict) || other.numPredict == numPredict)&&(identical(other.topK, topK) || other.topK == topK)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.minP, minP) || other.minP == minP)&&(identical(other.tfsZ, tfsZ) || other.tfsZ == tfsZ)&&(identical(other.typicalP, typicalP) || other.typicalP == typicalP)&&(identical(other.repeatLastN, repeatLastN) || other.repeatLastN == repeatLastN)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.repeatPenalty, repeatPenalty) || other.repeatPenalty == repeatPenalty)&&(identical(other.presencePenalty, presencePenalty) || other.presencePenalty == presencePenalty)&&(identical(other.frequencyPenalty, frequencyPenalty) || other.frequencyPenalty == frequencyPenalty)&&(identical(other.mirostat, mirostat) || other.mirostat == mirostat)&&(identical(other.mirostatTau, mirostatTau) || other.mirostatTau == mirostatTau)&&(identical(other.mirostatEta, mirostatEta) || other.mirostatEta == mirostatEta)&&(identical(other.penalizeNewline, penalizeNewline) || other.penalizeNewline == penalizeNewline)&&const DeepCollectionEquality().equals(other.stop, stop)&&(identical(other.numa, numa) || other.numa == numa)&&(identical(other.numCtx, numCtx) || other.numCtx == numCtx)&&(identical(other.numBatch, numBatch) || other.numBatch == numBatch)&&(identical(other.numGpu, numGpu) || other.numGpu == numGpu)&&(identical(other.mainGpu, mainGpu) || other.mainGpu == mainGpu)&&(identical(other.lowVram, lowVram) || other.lowVram == lowVram)&&(identical(other.f16Kv, f16Kv) || other.f16Kv == f16Kv)&&(identical(other.logitsAll, logitsAll) || other.logitsAll == logitsAll)&&(identical(other.vocabOnly, vocabOnly) || other.vocabOnly == vocabOnly)&&(identical(other.useMmap, useMmap) || other.useMmap == useMmap)&&(identical(other.useMlock, useMlock) || other.useMlock == useMlock)&&(identical(other.numThread, numThread) || other.numThread == numThread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,numKeep,seed,numPredict,topK,topP,minP,tfsZ,typicalP,repeatLastN,temperature,repeatPenalty,presencePenalty,frequencyPenalty,mirostat,mirostatTau,mirostatEta,penalizeNewline,const DeepCollectionEquality().hash(stop),numa,numCtx,numBatch,numGpu,mainGpu,lowVram,f16Kv,logitsAll,vocabOnly,useMmap,useMlock,numThread]);

@override
String toString() {
  return 'RequestOptions(numKeep: $numKeep, seed: $seed, numPredict: $numPredict, topK: $topK, topP: $topP, minP: $minP, tfsZ: $tfsZ, typicalP: $typicalP, repeatLastN: $repeatLastN, temperature: $temperature, repeatPenalty: $repeatPenalty, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, mirostat: $mirostat, mirostatTau: $mirostatTau, mirostatEta: $mirostatEta, penalizeNewline: $penalizeNewline, stop: $stop, numa: $numa, numCtx: $numCtx, numBatch: $numBatch, numGpu: $numGpu, mainGpu: $mainGpu, lowVram: $lowVram, f16Kv: $f16Kv, logitsAll: $logitsAll, vocabOnly: $vocabOnly, useMmap: $useMmap, useMlock: $useMlock, numThread: $numThread)';
}


}

/// @nodoc
abstract mixin class $RequestOptionsCopyWith<$Res>  {
  factory $RequestOptionsCopyWith(RequestOptions value, $Res Function(RequestOptions) _then) = _$RequestOptionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,@JsonKey(includeIfNull: false) int? seed,@JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,@JsonKey(name: 'top_k', includeIfNull: false) int? topK,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'min_p', includeIfNull: false) double? minP,@JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,@JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,@JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'repeat_penalty', includeIfNull: false) double? repeatPenalty,@JsonKey(name: 'presence_penalty', includeIfNull: false) double? presencePenalty,@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? frequencyPenalty,@JsonKey(includeIfNull: false) int? mirostat,@JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,@JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,@JsonKey(name: 'penalize_newline', includeIfNull: false) bool? penalizeNewline,@JsonKey(includeIfNull: false) List<String>? stop,@JsonKey(includeIfNull: false) bool? numa,@JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,@JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,@JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,@JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,@JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,@JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,@JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,@JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,@JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,@JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,@JsonKey(name: 'num_thread', includeIfNull: false) int? numThread
});




}
/// @nodoc
class _$RequestOptionsCopyWithImpl<$Res>
    implements $RequestOptionsCopyWith<$Res> {
  _$RequestOptionsCopyWithImpl(this._self, this._then);

  final RequestOptions _self;
  final $Res Function(RequestOptions) _then;

/// Create a copy of RequestOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numKeep = freezed,Object? seed = freezed,Object? numPredict = freezed,Object? topK = freezed,Object? topP = freezed,Object? minP = freezed,Object? tfsZ = freezed,Object? typicalP = freezed,Object? repeatLastN = freezed,Object? temperature = freezed,Object? repeatPenalty = freezed,Object? presencePenalty = freezed,Object? frequencyPenalty = freezed,Object? mirostat = freezed,Object? mirostatTau = freezed,Object? mirostatEta = freezed,Object? penalizeNewline = freezed,Object? stop = freezed,Object? numa = freezed,Object? numCtx = freezed,Object? numBatch = freezed,Object? numGpu = freezed,Object? mainGpu = freezed,Object? lowVram = freezed,Object? f16Kv = freezed,Object? logitsAll = freezed,Object? vocabOnly = freezed,Object? useMmap = freezed,Object? useMlock = freezed,Object? numThread = freezed,}) {
  return _then(_self.copyWith(
numKeep: freezed == numKeep ? _self.numKeep : numKeep // ignore: cast_nullable_to_non_nullable
as int?,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,numPredict: freezed == numPredict ? _self.numPredict : numPredict // ignore: cast_nullable_to_non_nullable
as int?,topK: freezed == topK ? _self.topK : topK // ignore: cast_nullable_to_non_nullable
as int?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,minP: freezed == minP ? _self.minP : minP // ignore: cast_nullable_to_non_nullable
as double?,tfsZ: freezed == tfsZ ? _self.tfsZ : tfsZ // ignore: cast_nullable_to_non_nullable
as double?,typicalP: freezed == typicalP ? _self.typicalP : typicalP // ignore: cast_nullable_to_non_nullable
as double?,repeatLastN: freezed == repeatLastN ? _self.repeatLastN : repeatLastN // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,repeatPenalty: freezed == repeatPenalty ? _self.repeatPenalty : repeatPenalty // ignore: cast_nullable_to_non_nullable
as double?,presencePenalty: freezed == presencePenalty ? _self.presencePenalty : presencePenalty // ignore: cast_nullable_to_non_nullable
as double?,frequencyPenalty: freezed == frequencyPenalty ? _self.frequencyPenalty : frequencyPenalty // ignore: cast_nullable_to_non_nullable
as double?,mirostat: freezed == mirostat ? _self.mirostat : mirostat // ignore: cast_nullable_to_non_nullable
as int?,mirostatTau: freezed == mirostatTau ? _self.mirostatTau : mirostatTau // ignore: cast_nullable_to_non_nullable
as double?,mirostatEta: freezed == mirostatEta ? _self.mirostatEta : mirostatEta // ignore: cast_nullable_to_non_nullable
as double?,penalizeNewline: freezed == penalizeNewline ? _self.penalizeNewline : penalizeNewline // ignore: cast_nullable_to_non_nullable
as bool?,stop: freezed == stop ? _self.stop : stop // ignore: cast_nullable_to_non_nullable
as List<String>?,numa: freezed == numa ? _self.numa : numa // ignore: cast_nullable_to_non_nullable
as bool?,numCtx: freezed == numCtx ? _self.numCtx : numCtx // ignore: cast_nullable_to_non_nullable
as int?,numBatch: freezed == numBatch ? _self.numBatch : numBatch // ignore: cast_nullable_to_non_nullable
as int?,numGpu: freezed == numGpu ? _self.numGpu : numGpu // ignore: cast_nullable_to_non_nullable
as int?,mainGpu: freezed == mainGpu ? _self.mainGpu : mainGpu // ignore: cast_nullable_to_non_nullable
as int?,lowVram: freezed == lowVram ? _self.lowVram : lowVram // ignore: cast_nullable_to_non_nullable
as bool?,f16Kv: freezed == f16Kv ? _self.f16Kv : f16Kv // ignore: cast_nullable_to_non_nullable
as bool?,logitsAll: freezed == logitsAll ? _self.logitsAll : logitsAll // ignore: cast_nullable_to_non_nullable
as bool?,vocabOnly: freezed == vocabOnly ? _self.vocabOnly : vocabOnly // ignore: cast_nullable_to_non_nullable
as bool?,useMmap: freezed == useMmap ? _self.useMmap : useMmap // ignore: cast_nullable_to_non_nullable
as bool?,useMlock: freezed == useMlock ? _self.useMlock : useMlock // ignore: cast_nullable_to_non_nullable
as bool?,numThread: freezed == numThread ? _self.numThread : numThread // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestOptions].
extension RequestOptionsPatterns on RequestOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestOptions value)  $default,){
final _that = this;
switch (_that) {
case _RequestOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestOptions value)?  $default,){
final _that = this;
switch (_that) {
case _RequestOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'num_keep', includeIfNull: false)  int? numKeep, @JsonKey(includeIfNull: false)  int? seed, @JsonKey(name: 'num_predict', includeIfNull: false)  int? numPredict, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'min_p', includeIfNull: false)  double? minP, @JsonKey(name: 'tfs_z', includeIfNull: false)  double? tfsZ, @JsonKey(name: 'typical_p', includeIfNull: false)  double? typicalP, @JsonKey(name: 'repeat_last_n', includeIfNull: false)  int? repeatLastN, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'repeat_penalty', includeIfNull: false)  double? repeatPenalty, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? mirostat, @JsonKey(name: 'mirostat_tau', includeIfNull: false)  double? mirostatTau, @JsonKey(name: 'mirostat_eta', includeIfNull: false)  double? mirostatEta, @JsonKey(name: 'penalize_newline', includeIfNull: false)  bool? penalizeNewline, @JsonKey(includeIfNull: false)  List<String>? stop, @JsonKey(includeIfNull: false)  bool? numa, @JsonKey(name: 'num_ctx', includeIfNull: false)  int? numCtx, @JsonKey(name: 'num_batch', includeIfNull: false)  int? numBatch, @JsonKey(name: 'num_gpu', includeIfNull: false)  int? numGpu, @JsonKey(name: 'main_gpu', includeIfNull: false)  int? mainGpu, @JsonKey(name: 'low_vram', includeIfNull: false)  bool? lowVram, @JsonKey(name: 'f16_kv', includeIfNull: false)  bool? f16Kv, @JsonKey(name: 'logits_all', includeIfNull: false)  bool? logitsAll, @JsonKey(name: 'vocab_only', includeIfNull: false)  bool? vocabOnly, @JsonKey(name: 'use_mmap', includeIfNull: false)  bool? useMmap, @JsonKey(name: 'use_mlock', includeIfNull: false)  bool? useMlock, @JsonKey(name: 'num_thread', includeIfNull: false)  int? numThread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestOptions() when $default != null:
return $default(_that.numKeep,_that.seed,_that.numPredict,_that.topK,_that.topP,_that.minP,_that.tfsZ,_that.typicalP,_that.repeatLastN,_that.temperature,_that.repeatPenalty,_that.presencePenalty,_that.frequencyPenalty,_that.mirostat,_that.mirostatTau,_that.mirostatEta,_that.penalizeNewline,_that.stop,_that.numa,_that.numCtx,_that.numBatch,_that.numGpu,_that.mainGpu,_that.lowVram,_that.f16Kv,_that.logitsAll,_that.vocabOnly,_that.useMmap,_that.useMlock,_that.numThread);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'num_keep', includeIfNull: false)  int? numKeep, @JsonKey(includeIfNull: false)  int? seed, @JsonKey(name: 'num_predict', includeIfNull: false)  int? numPredict, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'min_p', includeIfNull: false)  double? minP, @JsonKey(name: 'tfs_z', includeIfNull: false)  double? tfsZ, @JsonKey(name: 'typical_p', includeIfNull: false)  double? typicalP, @JsonKey(name: 'repeat_last_n', includeIfNull: false)  int? repeatLastN, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'repeat_penalty', includeIfNull: false)  double? repeatPenalty, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? mirostat, @JsonKey(name: 'mirostat_tau', includeIfNull: false)  double? mirostatTau, @JsonKey(name: 'mirostat_eta', includeIfNull: false)  double? mirostatEta, @JsonKey(name: 'penalize_newline', includeIfNull: false)  bool? penalizeNewline, @JsonKey(includeIfNull: false)  List<String>? stop, @JsonKey(includeIfNull: false)  bool? numa, @JsonKey(name: 'num_ctx', includeIfNull: false)  int? numCtx, @JsonKey(name: 'num_batch', includeIfNull: false)  int? numBatch, @JsonKey(name: 'num_gpu', includeIfNull: false)  int? numGpu, @JsonKey(name: 'main_gpu', includeIfNull: false)  int? mainGpu, @JsonKey(name: 'low_vram', includeIfNull: false)  bool? lowVram, @JsonKey(name: 'f16_kv', includeIfNull: false)  bool? f16Kv, @JsonKey(name: 'logits_all', includeIfNull: false)  bool? logitsAll, @JsonKey(name: 'vocab_only', includeIfNull: false)  bool? vocabOnly, @JsonKey(name: 'use_mmap', includeIfNull: false)  bool? useMmap, @JsonKey(name: 'use_mlock', includeIfNull: false)  bool? useMlock, @JsonKey(name: 'num_thread', includeIfNull: false)  int? numThread)  $default,) {final _that = this;
switch (_that) {
case _RequestOptions():
return $default(_that.numKeep,_that.seed,_that.numPredict,_that.topK,_that.topP,_that.minP,_that.tfsZ,_that.typicalP,_that.repeatLastN,_that.temperature,_that.repeatPenalty,_that.presencePenalty,_that.frequencyPenalty,_that.mirostat,_that.mirostatTau,_that.mirostatEta,_that.penalizeNewline,_that.stop,_that.numa,_that.numCtx,_that.numBatch,_that.numGpu,_that.mainGpu,_that.lowVram,_that.f16Kv,_that.logitsAll,_that.vocabOnly,_that.useMmap,_that.useMlock,_that.numThread);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'num_keep', includeIfNull: false)  int? numKeep, @JsonKey(includeIfNull: false)  int? seed, @JsonKey(name: 'num_predict', includeIfNull: false)  int? numPredict, @JsonKey(name: 'top_k', includeIfNull: false)  int? topK, @JsonKey(name: 'top_p', includeIfNull: false)  double? topP, @JsonKey(name: 'min_p', includeIfNull: false)  double? minP, @JsonKey(name: 'tfs_z', includeIfNull: false)  double? tfsZ, @JsonKey(name: 'typical_p', includeIfNull: false)  double? typicalP, @JsonKey(name: 'repeat_last_n', includeIfNull: false)  int? repeatLastN, @JsonKey(includeIfNull: false)  double? temperature, @JsonKey(name: 'repeat_penalty', includeIfNull: false)  double? repeatPenalty, @JsonKey(name: 'presence_penalty', includeIfNull: false)  double? presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false)  double? frequencyPenalty, @JsonKey(includeIfNull: false)  int? mirostat, @JsonKey(name: 'mirostat_tau', includeIfNull: false)  double? mirostatTau, @JsonKey(name: 'mirostat_eta', includeIfNull: false)  double? mirostatEta, @JsonKey(name: 'penalize_newline', includeIfNull: false)  bool? penalizeNewline, @JsonKey(includeIfNull: false)  List<String>? stop, @JsonKey(includeIfNull: false)  bool? numa, @JsonKey(name: 'num_ctx', includeIfNull: false)  int? numCtx, @JsonKey(name: 'num_batch', includeIfNull: false)  int? numBatch, @JsonKey(name: 'num_gpu', includeIfNull: false)  int? numGpu, @JsonKey(name: 'main_gpu', includeIfNull: false)  int? mainGpu, @JsonKey(name: 'low_vram', includeIfNull: false)  bool? lowVram, @JsonKey(name: 'f16_kv', includeIfNull: false)  bool? f16Kv, @JsonKey(name: 'logits_all', includeIfNull: false)  bool? logitsAll, @JsonKey(name: 'vocab_only', includeIfNull: false)  bool? vocabOnly, @JsonKey(name: 'use_mmap', includeIfNull: false)  bool? useMmap, @JsonKey(name: 'use_mlock', includeIfNull: false)  bool? useMlock, @JsonKey(name: 'num_thread', includeIfNull: false)  int? numThread)?  $default,) {final _that = this;
switch (_that) {
case _RequestOptions() when $default != null:
return $default(_that.numKeep,_that.seed,_that.numPredict,_that.topK,_that.topP,_that.minP,_that.tfsZ,_that.typicalP,_that.repeatLastN,_that.temperature,_that.repeatPenalty,_that.presencePenalty,_that.frequencyPenalty,_that.mirostat,_that.mirostatTau,_that.mirostatEta,_that.penalizeNewline,_that.stop,_that.numa,_that.numCtx,_that.numBatch,_that.numGpu,_that.mainGpu,_that.lowVram,_that.f16Kv,_that.logitsAll,_that.vocabOnly,_that.useMmap,_that.useMlock,_that.numThread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestOptions extends RequestOptions {
  const _RequestOptions({@JsonKey(name: 'num_keep', includeIfNull: false) this.numKeep, @JsonKey(includeIfNull: false) this.seed, @JsonKey(name: 'num_predict', includeIfNull: false) this.numPredict, @JsonKey(name: 'top_k', includeIfNull: false) this.topK, @JsonKey(name: 'top_p', includeIfNull: false) this.topP, @JsonKey(name: 'min_p', includeIfNull: false) this.minP, @JsonKey(name: 'tfs_z', includeIfNull: false) this.tfsZ, @JsonKey(name: 'typical_p', includeIfNull: false) this.typicalP, @JsonKey(name: 'repeat_last_n', includeIfNull: false) this.repeatLastN, @JsonKey(includeIfNull: false) this.temperature, @JsonKey(name: 'repeat_penalty', includeIfNull: false) this.repeatPenalty, @JsonKey(name: 'presence_penalty', includeIfNull: false) this.presencePenalty, @JsonKey(name: 'frequency_penalty', includeIfNull: false) this.frequencyPenalty, @JsonKey(includeIfNull: false) this.mirostat, @JsonKey(name: 'mirostat_tau', includeIfNull: false) this.mirostatTau, @JsonKey(name: 'mirostat_eta', includeIfNull: false) this.mirostatEta, @JsonKey(name: 'penalize_newline', includeIfNull: false) this.penalizeNewline, @JsonKey(includeIfNull: false) final  List<String>? stop, @JsonKey(includeIfNull: false) this.numa, @JsonKey(name: 'num_ctx', includeIfNull: false) this.numCtx, @JsonKey(name: 'num_batch', includeIfNull: false) this.numBatch, @JsonKey(name: 'num_gpu', includeIfNull: false) this.numGpu, @JsonKey(name: 'main_gpu', includeIfNull: false) this.mainGpu, @JsonKey(name: 'low_vram', includeIfNull: false) this.lowVram, @JsonKey(name: 'f16_kv', includeIfNull: false) this.f16Kv, @JsonKey(name: 'logits_all', includeIfNull: false) this.logitsAll, @JsonKey(name: 'vocab_only', includeIfNull: false) this.vocabOnly, @JsonKey(name: 'use_mmap', includeIfNull: false) this.useMmap, @JsonKey(name: 'use_mlock', includeIfNull: false) this.useMlock, @JsonKey(name: 'num_thread', includeIfNull: false) this.numThread}): _stop = stop,super._();
  factory _RequestOptions.fromJson(Map<String, dynamic> json) => _$RequestOptionsFromJson(json);

/// Number of tokens to keep from the prompt.
@override@JsonKey(name: 'num_keep', includeIfNull: false) final  int? numKeep;
/// Sets the random number seed to use for generation. Setting this to a specific number will make the model
/// generate the same text for the same prompt. (Default: 0)
@override@JsonKey(includeIfNull: false) final  int? seed;
/// Maximum number of tokens to predict when generating text.
/// (Default: 128, -1 = infinite generation, -2 = fill context)
@override@JsonKey(name: 'num_predict', includeIfNull: false) final  int? numPredict;
/// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers,
/// while a lower value (e.g. 10) will be more conservative. (Default: 40)
@override@JsonKey(name: 'top_k', includeIfNull: false) final  int? topK;
/// Works together with top_k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value
/// (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
@override@JsonKey(name: 'top_p', includeIfNull: false) final  double? topP;
/// Alternative to the top_p, and aims to ensure a balance of quality and variety. min_p represents the minimum
/// probability for a token to be considered, relative to the probability of the most likely token. For
/// example, with min_p=0.05 and the most likely token having a probability of 0.9, logits with a value less
/// than 0.05*0.9=0.045 are filtered out. (Default: 0.0)
@override@JsonKey(name: 'min_p', includeIfNull: false) final  double? minP;
/// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value
/// (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
@override@JsonKey(name: 'tfs_z', includeIfNull: false) final  double? tfsZ;
/// Typical p is used to reduce the impact of less probable tokens from the output. (default: 1)
@override@JsonKey(name: 'typical_p', includeIfNull: false) final  double? typicalP;
/// Sets how far back for the model to look back to prevent repetition.
/// (Default: 64, 0 = disabled, -1 = num_ctx)
@override@JsonKey(name: 'repeat_last_n', includeIfNull: false) final  int? repeatLastN;
/// The temperature of the model. Increasing the temperature will make the model answer more creatively.
/// (Default: 0.8)
@override@JsonKey(includeIfNull: false) final  double? temperature;
/// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more
/// strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
@override@JsonKey(name: 'repeat_penalty', includeIfNull: false) final  double? repeatPenalty;
/// Positive values penalize new tokens based on whether they appear in the text so far, increasing the
/// model's likelihood to talk about new topics. (Default: 0)
@override@JsonKey(name: 'presence_penalty', includeIfNull: false) final  double? presencePenalty;
/// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the
/// model's likelihood to repeat the same line verbatim. (Default: 0)
@override@JsonKey(name: 'frequency_penalty', includeIfNull: false) final  double? frequencyPenalty;
/// Enable Mirostat sampling for controlling perplexity.
/// (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
@override@JsonKey(includeIfNull: false) final  int? mirostat;
/// Controls the balance between coherence and diversity of the output. A lower value will result in more
/// focused and coherent text. (Default: 5.0)
@override@JsonKey(name: 'mirostat_tau', includeIfNull: false) final  double? mirostatTau;
/// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate
/// will result in slower adjustments, while a higher learning rate will make the algorithm more responsive.
/// (Default: 0.1)
@override@JsonKey(name: 'mirostat_eta', includeIfNull: false) final  double? mirostatEta;
/// Penalize newlines in the output. (Default: true)
@override@JsonKey(name: 'penalize_newline', includeIfNull: false) final  bool? penalizeNewline;
/// Sequences where the API will stop generating further tokens. The returned text will not contain the stop
/// sequence.
 final  List<String>? _stop;
/// Sequences where the API will stop generating further tokens. The returned text will not contain the stop
/// sequence.
@override@JsonKey(includeIfNull: false) List<String>? get stop {
  final value = _stop;
  if (value == null) return null;
  if (_stop is EqualUnmodifiableListView) return _stop;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Enable NUMA support. (Default: false)
@override@JsonKey(includeIfNull: false) final  bool? numa;
/// Sets the size of the context window used to generate the next token. (Default: 2048)
@override@JsonKey(name: 'num_ctx', includeIfNull: false) final  int? numCtx;
/// Sets the number of batches to use for generation. (Default: 512)
@override@JsonKey(name: 'num_batch', includeIfNull: false) final  int? numBatch;
/// The number of layers to send to the GPU(s).
/// On macOS it defaults to 1 to enable metal support, 0 to disable.
@override@JsonKey(name: 'num_gpu', includeIfNull: false) final  int? numGpu;
/// The GPU to use for the main model. Default is 0.
@override@JsonKey(name: 'main_gpu', includeIfNull: false) final  int? mainGpu;
/// Enable low VRAM mode. (Default: false)
@override@JsonKey(name: 'low_vram', includeIfNull: false) final  bool? lowVram;
/// Enable f16 key/value. (Default: true)
@override@JsonKey(name: 'f16_kv', includeIfNull: false) final  bool? f16Kv;
/// Enable logits all. (Default: false)
@override@JsonKey(name: 'logits_all', includeIfNull: false) final  bool? logitsAll;
/// Enable vocab only. (Default: false)
@override@JsonKey(name: 'vocab_only', includeIfNull: false) final  bool? vocabOnly;
/// Enable mmap. (Default: false)
@override@JsonKey(name: 'use_mmap', includeIfNull: false) final  bool? useMmap;
/// Enable mlock. (Default: false)
@override@JsonKey(name: 'use_mlock', includeIfNull: false) final  bool? useMlock;
/// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal
/// performance. It is recommended to set this value to the number of physical CPU cores your system has
/// (as opposed to the logical number of cores).
@override@JsonKey(name: 'num_thread', includeIfNull: false) final  int? numThread;

/// Create a copy of RequestOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestOptionsCopyWith<_RequestOptions> get copyWith => __$RequestOptionsCopyWithImpl<_RequestOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestOptions&&(identical(other.numKeep, numKeep) || other.numKeep == numKeep)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.numPredict, numPredict) || other.numPredict == numPredict)&&(identical(other.topK, topK) || other.topK == topK)&&(identical(other.topP, topP) || other.topP == topP)&&(identical(other.minP, minP) || other.minP == minP)&&(identical(other.tfsZ, tfsZ) || other.tfsZ == tfsZ)&&(identical(other.typicalP, typicalP) || other.typicalP == typicalP)&&(identical(other.repeatLastN, repeatLastN) || other.repeatLastN == repeatLastN)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.repeatPenalty, repeatPenalty) || other.repeatPenalty == repeatPenalty)&&(identical(other.presencePenalty, presencePenalty) || other.presencePenalty == presencePenalty)&&(identical(other.frequencyPenalty, frequencyPenalty) || other.frequencyPenalty == frequencyPenalty)&&(identical(other.mirostat, mirostat) || other.mirostat == mirostat)&&(identical(other.mirostatTau, mirostatTau) || other.mirostatTau == mirostatTau)&&(identical(other.mirostatEta, mirostatEta) || other.mirostatEta == mirostatEta)&&(identical(other.penalizeNewline, penalizeNewline) || other.penalizeNewline == penalizeNewline)&&const DeepCollectionEquality().equals(other._stop, _stop)&&(identical(other.numa, numa) || other.numa == numa)&&(identical(other.numCtx, numCtx) || other.numCtx == numCtx)&&(identical(other.numBatch, numBatch) || other.numBatch == numBatch)&&(identical(other.numGpu, numGpu) || other.numGpu == numGpu)&&(identical(other.mainGpu, mainGpu) || other.mainGpu == mainGpu)&&(identical(other.lowVram, lowVram) || other.lowVram == lowVram)&&(identical(other.f16Kv, f16Kv) || other.f16Kv == f16Kv)&&(identical(other.logitsAll, logitsAll) || other.logitsAll == logitsAll)&&(identical(other.vocabOnly, vocabOnly) || other.vocabOnly == vocabOnly)&&(identical(other.useMmap, useMmap) || other.useMmap == useMmap)&&(identical(other.useMlock, useMlock) || other.useMlock == useMlock)&&(identical(other.numThread, numThread) || other.numThread == numThread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,numKeep,seed,numPredict,topK,topP,minP,tfsZ,typicalP,repeatLastN,temperature,repeatPenalty,presencePenalty,frequencyPenalty,mirostat,mirostatTau,mirostatEta,penalizeNewline,const DeepCollectionEquality().hash(_stop),numa,numCtx,numBatch,numGpu,mainGpu,lowVram,f16Kv,logitsAll,vocabOnly,useMmap,useMlock,numThread]);

@override
String toString() {
  return 'RequestOptions(numKeep: $numKeep, seed: $seed, numPredict: $numPredict, topK: $topK, topP: $topP, minP: $minP, tfsZ: $tfsZ, typicalP: $typicalP, repeatLastN: $repeatLastN, temperature: $temperature, repeatPenalty: $repeatPenalty, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, mirostat: $mirostat, mirostatTau: $mirostatTau, mirostatEta: $mirostatEta, penalizeNewline: $penalizeNewline, stop: $stop, numa: $numa, numCtx: $numCtx, numBatch: $numBatch, numGpu: $numGpu, mainGpu: $mainGpu, lowVram: $lowVram, f16Kv: $f16Kv, logitsAll: $logitsAll, vocabOnly: $vocabOnly, useMmap: $useMmap, useMlock: $useMlock, numThread: $numThread)';
}


}

/// @nodoc
abstract mixin class _$RequestOptionsCopyWith<$Res> implements $RequestOptionsCopyWith<$Res> {
  factory _$RequestOptionsCopyWith(_RequestOptions value, $Res Function(_RequestOptions) _then) = __$RequestOptionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,@JsonKey(includeIfNull: false) int? seed,@JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,@JsonKey(name: 'top_k', includeIfNull: false) int? topK,@JsonKey(name: 'top_p', includeIfNull: false) double? topP,@JsonKey(name: 'min_p', includeIfNull: false) double? minP,@JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,@JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,@JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,@JsonKey(includeIfNull: false) double? temperature,@JsonKey(name: 'repeat_penalty', includeIfNull: false) double? repeatPenalty,@JsonKey(name: 'presence_penalty', includeIfNull: false) double? presencePenalty,@JsonKey(name: 'frequency_penalty', includeIfNull: false) double? frequencyPenalty,@JsonKey(includeIfNull: false) int? mirostat,@JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,@JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,@JsonKey(name: 'penalize_newline', includeIfNull: false) bool? penalizeNewline,@JsonKey(includeIfNull: false) List<String>? stop,@JsonKey(includeIfNull: false) bool? numa,@JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,@JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,@JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,@JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,@JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,@JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,@JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,@JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,@JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,@JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,@JsonKey(name: 'num_thread', includeIfNull: false) int? numThread
});




}
/// @nodoc
class __$RequestOptionsCopyWithImpl<$Res>
    implements _$RequestOptionsCopyWith<$Res> {
  __$RequestOptionsCopyWithImpl(this._self, this._then);

  final _RequestOptions _self;
  final $Res Function(_RequestOptions) _then;

/// Create a copy of RequestOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numKeep = freezed,Object? seed = freezed,Object? numPredict = freezed,Object? topK = freezed,Object? topP = freezed,Object? minP = freezed,Object? tfsZ = freezed,Object? typicalP = freezed,Object? repeatLastN = freezed,Object? temperature = freezed,Object? repeatPenalty = freezed,Object? presencePenalty = freezed,Object? frequencyPenalty = freezed,Object? mirostat = freezed,Object? mirostatTau = freezed,Object? mirostatEta = freezed,Object? penalizeNewline = freezed,Object? stop = freezed,Object? numa = freezed,Object? numCtx = freezed,Object? numBatch = freezed,Object? numGpu = freezed,Object? mainGpu = freezed,Object? lowVram = freezed,Object? f16Kv = freezed,Object? logitsAll = freezed,Object? vocabOnly = freezed,Object? useMmap = freezed,Object? useMlock = freezed,Object? numThread = freezed,}) {
  return _then(_RequestOptions(
numKeep: freezed == numKeep ? _self.numKeep : numKeep // ignore: cast_nullable_to_non_nullable
as int?,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,numPredict: freezed == numPredict ? _self.numPredict : numPredict // ignore: cast_nullable_to_non_nullable
as int?,topK: freezed == topK ? _self.topK : topK // ignore: cast_nullable_to_non_nullable
as int?,topP: freezed == topP ? _self.topP : topP // ignore: cast_nullable_to_non_nullable
as double?,minP: freezed == minP ? _self.minP : minP // ignore: cast_nullable_to_non_nullable
as double?,tfsZ: freezed == tfsZ ? _self.tfsZ : tfsZ // ignore: cast_nullable_to_non_nullable
as double?,typicalP: freezed == typicalP ? _self.typicalP : typicalP // ignore: cast_nullable_to_non_nullable
as double?,repeatLastN: freezed == repeatLastN ? _self.repeatLastN : repeatLastN // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,repeatPenalty: freezed == repeatPenalty ? _self.repeatPenalty : repeatPenalty // ignore: cast_nullable_to_non_nullable
as double?,presencePenalty: freezed == presencePenalty ? _self.presencePenalty : presencePenalty // ignore: cast_nullable_to_non_nullable
as double?,frequencyPenalty: freezed == frequencyPenalty ? _self.frequencyPenalty : frequencyPenalty // ignore: cast_nullable_to_non_nullable
as double?,mirostat: freezed == mirostat ? _self.mirostat : mirostat // ignore: cast_nullable_to_non_nullable
as int?,mirostatTau: freezed == mirostatTau ? _self.mirostatTau : mirostatTau // ignore: cast_nullable_to_non_nullable
as double?,mirostatEta: freezed == mirostatEta ? _self.mirostatEta : mirostatEta // ignore: cast_nullable_to_non_nullable
as double?,penalizeNewline: freezed == penalizeNewline ? _self.penalizeNewline : penalizeNewline // ignore: cast_nullable_to_non_nullable
as bool?,stop: freezed == stop ? _self._stop : stop // ignore: cast_nullable_to_non_nullable
as List<String>?,numa: freezed == numa ? _self.numa : numa // ignore: cast_nullable_to_non_nullable
as bool?,numCtx: freezed == numCtx ? _self.numCtx : numCtx // ignore: cast_nullable_to_non_nullable
as int?,numBatch: freezed == numBatch ? _self.numBatch : numBatch // ignore: cast_nullable_to_non_nullable
as int?,numGpu: freezed == numGpu ? _self.numGpu : numGpu // ignore: cast_nullable_to_non_nullable
as int?,mainGpu: freezed == mainGpu ? _self.mainGpu : mainGpu // ignore: cast_nullable_to_non_nullable
as int?,lowVram: freezed == lowVram ? _self.lowVram : lowVram // ignore: cast_nullable_to_non_nullable
as bool?,f16Kv: freezed == f16Kv ? _self.f16Kv : f16Kv // ignore: cast_nullable_to_non_nullable
as bool?,logitsAll: freezed == logitsAll ? _self.logitsAll : logitsAll // ignore: cast_nullable_to_non_nullable
as bool?,vocabOnly: freezed == vocabOnly ? _self.vocabOnly : vocabOnly // ignore: cast_nullable_to_non_nullable
as bool?,useMmap: freezed == useMmap ? _self.useMmap : useMmap // ignore: cast_nullable_to_non_nullable
as bool?,useMlock: freezed == useMlock ? _self.useMlock : useMlock // ignore: cast_nullable_to_non_nullable
as bool?,numThread: freezed == numThread ? _self.numThread : numThread // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$VersionResponse {

/// The version of the Ollama server.
@JsonKey(includeIfNull: false) String? get version;
/// Create a copy of VersionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionResponseCopyWith<VersionResponse> get copyWith => _$VersionResponseCopyWithImpl<VersionResponse>(this as VersionResponse, _$identity);

  /// Serializes this VersionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionResponse&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'VersionResponse(version: $version)';
}


}

/// @nodoc
abstract mixin class $VersionResponseCopyWith<$Res>  {
  factory $VersionResponseCopyWith(VersionResponse value, $Res Function(VersionResponse) _then) = _$VersionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? version
});




}
/// @nodoc
class _$VersionResponseCopyWithImpl<$Res>
    implements $VersionResponseCopyWith<$Res> {
  _$VersionResponseCopyWithImpl(this._self, this._then);

  final VersionResponse _self;
  final $Res Function(VersionResponse) _then;

/// Create a copy of VersionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = freezed,}) {
  return _then(_self.copyWith(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionResponse].
extension VersionResponsePatterns on VersionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionResponse value)  $default,){
final _that = this;
switch (_that) {
case _VersionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VersionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersionResponse() when $default != null:
return $default(_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? version)  $default,) {final _that = this;
switch (_that) {
case _VersionResponse():
return $default(_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? version)?  $default,) {final _that = this;
switch (_that) {
case _VersionResponse() when $default != null:
return $default(_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersionResponse extends VersionResponse {
  const _VersionResponse({@JsonKey(includeIfNull: false) this.version}): super._();
  factory _VersionResponse.fromJson(Map<String, dynamic> json) => _$VersionResponseFromJson(json);

/// The version of the Ollama server.
@override@JsonKey(includeIfNull: false) final  String? version;

/// Create a copy of VersionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionResponseCopyWith<_VersionResponse> get copyWith => __$VersionResponseCopyWithImpl<_VersionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionResponse&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'VersionResponse(version: $version)';
}


}

/// @nodoc
abstract mixin class _$VersionResponseCopyWith<$Res> implements $VersionResponseCopyWith<$Res> {
  factory _$VersionResponseCopyWith(_VersionResponse value, $Res Function(_VersionResponse) _then) = __$VersionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? version
});




}
/// @nodoc
class __$VersionResponseCopyWithImpl<$Res>
    implements _$VersionResponseCopyWith<$Res> {
  __$VersionResponseCopyWithImpl(this._self, this._then);

  final _VersionResponse _self;
  final $Res Function(_VersionResponse) _then;

/// Create a copy of VersionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = freezed,}) {
  return _then(_VersionResponse(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GenerateCompletionResponse {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@JsonKey(includeIfNull: false) String? get model;/// Date on which a model was created.
@JsonKey(name: 'created_at', includeIfNull: false) String? get createdAt;/// The response for a given prompt with a provided model.
@JsonKey(includeIfNull: false) String? get response;/// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
@JsonKey(includeIfNull: false) String? get thinking;/// Whether the response has completed.
@JsonKey(includeIfNull: false) bool? get done;/// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
@JsonKey(includeIfNull: false) List<int>? get context;/// Time spent generating the response.
@JsonKey(name: 'total_duration', includeIfNull: false) int? get totalDuration;/// Time spent in nanoseconds loading the model.
@JsonKey(name: 'load_duration', includeIfNull: false) int? get loadDuration;/// Number of tokens in the prompt.
@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? get promptEvalCount;/// Time spent in nanoseconds evaluating the prompt.
@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? get promptEvalDuration;/// Number of tokens the response.
@JsonKey(name: 'eval_count', includeIfNull: false) int? get evalCount;/// Time in nanoseconds spent generating the response.
@JsonKey(name: 'eval_duration', includeIfNull: false) int? get evalDuration;/// Name of the upstream remote model that generated the response (when using federated models)
@JsonKey(name: 'remote_model', includeIfNull: false) String? get remoteModel;/// URL of the upstream Ollama host that served the request (when proxying to remote instances)
@JsonKey(name: 'remote_host', includeIfNull: false) String? get remoteHost;
/// Create a copy of GenerateCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateCompletionResponseCopyWith<GenerateCompletionResponse> get copyWith => _$GenerateCompletionResponseCopyWithImpl<GenerateCompletionResponse>(this as GenerateCompletionResponse, _$identity);

  /// Serializes this GenerateCompletionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateCompletionResponse&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.response, response) || other.response == response)&&(identical(other.thinking, thinking) || other.thinking == thinking)&&(identical(other.done, done) || other.done == done)&&const DeepCollectionEquality().equals(other.context, context)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.loadDuration, loadDuration) || other.loadDuration == loadDuration)&&(identical(other.promptEvalCount, promptEvalCount) || other.promptEvalCount == promptEvalCount)&&(identical(other.promptEvalDuration, promptEvalDuration) || other.promptEvalDuration == promptEvalDuration)&&(identical(other.evalCount, evalCount) || other.evalCount == evalCount)&&(identical(other.evalDuration, evalDuration) || other.evalDuration == evalDuration)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,createdAt,response,thinking,done,const DeepCollectionEquality().hash(context),totalDuration,loadDuration,promptEvalCount,promptEvalDuration,evalCount,evalDuration,remoteModel,remoteHost);

@override
String toString() {
  return 'GenerateCompletionResponse(model: $model, createdAt: $createdAt, response: $response, thinking: $thinking, done: $done, context: $context, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class $GenerateCompletionResponseCopyWith<$Res>  {
  factory $GenerateCompletionResponseCopyWith(GenerateCompletionResponse value, $Res Function(GenerateCompletionResponse) _then) = _$GenerateCompletionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,@JsonKey(includeIfNull: false) String? response,@JsonKey(includeIfNull: false) String? thinking,@JsonKey(includeIfNull: false) bool? done,@JsonKey(includeIfNull: false) List<int>? context,@JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,@JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? promptEvalCount,@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? promptEvalDuration,@JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,@JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});




}
/// @nodoc
class _$GenerateCompletionResponseCopyWithImpl<$Res>
    implements $GenerateCompletionResponseCopyWith<$Res> {
  _$GenerateCompletionResponseCopyWithImpl(this._self, this._then);

  final GenerateCompletionResponse _self;
  final $Res Function(GenerateCompletionResponse) _then;

/// Create a copy of GenerateCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = freezed,Object? createdAt = freezed,Object? response = freezed,Object? thinking = freezed,Object? done = freezed,Object? context = freezed,Object? totalDuration = freezed,Object? loadDuration = freezed,Object? promptEvalCount = freezed,Object? promptEvalDuration = freezed,Object? evalCount = freezed,Object? evalDuration = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_self.copyWith(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String?,done: freezed == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as List<int>?,totalDuration: freezed == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int?,loadDuration: freezed == loadDuration ? _self.loadDuration : loadDuration // ignore: cast_nullable_to_non_nullable
as int?,promptEvalCount: freezed == promptEvalCount ? _self.promptEvalCount : promptEvalCount // ignore: cast_nullable_to_non_nullable
as int?,promptEvalDuration: freezed == promptEvalDuration ? _self.promptEvalDuration : promptEvalDuration // ignore: cast_nullable_to_non_nullable
as int?,evalCount: freezed == evalCount ? _self.evalCount : evalCount // ignore: cast_nullable_to_non_nullable
as int?,evalDuration: freezed == evalDuration ? _self.evalDuration : evalDuration // ignore: cast_nullable_to_non_nullable
as int?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateCompletionResponse].
extension GenerateCompletionResponsePatterns on GenerateCompletionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateCompletionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateCompletionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateCompletionResponse value)  $default,){
final _that = this;
switch (_that) {
case _GenerateCompletionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateCompletionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateCompletionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'created_at', includeIfNull: false)  String? createdAt, @JsonKey(includeIfNull: false)  String? response, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  bool? done, @JsonKey(includeIfNull: false)  List<int>? context, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateCompletionResponse() when $default != null:
return $default(_that.model,_that.createdAt,_that.response,_that.thinking,_that.done,_that.context,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'created_at', includeIfNull: false)  String? createdAt, @JsonKey(includeIfNull: false)  String? response, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  bool? done, @JsonKey(includeIfNull: false)  List<int>? context, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)  $default,) {final _that = this;
switch (_that) {
case _GenerateCompletionResponse():
return $default(_that.model,_that.createdAt,_that.response,_that.thinking,_that.done,_that.context,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'created_at', includeIfNull: false)  String? createdAt, @JsonKey(includeIfNull: false)  String? response, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  bool? done, @JsonKey(includeIfNull: false)  List<int>? context, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,) {final _that = this;
switch (_that) {
case _GenerateCompletionResponse() when $default != null:
return $default(_that.model,_that.createdAt,_that.response,_that.thinking,_that.done,_that.context,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateCompletionResponse extends GenerateCompletionResponse {
  const _GenerateCompletionResponse({@JsonKey(includeIfNull: false) this.model, @JsonKey(name: 'created_at', includeIfNull: false) this.createdAt, @JsonKey(includeIfNull: false) this.response, @JsonKey(includeIfNull: false) this.thinking, @JsonKey(includeIfNull: false) this.done, @JsonKey(includeIfNull: false) final  List<int>? context, @JsonKey(name: 'total_duration', includeIfNull: false) this.totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false) this.loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false) this.promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false) this.promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false) this.evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false) this.evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false) this.remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false) this.remoteHost}): _context = context,super._();
  factory _GenerateCompletionResponse.fromJson(Map<String, dynamic> json) => _$GenerateCompletionResponseFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override@JsonKey(includeIfNull: false) final  String? model;
/// Date on which a model was created.
@override@JsonKey(name: 'created_at', includeIfNull: false) final  String? createdAt;
/// The response for a given prompt with a provided model.
@override@JsonKey(includeIfNull: false) final  String? response;
/// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
@override@JsonKey(includeIfNull: false) final  String? thinking;
/// Whether the response has completed.
@override@JsonKey(includeIfNull: false) final  bool? done;
/// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
 final  List<int>? _context;
/// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
@override@JsonKey(includeIfNull: false) List<int>? get context {
  final value = _context;
  if (value == null) return null;
  if (_context is EqualUnmodifiableListView) return _context;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Time spent generating the response.
@override@JsonKey(name: 'total_duration', includeIfNull: false) final  int? totalDuration;
/// Time spent in nanoseconds loading the model.
@override@JsonKey(name: 'load_duration', includeIfNull: false) final  int? loadDuration;
/// Number of tokens in the prompt.
@override@JsonKey(name: 'prompt_eval_count', includeIfNull: false) final  int? promptEvalCount;
/// Time spent in nanoseconds evaluating the prompt.
@override@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) final  int? promptEvalDuration;
/// Number of tokens the response.
@override@JsonKey(name: 'eval_count', includeIfNull: false) final  int? evalCount;
/// Time in nanoseconds spent generating the response.
@override@JsonKey(name: 'eval_duration', includeIfNull: false) final  int? evalDuration;
/// Name of the upstream remote model that generated the response (when using federated models)
@override@JsonKey(name: 'remote_model', includeIfNull: false) final  String? remoteModel;
/// URL of the upstream Ollama host that served the request (when proxying to remote instances)
@override@JsonKey(name: 'remote_host', includeIfNull: false) final  String? remoteHost;

/// Create a copy of GenerateCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateCompletionResponseCopyWith<_GenerateCompletionResponse> get copyWith => __$GenerateCompletionResponseCopyWithImpl<_GenerateCompletionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateCompletionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateCompletionResponse&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.response, response) || other.response == response)&&(identical(other.thinking, thinking) || other.thinking == thinking)&&(identical(other.done, done) || other.done == done)&&const DeepCollectionEquality().equals(other._context, _context)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.loadDuration, loadDuration) || other.loadDuration == loadDuration)&&(identical(other.promptEvalCount, promptEvalCount) || other.promptEvalCount == promptEvalCount)&&(identical(other.promptEvalDuration, promptEvalDuration) || other.promptEvalDuration == promptEvalDuration)&&(identical(other.evalCount, evalCount) || other.evalCount == evalCount)&&(identical(other.evalDuration, evalDuration) || other.evalDuration == evalDuration)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,createdAt,response,thinking,done,const DeepCollectionEquality().hash(_context),totalDuration,loadDuration,promptEvalCount,promptEvalDuration,evalCount,evalDuration,remoteModel,remoteHost);

@override
String toString() {
  return 'GenerateCompletionResponse(model: $model, createdAt: $createdAt, response: $response, thinking: $thinking, done: $done, context: $context, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class _$GenerateCompletionResponseCopyWith<$Res> implements $GenerateCompletionResponseCopyWith<$Res> {
  factory _$GenerateCompletionResponseCopyWith(_GenerateCompletionResponse value, $Res Function(_GenerateCompletionResponse) _then) = __$GenerateCompletionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,@JsonKey(includeIfNull: false) String? response,@JsonKey(includeIfNull: false) String? thinking,@JsonKey(includeIfNull: false) bool? done,@JsonKey(includeIfNull: false) List<int>? context,@JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,@JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? promptEvalCount,@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? promptEvalDuration,@JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,@JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});




}
/// @nodoc
class __$GenerateCompletionResponseCopyWithImpl<$Res>
    implements _$GenerateCompletionResponseCopyWith<$Res> {
  __$GenerateCompletionResponseCopyWithImpl(this._self, this._then);

  final _GenerateCompletionResponse _self;
  final $Res Function(_GenerateCompletionResponse) _then;

/// Create a copy of GenerateCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = freezed,Object? createdAt = freezed,Object? response = freezed,Object? thinking = freezed,Object? done = freezed,Object? context = freezed,Object? totalDuration = freezed,Object? loadDuration = freezed,Object? promptEvalCount = freezed,Object? promptEvalDuration = freezed,Object? evalCount = freezed,Object? evalDuration = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_GenerateCompletionResponse(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String?,done: freezed == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool?,context: freezed == context ? _self._context : context // ignore: cast_nullable_to_non_nullable
as List<int>?,totalDuration: freezed == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int?,loadDuration: freezed == loadDuration ? _self.loadDuration : loadDuration // ignore: cast_nullable_to_non_nullable
as int?,promptEvalCount: freezed == promptEvalCount ? _self.promptEvalCount : promptEvalCount // ignore: cast_nullable_to_non_nullable
as int?,promptEvalDuration: freezed == promptEvalDuration ? _self.promptEvalDuration : promptEvalDuration // ignore: cast_nullable_to_non_nullable
as int?,evalCount: freezed == evalCount ? _self.evalCount : evalCount // ignore: cast_nullable_to_non_nullable
as int?,evalDuration: freezed == evalDuration ? _self.evalDuration : evalDuration // ignore: cast_nullable_to_non_nullable
as int?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GenerateChatCompletionRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// The messages of the chat, this can be used to keep a chat memory
 List<Message> get messages;/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
 bool get stream;/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestFormat? get format;/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@JsonKey(name: 'keep_alive', includeIfNull: false) int? get keepAlive;/// A list of tools the model may call.
@JsonKey(includeIfNull: false) List<Tool>? get tools;/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@JsonKey(includeIfNull: false) RequestOptions? get options;/// Controls whether thinking/reasoning models will think before responding.
/// Can be:
/// - boolean: true/false to enable/disable thinking
/// - string: "high", "medium", "low" to set thinking intensity level
@_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestThink? get think;/// Truncates the end of the chat history if it exceeds the context length
@JsonKey(includeIfNull: false) bool? get truncate;/// Shifts the oldest messages out of the context window when the context limit is reached
@JsonKey(includeIfNull: false) bool? get shift;
/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestCopyWith<GenerateChatCompletionRequest> get copyWith => _$GenerateChatCompletionRequestCopyWithImpl<GenerateChatCompletionRequest>(this as GenerateChatCompletionRequest, _$identity);

  /// Serializes this GenerateChatCompletionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.format, format) || other.format == format)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.options, options) || other.options == options)&&(identical(other.think, think) || other.think == think)&&(identical(other.truncate, truncate) || other.truncate == truncate)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(messages),stream,format,keepAlive,const DeepCollectionEquality().hash(tools),options,think,truncate,shift);

@override
String toString() {
  return 'GenerateChatCompletionRequest(model: $model, messages: $messages, stream: $stream, format: $format, keepAlive: $keepAlive, tools: $tools, options: $options, think: $think, truncate: $truncate, shift: $shift)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionRequestCopyWith<$Res>  {
  factory $GenerateChatCompletionRequestCopyWith(GenerateChatCompletionRequest value, $Res Function(GenerateChatCompletionRequest) _then) = _$GenerateChatCompletionRequestCopyWithImpl;
@useResult
$Res call({
 String model, List<Message> messages, bool stream,@_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestFormat? format,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(includeIfNull: false) RequestOptions? options,@_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestThink? think,@JsonKey(includeIfNull: false) bool? truncate,@JsonKey(includeIfNull: false) bool? shift
});


$GenerateChatCompletionRequestFormatCopyWith<$Res>? get format;$RequestOptionsCopyWith<$Res>? get options;$GenerateChatCompletionRequestThinkCopyWith<$Res>? get think;

}
/// @nodoc
class _$GenerateChatCompletionRequestCopyWithImpl<$Res>
    implements $GenerateChatCompletionRequestCopyWith<$Res> {
  _$GenerateChatCompletionRequestCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionRequest _self;
  final $Res Function(GenerateChatCompletionRequest) _then;

/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,Object? stream = null,Object? format = freezed,Object? keepAlive = freezed,Object? tools = freezed,Object? options = freezed,Object? think = freezed,Object? truncate = freezed,Object? shift = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestFormat?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,think: freezed == think ? _self.think : think // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestThink?,truncate: freezed == truncate ? _self.truncate : truncate // ignore: cast_nullable_to_non_nullable
as bool?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestFormatCopyWith<$Res>? get format {
    if (_self.format == null) {
    return null;
  }

  return $GenerateChatCompletionRequestFormatCopyWith<$Res>(_self.format!, (value) {
    return _then(_self.copyWith(format: value));
  });
}/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestThinkCopyWith<$Res>? get think {
    if (_self.think == null) {
    return null;
  }

  return $GenerateChatCompletionRequestThinkCopyWith<$Res>(_self.think!, (value) {
    return _then(_self.copyWith(think: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenerateChatCompletionRequest].
extension GenerateChatCompletionRequestPatterns on GenerateChatCompletionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateChatCompletionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateChatCompletionRequest value)  $default,){
final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateChatCompletionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  List<Message> messages,  bool stream, @_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.stream,_that.format,_that.keepAlive,_that.tools,_that.options,_that.think,_that.truncate,_that.shift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  List<Message> messages,  bool stream, @_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)  $default,) {final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest():
return $default(_that.model,_that.messages,_that.stream,_that.format,_that.keepAlive,_that.tools,_that.options,_that.think,_that.truncate,_that.shift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  List<Message> messages,  bool stream, @_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestFormat? format, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive, @JsonKey(includeIfNull: false)  List<Tool>? tools, @JsonKey(includeIfNull: false)  RequestOptions? options, @_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false)  GenerateChatCompletionRequestThink? think, @JsonKey(includeIfNull: false)  bool? truncate, @JsonKey(includeIfNull: false)  bool? shift)?  $default,) {final _that = this;
switch (_that) {
case _GenerateChatCompletionRequest() when $default != null:
return $default(_that.model,_that.messages,_that.stream,_that.format,_that.keepAlive,_that.tools,_that.options,_that.think,_that.truncate,_that.shift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateChatCompletionRequest extends GenerateChatCompletionRequest {
  const _GenerateChatCompletionRequest({required this.model, required final  List<Message> messages, this.stream = false, @_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) this.format, @JsonKey(name: 'keep_alive', includeIfNull: false) this.keepAlive, @JsonKey(includeIfNull: false) final  List<Tool>? tools, @JsonKey(includeIfNull: false) this.options, @_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) this.think, @JsonKey(includeIfNull: false) this.truncate, @JsonKey(includeIfNull: false) this.shift}): _messages = messages,_tools = tools,super._();
  factory _GenerateChatCompletionRequest.fromJson(Map<String, dynamic> json) => _$GenerateChatCompletionRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// The messages of the chat, this can be used to keep a chat memory
 final  List<Message> _messages;
/// The messages of the chat, this can be used to keep a chat memory
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
@override@JsonKey() final  bool stream;
/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@override@_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) final  GenerateChatCompletionRequestFormat? format;
/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@override@JsonKey(name: 'keep_alive', includeIfNull: false) final  int? keepAlive;
/// A list of tools the model may call.
 final  List<Tool>? _tools;
/// A list of tools the model may call.
@override@JsonKey(includeIfNull: false) List<Tool>? get tools {
  final value = _tools;
  if (value == null) return null;
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@override@JsonKey(includeIfNull: false) final  RequestOptions? options;
/// Controls whether thinking/reasoning models will think before responding.
/// Can be:
/// - boolean: true/false to enable/disable thinking
/// - string: "high", "medium", "low" to set thinking intensity level
@override@_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) final  GenerateChatCompletionRequestThink? think;
/// Truncates the end of the chat history if it exceeds the context length
@override@JsonKey(includeIfNull: false) final  bool? truncate;
/// Shifts the oldest messages out of the context window when the context limit is reached
@override@JsonKey(includeIfNull: false) final  bool? shift;

/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateChatCompletionRequestCopyWith<_GenerateChatCompletionRequest> get copyWith => __$GenerateChatCompletionRequestCopyWithImpl<_GenerateChatCompletionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateChatCompletionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateChatCompletionRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.format, format) || other.format == format)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.options, options) || other.options == options)&&(identical(other.think, think) || other.think == think)&&(identical(other.truncate, truncate) || other.truncate == truncate)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_messages),stream,format,keepAlive,const DeepCollectionEquality().hash(_tools),options,think,truncate,shift);

@override
String toString() {
  return 'GenerateChatCompletionRequest(model: $model, messages: $messages, stream: $stream, format: $format, keepAlive: $keepAlive, tools: $tools, options: $options, think: $think, truncate: $truncate, shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$GenerateChatCompletionRequestCopyWith<$Res> implements $GenerateChatCompletionRequestCopyWith<$Res> {
  factory _$GenerateChatCompletionRequestCopyWith(_GenerateChatCompletionRequest value, $Res Function(_GenerateChatCompletionRequest) _then) = __$GenerateChatCompletionRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, List<Message> messages, bool stream,@_GenerateChatCompletionRequestFormatConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestFormat? format,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,@JsonKey(includeIfNull: false) List<Tool>? tools,@JsonKey(includeIfNull: false) RequestOptions? options,@_GenerateChatCompletionRequestThinkConverter()@JsonKey(includeIfNull: false) GenerateChatCompletionRequestThink? think,@JsonKey(includeIfNull: false) bool? truncate,@JsonKey(includeIfNull: false) bool? shift
});


@override $GenerateChatCompletionRequestFormatCopyWith<$Res>? get format;@override $RequestOptionsCopyWith<$Res>? get options;@override $GenerateChatCompletionRequestThinkCopyWith<$Res>? get think;

}
/// @nodoc
class __$GenerateChatCompletionRequestCopyWithImpl<$Res>
    implements _$GenerateChatCompletionRequestCopyWith<$Res> {
  __$GenerateChatCompletionRequestCopyWithImpl(this._self, this._then);

  final _GenerateChatCompletionRequest _self;
  final $Res Function(_GenerateChatCompletionRequest) _then;

/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,Object? stream = null,Object? format = freezed,Object? keepAlive = freezed,Object? tools = freezed,Object? options = freezed,Object? think = freezed,Object? truncate = freezed,Object? shift = freezed,}) {
  return _then(_GenerateChatCompletionRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestFormat?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<Tool>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,think: freezed == think ? _self.think : think // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestThink?,truncate: freezed == truncate ? _self.truncate : truncate // ignore: cast_nullable_to_non_nullable
as bool?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestFormatCopyWith<$Res>? get format {
    if (_self.format == null) {
    return null;
  }

  return $GenerateChatCompletionRequestFormatCopyWith<$Res>(_self.format!, (value) {
    return _then(_self.copyWith(format: value));
  });
}/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of GenerateChatCompletionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestThinkCopyWith<$Res>? get think {
    if (_self.think == null) {
    return null;
  }

  return $GenerateChatCompletionRequestThinkCopyWith<$Res>(_self.think!, (value) {
    return _then(_self.copyWith(think: value));
  });
}
}

GenerateChatCompletionRequestFormat _$GenerateChatCompletionRequestFormatFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'enumeration':
          return GenerateChatCompletionRequestFormatEnumeration.fromJson(
            json
          );
                case 'mapStringDynamic':
          return GenerateChatCompletionRequestFormatMapStringDynamic.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GenerateChatCompletionRequestFormat',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GenerateChatCompletionRequestFormat {

 Object get value;

  /// Serializes this GenerateChatCompletionRequestFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequestFormat&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'GenerateChatCompletionRequestFormat(value: $value)';
}


}

/// @nodoc
class $GenerateChatCompletionRequestFormatCopyWith<$Res>  {
$GenerateChatCompletionRequestFormatCopyWith(GenerateChatCompletionRequestFormat _, $Res Function(GenerateChatCompletionRequestFormat) __);
}


/// Adds pattern-matching-related methods to [GenerateChatCompletionRequestFormat].
extension GenerateChatCompletionRequestFormatPatterns on GenerateChatCompletionRequestFormat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GenerateChatCompletionRequestFormatEnumeration value)?  enumeration,TResult Function( GenerateChatCompletionRequestFormatMapStringDynamic value)?  mapStringDynamic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that);case GenerateChatCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GenerateChatCompletionRequestFormatEnumeration value)  enumeration,required TResult Function( GenerateChatCompletionRequestFormatMapStringDynamic value)  mapStringDynamic,}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration():
return enumeration(_that);case GenerateChatCompletionRequestFormatMapStringDynamic():
return mapStringDynamic(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GenerateChatCompletionRequestFormatEnumeration value)?  enumeration,TResult? Function( GenerateChatCompletionRequestFormatMapStringDynamic value)?  mapStringDynamic,}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that);case GenerateChatCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GenerateChatCompletionRequestFormatEnum value)?  enumeration,TResult Function( Map<String, dynamic> value)?  mapStringDynamic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that.value);case GenerateChatCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GenerateChatCompletionRequestFormatEnum value)  enumeration,required TResult Function( Map<String, dynamic> value)  mapStringDynamic,}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration():
return enumeration(_that.value);case GenerateChatCompletionRequestFormatMapStringDynamic():
return mapStringDynamic(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GenerateChatCompletionRequestFormatEnum value)?  enumeration,TResult? Function( Map<String, dynamic> value)?  mapStringDynamic,}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestFormatEnumeration() when enumeration != null:
return enumeration(_that.value);case GenerateChatCompletionRequestFormatMapStringDynamic() when mapStringDynamic != null:
return mapStringDynamic(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GenerateChatCompletionRequestFormatEnumeration extends GenerateChatCompletionRequestFormat {
  const GenerateChatCompletionRequestFormatEnumeration(this.value, {final  String? $type}): $type = $type ?? 'enumeration',super._();
  factory GenerateChatCompletionRequestFormatEnumeration.fromJson(Map<String, dynamic> json) => _$GenerateChatCompletionRequestFormatEnumerationFromJson(json);

@override final  GenerateChatCompletionRequestFormatEnum value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GenerateChatCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestFormatEnumerationCopyWith<GenerateChatCompletionRequestFormatEnumeration> get copyWith => _$GenerateChatCompletionRequestFormatEnumerationCopyWithImpl<GenerateChatCompletionRequestFormatEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateChatCompletionRequestFormatEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequestFormatEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateChatCompletionRequestFormat.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionRequestFormatEnumerationCopyWith<$Res> implements $GenerateChatCompletionRequestFormatCopyWith<$Res> {
  factory $GenerateChatCompletionRequestFormatEnumerationCopyWith(GenerateChatCompletionRequestFormatEnumeration value, $Res Function(GenerateChatCompletionRequestFormatEnumeration) _then) = _$GenerateChatCompletionRequestFormatEnumerationCopyWithImpl;
@useResult
$Res call({
 GenerateChatCompletionRequestFormatEnum value
});




}
/// @nodoc
class _$GenerateChatCompletionRequestFormatEnumerationCopyWithImpl<$Res>
    implements $GenerateChatCompletionRequestFormatEnumerationCopyWith<$Res> {
  _$GenerateChatCompletionRequestFormatEnumerationCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionRequestFormatEnumeration _self;
  final $Res Function(GenerateChatCompletionRequestFormatEnumeration) _then;

/// Create a copy of GenerateChatCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateChatCompletionRequestFormatEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestFormatEnum,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GenerateChatCompletionRequestFormatMapStringDynamic extends GenerateChatCompletionRequestFormat {
  const GenerateChatCompletionRequestFormatMapStringDynamic(final  Map<String, dynamic> value, {final  String? $type}): _value = value,$type = $type ?? 'mapStringDynamic',super._();
  factory GenerateChatCompletionRequestFormatMapStringDynamic.fromJson(Map<String, dynamic> json) => _$GenerateChatCompletionRequestFormatMapStringDynamicFromJson(json);

 final  Map<String, dynamic> _value;
@override Map<String, dynamic> get value {
  if (_value is EqualUnmodifiableMapView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GenerateChatCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestFormatMapStringDynamicCopyWith<GenerateChatCompletionRequestFormatMapStringDynamic> get copyWith => _$GenerateChatCompletionRequestFormatMapStringDynamicCopyWithImpl<GenerateChatCompletionRequestFormatMapStringDynamic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateChatCompletionRequestFormatMapStringDynamicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequestFormatMapStringDynamic&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'GenerateChatCompletionRequestFormat.mapStringDynamic(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionRequestFormatMapStringDynamicCopyWith<$Res> implements $GenerateChatCompletionRequestFormatCopyWith<$Res> {
  factory $GenerateChatCompletionRequestFormatMapStringDynamicCopyWith(GenerateChatCompletionRequestFormatMapStringDynamic value, $Res Function(GenerateChatCompletionRequestFormatMapStringDynamic) _then) = _$GenerateChatCompletionRequestFormatMapStringDynamicCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> value
});




}
/// @nodoc
class _$GenerateChatCompletionRequestFormatMapStringDynamicCopyWithImpl<$Res>
    implements $GenerateChatCompletionRequestFormatMapStringDynamicCopyWith<$Res> {
  _$GenerateChatCompletionRequestFormatMapStringDynamicCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionRequestFormatMapStringDynamic _self;
  final $Res Function(GenerateChatCompletionRequestFormatMapStringDynamic) _then;

/// Create a copy of GenerateChatCompletionRequestFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateChatCompletionRequestFormatMapStringDynamic(
null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

GenerateChatCompletionRequestThink _$GenerateChatCompletionRequestThinkFromJson(
  Map<String, dynamic> json
) {
    return GenerateChatCompletionRequestThinkEnumeration.fromJson(
      json
    );
}

/// @nodoc
mixin _$GenerateChatCompletionRequestThink {

 GenerateChatCompletionRequestThinkEnum get value;
/// Create a copy of GenerateChatCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestThinkCopyWith<GenerateChatCompletionRequestThink> get copyWith => _$GenerateChatCompletionRequestThinkCopyWithImpl<GenerateChatCompletionRequestThink>(this as GenerateChatCompletionRequestThink, _$identity);

  /// Serializes this GenerateChatCompletionRequestThink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequestThink&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateChatCompletionRequestThink(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionRequestThinkCopyWith<$Res>  {
  factory $GenerateChatCompletionRequestThinkCopyWith(GenerateChatCompletionRequestThink value, $Res Function(GenerateChatCompletionRequestThink) _then) = _$GenerateChatCompletionRequestThinkCopyWithImpl;
@useResult
$Res call({
 GenerateChatCompletionRequestThinkEnum value
});




}
/// @nodoc
class _$GenerateChatCompletionRequestThinkCopyWithImpl<$Res>
    implements $GenerateChatCompletionRequestThinkCopyWith<$Res> {
  _$GenerateChatCompletionRequestThinkCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionRequestThink _self;
  final $Res Function(GenerateChatCompletionRequestThink) _then;

/// Create a copy of GenerateChatCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestThinkEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateChatCompletionRequestThink].
extension GenerateChatCompletionRequestThinkPatterns on GenerateChatCompletionRequestThink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GenerateChatCompletionRequestThinkEnumeration value)?  enumeration,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GenerateChatCompletionRequestThinkEnumeration value)  enumeration,}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration():
return enumeration(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GenerateChatCompletionRequestThinkEnumeration value)?  enumeration,}){
final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( GenerateChatCompletionRequestThinkEnum value)?  enumeration,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( GenerateChatCompletionRequestThinkEnum value)  enumeration,}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration():
return enumeration(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( GenerateChatCompletionRequestThinkEnum value)?  enumeration,}) {final _that = this;
switch (_that) {
case GenerateChatCompletionRequestThinkEnumeration() when enumeration != null:
return enumeration(_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GenerateChatCompletionRequestThinkEnumeration extends GenerateChatCompletionRequestThink {
  const GenerateChatCompletionRequestThinkEnumeration(this.value): super._();
  factory GenerateChatCompletionRequestThinkEnumeration.fromJson(Map<String, dynamic> json) => _$GenerateChatCompletionRequestThinkEnumerationFromJson(json);

@override final  GenerateChatCompletionRequestThinkEnum value;

/// Create a copy of GenerateChatCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionRequestThinkEnumerationCopyWith<GenerateChatCompletionRequestThinkEnumeration> get copyWith => _$GenerateChatCompletionRequestThinkEnumerationCopyWithImpl<GenerateChatCompletionRequestThinkEnumeration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateChatCompletionRequestThinkEnumerationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionRequestThinkEnumeration&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'GenerateChatCompletionRequestThink.enumeration(value: $value)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionRequestThinkEnumerationCopyWith<$Res> implements $GenerateChatCompletionRequestThinkCopyWith<$Res> {
  factory $GenerateChatCompletionRequestThinkEnumerationCopyWith(GenerateChatCompletionRequestThinkEnumeration value, $Res Function(GenerateChatCompletionRequestThinkEnumeration) _then) = _$GenerateChatCompletionRequestThinkEnumerationCopyWithImpl;
@override @useResult
$Res call({
 GenerateChatCompletionRequestThinkEnum value
});




}
/// @nodoc
class _$GenerateChatCompletionRequestThinkEnumerationCopyWithImpl<$Res>
    implements $GenerateChatCompletionRequestThinkEnumerationCopyWith<$Res> {
  _$GenerateChatCompletionRequestThinkEnumerationCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionRequestThinkEnumeration _self;
  final $Res Function(GenerateChatCompletionRequestThinkEnumeration) _then;

/// Create a copy of GenerateChatCompletionRequestThink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(GenerateChatCompletionRequestThinkEnumeration(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as GenerateChatCompletionRequestThinkEnum,
  ));
}


}


/// @nodoc
mixin _$GenerateChatCompletionResponse {

/// A message in the chat endpoint
 Message get message;/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// Date on which a model was created.
@JsonKey(name: 'created_at') String get createdAt;/// Whether the response has completed.
 bool get done;/// Reason why the model is done generating a response.
@JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) DoneReason? get doneReason;/// Time spent generating the response.
@JsonKey(name: 'total_duration', includeIfNull: false) int? get totalDuration;/// Time spent in nanoseconds loading the model.
@JsonKey(name: 'load_duration', includeIfNull: false) int? get loadDuration;/// Number of tokens in the prompt.
@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? get promptEvalCount;/// Time spent in nanoseconds evaluating the prompt.
@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? get promptEvalDuration;/// Number of tokens the response.
@JsonKey(name: 'eval_count', includeIfNull: false) int? get evalCount;/// Time in nanoseconds spent generating the response.
@JsonKey(name: 'eval_duration', includeIfNull: false) int? get evalDuration;/// Name of the upstream remote model that generated the response (when using federated models)
@JsonKey(name: 'remote_model', includeIfNull: false) String? get remoteModel;/// URL of the upstream Ollama host that served the request (when proxying to remote instances)
@JsonKey(name: 'remote_host', includeIfNull: false) String? get remoteHost;
/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateChatCompletionResponseCopyWith<GenerateChatCompletionResponse> get copyWith => _$GenerateChatCompletionResponseCopyWithImpl<GenerateChatCompletionResponse>(this as GenerateChatCompletionResponse, _$identity);

  /// Serializes this GenerateChatCompletionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateChatCompletionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.doneReason, doneReason) || other.doneReason == doneReason)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.loadDuration, loadDuration) || other.loadDuration == loadDuration)&&(identical(other.promptEvalCount, promptEvalCount) || other.promptEvalCount == promptEvalCount)&&(identical(other.promptEvalDuration, promptEvalDuration) || other.promptEvalDuration == promptEvalDuration)&&(identical(other.evalCount, evalCount) || other.evalCount == evalCount)&&(identical(other.evalDuration, evalDuration) || other.evalDuration == evalDuration)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,model,createdAt,done,doneReason,totalDuration,loadDuration,promptEvalCount,promptEvalDuration,evalCount,evalDuration,remoteModel,remoteHost);

@override
String toString() {
  return 'GenerateChatCompletionResponse(message: $message, model: $model, createdAt: $createdAt, done: $done, doneReason: $doneReason, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class $GenerateChatCompletionResponseCopyWith<$Res>  {
  factory $GenerateChatCompletionResponseCopyWith(GenerateChatCompletionResponse value, $Res Function(GenerateChatCompletionResponse) _then) = _$GenerateChatCompletionResponseCopyWithImpl;
@useResult
$Res call({
 Message message, String model,@JsonKey(name: 'created_at') String createdAt, bool done,@JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) DoneReason? doneReason,@JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,@JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? promptEvalCount,@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? promptEvalDuration,@JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,@JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$GenerateChatCompletionResponseCopyWithImpl<$Res>
    implements $GenerateChatCompletionResponseCopyWith<$Res> {
  _$GenerateChatCompletionResponseCopyWithImpl(this._self, this._then);

  final GenerateChatCompletionResponse _self;
  final $Res Function(GenerateChatCompletionResponse) _then;

/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? model = null,Object? createdAt = null,Object? done = null,Object? doneReason = freezed,Object? totalDuration = freezed,Object? loadDuration = freezed,Object? promptEvalCount = freezed,Object? promptEvalDuration = freezed,Object? evalCount = freezed,Object? evalDuration = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,doneReason: freezed == doneReason ? _self.doneReason : doneReason // ignore: cast_nullable_to_non_nullable
as DoneReason?,totalDuration: freezed == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int?,loadDuration: freezed == loadDuration ? _self.loadDuration : loadDuration // ignore: cast_nullable_to_non_nullable
as int?,promptEvalCount: freezed == promptEvalCount ? _self.promptEvalCount : promptEvalCount // ignore: cast_nullable_to_non_nullable
as int?,promptEvalDuration: freezed == promptEvalDuration ? _self.promptEvalDuration : promptEvalDuration // ignore: cast_nullable_to_non_nullable
as int?,evalCount: freezed == evalCount ? _self.evalCount : evalCount // ignore: cast_nullable_to_non_nullable
as int?,evalDuration: freezed == evalDuration ? _self.evalDuration : evalDuration // ignore: cast_nullable_to_non_nullable
as int?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenerateChatCompletionResponse].
extension GenerateChatCompletionResponsePatterns on GenerateChatCompletionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateChatCompletionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateChatCompletionResponse value)  $default,){
final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateChatCompletionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Message message,  String model, @JsonKey(name: 'created_at')  String createdAt,  bool done, @JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  DoneReason? doneReason, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse() when $default != null:
return $default(_that.message,_that.model,_that.createdAt,_that.done,_that.doneReason,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Message message,  String model, @JsonKey(name: 'created_at')  String createdAt,  bool done, @JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  DoneReason? doneReason, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)  $default,) {final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse():
return $default(_that.message,_that.model,_that.createdAt,_that.done,_that.doneReason,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Message message,  String model, @JsonKey(name: 'created_at')  String createdAt,  bool done, @JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  DoneReason? doneReason, @JsonKey(name: 'total_duration', includeIfNull: false)  int? totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false)  int? loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false)  int? promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)  int? promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false)  int? evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false)  int? evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,) {final _that = this;
switch (_that) {
case _GenerateChatCompletionResponse() when $default != null:
return $default(_that.message,_that.model,_that.createdAt,_that.done,_that.doneReason,_that.totalDuration,_that.loadDuration,_that.promptEvalCount,_that.promptEvalDuration,_that.evalCount,_that.evalDuration,_that.remoteModel,_that.remoteHost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateChatCompletionResponse extends GenerateChatCompletionResponse {
  const _GenerateChatCompletionResponse({required this.message, required this.model, @JsonKey(name: 'created_at') required this.createdAt, required this.done, @JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.doneReason, @JsonKey(name: 'total_duration', includeIfNull: false) this.totalDuration, @JsonKey(name: 'load_duration', includeIfNull: false) this.loadDuration, @JsonKey(name: 'prompt_eval_count', includeIfNull: false) this.promptEvalCount, @JsonKey(name: 'prompt_eval_duration', includeIfNull: false) this.promptEvalDuration, @JsonKey(name: 'eval_count', includeIfNull: false) this.evalCount, @JsonKey(name: 'eval_duration', includeIfNull: false) this.evalDuration, @JsonKey(name: 'remote_model', includeIfNull: false) this.remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false) this.remoteHost}): super._();
  factory _GenerateChatCompletionResponse.fromJson(Map<String, dynamic> json) => _$GenerateChatCompletionResponseFromJson(json);

/// A message in the chat endpoint
@override final  Message message;
/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// Date on which a model was created.
@override@JsonKey(name: 'created_at') final  String createdAt;
/// Whether the response has completed.
@override final  bool done;
/// Reason why the model is done generating a response.
@override@JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  DoneReason? doneReason;
/// Time spent generating the response.
@override@JsonKey(name: 'total_duration', includeIfNull: false) final  int? totalDuration;
/// Time spent in nanoseconds loading the model.
@override@JsonKey(name: 'load_duration', includeIfNull: false) final  int? loadDuration;
/// Number of tokens in the prompt.
@override@JsonKey(name: 'prompt_eval_count', includeIfNull: false) final  int? promptEvalCount;
/// Time spent in nanoseconds evaluating the prompt.
@override@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) final  int? promptEvalDuration;
/// Number of tokens the response.
@override@JsonKey(name: 'eval_count', includeIfNull: false) final  int? evalCount;
/// Time in nanoseconds spent generating the response.
@override@JsonKey(name: 'eval_duration', includeIfNull: false) final  int? evalDuration;
/// Name of the upstream remote model that generated the response (when using federated models)
@override@JsonKey(name: 'remote_model', includeIfNull: false) final  String? remoteModel;
/// URL of the upstream Ollama host that served the request (when proxying to remote instances)
@override@JsonKey(name: 'remote_host', includeIfNull: false) final  String? remoteHost;

/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateChatCompletionResponseCopyWith<_GenerateChatCompletionResponse> get copyWith => __$GenerateChatCompletionResponseCopyWithImpl<_GenerateChatCompletionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateChatCompletionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateChatCompletionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.model, model) || other.model == model)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.doneReason, doneReason) || other.doneReason == doneReason)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.loadDuration, loadDuration) || other.loadDuration == loadDuration)&&(identical(other.promptEvalCount, promptEvalCount) || other.promptEvalCount == promptEvalCount)&&(identical(other.promptEvalDuration, promptEvalDuration) || other.promptEvalDuration == promptEvalDuration)&&(identical(other.evalCount, evalCount) || other.evalCount == evalCount)&&(identical(other.evalDuration, evalDuration) || other.evalDuration == evalDuration)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,model,createdAt,done,doneReason,totalDuration,loadDuration,promptEvalCount,promptEvalDuration,evalCount,evalDuration,remoteModel,remoteHost);

@override
String toString() {
  return 'GenerateChatCompletionResponse(message: $message, model: $model, createdAt: $createdAt, done: $done, doneReason: $doneReason, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class _$GenerateChatCompletionResponseCopyWith<$Res> implements $GenerateChatCompletionResponseCopyWith<$Res> {
  factory _$GenerateChatCompletionResponseCopyWith(_GenerateChatCompletionResponse value, $Res Function(_GenerateChatCompletionResponse) _then) = __$GenerateChatCompletionResponseCopyWithImpl;
@override @useResult
$Res call({
 Message message, String model,@JsonKey(name: 'created_at') String createdAt, bool done,@JsonKey(name: 'done_reason', includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) DoneReason? doneReason,@JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,@JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,@JsonKey(name: 'prompt_eval_count', includeIfNull: false) int? promptEvalCount,@JsonKey(name: 'prompt_eval_duration', includeIfNull: false) int? promptEvalDuration,@JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,@JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


@override $MessageCopyWith<$Res> get message;

}
/// @nodoc
class __$GenerateChatCompletionResponseCopyWithImpl<$Res>
    implements _$GenerateChatCompletionResponseCopyWith<$Res> {
  __$GenerateChatCompletionResponseCopyWithImpl(this._self, this._then);

  final _GenerateChatCompletionResponse _self;
  final $Res Function(_GenerateChatCompletionResponse) _then;

/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? model = null,Object? createdAt = null,Object? done = null,Object? doneReason = freezed,Object? totalDuration = freezed,Object? loadDuration = freezed,Object? promptEvalCount = freezed,Object? promptEvalDuration = freezed,Object? evalCount = freezed,Object? evalDuration = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_GenerateChatCompletionResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,doneReason: freezed == doneReason ? _self.doneReason : doneReason // ignore: cast_nullable_to_non_nullable
as DoneReason?,totalDuration: freezed == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int?,loadDuration: freezed == loadDuration ? _self.loadDuration : loadDuration // ignore: cast_nullable_to_non_nullable
as int?,promptEvalCount: freezed == promptEvalCount ? _self.promptEvalCount : promptEvalCount // ignore: cast_nullable_to_non_nullable
as int?,promptEvalDuration: freezed == promptEvalDuration ? _self.promptEvalDuration : promptEvalDuration // ignore: cast_nullable_to_non_nullable
as int?,evalCount: freezed == evalCount ? _self.evalCount : evalCount // ignore: cast_nullable_to_non_nullable
as int?,evalDuration: freezed == evalDuration ? _self.evalDuration : evalDuration // ignore: cast_nullable_to_non_nullable
as int?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GenerateChatCompletionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$Message {

/// The role of the message
 MessageRole get role;/// The content of the message
 String get content;/// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
@JsonKey(includeIfNull: false) String? get thinking;/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
@JsonKey(includeIfNull: false) List<String>? get images;/// A list of tools the model wants to call.
@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.thinking, thinking) || other.thinking == thinking)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,thinking,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(toolCalls));

@override
String toString() {
  return 'Message(role: $role, content: $content, thinking: $thinking, images: $images, toolCalls: $toolCalls)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 MessageRole role, String content,@JsonKey(includeIfNull: false) String? thinking,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,Object? thinking = freezed,Object? images = freezed,Object? toolCalls = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MessageRole role,  String content, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.role,_that.content,_that.thinking,_that.images,_that.toolCalls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MessageRole role,  String content, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.role,_that.content,_that.thinking,_that.images,_that.toolCalls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MessageRole role,  String content, @JsonKey(includeIfNull: false)  String? thinking, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'tool_calls', includeIfNull: false)  List<ToolCall>? toolCalls)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.role,_that.content,_that.thinking,_that.images,_that.toolCalls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message extends Message {
  const _Message({required this.role, required this.content, @JsonKey(includeIfNull: false) this.thinking, @JsonKey(includeIfNull: false) final  List<String>? images, @JsonKey(name: 'tool_calls', includeIfNull: false) final  List<ToolCall>? toolCalls}): _images = images,_toolCalls = toolCalls,super._();
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

/// The role of the message
@override final  MessageRole role;
/// The content of the message
@override final  String content;
/// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
@override@JsonKey(includeIfNull: false) final  String? thinking;
/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
 final  List<String>? _images;
/// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
@override@JsonKey(includeIfNull: false) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// A list of tools the model wants to call.
 final  List<ToolCall>? _toolCalls;
/// A list of tools the model wants to call.
@override@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? get toolCalls {
  final value = _toolCalls;
  if (value == null) return null;
  if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.thinking, thinking) || other.thinking == thinking)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._toolCalls, _toolCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content,thinking,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_toolCalls));

@override
String toString() {
  return 'Message(role: $role, content: $content, thinking: $thinking, images: $images, toolCalls: $toolCalls)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 MessageRole role, String content,@JsonKey(includeIfNull: false) String? thinking,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(name: 'tool_calls', includeIfNull: false) List<ToolCall>? toolCalls
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,Object? thinking = freezed,Object? images = freezed,Object? toolCalls = freezed,}) {
  return _then(_Message(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,thinking: freezed == thinking ? _self.thinking : thinking // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,toolCalls: freezed == toolCalls ? _self._toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<ToolCall>?,
  ));
}


}


/// @nodoc
mixin _$Tool {

/// The type of tool.
 ToolType get type;/// A function that the model may call.
@JsonKey(includeIfNull: false) ToolFunction? get function;
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
 ToolType type,@JsonKey(includeIfNull: false) ToolFunction? function
});


$ToolFunctionCopyWith<$Res>? get function;

}
/// @nodoc
class _$ToolCopyWithImpl<$Res>
    implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._self, this._then);

  final Tool _self;
  final $Res Function(Tool) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? function = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolFunction?,
  ));
}
/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolFunctionCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $ToolFunctionCopyWith<$Res>(_self.function!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolType type, @JsonKey(includeIfNull: false)  ToolFunction? function)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolType type, @JsonKey(includeIfNull: false)  ToolFunction? function)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolType type, @JsonKey(includeIfNull: false)  ToolFunction? function)?  $default,) {final _that = this;
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
  const _Tool({this.type = ToolType.function, @JsonKey(includeIfNull: false) this.function}): super._();
  factory _Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

/// The type of tool.
@override@JsonKey() final  ToolType type;
/// A function that the model may call.
@override@JsonKey(includeIfNull: false) final  ToolFunction? function;

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
 ToolType type,@JsonKey(includeIfNull: false) ToolFunction? function
});


@override $ToolFunctionCopyWith<$Res>? get function;

}
/// @nodoc
class __$ToolCopyWithImpl<$Res>
    implements _$ToolCopyWith<$Res> {
  __$ToolCopyWithImpl(this._self, this._then);

  final _Tool _self;
  final $Res Function(_Tool) _then;

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? function = freezed,}) {
  return _then(_Tool(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToolType,function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolFunction?,
  ));
}

/// Create a copy of Tool
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolFunctionCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $ToolFunctionCopyWith<$Res>(_self.function!, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$ToolFunction {

/// The name of the function to be called.
 String get name;/// A description of what the function does, used by the model to choose when and how to call the function.
 String get description;/// The parameters the functions accepts, described as a JSON Schema object.
 ToolFunctionParams get parameters;
/// Create a copy of ToolFunction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolFunctionCopyWith<ToolFunction> get copyWith => _$ToolFunctionCopyWithImpl<ToolFunction>(this as ToolFunction, _$identity);

  /// Serializes this ToolFunction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolFunction&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.parameters, parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(parameters));

@override
String toString() {
  return 'ToolFunction(name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $ToolFunctionCopyWith<$Res>  {
  factory $ToolFunctionCopyWith(ToolFunction value, $Res Function(ToolFunction) _then) = _$ToolFunctionCopyWithImpl;
@useResult
$Res call({
 String name, String description, ToolFunctionParams parameters
});




}
/// @nodoc
class _$ToolFunctionCopyWithImpl<$Res>
    implements $ToolFunctionCopyWith<$Res> {
  _$ToolFunctionCopyWithImpl(this._self, this._then);

  final ToolFunction _self;
  final $Res Function(ToolFunction) _then;

/// Create a copy of ToolFunction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as ToolFunctionParams,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolFunction].
extension ToolFunctionPatterns on ToolFunction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolFunction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolFunction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolFunction value)  $default,){
final _that = this;
switch (_that) {
case _ToolFunction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolFunction value)?  $default,){
final _that = this;
switch (_that) {
case _ToolFunction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  ToolFunctionParams parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolFunction() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  ToolFunctionParams parameters)  $default,) {final _that = this;
switch (_that) {
case _ToolFunction():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  ToolFunctionParams parameters)?  $default,) {final _that = this;
switch (_that) {
case _ToolFunction() when $default != null:
return $default(_that.name,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolFunction extends ToolFunction {
  const _ToolFunction({required this.name, required this.description, required final  ToolFunctionParams parameters}): _parameters = parameters,super._();
  factory _ToolFunction.fromJson(Map<String, dynamic> json) => _$ToolFunctionFromJson(json);

/// The name of the function to be called.
@override final  String name;
/// A description of what the function does, used by the model to choose when and how to call the function.
@override final  String description;
/// The parameters the functions accepts, described as a JSON Schema object.
 final  ToolFunctionParams _parameters;
/// The parameters the functions accepts, described as a JSON Schema object.
@override ToolFunctionParams get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}


/// Create a copy of ToolFunction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolFunctionCopyWith<_ToolFunction> get copyWith => __$ToolFunctionCopyWithImpl<_ToolFunction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolFunctionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolFunction&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._parameters, _parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_parameters));

@override
String toString() {
  return 'ToolFunction(name: $name, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$ToolFunctionCopyWith<$Res> implements $ToolFunctionCopyWith<$Res> {
  factory _$ToolFunctionCopyWith(_ToolFunction value, $Res Function(_ToolFunction) _then) = __$ToolFunctionCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, ToolFunctionParams parameters
});




}
/// @nodoc
class __$ToolFunctionCopyWithImpl<$Res>
    implements _$ToolFunctionCopyWith<$Res> {
  __$ToolFunctionCopyWithImpl(this._self, this._then);

  final _ToolFunction _self;
  final $Res Function(_ToolFunction) _then;

/// Create a copy of ToolFunction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? parameters = null,}) {
  return _then(_ToolFunction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as ToolFunctionParams,
  ));
}


}


/// @nodoc
mixin _$ToolCall {

/// The function the model wants to call.
@JsonKey(includeIfNull: false) ToolCallFunction? get function;
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallCopyWith<ToolCall> get copyWith => _$ToolCallCopyWithImpl<ToolCall>(this as ToolCall, _$identity);

  /// Serializes this ToolCall to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCall&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,function);

@override
String toString() {
  return 'ToolCall(function: $function)';
}


}

/// @nodoc
abstract mixin class $ToolCallCopyWith<$Res>  {
  factory $ToolCallCopyWith(ToolCall value, $Res Function(ToolCall) _then) = _$ToolCallCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) ToolCallFunction? function
});


$ToolCallFunctionCopyWith<$Res>? get function;

}
/// @nodoc
class _$ToolCallCopyWithImpl<$Res>
    implements $ToolCallCopyWith<$Res> {
  _$ToolCallCopyWithImpl(this._self, this._then);

  final ToolCall _self;
  final $Res Function(ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? function = freezed,}) {
  return _then(_self.copyWith(
function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolCallFunction?,
  ));
}
/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolCallFunctionCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $ToolCallFunctionCopyWith<$Res>(_self.function!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  ToolCallFunction? function)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.function);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  ToolCallFunction? function)  $default,) {final _that = this;
switch (_that) {
case _ToolCall():
return $default(_that.function);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  ToolCallFunction? function)?  $default,) {final _that = this;
switch (_that) {
case _ToolCall() when $default != null:
return $default(_that.function);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCall extends ToolCall {
  const _ToolCall({@JsonKey(includeIfNull: false) this.function}): super._();
  factory _ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);

/// The function the model wants to call.
@override@JsonKey(includeIfNull: false) final  ToolCallFunction? function;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCall&&(identical(other.function, function) || other.function == function));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,function);

@override
String toString() {
  return 'ToolCall(function: $function)';
}


}

/// @nodoc
abstract mixin class _$ToolCallCopyWith<$Res> implements $ToolCallCopyWith<$Res> {
  factory _$ToolCallCopyWith(_ToolCall value, $Res Function(_ToolCall) _then) = __$ToolCallCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) ToolCallFunction? function
});


@override $ToolCallFunctionCopyWith<$Res>? get function;

}
/// @nodoc
class __$ToolCallCopyWithImpl<$Res>
    implements _$ToolCallCopyWith<$Res> {
  __$ToolCallCopyWithImpl(this._self, this._then);

  final _ToolCall _self;
  final $Res Function(_ToolCall) _then;

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? function = freezed,}) {
  return _then(_ToolCall(
function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as ToolCallFunction?,
  ));
}

/// Create a copy of ToolCall
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolCallFunctionCopyWith<$Res>? get function {
    if (_self.function == null) {
    return null;
  }

  return $ToolCallFunctionCopyWith<$Res>(_self.function!, (value) {
    return _then(_self.copyWith(function: value));
  });
}
}


/// @nodoc
mixin _$ToolCallFunction {

/// The name of the function to be called.
 String get name;/// The arguments to pass to the function.
 ToolCallFunctionArgs get arguments;
/// Create a copy of ToolCallFunction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolCallFunctionCopyWith<ToolCallFunction> get copyWith => _$ToolCallFunctionCopyWithImpl<ToolCallFunction>(this as ToolCallFunction, _$identity);

  /// Serializes this ToolCallFunction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolCallFunction&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.arguments, arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(arguments));

@override
String toString() {
  return 'ToolCallFunction(name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $ToolCallFunctionCopyWith<$Res>  {
  factory $ToolCallFunctionCopyWith(ToolCallFunction value, $Res Function(ToolCallFunction) _then) = _$ToolCallFunctionCopyWithImpl;
@useResult
$Res call({
 String name, ToolCallFunctionArgs arguments
});




}
/// @nodoc
class _$ToolCallFunctionCopyWithImpl<$Res>
    implements $ToolCallFunctionCopyWith<$Res> {
  _$ToolCallFunctionCopyWithImpl(this._self, this._then);

  final ToolCallFunction _self;
  final $Res Function(ToolCallFunction) _then;

/// Create a copy of ToolCallFunction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? arguments = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as ToolCallFunctionArgs,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolCallFunction].
extension ToolCallFunctionPatterns on ToolCallFunction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolCallFunction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolCallFunction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolCallFunction value)  $default,){
final _that = this;
switch (_that) {
case _ToolCallFunction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolCallFunction value)?  $default,){
final _that = this;
switch (_that) {
case _ToolCallFunction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ToolCallFunctionArgs arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolCallFunction() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ToolCallFunctionArgs arguments)  $default,) {final _that = this;
switch (_that) {
case _ToolCallFunction():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ToolCallFunctionArgs arguments)?  $default,) {final _that = this;
switch (_that) {
case _ToolCallFunction() when $default != null:
return $default(_that.name,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolCallFunction extends ToolCallFunction {
  const _ToolCallFunction({required this.name, required final  ToolCallFunctionArgs arguments}): _arguments = arguments,super._();
  factory _ToolCallFunction.fromJson(Map<String, dynamic> json) => _$ToolCallFunctionFromJson(json);

/// The name of the function to be called.
@override final  String name;
/// The arguments to pass to the function.
 final  ToolCallFunctionArgs _arguments;
/// The arguments to pass to the function.
@override ToolCallFunctionArgs get arguments {
  if (_arguments is EqualUnmodifiableMapView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_arguments);
}


/// Create a copy of ToolCallFunction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolCallFunctionCopyWith<_ToolCallFunction> get copyWith => __$ToolCallFunctionCopyWithImpl<_ToolCallFunction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolCallFunctionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolCallFunction&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'ToolCallFunction(name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$ToolCallFunctionCopyWith<$Res> implements $ToolCallFunctionCopyWith<$Res> {
  factory _$ToolCallFunctionCopyWith(_ToolCallFunction value, $Res Function(_ToolCallFunction) _then) = __$ToolCallFunctionCopyWithImpl;
@override @useResult
$Res call({
 String name, ToolCallFunctionArgs arguments
});




}
/// @nodoc
class __$ToolCallFunctionCopyWithImpl<$Res>
    implements _$ToolCallFunctionCopyWith<$Res> {
  __$ToolCallFunctionCopyWithImpl(this._self, this._then);

  final _ToolCallFunction _self;
  final $Res Function(_ToolCallFunction) _then;

/// Create a copy of ToolCallFunction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? arguments = null,}) {
  return _then(_ToolCallFunction(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as ToolCallFunctionArgs,
  ));
}


}


/// @nodoc
mixin _$GenerateEmbeddingRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// Text to generate embeddings for.
 String get prompt;/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@JsonKey(includeIfNull: false) RequestOptions? get options;/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@JsonKey(name: 'keep_alive', includeIfNull: false) int? get keepAlive;
/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateEmbeddingRequestCopyWith<GenerateEmbeddingRequest> get copyWith => _$GenerateEmbeddingRequestCopyWithImpl<GenerateEmbeddingRequest>(this as GenerateEmbeddingRequest, _$identity);

  /// Serializes this GenerateEmbeddingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateEmbeddingRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.options, options) || other.options == options)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,options,keepAlive);

@override
String toString() {
  return 'GenerateEmbeddingRequest(model: $model, prompt: $prompt, options: $options, keepAlive: $keepAlive)';
}


}

/// @nodoc
abstract mixin class $GenerateEmbeddingRequestCopyWith<$Res>  {
  factory $GenerateEmbeddingRequestCopyWith(GenerateEmbeddingRequest value, $Res Function(GenerateEmbeddingRequest) _then) = _$GenerateEmbeddingRequestCopyWithImpl;
@useResult
$Res call({
 String model, String prompt,@JsonKey(includeIfNull: false) RequestOptions? options,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive
});


$RequestOptionsCopyWith<$Res>? get options;

}
/// @nodoc
class _$GenerateEmbeddingRequestCopyWithImpl<$Res>
    implements $GenerateEmbeddingRequestCopyWith<$Res> {
  _$GenerateEmbeddingRequestCopyWithImpl(this._self, this._then);

  final GenerateEmbeddingRequest _self;
  final $Res Function(GenerateEmbeddingRequest) _then;

/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? prompt = null,Object? options = freezed,Object? keepAlive = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenerateEmbeddingRequest].
extension GenerateEmbeddingRequestPatterns on GenerateEmbeddingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateEmbeddingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateEmbeddingRequest value)  $default,){
final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateEmbeddingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  String prompt, @JsonKey(includeIfNull: false)  RequestOptions? options, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest() when $default != null:
return $default(_that.model,_that.prompt,_that.options,_that.keepAlive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  String prompt, @JsonKey(includeIfNull: false)  RequestOptions? options, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive)  $default,) {final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest():
return $default(_that.model,_that.prompt,_that.options,_that.keepAlive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  String prompt, @JsonKey(includeIfNull: false)  RequestOptions? options, @JsonKey(name: 'keep_alive', includeIfNull: false)  int? keepAlive)?  $default,) {final _that = this;
switch (_that) {
case _GenerateEmbeddingRequest() when $default != null:
return $default(_that.model,_that.prompt,_that.options,_that.keepAlive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateEmbeddingRequest extends GenerateEmbeddingRequest {
  const _GenerateEmbeddingRequest({required this.model, required this.prompt, @JsonKey(includeIfNull: false) this.options, @JsonKey(name: 'keep_alive', includeIfNull: false) this.keepAlive}): super._();
  factory _GenerateEmbeddingRequest.fromJson(Map<String, dynamic> json) => _$GenerateEmbeddingRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// Text to generate embeddings for.
@override final  String prompt;
/// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
@override@JsonKey(includeIfNull: false) final  RequestOptions? options;
/// How long (in minutes) to keep the model loaded in memory.
///
/// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
/// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
/// - If set to 0, the model will be unloaded immediately once finished.
/// - If not set, the model will stay loaded for 5 minutes by default
@override@JsonKey(name: 'keep_alive', includeIfNull: false) final  int? keepAlive;

/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateEmbeddingRequestCopyWith<_GenerateEmbeddingRequest> get copyWith => __$GenerateEmbeddingRequestCopyWithImpl<_GenerateEmbeddingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateEmbeddingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateEmbeddingRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.options, options) || other.options == options)&&(identical(other.keepAlive, keepAlive) || other.keepAlive == keepAlive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,options,keepAlive);

@override
String toString() {
  return 'GenerateEmbeddingRequest(model: $model, prompt: $prompt, options: $options, keepAlive: $keepAlive)';
}


}

/// @nodoc
abstract mixin class _$GenerateEmbeddingRequestCopyWith<$Res> implements $GenerateEmbeddingRequestCopyWith<$Res> {
  factory _$GenerateEmbeddingRequestCopyWith(_GenerateEmbeddingRequest value, $Res Function(_GenerateEmbeddingRequest) _then) = __$GenerateEmbeddingRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, String prompt,@JsonKey(includeIfNull: false) RequestOptions? options,@JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive
});


@override $RequestOptionsCopyWith<$Res>? get options;

}
/// @nodoc
class __$GenerateEmbeddingRequestCopyWithImpl<$Res>
    implements _$GenerateEmbeddingRequestCopyWith<$Res> {
  __$GenerateEmbeddingRequestCopyWithImpl(this._self, this._then);

  final _GenerateEmbeddingRequest _self;
  final $Res Function(_GenerateEmbeddingRequest) _then;

/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? prompt = null,Object? options = freezed,Object? keepAlive = freezed,}) {
  return _then(_GenerateEmbeddingRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as RequestOptions?,keepAlive: freezed == keepAlive ? _self.keepAlive : keepAlive // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of GenerateEmbeddingRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestOptionsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $RequestOptionsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}


/// @nodoc
mixin _$GenerateEmbeddingResponse {

/// The embedding for the prompt.
@JsonKey(includeIfNull: false) List<double>? get embedding;
/// Create a copy of GenerateEmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateEmbeddingResponseCopyWith<GenerateEmbeddingResponse> get copyWith => _$GenerateEmbeddingResponseCopyWithImpl<GenerateEmbeddingResponse>(this as GenerateEmbeddingResponse, _$identity);

  /// Serializes this GenerateEmbeddingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateEmbeddingResponse&&const DeepCollectionEquality().equals(other.embedding, embedding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(embedding));

@override
String toString() {
  return 'GenerateEmbeddingResponse(embedding: $embedding)';
}


}

/// @nodoc
abstract mixin class $GenerateEmbeddingResponseCopyWith<$Res>  {
  factory $GenerateEmbeddingResponseCopyWith(GenerateEmbeddingResponse value, $Res Function(GenerateEmbeddingResponse) _then) = _$GenerateEmbeddingResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) List<double>? embedding
});




}
/// @nodoc
class _$GenerateEmbeddingResponseCopyWithImpl<$Res>
    implements $GenerateEmbeddingResponseCopyWith<$Res> {
  _$GenerateEmbeddingResponseCopyWithImpl(this._self, this._then);

  final GenerateEmbeddingResponse _self;
  final $Res Function(GenerateEmbeddingResponse) _then;

/// Create a copy of GenerateEmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? embedding = freezed,}) {
  return _then(_self.copyWith(
embedding: freezed == embedding ? _self.embedding : embedding // ignore: cast_nullable_to_non_nullable
as List<double>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateEmbeddingResponse].
extension GenerateEmbeddingResponsePatterns on GenerateEmbeddingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateEmbeddingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateEmbeddingResponse value)  $default,){
final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateEmbeddingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<double>? embedding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse() when $default != null:
return $default(_that.embedding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<double>? embedding)  $default,) {final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse():
return $default(_that.embedding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  List<double>? embedding)?  $default,) {final _that = this;
switch (_that) {
case _GenerateEmbeddingResponse() when $default != null:
return $default(_that.embedding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateEmbeddingResponse extends GenerateEmbeddingResponse {
  const _GenerateEmbeddingResponse({@JsonKey(includeIfNull: false) final  List<double>? embedding}): _embedding = embedding,super._();
  factory _GenerateEmbeddingResponse.fromJson(Map<String, dynamic> json) => _$GenerateEmbeddingResponseFromJson(json);

/// The embedding for the prompt.
 final  List<double>? _embedding;
/// The embedding for the prompt.
@override@JsonKey(includeIfNull: false) List<double>? get embedding {
  final value = _embedding;
  if (value == null) return null;
  if (_embedding is EqualUnmodifiableListView) return _embedding;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GenerateEmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateEmbeddingResponseCopyWith<_GenerateEmbeddingResponse> get copyWith => __$GenerateEmbeddingResponseCopyWithImpl<_GenerateEmbeddingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateEmbeddingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateEmbeddingResponse&&const DeepCollectionEquality().equals(other._embedding, _embedding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_embedding));

@override
String toString() {
  return 'GenerateEmbeddingResponse(embedding: $embedding)';
}


}

/// @nodoc
abstract mixin class _$GenerateEmbeddingResponseCopyWith<$Res> implements $GenerateEmbeddingResponseCopyWith<$Res> {
  factory _$GenerateEmbeddingResponseCopyWith(_GenerateEmbeddingResponse value, $Res Function(_GenerateEmbeddingResponse) _then) = __$GenerateEmbeddingResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) List<double>? embedding
});




}
/// @nodoc
class __$GenerateEmbeddingResponseCopyWithImpl<$Res>
    implements _$GenerateEmbeddingResponseCopyWith<$Res> {
  __$GenerateEmbeddingResponseCopyWithImpl(this._self, this._then);

  final _GenerateEmbeddingResponse _self;
  final $Res Function(_GenerateEmbeddingResponse) _then;

/// Create a copy of GenerateEmbeddingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? embedding = freezed,}) {
  return _then(_GenerateEmbeddingResponse(
embedding: freezed == embedding ? _self._embedding : embedding // ignore: cast_nullable_to_non_nullable
as List<double>?,
  ));
}


}


/// @nodoc
mixin _$CreateModelRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// The contents of the Modelfile.
 String get modelfile;/// Path to the Modelfile (optional)
@JsonKey(includeIfNull: false) String? get path;/// The quantization level of the model.
@JsonKey(includeIfNull: false) String? get quantize;/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
 bool get stream;
/// Create a copy of CreateModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateModelRequestCopyWith<CreateModelRequest> get copyWith => _$CreateModelRequestCopyWithImpl<CreateModelRequest>(this as CreateModelRequest, _$identity);

  /// Serializes this CreateModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.modelfile, modelfile) || other.modelfile == modelfile)&&(identical(other.path, path) || other.path == path)&&(identical(other.quantize, quantize) || other.quantize == quantize)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,modelfile,path,quantize,stream);

@override
String toString() {
  return 'CreateModelRequest(model: $model, modelfile: $modelfile, path: $path, quantize: $quantize, stream: $stream)';
}


}

/// @nodoc
abstract mixin class $CreateModelRequestCopyWith<$Res>  {
  factory $CreateModelRequestCopyWith(CreateModelRequest value, $Res Function(CreateModelRequest) _then) = _$CreateModelRequestCopyWithImpl;
@useResult
$Res call({
 String model, String modelfile,@JsonKey(includeIfNull: false) String? path,@JsonKey(includeIfNull: false) String? quantize, bool stream
});




}
/// @nodoc
class _$CreateModelRequestCopyWithImpl<$Res>
    implements $CreateModelRequestCopyWith<$Res> {
  _$CreateModelRequestCopyWithImpl(this._self, this._then);

  final CreateModelRequest _self;
  final $Res Function(CreateModelRequest) _then;

/// Create a copy of CreateModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? modelfile = null,Object? path = freezed,Object? quantize = freezed,Object? stream = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,modelfile: null == modelfile ? _self.modelfile : modelfile // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,quantize: freezed == quantize ? _self.quantize : quantize // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateModelRequest].
extension CreateModelRequestPatterns on CreateModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  String modelfile, @JsonKey(includeIfNull: false)  String? path, @JsonKey(includeIfNull: false)  String? quantize,  bool stream)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateModelRequest() when $default != null:
return $default(_that.model,_that.modelfile,_that.path,_that.quantize,_that.stream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  String modelfile, @JsonKey(includeIfNull: false)  String? path, @JsonKey(includeIfNull: false)  String? quantize,  bool stream)  $default,) {final _that = this;
switch (_that) {
case _CreateModelRequest():
return $default(_that.model,_that.modelfile,_that.path,_that.quantize,_that.stream);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  String modelfile, @JsonKey(includeIfNull: false)  String? path, @JsonKey(includeIfNull: false)  String? quantize,  bool stream)?  $default,) {final _that = this;
switch (_that) {
case _CreateModelRequest() when $default != null:
return $default(_that.model,_that.modelfile,_that.path,_that.quantize,_that.stream);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateModelRequest extends CreateModelRequest {
  const _CreateModelRequest({required this.model, required this.modelfile, @JsonKey(includeIfNull: false) this.path, @JsonKey(includeIfNull: false) this.quantize, this.stream = false}): super._();
  factory _CreateModelRequest.fromJson(Map<String, dynamic> json) => _$CreateModelRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// The contents of the Modelfile.
@override final  String modelfile;
/// Path to the Modelfile (optional)
@override@JsonKey(includeIfNull: false) final  String? path;
/// The quantization level of the model.
@override@JsonKey(includeIfNull: false) final  String? quantize;
/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
@override@JsonKey() final  bool stream;

/// Create a copy of CreateModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateModelRequestCopyWith<_CreateModelRequest> get copyWith => __$CreateModelRequestCopyWithImpl<_CreateModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.modelfile, modelfile) || other.modelfile == modelfile)&&(identical(other.path, path) || other.path == path)&&(identical(other.quantize, quantize) || other.quantize == quantize)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,modelfile,path,quantize,stream);

@override
String toString() {
  return 'CreateModelRequest(model: $model, modelfile: $modelfile, path: $path, quantize: $quantize, stream: $stream)';
}


}

/// @nodoc
abstract mixin class _$CreateModelRequestCopyWith<$Res> implements $CreateModelRequestCopyWith<$Res> {
  factory _$CreateModelRequestCopyWith(_CreateModelRequest value, $Res Function(_CreateModelRequest) _then) = __$CreateModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, String modelfile,@JsonKey(includeIfNull: false) String? path,@JsonKey(includeIfNull: false) String? quantize, bool stream
});




}
/// @nodoc
class __$CreateModelRequestCopyWithImpl<$Res>
    implements _$CreateModelRequestCopyWith<$Res> {
  __$CreateModelRequestCopyWithImpl(this._self, this._then);

  final _CreateModelRequest _self;
  final $Res Function(_CreateModelRequest) _then;

/// Create a copy of CreateModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? modelfile = null,Object? path = freezed,Object? quantize = freezed,Object? stream = null,}) {
  return _then(_CreateModelRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,modelfile: null == modelfile ? _self.modelfile : modelfile // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,quantize: freezed == quantize ? _self.quantize : quantize // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CreateModelResponse {

/// Status creating the model
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CreateModelStatus? get status;
/// Create a copy of CreateModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateModelResponseCopyWith<CreateModelResponse> get copyWith => _$CreateModelResponseCopyWithImpl<CreateModelResponse>(this as CreateModelResponse, _$identity);

  /// Serializes this CreateModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateModelResponse&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'CreateModelResponse(status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateModelResponseCopyWith<$Res>  {
  factory $CreateModelResponseCopyWith(CreateModelResponse value, $Res Function(CreateModelResponse) _then) = _$CreateModelResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CreateModelStatus? status
});




}
/// @nodoc
class _$CreateModelResponseCopyWithImpl<$Res>
    implements $CreateModelResponseCopyWith<$Res> {
  _$CreateModelResponseCopyWithImpl(this._self, this._then);

  final CreateModelResponse _self;
  final $Res Function(CreateModelResponse) _then;

/// Create a copy of CreateModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateModelStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateModelResponse].
extension CreateModelResponsePatterns on CreateModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CreateModelStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateModelResponse() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CreateModelStatus? status)  $default,) {final _that = this;
switch (_that) {
case _CreateModelResponse():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CreateModelStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _CreateModelResponse() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateModelResponse extends CreateModelResponse {
  const _CreateModelResponse({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status}): super._();
  factory _CreateModelResponse.fromJson(Map<String, dynamic> json) => _$CreateModelResponseFromJson(json);

/// Status creating the model
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  CreateModelStatus? status;

/// Create a copy of CreateModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateModelResponseCopyWith<_CreateModelResponse> get copyWith => __$CreateModelResponseCopyWithImpl<_CreateModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateModelResponse&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'CreateModelResponse(status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateModelResponseCopyWith<$Res> implements $CreateModelResponseCopyWith<$Res> {
  factory _$CreateModelResponseCopyWith(_CreateModelResponse value, $Res Function(_CreateModelResponse) _then) = __$CreateModelResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CreateModelStatus? status
});




}
/// @nodoc
class __$CreateModelResponseCopyWithImpl<$Res>
    implements _$CreateModelResponseCopyWith<$Res> {
  __$CreateModelResponseCopyWithImpl(this._self, this._then);

  final _CreateModelResponse _self;
  final $Res Function(_CreateModelResponse) _then;

/// Create a copy of CreateModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_CreateModelResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateModelStatus?,
  ));
}


}


/// @nodoc
mixin _$ModelsResponse {

/// List of models available locally.
@JsonKey(includeIfNull: false) List<Model>? get models;
/// Create a copy of ModelsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelsResponseCopyWith<ModelsResponse> get copyWith => _$ModelsResponseCopyWithImpl<ModelsResponse>(this as ModelsResponse, _$identity);

  /// Serializes this ModelsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelsResponse&&const DeepCollectionEquality().equals(other.models, models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(models));

@override
String toString() {
  return 'ModelsResponse(models: $models)';
}


}

/// @nodoc
abstract mixin class $ModelsResponseCopyWith<$Res>  {
  factory $ModelsResponseCopyWith(ModelsResponse value, $Res Function(ModelsResponse) _then) = _$ModelsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) List<Model>? models
});




}
/// @nodoc
class _$ModelsResponseCopyWithImpl<$Res>
    implements $ModelsResponseCopyWith<$Res> {
  _$ModelsResponseCopyWithImpl(this._self, this._then);

  final ModelsResponse _self;
  final $Res Function(ModelsResponse) _then;

/// Create a copy of ModelsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? models = freezed,}) {
  return _then(_self.copyWith(
models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<Model>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelsResponse].
extension ModelsResponsePatterns on ModelsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ModelsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ModelsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<Model>? models)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelsResponse() when $default != null:
return $default(_that.models);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<Model>? models)  $default,) {final _that = this;
switch (_that) {
case _ModelsResponse():
return $default(_that.models);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  List<Model>? models)?  $default,) {final _that = this;
switch (_that) {
case _ModelsResponse() when $default != null:
return $default(_that.models);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelsResponse extends ModelsResponse {
  const _ModelsResponse({@JsonKey(includeIfNull: false) final  List<Model>? models}): _models = models,super._();
  factory _ModelsResponse.fromJson(Map<String, dynamic> json) => _$ModelsResponseFromJson(json);

/// List of models available locally.
 final  List<Model>? _models;
/// List of models available locally.
@override@JsonKey(includeIfNull: false) List<Model>? get models {
  final value = _models;
  if (value == null) return null;
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ModelsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelsResponseCopyWith<_ModelsResponse> get copyWith => __$ModelsResponseCopyWithImpl<_ModelsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelsResponse&&const DeepCollectionEquality().equals(other._models, _models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_models));

@override
String toString() {
  return 'ModelsResponse(models: $models)';
}


}

/// @nodoc
abstract mixin class _$ModelsResponseCopyWith<$Res> implements $ModelsResponseCopyWith<$Res> {
  factory _$ModelsResponseCopyWith(_ModelsResponse value, $Res Function(_ModelsResponse) _then) = __$ModelsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) List<Model>? models
});




}
/// @nodoc
class __$ModelsResponseCopyWithImpl<$Res>
    implements _$ModelsResponseCopyWith<$Res> {
  __$ModelsResponseCopyWithImpl(this._self, this._then);

  final _ModelsResponse _self;
  final $Res Function(_ModelsResponse) _then;

/// Create a copy of ModelsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? models = freezed,}) {
  return _then(_ModelsResponse(
models: freezed == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<Model>?,
  ));
}


}


/// @nodoc
mixin _$Model {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@JsonKey(includeIfNull: false) String? get model;/// Model modification date.
@JsonKey(name: 'modified_at', includeIfNull: false) String? get modifiedAt;/// Size of the model on disk.
@JsonKey(includeIfNull: false) int? get size;/// The model's digest.
@JsonKey(includeIfNull: false) String? get digest;/// Details about a model.
@JsonKey(includeIfNull: false) ModelDetails? get details;/// Name of the upstream remote model (when model is federated from another Ollama instance)
@JsonKey(name: 'remote_model', includeIfNull: false) String? get remoteModel;/// URL of the upstream Ollama host (when model is federated from another instance)
@JsonKey(name: 'remote_host', includeIfNull: false) String? get remoteHost;
/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelCopyWith<Model> get copyWith => _$ModelCopyWithImpl<Model>(this as Model, _$identity);

  /// Serializes this Model to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Model&&(identical(other.model, model) || other.model == model)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.details, details) || other.details == details)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,modifiedAt,size,digest,details,remoteModel,remoteHost);

@override
String toString() {
  return 'Model(model: $model, modifiedAt: $modifiedAt, size: $size, digest: $digest, details: $details, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class $ModelCopyWith<$Res>  {
  factory $ModelCopyWith(Model value, $Res Function(Model) _then) = _$ModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,@JsonKey(includeIfNull: false) int? size,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


$ModelDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class _$ModelCopyWithImpl<$Res>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._self, this._then);

  final Model _self;
  final $Res Function(Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = freezed,Object? modifiedAt = freezed,Object? size = freezed,Object? digest = freezed,Object? details = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_self.copyWith(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.model,_that.modifiedAt,_that.size,_that.digest,_that.details,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)  $default,) {final _that = this;
switch (_that) {
case _Model():
return $default(_that.model,_that.modifiedAt,_that.size,_that.digest,_that.details,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,) {final _that = this;
switch (_that) {
case _Model() when $default != null:
return $default(_that.model,_that.modifiedAt,_that.size,_that.digest,_that.details,_that.remoteModel,_that.remoteHost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Model extends Model {
  const _Model({@JsonKey(includeIfNull: false) this.model, @JsonKey(name: 'modified_at', includeIfNull: false) this.modifiedAt, @JsonKey(includeIfNull: false) this.size, @JsonKey(includeIfNull: false) this.digest, @JsonKey(includeIfNull: false) this.details, @JsonKey(name: 'remote_model', includeIfNull: false) this.remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false) this.remoteHost}): super._();
  factory _Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override@JsonKey(includeIfNull: false) final  String? model;
/// Model modification date.
@override@JsonKey(name: 'modified_at', includeIfNull: false) final  String? modifiedAt;
/// Size of the model on disk.
@override@JsonKey(includeIfNull: false) final  int? size;
/// The model's digest.
@override@JsonKey(includeIfNull: false) final  String? digest;
/// Details about a model.
@override@JsonKey(includeIfNull: false) final  ModelDetails? details;
/// Name of the upstream remote model (when model is federated from another Ollama instance)
@override@JsonKey(name: 'remote_model', includeIfNull: false) final  String? remoteModel;
/// URL of the upstream Ollama host (when model is federated from another instance)
@override@JsonKey(name: 'remote_host', includeIfNull: false) final  String? remoteHost;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Model&&(identical(other.model, model) || other.model == model)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.size, size) || other.size == size)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.details, details) || other.details == details)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,modifiedAt,size,digest,details,remoteModel,remoteHost);

@override
String toString() {
  return 'Model(model: $model, modifiedAt: $modifiedAt, size: $size, digest: $digest, details: $details, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class _$ModelCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$ModelCopyWith(_Model value, $Res Function(_Model) _then) = __$ModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,@JsonKey(includeIfNull: false) int? size,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


@override $ModelDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class __$ModelCopyWithImpl<$Res>
    implements _$ModelCopyWith<$Res> {
  __$ModelCopyWithImpl(this._self, this._then);

  final _Model _self;
  final $Res Function(_Model) _then;

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = freezed,Object? modifiedAt = freezed,Object? size = freezed,Object? digest = freezed,Object? details = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_Model(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Model
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// @nodoc
mixin _$ModelDetails {

/// The parent model of the model.
@JsonKey(name: 'parent_model', includeIfNull: false) String? get parentModel;/// The format of the model.
@JsonKey(includeIfNull: false) String? get format;/// The family of the model.
@JsonKey(includeIfNull: false) String? get family;/// The families of the model.
@JsonKey(includeIfNull: false) List<String>? get families;/// The size of the model's parameters.
@JsonKey(name: 'parameter_size', includeIfNull: false) String? get parameterSize;/// The quantization level of the model.
@JsonKey(name: 'quantization_level', includeIfNull: false) String? get quantizationLevel;
/// Create a copy of ModelDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<ModelDetails> get copyWith => _$ModelDetailsCopyWithImpl<ModelDetails>(this as ModelDetails, _$identity);

  /// Serializes this ModelDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelDetails&&(identical(other.parentModel, parentModel) || other.parentModel == parentModel)&&(identical(other.format, format) || other.format == format)&&(identical(other.family, family) || other.family == family)&&const DeepCollectionEquality().equals(other.families, families)&&(identical(other.parameterSize, parameterSize) || other.parameterSize == parameterSize)&&(identical(other.quantizationLevel, quantizationLevel) || other.quantizationLevel == quantizationLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parentModel,format,family,const DeepCollectionEquality().hash(families),parameterSize,quantizationLevel);

@override
String toString() {
  return 'ModelDetails(parentModel: $parentModel, format: $format, family: $family, families: $families, parameterSize: $parameterSize, quantizationLevel: $quantizationLevel)';
}


}

/// @nodoc
abstract mixin class $ModelDetailsCopyWith<$Res>  {
  factory $ModelDetailsCopyWith(ModelDetails value, $Res Function(ModelDetails) _then) = _$ModelDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'parent_model', includeIfNull: false) String? parentModel,@JsonKey(includeIfNull: false) String? format,@JsonKey(includeIfNull: false) String? family,@JsonKey(includeIfNull: false) List<String>? families,@JsonKey(name: 'parameter_size', includeIfNull: false) String? parameterSize,@JsonKey(name: 'quantization_level', includeIfNull: false) String? quantizationLevel
});




}
/// @nodoc
class _$ModelDetailsCopyWithImpl<$Res>
    implements $ModelDetailsCopyWith<$Res> {
  _$ModelDetailsCopyWithImpl(this._self, this._then);

  final ModelDetails _self;
  final $Res Function(ModelDetails) _then;

/// Create a copy of ModelDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parentModel = freezed,Object? format = freezed,Object? family = freezed,Object? families = freezed,Object? parameterSize = freezed,Object? quantizationLevel = freezed,}) {
  return _then(_self.copyWith(
parentModel: freezed == parentModel ? _self.parentModel : parentModel // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,families: freezed == families ? _self.families : families // ignore: cast_nullable_to_non_nullable
as List<String>?,parameterSize: freezed == parameterSize ? _self.parameterSize : parameterSize // ignore: cast_nullable_to_non_nullable
as String?,quantizationLevel: freezed == quantizationLevel ? _self.quantizationLevel : quantizationLevel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelDetails].
extension ModelDetailsPatterns on ModelDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelDetails value)  $default,){
final _that = this;
switch (_that) {
case _ModelDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ModelDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'parent_model', includeIfNull: false)  String? parentModel, @JsonKey(includeIfNull: false)  String? format, @JsonKey(includeIfNull: false)  String? family, @JsonKey(includeIfNull: false)  List<String>? families, @JsonKey(name: 'parameter_size', includeIfNull: false)  String? parameterSize, @JsonKey(name: 'quantization_level', includeIfNull: false)  String? quantizationLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelDetails() when $default != null:
return $default(_that.parentModel,_that.format,_that.family,_that.families,_that.parameterSize,_that.quantizationLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'parent_model', includeIfNull: false)  String? parentModel, @JsonKey(includeIfNull: false)  String? format, @JsonKey(includeIfNull: false)  String? family, @JsonKey(includeIfNull: false)  List<String>? families, @JsonKey(name: 'parameter_size', includeIfNull: false)  String? parameterSize, @JsonKey(name: 'quantization_level', includeIfNull: false)  String? quantizationLevel)  $default,) {final _that = this;
switch (_that) {
case _ModelDetails():
return $default(_that.parentModel,_that.format,_that.family,_that.families,_that.parameterSize,_that.quantizationLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'parent_model', includeIfNull: false)  String? parentModel, @JsonKey(includeIfNull: false)  String? format, @JsonKey(includeIfNull: false)  String? family, @JsonKey(includeIfNull: false)  List<String>? families, @JsonKey(name: 'parameter_size', includeIfNull: false)  String? parameterSize, @JsonKey(name: 'quantization_level', includeIfNull: false)  String? quantizationLevel)?  $default,) {final _that = this;
switch (_that) {
case _ModelDetails() when $default != null:
return $default(_that.parentModel,_that.format,_that.family,_that.families,_that.parameterSize,_that.quantizationLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelDetails extends ModelDetails {
  const _ModelDetails({@JsonKey(name: 'parent_model', includeIfNull: false) this.parentModel, @JsonKey(includeIfNull: false) this.format, @JsonKey(includeIfNull: false) this.family, @JsonKey(includeIfNull: false) final  List<String>? families, @JsonKey(name: 'parameter_size', includeIfNull: false) this.parameterSize, @JsonKey(name: 'quantization_level', includeIfNull: false) this.quantizationLevel}): _families = families,super._();
  factory _ModelDetails.fromJson(Map<String, dynamic> json) => _$ModelDetailsFromJson(json);

/// The parent model of the model.
@override@JsonKey(name: 'parent_model', includeIfNull: false) final  String? parentModel;
/// The format of the model.
@override@JsonKey(includeIfNull: false) final  String? format;
/// The family of the model.
@override@JsonKey(includeIfNull: false) final  String? family;
/// The families of the model.
 final  List<String>? _families;
/// The families of the model.
@override@JsonKey(includeIfNull: false) List<String>? get families {
  final value = _families;
  if (value == null) return null;
  if (_families is EqualUnmodifiableListView) return _families;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// The size of the model's parameters.
@override@JsonKey(name: 'parameter_size', includeIfNull: false) final  String? parameterSize;
/// The quantization level of the model.
@override@JsonKey(name: 'quantization_level', includeIfNull: false) final  String? quantizationLevel;

/// Create a copy of ModelDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelDetailsCopyWith<_ModelDetails> get copyWith => __$ModelDetailsCopyWithImpl<_ModelDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelDetails&&(identical(other.parentModel, parentModel) || other.parentModel == parentModel)&&(identical(other.format, format) || other.format == format)&&(identical(other.family, family) || other.family == family)&&const DeepCollectionEquality().equals(other._families, _families)&&(identical(other.parameterSize, parameterSize) || other.parameterSize == parameterSize)&&(identical(other.quantizationLevel, quantizationLevel) || other.quantizationLevel == quantizationLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,parentModel,format,family,const DeepCollectionEquality().hash(_families),parameterSize,quantizationLevel);

@override
String toString() {
  return 'ModelDetails(parentModel: $parentModel, format: $format, family: $family, families: $families, parameterSize: $parameterSize, quantizationLevel: $quantizationLevel)';
}


}

/// @nodoc
abstract mixin class _$ModelDetailsCopyWith<$Res> implements $ModelDetailsCopyWith<$Res> {
  factory _$ModelDetailsCopyWith(_ModelDetails value, $Res Function(_ModelDetails) _then) = __$ModelDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'parent_model', includeIfNull: false) String? parentModel,@JsonKey(includeIfNull: false) String? format,@JsonKey(includeIfNull: false) String? family,@JsonKey(includeIfNull: false) List<String>? families,@JsonKey(name: 'parameter_size', includeIfNull: false) String? parameterSize,@JsonKey(name: 'quantization_level', includeIfNull: false) String? quantizationLevel
});




}
/// @nodoc
class __$ModelDetailsCopyWithImpl<$Res>
    implements _$ModelDetailsCopyWith<$Res> {
  __$ModelDetailsCopyWithImpl(this._self, this._then);

  final _ModelDetails _self;
  final $Res Function(_ModelDetails) _then;

/// Create a copy of ModelDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parentModel = freezed,Object? format = freezed,Object? family = freezed,Object? families = freezed,Object? parameterSize = freezed,Object? quantizationLevel = freezed,}) {
  return _then(_ModelDetails(
parentModel: freezed == parentModel ? _self.parentModel : parentModel // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,families: freezed == families ? _self._families : families // ignore: cast_nullable_to_non_nullable
as List<String>?,parameterSize: freezed == parameterSize ? _self.parameterSize : parameterSize // ignore: cast_nullable_to_non_nullable
as String?,quantizationLevel: freezed == quantizationLevel ? _self.quantizationLevel : quantizationLevel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ModelInformation {

/// The architecture of the model.
@JsonKey(name: 'general.architecture', includeIfNull: false) String? get generalArchitecture;/// The file type of the model.
@JsonKey(name: 'general.file_type', includeIfNull: false) int? get generalFileType;/// The number of parameters in the model.
@JsonKey(name: 'general.parameter_count', includeIfNull: false) int? get generalParameterCount;/// The number of parameters in the model.
@JsonKey(name: 'general.quantization_version', includeIfNull: false) int? get generalQuantizationVersion;
/// Create a copy of ModelInformation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelInformationCopyWith<ModelInformation> get copyWith => _$ModelInformationCopyWithImpl<ModelInformation>(this as ModelInformation, _$identity);

  /// Serializes this ModelInformation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelInformation&&(identical(other.generalArchitecture, generalArchitecture) || other.generalArchitecture == generalArchitecture)&&(identical(other.generalFileType, generalFileType) || other.generalFileType == generalFileType)&&(identical(other.generalParameterCount, generalParameterCount) || other.generalParameterCount == generalParameterCount)&&(identical(other.generalQuantizationVersion, generalQuantizationVersion) || other.generalQuantizationVersion == generalQuantizationVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,generalArchitecture,generalFileType,generalParameterCount,generalQuantizationVersion);

@override
String toString() {
  return 'ModelInformation(generalArchitecture: $generalArchitecture, generalFileType: $generalFileType, generalParameterCount: $generalParameterCount, generalQuantizationVersion: $generalQuantizationVersion)';
}


}

/// @nodoc
abstract mixin class $ModelInformationCopyWith<$Res>  {
  factory $ModelInformationCopyWith(ModelInformation value, $Res Function(ModelInformation) _then) = _$ModelInformationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'general.architecture', includeIfNull: false) String? generalArchitecture,@JsonKey(name: 'general.file_type', includeIfNull: false) int? generalFileType,@JsonKey(name: 'general.parameter_count', includeIfNull: false) int? generalParameterCount,@JsonKey(name: 'general.quantization_version', includeIfNull: false) int? generalQuantizationVersion
});




}
/// @nodoc
class _$ModelInformationCopyWithImpl<$Res>
    implements $ModelInformationCopyWith<$Res> {
  _$ModelInformationCopyWithImpl(this._self, this._then);

  final ModelInformation _self;
  final $Res Function(ModelInformation) _then;

/// Create a copy of ModelInformation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generalArchitecture = freezed,Object? generalFileType = freezed,Object? generalParameterCount = freezed,Object? generalQuantizationVersion = freezed,}) {
  return _then(_self.copyWith(
generalArchitecture: freezed == generalArchitecture ? _self.generalArchitecture : generalArchitecture // ignore: cast_nullable_to_non_nullable
as String?,generalFileType: freezed == generalFileType ? _self.generalFileType : generalFileType // ignore: cast_nullable_to_non_nullable
as int?,generalParameterCount: freezed == generalParameterCount ? _self.generalParameterCount : generalParameterCount // ignore: cast_nullable_to_non_nullable
as int?,generalQuantizationVersion: freezed == generalQuantizationVersion ? _self.generalQuantizationVersion : generalQuantizationVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelInformation].
extension ModelInformationPatterns on ModelInformation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelInformation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelInformation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelInformation value)  $default,){
final _that = this;
switch (_that) {
case _ModelInformation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelInformation value)?  $default,){
final _that = this;
switch (_that) {
case _ModelInformation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'general.architecture', includeIfNull: false)  String? generalArchitecture, @JsonKey(name: 'general.file_type', includeIfNull: false)  int? generalFileType, @JsonKey(name: 'general.parameter_count', includeIfNull: false)  int? generalParameterCount, @JsonKey(name: 'general.quantization_version', includeIfNull: false)  int? generalQuantizationVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelInformation() when $default != null:
return $default(_that.generalArchitecture,_that.generalFileType,_that.generalParameterCount,_that.generalQuantizationVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'general.architecture', includeIfNull: false)  String? generalArchitecture, @JsonKey(name: 'general.file_type', includeIfNull: false)  int? generalFileType, @JsonKey(name: 'general.parameter_count', includeIfNull: false)  int? generalParameterCount, @JsonKey(name: 'general.quantization_version', includeIfNull: false)  int? generalQuantizationVersion)  $default,) {final _that = this;
switch (_that) {
case _ModelInformation():
return $default(_that.generalArchitecture,_that.generalFileType,_that.generalParameterCount,_that.generalQuantizationVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'general.architecture', includeIfNull: false)  String? generalArchitecture, @JsonKey(name: 'general.file_type', includeIfNull: false)  int? generalFileType, @JsonKey(name: 'general.parameter_count', includeIfNull: false)  int? generalParameterCount, @JsonKey(name: 'general.quantization_version', includeIfNull: false)  int? generalQuantizationVersion)?  $default,) {final _that = this;
switch (_that) {
case _ModelInformation() when $default != null:
return $default(_that.generalArchitecture,_that.generalFileType,_that.generalParameterCount,_that.generalQuantizationVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelInformation extends ModelInformation {
  const _ModelInformation({@JsonKey(name: 'general.architecture', includeIfNull: false) this.generalArchitecture, @JsonKey(name: 'general.file_type', includeIfNull: false) this.generalFileType, @JsonKey(name: 'general.parameter_count', includeIfNull: false) this.generalParameterCount, @JsonKey(name: 'general.quantization_version', includeIfNull: false) this.generalQuantizationVersion}): super._();
  factory _ModelInformation.fromJson(Map<String, dynamic> json) => _$ModelInformationFromJson(json);

/// The architecture of the model.
@override@JsonKey(name: 'general.architecture', includeIfNull: false) final  String? generalArchitecture;
/// The file type of the model.
@override@JsonKey(name: 'general.file_type', includeIfNull: false) final  int? generalFileType;
/// The number of parameters in the model.
@override@JsonKey(name: 'general.parameter_count', includeIfNull: false) final  int? generalParameterCount;
/// The number of parameters in the model.
@override@JsonKey(name: 'general.quantization_version', includeIfNull: false) final  int? generalQuantizationVersion;

/// Create a copy of ModelInformation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelInformationCopyWith<_ModelInformation> get copyWith => __$ModelInformationCopyWithImpl<_ModelInformation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelInformationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelInformation&&(identical(other.generalArchitecture, generalArchitecture) || other.generalArchitecture == generalArchitecture)&&(identical(other.generalFileType, generalFileType) || other.generalFileType == generalFileType)&&(identical(other.generalParameterCount, generalParameterCount) || other.generalParameterCount == generalParameterCount)&&(identical(other.generalQuantizationVersion, generalQuantizationVersion) || other.generalQuantizationVersion == generalQuantizationVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,generalArchitecture,generalFileType,generalParameterCount,generalQuantizationVersion);

@override
String toString() {
  return 'ModelInformation(generalArchitecture: $generalArchitecture, generalFileType: $generalFileType, generalParameterCount: $generalParameterCount, generalQuantizationVersion: $generalQuantizationVersion)';
}


}

/// @nodoc
abstract mixin class _$ModelInformationCopyWith<$Res> implements $ModelInformationCopyWith<$Res> {
  factory _$ModelInformationCopyWith(_ModelInformation value, $Res Function(_ModelInformation) _then) = __$ModelInformationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'general.architecture', includeIfNull: false) String? generalArchitecture,@JsonKey(name: 'general.file_type', includeIfNull: false) int? generalFileType,@JsonKey(name: 'general.parameter_count', includeIfNull: false) int? generalParameterCount,@JsonKey(name: 'general.quantization_version', includeIfNull: false) int? generalQuantizationVersion
});




}
/// @nodoc
class __$ModelInformationCopyWithImpl<$Res>
    implements _$ModelInformationCopyWith<$Res> {
  __$ModelInformationCopyWithImpl(this._self, this._then);

  final _ModelInformation _self;
  final $Res Function(_ModelInformation) _then;

/// Create a copy of ModelInformation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generalArchitecture = freezed,Object? generalFileType = freezed,Object? generalParameterCount = freezed,Object? generalQuantizationVersion = freezed,}) {
  return _then(_ModelInformation(
generalArchitecture: freezed == generalArchitecture ? _self.generalArchitecture : generalArchitecture // ignore: cast_nullable_to_non_nullable
as String?,generalFileType: freezed == generalFileType ? _self.generalFileType : generalFileType // ignore: cast_nullable_to_non_nullable
as int?,generalParameterCount: freezed == generalParameterCount ? _self.generalParameterCount : generalParameterCount // ignore: cast_nullable_to_non_nullable
as int?,generalQuantizationVersion: freezed == generalQuantizationVersion ? _self.generalQuantizationVersion : generalQuantizationVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Tensor {

/// The name of the tensor.
@JsonKey(includeIfNull: false) String? get name;/// The type of the tensor.
@JsonKey(includeIfNull: false) String? get type;/// The shape of the tensor.
@JsonKey(includeIfNull: false) List<int>? get shape;
/// Create a copy of Tensor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TensorCopyWith<Tensor> get copyWith => _$TensorCopyWithImpl<Tensor>(this as Tensor, _$identity);

  /// Serializes this Tensor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tensor&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.shape, shape));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,const DeepCollectionEquality().hash(shape));

@override
String toString() {
  return 'Tensor(name: $name, type: $type, shape: $shape)';
}


}

/// @nodoc
abstract mixin class $TensorCopyWith<$Res>  {
  factory $TensorCopyWith(Tensor value, $Res Function(Tensor) _then) = _$TensorCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? type,@JsonKey(includeIfNull: false) List<int>? shape
});




}
/// @nodoc
class _$TensorCopyWithImpl<$Res>
    implements $TensorCopyWith<$Res> {
  _$TensorCopyWithImpl(this._self, this._then);

  final Tensor _self;
  final $Res Function(Tensor) _then;

/// Create a copy of Tensor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? type = freezed,Object? shape = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,shape: freezed == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tensor].
extension TensorPatterns on Tensor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tensor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tensor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tensor value)  $default,){
final _that = this;
switch (_that) {
case _Tensor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tensor value)?  $default,){
final _that = this;
switch (_that) {
case _Tensor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  List<int>? shape)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tensor() when $default != null:
return $default(_that.name,_that.type,_that.shape);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  List<int>? shape)  $default,) {final _that = this;
switch (_that) {
case _Tensor():
return $default(_that.name,_that.type,_that.shape);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? type, @JsonKey(includeIfNull: false)  List<int>? shape)?  $default,) {final _that = this;
switch (_that) {
case _Tensor() when $default != null:
return $default(_that.name,_that.type,_that.shape);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tensor extends Tensor {
  const _Tensor({@JsonKey(includeIfNull: false) this.name, @JsonKey(includeIfNull: false) this.type, @JsonKey(includeIfNull: false) final  List<int>? shape}): _shape = shape,super._();
  factory _Tensor.fromJson(Map<String, dynamic> json) => _$TensorFromJson(json);

/// The name of the tensor.
@override@JsonKey(includeIfNull: false) final  String? name;
/// The type of the tensor.
@override@JsonKey(includeIfNull: false) final  String? type;
/// The shape of the tensor.
 final  List<int>? _shape;
/// The shape of the tensor.
@override@JsonKey(includeIfNull: false) List<int>? get shape {
  final value = _shape;
  if (value == null) return null;
  if (_shape is EqualUnmodifiableListView) return _shape;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Tensor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TensorCopyWith<_Tensor> get copyWith => __$TensorCopyWithImpl<_Tensor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TensorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tensor&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._shape, _shape));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,const DeepCollectionEquality().hash(_shape));

@override
String toString() {
  return 'Tensor(name: $name, type: $type, shape: $shape)';
}


}

/// @nodoc
abstract mixin class _$TensorCopyWith<$Res> implements $TensorCopyWith<$Res> {
  factory _$TensorCopyWith(_Tensor value, $Res Function(_Tensor) _then) = __$TensorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? type,@JsonKey(includeIfNull: false) List<int>? shape
});




}
/// @nodoc
class __$TensorCopyWithImpl<$Res>
    implements _$TensorCopyWith<$Res> {
  __$TensorCopyWithImpl(this._self, this._then);

  final _Tensor _self;
  final $Res Function(_Tensor) _then;

/// Create a copy of Tensor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? type = freezed,Object? shape = freezed,}) {
  return _then(_Tensor(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,shape: freezed == shape ? _self._shape : shape // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}


/// @nodoc
mixin _$ProcessResponse {

/// List of running models.
@JsonKey(includeIfNull: false) List<ProcessModel>? get models;
/// Create a copy of ProcessResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessResponseCopyWith<ProcessResponse> get copyWith => _$ProcessResponseCopyWithImpl<ProcessResponse>(this as ProcessResponse, _$identity);

  /// Serializes this ProcessResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessResponse&&const DeepCollectionEquality().equals(other.models, models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(models));

@override
String toString() {
  return 'ProcessResponse(models: $models)';
}


}

/// @nodoc
abstract mixin class $ProcessResponseCopyWith<$Res>  {
  factory $ProcessResponseCopyWith(ProcessResponse value, $Res Function(ProcessResponse) _then) = _$ProcessResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) List<ProcessModel>? models
});




}
/// @nodoc
class _$ProcessResponseCopyWithImpl<$Res>
    implements $ProcessResponseCopyWith<$Res> {
  _$ProcessResponseCopyWithImpl(this._self, this._then);

  final ProcessResponse _self;
  final $Res Function(ProcessResponse) _then;

/// Create a copy of ProcessResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? models = freezed,}) {
  return _then(_self.copyWith(
models: freezed == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<ProcessModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessResponse].
extension ProcessResponsePatterns on ProcessResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProcessResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<ProcessModel>? models)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessResponse() when $default != null:
return $default(_that.models);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<ProcessModel>? models)  $default,) {final _that = this;
switch (_that) {
case _ProcessResponse():
return $default(_that.models);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  List<ProcessModel>? models)?  $default,) {final _that = this;
switch (_that) {
case _ProcessResponse() when $default != null:
return $default(_that.models);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessResponse extends ProcessResponse {
  const _ProcessResponse({@JsonKey(includeIfNull: false) final  List<ProcessModel>? models}): _models = models,super._();
  factory _ProcessResponse.fromJson(Map<String, dynamic> json) => _$ProcessResponseFromJson(json);

/// List of running models.
 final  List<ProcessModel>? _models;
/// List of running models.
@override@JsonKey(includeIfNull: false) List<ProcessModel>? get models {
  final value = _models;
  if (value == null) return null;
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProcessResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessResponseCopyWith<_ProcessResponse> get copyWith => __$ProcessResponseCopyWithImpl<_ProcessResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessResponse&&const DeepCollectionEquality().equals(other._models, _models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_models));

@override
String toString() {
  return 'ProcessResponse(models: $models)';
}


}

/// @nodoc
abstract mixin class _$ProcessResponseCopyWith<$Res> implements $ProcessResponseCopyWith<$Res> {
  factory _$ProcessResponseCopyWith(_ProcessResponse value, $Res Function(_ProcessResponse) _then) = __$ProcessResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) List<ProcessModel>? models
});




}
/// @nodoc
class __$ProcessResponseCopyWithImpl<$Res>
    implements _$ProcessResponseCopyWith<$Res> {
  __$ProcessResponseCopyWithImpl(this._self, this._then);

  final _ProcessResponse _self;
  final $Res Function(_ProcessResponse) _then;

/// Create a copy of ProcessResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? models = freezed,}) {
  return _then(_ProcessResponse(
models: freezed == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<ProcessModel>?,
  ));
}


}


/// @nodoc
mixin _$ProcessModel {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@JsonKey(includeIfNull: false) String? get model;/// Size of the model on disk.
@JsonKey(includeIfNull: false) int? get size;/// The model's digest.
@JsonKey(includeIfNull: false) String? get digest;/// Details about a model.
@JsonKey(includeIfNull: false) ModelDetails? get details;/// No Description
@JsonKey(name: 'expires_at', includeIfNull: false) String? get expiresAt;/// Size of the model on disk.
@JsonKey(name: 'size_vram', includeIfNull: false) int? get sizeVram;
/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessModelCopyWith<ProcessModel> get copyWith => _$ProcessModelCopyWithImpl<ProcessModel>(this as ProcessModel, _$identity);

  /// Serializes this ProcessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessModel&&(identical(other.model, model) || other.model == model)&&(identical(other.size, size) || other.size == size)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.details, details) || other.details == details)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sizeVram, sizeVram) || other.sizeVram == sizeVram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,size,digest,details,expiresAt,sizeVram);

@override
String toString() {
  return 'ProcessModel(model: $model, size: $size, digest: $digest, details: $details, expiresAt: $expiresAt, sizeVram: $sizeVram)';
}


}

/// @nodoc
abstract mixin class $ProcessModelCopyWith<$Res>  {
  factory $ProcessModelCopyWith(ProcessModel value, $Res Function(ProcessModel) _then) = _$ProcessModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(includeIfNull: false) int? size,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(name: 'expires_at', includeIfNull: false) String? expiresAt,@JsonKey(name: 'size_vram', includeIfNull: false) int? sizeVram
});


$ModelDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class _$ProcessModelCopyWithImpl<$Res>
    implements $ProcessModelCopyWith<$Res> {
  _$ProcessModelCopyWithImpl(this._self, this._then);

  final ProcessModel _self;
  final $Res Function(ProcessModel) _then;

/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = freezed,Object? size = freezed,Object? digest = freezed,Object? details = freezed,Object? expiresAt = freezed,Object? sizeVram = freezed,}) {
  return _then(_self.copyWith(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,sizeVram: freezed == sizeVram ? _self.sizeVram : sizeVram // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProcessModel].
extension ProcessModelPatterns on ProcessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessModel value)  $default,){
final _that = this;
switch (_that) {
case _ProcessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'expires_at', includeIfNull: false)  String? expiresAt, @JsonKey(name: 'size_vram', includeIfNull: false)  int? sizeVram)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessModel() when $default != null:
return $default(_that.model,_that.size,_that.digest,_that.details,_that.expiresAt,_that.sizeVram);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'expires_at', includeIfNull: false)  String? expiresAt, @JsonKey(name: 'size_vram', includeIfNull: false)  int? sizeVram)  $default,) {final _that = this;
switch (_that) {
case _ProcessModel():
return $default(_that.model,_that.size,_that.digest,_that.details,_that.expiresAt,_that.sizeVram);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? model, @JsonKey(includeIfNull: false)  int? size, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(name: 'expires_at', includeIfNull: false)  String? expiresAt, @JsonKey(name: 'size_vram', includeIfNull: false)  int? sizeVram)?  $default,) {final _that = this;
switch (_that) {
case _ProcessModel() when $default != null:
return $default(_that.model,_that.size,_that.digest,_that.details,_that.expiresAt,_that.sizeVram);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessModel extends ProcessModel {
  const _ProcessModel({@JsonKey(includeIfNull: false) this.model, @JsonKey(includeIfNull: false) this.size, @JsonKey(includeIfNull: false) this.digest, @JsonKey(includeIfNull: false) this.details, @JsonKey(name: 'expires_at', includeIfNull: false) this.expiresAt, @JsonKey(name: 'size_vram', includeIfNull: false) this.sizeVram}): super._();
  factory _ProcessModel.fromJson(Map<String, dynamic> json) => _$ProcessModelFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override@JsonKey(includeIfNull: false) final  String? model;
/// Size of the model on disk.
@override@JsonKey(includeIfNull: false) final  int? size;
/// The model's digest.
@override@JsonKey(includeIfNull: false) final  String? digest;
/// Details about a model.
@override@JsonKey(includeIfNull: false) final  ModelDetails? details;
/// No Description
@override@JsonKey(name: 'expires_at', includeIfNull: false) final  String? expiresAt;
/// Size of the model on disk.
@override@JsonKey(name: 'size_vram', includeIfNull: false) final  int? sizeVram;

/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessModelCopyWith<_ProcessModel> get copyWith => __$ProcessModelCopyWithImpl<_ProcessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessModel&&(identical(other.model, model) || other.model == model)&&(identical(other.size, size) || other.size == size)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.details, details) || other.details == details)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sizeVram, sizeVram) || other.sizeVram == sizeVram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,size,digest,details,expiresAt,sizeVram);

@override
String toString() {
  return 'ProcessModel(model: $model, size: $size, digest: $digest, details: $details, expiresAt: $expiresAt, sizeVram: $sizeVram)';
}


}

/// @nodoc
abstract mixin class _$ProcessModelCopyWith<$Res> implements $ProcessModelCopyWith<$Res> {
  factory _$ProcessModelCopyWith(_ProcessModel value, $Res Function(_ProcessModel) _then) = __$ProcessModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? model,@JsonKey(includeIfNull: false) int? size,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(name: 'expires_at', includeIfNull: false) String? expiresAt,@JsonKey(name: 'size_vram', includeIfNull: false) int? sizeVram
});


@override $ModelDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class __$ProcessModelCopyWithImpl<$Res>
    implements _$ProcessModelCopyWith<$Res> {
  __$ProcessModelCopyWithImpl(this._self, this._then);

  final _ProcessModel _self;
  final $Res Function(_ProcessModel) _then;

/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = freezed,Object? size = freezed,Object? digest = freezed,Object? details = freezed,Object? expiresAt = freezed,Object? sizeVram = freezed,}) {
  return _then(_ProcessModel(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,sizeVram: freezed == sizeVram ? _self.sizeVram : sizeVram // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ProcessModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// @nodoc
mixin _$ModelInfoRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;
/// Create a copy of ModelInfoRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelInfoRequestCopyWith<ModelInfoRequest> get copyWith => _$ModelInfoRequestCopyWithImpl<ModelInfoRequest>(this as ModelInfoRequest, _$identity);

  /// Serializes this ModelInfoRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelInfoRequest&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'ModelInfoRequest(model: $model)';
}


}

/// @nodoc
abstract mixin class $ModelInfoRequestCopyWith<$Res>  {
  factory $ModelInfoRequestCopyWith(ModelInfoRequest value, $Res Function(ModelInfoRequest) _then) = _$ModelInfoRequestCopyWithImpl;
@useResult
$Res call({
 String model
});




}
/// @nodoc
class _$ModelInfoRequestCopyWithImpl<$Res>
    implements $ModelInfoRequestCopyWith<$Res> {
  _$ModelInfoRequestCopyWithImpl(this._self, this._then);

  final ModelInfoRequest _self;
  final $Res Function(ModelInfoRequest) _then;

/// Create a copy of ModelInfoRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelInfoRequest].
extension ModelInfoRequestPatterns on ModelInfoRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelInfoRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelInfoRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelInfoRequest value)  $default,){
final _that = this;
switch (_that) {
case _ModelInfoRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelInfoRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ModelInfoRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelInfoRequest() when $default != null:
return $default(_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model)  $default,) {final _that = this;
switch (_that) {
case _ModelInfoRequest():
return $default(_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model)?  $default,) {final _that = this;
switch (_that) {
case _ModelInfoRequest() when $default != null:
return $default(_that.model);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelInfoRequest extends ModelInfoRequest {
  const _ModelInfoRequest({required this.model}): super._();
  factory _ModelInfoRequest.fromJson(Map<String, dynamic> json) => _$ModelInfoRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;

/// Create a copy of ModelInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelInfoRequestCopyWith<_ModelInfoRequest> get copyWith => __$ModelInfoRequestCopyWithImpl<_ModelInfoRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelInfoRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelInfoRequest&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'ModelInfoRequest(model: $model)';
}


}

/// @nodoc
abstract mixin class _$ModelInfoRequestCopyWith<$Res> implements $ModelInfoRequestCopyWith<$Res> {
  factory _$ModelInfoRequestCopyWith(_ModelInfoRequest value, $Res Function(_ModelInfoRequest) _then) = __$ModelInfoRequestCopyWithImpl;
@override @useResult
$Res call({
 String model
});




}
/// @nodoc
class __$ModelInfoRequestCopyWithImpl<$Res>
    implements _$ModelInfoRequestCopyWith<$Res> {
  __$ModelInfoRequestCopyWithImpl(this._self, this._then);

  final _ModelInfoRequest _self;
  final $Res Function(_ModelInfoRequest) _then;

/// Create a copy of ModelInfoRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(_ModelInfoRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ModelInfo {

/// The model's license.
@JsonKey(includeIfNull: false) String? get license;/// The modelfile associated with the model.
@JsonKey(includeIfNull: false) String? get modelfile;/// The model parameters.
@JsonKey(includeIfNull: false) String? get parameters;/// The prompt template for the model.
@JsonKey(includeIfNull: false) String? get template;/// The system prompt for the model.
@JsonKey(includeIfNull: false) String? get system;/// Details about a model.
@JsonKey(includeIfNull: false) ModelDetails? get details;/// The default messages for the model.
@JsonKey(includeIfNull: false) List<Message>? get messages;/// Details about a model.
@JsonKey(name: 'model_info', includeIfNull: false) ModelInformation? get modelInfo;/// Projector info.
@JsonKey(name: 'projector_info', includeIfNull: false) Map<String, dynamic>? get projectorInfo;/// The tensors of the model.
@JsonKey(includeIfNull: false) List<Tensor>? get tensors;/// The capabilities of the model.
@JsonKey(includeIfNull: false) List<Capability>? get capabilities;/// Date on which a model was created.
@JsonKey(name: 'modified_at', includeIfNull: false) String? get modifiedAt;/// Name of the upstream remote model (when model is federated from another Ollama instance)
@JsonKey(name: 'remote_model', includeIfNull: false) String? get remoteModel;/// URL of the upstream Ollama host (when model is federated from another instance)
@JsonKey(name: 'remote_host', includeIfNull: false) String? get remoteHost;
/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelInfoCopyWith<ModelInfo> get copyWith => _$ModelInfoCopyWithImpl<ModelInfo>(this as ModelInfo, _$identity);

  /// Serializes this ModelInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelInfo&&(identical(other.license, license) || other.license == license)&&(identical(other.modelfile, modelfile) || other.modelfile == modelfile)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.template, template) || other.template == template)&&(identical(other.system, system) || other.system == system)&&(identical(other.details, details) || other.details == details)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.modelInfo, modelInfo) || other.modelInfo == modelInfo)&&const DeepCollectionEquality().equals(other.projectorInfo, projectorInfo)&&const DeepCollectionEquality().equals(other.tensors, tensors)&&const DeepCollectionEquality().equals(other.capabilities, capabilities)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,license,modelfile,parameters,template,system,details,const DeepCollectionEquality().hash(messages),modelInfo,const DeepCollectionEquality().hash(projectorInfo),const DeepCollectionEquality().hash(tensors),const DeepCollectionEquality().hash(capabilities),modifiedAt,remoteModel,remoteHost);

@override
String toString() {
  return 'ModelInfo(license: $license, modelfile: $modelfile, parameters: $parameters, template: $template, system: $system, details: $details, messages: $messages, modelInfo: $modelInfo, projectorInfo: $projectorInfo, tensors: $tensors, capabilities: $capabilities, modifiedAt: $modifiedAt, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class $ModelInfoCopyWith<$Res>  {
  factory $ModelInfoCopyWith(ModelInfo value, $Res Function(ModelInfo) _then) = _$ModelInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? license,@JsonKey(includeIfNull: false) String? modelfile,@JsonKey(includeIfNull: false) String? parameters,@JsonKey(includeIfNull: false) String? template,@JsonKey(includeIfNull: false) String? system,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(includeIfNull: false) List<Message>? messages,@JsonKey(name: 'model_info', includeIfNull: false) ModelInformation? modelInfo,@JsonKey(name: 'projector_info', includeIfNull: false) Map<String, dynamic>? projectorInfo,@JsonKey(includeIfNull: false) List<Tensor>? tensors,@JsonKey(includeIfNull: false) List<Capability>? capabilities,@JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


$ModelDetailsCopyWith<$Res>? get details;$ModelInformationCopyWith<$Res>? get modelInfo;

}
/// @nodoc
class _$ModelInfoCopyWithImpl<$Res>
    implements $ModelInfoCopyWith<$Res> {
  _$ModelInfoCopyWithImpl(this._self, this._then);

  final ModelInfo _self;
  final $Res Function(ModelInfo) _then;

/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? license = freezed,Object? modelfile = freezed,Object? parameters = freezed,Object? template = freezed,Object? system = freezed,Object? details = freezed,Object? messages = freezed,Object? modelInfo = freezed,Object? projectorInfo = freezed,Object? tensors = freezed,Object? capabilities = freezed,Object? modifiedAt = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_self.copyWith(
license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,modelfile: freezed == modelfile ? _self.modelfile : modelfile // ignore: cast_nullable_to_non_nullable
as String?,parameters: freezed == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>?,modelInfo: freezed == modelInfo ? _self.modelInfo : modelInfo // ignore: cast_nullable_to_non_nullable
as ModelInformation?,projectorInfo: freezed == projectorInfo ? _self.projectorInfo : projectorInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,tensors: freezed == tensors ? _self.tensors : tensors // ignore: cast_nullable_to_non_nullable
as List<Tensor>?,capabilities: freezed == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as List<Capability>?,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as String?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelInformationCopyWith<$Res>? get modelInfo {
    if (_self.modelInfo == null) {
    return null;
  }

  return $ModelInformationCopyWith<$Res>(_self.modelInfo!, (value) {
    return _then(_self.copyWith(modelInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModelInfo].
extension ModelInfoPatterns on ModelInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelInfo value)  $default,){
final _that = this;
switch (_that) {
case _ModelInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ModelInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? license, @JsonKey(includeIfNull: false)  String? modelfile, @JsonKey(includeIfNull: false)  String? parameters, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(includeIfNull: false)  List<Message>? messages, @JsonKey(name: 'model_info', includeIfNull: false)  ModelInformation? modelInfo, @JsonKey(name: 'projector_info', includeIfNull: false)  Map<String, dynamic>? projectorInfo, @JsonKey(includeIfNull: false)  List<Tensor>? tensors, @JsonKey(includeIfNull: false)  List<Capability>? capabilities, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelInfo() when $default != null:
return $default(_that.license,_that.modelfile,_that.parameters,_that.template,_that.system,_that.details,_that.messages,_that.modelInfo,_that.projectorInfo,_that.tensors,_that.capabilities,_that.modifiedAt,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? license, @JsonKey(includeIfNull: false)  String? modelfile, @JsonKey(includeIfNull: false)  String? parameters, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(includeIfNull: false)  List<Message>? messages, @JsonKey(name: 'model_info', includeIfNull: false)  ModelInformation? modelInfo, @JsonKey(name: 'projector_info', includeIfNull: false)  Map<String, dynamic>? projectorInfo, @JsonKey(includeIfNull: false)  List<Tensor>? tensors, @JsonKey(includeIfNull: false)  List<Capability>? capabilities, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)  $default,) {final _that = this;
switch (_that) {
case _ModelInfo():
return $default(_that.license,_that.modelfile,_that.parameters,_that.template,_that.system,_that.details,_that.messages,_that.modelInfo,_that.projectorInfo,_that.tensors,_that.capabilities,_that.modifiedAt,_that.remoteModel,_that.remoteHost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? license, @JsonKey(includeIfNull: false)  String? modelfile, @JsonKey(includeIfNull: false)  String? parameters, @JsonKey(includeIfNull: false)  String? template, @JsonKey(includeIfNull: false)  String? system, @JsonKey(includeIfNull: false)  ModelDetails? details, @JsonKey(includeIfNull: false)  List<Message>? messages, @JsonKey(name: 'model_info', includeIfNull: false)  ModelInformation? modelInfo, @JsonKey(name: 'projector_info', includeIfNull: false)  Map<String, dynamic>? projectorInfo, @JsonKey(includeIfNull: false)  List<Tensor>? tensors, @JsonKey(includeIfNull: false)  List<Capability>? capabilities, @JsonKey(name: 'modified_at', includeIfNull: false)  String? modifiedAt, @JsonKey(name: 'remote_model', includeIfNull: false)  String? remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false)  String? remoteHost)?  $default,) {final _that = this;
switch (_that) {
case _ModelInfo() when $default != null:
return $default(_that.license,_that.modelfile,_that.parameters,_that.template,_that.system,_that.details,_that.messages,_that.modelInfo,_that.projectorInfo,_that.tensors,_that.capabilities,_that.modifiedAt,_that.remoteModel,_that.remoteHost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelInfo extends ModelInfo {
  const _ModelInfo({@JsonKey(includeIfNull: false) this.license, @JsonKey(includeIfNull: false) this.modelfile, @JsonKey(includeIfNull: false) this.parameters, @JsonKey(includeIfNull: false) this.template, @JsonKey(includeIfNull: false) this.system, @JsonKey(includeIfNull: false) this.details, @JsonKey(includeIfNull: false) final  List<Message>? messages, @JsonKey(name: 'model_info', includeIfNull: false) this.modelInfo, @JsonKey(name: 'projector_info', includeIfNull: false) final  Map<String, dynamic>? projectorInfo, @JsonKey(includeIfNull: false) final  List<Tensor>? tensors, @JsonKey(includeIfNull: false) final  List<Capability>? capabilities, @JsonKey(name: 'modified_at', includeIfNull: false) this.modifiedAt, @JsonKey(name: 'remote_model', includeIfNull: false) this.remoteModel, @JsonKey(name: 'remote_host', includeIfNull: false) this.remoteHost}): _messages = messages,_projectorInfo = projectorInfo,_tensors = tensors,_capabilities = capabilities,super._();
  factory _ModelInfo.fromJson(Map<String, dynamic> json) => _$ModelInfoFromJson(json);

/// The model's license.
@override@JsonKey(includeIfNull: false) final  String? license;
/// The modelfile associated with the model.
@override@JsonKey(includeIfNull: false) final  String? modelfile;
/// The model parameters.
@override@JsonKey(includeIfNull: false) final  String? parameters;
/// The prompt template for the model.
@override@JsonKey(includeIfNull: false) final  String? template;
/// The system prompt for the model.
@override@JsonKey(includeIfNull: false) final  String? system;
/// Details about a model.
@override@JsonKey(includeIfNull: false) final  ModelDetails? details;
/// The default messages for the model.
 final  List<Message>? _messages;
/// The default messages for the model.
@override@JsonKey(includeIfNull: false) List<Message>? get messages {
  final value = _messages;
  if (value == null) return null;
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Details about a model.
@override@JsonKey(name: 'model_info', includeIfNull: false) final  ModelInformation? modelInfo;
/// Projector info.
 final  Map<String, dynamic>? _projectorInfo;
/// Projector info.
@override@JsonKey(name: 'projector_info', includeIfNull: false) Map<String, dynamic>? get projectorInfo {
  final value = _projectorInfo;
  if (value == null) return null;
  if (_projectorInfo is EqualUnmodifiableMapView) return _projectorInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// The tensors of the model.
 final  List<Tensor>? _tensors;
/// The tensors of the model.
@override@JsonKey(includeIfNull: false) List<Tensor>? get tensors {
  final value = _tensors;
  if (value == null) return null;
  if (_tensors is EqualUnmodifiableListView) return _tensors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// The capabilities of the model.
 final  List<Capability>? _capabilities;
/// The capabilities of the model.
@override@JsonKey(includeIfNull: false) List<Capability>? get capabilities {
  final value = _capabilities;
  if (value == null) return null;
  if (_capabilities is EqualUnmodifiableListView) return _capabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Date on which a model was created.
@override@JsonKey(name: 'modified_at', includeIfNull: false) final  String? modifiedAt;
/// Name of the upstream remote model (when model is federated from another Ollama instance)
@override@JsonKey(name: 'remote_model', includeIfNull: false) final  String? remoteModel;
/// URL of the upstream Ollama host (when model is federated from another instance)
@override@JsonKey(name: 'remote_host', includeIfNull: false) final  String? remoteHost;

/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelInfoCopyWith<_ModelInfo> get copyWith => __$ModelInfoCopyWithImpl<_ModelInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelInfo&&(identical(other.license, license) || other.license == license)&&(identical(other.modelfile, modelfile) || other.modelfile == modelfile)&&(identical(other.parameters, parameters) || other.parameters == parameters)&&(identical(other.template, template) || other.template == template)&&(identical(other.system, system) || other.system == system)&&(identical(other.details, details) || other.details == details)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.modelInfo, modelInfo) || other.modelInfo == modelInfo)&&const DeepCollectionEquality().equals(other._projectorInfo, _projectorInfo)&&const DeepCollectionEquality().equals(other._tensors, _tensors)&&const DeepCollectionEquality().equals(other._capabilities, _capabilities)&&(identical(other.modifiedAt, modifiedAt) || other.modifiedAt == modifiedAt)&&(identical(other.remoteModel, remoteModel) || other.remoteModel == remoteModel)&&(identical(other.remoteHost, remoteHost) || other.remoteHost == remoteHost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,license,modelfile,parameters,template,system,details,const DeepCollectionEquality().hash(_messages),modelInfo,const DeepCollectionEquality().hash(_projectorInfo),const DeepCollectionEquality().hash(_tensors),const DeepCollectionEquality().hash(_capabilities),modifiedAt,remoteModel,remoteHost);

@override
String toString() {
  return 'ModelInfo(license: $license, modelfile: $modelfile, parameters: $parameters, template: $template, system: $system, details: $details, messages: $messages, modelInfo: $modelInfo, projectorInfo: $projectorInfo, tensors: $tensors, capabilities: $capabilities, modifiedAt: $modifiedAt, remoteModel: $remoteModel, remoteHost: $remoteHost)';
}


}

/// @nodoc
abstract mixin class _$ModelInfoCopyWith<$Res> implements $ModelInfoCopyWith<$Res> {
  factory _$ModelInfoCopyWith(_ModelInfo value, $Res Function(_ModelInfo) _then) = __$ModelInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? license,@JsonKey(includeIfNull: false) String? modelfile,@JsonKey(includeIfNull: false) String? parameters,@JsonKey(includeIfNull: false) String? template,@JsonKey(includeIfNull: false) String? system,@JsonKey(includeIfNull: false) ModelDetails? details,@JsonKey(includeIfNull: false) List<Message>? messages,@JsonKey(name: 'model_info', includeIfNull: false) ModelInformation? modelInfo,@JsonKey(name: 'projector_info', includeIfNull: false) Map<String, dynamic>? projectorInfo,@JsonKey(includeIfNull: false) List<Tensor>? tensors,@JsonKey(includeIfNull: false) List<Capability>? capabilities,@JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,@JsonKey(name: 'remote_model', includeIfNull: false) String? remoteModel,@JsonKey(name: 'remote_host', includeIfNull: false) String? remoteHost
});


@override $ModelDetailsCopyWith<$Res>? get details;@override $ModelInformationCopyWith<$Res>? get modelInfo;

}
/// @nodoc
class __$ModelInfoCopyWithImpl<$Res>
    implements _$ModelInfoCopyWith<$Res> {
  __$ModelInfoCopyWithImpl(this._self, this._then);

  final _ModelInfo _self;
  final $Res Function(_ModelInfo) _then;

/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? license = freezed,Object? modelfile = freezed,Object? parameters = freezed,Object? template = freezed,Object? system = freezed,Object? details = freezed,Object? messages = freezed,Object? modelInfo = freezed,Object? projectorInfo = freezed,Object? tensors = freezed,Object? capabilities = freezed,Object? modifiedAt = freezed,Object? remoteModel = freezed,Object? remoteHost = freezed,}) {
  return _then(_ModelInfo(
license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,modelfile: freezed == modelfile ? _self.modelfile : modelfile // ignore: cast_nullable_to_non_nullable
as String?,parameters: freezed == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as String?,template: freezed == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String?,system: freezed == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ModelDetails?,messages: freezed == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>?,modelInfo: freezed == modelInfo ? _self.modelInfo : modelInfo // ignore: cast_nullable_to_non_nullable
as ModelInformation?,projectorInfo: freezed == projectorInfo ? _self._projectorInfo : projectorInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,tensors: freezed == tensors ? _self._tensors : tensors // ignore: cast_nullable_to_non_nullable
as List<Tensor>?,capabilities: freezed == capabilities ? _self._capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as List<Capability>?,modifiedAt: freezed == modifiedAt ? _self.modifiedAt : modifiedAt // ignore: cast_nullable_to_non_nullable
as String?,remoteModel: freezed == remoteModel ? _self.remoteModel : remoteModel // ignore: cast_nullable_to_non_nullable
as String?,remoteHost: freezed == remoteHost ? _self.remoteHost : remoteHost // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $ModelDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}/// Create a copy of ModelInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelInformationCopyWith<$Res>? get modelInfo {
    if (_self.modelInfo == null) {
    return null;
  }

  return $ModelInformationCopyWith<$Res>(_self.modelInfo!, (value) {
    return _then(_self.copyWith(modelInfo: value));
  });
}
}


/// @nodoc
mixin _$CopyModelRequest {

/// Name of the model to copy.
 String get source;/// Name of the new model.
 String get destination;
/// Create a copy of CopyModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyModelRequestCopyWith<CopyModelRequest> get copyWith => _$CopyModelRequestCopyWithImpl<CopyModelRequest>(this as CopyModelRequest, _$identity);

  /// Serializes this CopyModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyModelRequest&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,destination);

@override
String toString() {
  return 'CopyModelRequest(source: $source, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $CopyModelRequestCopyWith<$Res>  {
  factory $CopyModelRequestCopyWith(CopyModelRequest value, $Res Function(CopyModelRequest) _then) = _$CopyModelRequestCopyWithImpl;
@useResult
$Res call({
 String source, String destination
});




}
/// @nodoc
class _$CopyModelRequestCopyWithImpl<$Res>
    implements $CopyModelRequestCopyWith<$Res> {
  _$CopyModelRequestCopyWithImpl(this._self, this._then);

  final CopyModelRequest _self;
  final $Res Function(CopyModelRequest) _then;

/// Create a copy of CopyModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? destination = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CopyModelRequest].
extension CopyModelRequestPatterns on CopyModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CopyModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CopyModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CopyModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _CopyModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CopyModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CopyModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String destination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CopyModelRequest() when $default != null:
return $default(_that.source,_that.destination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String destination)  $default,) {final _that = this;
switch (_that) {
case _CopyModelRequest():
return $default(_that.source,_that.destination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String destination)?  $default,) {final _that = this;
switch (_that) {
case _CopyModelRequest() when $default != null:
return $default(_that.source,_that.destination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CopyModelRequest extends CopyModelRequest {
  const _CopyModelRequest({required this.source, required this.destination}): super._();
  factory _CopyModelRequest.fromJson(Map<String, dynamic> json) => _$CopyModelRequestFromJson(json);

/// Name of the model to copy.
@override final  String source;
/// Name of the new model.
@override final  String destination;

/// Create a copy of CopyModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CopyModelRequestCopyWith<_CopyModelRequest> get copyWith => __$CopyModelRequestCopyWithImpl<_CopyModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CopyModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CopyModelRequest&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,destination);

@override
String toString() {
  return 'CopyModelRequest(source: $source, destination: $destination)';
}


}

/// @nodoc
abstract mixin class _$CopyModelRequestCopyWith<$Res> implements $CopyModelRequestCopyWith<$Res> {
  factory _$CopyModelRequestCopyWith(_CopyModelRequest value, $Res Function(_CopyModelRequest) _then) = __$CopyModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String source, String destination
});




}
/// @nodoc
class __$CopyModelRequestCopyWithImpl<$Res>
    implements _$CopyModelRequestCopyWith<$Res> {
  __$CopyModelRequestCopyWithImpl(this._self, this._then);

  final _CopyModelRequest _self;
  final $Res Function(_CopyModelRequest) _then;

/// Create a copy of CopyModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? destination = null,}) {
  return _then(_CopyModelRequest(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DeleteModelRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;
/// Create a copy of DeleteModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteModelRequestCopyWith<DeleteModelRequest> get copyWith => _$DeleteModelRequestCopyWithImpl<DeleteModelRequest>(this as DeleteModelRequest, _$identity);

  /// Serializes this DeleteModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteModelRequest&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'DeleteModelRequest(model: $model)';
}


}

/// @nodoc
abstract mixin class $DeleteModelRequestCopyWith<$Res>  {
  factory $DeleteModelRequestCopyWith(DeleteModelRequest value, $Res Function(DeleteModelRequest) _then) = _$DeleteModelRequestCopyWithImpl;
@useResult
$Res call({
 String model
});




}
/// @nodoc
class _$DeleteModelRequestCopyWithImpl<$Res>
    implements $DeleteModelRequestCopyWith<$Res> {
  _$DeleteModelRequestCopyWithImpl(this._self, this._then);

  final DeleteModelRequest _self;
  final $Res Function(DeleteModelRequest) _then;

/// Create a copy of DeleteModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteModelRequest].
extension DeleteModelRequestPatterns on DeleteModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeleteModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteModelRequest() when $default != null:
return $default(_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model)  $default,) {final _that = this;
switch (_that) {
case _DeleteModelRequest():
return $default(_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model)?  $default,) {final _that = this;
switch (_that) {
case _DeleteModelRequest() when $default != null:
return $default(_that.model);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteModelRequest extends DeleteModelRequest {
  const _DeleteModelRequest({required this.model}): super._();
  factory _DeleteModelRequest.fromJson(Map<String, dynamic> json) => _$DeleteModelRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;

/// Create a copy of DeleteModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteModelRequestCopyWith<_DeleteModelRequest> get copyWith => __$DeleteModelRequestCopyWithImpl<_DeleteModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteModelRequest&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model);

@override
String toString() {
  return 'DeleteModelRequest(model: $model)';
}


}

/// @nodoc
abstract mixin class _$DeleteModelRequestCopyWith<$Res> implements $DeleteModelRequestCopyWith<$Res> {
  factory _$DeleteModelRequestCopyWith(_DeleteModelRequest value, $Res Function(_DeleteModelRequest) _then) = __$DeleteModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String model
});




}
/// @nodoc
class __$DeleteModelRequestCopyWithImpl<$Res>
    implements _$DeleteModelRequestCopyWith<$Res> {
  __$DeleteModelRequestCopyWithImpl(this._self, this._then);

  final _DeleteModelRequest _self;
  final $Res Function(_DeleteModelRequest) _then;

/// Create a copy of DeleteModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,}) {
  return _then(_DeleteModelRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PullModelRequest {

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
 String get model;/// Allow insecure connections to the library.
///
/// Only use this if you are pulling from your own library during development.
 bool get insecure;/// Ollama username.
@JsonKey(includeIfNull: false) String? get username;/// Ollama password.
@JsonKey(includeIfNull: false) String? get password;/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
 bool get stream;
/// Create a copy of PullModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PullModelRequestCopyWith<PullModelRequest> get copyWith => _$PullModelRequestCopyWithImpl<PullModelRequest>(this as PullModelRequest, _$identity);

  /// Serializes this PullModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PullModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.insecure, insecure) || other.insecure == insecure)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,insecure,username,password,stream);

@override
String toString() {
  return 'PullModelRequest(model: $model, insecure: $insecure, username: $username, password: $password, stream: $stream)';
}


}

/// @nodoc
abstract mixin class $PullModelRequestCopyWith<$Res>  {
  factory $PullModelRequestCopyWith(PullModelRequest value, $Res Function(PullModelRequest) _then) = _$PullModelRequestCopyWithImpl;
@useResult
$Res call({
 String model, bool insecure,@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? password, bool stream
});




}
/// @nodoc
class _$PullModelRequestCopyWithImpl<$Res>
    implements $PullModelRequestCopyWith<$Res> {
  _$PullModelRequestCopyWithImpl(this._self, this._then);

  final PullModelRequest _self;
  final $Res Function(PullModelRequest) _then;

/// Create a copy of PullModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? insecure = null,Object? username = freezed,Object? password = freezed,Object? stream = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,insecure: null == insecure ? _self.insecure : insecure // ignore: cast_nullable_to_non_nullable
as bool,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PullModelRequest].
extension PullModelRequestPatterns on PullModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PullModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PullModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PullModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _PullModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PullModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PullModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PullModelRequest() when $default != null:
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)  $default,) {final _that = this;
switch (_that) {
case _PullModelRequest():
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)?  $default,) {final _that = this;
switch (_that) {
case _PullModelRequest() when $default != null:
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PullModelRequest extends PullModelRequest {
  const _PullModelRequest({required this.model, this.insecure = false, @JsonKey(includeIfNull: false) this.username, @JsonKey(includeIfNull: false) this.password, this.stream = false}): super._();
  factory _PullModelRequest.fromJson(Map<String, dynamic> json) => _$PullModelRequestFromJson(json);

/// The model name.
///
/// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
@override final  String model;
/// Allow insecure connections to the library.
///
/// Only use this if you are pulling from your own library during development.
@override@JsonKey() final  bool insecure;
/// Ollama username.
@override@JsonKey(includeIfNull: false) final  String? username;
/// Ollama password.
@override@JsonKey(includeIfNull: false) final  String? password;
/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
@override@JsonKey() final  bool stream;

/// Create a copy of PullModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PullModelRequestCopyWith<_PullModelRequest> get copyWith => __$PullModelRequestCopyWithImpl<_PullModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PullModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PullModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.insecure, insecure) || other.insecure == insecure)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,insecure,username,password,stream);

@override
String toString() {
  return 'PullModelRequest(model: $model, insecure: $insecure, username: $username, password: $password, stream: $stream)';
}


}

/// @nodoc
abstract mixin class _$PullModelRequestCopyWith<$Res> implements $PullModelRequestCopyWith<$Res> {
  factory _$PullModelRequestCopyWith(_PullModelRequest value, $Res Function(_PullModelRequest) _then) = __$PullModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, bool insecure,@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? password, bool stream
});




}
/// @nodoc
class __$PullModelRequestCopyWithImpl<$Res>
    implements _$PullModelRequestCopyWith<$Res> {
  __$PullModelRequestCopyWithImpl(this._self, this._then);

  final _PullModelRequest _self;
  final $Res Function(_PullModelRequest) _then;

/// Create a copy of PullModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? insecure = null,Object? username = freezed,Object? password = freezed,Object? stream = null,}) {
  return _then(_PullModelRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,insecure: null == insecure ? _self.insecure : insecure // ignore: cast_nullable_to_non_nullable
as bool,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PullModelResponse {

/// Status pulling the model.
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PullModelStatus? get status;/// The model's digest.
@JsonKey(includeIfNull: false) String? get digest;/// Total size of the model.
@JsonKey(includeIfNull: false) int? get total;/// Total bytes transferred.
@JsonKey(includeIfNull: false) int? get completed;
/// Create a copy of PullModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PullModelResponseCopyWith<PullModelResponse> get copyWith => _$PullModelResponseCopyWithImpl<PullModelResponse>(this as PullModelResponse, _$identity);

  /// Serializes this PullModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PullModelResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,digest,total,completed);

@override
String toString() {
  return 'PullModelResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $PullModelResponseCopyWith<$Res>  {
  factory $PullModelResponseCopyWith(PullModelResponse value, $Res Function(PullModelResponse) _then) = _$PullModelResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PullModelStatus? status,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) int? total,@JsonKey(includeIfNull: false) int? completed
});




}
/// @nodoc
class _$PullModelResponseCopyWithImpl<$Res>
    implements $PullModelResponseCopyWith<$Res> {
  _$PullModelResponseCopyWithImpl(this._self, this._then);

  final PullModelResponse _self;
  final $Res Function(PullModelResponse) _then;

/// Create a copy of PullModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? digest = freezed,Object? total = freezed,Object? completed = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PullModelStatus?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PullModelResponse].
extension PullModelResponsePatterns on PullModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PullModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PullModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PullModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _PullModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PullModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PullModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PullModelStatus? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PullModelResponse() when $default != null:
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PullModelStatus? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)  $default,) {final _that = this;
switch (_that) {
case _PullModelResponse():
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PullModelStatus? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)?  $default,) {final _that = this;
switch (_that) {
case _PullModelResponse() when $default != null:
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PullModelResponse extends PullModelResponse {
  const _PullModelResponse({@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, @JsonKey(includeIfNull: false) this.digest, @JsonKey(includeIfNull: false) this.total, @JsonKey(includeIfNull: false) this.completed}): super._();
  factory _PullModelResponse.fromJson(Map<String, dynamic> json) => _$PullModelResponseFromJson(json);

/// Status pulling the model.
@override@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  PullModelStatus? status;
/// The model's digest.
@override@JsonKey(includeIfNull: false) final  String? digest;
/// Total size of the model.
@override@JsonKey(includeIfNull: false) final  int? total;
/// Total bytes transferred.
@override@JsonKey(includeIfNull: false) final  int? completed;

/// Create a copy of PullModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PullModelResponseCopyWith<_PullModelResponse> get copyWith => __$PullModelResponseCopyWithImpl<_PullModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PullModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PullModelResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,digest,total,completed);

@override
String toString() {
  return 'PullModelResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$PullModelResponseCopyWith<$Res> implements $PullModelResponseCopyWith<$Res> {
  factory _$PullModelResponseCopyWith(_PullModelResponse value, $Res Function(_PullModelResponse) _then) = __$PullModelResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PullModelStatus? status,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) int? total,@JsonKey(includeIfNull: false) int? completed
});




}
/// @nodoc
class __$PullModelResponseCopyWithImpl<$Res>
    implements _$PullModelResponseCopyWith<$Res> {
  __$PullModelResponseCopyWithImpl(this._self, this._then);

  final _PullModelResponse _self;
  final $Res Function(_PullModelResponse) _then;

/// Create a copy of PullModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? digest = freezed,Object? total = freezed,Object? completed = freezed,}) {
  return _then(_PullModelResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PullModelStatus?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PushModelRequest {

/// The name of the model to push in the form of <namespace>/<model>:<tag>.
 String get model;/// Allow insecure connections to the library.
///
/// Only use this if you are pushing to your library during development.
 bool get insecure;/// Ollama username.
@JsonKey(includeIfNull: false) String? get username;/// Ollama password.
@JsonKey(includeIfNull: false) String? get password;/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
 bool get stream;
/// Create a copy of PushModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushModelRequestCopyWith<PushModelRequest> get copyWith => _$PushModelRequestCopyWithImpl<PushModelRequest>(this as PushModelRequest, _$identity);

  /// Serializes this PushModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.insecure, insecure) || other.insecure == insecure)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,insecure,username,password,stream);

@override
String toString() {
  return 'PushModelRequest(model: $model, insecure: $insecure, username: $username, password: $password, stream: $stream)';
}


}

/// @nodoc
abstract mixin class $PushModelRequestCopyWith<$Res>  {
  factory $PushModelRequestCopyWith(PushModelRequest value, $Res Function(PushModelRequest) _then) = _$PushModelRequestCopyWithImpl;
@useResult
$Res call({
 String model, bool insecure,@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? password, bool stream
});




}
/// @nodoc
class _$PushModelRequestCopyWithImpl<$Res>
    implements $PushModelRequestCopyWith<$Res> {
  _$PushModelRequestCopyWithImpl(this._self, this._then);

  final PushModelRequest _self;
  final $Res Function(PushModelRequest) _then;

/// Create a copy of PushModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? insecure = null,Object? username = freezed,Object? password = freezed,Object? stream = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,insecure: null == insecure ? _self.insecure : insecure // ignore: cast_nullable_to_non_nullable
as bool,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PushModelRequest].
extension PushModelRequestPatterns on PushModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _PushModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PushModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushModelRequest() when $default != null:
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)  $default,) {final _that = this;
switch (_that) {
case _PushModelRequest():
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  bool insecure, @JsonKey(includeIfNull: false)  String? username, @JsonKey(includeIfNull: false)  String? password,  bool stream)?  $default,) {final _that = this;
switch (_that) {
case _PushModelRequest() when $default != null:
return $default(_that.model,_that.insecure,_that.username,_that.password,_that.stream);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushModelRequest extends PushModelRequest {
  const _PushModelRequest({required this.model, this.insecure = false, @JsonKey(includeIfNull: false) this.username, @JsonKey(includeIfNull: false) this.password, this.stream = false}): super._();
  factory _PushModelRequest.fromJson(Map<String, dynamic> json) => _$PushModelRequestFromJson(json);

/// The name of the model to push in the form of <namespace>/<model>:<tag>.
@override final  String model;
/// Allow insecure connections to the library.
///
/// Only use this if you are pushing to your library during development.
@override@JsonKey() final  bool insecure;
/// Ollama username.
@override@JsonKey(includeIfNull: false) final  String? username;
/// Ollama password.
@override@JsonKey(includeIfNull: false) final  String? password;
/// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
@override@JsonKey() final  bool stream;

/// Create a copy of PushModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushModelRequestCopyWith<_PushModelRequest> get copyWith => __$PushModelRequestCopyWithImpl<_PushModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushModelRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.insecure, insecure) || other.insecure == insecure)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.stream, stream) || other.stream == stream));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,insecure,username,password,stream);

@override
String toString() {
  return 'PushModelRequest(model: $model, insecure: $insecure, username: $username, password: $password, stream: $stream)';
}


}

/// @nodoc
abstract mixin class _$PushModelRequestCopyWith<$Res> implements $PushModelRequestCopyWith<$Res> {
  factory _$PushModelRequestCopyWith(_PushModelRequest value, $Res Function(_PushModelRequest) _then) = __$PushModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, bool insecure,@JsonKey(includeIfNull: false) String? username,@JsonKey(includeIfNull: false) String? password, bool stream
});




}
/// @nodoc
class __$PushModelRequestCopyWithImpl<$Res>
    implements _$PushModelRequestCopyWith<$Res> {
  __$PushModelRequestCopyWithImpl(this._self, this._then);

  final _PushModelRequest _self;
  final $Res Function(_PushModelRequest) _then;

/// Create a copy of PushModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? insecure = null,Object? username = freezed,Object? password = freezed,Object? stream = null,}) {
  return _then(_PushModelRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,insecure: null == insecure ? _self.insecure : insecure // ignore: cast_nullable_to_non_nullable
as bool,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PushModelResponse {

/// Status pushing the model.
@JsonKey(includeIfNull: false) String? get status;/// the model's digest
@JsonKey(includeIfNull: false) String? get digest;/// total size of the model
@JsonKey(includeIfNull: false) int? get total;/// Total bytes transferred.
@JsonKey(includeIfNull: false) int? get completed;
/// Create a copy of PushModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushModelResponseCopyWith<PushModelResponse> get copyWith => _$PushModelResponseCopyWithImpl<PushModelResponse>(this as PushModelResponse, _$identity);

  /// Serializes this PushModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushModelResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,digest,total,completed);

@override
String toString() {
  return 'PushModelResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $PushModelResponseCopyWith<$Res>  {
  factory $PushModelResponseCopyWith(PushModelResponse value, $Res Function(PushModelResponse) _then) = _$PushModelResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) int? total,@JsonKey(includeIfNull: false) int? completed
});




}
/// @nodoc
class _$PushModelResponseCopyWithImpl<$Res>
    implements $PushModelResponseCopyWith<$Res> {
  _$PushModelResponseCopyWithImpl(this._self, this._then);

  final PushModelResponse _self;
  final $Res Function(PushModelResponse) _then;

/// Create a copy of PushModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? digest = freezed,Object? total = freezed,Object? completed = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PushModelResponse].
extension PushModelResponsePatterns on PushModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _PushModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PushModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushModelResponse() when $default != null:
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)  $default,) {final _that = this;
switch (_that) {
case _PushModelResponse():
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? digest, @JsonKey(includeIfNull: false)  int? total, @JsonKey(includeIfNull: false)  int? completed)?  $default,) {final _that = this;
switch (_that) {
case _PushModelResponse() when $default != null:
return $default(_that.status,_that.digest,_that.total,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushModelResponse extends PushModelResponse {
  const _PushModelResponse({@JsonKey(includeIfNull: false) this.status, @JsonKey(includeIfNull: false) this.digest, @JsonKey(includeIfNull: false) this.total, @JsonKey(includeIfNull: false) this.completed}): super._();
  factory _PushModelResponse.fromJson(Map<String, dynamic> json) => _$PushModelResponseFromJson(json);

/// Status pushing the model.
@override@JsonKey(includeIfNull: false) final  String? status;
/// the model's digest
@override@JsonKey(includeIfNull: false) final  String? digest;
/// total size of the model
@override@JsonKey(includeIfNull: false) final  int? total;
/// Total bytes transferred.
@override@JsonKey(includeIfNull: false) final  int? completed;

/// Create a copy of PushModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushModelResponseCopyWith<_PushModelResponse> get copyWith => __$PushModelResponseCopyWithImpl<_PushModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushModelResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.digest, digest) || other.digest == digest)&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,digest,total,completed);

@override
String toString() {
  return 'PushModelResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$PushModelResponseCopyWith<$Res> implements $PushModelResponseCopyWith<$Res> {
  factory _$PushModelResponseCopyWith(_PushModelResponse value, $Res Function(_PushModelResponse) _then) = __$PushModelResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? digest,@JsonKey(includeIfNull: false) int? total,@JsonKey(includeIfNull: false) int? completed
});




}
/// @nodoc
class __$PushModelResponseCopyWithImpl<$Res>
    implements _$PushModelResponseCopyWith<$Res> {
  __$PushModelResponseCopyWithImpl(this._self, this._then);

  final _PushModelResponse _self;
  final $Res Function(_PushModelResponse) _then;

/// Create a copy of PushModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? digest = freezed,Object? total = freezed,Object? completed = freezed,}) {
  return _then(_PushModelResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,digest: freezed == digest ? _self.digest : digest // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
