// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerateRequest _$GenerateRequestFromJson(Map<String, dynamic> json) {
  return _GenerateRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateRequest {
  /// (required) the model name
  String get model => throw _privateConstructorUsedError;

  /// the prompt to generate a response for\nRAW- [INST] why is the sky blue? [/INST]\nJSON- What color is the sky at different times of the day? Respond using JSON\n
  String get prompt => throw _privateConstructorUsedError;

  /// system prompt to (overrides what is defined in the Modelfile)
  @JsonKey(includeIfNull: false)
  String? get system => throw _privateConstructorUsedError;

  /// the full prompt or prompt template (overrides what is defined in the Modelfile)
  @JsonKey(includeIfNull: false)
  String? get template => throw _privateConstructorUsedError;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @JsonKey(includeIfNull: false)
  List<int>? get context => throw _privateConstructorUsedError;

  /// if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  /// if true no formatting will be applied to the prompt and no context will be returned. You may choose to use the raw parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @JsonKey(includeIfNull: false)
  bool? get raw => throw _privateConstructorUsedError;

  /// the format to return a response in. Currently the only accepted value is json.\nEnable JSON mode by setting the format parameter to json and specifying the model should use JSON in the prompt. This will structure the response as valid JSON.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  GenerateRequestFormat? get format => throw _privateConstructorUsedError;

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @JsonKey(includeIfNull: false)
  Options? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateRequestCopyWith<GenerateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateRequestCopyWith<$Res> {
  factory $GenerateRequestCopyWith(
          GenerateRequest value, $Res Function(GenerateRequest) then) =
      _$GenerateRequestCopyWithImpl<$Res, GenerateRequest>;
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) String? template,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(includeIfNull: false) bool? raw,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      GenerateRequestFormat? format,
      @JsonKey(includeIfNull: false) Options? options});

  $OptionsCopyWith<$Res>? get options;
}

/// @nodoc
class _$GenerateRequestCopyWithImpl<$Res, $Val extends GenerateRequest>
    implements $GenerateRequestCopyWith<$Res> {
  _$GenerateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? system = freezed,
    Object? template = freezed,
    Object? context = freezed,
    Object? stream = freezed,
    Object? raw = freezed,
    Object? format = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as GenerateRequestFormat?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $OptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateRequestImplCopyWith<$Res>
    implements $GenerateRequestCopyWith<$Res> {
  factory _$$GenerateRequestImplCopyWith(_$GenerateRequestImpl value,
          $Res Function(_$GenerateRequestImpl) then) =
      __$$GenerateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) String? template,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(includeIfNull: false) bool? raw,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      GenerateRequestFormat? format,
      @JsonKey(includeIfNull: false) Options? options});

  @override
  $OptionsCopyWith<$Res>? get options;
}

/// @nodoc
class __$$GenerateRequestImplCopyWithImpl<$Res>
    extends _$GenerateRequestCopyWithImpl<$Res, _$GenerateRequestImpl>
    implements _$$GenerateRequestImplCopyWith<$Res> {
  __$$GenerateRequestImplCopyWithImpl(
      _$GenerateRequestImpl _value, $Res Function(_$GenerateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? system = freezed,
    Object? template = freezed,
    Object? context = freezed,
    Object? stream = freezed,
    Object? raw = freezed,
    Object? format = freezed,
    Object? options = freezed,
  }) {
    return _then(_$GenerateRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as GenerateRequestFormat?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateRequestImpl extends _GenerateRequest {
  const _$GenerateRequestImpl(
      {required this.model,
      required this.prompt,
      @JsonKey(includeIfNull: false) this.system,
      @JsonKey(includeIfNull: false) this.template,
      @JsonKey(includeIfNull: false) final List<int>? context,
      @JsonKey(includeIfNull: false) this.stream,
      @JsonKey(includeIfNull: false) this.raw,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.format,
      @JsonKey(includeIfNull: false) this.options})
      : _context = context,
        super._();

  factory _$GenerateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateRequestImplFromJson(json);

  /// (required) the model name
  @override
  final String model;

  /// the prompt to generate a response for\nRAW- [INST] why is the sky blue? [/INST]\nJSON- What color is the sky at different times of the day? Respond using JSON\n
  @override
  final String prompt;

  /// system prompt to (overrides what is defined in the Modelfile)
  @override
  @JsonKey(includeIfNull: false)
  final String? system;

  /// the full prompt or prompt template (overrides what is defined in the Modelfile)
  @override
  @JsonKey(includeIfNull: false)
  final String? template;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  final List<int>? _context;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @override
  @JsonKey(includeIfNull: false)
  List<int>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// if false the response will be returned as a single response object, rather than a stream of objects
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  /// if true no formatting will be applied to the prompt and no context will be returned. You may choose to use the raw parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @override
  @JsonKey(includeIfNull: false)
  final bool? raw;

  /// the format to return a response in. Currently the only accepted value is json.\nEnable JSON mode by setting the format parameter to json and specifying the model should use JSON in the prompt. This will structure the response as valid JSON.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final GenerateRequestFormat? format;

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @override
  @JsonKey(includeIfNull: false)
  final Options? options;

  @override
  String toString() {
    return 'GenerateRequest(model: $model, prompt: $prompt, system: $system, template: $template, context: $context, stream: $stream, raw: $raw, format: $format, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.options, options) || other.options == options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      prompt,
      system,
      template,
      const DeepCollectionEquality().hash(_context),
      stream,
      raw,
      format,
      options);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateRequestImplCopyWith<_$GenerateRequestImpl> get copyWith =>
      __$$GenerateRequestImplCopyWithImpl<_$GenerateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateRequest extends GenerateRequest {
  const factory _GenerateRequest(
          {required final String model,
          required final String prompt,
          @JsonKey(includeIfNull: false) final String? system,
          @JsonKey(includeIfNull: false) final String? template,
          @JsonKey(includeIfNull: false) final List<int>? context,
          @JsonKey(includeIfNull: false) final bool? stream,
          @JsonKey(includeIfNull: false) final bool? raw,
          @JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final GenerateRequestFormat? format,
          @JsonKey(includeIfNull: false) final Options? options}) =
      _$GenerateRequestImpl;
  const _GenerateRequest._() : super._();

  factory _GenerateRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateRequestImpl.fromJson;

  @override

  /// (required) the model name
  String get model;
  @override

  /// the prompt to generate a response for\nRAW- [INST] why is the sky blue? [/INST]\nJSON- What color is the sky at different times of the day? Respond using JSON\n
  String get prompt;
  @override

  /// system prompt to (overrides what is defined in the Modelfile)
  @JsonKey(includeIfNull: false)
  String? get system;
  @override

  /// the full prompt or prompt template (overrides what is defined in the Modelfile)
  @JsonKey(includeIfNull: false)
  String? get template;
  @override

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @JsonKey(includeIfNull: false)
  List<int>? get context;
  @override

  /// if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream;
  @override

  /// if true no formatting will be applied to the prompt and no context will be returned. You may choose to use the raw parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @JsonKey(includeIfNull: false)
  bool? get raw;
  @override

  /// the format to return a response in. Currently the only accepted value is json.\nEnable JSON mode by setting the format parameter to json and specifying the model should use JSON in the prompt. This will structure the response as valid JSON.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  GenerateRequestFormat? get format;
  @override

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @JsonKey(includeIfNull: false)
  Options? get options;
  @override
  @JsonKey(ignore: true)
  _$$GenerateRequestImplCopyWith<_$GenerateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerateResponse _$GenerateResponseFromJson(Map<String, dynamic> json) {
  return _GenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateResponse {
  /// Model names follow a model:tag format. Some examples are orca-mini:3b-q4_1 and llama2:70b. The tag is optional and, if not provided, will default to latest. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get model => throw _privateConstructorUsedError;

  /// Date on which a model was created
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt => throw _privateConstructorUsedError;

  /// a response for a given prompt with a provided model. when finished, empty if the response was streamed, if not streamed, this will contain the full response.
  @JsonKey(includeIfNull: false)
  String? get response => throw _privateConstructorUsedError;

  /// whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @JsonKey(includeIfNull: false)
  List<int>? get context => throw _privateConstructorUsedError;

  /// number of samples generated
  @JsonKey(name: 'sample_count', includeIfNull: false)
  int? get sampleCount => throw _privateConstructorUsedError;

  /// time spent generating samples
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  int? get sampleDuration => throw _privateConstructorUsedError;

  /// time spent generating the response
  @JsonKey(name: 'total_duration', includeIfNull: false)
  int? get totalDuration => throw _privateConstructorUsedError;

  /// time spent in nanoseconds loading the model
  @JsonKey(name: 'load_duration', includeIfNull: false)
  int? get loadDuration => throw _privateConstructorUsedError;

  /// number of tokens in the prompt
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  int? get promptEvalCount => throw _privateConstructorUsedError;

  /// time spent in nanoseconds evaluating the prompt
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  int? get promptEvalDuration => throw _privateConstructorUsedError;

  /// number of tokens the response
  @JsonKey(name: 'eval_count', includeIfNull: false)
  int? get evalCount => throw _privateConstructorUsedError;

  /// time in nanoseconds spent generating the response
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  int? get evalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateResponseCopyWith<GenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateResponseCopyWith<$Res> {
  factory $GenerateResponseCopyWith(
          GenerateResponse value, $Res Function(GenerateResponse) then) =
      _$GenerateResponseCopyWithImpl<$Res, GenerateResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,
      @JsonKey(includeIfNull: false) String? response,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(name: 'sample_count', includeIfNull: false) int? sampleCount,
      @JsonKey(name: 'sample_duration', includeIfNull: false)
      int? sampleDuration,
      @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      int? promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      int? promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration});
}

/// @nodoc
class _$GenerateResponseCopyWithImpl<$Res, $Val extends GenerateResponse>
    implements $GenerateResponseCopyWith<$Res> {
  _$GenerateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? createdAt = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? context = freezed,
    Object? sampleCount = freezed,
    Object? sampleDuration = freezed,
    Object? totalDuration = freezed,
    Object? loadDuration = freezed,
    Object? promptEvalCount = freezed,
    Object? promptEvalDuration = freezed,
    Object? evalCount = freezed,
    Object? evalDuration = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sampleCount: freezed == sampleCount
          ? _value.sampleCount
          : sampleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleDuration: freezed == sampleDuration
          ? _value.sampleDuration
          : sampleDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      loadDuration: freezed == loadDuration
          ? _value.loadDuration
          : loadDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      promptEvalCount: freezed == promptEvalCount
          ? _value.promptEvalCount
          : promptEvalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      promptEvalDuration: freezed == promptEvalDuration
          ? _value.promptEvalDuration
          : promptEvalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      evalCount: freezed == evalCount
          ? _value.evalCount
          : evalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      evalDuration: freezed == evalDuration
          ? _value.evalDuration
          : evalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateResponseImplCopyWith<$Res>
    implements $GenerateResponseCopyWith<$Res> {
  factory _$$GenerateResponseImplCopyWith(_$GenerateResponseImpl value,
          $Res Function(_$GenerateResponseImpl) then) =
      __$$GenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,
      @JsonKey(includeIfNull: false) String? response,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(name: 'sample_count', includeIfNull: false) int? sampleCount,
      @JsonKey(name: 'sample_duration', includeIfNull: false)
      int? sampleDuration,
      @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      int? promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      int? promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration});
}

/// @nodoc
class __$$GenerateResponseImplCopyWithImpl<$Res>
    extends _$GenerateResponseCopyWithImpl<$Res, _$GenerateResponseImpl>
    implements _$$GenerateResponseImplCopyWith<$Res> {
  __$$GenerateResponseImplCopyWithImpl(_$GenerateResponseImpl _value,
      $Res Function(_$GenerateResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? createdAt = freezed,
    Object? response = freezed,
    Object? done = freezed,
    Object? context = freezed,
    Object? sampleCount = freezed,
    Object? sampleDuration = freezed,
    Object? totalDuration = freezed,
    Object? loadDuration = freezed,
    Object? promptEvalCount = freezed,
    Object? promptEvalDuration = freezed,
    Object? evalCount = freezed,
    Object? evalDuration = freezed,
  }) {
    return _then(_$GenerateResponseImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sampleCount: freezed == sampleCount
          ? _value.sampleCount
          : sampleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      sampleDuration: freezed == sampleDuration
          ? _value.sampleDuration
          : sampleDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDuration: freezed == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      loadDuration: freezed == loadDuration
          ? _value.loadDuration
          : loadDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      promptEvalCount: freezed == promptEvalCount
          ? _value.promptEvalCount
          : promptEvalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      promptEvalDuration: freezed == promptEvalDuration
          ? _value.promptEvalDuration
          : promptEvalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      evalCount: freezed == evalCount
          ? _value.evalCount
          : evalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      evalDuration: freezed == evalDuration
          ? _value.evalDuration
          : evalDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateResponseImpl extends _GenerateResponse {
  const _$GenerateResponseImpl(
      {@JsonKey(includeIfNull: false) this.model,
      @JsonKey(name: 'created_at', includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.response,
      @JsonKey(includeIfNull: false) this.done,
      @JsonKey(includeIfNull: false) final List<int>? context,
      @JsonKey(name: 'sample_count', includeIfNull: false) this.sampleCount,
      @JsonKey(name: 'sample_duration', includeIfNull: false)
      this.sampleDuration,
      @JsonKey(name: 'total_duration', includeIfNull: false) this.totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) this.loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      this.promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      this.promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) this.evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) this.evalDuration})
      : _context = context,
        super._();

  factory _$GenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateResponseImplFromJson(json);

  /// Model names follow a model:tag format. Some examples are orca-mini:3b-q4_1 and llama2:70b. The tag is optional and, if not provided, will default to latest. The tag is used to identify a specific version.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// Date on which a model was created
  @override
  @JsonKey(name: 'created_at', includeIfNull: false)
  final String? createdAt;

  /// a response for a given prompt with a provided model. when finished, empty if the response was streamed, if not streamed, this will contain the full response.
  @override
  @JsonKey(includeIfNull: false)
  final String? response;

  /// whether the response has completed.
  @override
  @JsonKey(includeIfNull: false)
  final bool? done;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  final List<int>? _context;

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @override
  @JsonKey(includeIfNull: false)
  List<int>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// number of samples generated
  @override
  @JsonKey(name: 'sample_count', includeIfNull: false)
  final int? sampleCount;

  /// time spent generating samples
  @override
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  final int? sampleDuration;

  /// time spent generating the response
  @override
  @JsonKey(name: 'total_duration', includeIfNull: false)
  final int? totalDuration;

  /// time spent in nanoseconds loading the model
  @override
  @JsonKey(name: 'load_duration', includeIfNull: false)
  final int? loadDuration;

  /// number of tokens in the prompt
  @override
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  final int? promptEvalCount;

  /// time spent in nanoseconds evaluating the prompt
  @override
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  final int? promptEvalDuration;

  /// number of tokens the response
  @override
  @JsonKey(name: 'eval_count', includeIfNull: false)
  final int? evalCount;

  /// time in nanoseconds spent generating the response
  @override
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  final int? evalDuration;

  @override
  String toString() {
    return 'GenerateResponse(model: $model, createdAt: $createdAt, response: $response, done: $done, context: $context, sampleCount: $sampleCount, sampleDuration: $sampleDuration, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateResponseImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.sampleCount, sampleCount) ||
                other.sampleCount == sampleCount) &&
            (identical(other.sampleDuration, sampleDuration) ||
                other.sampleDuration == sampleDuration) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.loadDuration, loadDuration) ||
                other.loadDuration == loadDuration) &&
            (identical(other.promptEvalCount, promptEvalCount) ||
                other.promptEvalCount == promptEvalCount) &&
            (identical(other.promptEvalDuration, promptEvalDuration) ||
                other.promptEvalDuration == promptEvalDuration) &&
            (identical(other.evalCount, evalCount) ||
                other.evalCount == evalCount) &&
            (identical(other.evalDuration, evalDuration) ||
                other.evalDuration == evalDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      createdAt,
      response,
      done,
      const DeepCollectionEquality().hash(_context),
      sampleCount,
      sampleDuration,
      totalDuration,
      loadDuration,
      promptEvalCount,
      promptEvalDuration,
      evalCount,
      evalDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateResponseImplCopyWith<_$GenerateResponseImpl> get copyWith =>
      __$$GenerateResponseImplCopyWithImpl<_$GenerateResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateResponse extends GenerateResponse {
  const factory _GenerateResponse(
      {@JsonKey(includeIfNull: false) final String? model,
      @JsonKey(name: 'created_at', includeIfNull: false)
      final String? createdAt,
      @JsonKey(includeIfNull: false) final String? response,
      @JsonKey(includeIfNull: false) final bool? done,
      @JsonKey(includeIfNull: false) final List<int>? context,
      @JsonKey(name: 'sample_count', includeIfNull: false)
      final int? sampleCount,
      @JsonKey(name: 'sample_duration', includeIfNull: false)
      final int? sampleDuration,
      @JsonKey(name: 'total_duration', includeIfNull: false)
      final int? totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false)
      final int? loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      final int? promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      final int? promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) final int? evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false)
      final int? evalDuration}) = _$GenerateResponseImpl;
  const _GenerateResponse._() : super._();

  factory _GenerateResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateResponseImpl.fromJson;

  @override

  /// Model names follow a model:tag format. Some examples are orca-mini:3b-q4_1 and llama2:70b. The tag is optional and, if not provided, will default to latest. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get model;
  @override

  /// Date on which a model was created
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt;
  @override

  /// a response for a given prompt with a provided model. when finished, empty if the response was streamed, if not streamed, this will contain the full response.
  @JsonKey(includeIfNull: false)
  String? get response;
  @override

  /// whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done;
  @override

  /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
  @JsonKey(includeIfNull: false)
  List<int>? get context;
  @override

  /// number of samples generated
  @JsonKey(name: 'sample_count', includeIfNull: false)
  int? get sampleCount;
  @override

  /// time spent generating samples
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  int? get sampleDuration;
  @override

  /// time spent generating the response
  @JsonKey(name: 'total_duration', includeIfNull: false)
  int? get totalDuration;
  @override

  /// time spent in nanoseconds loading the model
  @JsonKey(name: 'load_duration', includeIfNull: false)
  int? get loadDuration;
  @override

  /// number of tokens in the prompt
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  int? get promptEvalCount;
  @override

  /// time spent in nanoseconds evaluating the prompt
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  int? get promptEvalDuration;
  @override

  /// number of tokens the response
  @JsonKey(name: 'eval_count', includeIfNull: false)
  int? get evalCount;
  @override

  /// time in nanoseconds spent generating the response
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  int? get evalDuration;
  @override
  @JsonKey(ignore: true)
  _$$GenerateResponseImplCopyWith<_$GenerateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRequest _$CreateRequestFromJson(Map<String, dynamic> json) {
  return _CreateRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateRequest {
  /// (required) the model name
  String get name => throw _privateConstructorUsedError;

  /// contents of the Modelfile
  String get modelfile => throw _privateConstructorUsedError;

  /// path to the Modelfile (deprecated: please use modelfile instead)
  @JsonKey(includeIfNull: false)
  String? get path => throw _privateConstructorUsedError;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRequestCopyWith<CreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRequestCopyWith<$Res> {
  factory $CreateRequestCopyWith(
          CreateRequest value, $Res Function(CreateRequest) then) =
      _$CreateRequestCopyWithImpl<$Res, CreateRequest>;
  @useResult
  $Res call(
      {String name,
      String modelfile,
      @JsonKey(includeIfNull: false) String? path,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class _$CreateRequestCopyWithImpl<$Res, $Val extends CreateRequest>
    implements $CreateRequestCopyWith<$Res> {
  _$CreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? modelfile = null,
    Object? path = freezed,
    Object? stream = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelfile: null == modelfile
          ? _value.modelfile
          : modelfile // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRequestImplCopyWith<$Res>
    implements $CreateRequestCopyWith<$Res> {
  factory _$$CreateRequestImplCopyWith(
          _$CreateRequestImpl value, $Res Function(_$CreateRequestImpl) then) =
      __$$CreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String modelfile,
      @JsonKey(includeIfNull: false) String? path,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class __$$CreateRequestImplCopyWithImpl<$Res>
    extends _$CreateRequestCopyWithImpl<$Res, _$CreateRequestImpl>
    implements _$$CreateRequestImplCopyWith<$Res> {
  __$$CreateRequestImplCopyWithImpl(
      _$CreateRequestImpl _value, $Res Function(_$CreateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? modelfile = null,
    Object? path = freezed,
    Object? stream = freezed,
  }) {
    return _then(_$CreateRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelfile: null == modelfile
          ? _value.modelfile
          : modelfile // ignore: cast_nullable_to_non_nullable
              as String,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRequestImpl extends _CreateRequest {
  const _$CreateRequestImpl(
      {required this.name,
      required this.modelfile,
      @JsonKey(includeIfNull: false) this.path,
      @JsonKey(includeIfNull: false) this.stream})
      : super._();

  factory _$CreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRequestImplFromJson(json);

  /// (required) the model name
  @override
  final String name;

  /// contents of the Modelfile
  @override
  final String modelfile;

  /// path to the Modelfile (deprecated: please use modelfile instead)
  @override
  @JsonKey(includeIfNull: false)
  final String? path;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  @override
  String toString() {
    return 'CreateRequest(name: $name, modelfile: $modelfile, path: $path, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modelfile, modelfile) ||
                other.modelfile == modelfile) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, modelfile, path, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRequestImplCopyWith<_$CreateRequestImpl> get copyWith =>
      __$$CreateRequestImplCopyWithImpl<_$CreateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateRequest extends CreateRequest {
  const factory _CreateRequest(
      {required final String name,
      required final String modelfile,
      @JsonKey(includeIfNull: false) final String? path,
      @JsonKey(includeIfNull: false) final bool? stream}) = _$CreateRequestImpl;
  const _CreateRequest._() : super._();

  factory _CreateRequest.fromJson(Map<String, dynamic> json) =
      _$CreateRequestImpl.fromJson;

  @override

  /// (required) the model name
  String get name;
  @override

  /// contents of the Modelfile
  String get modelfile;
  @override

  /// path to the Modelfile (deprecated: please use modelfile instead)
  @JsonKey(includeIfNull: false)
  String? get path;
  @override

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream;
  @override
  @JsonKey(ignore: true)
  _$$CreateRequestImplCopyWith<_$CreateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateResponse _$CreateResponseFromJson(Map<String, dynamic> json) {
  return _CreateResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateResponse {
  /// Status creating the model
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CreateResponseStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateResponseCopyWith<CreateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateResponseCopyWith<$Res> {
  factory $CreateResponseCopyWith(
          CreateResponse value, $Res Function(CreateResponse) then) =
      _$CreateResponseCopyWithImpl<$Res, CreateResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CreateResponseStatus? status});
}

/// @nodoc
class _$CreateResponseCopyWithImpl<$Res, $Val extends CreateResponse>
    implements $CreateResponseCopyWith<$Res> {
  _$CreateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateResponseStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateResponseImplCopyWith<$Res>
    implements $CreateResponseCopyWith<$Res> {
  factory _$$CreateResponseImplCopyWith(_$CreateResponseImpl value,
          $Res Function(_$CreateResponseImpl) then) =
      __$$CreateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CreateResponseStatus? status});
}

/// @nodoc
class __$$CreateResponseImplCopyWithImpl<$Res>
    extends _$CreateResponseCopyWithImpl<$Res, _$CreateResponseImpl>
    implements _$$CreateResponseImplCopyWith<$Res> {
  __$$CreateResponseImplCopyWithImpl(
      _$CreateResponseImpl _value, $Res Function(_$CreateResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$CreateResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateResponseStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateResponseImpl extends _CreateResponse {
  const _$CreateResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status})
      : super._();

  factory _$CreateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateResponseImplFromJson(json);

  /// Status creating the model
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CreateResponseStatus? status;

  @override
  String toString() {
    return 'CreateResponse(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateResponseImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateResponseImplCopyWith<_$CreateResponseImpl> get copyWith =>
      __$$CreateResponseImplCopyWithImpl<_$CreateResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateResponse extends CreateResponse {
  const factory _CreateResponse(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final CreateResponseStatus? status}) = _$CreateResponseImpl;
  const _CreateResponse._() : super._();

  factory _CreateResponse.fromJson(Map<String, dynamic> json) =
      _$CreateResponseImpl.fromJson;

  @override

  /// Status creating the model
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CreateResponseStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateResponseImplCopyWith<_$CreateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return _Options.fromJson(json);
}

/// @nodoc
mixin _$Options {
  /// No Description
  @JsonKey(name: 'num_keep', includeIfNull: false)
  int? get numKeep => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  int? get seed => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_predict', includeIfNull: false)
  int? get numPredict => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  double? get tfsZ => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'typical_p', includeIfNull: false)
  double? get typicalP => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  int? get repeatLastN => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  double? get repeatPenalty => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  double? get presencePenalty => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  double? get frequencyPenalty => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  int? get mirostat => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  double? get mirostatTau => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  double? get mirostatEta => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  bool? get penalizeNewline => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  List<String>? get stop => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  bool? get numa => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  int? get numCtx => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_batch', includeIfNull: false)
  int? get numBatch => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  int? get numGqa => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  int? get numGpu => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  int? get mainGpu => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'low_vram', includeIfNull: false)
  bool? get lowVram => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  bool? get f16Kv => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'logits_all', includeIfNull: false)
  bool? get logitsAll => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  bool? get vocabOnly => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  bool? get useMmap => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  bool? get useMlock => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  bool? get embeddingOnly => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  double? get ropeFrequencyBase => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  double? get ropeFrequencyScale => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'num_thread', includeIfNull: false)
  int? get numThread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res, Options>;
  @useResult
  $Res call(
      {@JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,
      @JsonKey(includeIfNull: false) int? seed,
      @JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      @JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,
      @JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,
      @JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'repeat_penalty', includeIfNull: false)
      double? repeatPenalty,
      @JsonKey(name: 'presence_penalty', includeIfNull: false)
      double? presencePenalty,
      @JsonKey(name: 'frequency_penalty', includeIfNull: false)
      double? frequencyPenalty,
      @JsonKey(includeIfNull: false) int? mirostat,
      @JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,
      @JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,
      @JsonKey(name: 'penalize_newline', includeIfNull: false)
      bool? penalizeNewline,
      @JsonKey(includeIfNull: false) List<String>? stop,
      @JsonKey(includeIfNull: false) bool? numa,
      @JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,
      @JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,
      @JsonKey(name: 'num_gqa', includeIfNull: false) int? numGqa,
      @JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,
      @JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,
      @JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,
      @JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,
      @JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,
      @JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,
      @JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,
      @JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,
      @JsonKey(name: 'embedding_only', includeIfNull: false)
      bool? embeddingOnly,
      @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
      double? ropeFrequencyBase,
      @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
      double? ropeFrequencyScale,
      @JsonKey(name: 'num_thread', includeIfNull: false) int? numThread});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res, $Val extends Options>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numKeep = freezed,
    Object? seed = freezed,
    Object? numPredict = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? tfsZ = freezed,
    Object? typicalP = freezed,
    Object? repeatLastN = freezed,
    Object? temperature = freezed,
    Object? repeatPenalty = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
    Object? mirostat = freezed,
    Object? mirostatTau = freezed,
    Object? mirostatEta = freezed,
    Object? penalizeNewline = freezed,
    Object? stop = freezed,
    Object? numa = freezed,
    Object? numCtx = freezed,
    Object? numBatch = freezed,
    Object? numGqa = freezed,
    Object? numGpu = freezed,
    Object? mainGpu = freezed,
    Object? lowVram = freezed,
    Object? f16Kv = freezed,
    Object? logitsAll = freezed,
    Object? vocabOnly = freezed,
    Object? useMmap = freezed,
    Object? useMlock = freezed,
    Object? embeddingOnly = freezed,
    Object? ropeFrequencyBase = freezed,
    Object? ropeFrequencyScale = freezed,
    Object? numThread = freezed,
  }) {
    return _then(_value.copyWith(
      numKeep: freezed == numKeep
          ? _value.numKeep
          : numKeep // ignore: cast_nullable_to_non_nullable
              as int?,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      numPredict: freezed == numPredict
          ? _value.numPredict
          : numPredict // ignore: cast_nullable_to_non_nullable
              as int?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      tfsZ: freezed == tfsZ
          ? _value.tfsZ
          : tfsZ // ignore: cast_nullable_to_non_nullable
              as double?,
      typicalP: freezed == typicalP
          ? _value.typicalP
          : typicalP // ignore: cast_nullable_to_non_nullable
              as double?,
      repeatLastN: freezed == repeatLastN
          ? _value.repeatLastN
          : repeatLastN // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      repeatPenalty: freezed == repeatPenalty
          ? _value.repeatPenalty
          : repeatPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      mirostat: freezed == mirostat
          ? _value.mirostat
          : mirostat // ignore: cast_nullable_to_non_nullable
              as int?,
      mirostatTau: freezed == mirostatTau
          ? _value.mirostatTau
          : mirostatTau // ignore: cast_nullable_to_non_nullable
              as double?,
      mirostatEta: freezed == mirostatEta
          ? _value.mirostatEta
          : mirostatEta // ignore: cast_nullable_to_non_nullable
              as double?,
      penalizeNewline: freezed == penalizeNewline
          ? _value.penalizeNewline
          : penalizeNewline // ignore: cast_nullable_to_non_nullable
              as bool?,
      stop: freezed == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numa: freezed == numa
          ? _value.numa
          : numa // ignore: cast_nullable_to_non_nullable
              as bool?,
      numCtx: freezed == numCtx
          ? _value.numCtx
          : numCtx // ignore: cast_nullable_to_non_nullable
              as int?,
      numBatch: freezed == numBatch
          ? _value.numBatch
          : numBatch // ignore: cast_nullable_to_non_nullable
              as int?,
      numGqa: freezed == numGqa
          ? _value.numGqa
          : numGqa // ignore: cast_nullable_to_non_nullable
              as int?,
      numGpu: freezed == numGpu
          ? _value.numGpu
          : numGpu // ignore: cast_nullable_to_non_nullable
              as int?,
      mainGpu: freezed == mainGpu
          ? _value.mainGpu
          : mainGpu // ignore: cast_nullable_to_non_nullable
              as int?,
      lowVram: freezed == lowVram
          ? _value.lowVram
          : lowVram // ignore: cast_nullable_to_non_nullable
              as bool?,
      f16Kv: freezed == f16Kv
          ? _value.f16Kv
          : f16Kv // ignore: cast_nullable_to_non_nullable
              as bool?,
      logitsAll: freezed == logitsAll
          ? _value.logitsAll
          : logitsAll // ignore: cast_nullable_to_non_nullable
              as bool?,
      vocabOnly: freezed == vocabOnly
          ? _value.vocabOnly
          : vocabOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      useMmap: freezed == useMmap
          ? _value.useMmap
          : useMmap // ignore: cast_nullable_to_non_nullable
              as bool?,
      useMlock: freezed == useMlock
          ? _value.useMlock
          : useMlock // ignore: cast_nullable_to_non_nullable
              as bool?,
      embeddingOnly: freezed == embeddingOnly
          ? _value.embeddingOnly
          : embeddingOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      ropeFrequencyBase: freezed == ropeFrequencyBase
          ? _value.ropeFrequencyBase
          : ropeFrequencyBase // ignore: cast_nullable_to_non_nullable
              as double?,
      ropeFrequencyScale: freezed == ropeFrequencyScale
          ? _value.ropeFrequencyScale
          : ropeFrequencyScale // ignore: cast_nullable_to_non_nullable
              as double?,
      numThread: freezed == numThread
          ? _value.numThread
          : numThread // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionsImplCopyWith<$Res> implements $OptionsCopyWith<$Res> {
  factory _$$OptionsImplCopyWith(
          _$OptionsImpl value, $Res Function(_$OptionsImpl) then) =
      __$$OptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'num_keep', includeIfNull: false) int? numKeep,
      @JsonKey(includeIfNull: false) int? seed,
      @JsonKey(name: 'num_predict', includeIfNull: false) int? numPredict,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      @JsonKey(name: 'tfs_z', includeIfNull: false) double? tfsZ,
      @JsonKey(name: 'typical_p', includeIfNull: false) double? typicalP,
      @JsonKey(name: 'repeat_last_n', includeIfNull: false) int? repeatLastN,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'repeat_penalty', includeIfNull: false)
      double? repeatPenalty,
      @JsonKey(name: 'presence_penalty', includeIfNull: false)
      double? presencePenalty,
      @JsonKey(name: 'frequency_penalty', includeIfNull: false)
      double? frequencyPenalty,
      @JsonKey(includeIfNull: false) int? mirostat,
      @JsonKey(name: 'mirostat_tau', includeIfNull: false) double? mirostatTau,
      @JsonKey(name: 'mirostat_eta', includeIfNull: false) double? mirostatEta,
      @JsonKey(name: 'penalize_newline', includeIfNull: false)
      bool? penalizeNewline,
      @JsonKey(includeIfNull: false) List<String>? stop,
      @JsonKey(includeIfNull: false) bool? numa,
      @JsonKey(name: 'num_ctx', includeIfNull: false) int? numCtx,
      @JsonKey(name: 'num_batch', includeIfNull: false) int? numBatch,
      @JsonKey(name: 'num_gqa', includeIfNull: false) int? numGqa,
      @JsonKey(name: 'num_gpu', includeIfNull: false) int? numGpu,
      @JsonKey(name: 'main_gpu', includeIfNull: false) int? mainGpu,
      @JsonKey(name: 'low_vram', includeIfNull: false) bool? lowVram,
      @JsonKey(name: 'f16_kv', includeIfNull: false) bool? f16Kv,
      @JsonKey(name: 'logits_all', includeIfNull: false) bool? logitsAll,
      @JsonKey(name: 'vocab_only', includeIfNull: false) bool? vocabOnly,
      @JsonKey(name: 'use_mmap', includeIfNull: false) bool? useMmap,
      @JsonKey(name: 'use_mlock', includeIfNull: false) bool? useMlock,
      @JsonKey(name: 'embedding_only', includeIfNull: false)
      bool? embeddingOnly,
      @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
      double? ropeFrequencyBase,
      @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
      double? ropeFrequencyScale,
      @JsonKey(name: 'num_thread', includeIfNull: false) int? numThread});
}

/// @nodoc
class __$$OptionsImplCopyWithImpl<$Res>
    extends _$OptionsCopyWithImpl<$Res, _$OptionsImpl>
    implements _$$OptionsImplCopyWith<$Res> {
  __$$OptionsImplCopyWithImpl(
      _$OptionsImpl _value, $Res Function(_$OptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numKeep = freezed,
    Object? seed = freezed,
    Object? numPredict = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
    Object? tfsZ = freezed,
    Object? typicalP = freezed,
    Object? repeatLastN = freezed,
    Object? temperature = freezed,
    Object? repeatPenalty = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
    Object? mirostat = freezed,
    Object? mirostatTau = freezed,
    Object? mirostatEta = freezed,
    Object? penalizeNewline = freezed,
    Object? stop = freezed,
    Object? numa = freezed,
    Object? numCtx = freezed,
    Object? numBatch = freezed,
    Object? numGqa = freezed,
    Object? numGpu = freezed,
    Object? mainGpu = freezed,
    Object? lowVram = freezed,
    Object? f16Kv = freezed,
    Object? logitsAll = freezed,
    Object? vocabOnly = freezed,
    Object? useMmap = freezed,
    Object? useMlock = freezed,
    Object? embeddingOnly = freezed,
    Object? ropeFrequencyBase = freezed,
    Object? ropeFrequencyScale = freezed,
    Object? numThread = freezed,
  }) {
    return _then(_$OptionsImpl(
      numKeep: freezed == numKeep
          ? _value.numKeep
          : numKeep // ignore: cast_nullable_to_non_nullable
              as int?,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      numPredict: freezed == numPredict
          ? _value.numPredict
          : numPredict // ignore: cast_nullable_to_non_nullable
              as int?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      tfsZ: freezed == tfsZ
          ? _value.tfsZ
          : tfsZ // ignore: cast_nullable_to_non_nullable
              as double?,
      typicalP: freezed == typicalP
          ? _value.typicalP
          : typicalP // ignore: cast_nullable_to_non_nullable
              as double?,
      repeatLastN: freezed == repeatLastN
          ? _value.repeatLastN
          : repeatLastN // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      repeatPenalty: freezed == repeatPenalty
          ? _value.repeatPenalty
          : repeatPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      mirostat: freezed == mirostat
          ? _value.mirostat
          : mirostat // ignore: cast_nullable_to_non_nullable
              as int?,
      mirostatTau: freezed == mirostatTau
          ? _value.mirostatTau
          : mirostatTau // ignore: cast_nullable_to_non_nullable
              as double?,
      mirostatEta: freezed == mirostatEta
          ? _value.mirostatEta
          : mirostatEta // ignore: cast_nullable_to_non_nullable
              as double?,
      penalizeNewline: freezed == penalizeNewline
          ? _value.penalizeNewline
          : penalizeNewline // ignore: cast_nullable_to_non_nullable
              as bool?,
      stop: freezed == stop
          ? _value._stop
          : stop // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numa: freezed == numa
          ? _value.numa
          : numa // ignore: cast_nullable_to_non_nullable
              as bool?,
      numCtx: freezed == numCtx
          ? _value.numCtx
          : numCtx // ignore: cast_nullable_to_non_nullable
              as int?,
      numBatch: freezed == numBatch
          ? _value.numBatch
          : numBatch // ignore: cast_nullable_to_non_nullable
              as int?,
      numGqa: freezed == numGqa
          ? _value.numGqa
          : numGqa // ignore: cast_nullable_to_non_nullable
              as int?,
      numGpu: freezed == numGpu
          ? _value.numGpu
          : numGpu // ignore: cast_nullable_to_non_nullable
              as int?,
      mainGpu: freezed == mainGpu
          ? _value.mainGpu
          : mainGpu // ignore: cast_nullable_to_non_nullable
              as int?,
      lowVram: freezed == lowVram
          ? _value.lowVram
          : lowVram // ignore: cast_nullable_to_non_nullable
              as bool?,
      f16Kv: freezed == f16Kv
          ? _value.f16Kv
          : f16Kv // ignore: cast_nullable_to_non_nullable
              as bool?,
      logitsAll: freezed == logitsAll
          ? _value.logitsAll
          : logitsAll // ignore: cast_nullable_to_non_nullable
              as bool?,
      vocabOnly: freezed == vocabOnly
          ? _value.vocabOnly
          : vocabOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      useMmap: freezed == useMmap
          ? _value.useMmap
          : useMmap // ignore: cast_nullable_to_non_nullable
              as bool?,
      useMlock: freezed == useMlock
          ? _value.useMlock
          : useMlock // ignore: cast_nullable_to_non_nullable
              as bool?,
      embeddingOnly: freezed == embeddingOnly
          ? _value.embeddingOnly
          : embeddingOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      ropeFrequencyBase: freezed == ropeFrequencyBase
          ? _value.ropeFrequencyBase
          : ropeFrequencyBase // ignore: cast_nullable_to_non_nullable
              as double?,
      ropeFrequencyScale: freezed == ropeFrequencyScale
          ? _value.ropeFrequencyScale
          : ropeFrequencyScale // ignore: cast_nullable_to_non_nullable
              as double?,
      numThread: freezed == numThread
          ? _value.numThread
          : numThread // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionsImpl extends _Options {
  const _$OptionsImpl(
      {@JsonKey(name: 'num_keep', includeIfNull: false) this.numKeep,
      @JsonKey(includeIfNull: false) this.seed,
      @JsonKey(name: 'num_predict', includeIfNull: false) this.numPredict,
      @JsonKey(name: 'top_k', includeIfNull: false) this.topK,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP,
      @JsonKey(name: 'tfs_z', includeIfNull: false) this.tfsZ,
      @JsonKey(name: 'typical_p', includeIfNull: false) this.typicalP,
      @JsonKey(name: 'repeat_last_n', includeIfNull: false) this.repeatLastN,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(name: 'repeat_penalty', includeIfNull: false) this.repeatPenalty,
      @JsonKey(name: 'presence_penalty', includeIfNull: false)
      this.presencePenalty,
      @JsonKey(name: 'frequency_penalty', includeIfNull: false)
      this.frequencyPenalty,
      @JsonKey(includeIfNull: false) this.mirostat,
      @JsonKey(name: 'mirostat_tau', includeIfNull: false) this.mirostatTau,
      @JsonKey(name: 'mirostat_eta', includeIfNull: false) this.mirostatEta,
      @JsonKey(name: 'penalize_newline', includeIfNull: false)
      this.penalizeNewline,
      @JsonKey(includeIfNull: false) final List<String>? stop,
      @JsonKey(includeIfNull: false) this.numa,
      @JsonKey(name: 'num_ctx', includeIfNull: false) this.numCtx,
      @JsonKey(name: 'num_batch', includeIfNull: false) this.numBatch,
      @JsonKey(name: 'num_gqa', includeIfNull: false) this.numGqa,
      @JsonKey(name: 'num_gpu', includeIfNull: false) this.numGpu,
      @JsonKey(name: 'main_gpu', includeIfNull: false) this.mainGpu,
      @JsonKey(name: 'low_vram', includeIfNull: false) this.lowVram,
      @JsonKey(name: 'f16_kv', includeIfNull: false) this.f16Kv,
      @JsonKey(name: 'logits_all', includeIfNull: false) this.logitsAll,
      @JsonKey(name: 'vocab_only', includeIfNull: false) this.vocabOnly,
      @JsonKey(name: 'use_mmap', includeIfNull: false) this.useMmap,
      @JsonKey(name: 'use_mlock', includeIfNull: false) this.useMlock,
      @JsonKey(name: 'embedding_only', includeIfNull: false) this.embeddingOnly,
      @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
      this.ropeFrequencyBase,
      @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
      this.ropeFrequencyScale,
      @JsonKey(name: 'num_thread', includeIfNull: false) this.numThread})
      : _stop = stop,
        super._();

  factory _$OptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionsImplFromJson(json);

  /// No Description
  @override
  @JsonKey(name: 'num_keep', includeIfNull: false)
  final int? numKeep;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final int? seed;

  /// No Description
  @override
  @JsonKey(name: 'num_predict', includeIfNull: false)
  final int? numPredict;

  /// No Description
  @override
  @JsonKey(name: 'top_k', includeIfNull: false)
  final int? topK;

  /// No Description
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  /// No Description
  @override
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  final double? tfsZ;

  /// No Description
  @override
  @JsonKey(name: 'typical_p', includeIfNull: false)
  final double? typicalP;

  /// No Description
  @override
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  final int? repeatLastN;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// No Description
  @override
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  final double? repeatPenalty;

  /// No Description
  @override
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  final double? presencePenalty;

  /// No Description
  @override
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  final double? frequencyPenalty;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final int? mirostat;

  /// No Description
  @override
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  final double? mirostatTau;

  /// No Description
  @override
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  final double? mirostatEta;

  /// No Description
  @override
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  final bool? penalizeNewline;

  /// No Description
  final List<String>? _stop;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get stop {
    final value = _stop;
    if (value == null) return null;
    if (_stop is EqualUnmodifiableListView) return _stop;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final bool? numa;

  /// No Description
  @override
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  final int? numCtx;

  /// No Description
  @override
  @JsonKey(name: 'num_batch', includeIfNull: false)
  final int? numBatch;

  /// No Description
  @override
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  final int? numGqa;

  /// No Description
  @override
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  final int? numGpu;

  /// No Description
  @override
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  final int? mainGpu;

  /// No Description
  @override
  @JsonKey(name: 'low_vram', includeIfNull: false)
  final bool? lowVram;

  /// No Description
  @override
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  final bool? f16Kv;

  /// No Description
  @override
  @JsonKey(name: 'logits_all', includeIfNull: false)
  final bool? logitsAll;

  /// No Description
  @override
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  final bool? vocabOnly;

  /// No Description
  @override
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  final bool? useMmap;

  /// No Description
  @override
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  final bool? useMlock;

  /// No Description
  @override
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  final bool? embeddingOnly;

  /// No Description
  @override
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  final double? ropeFrequencyBase;

  /// No Description
  @override
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  final double? ropeFrequencyScale;

  /// No Description
  @override
  @JsonKey(name: 'num_thread', includeIfNull: false)
  final int? numThread;

  @override
  String toString() {
    return 'Options(numKeep: $numKeep, seed: $seed, numPredict: $numPredict, topK: $topK, topP: $topP, tfsZ: $tfsZ, typicalP: $typicalP, repeatLastN: $repeatLastN, temperature: $temperature, repeatPenalty: $repeatPenalty, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, mirostat: $mirostat, mirostatTau: $mirostatTau, mirostatEta: $mirostatEta, penalizeNewline: $penalizeNewline, stop: $stop, numa: $numa, numCtx: $numCtx, numBatch: $numBatch, numGqa: $numGqa, numGpu: $numGpu, mainGpu: $mainGpu, lowVram: $lowVram, f16Kv: $f16Kv, logitsAll: $logitsAll, vocabOnly: $vocabOnly, useMmap: $useMmap, useMlock: $useMlock, embeddingOnly: $embeddingOnly, ropeFrequencyBase: $ropeFrequencyBase, ropeFrequencyScale: $ropeFrequencyScale, numThread: $numThread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionsImpl &&
            (identical(other.numKeep, numKeep) || other.numKeep == numKeep) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.numPredict, numPredict) ||
                other.numPredict == numPredict) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.tfsZ, tfsZ) || other.tfsZ == tfsZ) &&
            (identical(other.typicalP, typicalP) ||
                other.typicalP == typicalP) &&
            (identical(other.repeatLastN, repeatLastN) ||
                other.repeatLastN == repeatLastN) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.repeatPenalty, repeatPenalty) ||
                other.repeatPenalty == repeatPenalty) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty) &&
            (identical(other.mirostat, mirostat) ||
                other.mirostat == mirostat) &&
            (identical(other.mirostatTau, mirostatTau) ||
                other.mirostatTau == mirostatTau) &&
            (identical(other.mirostatEta, mirostatEta) ||
                other.mirostatEta == mirostatEta) &&
            (identical(other.penalizeNewline, penalizeNewline) ||
                other.penalizeNewline == penalizeNewline) &&
            const DeepCollectionEquality().equals(other._stop, _stop) &&
            (identical(other.numa, numa) || other.numa == numa) &&
            (identical(other.numCtx, numCtx) || other.numCtx == numCtx) &&
            (identical(other.numBatch, numBatch) ||
                other.numBatch == numBatch) &&
            (identical(other.numGqa, numGqa) || other.numGqa == numGqa) &&
            (identical(other.numGpu, numGpu) || other.numGpu == numGpu) &&
            (identical(other.mainGpu, mainGpu) || other.mainGpu == mainGpu) &&
            (identical(other.lowVram, lowVram) || other.lowVram == lowVram) &&
            (identical(other.f16Kv, f16Kv) || other.f16Kv == f16Kv) &&
            (identical(other.logitsAll, logitsAll) ||
                other.logitsAll == logitsAll) &&
            (identical(other.vocabOnly, vocabOnly) ||
                other.vocabOnly == vocabOnly) &&
            (identical(other.useMmap, useMmap) || other.useMmap == useMmap) &&
            (identical(other.useMlock, useMlock) ||
                other.useMlock == useMlock) &&
            (identical(other.embeddingOnly, embeddingOnly) ||
                other.embeddingOnly == embeddingOnly) &&
            (identical(other.ropeFrequencyBase, ropeFrequencyBase) ||
                other.ropeFrequencyBase == ropeFrequencyBase) &&
            (identical(other.ropeFrequencyScale, ropeFrequencyScale) ||
                other.ropeFrequencyScale == ropeFrequencyScale) &&
            (identical(other.numThread, numThread) ||
                other.numThread == numThread));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        numKeep,
        seed,
        numPredict,
        topK,
        topP,
        tfsZ,
        typicalP,
        repeatLastN,
        temperature,
        repeatPenalty,
        presencePenalty,
        frequencyPenalty,
        mirostat,
        mirostatTau,
        mirostatEta,
        penalizeNewline,
        const DeepCollectionEquality().hash(_stop),
        numa,
        numCtx,
        numBatch,
        numGqa,
        numGpu,
        mainGpu,
        lowVram,
        f16Kv,
        logitsAll,
        vocabOnly,
        useMmap,
        useMlock,
        embeddingOnly,
        ropeFrequencyBase,
        ropeFrequencyScale,
        numThread
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      __$$OptionsImplCopyWithImpl<_$OptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionsImplToJson(
      this,
    );
  }
}

abstract class _Options extends Options {
  const factory _Options(
      {@JsonKey(name: 'num_keep', includeIfNull: false) final int? numKeep,
      @JsonKey(includeIfNull: false) final int? seed,
      @JsonKey(name: 'num_predict', includeIfNull: false) final int? numPredict,
      @JsonKey(name: 'top_k', includeIfNull: false) final int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) final double? topP,
      @JsonKey(name: 'tfs_z', includeIfNull: false) final double? tfsZ,
      @JsonKey(name: 'typical_p', includeIfNull: false) final double? typicalP,
      @JsonKey(name: 'repeat_last_n', includeIfNull: false)
      final int? repeatLastN,
      @JsonKey(includeIfNull: false) final double? temperature,
      @JsonKey(name: 'repeat_penalty', includeIfNull: false)
      final double? repeatPenalty,
      @JsonKey(name: 'presence_penalty', includeIfNull: false)
      final double? presencePenalty,
      @JsonKey(name: 'frequency_penalty', includeIfNull: false)
      final double? frequencyPenalty,
      @JsonKey(includeIfNull: false) final int? mirostat,
      @JsonKey(name: 'mirostat_tau', includeIfNull: false)
      final double? mirostatTau,
      @JsonKey(name: 'mirostat_eta', includeIfNull: false)
      final double? mirostatEta,
      @JsonKey(name: 'penalize_newline', includeIfNull: false)
      final bool? penalizeNewline,
      @JsonKey(includeIfNull: false) final List<String>? stop,
      @JsonKey(includeIfNull: false) final bool? numa,
      @JsonKey(name: 'num_ctx', includeIfNull: false) final int? numCtx,
      @JsonKey(name: 'num_batch', includeIfNull: false) final int? numBatch,
      @JsonKey(name: 'num_gqa', includeIfNull: false) final int? numGqa,
      @JsonKey(name: 'num_gpu', includeIfNull: false) final int? numGpu,
      @JsonKey(name: 'main_gpu', includeIfNull: false) final int? mainGpu,
      @JsonKey(name: 'low_vram', includeIfNull: false) final bool? lowVram,
      @JsonKey(name: 'f16_kv', includeIfNull: false) final bool? f16Kv,
      @JsonKey(name: 'logits_all', includeIfNull: false) final bool? logitsAll,
      @JsonKey(name: 'vocab_only', includeIfNull: false) final bool? vocabOnly,
      @JsonKey(name: 'use_mmap', includeIfNull: false) final bool? useMmap,
      @JsonKey(name: 'use_mlock', includeIfNull: false) final bool? useMlock,
      @JsonKey(name: 'embedding_only', includeIfNull: false)
      final bool? embeddingOnly,
      @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
      final double? ropeFrequencyBase,
      @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
      final double? ropeFrequencyScale,
      @JsonKey(name: 'num_thread', includeIfNull: false)
      final int? numThread}) = _$OptionsImpl;
  const _Options._() : super._();

  factory _Options.fromJson(Map<String, dynamic> json) = _$OptionsImpl.fromJson;

  @override

  /// No Description
  @JsonKey(name: 'num_keep', includeIfNull: false)
  int? get numKeep;
  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  int? get seed;
  @override

  /// No Description
  @JsonKey(name: 'num_predict', includeIfNull: false)
  int? get numPredict;
  @override

  /// No Description
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK;
  @override

  /// No Description
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override

  /// No Description
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  double? get tfsZ;
  @override

  /// No Description
  @JsonKey(name: 'typical_p', includeIfNull: false)
  double? get typicalP;
  @override

  /// No Description
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  int? get repeatLastN;
  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// No Description
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  double? get repeatPenalty;
  @override

  /// No Description
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  double? get presencePenalty;
  @override

  /// No Description
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  double? get frequencyPenalty;
  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  int? get mirostat;
  @override

  /// No Description
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  double? get mirostatTau;
  @override

  /// No Description
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  double? get mirostatEta;
  @override

  /// No Description
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  bool? get penalizeNewline;
  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  List<String>? get stop;
  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  bool? get numa;
  @override

  /// No Description
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  int? get numCtx;
  @override

  /// No Description
  @JsonKey(name: 'num_batch', includeIfNull: false)
  int? get numBatch;
  @override

  /// No Description
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  int? get numGqa;
  @override

  /// No Description
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  int? get numGpu;
  @override

  /// No Description
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  int? get mainGpu;
  @override

  /// No Description
  @JsonKey(name: 'low_vram', includeIfNull: false)
  bool? get lowVram;
  @override

  /// No Description
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  bool? get f16Kv;
  @override

  /// No Description
  @JsonKey(name: 'logits_all', includeIfNull: false)
  bool? get logitsAll;
  @override

  /// No Description
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  bool? get vocabOnly;
  @override

  /// No Description
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  bool? get useMmap;
  @override

  /// No Description
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  bool? get useMlock;
  @override

  /// No Description
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  bool? get embeddingOnly;
  @override

  /// No Description
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  double? get ropeFrequencyBase;
  @override

  /// No Description
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  double? get ropeFrequencyScale;
  @override

  /// No Description
  @JsonKey(name: 'num_thread', includeIfNull: false)
  int? get numThread;
  @override
  @JsonKey(ignore: true)
  _$$OptionsImplCopyWith<_$OptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  /// Model name
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;

  /// Model modification date
  @JsonKey(name: 'modified_at', includeIfNull: false)
  String? get modifiedAt => throw _privateConstructorUsedError;

  /// Size of the model on disk
  @JsonKey(includeIfNull: false)
  int? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,
      @JsonKey(includeIfNull: false) int? size});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? modifiedAt = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,
      @JsonKey(includeIfNull: false) int? size});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? modifiedAt = freezed,
    Object? size = freezed,
  }) {
    return _then(_$TagImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagImpl extends _Tag {
  const _$TagImpl(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(name: 'modified_at', includeIfNull: false) this.modifiedAt,
      @JsonKey(includeIfNull: false) this.size})
      : super._();

  factory _$TagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagImplFromJson(json);

  /// Model name
  @override
  @JsonKey(includeIfNull: false)
  final String? name;

  /// Model modification date
  @override
  @JsonKey(name: 'modified_at', includeIfNull: false)
  final String? modifiedAt;

  /// Size of the model on disk
  @override
  @JsonKey(includeIfNull: false)
  final int? size;

  @override
  String toString() {
    return 'Tag(name: $name, modifiedAt: $modifiedAt, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, modifiedAt, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagImplToJson(
      this,
    );
  }
}

abstract class _Tag extends Tag {
  const factory _Tag(
      {@JsonKey(includeIfNull: false) final String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false)
      final String? modifiedAt,
      @JsonKey(includeIfNull: false) final int? size}) = _$TagImpl;
  const _Tag._() : super._();

  factory _Tag.fromJson(Map<String, dynamic> json) = _$TagImpl.fromJson;

  @override

  /// Model name
  @JsonKey(includeIfNull: false)
  String? get name;
  @override

  /// Model modification date
  @JsonKey(name: 'modified_at', includeIfNull: false)
  String? get modifiedAt;
  @override

  /// Size of the model on disk
  @JsonKey(includeIfNull: false)
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) {
  return _TagResponse.fromJson(json);
}

/// @nodoc
mixin _$TagResponse {
  /// No Description
  @JsonKey(includeIfNull: false)
  List<Tag>? get models => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagResponseCopyWith<TagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagResponseCopyWith<$Res> {
  factory $TagResponseCopyWith(
          TagResponse value, $Res Function(TagResponse) then) =
      _$TagResponseCopyWithImpl<$Res, TagResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Tag>? models});
}

/// @nodoc
class _$TagResponseCopyWithImpl<$Res, $Val extends TagResponse>
    implements $TagResponseCopyWith<$Res> {
  _$TagResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = freezed,
  }) {
    return _then(_value.copyWith(
      models: freezed == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagResponseImplCopyWith<$Res>
    implements $TagResponseCopyWith<$Res> {
  factory _$$TagResponseImplCopyWith(
          _$TagResponseImpl value, $Res Function(_$TagResponseImpl) then) =
      __$$TagResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Tag>? models});
}

/// @nodoc
class __$$TagResponseImplCopyWithImpl<$Res>
    extends _$TagResponseCopyWithImpl<$Res, _$TagResponseImpl>
    implements _$$TagResponseImplCopyWith<$Res> {
  __$$TagResponseImplCopyWithImpl(
      _$TagResponseImpl _value, $Res Function(_$TagResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = freezed,
  }) {
    return _then(_$TagResponseImpl(
      models: freezed == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagResponseImpl extends _TagResponse {
  const _$TagResponseImpl(
      {@JsonKey(includeIfNull: false) final List<Tag>? models})
      : _models = models,
        super._();

  factory _$TagResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagResponseImplFromJson(json);

  /// No Description
  final List<Tag>? _models;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<Tag>? get models {
    final value = _models;
    if (value == null) return null;
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TagResponse(models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagResponseImpl &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagResponseImplCopyWith<_$TagResponseImpl> get copyWith =>
      __$$TagResponseImplCopyWithImpl<_$TagResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagResponseImplToJson(
      this,
    );
  }
}

abstract class _TagResponse extends TagResponse {
  const factory _TagResponse(
          {@JsonKey(includeIfNull: false) final List<Tag>? models}) =
      _$TagResponseImpl;
  const _TagResponse._() : super._();

  factory _TagResponse.fromJson(Map<String, dynamic> json) =
      _$TagResponseImpl.fromJson;

  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  List<Tag>? get models;
  @override
  @JsonKey(ignore: true)
  _$$TagResponseImplCopyWith<_$TagResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShowRequest _$ShowRequestFromJson(Map<String, dynamic> json) {
  return _ShowRequest.fromJson(json);
}

/// @nodoc
mixin _$ShowRequest {
  /// (required) name of the model to show
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowRequestCopyWith<ShowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowRequestCopyWith<$Res> {
  factory $ShowRequestCopyWith(
          ShowRequest value, $Res Function(ShowRequest) then) =
      _$ShowRequestCopyWithImpl<$Res, ShowRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ShowRequestCopyWithImpl<$Res, $Val extends ShowRequest>
    implements $ShowRequestCopyWith<$Res> {
  _$ShowRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowRequestImplCopyWith<$Res>
    implements $ShowRequestCopyWith<$Res> {
  factory _$$ShowRequestImplCopyWith(
          _$ShowRequestImpl value, $Res Function(_$ShowRequestImpl) then) =
      __$$ShowRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ShowRequestImplCopyWithImpl<$Res>
    extends _$ShowRequestCopyWithImpl<$Res, _$ShowRequestImpl>
    implements _$$ShowRequestImplCopyWith<$Res> {
  __$$ShowRequestImplCopyWithImpl(
      _$ShowRequestImpl _value, $Res Function(_$ShowRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ShowRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShowRequestImpl extends _ShowRequest {
  const _$ShowRequestImpl({required this.name}) : super._();

  factory _$ShowRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowRequestImplFromJson(json);

  /// (required) name of the model to show
  @override
  final String name;

  @override
  String toString() {
    return 'ShowRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowRequestImplCopyWith<_$ShowRequestImpl> get copyWith =>
      __$$ShowRequestImplCopyWithImpl<_$ShowRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowRequestImplToJson(
      this,
    );
  }
}

abstract class _ShowRequest extends ShowRequest {
  const factory _ShowRequest({required final String name}) = _$ShowRequestImpl;
  const _ShowRequest._() : super._();

  factory _ShowRequest.fromJson(Map<String, dynamic> json) =
      _$ShowRequestImpl.fromJson;

  @override

  /// (required) name of the model to show
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ShowRequestImplCopyWith<_$ShowRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShowResponse _$ShowResponseFromJson(Map<String, dynamic> json) {
  return _ShowResponse.fromJson(json);
}

/// @nodoc
mixin _$ShowResponse {
  /// the model's license
  @JsonKey(includeIfNull: false)
  String? get license => throw _privateConstructorUsedError;

  /// the modelfile associated with the model
  @JsonKey(includeIfNull: false)
  String? get modelfile => throw _privateConstructorUsedError;

  /// model parameters
  @JsonKey(includeIfNull: false)
  String? get parameters => throw _privateConstructorUsedError;

  /// the prompt template for the model
  @JsonKey(includeIfNull: false)
  String? get template => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowResponseCopyWith<ShowResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowResponseCopyWith<$Res> {
  factory $ShowResponseCopyWith(
          ShowResponse value, $Res Function(ShowResponse) then) =
      _$ShowResponseCopyWithImpl<$Res, ShowResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? modelfile,
      @JsonKey(includeIfNull: false) String? parameters,
      @JsonKey(includeIfNull: false) String? template});
}

/// @nodoc
class _$ShowResponseCopyWithImpl<$Res, $Val extends ShowResponse>
    implements $ShowResponseCopyWith<$Res> {
  _$ShowResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? license = freezed,
    Object? modelfile = freezed,
    Object? parameters = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      modelfile: freezed == modelfile
          ? _value.modelfile
          : modelfile // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowResponseImplCopyWith<$Res>
    implements $ShowResponseCopyWith<$Res> {
  factory _$$ShowResponseImplCopyWith(
          _$ShowResponseImpl value, $Res Function(_$ShowResponseImpl) then) =
      __$$ShowResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? modelfile,
      @JsonKey(includeIfNull: false) String? parameters,
      @JsonKey(includeIfNull: false) String? template});
}

/// @nodoc
class __$$ShowResponseImplCopyWithImpl<$Res>
    extends _$ShowResponseCopyWithImpl<$Res, _$ShowResponseImpl>
    implements _$$ShowResponseImplCopyWith<$Res> {
  __$$ShowResponseImplCopyWithImpl(
      _$ShowResponseImpl _value, $Res Function(_$ShowResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? license = freezed,
    Object? modelfile = freezed,
    Object? parameters = freezed,
    Object? template = freezed,
  }) {
    return _then(_$ShowResponseImpl(
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      modelfile: freezed == modelfile
          ? _value.modelfile
          : modelfile // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShowResponseImpl extends _ShowResponse {
  const _$ShowResponseImpl(
      {@JsonKey(includeIfNull: false) this.license,
      @JsonKey(includeIfNull: false) this.modelfile,
      @JsonKey(includeIfNull: false) this.parameters,
      @JsonKey(includeIfNull: false) this.template})
      : super._();

  factory _$ShowResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShowResponseImplFromJson(json);

  /// the model's license
  @override
  @JsonKey(includeIfNull: false)
  final String? license;

  /// the modelfile associated with the model
  @override
  @JsonKey(includeIfNull: false)
  final String? modelfile;

  /// model parameters
  @override
  @JsonKey(includeIfNull: false)
  final String? parameters;

  /// the prompt template for the model
  @override
  @JsonKey(includeIfNull: false)
  final String? template;

  @override
  String toString() {
    return 'ShowResponse(license: $license, modelfile: $modelfile, parameters: $parameters, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowResponseImpl &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.modelfile, modelfile) ||
                other.modelfile == modelfile) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, license, modelfile, parameters, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowResponseImplCopyWith<_$ShowResponseImpl> get copyWith =>
      __$$ShowResponseImplCopyWithImpl<_$ShowResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShowResponseImplToJson(
      this,
    );
  }
}

abstract class _ShowResponse extends ShowResponse {
  const factory _ShowResponse(
          {@JsonKey(includeIfNull: false) final String? license,
          @JsonKey(includeIfNull: false) final String? modelfile,
          @JsonKey(includeIfNull: false) final String? parameters,
          @JsonKey(includeIfNull: false) final String? template}) =
      _$ShowResponseImpl;
  const _ShowResponse._() : super._();

  factory _ShowResponse.fromJson(Map<String, dynamic> json) =
      _$ShowResponseImpl.fromJson;

  @override

  /// the model's license
  @JsonKey(includeIfNull: false)
  String? get license;
  @override

  /// the modelfile associated with the model
  @JsonKey(includeIfNull: false)
  String? get modelfile;
  @override

  /// model parameters
  @JsonKey(includeIfNull: false)
  String? get parameters;
  @override

  /// the prompt template for the model
  @JsonKey(includeIfNull: false)
  String? get template;
  @override
  @JsonKey(ignore: true)
  _$$ShowResponseImplCopyWith<_$ShowResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CopyRequest _$CopyRequestFromJson(Map<String, dynamic> json) {
  return _CopyRequest.fromJson(json);
}

/// @nodoc
mixin _$CopyRequest {
  /// No Description
  String get source => throw _privateConstructorUsedError;

  /// No Description
  String get destination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CopyRequestCopyWith<CopyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyRequestCopyWith<$Res> {
  factory $CopyRequestCopyWith(
          CopyRequest value, $Res Function(CopyRequest) then) =
      _$CopyRequestCopyWithImpl<$Res, CopyRequest>;
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class _$CopyRequestCopyWithImpl<$Res, $Val extends CopyRequest>
    implements $CopyRequestCopyWith<$Res> {
  _$CopyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CopyRequestImplCopyWith<$Res>
    implements $CopyRequestCopyWith<$Res> {
  factory _$$CopyRequestImplCopyWith(
          _$CopyRequestImpl value, $Res Function(_$CopyRequestImpl) then) =
      __$$CopyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class __$$CopyRequestImplCopyWithImpl<$Res>
    extends _$CopyRequestCopyWithImpl<$Res, _$CopyRequestImpl>
    implements _$$CopyRequestImplCopyWith<$Res> {
  __$$CopyRequestImplCopyWithImpl(
      _$CopyRequestImpl _value, $Res Function(_$CopyRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_$CopyRequestImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CopyRequestImpl extends _CopyRequest {
  const _$CopyRequestImpl({required this.source, required this.destination})
      : super._();

  factory _$CopyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyRequestImplFromJson(json);

  /// No Description
  @override
  final String source;

  /// No Description
  @override
  final String destination;

  @override
  String toString() {
    return 'CopyRequest(source: $source, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyRequestImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, destination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyRequestImplCopyWith<_$CopyRequestImpl> get copyWith =>
      __$$CopyRequestImplCopyWithImpl<_$CopyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyRequestImplToJson(
      this,
    );
  }
}

abstract class _CopyRequest extends CopyRequest {
  const factory _CopyRequest(
      {required final String source,
      required final String destination}) = _$CopyRequestImpl;
  const _CopyRequest._() : super._();

  factory _CopyRequest.fromJson(Map<String, dynamic> json) =
      _$CopyRequestImpl.fromJson;

  @override

  /// No Description
  String get source;
  @override

  /// No Description
  String get destination;
  @override
  @JsonKey(ignore: true)
  _$$CopyRequestImplCopyWith<_$CopyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) {
  return _DeleteRequest.fromJson(json);
}

/// @nodoc
mixin _$DeleteRequest {
  /// (required) name of the model to delete
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteRequestCopyWith<DeleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteRequestCopyWith<$Res> {
  factory $DeleteRequestCopyWith(
          DeleteRequest value, $Res Function(DeleteRequest) then) =
      _$DeleteRequestCopyWithImpl<$Res, DeleteRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$DeleteRequestCopyWithImpl<$Res, $Val extends DeleteRequest>
    implements $DeleteRequestCopyWith<$Res> {
  _$DeleteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteRequestImplCopyWith<$Res>
    implements $DeleteRequestCopyWith<$Res> {
  factory _$$DeleteRequestImplCopyWith(
          _$DeleteRequestImpl value, $Res Function(_$DeleteRequestImpl) then) =
      __$$DeleteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$DeleteRequestImplCopyWithImpl<$Res>
    extends _$DeleteRequestCopyWithImpl<$Res, _$DeleteRequestImpl>
    implements _$$DeleteRequestImplCopyWith<$Res> {
  __$$DeleteRequestImplCopyWithImpl(
      _$DeleteRequestImpl _value, $Res Function(_$DeleteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$DeleteRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteRequestImpl extends _DeleteRequest {
  const _$DeleteRequestImpl({required this.name}) : super._();

  factory _$DeleteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteRequestImplFromJson(json);

  /// (required) name of the model to delete
  @override
  final String name;

  @override
  String toString() {
    return 'DeleteRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      __$$DeleteRequestImplCopyWithImpl<_$DeleteRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteRequestImplToJson(
      this,
    );
  }
}

abstract class _DeleteRequest extends DeleteRequest {
  const factory _DeleteRequest({required final String name}) =
      _$DeleteRequestImpl;
  const _DeleteRequest._() : super._();

  factory _DeleteRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteRequestImpl.fromJson;

  @override

  /// (required) name of the model to delete
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DeleteRequestImplCopyWith<_$DeleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return _PullRequest.fromJson(json);
}

/// @nodoc
mixin _$PullRequest {
  /// name of the model to pull
  String get name => throw _privateConstructorUsedError;

  /// (optional) allow insecure connections to the library. Only use this if you are pulling from your own library during development.
  @JsonKey(includeIfNull: false)
  bool? get insecure => throw _privateConstructorUsedError;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PullRequestCopyWith<PullRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullRequestCopyWith<$Res> {
  factory $PullRequestCopyWith(
          PullRequest value, $Res Function(PullRequest) then) =
      _$PullRequestCopyWithImpl<$Res, PullRequest>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) bool? insecure,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class _$PullRequestCopyWithImpl<$Res, $Val extends PullRequest>
    implements $PullRequestCopyWith<$Res> {
  _$PullRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = freezed,
    Object? stream = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: freezed == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PullRequestImplCopyWith<$Res>
    implements $PullRequestCopyWith<$Res> {
  factory _$$PullRequestImplCopyWith(
          _$PullRequestImpl value, $Res Function(_$PullRequestImpl) then) =
      __$$PullRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) bool? insecure,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class __$$PullRequestImplCopyWithImpl<$Res>
    extends _$PullRequestCopyWithImpl<$Res, _$PullRequestImpl>
    implements _$$PullRequestImplCopyWith<$Res> {
  __$$PullRequestImplCopyWithImpl(
      _$PullRequestImpl _value, $Res Function(_$PullRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = freezed,
    Object? stream = freezed,
  }) {
    return _then(_$PullRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: freezed == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PullRequestImpl extends _PullRequest {
  const _$PullRequestImpl(
      {required this.name,
      @JsonKey(includeIfNull: false) this.insecure,
      @JsonKey(includeIfNull: false) this.stream})
      : super._();

  factory _$PullRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullRequestImplFromJson(json);

  /// name of the model to pull
  @override
  final String name;

  /// (optional) allow insecure connections to the library. Only use this if you are pulling from your own library during development.
  @override
  @JsonKey(includeIfNull: false)
  final bool? insecure;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  @override
  String toString() {
    return 'PullRequest(name: $name, insecure: $insecure, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.insecure, insecure) ||
                other.insecure == insecure) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, insecure, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      __$$PullRequestImplCopyWithImpl<_$PullRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullRequestImplToJson(
      this,
    );
  }
}

abstract class _PullRequest extends PullRequest {
  const factory _PullRequest(
      {required final String name,
      @JsonKey(includeIfNull: false) final bool? insecure,
      @JsonKey(includeIfNull: false) final bool? stream}) = _$PullRequestImpl;
  const _PullRequest._() : super._();

  factory _PullRequest.fromJson(Map<String, dynamic> json) =
      _$PullRequestImpl.fromJson;

  @override

  /// name of the model to pull
  String get name;
  @override

  /// (optional) allow insecure connections to the library. Only use this if you are pulling from your own library during development.
  @JsonKey(includeIfNull: false)
  bool? get insecure;
  @override

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream;
  @override
  @JsonKey(ignore: true)
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PullResponse _$PullResponseFromJson(Map<String, dynamic> json) {
  return _PullResponse.fromJson(json);
}

/// @nodoc
mixin _$PullResponse {
  ///
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PullResponseStatus? get status => throw _privateConstructorUsedError;

  /// the model's digest
  @JsonKey(includeIfNull: false)
  String? get digest => throw _privateConstructorUsedError;

  /// total size of the model
  @JsonKey(includeIfNull: false)
  int? get total => throw _privateConstructorUsedError;

  /// total bytes transferred
  @JsonKey(includeIfNull: false)
  int? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PullResponseCopyWith<PullResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullResponseCopyWith<$Res> {
  factory $PullResponseCopyWith(
          PullResponse value, $Res Function(PullResponse) then) =
      _$PullResponseCopyWithImpl<$Res, PullResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PullResponseStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total,
      @JsonKey(includeIfNull: false) int? completed});
}

/// @nodoc
class _$PullResponseCopyWithImpl<$Res, $Val extends PullResponse>
    implements $PullResponseCopyWith<$Res> {
  _$PullResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PullResponseStatus?,
      digest: freezed == digest
          ? _value.digest
          : digest // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PullResponseImplCopyWith<$Res>
    implements $PullResponseCopyWith<$Res> {
  factory _$$PullResponseImplCopyWith(
          _$PullResponseImpl value, $Res Function(_$PullResponseImpl) then) =
      __$$PullResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PullResponseStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total,
      @JsonKey(includeIfNull: false) int? completed});
}

/// @nodoc
class __$$PullResponseImplCopyWithImpl<$Res>
    extends _$PullResponseCopyWithImpl<$Res, _$PullResponseImpl>
    implements _$$PullResponseImplCopyWith<$Res> {
  __$$PullResponseImplCopyWithImpl(
      _$PullResponseImpl _value, $Res Function(_$PullResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$PullResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PullResponseStatus?,
      digest: freezed == digest
          ? _value.digest
          : digest // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PullResponseImpl extends _PullResponse {
  const _$PullResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(includeIfNull: false) this.digest,
      @JsonKey(includeIfNull: false) this.total,
      @JsonKey(includeIfNull: false) this.completed})
      : super._();

  factory _$PullResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullResponseImplFromJson(json);

  ///
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PullResponseStatus? status;

  /// the model's digest
  @override
  @JsonKey(includeIfNull: false)
  final String? digest;

  /// total size of the model
  @override
  @JsonKey(includeIfNull: false)
  final int? total;

  /// total bytes transferred
  @override
  @JsonKey(includeIfNull: false)
  final int? completed;

  @override
  String toString() {
    return 'PullResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.digest, digest) || other.digest == digest) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, digest, total, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PullResponseImplCopyWith<_$PullResponseImpl> get copyWith =>
      __$$PullResponseImplCopyWithImpl<_$PullResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullResponseImplToJson(
      this,
    );
  }
}

abstract class _PullResponse extends PullResponse {
  const factory _PullResponse(
          {@JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final PullResponseStatus? status,
          @JsonKey(includeIfNull: false) final String? digest,
          @JsonKey(includeIfNull: false) final int? total,
          @JsonKey(includeIfNull: false) final int? completed}) =
      _$PullResponseImpl;
  const _PullResponse._() : super._();

  factory _PullResponse.fromJson(Map<String, dynamic> json) =
      _$PullResponseImpl.fromJson;

  @override

  ///
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PullResponseStatus? get status;
  @override

  /// the model's digest
  @JsonKey(includeIfNull: false)
  String? get digest;
  @override

  /// total size of the model
  @JsonKey(includeIfNull: false)
  int? get total;
  @override

  /// total bytes transferred
  @JsonKey(includeIfNull: false)
  int? get completed;
  @override
  @JsonKey(ignore: true)
  _$$PullResponseImplCopyWith<_$PullResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushRequest _$PushRequestFromJson(Map<String, dynamic> json) {
  return _PushRequest.fromJson(json);
}

/// @nodoc
mixin _$PushRequest {
  /// name of the model to push in the form of <namespace>/<model>:<tag>
  String get name => throw _privateConstructorUsedError;

  /// (optional) allow insecure connections to the library. Only use this if you are pushing to your library during development.
  @JsonKey(includeIfNull: false)
  bool? get insecure => throw _privateConstructorUsedError;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushRequestCopyWith<PushRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushRequestCopyWith<$Res> {
  factory $PushRequestCopyWith(
          PushRequest value, $Res Function(PushRequest) then) =
      _$PushRequestCopyWithImpl<$Res, PushRequest>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) bool? insecure,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class _$PushRequestCopyWithImpl<$Res, $Val extends PushRequest>
    implements $PushRequestCopyWith<$Res> {
  _$PushRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = freezed,
    Object? stream = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: freezed == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushRequestImplCopyWith<$Res>
    implements $PushRequestCopyWith<$Res> {
  factory _$$PushRequestImplCopyWith(
          _$PushRequestImpl value, $Res Function(_$PushRequestImpl) then) =
      __$$PushRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) bool? insecure,
      @JsonKey(includeIfNull: false) bool? stream});
}

/// @nodoc
class __$$PushRequestImplCopyWithImpl<$Res>
    extends _$PushRequestCopyWithImpl<$Res, _$PushRequestImpl>
    implements _$$PushRequestImplCopyWith<$Res> {
  __$$PushRequestImplCopyWithImpl(
      _$PushRequestImpl _value, $Res Function(_$PushRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = freezed,
    Object? stream = freezed,
  }) {
    return _then(_$PushRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: freezed == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushRequestImpl extends _PushRequest {
  const _$PushRequestImpl(
      {required this.name,
      @JsonKey(includeIfNull: false) this.insecure,
      @JsonKey(includeIfNull: false) this.stream})
      : super._();

  factory _$PushRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushRequestImplFromJson(json);

  /// name of the model to push in the form of <namespace>/<model>:<tag>
  @override
  final String name;

  /// (optional) allow insecure connections to the library. Only use this if you are pushing to your library during development.
  @override
  @JsonKey(includeIfNull: false)
  final bool? insecure;

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  @override
  String toString() {
    return 'PushRequest(name: $name, insecure: $insecure, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.insecure, insecure) ||
                other.insecure == insecure) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, insecure, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushRequestImplCopyWith<_$PushRequestImpl> get copyWith =>
      __$$PushRequestImplCopyWithImpl<_$PushRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushRequestImplToJson(
      this,
    );
  }
}

abstract class _PushRequest extends PushRequest {
  const factory _PushRequest(
      {required final String name,
      @JsonKey(includeIfNull: false) final bool? insecure,
      @JsonKey(includeIfNull: false) final bool? stream}) = _$PushRequestImpl;
  const _PushRequest._() : super._();

  factory _PushRequest.fromJson(Map<String, dynamic> json) =
      _$PushRequestImpl.fromJson;

  @override

  /// name of the model to push in the form of <namespace>/<model>:<tag>
  String get name;
  @override

  /// (optional) allow insecure connections to the library. Only use this if you are pushing to your library during development.
  @JsonKey(includeIfNull: false)
  bool? get insecure;
  @override

  /// (optional) if false the response will be returned as a single response object, rather than a stream of objects
  @JsonKey(includeIfNull: false)
  bool? get stream;
  @override
  @JsonKey(ignore: true)
  _$$PushRequestImplCopyWith<_$PushRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushResponse _$PushResponseFromJson(Map<String, dynamic> json) {
  return _PushResponse.fromJson(json);
}

/// @nodoc
mixin _$PushResponse {
  ///
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PushResponseStatus? get status => throw _privateConstructorUsedError;

  /// the model's digest
  @JsonKey(includeIfNull: false)
  String? get digest => throw _privateConstructorUsedError;

  /// total size of the model
  @JsonKey(includeIfNull: false)
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushResponseCopyWith<PushResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushResponseCopyWith<$Res> {
  factory $PushResponseCopyWith(
          PushResponse value, $Res Function(PushResponse) then) =
      _$PushResponseCopyWithImpl<$Res, PushResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PushResponseStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total});
}

/// @nodoc
class _$PushResponseCopyWithImpl<$Res, $Val extends PushResponse>
    implements $PushResponseCopyWith<$Res> {
  _$PushResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PushResponseStatus?,
      digest: freezed == digest
          ? _value.digest
          : digest // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushResponseImplCopyWith<$Res>
    implements $PushResponseCopyWith<$Res> {
  factory _$$PushResponseImplCopyWith(
          _$PushResponseImpl value, $Res Function(_$PushResponseImpl) then) =
      __$$PushResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PushResponseStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total});
}

/// @nodoc
class __$$PushResponseImplCopyWithImpl<$Res>
    extends _$PushResponseCopyWithImpl<$Res, _$PushResponseImpl>
    implements _$$PushResponseImplCopyWith<$Res> {
  __$$PushResponseImplCopyWithImpl(
      _$PushResponseImpl _value, $Res Function(_$PushResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
  }) {
    return _then(_$PushResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PushResponseStatus?,
      digest: freezed == digest
          ? _value.digest
          : digest // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushResponseImpl extends _PushResponse {
  const _$PushResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(includeIfNull: false) this.digest,
      @JsonKey(includeIfNull: false) this.total})
      : super._();

  factory _$PushResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushResponseImplFromJson(json);

  ///
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PushResponseStatus? status;

  /// the model's digest
  @override
  @JsonKey(includeIfNull: false)
  final String? digest;

  /// total size of the model
  @override
  @JsonKey(includeIfNull: false)
  final int? total;

  @override
  String toString() {
    return 'PushResponse(status: $status, digest: $digest, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.digest, digest) || other.digest == digest) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, digest, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushResponseImplCopyWith<_$PushResponseImpl> get copyWith =>
      __$$PushResponseImplCopyWithImpl<_$PushResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushResponseImplToJson(
      this,
    );
  }
}

abstract class _PushResponse extends PushResponse {
  const factory _PushResponse(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final PushResponseStatus? status,
      @JsonKey(includeIfNull: false) final String? digest,
      @JsonKey(includeIfNull: false) final int? total}) = _$PushResponseImpl;
  const _PushResponse._() : super._();

  factory _PushResponse.fromJson(Map<String, dynamic> json) =
      _$PushResponseImpl.fromJson;

  @override

  ///
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PushResponseStatus? get status;
  @override

  /// the model's digest
  @JsonKey(includeIfNull: false)
  String? get digest;
  @override

  /// total size of the model
  @JsonKey(includeIfNull: false)
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$PushResponseImplCopyWith<_$PushResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmbeddingRequest _$EmbeddingRequestFromJson(Map<String, dynamic> json) {
  return _EmbeddingRequest.fromJson(json);
}

/// @nodoc
mixin _$EmbeddingRequest {
  /// name of model to generate embeddings from
  String get model => throw _privateConstructorUsedError;

  /// text to generate embeddings for
  String get prompt => throw _privateConstructorUsedError;

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @JsonKey(includeIfNull: false)
  Options? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbeddingRequestCopyWith<EmbeddingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddingRequestCopyWith<$Res> {
  factory $EmbeddingRequestCopyWith(
          EmbeddingRequest value, $Res Function(EmbeddingRequest) then) =
      _$EmbeddingRequestCopyWithImpl<$Res, EmbeddingRequest>;
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) Options? options});

  $OptionsCopyWith<$Res>? get options;
}

/// @nodoc
class _$EmbeddingRequestCopyWithImpl<$Res, $Val extends EmbeddingRequest>
    implements $EmbeddingRequestCopyWith<$Res> {
  _$EmbeddingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $OptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmbeddingRequestImplCopyWith<$Res>
    implements $EmbeddingRequestCopyWith<$Res> {
  factory _$$EmbeddingRequestImplCopyWith(_$EmbeddingRequestImpl value,
          $Res Function(_$EmbeddingRequestImpl) then) =
      __$$EmbeddingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) Options? options});

  @override
  $OptionsCopyWith<$Res>? get options;
}

/// @nodoc
class __$$EmbeddingRequestImplCopyWithImpl<$Res>
    extends _$EmbeddingRequestCopyWithImpl<$Res, _$EmbeddingRequestImpl>
    implements _$$EmbeddingRequestImplCopyWith<$Res> {
  __$$EmbeddingRequestImplCopyWithImpl(_$EmbeddingRequestImpl _value,
      $Res Function(_$EmbeddingRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? options = freezed,
  }) {
    return _then(_$EmbeddingRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingRequestImpl extends _EmbeddingRequest {
  const _$EmbeddingRequestImpl(
      {required this.model,
      required this.prompt,
      @JsonKey(includeIfNull: false) this.options})
      : super._();

  factory _$EmbeddingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingRequestImplFromJson(json);

  /// name of model to generate embeddings from
  @override
  final String model;

  /// text to generate embeddings for
  @override
  final String prompt;

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @override
  @JsonKey(includeIfNull: false)
  final Options? options;

  @override
  String toString() {
    return 'EmbeddingRequest(model: $model, prompt: $prompt, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.options, options) || other.options == options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, prompt, options);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingRequestImplCopyWith<_$EmbeddingRequestImpl> get copyWith =>
      __$$EmbeddingRequestImplCopyWithImpl<_$EmbeddingRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingRequestImplToJson(
      this,
    );
  }
}

abstract class _EmbeddingRequest extends EmbeddingRequest {
  const factory _EmbeddingRequest(
          {required final String model,
          required final String prompt,
          @JsonKey(includeIfNull: false) final Options? options}) =
      _$EmbeddingRequestImpl;
  const _EmbeddingRequest._() : super._();

  factory _EmbeddingRequest.fromJson(Map<String, dynamic> json) =
      _$EmbeddingRequestImpl.fromJson;

  @override

  /// name of model to generate embeddings from
  String get model;
  @override

  /// text to generate embeddings for
  String get prompt;
  @override

  /// additional model parameters listed in the documentation for the Modelfile such as temperature
  @JsonKey(includeIfNull: false)
  Options? get options;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingRequestImplCopyWith<_$EmbeddingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmbeddingResponse _$EmbeddingResponseFromJson(Map<String, dynamic> json) {
  return _EmbeddingResponse.fromJson(json);
}

/// @nodoc
mixin _$EmbeddingResponse {
  /// No Description
  @JsonKey(includeIfNull: false)
  List<double>? get embedding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbeddingResponseCopyWith<EmbeddingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddingResponseCopyWith<$Res> {
  factory $EmbeddingResponseCopyWith(
          EmbeddingResponse value, $Res Function(EmbeddingResponse) then) =
      _$EmbeddingResponseCopyWithImpl<$Res, EmbeddingResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? embedding});
}

/// @nodoc
class _$EmbeddingResponseCopyWithImpl<$Res, $Val extends EmbeddingResponse>
    implements $EmbeddingResponseCopyWith<$Res> {
  _$EmbeddingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_value.copyWith(
      embedding: freezed == embedding
          ? _value.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmbeddingResponseImplCopyWith<$Res>
    implements $EmbeddingResponseCopyWith<$Res> {
  factory _$$EmbeddingResponseImplCopyWith(_$EmbeddingResponseImpl value,
          $Res Function(_$EmbeddingResponseImpl) then) =
      __$$EmbeddingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? embedding});
}

/// @nodoc
class __$$EmbeddingResponseImplCopyWithImpl<$Res>
    extends _$EmbeddingResponseCopyWithImpl<$Res, _$EmbeddingResponseImpl>
    implements _$$EmbeddingResponseImplCopyWith<$Res> {
  __$$EmbeddingResponseImplCopyWithImpl(_$EmbeddingResponseImpl _value,
      $Res Function(_$EmbeddingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_$EmbeddingResponseImpl(
      embedding: freezed == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingResponseImpl extends _EmbeddingResponse {
  const _$EmbeddingResponseImpl(
      {@JsonKey(includeIfNull: false) final List<double>? embedding})
      : _embedding = embedding,
        super._();

  factory _$EmbeddingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingResponseImplFromJson(json);

  /// No Description
  final List<double>? _embedding;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<double>? get embedding {
    final value = _embedding;
    if (value == null) return null;
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EmbeddingResponse(embedding: $embedding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_embedding));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingResponseImplCopyWith<_$EmbeddingResponseImpl> get copyWith =>
      __$$EmbeddingResponseImplCopyWithImpl<_$EmbeddingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingResponseImplToJson(
      this,
    );
  }
}

abstract class _EmbeddingResponse extends EmbeddingResponse {
  const factory _EmbeddingResponse(
          {@JsonKey(includeIfNull: false) final List<double>? embedding}) =
      _$EmbeddingResponseImpl;
  const _EmbeddingResponse._() : super._();

  factory _EmbeddingResponse.fromJson(Map<String, dynamic> json) =
      _$EmbeddingResponseImpl.fromJson;

  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  List<double>? get embedding;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingResponseImplCopyWith<_$EmbeddingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
