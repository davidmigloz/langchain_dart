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

GenerateCompletionRequest _$GenerateCompletionRequestFromJson(
    Map<String, dynamic> json) {
  return _GenerateCompletionRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateCompletionRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model => throw _privateConstructorUsedError;

  /// The prompt to generate a response.
  String get prompt => throw _privateConstructorUsedError;

  /// The system prompt to (overrides what is defined in the Modelfile).
  @JsonKey(includeIfNull: false)
  String? get system => throw _privateConstructorUsedError;

  /// The full prompt or prompt template (overrides what is defined in the Modelfile).
  @JsonKey(includeIfNull: false)
  String? get template => throw _privateConstructorUsedError;

  /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
  @JsonKey(includeIfNull: false)
  List<int>? get context => throw _privateConstructorUsedError;

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options => throw _privateConstructorUsedError;

  /// The format to return a response in. Currently the only accepted value is json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ResponseFormat? get format => throw _privateConstructorUsedError;

  /// If `true` no formatting will be applied to the prompt and no context will be returned.
  ///
  /// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @JsonKey(includeIfNull: false)
  bool? get raw => throw _privateConstructorUsedError;

  /// If `false` the response will be returned as a single response object, rather than a stream of objects.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateCompletionRequestCopyWith<GenerateCompletionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateCompletionRequestCopyWith<$Res> {
  factory $GenerateCompletionRequestCopyWith(GenerateCompletionRequest value,
          $Res Function(GenerateCompletionRequest) then) =
      _$GenerateCompletionRequestCopyWithImpl<$Res, GenerateCompletionRequest>;
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) String? template,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(includeIfNull: false) RequestOptions? options,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseFormat? format,
      @JsonKey(includeIfNull: false) bool? raw,
      bool stream});

  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class _$GenerateCompletionRequestCopyWithImpl<$Res,
        $Val extends GenerateCompletionRequest>
    implements $GenerateCompletionRequestCopyWith<$Res> {
  _$GenerateCompletionRequestCopyWithImpl(this._value, this._then);

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
    Object? options = freezed,
    Object? format = freezed,
    Object? raw = freezed,
    Object? stream = null,
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
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as RequestOptions?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ResponseFormat?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestOptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $RequestOptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateCompletionRequestImplCopyWith<$Res>
    implements $GenerateCompletionRequestCopyWith<$Res> {
  factory _$$GenerateCompletionRequestImplCopyWith(
          _$GenerateCompletionRequestImpl value,
          $Res Function(_$GenerateCompletionRequestImpl) then) =
      __$$GenerateCompletionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) String? template,
      @JsonKey(includeIfNull: false) List<int>? context,
      @JsonKey(includeIfNull: false) RequestOptions? options,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseFormat? format,
      @JsonKey(includeIfNull: false) bool? raw,
      bool stream});

  @override
  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class __$$GenerateCompletionRequestImplCopyWithImpl<$Res>
    extends _$GenerateCompletionRequestCopyWithImpl<$Res,
        _$GenerateCompletionRequestImpl>
    implements _$$GenerateCompletionRequestImplCopyWith<$Res> {
  __$$GenerateCompletionRequestImplCopyWithImpl(
      _$GenerateCompletionRequestImpl _value,
      $Res Function(_$GenerateCompletionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? system = freezed,
    Object? template = freezed,
    Object? context = freezed,
    Object? options = freezed,
    Object? format = freezed,
    Object? raw = freezed,
    Object? stream = null,
  }) {
    return _then(_$GenerateCompletionRequestImpl(
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
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as RequestOptions?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ResponseFormat?,
      raw: freezed == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateCompletionRequestImpl extends _GenerateCompletionRequest {
  const _$GenerateCompletionRequestImpl(
      {required this.model,
      required this.prompt,
      @JsonKey(includeIfNull: false) this.system,
      @JsonKey(includeIfNull: false) this.template,
      @JsonKey(includeIfNull: false) final List<int>? context,
      @JsonKey(includeIfNull: false) this.options,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.format,
      @JsonKey(includeIfNull: false) this.raw,
      this.stream = false})
      : _context = context,
        super._();

  factory _$GenerateCompletionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateCompletionRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String model;

  /// The prompt to generate a response.
  @override
  final String prompt;

  /// The system prompt to (overrides what is defined in the Modelfile).
  @override
  @JsonKey(includeIfNull: false)
  final String? system;

  /// The full prompt or prompt template (overrides what is defined in the Modelfile).
  @override
  @JsonKey(includeIfNull: false)
  final String? template;

  /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
  final List<int>? _context;

  /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
  @override
  @JsonKey(includeIfNull: false)
  List<int>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @override
  @JsonKey(includeIfNull: false)
  final RequestOptions? options;

  /// The format to return a response in. Currently the only accepted value is json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ResponseFormat? format;

  /// If `true` no formatting will be applied to the prompt and no context will be returned.
  ///
  /// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @override
  @JsonKey(includeIfNull: false)
  final bool? raw;

  /// If `false` the response will be returned as a single response object, rather than a stream of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'GenerateCompletionRequest(model: $model, prompt: $prompt, system: $system, template: $template, context: $context, options: $options, format: $format, raw: $raw, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateCompletionRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality().equals(other._context, _context) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.stream, stream) || other.stream == stream));
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
      options,
      format,
      raw,
      stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateCompletionRequestImplCopyWith<_$GenerateCompletionRequestImpl>
      get copyWith => __$$GenerateCompletionRequestImplCopyWithImpl<
          _$GenerateCompletionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateCompletionRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateCompletionRequest extends GenerateCompletionRequest {
  const factory _GenerateCompletionRequest(
      {required final String model,
      required final String prompt,
      @JsonKey(includeIfNull: false) final String? system,
      @JsonKey(includeIfNull: false) final String? template,
      @JsonKey(includeIfNull: false) final List<int>? context,
      @JsonKey(includeIfNull: false) final RequestOptions? options,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final ResponseFormat? format,
      @JsonKey(includeIfNull: false) final bool? raw,
      final bool stream}) = _$GenerateCompletionRequestImpl;
  const _GenerateCompletionRequest._() : super._();

  factory _GenerateCompletionRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateCompletionRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model;
  @override

  /// The prompt to generate a response.
  String get prompt;
  @override

  /// The system prompt to (overrides what is defined in the Modelfile).
  @JsonKey(includeIfNull: false)
  String? get system;
  @override

  /// The full prompt or prompt template (overrides what is defined in the Modelfile).
  @JsonKey(includeIfNull: false)
  String? get template;
  @override

  /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
  @JsonKey(includeIfNull: false)
  List<int>? get context;
  @override

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options;
  @override

  /// The format to return a response in. Currently the only accepted value is json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ResponseFormat? get format;
  @override

  /// If `true` no formatting will be applied to the prompt and no context will be returned.
  ///
  /// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
  @JsonKey(includeIfNull: false)
  bool? get raw;
  @override

  /// If `false` the response will be returned as a single response object, rather than a stream of objects.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$GenerateCompletionRequestImplCopyWith<_$GenerateCompletionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestOptions _$RequestOptionsFromJson(Map<String, dynamic> json) {
  return _RequestOptions.fromJson(json);
}

/// @nodoc
mixin _$RequestOptions {
  /// Number of tokens to keep from the prompt.
  @JsonKey(name: 'num_keep', includeIfNull: false)
  int? get numKeep => throw _privateConstructorUsedError;

  /// Sets the random number seed to use for generation. Setting this to a specific number will make the model generate the same text for the same prompt. (Default: 0)
  @JsonKey(includeIfNull: false)
  int? get seed => throw _privateConstructorUsedError;

  /// Maximum number of tokens to predict when generating text. (Default: 128, -1 = infinite generation, -2 = fill context)
  @JsonKey(name: 'num_predict', includeIfNull: false)
  int? get numPredict => throw _privateConstructorUsedError;

  /// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers, while a lower value (e.g. 10) will be more conservative. (Default: 40)
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Works together with top-k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  double? get tfsZ => throw _privateConstructorUsedError;

  /// Typical p is used to reduce the impact of less probable tokens from the output.
  @JsonKey(name: 'typical_p', includeIfNull: false)
  double? get typicalP => throw _privateConstructorUsedError;

  /// Sets how far back for the model to look back to prevent repetition. (Default: 64, 0 = disabled, -1 = num_ctx)
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  int? get repeatLastN => throw _privateConstructorUsedError;

  /// The temperature of the model. Increasing the temperature will make the model answer more creatively. (Default: 0.8)
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  double? get repeatPenalty => throw _privateConstructorUsedError;

  /// Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  double? get presencePenalty => throw _privateConstructorUsedError;

  /// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  double? get frequencyPenalty => throw _privateConstructorUsedError;

  /// Enable Mirostat sampling for controlling perplexity. (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
  @JsonKey(includeIfNull: false)
  int? get mirostat => throw _privateConstructorUsedError;

  /// Controls the balance between coherence and diversity of the output. A lower value will result in more focused and coherent text. (Default: 5.0)
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  double? get mirostatTau => throw _privateConstructorUsedError;

  /// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate will result in slower adjustments, while a higher learning rate will make the algorithm more responsive. (Default: 0.1)
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  double? get mirostatEta => throw _privateConstructorUsedError;

  /// Penalize newlines in the output. (Default: false)
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  bool? get penalizeNewline => throw _privateConstructorUsedError;

  /// Sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
  @JsonKey(includeIfNull: false)
  List<String>? get stop => throw _privateConstructorUsedError;

  /// Enable NUMA support. (Default: false)
  @JsonKey(includeIfNull: false)
  bool? get numa => throw _privateConstructorUsedError;

  /// Sets the size of the context window used to generate the next token.
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  int? get numCtx => throw _privateConstructorUsedError;

  /// Sets the number of batches to use for generation. (Default: 1)
  @JsonKey(name: 'num_batch', includeIfNull: false)
  int? get numBatch => throw _privateConstructorUsedError;

  /// The number of GQA groups in the transformer layer. Required for some models, for example it is 8 for `llama2:70b`.
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  int? get numGqa => throw _privateConstructorUsedError;

  /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to enable metal support, 0 to disable.
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  int? get numGpu => throw _privateConstructorUsedError;

  /// The GPU to use for the main model. Default is 0.
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  int? get mainGpu => throw _privateConstructorUsedError;

  /// Enable low VRAM mode. (Default: false)
  @JsonKey(name: 'low_vram', includeIfNull: false)
  bool? get lowVram => throw _privateConstructorUsedError;

  /// Enable f16 key/value. (Default: false)
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  bool? get f16Kv => throw _privateConstructorUsedError;

  /// Enable logits all. (Default: false)
  @JsonKey(name: 'logits_all', includeIfNull: false)
  bool? get logitsAll => throw _privateConstructorUsedError;

  /// Enable vocab only. (Default: false)
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  bool? get vocabOnly => throw _privateConstructorUsedError;

  /// Enable mmap. (Default: false)
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  bool? get useMmap => throw _privateConstructorUsedError;

  /// Enable mlock. (Default: false)
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  bool? get useMlock => throw _privateConstructorUsedError;

  /// Enable embedding only. (Default: false)
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  bool? get embeddingOnly => throw _privateConstructorUsedError;

  /// The base of the rope frequency scale. (Default: 1.0)
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  double? get ropeFrequencyBase => throw _privateConstructorUsedError;

  /// The scale of the rope frequency. (Default: 1.0)
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  double? get ropeFrequencyScale => throw _privateConstructorUsedError;

  /// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal performance. It is recommended to set this value to the number of physical CPU cores your system has (as opposed to the logical number of cores).
  @JsonKey(name: 'num_thread', includeIfNull: false)
  int? get numThread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOptionsCopyWith<RequestOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOptionsCopyWith<$Res> {
  factory $RequestOptionsCopyWith(
          RequestOptions value, $Res Function(RequestOptions) then) =
      _$RequestOptionsCopyWithImpl<$Res, RequestOptions>;
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
class _$RequestOptionsCopyWithImpl<$Res, $Val extends RequestOptions>
    implements $RequestOptionsCopyWith<$Res> {
  _$RequestOptionsCopyWithImpl(this._value, this._then);

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
abstract class _$$RequestOptionsImplCopyWith<$Res>
    implements $RequestOptionsCopyWith<$Res> {
  factory _$$RequestOptionsImplCopyWith(_$RequestOptionsImpl value,
          $Res Function(_$RequestOptionsImpl) then) =
      __$$RequestOptionsImplCopyWithImpl<$Res>;
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
class __$$RequestOptionsImplCopyWithImpl<$Res>
    extends _$RequestOptionsCopyWithImpl<$Res, _$RequestOptionsImpl>
    implements _$$RequestOptionsImplCopyWith<$Res> {
  __$$RequestOptionsImplCopyWithImpl(
      _$RequestOptionsImpl _value, $Res Function(_$RequestOptionsImpl) _then)
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
    return _then(_$RequestOptionsImpl(
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
class _$RequestOptionsImpl extends _RequestOptions {
  const _$RequestOptionsImpl(
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

  factory _$RequestOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOptionsImplFromJson(json);

  /// Number of tokens to keep from the prompt.
  @override
  @JsonKey(name: 'num_keep', includeIfNull: false)
  final int? numKeep;

  /// Sets the random number seed to use for generation. Setting this to a specific number will make the model generate the same text for the same prompt. (Default: 0)
  @override
  @JsonKey(includeIfNull: false)
  final int? seed;

  /// Maximum number of tokens to predict when generating text. (Default: 128, -1 = infinite generation, -2 = fill context)
  @override
  @JsonKey(name: 'num_predict', includeIfNull: false)
  final int? numPredict;

  /// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers, while a lower value (e.g. 10) will be more conservative. (Default: 40)
  @override
  @JsonKey(name: 'top_k', includeIfNull: false)
  final int? topK;

  /// Works together with top-k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  /// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
  @override
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  final double? tfsZ;

  /// Typical p is used to reduce the impact of less probable tokens from the output.
  @override
  @JsonKey(name: 'typical_p', includeIfNull: false)
  final double? typicalP;

  /// Sets how far back for the model to look back to prevent repetition. (Default: 64, 0 = disabled, -1 = num_ctx)
  @override
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  final int? repeatLastN;

  /// The temperature of the model. Increasing the temperature will make the model answer more creatively. (Default: 0.8)
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
  @override
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  final double? repeatPenalty;

  /// Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
  @override
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  final double? presencePenalty;

  /// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
  @override
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  final double? frequencyPenalty;

  /// Enable Mirostat sampling for controlling perplexity. (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
  @override
  @JsonKey(includeIfNull: false)
  final int? mirostat;

  /// Controls the balance between coherence and diversity of the output. A lower value will result in more focused and coherent text. (Default: 5.0)
  @override
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  final double? mirostatTau;

  /// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate will result in slower adjustments, while a higher learning rate will make the algorithm more responsive. (Default: 0.1)
  @override
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  final double? mirostatEta;

  /// Penalize newlines in the output. (Default: false)
  @override
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  final bool? penalizeNewline;

  /// Sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
  final List<String>? _stop;

  /// Sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get stop {
    final value = _stop;
    if (value == null) return null;
    if (_stop is EqualUnmodifiableListView) return _stop;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Enable NUMA support. (Default: false)
  @override
  @JsonKey(includeIfNull: false)
  final bool? numa;

  /// Sets the size of the context window used to generate the next token.
  @override
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  final int? numCtx;

  /// Sets the number of batches to use for generation. (Default: 1)
  @override
  @JsonKey(name: 'num_batch', includeIfNull: false)
  final int? numBatch;

  /// The number of GQA groups in the transformer layer. Required for some models, for example it is 8 for `llama2:70b`.
  @override
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  final int? numGqa;

  /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to enable metal support, 0 to disable.
  @override
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  final int? numGpu;

  /// The GPU to use for the main model. Default is 0.
  @override
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  final int? mainGpu;

  /// Enable low VRAM mode. (Default: false)
  @override
  @JsonKey(name: 'low_vram', includeIfNull: false)
  final bool? lowVram;

  /// Enable f16 key/value. (Default: false)
  @override
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  final bool? f16Kv;

  /// Enable logits all. (Default: false)
  @override
  @JsonKey(name: 'logits_all', includeIfNull: false)
  final bool? logitsAll;

  /// Enable vocab only. (Default: false)
  @override
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  final bool? vocabOnly;

  /// Enable mmap. (Default: false)
  @override
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  final bool? useMmap;

  /// Enable mlock. (Default: false)
  @override
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  final bool? useMlock;

  /// Enable embedding only. (Default: false)
  @override
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  final bool? embeddingOnly;

  /// The base of the rope frequency scale. (Default: 1.0)
  @override
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  final double? ropeFrequencyBase;

  /// The scale of the rope frequency. (Default: 1.0)
  @override
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  final double? ropeFrequencyScale;

  /// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal performance. It is recommended to set this value to the number of physical CPU cores your system has (as opposed to the logical number of cores).
  @override
  @JsonKey(name: 'num_thread', includeIfNull: false)
  final int? numThread;

  @override
  String toString() {
    return 'RequestOptions(numKeep: $numKeep, seed: $seed, numPredict: $numPredict, topK: $topK, topP: $topP, tfsZ: $tfsZ, typicalP: $typicalP, repeatLastN: $repeatLastN, temperature: $temperature, repeatPenalty: $repeatPenalty, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, mirostat: $mirostat, mirostatTau: $mirostatTau, mirostatEta: $mirostatEta, penalizeNewline: $penalizeNewline, stop: $stop, numa: $numa, numCtx: $numCtx, numBatch: $numBatch, numGqa: $numGqa, numGpu: $numGpu, mainGpu: $mainGpu, lowVram: $lowVram, f16Kv: $f16Kv, logitsAll: $logitsAll, vocabOnly: $vocabOnly, useMmap: $useMmap, useMlock: $useMlock, embeddingOnly: $embeddingOnly, ropeFrequencyBase: $ropeFrequencyBase, ropeFrequencyScale: $ropeFrequencyScale, numThread: $numThread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOptionsImpl &&
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
  _$$RequestOptionsImplCopyWith<_$RequestOptionsImpl> get copyWith =>
      __$$RequestOptionsImplCopyWithImpl<_$RequestOptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOptionsImplToJson(
      this,
    );
  }
}

abstract class _RequestOptions extends RequestOptions {
  const factory _RequestOptions(
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
      final int? numThread}) = _$RequestOptionsImpl;
  const _RequestOptions._() : super._();

  factory _RequestOptions.fromJson(Map<String, dynamic> json) =
      _$RequestOptionsImpl.fromJson;

  @override

  /// Number of tokens to keep from the prompt.
  @JsonKey(name: 'num_keep', includeIfNull: false)
  int? get numKeep;
  @override

  /// Sets the random number seed to use for generation. Setting this to a specific number will make the model generate the same text for the same prompt. (Default: 0)
  @JsonKey(includeIfNull: false)
  int? get seed;
  @override

  /// Maximum number of tokens to predict when generating text. (Default: 128, -1 = infinite generation, -2 = fill context)
  @JsonKey(name: 'num_predict', includeIfNull: false)
  int? get numPredict;
  @override

  /// Reduces the probability of generating nonsense. A higher value (e.g. 100) will give more diverse answers, while a lower value (e.g. 10) will be more conservative. (Default: 40)
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK;
  @override

  /// Works together with top-k. A higher value (e.g., 0.95) will lead to more diverse text, while a lower value (e.g., 0.5) will generate more focused and conservative text. (Default: 0.9)
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override

  /// Tail free sampling is used to reduce the impact of less probable tokens from the output. A higher value (e.g., 2.0) will reduce the impact more, while a value of 1.0 disables this setting. (default: 1)
  @JsonKey(name: 'tfs_z', includeIfNull: false)
  double? get tfsZ;
  @override

  /// Typical p is used to reduce the impact of less probable tokens from the output.
  @JsonKey(name: 'typical_p', includeIfNull: false)
  double? get typicalP;
  @override

  /// Sets how far back for the model to look back to prevent repetition. (Default: 64, 0 = disabled, -1 = num_ctx)
  @JsonKey(name: 'repeat_last_n', includeIfNull: false)
  int? get repeatLastN;
  @override

  /// The temperature of the model. Increasing the temperature will make the model answer more creatively. (Default: 0.8)
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5) will penalize repetitions more strongly, while a lower value (e.g., 0.9) will be more lenient. (Default: 1.1)
  @JsonKey(name: 'repeat_penalty', includeIfNull: false)
  double? get repeatPenalty;
  @override

  /// Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
  @JsonKey(name: 'presence_penalty', includeIfNull: false)
  double? get presencePenalty;
  @override

  /// Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
  @JsonKey(name: 'frequency_penalty', includeIfNull: false)
  double? get frequencyPenalty;
  @override

  /// Enable Mirostat sampling for controlling perplexity. (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
  @JsonKey(includeIfNull: false)
  int? get mirostat;
  @override

  /// Controls the balance between coherence and diversity of the output. A lower value will result in more focused and coherent text. (Default: 5.0)
  @JsonKey(name: 'mirostat_tau', includeIfNull: false)
  double? get mirostatTau;
  @override

  /// Influences how quickly the algorithm responds to feedback from the generated text. A lower learning rate will result in slower adjustments, while a higher learning rate will make the algorithm more responsive. (Default: 0.1)
  @JsonKey(name: 'mirostat_eta', includeIfNull: false)
  double? get mirostatEta;
  @override

  /// Penalize newlines in the output. (Default: false)
  @JsonKey(name: 'penalize_newline', includeIfNull: false)
  bool? get penalizeNewline;
  @override

  /// Sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
  @JsonKey(includeIfNull: false)
  List<String>? get stop;
  @override

  /// Enable NUMA support. (Default: false)
  @JsonKey(includeIfNull: false)
  bool? get numa;
  @override

  /// Sets the size of the context window used to generate the next token.
  @JsonKey(name: 'num_ctx', includeIfNull: false)
  int? get numCtx;
  @override

  /// Sets the number of batches to use for generation. (Default: 1)
  @JsonKey(name: 'num_batch', includeIfNull: false)
  int? get numBatch;
  @override

  /// The number of GQA groups in the transformer layer. Required for some models, for example it is 8 for `llama2:70b`.
  @JsonKey(name: 'num_gqa', includeIfNull: false)
  int? get numGqa;
  @override

  /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to enable metal support, 0 to disable.
  @JsonKey(name: 'num_gpu', includeIfNull: false)
  int? get numGpu;
  @override

  /// The GPU to use for the main model. Default is 0.
  @JsonKey(name: 'main_gpu', includeIfNull: false)
  int? get mainGpu;
  @override

  /// Enable low VRAM mode. (Default: false)
  @JsonKey(name: 'low_vram', includeIfNull: false)
  bool? get lowVram;
  @override

  /// Enable f16 key/value. (Default: false)
  @JsonKey(name: 'f16_kv', includeIfNull: false)
  bool? get f16Kv;
  @override

  /// Enable logits all. (Default: false)
  @JsonKey(name: 'logits_all', includeIfNull: false)
  bool? get logitsAll;
  @override

  /// Enable vocab only. (Default: false)
  @JsonKey(name: 'vocab_only', includeIfNull: false)
  bool? get vocabOnly;
  @override

  /// Enable mmap. (Default: false)
  @JsonKey(name: 'use_mmap', includeIfNull: false)
  bool? get useMmap;
  @override

  /// Enable mlock. (Default: false)
  @JsonKey(name: 'use_mlock', includeIfNull: false)
  bool? get useMlock;
  @override

  /// Enable embedding only. (Default: false)
  @JsonKey(name: 'embedding_only', includeIfNull: false)
  bool? get embeddingOnly;
  @override

  /// The base of the rope frequency scale. (Default: 1.0)
  @JsonKey(name: 'rope_frequency_base', includeIfNull: false)
  double? get ropeFrequencyBase;
  @override

  /// The scale of the rope frequency. (Default: 1.0)
  @JsonKey(name: 'rope_frequency_scale', includeIfNull: false)
  double? get ropeFrequencyScale;
  @override

  /// Sets the number of threads to use during computation. By default, Ollama will detect this for optimal performance. It is recommended to set this value to the number of physical CPU cores your system has (as opposed to the logical number of cores).
  @JsonKey(name: 'num_thread', includeIfNull: false)
  int? get numThread;
  @override
  @JsonKey(ignore: true)
  _$$RequestOptionsImplCopyWith<_$RequestOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerateCompletionResponse _$GenerateCompletionResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateCompletionResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateCompletionResponse {
  /// The name of the model used to generate the response.
  @JsonKey(includeIfNull: false)
  String? get model => throw _privateConstructorUsedError;

  /// Date on which a model was created.
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt => throw _privateConstructorUsedError;

  /// The response for a given prompt with a provided model.
  @JsonKey(includeIfNull: false)
  String? get response => throw _privateConstructorUsedError;

  /// Whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;

  /// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
  @JsonKey(includeIfNull: false)
  List<int>? get context => throw _privateConstructorUsedError;

  /// Number of samples generated.
  @JsonKey(name: 'sample_count', includeIfNull: false)
  int? get sampleCount => throw _privateConstructorUsedError;

  /// Time spent generating samples.
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  int? get sampleDuration => throw _privateConstructorUsedError;

  /// Time spent generating the response.
  @JsonKey(name: 'total_duration', includeIfNull: false)
  int? get totalDuration => throw _privateConstructorUsedError;

  /// Time spent in nanoseconds loading the model.
  @JsonKey(name: 'load_duration', includeIfNull: false)
  int? get loadDuration => throw _privateConstructorUsedError;

  /// Number of tokens in the prompt.
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  int? get promptEvalCount => throw _privateConstructorUsedError;

  /// Time spent in nanoseconds evaluating the prompt.
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  int? get promptEvalDuration => throw _privateConstructorUsedError;

  /// Number of tokens the response.
  @JsonKey(name: 'eval_count', includeIfNull: false)
  int? get evalCount => throw _privateConstructorUsedError;

  /// Time in nanoseconds spent generating the response.
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  int? get evalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateCompletionResponseCopyWith<GenerateCompletionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateCompletionResponseCopyWith<$Res> {
  factory $GenerateCompletionResponseCopyWith(GenerateCompletionResponse value,
          $Res Function(GenerateCompletionResponse) then) =
      _$GenerateCompletionResponseCopyWithImpl<$Res,
          GenerateCompletionResponse>;
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
class _$GenerateCompletionResponseCopyWithImpl<$Res,
        $Val extends GenerateCompletionResponse>
    implements $GenerateCompletionResponseCopyWith<$Res> {
  _$GenerateCompletionResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$GenerateCompletionResponseImplCopyWith<$Res>
    implements $GenerateCompletionResponseCopyWith<$Res> {
  factory _$$GenerateCompletionResponseImplCopyWith(
          _$GenerateCompletionResponseImpl value,
          $Res Function(_$GenerateCompletionResponseImpl) then) =
      __$$GenerateCompletionResponseImplCopyWithImpl<$Res>;
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
class __$$GenerateCompletionResponseImplCopyWithImpl<$Res>
    extends _$GenerateCompletionResponseCopyWithImpl<$Res,
        _$GenerateCompletionResponseImpl>
    implements _$$GenerateCompletionResponseImplCopyWith<$Res> {
  __$$GenerateCompletionResponseImplCopyWithImpl(
      _$GenerateCompletionResponseImpl _value,
      $Res Function(_$GenerateCompletionResponseImpl) _then)
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
    return _then(_$GenerateCompletionResponseImpl(
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
class _$GenerateCompletionResponseImpl extends _GenerateCompletionResponse {
  const _$GenerateCompletionResponseImpl(
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

  factory _$GenerateCompletionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GenerateCompletionResponseImplFromJson(json);

  /// The name of the model used to generate the response.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// Date on which a model was created.
  @override
  @JsonKey(name: 'created_at', includeIfNull: false)
  final String? createdAt;

  /// The response for a given prompt with a provided model.
  @override
  @JsonKey(includeIfNull: false)
  final String? response;

  /// Whether the response has completed.
  @override
  @JsonKey(includeIfNull: false)
  final bool? done;

  /// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
  final List<int>? _context;

  /// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
  @override
  @JsonKey(includeIfNull: false)
  List<int>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Number of samples generated.
  @override
  @JsonKey(name: 'sample_count', includeIfNull: false)
  final int? sampleCount;

  /// Time spent generating samples.
  @override
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  final int? sampleDuration;

  /// Time spent generating the response.
  @override
  @JsonKey(name: 'total_duration', includeIfNull: false)
  final int? totalDuration;

  /// Time spent in nanoseconds loading the model.
  @override
  @JsonKey(name: 'load_duration', includeIfNull: false)
  final int? loadDuration;

  /// Number of tokens in the prompt.
  @override
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  final int? promptEvalCount;

  /// Time spent in nanoseconds evaluating the prompt.
  @override
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  final int? promptEvalDuration;

  /// Number of tokens the response.
  @override
  @JsonKey(name: 'eval_count', includeIfNull: false)
  final int? evalCount;

  /// Time in nanoseconds spent generating the response.
  @override
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  final int? evalDuration;

  @override
  String toString() {
    return 'GenerateCompletionResponse(model: $model, createdAt: $createdAt, response: $response, done: $done, context: $context, sampleCount: $sampleCount, sampleDuration: $sampleDuration, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateCompletionResponseImpl &&
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
  _$$GenerateCompletionResponseImplCopyWith<_$GenerateCompletionResponseImpl>
      get copyWith => __$$GenerateCompletionResponseImplCopyWithImpl<
          _$GenerateCompletionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateCompletionResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateCompletionResponse extends GenerateCompletionResponse {
  const factory _GenerateCompletionResponse(
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
      final int? evalDuration}) = _$GenerateCompletionResponseImpl;
  const _GenerateCompletionResponse._() : super._();

  factory _GenerateCompletionResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateCompletionResponseImpl.fromJson;

  @override

  /// The name of the model used to generate the response.
  @JsonKey(includeIfNull: false)
  String? get model;
  @override

  /// Date on which a model was created.
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt;
  @override

  /// The response for a given prompt with a provided model.
  @JsonKey(includeIfNull: false)
  String? get response;
  @override

  /// Whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done;
  @override

  /// An encoding of the conversation used in this response, this can be sent in the next request to keep a conversational memory.
  @JsonKey(includeIfNull: false)
  List<int>? get context;
  @override

  /// Number of samples generated.
  @JsonKey(name: 'sample_count', includeIfNull: false)
  int? get sampleCount;
  @override

  /// Time spent generating samples.
  @JsonKey(name: 'sample_duration', includeIfNull: false)
  int? get sampleDuration;
  @override

  /// Time spent generating the response.
  @JsonKey(name: 'total_duration', includeIfNull: false)
  int? get totalDuration;
  @override

  /// Time spent in nanoseconds loading the model.
  @JsonKey(name: 'load_duration', includeIfNull: false)
  int? get loadDuration;
  @override

  /// Number of tokens in the prompt.
  @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
  int? get promptEvalCount;
  @override

  /// Time spent in nanoseconds evaluating the prompt.
  @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
  int? get promptEvalDuration;
  @override

  /// Number of tokens the response.
  @JsonKey(name: 'eval_count', includeIfNull: false)
  int? get evalCount;
  @override

  /// Time in nanoseconds spent generating the response.
  @JsonKey(name: 'eval_duration', includeIfNull: false)
  int? get evalDuration;
  @override
  @JsonKey(ignore: true)
  _$$GenerateCompletionResponseImplCopyWith<_$GenerateCompletionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenerateEmbeddingRequest _$GenerateEmbeddingRequestFromJson(
    Map<String, dynamic> json) {
  return _GenerateEmbeddingRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateEmbeddingRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model => throw _privateConstructorUsedError;

  /// Text to generate embeddings for.
  String get prompt => throw _privateConstructorUsedError;

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateEmbeddingRequestCopyWith<GenerateEmbeddingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateEmbeddingRequestCopyWith<$Res> {
  factory $GenerateEmbeddingRequestCopyWith(GenerateEmbeddingRequest value,
          $Res Function(GenerateEmbeddingRequest) then) =
      _$GenerateEmbeddingRequestCopyWithImpl<$Res, GenerateEmbeddingRequest>;
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) RequestOptions? options});

  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class _$GenerateEmbeddingRequestCopyWithImpl<$Res,
        $Val extends GenerateEmbeddingRequest>
    implements $GenerateEmbeddingRequestCopyWith<$Res> {
  _$GenerateEmbeddingRequestCopyWithImpl(this._value, this._then);

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
              as RequestOptions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestOptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $RequestOptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateEmbeddingRequestImplCopyWith<$Res>
    implements $GenerateEmbeddingRequestCopyWith<$Res> {
  factory _$$GenerateEmbeddingRequestImplCopyWith(
          _$GenerateEmbeddingRequestImpl value,
          $Res Function(_$GenerateEmbeddingRequestImpl) then) =
      __$$GenerateEmbeddingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String prompt,
      @JsonKey(includeIfNull: false) RequestOptions? options});

  @override
  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class __$$GenerateEmbeddingRequestImplCopyWithImpl<$Res>
    extends _$GenerateEmbeddingRequestCopyWithImpl<$Res,
        _$GenerateEmbeddingRequestImpl>
    implements _$$GenerateEmbeddingRequestImplCopyWith<$Res> {
  __$$GenerateEmbeddingRequestImplCopyWithImpl(
      _$GenerateEmbeddingRequestImpl _value,
      $Res Function(_$GenerateEmbeddingRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? options = freezed,
  }) {
    return _then(_$GenerateEmbeddingRequestImpl(
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
              as RequestOptions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateEmbeddingRequestImpl extends _GenerateEmbeddingRequest {
  const _$GenerateEmbeddingRequestImpl(
      {required this.model,
      required this.prompt,
      @JsonKey(includeIfNull: false) this.options})
      : super._();

  factory _$GenerateEmbeddingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateEmbeddingRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String model;

  /// Text to generate embeddings for.
  @override
  final String prompt;

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @override
  @JsonKey(includeIfNull: false)
  final RequestOptions? options;

  @override
  String toString() {
    return 'GenerateEmbeddingRequest(model: $model, prompt: $prompt, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateEmbeddingRequestImpl &&
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
  _$$GenerateEmbeddingRequestImplCopyWith<_$GenerateEmbeddingRequestImpl>
      get copyWith => __$$GenerateEmbeddingRequestImplCopyWithImpl<
          _$GenerateEmbeddingRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateEmbeddingRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateEmbeddingRequest extends GenerateEmbeddingRequest {
  const factory _GenerateEmbeddingRequest(
          {required final String model,
          required final String prompt,
          @JsonKey(includeIfNull: false) final RequestOptions? options}) =
      _$GenerateEmbeddingRequestImpl;
  const _GenerateEmbeddingRequest._() : super._();

  factory _GenerateEmbeddingRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateEmbeddingRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model;
  @override

  /// Text to generate embeddings for.
  String get prompt;
  @override

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options;
  @override
  @JsonKey(ignore: true)
  _$$GenerateEmbeddingRequestImplCopyWith<_$GenerateEmbeddingRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenerateEmbeddingResponse _$GenerateEmbeddingResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateEmbeddingResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateEmbeddingResponse {
  /// The embedding for the prompt.
  @JsonKey(includeIfNull: false)
  List<double>? get embedding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateEmbeddingResponseCopyWith<GenerateEmbeddingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateEmbeddingResponseCopyWith<$Res> {
  factory $GenerateEmbeddingResponseCopyWith(GenerateEmbeddingResponse value,
          $Res Function(GenerateEmbeddingResponse) then) =
      _$GenerateEmbeddingResponseCopyWithImpl<$Res, GenerateEmbeddingResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? embedding});
}

/// @nodoc
class _$GenerateEmbeddingResponseCopyWithImpl<$Res,
        $Val extends GenerateEmbeddingResponse>
    implements $GenerateEmbeddingResponseCopyWith<$Res> {
  _$GenerateEmbeddingResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$GenerateEmbeddingResponseImplCopyWith<$Res>
    implements $GenerateEmbeddingResponseCopyWith<$Res> {
  factory _$$GenerateEmbeddingResponseImplCopyWith(
          _$GenerateEmbeddingResponseImpl value,
          $Res Function(_$GenerateEmbeddingResponseImpl) then) =
      __$$GenerateEmbeddingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<double>? embedding});
}

/// @nodoc
class __$$GenerateEmbeddingResponseImplCopyWithImpl<$Res>
    extends _$GenerateEmbeddingResponseCopyWithImpl<$Res,
        _$GenerateEmbeddingResponseImpl>
    implements _$$GenerateEmbeddingResponseImplCopyWith<$Res> {
  __$$GenerateEmbeddingResponseImplCopyWithImpl(
      _$GenerateEmbeddingResponseImpl _value,
      $Res Function(_$GenerateEmbeddingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embedding = freezed,
  }) {
    return _then(_$GenerateEmbeddingResponseImpl(
      embedding: freezed == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateEmbeddingResponseImpl extends _GenerateEmbeddingResponse {
  const _$GenerateEmbeddingResponseImpl(
      {@JsonKey(includeIfNull: false) final List<double>? embedding})
      : _embedding = embedding,
        super._();

  factory _$GenerateEmbeddingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateEmbeddingResponseImplFromJson(json);

  /// The embedding for the prompt.
  final List<double>? _embedding;

  /// The embedding for the prompt.
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
    return 'GenerateEmbeddingResponse(embedding: $embedding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateEmbeddingResponseImpl &&
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
  _$$GenerateEmbeddingResponseImplCopyWith<_$GenerateEmbeddingResponseImpl>
      get copyWith => __$$GenerateEmbeddingResponseImplCopyWithImpl<
          _$GenerateEmbeddingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateEmbeddingResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateEmbeddingResponse extends GenerateEmbeddingResponse {
  const factory _GenerateEmbeddingResponse(
          {@JsonKey(includeIfNull: false) final List<double>? embedding}) =
      _$GenerateEmbeddingResponseImpl;
  const _GenerateEmbeddingResponse._() : super._();

  factory _GenerateEmbeddingResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateEmbeddingResponseImpl.fromJson;

  @override

  /// The embedding for the prompt.
  @JsonKey(includeIfNull: false)
  List<double>? get embedding;
  @override
  @JsonKey(ignore: true)
  _$$GenerateEmbeddingResponseImplCopyWith<_$GenerateEmbeddingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  bool get stream => throw _privateConstructorUsedError;

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
      bool stream});
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
    Object? stream = null,
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
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
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
      bool stream});
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
    Object? stream = null,
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
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
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
      this.stream = false})
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
  @JsonKey()
  final bool stream;

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
      final bool stream}) = _$CreateRequestImpl;
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
  bool get stream;
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
