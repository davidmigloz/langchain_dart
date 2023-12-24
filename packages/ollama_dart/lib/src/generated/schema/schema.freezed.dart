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

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @JsonKey(includeIfNull: false)
  List<String>? get images => throw _privateConstructorUsedError;

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

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
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
      @JsonKey(includeIfNull: false) List<String>? images,
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
    Object? images = freezed,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      @JsonKey(includeIfNull: false) List<String>? images,
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
    Object? images = freezed,
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
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      @JsonKey(includeIfNull: false) final List<String>? images,
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
      : _images = images,
        _context = context,
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

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  final List<String>? _images;

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'GenerateCompletionRequest(model: $model, prompt: $prompt, images: $images, system: $system, template: $template, context: $context, options: $options, format: $format, raw: $raw, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateCompletionRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
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
      const DeepCollectionEquality().hash(_images),
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
      @JsonKey(includeIfNull: false) final List<String>? images,
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

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @JsonKey(includeIfNull: false)
  List<String>? get images;
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

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
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
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
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

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
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
    return 'GenerateCompletionResponse(model: $model, createdAt: $createdAt, response: $response, done: $done, context: $context, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration)';
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

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
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

GenerateChatCompletionRequest _$GenerateChatCompletionRequestFromJson(
    Map<String, dynamic> json) {
  return _GenerateChatCompletionRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateChatCompletionRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model => throw _privateConstructorUsedError;

  /// The messages of the chat, this can be used to keep a chat memory
  List<Message> get messages => throw _privateConstructorUsedError;

  /// The format to return a response in. Currently the only accepted value is json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ResponseFormat? get format => throw _privateConstructorUsedError;

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options => throw _privateConstructorUsedError;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateChatCompletionRequestCopyWith<GenerateChatCompletionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateChatCompletionRequestCopyWith<$Res> {
  factory $GenerateChatCompletionRequestCopyWith(
          GenerateChatCompletionRequest value,
          $Res Function(GenerateChatCompletionRequest) then) =
      _$GenerateChatCompletionRequestCopyWithImpl<$Res,
          GenerateChatCompletionRequest>;
  @useResult
  $Res call(
      {String model,
      List<Message> messages,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseFormat? format,
      @JsonKey(includeIfNull: false) RequestOptions? options,
      bool stream});

  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class _$GenerateChatCompletionRequestCopyWithImpl<$Res,
        $Val extends GenerateChatCompletionRequest>
    implements $GenerateChatCompletionRequestCopyWith<$Res> {
  _$GenerateChatCompletionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? format = freezed,
    Object? options = freezed,
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ResponseFormat?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as RequestOptions?,
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
abstract class _$$GenerateChatCompletionRequestImplCopyWith<$Res>
    implements $GenerateChatCompletionRequestCopyWith<$Res> {
  factory _$$GenerateChatCompletionRequestImplCopyWith(
          _$GenerateChatCompletionRequestImpl value,
          $Res Function(_$GenerateChatCompletionRequestImpl) then) =
      __$$GenerateChatCompletionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      List<Message> messages,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ResponseFormat? format,
      @JsonKey(includeIfNull: false) RequestOptions? options,
      bool stream});

  @override
  $RequestOptionsCopyWith<$Res>? get options;
}

/// @nodoc
class __$$GenerateChatCompletionRequestImplCopyWithImpl<$Res>
    extends _$GenerateChatCompletionRequestCopyWithImpl<$Res,
        _$GenerateChatCompletionRequestImpl>
    implements _$$GenerateChatCompletionRequestImplCopyWith<$Res> {
  __$$GenerateChatCompletionRequestImplCopyWithImpl(
      _$GenerateChatCompletionRequestImpl _value,
      $Res Function(_$GenerateChatCompletionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? format = freezed,
    Object? options = freezed,
    Object? stream = null,
  }) {
    return _then(_$GenerateChatCompletionRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ResponseFormat?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as RequestOptions?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateChatCompletionRequestImpl
    extends _GenerateChatCompletionRequest {
  const _$GenerateChatCompletionRequestImpl(
      {required this.model,
      required final List<Message> messages,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.format,
      @JsonKey(includeIfNull: false) this.options,
      this.stream = false})
      : _messages = messages,
        super._();

  factory _$GenerateChatCompletionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GenerateChatCompletionRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String model;

  /// The messages of the chat, this can be used to keep a chat memory
  final List<Message> _messages;

  /// The messages of the chat, this can be used to keep a chat memory
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// The format to return a response in. Currently the only accepted value is json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ResponseFormat? format;

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @override
  @JsonKey(includeIfNull: false)
  final RequestOptions? options;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'GenerateChatCompletionRequest(model: $model, messages: $messages, format: $format, options: $options, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateChatCompletionRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model,
      const DeepCollectionEquality().hash(_messages), format, options, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateChatCompletionRequestImplCopyWith<
          _$GenerateChatCompletionRequestImpl>
      get copyWith => __$$GenerateChatCompletionRequestImplCopyWithImpl<
          _$GenerateChatCompletionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateChatCompletionRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateChatCompletionRequest
    extends GenerateChatCompletionRequest {
  const factory _GenerateChatCompletionRequest(
      {required final String model,
      required final List<Message> messages,
      @JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final ResponseFormat? format,
      @JsonKey(includeIfNull: false) final RequestOptions? options,
      final bool stream}) = _$GenerateChatCompletionRequestImpl;
  const _GenerateChatCompletionRequest._() : super._();

  factory _GenerateChatCompletionRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateChatCompletionRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get model;
  @override

  /// The messages of the chat, this can be used to keep a chat memory
  List<Message> get messages;
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

  /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
  @JsonKey(includeIfNull: false)
  RequestOptions? get options;
  @override

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$GenerateChatCompletionRequestImplCopyWith<
          _$GenerateChatCompletionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenerateChatCompletionResponse _$GenerateChatCompletionResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateChatCompletionResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateChatCompletionResponse {
  /// A message in the chat endpoint
  @JsonKey(includeIfNull: false)
  Message? get message => throw _privateConstructorUsedError;

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get model => throw _privateConstructorUsedError;

  /// Date on which a model was created.
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt => throw _privateConstructorUsedError;

  /// Whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done => throw _privateConstructorUsedError;

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
  $GenerateChatCompletionResponseCopyWith<GenerateChatCompletionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateChatCompletionResponseCopyWith<$Res> {
  factory $GenerateChatCompletionResponseCopyWith(
          GenerateChatCompletionResponse value,
          $Res Function(GenerateChatCompletionResponse) then) =
      _$GenerateChatCompletionResponseCopyWithImpl<$Res,
          GenerateChatCompletionResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Message? message,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      int? promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      int? promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration});

  $MessageCopyWith<$Res>? get message;
}

/// @nodoc
class _$GenerateChatCompletionResponseCopyWithImpl<$Res,
        $Val extends GenerateChatCompletionResponse>
    implements $GenerateChatCompletionResponseCopyWith<$Res> {
  _$GenerateChatCompletionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? model = freezed,
    Object? createdAt = freezed,
    Object? done = freezed,
    Object? totalDuration = freezed,
    Object? loadDuration = freezed,
    Object? promptEvalCount = freezed,
    Object? promptEvalDuration = freezed,
    Object? evalCount = freezed,
    Object? evalDuration = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
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

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerateChatCompletionResponseImplCopyWith<$Res>
    implements $GenerateChatCompletionResponseCopyWith<$Res> {
  factory _$$GenerateChatCompletionResponseImplCopyWith(
          _$GenerateChatCompletionResponseImpl value,
          $Res Function(_$GenerateChatCompletionResponseImpl) then) =
      __$$GenerateChatCompletionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Message? message,
      @JsonKey(includeIfNull: false) String? model,
      @JsonKey(name: 'created_at', includeIfNull: false) String? createdAt,
      @JsonKey(includeIfNull: false) bool? done,
      @JsonKey(name: 'total_duration', includeIfNull: false) int? totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) int? loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      int? promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      int? promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) int? evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) int? evalDuration});

  @override
  $MessageCopyWith<$Res>? get message;
}

/// @nodoc
class __$$GenerateChatCompletionResponseImplCopyWithImpl<$Res>
    extends _$GenerateChatCompletionResponseCopyWithImpl<$Res,
        _$GenerateChatCompletionResponseImpl>
    implements _$$GenerateChatCompletionResponseImplCopyWith<$Res> {
  __$$GenerateChatCompletionResponseImplCopyWithImpl(
      _$GenerateChatCompletionResponseImpl _value,
      $Res Function(_$GenerateChatCompletionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? model = freezed,
    Object? createdAt = freezed,
    Object? done = freezed,
    Object? totalDuration = freezed,
    Object? loadDuration = freezed,
    Object? promptEvalCount = freezed,
    Object? promptEvalDuration = freezed,
    Object? evalCount = freezed,
    Object? evalDuration = freezed,
  }) {
    return _then(_$GenerateChatCompletionResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$GenerateChatCompletionResponseImpl
    extends _GenerateChatCompletionResponse {
  const _$GenerateChatCompletionResponseImpl(
      {@JsonKey(includeIfNull: false) this.message,
      @JsonKey(includeIfNull: false) this.model,
      @JsonKey(name: 'created_at', includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.done,
      @JsonKey(name: 'total_duration', includeIfNull: false) this.totalDuration,
      @JsonKey(name: 'load_duration', includeIfNull: false) this.loadDuration,
      @JsonKey(name: 'prompt_eval_count', includeIfNull: false)
      this.promptEvalCount,
      @JsonKey(name: 'prompt_eval_duration', includeIfNull: false)
      this.promptEvalDuration,
      @JsonKey(name: 'eval_count', includeIfNull: false) this.evalCount,
      @JsonKey(name: 'eval_duration', includeIfNull: false) this.evalDuration})
      : super._();

  factory _$GenerateChatCompletionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GenerateChatCompletionResponseImplFromJson(json);

  /// A message in the chat endpoint
  @override
  @JsonKey(includeIfNull: false)
  final Message? message;

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  @JsonKey(includeIfNull: false)
  final String? model;

  /// Date on which a model was created.
  @override
  @JsonKey(name: 'created_at', includeIfNull: false)
  final String? createdAt;

  /// Whether the response has completed.
  @override
  @JsonKey(includeIfNull: false)
  final bool? done;

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
    return 'GenerateChatCompletionResponse(message: $message, model: $model, createdAt: $createdAt, done: $done, totalDuration: $totalDuration, loadDuration: $loadDuration, promptEvalCount: $promptEvalCount, promptEvalDuration: $promptEvalDuration, evalCount: $evalCount, evalDuration: $evalDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateChatCompletionResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.done, done) || other.done == done) &&
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
      message,
      model,
      createdAt,
      done,
      totalDuration,
      loadDuration,
      promptEvalCount,
      promptEvalDuration,
      evalCount,
      evalDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateChatCompletionResponseImplCopyWith<
          _$GenerateChatCompletionResponseImpl>
      get copyWith => __$$GenerateChatCompletionResponseImplCopyWithImpl<
          _$GenerateChatCompletionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateChatCompletionResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateChatCompletionResponse
    extends GenerateChatCompletionResponse {
  const factory _GenerateChatCompletionResponse(
      {@JsonKey(includeIfNull: false) final Message? message,
      @JsonKey(includeIfNull: false) final String? model,
      @JsonKey(name: 'created_at', includeIfNull: false)
      final String? createdAt,
      @JsonKey(includeIfNull: false) final bool? done,
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
      final int? evalDuration}) = _$GenerateChatCompletionResponseImpl;
  const _GenerateChatCompletionResponse._() : super._();

  factory _GenerateChatCompletionResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateChatCompletionResponseImpl.fromJson;

  @override

  /// A message in the chat endpoint
  @JsonKey(includeIfNull: false)
  Message? get message;
  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get model;
  @override

  /// Date on which a model was created.
  @JsonKey(name: 'created_at', includeIfNull: false)
  String? get createdAt;
  @override

  /// Whether the response has completed.
  @JsonKey(includeIfNull: false)
  bool? get done;
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
  _$$GenerateChatCompletionResponseImplCopyWith<
          _$GenerateChatCompletionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  /// The role of the message
  MessageRole get role => throw _privateConstructorUsedError;

  /// The content of the message
  String get content => throw _privateConstructorUsedError;

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @JsonKey(includeIfNull: false)
  List<String>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {MessageRole role,
      String content,
      @JsonKey(includeIfNull: false) List<String>? images});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MessageRole role,
      String content,
      @JsonKey(includeIfNull: false) List<String>? images});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? images = freezed,
  }) {
    return _then(_$MessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {required this.role,
      required this.content,
      @JsonKey(includeIfNull: false) final List<String>? images})
      : _images = images,
        super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  /// The role of the message
  @override
  final MessageRole role;

  /// The content of the message
  @override
  final String content;

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  final List<String>? _images;

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Message(role: $role, content: $content, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, role, content, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
          {required final MessageRole role,
          required final String content,
          @JsonKey(includeIfNull: false) final List<String>? images}) =
      _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override

  /// The role of the message
  MessageRole get role;
  @override

  /// The content of the message
  String get content;
  @override

  /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
  @JsonKey(includeIfNull: false)
  List<String>? get images;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
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

CreateModelRequest _$CreateModelRequestFromJson(Map<String, dynamic> json) {
  return _CreateModelRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateModelRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name => throw _privateConstructorUsedError;

  /// The contents of the Modelfile.
  String get modelfile => throw _privateConstructorUsedError;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateModelRequestCopyWith<CreateModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateModelRequestCopyWith<$Res> {
  factory $CreateModelRequestCopyWith(
          CreateModelRequest value, $Res Function(CreateModelRequest) then) =
      _$CreateModelRequestCopyWithImpl<$Res, CreateModelRequest>;
  @useResult
  $Res call({String name, String modelfile, bool stream});
}

/// @nodoc
class _$CreateModelRequestCopyWithImpl<$Res, $Val extends CreateModelRequest>
    implements $CreateModelRequestCopyWith<$Res> {
  _$CreateModelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? modelfile = null,
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
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateModelRequestImplCopyWith<$Res>
    implements $CreateModelRequestCopyWith<$Res> {
  factory _$$CreateModelRequestImplCopyWith(_$CreateModelRequestImpl value,
          $Res Function(_$CreateModelRequestImpl) then) =
      __$$CreateModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String modelfile, bool stream});
}

/// @nodoc
class __$$CreateModelRequestImplCopyWithImpl<$Res>
    extends _$CreateModelRequestCopyWithImpl<$Res, _$CreateModelRequestImpl>
    implements _$$CreateModelRequestImplCopyWith<$Res> {
  __$$CreateModelRequestImplCopyWithImpl(_$CreateModelRequestImpl _value,
      $Res Function(_$CreateModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? modelfile = null,
    Object? stream = null,
  }) {
    return _then(_$CreateModelRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelfile: null == modelfile
          ? _value.modelfile
          : modelfile // ignore: cast_nullable_to_non_nullable
              as String,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateModelRequestImpl extends _CreateModelRequest {
  const _$CreateModelRequestImpl(
      {required this.name, required this.modelfile, this.stream = false})
      : super._();

  factory _$CreateModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateModelRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String name;

  /// The contents of the Modelfile.
  @override
  final String modelfile;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'CreateModelRequest(name: $name, modelfile: $modelfile, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateModelRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modelfile, modelfile) ||
                other.modelfile == modelfile) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, modelfile, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateModelRequestImplCopyWith<_$CreateModelRequestImpl> get copyWith =>
      __$$CreateModelRequestImplCopyWithImpl<_$CreateModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateModelRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateModelRequest extends CreateModelRequest {
  const factory _CreateModelRequest(
      {required final String name,
      required final String modelfile,
      final bool stream}) = _$CreateModelRequestImpl;
  const _CreateModelRequest._() : super._();

  factory _CreateModelRequest.fromJson(Map<String, dynamic> json) =
      _$CreateModelRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name;
  @override

  /// The contents of the Modelfile.
  String get modelfile;
  @override

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$CreateModelRequestImplCopyWith<_$CreateModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateModelResponse _$CreateModelResponseFromJson(Map<String, dynamic> json) {
  return _CreateModelResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateModelResponse {
  /// Status creating the model
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CreateModelStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateModelResponseCopyWith<CreateModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateModelResponseCopyWith<$Res> {
  factory $CreateModelResponseCopyWith(
          CreateModelResponse value, $Res Function(CreateModelResponse) then) =
      _$CreateModelResponseCopyWithImpl<$Res, CreateModelResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CreateModelStatus? status});
}

/// @nodoc
class _$CreateModelResponseCopyWithImpl<$Res, $Val extends CreateModelResponse>
    implements $CreateModelResponseCopyWith<$Res> {
  _$CreateModelResponseCopyWithImpl(this._value, this._then);

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
              as CreateModelStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateModelResponseImplCopyWith<$Res>
    implements $CreateModelResponseCopyWith<$Res> {
  factory _$$CreateModelResponseImplCopyWith(_$CreateModelResponseImpl value,
          $Res Function(_$CreateModelResponseImpl) then) =
      __$$CreateModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      CreateModelStatus? status});
}

/// @nodoc
class __$$CreateModelResponseImplCopyWithImpl<$Res>
    extends _$CreateModelResponseCopyWithImpl<$Res, _$CreateModelResponseImpl>
    implements _$$CreateModelResponseImplCopyWith<$Res> {
  __$$CreateModelResponseImplCopyWithImpl(_$CreateModelResponseImpl _value,
      $Res Function(_$CreateModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$CreateModelResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateModelStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateModelResponseImpl extends _CreateModelResponse {
  const _$CreateModelResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status})
      : super._();

  factory _$CreateModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateModelResponseImplFromJson(json);

  /// Status creating the model
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final CreateModelStatus? status;

  @override
  String toString() {
    return 'CreateModelResponse(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateModelResponseImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateModelResponseImplCopyWith<_$CreateModelResponseImpl> get copyWith =>
      __$$CreateModelResponseImplCopyWithImpl<_$CreateModelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateModelResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateModelResponse extends CreateModelResponse {
  const factory _CreateModelResponse(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      final CreateModelStatus? status}) = _$CreateModelResponseImpl;
  const _CreateModelResponse._() : super._();

  factory _CreateModelResponse.fromJson(Map<String, dynamic> json) =
      _$CreateModelResponseImpl.fromJson;

  @override

  /// Status creating the model
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  CreateModelStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateModelResponseImplCopyWith<_$CreateModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelsResponse _$ModelsResponseFromJson(Map<String, dynamic> json) {
  return _ModelsResponse.fromJson(json);
}

/// @nodoc
mixin _$ModelsResponse {
  /// List of models available locally.
  @JsonKey(includeIfNull: false)
  List<Model>? get models => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelsResponseCopyWith<ModelsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelsResponseCopyWith<$Res> {
  factory $ModelsResponseCopyWith(
          ModelsResponse value, $Res Function(ModelsResponse) then) =
      _$ModelsResponseCopyWithImpl<$Res, ModelsResponse>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Model>? models});
}

/// @nodoc
class _$ModelsResponseCopyWithImpl<$Res, $Val extends ModelsResponse>
    implements $ModelsResponseCopyWith<$Res> {
  _$ModelsResponseCopyWithImpl(this._value, this._then);

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
              as List<Model>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelsResponseImplCopyWith<$Res>
    implements $ModelsResponseCopyWith<$Res> {
  factory _$$ModelsResponseImplCopyWith(_$ModelsResponseImpl value,
          $Res Function(_$ModelsResponseImpl) then) =
      __$$ModelsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<Model>? models});
}

/// @nodoc
class __$$ModelsResponseImplCopyWithImpl<$Res>
    extends _$ModelsResponseCopyWithImpl<$Res, _$ModelsResponseImpl>
    implements _$$ModelsResponseImplCopyWith<$Res> {
  __$$ModelsResponseImplCopyWithImpl(
      _$ModelsResponseImpl _value, $Res Function(_$ModelsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = freezed,
  }) {
    return _then(_$ModelsResponseImpl(
      models: freezed == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<Model>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelsResponseImpl extends _ModelsResponse {
  const _$ModelsResponseImpl(
      {@JsonKey(includeIfNull: false) final List<Model>? models})
      : _models = models,
        super._();

  factory _$ModelsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelsResponseImplFromJson(json);

  /// List of models available locally.
  final List<Model>? _models;

  /// List of models available locally.
  @override
  @JsonKey(includeIfNull: false)
  List<Model>? get models {
    final value = _models;
    if (value == null) return null;
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ModelsResponse(models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelsResponseImpl &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelsResponseImplCopyWith<_$ModelsResponseImpl> get copyWith =>
      __$$ModelsResponseImplCopyWithImpl<_$ModelsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelsResponseImplToJson(
      this,
    );
  }
}

abstract class _ModelsResponse extends ModelsResponse {
  const factory _ModelsResponse(
          {@JsonKey(includeIfNull: false) final List<Model>? models}) =
      _$ModelsResponseImpl;
  const _ModelsResponse._() : super._();

  factory _ModelsResponse.fromJson(Map<String, dynamic> json) =
      _$ModelsResponseImpl.fromJson;

  @override

  /// List of models available locally.
  @JsonKey(includeIfNull: false)
  List<Model>? get models;
  @override
  @JsonKey(ignore: true)
  _$$ModelsResponseImplCopyWith<_$ModelsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return _Model.fromJson(json);
}

/// @nodoc
mixin _$Model {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get name => throw _privateConstructorUsedError;

  /// Model modification date.
  @JsonKey(name: 'modified_at', includeIfNull: false)
  String? get modifiedAt => throw _privateConstructorUsedError;

  /// Size of the model on disk.
  @JsonKey(includeIfNull: false)
  int? get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelCopyWith<Model> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelCopyWith<$Res> {
  factory $ModelCopyWith(Model value, $Res Function(Model) then) =
      _$ModelCopyWithImpl<$Res, Model>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,
      @JsonKey(includeIfNull: false) int? size});
}

/// @nodoc
class _$ModelCopyWithImpl<$Res, $Val extends Model>
    implements $ModelCopyWith<$Res> {
  _$ModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ModelImplCopyWith<$Res> implements $ModelCopyWith<$Res> {
  factory _$$ModelImplCopyWith(
          _$ModelImpl value, $Res Function(_$ModelImpl) then) =
      __$$ModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false) String? modifiedAt,
      @JsonKey(includeIfNull: false) int? size});
}

/// @nodoc
class __$$ModelImplCopyWithImpl<$Res>
    extends _$ModelCopyWithImpl<$Res, _$ModelImpl>
    implements _$$ModelImplCopyWith<$Res> {
  __$$ModelImplCopyWithImpl(
      _$ModelImpl _value, $Res Function(_$ModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? modifiedAt = freezed,
    Object? size = freezed,
  }) {
    return _then(_$ModelImpl(
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
class _$ModelImpl extends _Model {
  const _$ModelImpl(
      {@JsonKey(includeIfNull: false) this.name,
      @JsonKey(name: 'modified_at', includeIfNull: false) this.modifiedAt,
      @JsonKey(includeIfNull: false) this.size})
      : super._();

  factory _$ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  @JsonKey(includeIfNull: false)
  final String? name;

  /// Model modification date.
  @override
  @JsonKey(name: 'modified_at', includeIfNull: false)
  final String? modifiedAt;

  /// Size of the model on disk.
  @override
  @JsonKey(includeIfNull: false)
  final int? size;

  @override
  String toString() {
    return 'Model(name: $name, modifiedAt: $modifiedAt, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelImpl &&
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
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      __$$ModelImplCopyWithImpl<_$ModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelImplToJson(
      this,
    );
  }
}

abstract class _Model extends Model {
  const factory _Model(
      {@JsonKey(includeIfNull: false) final String? name,
      @JsonKey(name: 'modified_at', includeIfNull: false)
      final String? modifiedAt,
      @JsonKey(includeIfNull: false) final int? size}) = _$ModelImpl;
  const _Model._() : super._();

  factory _Model.fromJson(Map<String, dynamic> json) = _$ModelImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @JsonKey(includeIfNull: false)
  String? get name;
  @override

  /// Model modification date.
  @JsonKey(name: 'modified_at', includeIfNull: false)
  String? get modifiedAt;
  @override

  /// Size of the model on disk.
  @JsonKey(includeIfNull: false)
  int? get size;
  @override
  @JsonKey(ignore: true)
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelInfoRequest _$ModelInfoRequestFromJson(Map<String, dynamic> json) {
  return _ModelInfoRequest.fromJson(json);
}

/// @nodoc
mixin _$ModelInfoRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelInfoRequestCopyWith<ModelInfoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelInfoRequestCopyWith<$Res> {
  factory $ModelInfoRequestCopyWith(
          ModelInfoRequest value, $Res Function(ModelInfoRequest) then) =
      _$ModelInfoRequestCopyWithImpl<$Res, ModelInfoRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ModelInfoRequestCopyWithImpl<$Res, $Val extends ModelInfoRequest>
    implements $ModelInfoRequestCopyWith<$Res> {
  _$ModelInfoRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$ModelInfoRequestImplCopyWith<$Res>
    implements $ModelInfoRequestCopyWith<$Res> {
  factory _$$ModelInfoRequestImplCopyWith(_$ModelInfoRequestImpl value,
          $Res Function(_$ModelInfoRequestImpl) then) =
      __$$ModelInfoRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ModelInfoRequestImplCopyWithImpl<$Res>
    extends _$ModelInfoRequestCopyWithImpl<$Res, _$ModelInfoRequestImpl>
    implements _$$ModelInfoRequestImplCopyWith<$Res> {
  __$$ModelInfoRequestImplCopyWithImpl(_$ModelInfoRequestImpl _value,
      $Res Function(_$ModelInfoRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ModelInfoRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelInfoRequestImpl extends _ModelInfoRequest {
  const _$ModelInfoRequestImpl({required this.name}) : super._();

  factory _$ModelInfoRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelInfoRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String name;

  @override
  String toString() {
    return 'ModelInfoRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelInfoRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelInfoRequestImplCopyWith<_$ModelInfoRequestImpl> get copyWith =>
      __$$ModelInfoRequestImplCopyWithImpl<_$ModelInfoRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelInfoRequestImplToJson(
      this,
    );
  }
}

abstract class _ModelInfoRequest extends ModelInfoRequest {
  const factory _ModelInfoRequest({required final String name}) =
      _$ModelInfoRequestImpl;
  const _ModelInfoRequest._() : super._();

  factory _ModelInfoRequest.fromJson(Map<String, dynamic> json) =
      _$ModelInfoRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ModelInfoRequestImplCopyWith<_$ModelInfoRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) {
  return _ModelInfo.fromJson(json);
}

/// @nodoc
mixin _$ModelInfo {
  /// The model's license.
  @JsonKey(includeIfNull: false)
  String? get license => throw _privateConstructorUsedError;

  /// The modelfile associated with the model.
  @JsonKey(includeIfNull: false)
  String? get modelfile => throw _privateConstructorUsedError;

  /// The model parameters.
  @JsonKey(includeIfNull: false)
  String? get parameters => throw _privateConstructorUsedError;

  /// The prompt template for the model.
  @JsonKey(includeIfNull: false)
  String? get template => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelInfoCopyWith<ModelInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelInfoCopyWith<$Res> {
  factory $ModelInfoCopyWith(ModelInfo value, $Res Function(ModelInfo) then) =
      _$ModelInfoCopyWithImpl<$Res, ModelInfo>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? modelfile,
      @JsonKey(includeIfNull: false) String? parameters,
      @JsonKey(includeIfNull: false) String? template});
}

/// @nodoc
class _$ModelInfoCopyWithImpl<$Res, $Val extends ModelInfo>
    implements $ModelInfoCopyWith<$Res> {
  _$ModelInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$ModelInfoImplCopyWith<$Res>
    implements $ModelInfoCopyWith<$Res> {
  factory _$$ModelInfoImplCopyWith(
          _$ModelInfoImpl value, $Res Function(_$ModelInfoImpl) then) =
      __$$ModelInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? license,
      @JsonKey(includeIfNull: false) String? modelfile,
      @JsonKey(includeIfNull: false) String? parameters,
      @JsonKey(includeIfNull: false) String? template});
}

/// @nodoc
class __$$ModelInfoImplCopyWithImpl<$Res>
    extends _$ModelInfoCopyWithImpl<$Res, _$ModelInfoImpl>
    implements _$$ModelInfoImplCopyWith<$Res> {
  __$$ModelInfoImplCopyWithImpl(
      _$ModelInfoImpl _value, $Res Function(_$ModelInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? license = freezed,
    Object? modelfile = freezed,
    Object? parameters = freezed,
    Object? template = freezed,
  }) {
    return _then(_$ModelInfoImpl(
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
class _$ModelInfoImpl extends _ModelInfo {
  const _$ModelInfoImpl(
      {@JsonKey(includeIfNull: false) this.license,
      @JsonKey(includeIfNull: false) this.modelfile,
      @JsonKey(includeIfNull: false) this.parameters,
      @JsonKey(includeIfNull: false) this.template})
      : super._();

  factory _$ModelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelInfoImplFromJson(json);

  /// The model's license.
  @override
  @JsonKey(includeIfNull: false)
  final String? license;

  /// The modelfile associated with the model.
  @override
  @JsonKey(includeIfNull: false)
  final String? modelfile;

  /// The model parameters.
  @override
  @JsonKey(includeIfNull: false)
  final String? parameters;

  /// The prompt template for the model.
  @override
  @JsonKey(includeIfNull: false)
  final String? template;

  @override
  String toString() {
    return 'ModelInfo(license: $license, modelfile: $modelfile, parameters: $parameters, template: $template)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelInfoImpl &&
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
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      __$$ModelInfoImplCopyWithImpl<_$ModelInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelInfoImplToJson(
      this,
    );
  }
}

abstract class _ModelInfo extends ModelInfo {
  const factory _ModelInfo(
      {@JsonKey(includeIfNull: false) final String? license,
      @JsonKey(includeIfNull: false) final String? modelfile,
      @JsonKey(includeIfNull: false) final String? parameters,
      @JsonKey(includeIfNull: false) final String? template}) = _$ModelInfoImpl;
  const _ModelInfo._() : super._();

  factory _ModelInfo.fromJson(Map<String, dynamic> json) =
      _$ModelInfoImpl.fromJson;

  @override

  /// The model's license.
  @JsonKey(includeIfNull: false)
  String? get license;
  @override

  /// The modelfile associated with the model.
  @JsonKey(includeIfNull: false)
  String? get modelfile;
  @override

  /// The model parameters.
  @JsonKey(includeIfNull: false)
  String? get parameters;
  @override

  /// The prompt template for the model.
  @JsonKey(includeIfNull: false)
  String? get template;
  @override
  @JsonKey(ignore: true)
  _$$ModelInfoImplCopyWith<_$ModelInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CopyModelRequest _$CopyModelRequestFromJson(Map<String, dynamic> json) {
  return _CopyModelRequest.fromJson(json);
}

/// @nodoc
mixin _$CopyModelRequest {
  /// Name of the model to copy.
  String get source => throw _privateConstructorUsedError;

  /// Name of the new model.
  String get destination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CopyModelRequestCopyWith<CopyModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyModelRequestCopyWith<$Res> {
  factory $CopyModelRequestCopyWith(
          CopyModelRequest value, $Res Function(CopyModelRequest) then) =
      _$CopyModelRequestCopyWithImpl<$Res, CopyModelRequest>;
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class _$CopyModelRequestCopyWithImpl<$Res, $Val extends CopyModelRequest>
    implements $CopyModelRequestCopyWith<$Res> {
  _$CopyModelRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$CopyModelRequestImplCopyWith<$Res>
    implements $CopyModelRequestCopyWith<$Res> {
  factory _$$CopyModelRequestImplCopyWith(_$CopyModelRequestImpl value,
          $Res Function(_$CopyModelRequestImpl) then) =
      __$$CopyModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String destination});
}

/// @nodoc
class __$$CopyModelRequestImplCopyWithImpl<$Res>
    extends _$CopyModelRequestCopyWithImpl<$Res, _$CopyModelRequestImpl>
    implements _$$CopyModelRequestImplCopyWith<$Res> {
  __$$CopyModelRequestImplCopyWithImpl(_$CopyModelRequestImpl _value,
      $Res Function(_$CopyModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
  }) {
    return _then(_$CopyModelRequestImpl(
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
class _$CopyModelRequestImpl extends _CopyModelRequest {
  const _$CopyModelRequestImpl(
      {required this.source, required this.destination})
      : super._();

  factory _$CopyModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyModelRequestImplFromJson(json);

  /// Name of the model to copy.
  @override
  final String source;

  /// Name of the new model.
  @override
  final String destination;

  @override
  String toString() {
    return 'CopyModelRequest(source: $source, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyModelRequestImpl &&
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
  _$$CopyModelRequestImplCopyWith<_$CopyModelRequestImpl> get copyWith =>
      __$$CopyModelRequestImplCopyWithImpl<_$CopyModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyModelRequestImplToJson(
      this,
    );
  }
}

abstract class _CopyModelRequest extends CopyModelRequest {
  const factory _CopyModelRequest(
      {required final String source,
      required final String destination}) = _$CopyModelRequestImpl;
  const _CopyModelRequest._() : super._();

  factory _CopyModelRequest.fromJson(Map<String, dynamic> json) =
      _$CopyModelRequestImpl.fromJson;

  @override

  /// Name of the model to copy.
  String get source;
  @override

  /// Name of the new model.
  String get destination;
  @override
  @JsonKey(ignore: true)
  _$$CopyModelRequestImplCopyWith<_$CopyModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteModelRequest _$DeleteModelRequestFromJson(Map<String, dynamic> json) {
  return _DeleteModelRequest.fromJson(json);
}

/// @nodoc
mixin _$DeleteModelRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteModelRequestCopyWith<DeleteModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteModelRequestCopyWith<$Res> {
  factory $DeleteModelRequestCopyWith(
          DeleteModelRequest value, $Res Function(DeleteModelRequest) then) =
      _$DeleteModelRequestCopyWithImpl<$Res, DeleteModelRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$DeleteModelRequestCopyWithImpl<$Res, $Val extends DeleteModelRequest>
    implements $DeleteModelRequestCopyWith<$Res> {
  _$DeleteModelRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$DeleteModelRequestImplCopyWith<$Res>
    implements $DeleteModelRequestCopyWith<$Res> {
  factory _$$DeleteModelRequestImplCopyWith(_$DeleteModelRequestImpl value,
          $Res Function(_$DeleteModelRequestImpl) then) =
      __$$DeleteModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$DeleteModelRequestImplCopyWithImpl<$Res>
    extends _$DeleteModelRequestCopyWithImpl<$Res, _$DeleteModelRequestImpl>
    implements _$$DeleteModelRequestImplCopyWith<$Res> {
  __$$DeleteModelRequestImplCopyWithImpl(_$DeleteModelRequestImpl _value,
      $Res Function(_$DeleteModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$DeleteModelRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteModelRequestImpl extends _DeleteModelRequest {
  const _$DeleteModelRequestImpl({required this.name}) : super._();

  factory _$DeleteModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteModelRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String name;

  @override
  String toString() {
    return 'DeleteModelRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteModelRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteModelRequestImplCopyWith<_$DeleteModelRequestImpl> get copyWith =>
      __$$DeleteModelRequestImplCopyWithImpl<_$DeleteModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteModelRequestImplToJson(
      this,
    );
  }
}

abstract class _DeleteModelRequest extends DeleteModelRequest {
  const factory _DeleteModelRequest({required final String name}) =
      _$DeleteModelRequestImpl;
  const _DeleteModelRequest._() : super._();

  factory _DeleteModelRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteModelRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$DeleteModelRequestImplCopyWith<_$DeleteModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PullModelRequest _$PullModelRequestFromJson(Map<String, dynamic> json) {
  return _PullModelRequest.fromJson(json);
}

/// @nodoc
mixin _$PullModelRequest {
  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name => throw _privateConstructorUsedError;

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pulling from your own library during development.
  bool get insecure => throw _privateConstructorUsedError;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PullModelRequestCopyWith<PullModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullModelRequestCopyWith<$Res> {
  factory $PullModelRequestCopyWith(
          PullModelRequest value, $Res Function(PullModelRequest) then) =
      _$PullModelRequestCopyWithImpl<$Res, PullModelRequest>;
  @useResult
  $Res call({String name, bool insecure, bool stream});
}

/// @nodoc
class _$PullModelRequestCopyWithImpl<$Res, $Val extends PullModelRequest>
    implements $PullModelRequestCopyWith<$Res> {
  _$PullModelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = null,
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: null == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PullModelRequestImplCopyWith<$Res>
    implements $PullModelRequestCopyWith<$Res> {
  factory _$$PullModelRequestImplCopyWith(_$PullModelRequestImpl value,
          $Res Function(_$PullModelRequestImpl) then) =
      __$$PullModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool insecure, bool stream});
}

/// @nodoc
class __$$PullModelRequestImplCopyWithImpl<$Res>
    extends _$PullModelRequestCopyWithImpl<$Res, _$PullModelRequestImpl>
    implements _$$PullModelRequestImplCopyWith<$Res> {
  __$$PullModelRequestImplCopyWithImpl(_$PullModelRequestImpl _value,
      $Res Function(_$PullModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = null,
    Object? stream = null,
  }) {
    return _then(_$PullModelRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: null == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PullModelRequestImpl extends _PullModelRequest {
  const _$PullModelRequestImpl(
      {required this.name, this.insecure = false, this.stream = false})
      : super._();

  factory _$PullModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullModelRequestImplFromJson(json);

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  @override
  final String name;

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pulling from your own library during development.
  @override
  @JsonKey()
  final bool insecure;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'PullModelRequest(name: $name, insecure: $insecure, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullModelRequestImpl &&
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
  _$$PullModelRequestImplCopyWith<_$PullModelRequestImpl> get copyWith =>
      __$$PullModelRequestImplCopyWithImpl<_$PullModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullModelRequestImplToJson(
      this,
    );
  }
}

abstract class _PullModelRequest extends PullModelRequest {
  const factory _PullModelRequest(
      {required final String name,
      final bool insecure,
      final bool stream}) = _$PullModelRequestImpl;
  const _PullModelRequest._() : super._();

  factory _PullModelRequest.fromJson(Map<String, dynamic> json) =
      _$PullModelRequestImpl.fromJson;

  @override

  /// The model name.
  ///
  /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
  String get name;
  @override

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pulling from your own library during development.
  bool get insecure;
  @override

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$PullModelRequestImplCopyWith<_$PullModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PullModelResponse _$PullModelResponseFromJson(Map<String, dynamic> json) {
  return _PullModelResponse.fromJson(json);
}

/// @nodoc
mixin _$PullModelResponse {
  /// Status pulling the model.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PullModelStatus? get status => throw _privateConstructorUsedError;

  /// The model's digest.
  @JsonKey(includeIfNull: false)
  String? get digest => throw _privateConstructorUsedError;

  /// Total size of the model.
  @JsonKey(includeIfNull: false)
  int? get total => throw _privateConstructorUsedError;

  /// Total bytes transferred.
  @JsonKey(includeIfNull: false)
  int? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PullModelResponseCopyWith<PullModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullModelResponseCopyWith<$Res> {
  factory $PullModelResponseCopyWith(
          PullModelResponse value, $Res Function(PullModelResponse) then) =
      _$PullModelResponseCopyWithImpl<$Res, PullModelResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PullModelStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total,
      @JsonKey(includeIfNull: false) int? completed});
}

/// @nodoc
class _$PullModelResponseCopyWithImpl<$Res, $Val extends PullModelResponse>
    implements $PullModelResponseCopyWith<$Res> {
  _$PullModelResponseCopyWithImpl(this._value, this._then);

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
              as PullModelStatus?,
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
abstract class _$$PullModelResponseImplCopyWith<$Res>
    implements $PullModelResponseCopyWith<$Res> {
  factory _$$PullModelResponseImplCopyWith(_$PullModelResponseImpl value,
          $Res Function(_$PullModelResponseImpl) then) =
      __$$PullModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PullModelStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total,
      @JsonKey(includeIfNull: false) int? completed});
}

/// @nodoc
class __$$PullModelResponseImplCopyWithImpl<$Res>
    extends _$PullModelResponseCopyWithImpl<$Res, _$PullModelResponseImpl>
    implements _$$PullModelResponseImplCopyWith<$Res> {
  __$$PullModelResponseImplCopyWithImpl(_$PullModelResponseImpl _value,
      $Res Function(_$PullModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$PullModelResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PullModelStatus?,
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
class _$PullModelResponseImpl extends _PullModelResponse {
  const _$PullModelResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(includeIfNull: false) this.digest,
      @JsonKey(includeIfNull: false) this.total,
      @JsonKey(includeIfNull: false) this.completed})
      : super._();

  factory _$PullModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullModelResponseImplFromJson(json);

  /// Status pulling the model.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PullModelStatus? status;

  /// The model's digest.
  @override
  @JsonKey(includeIfNull: false)
  final String? digest;

  /// Total size of the model.
  @override
  @JsonKey(includeIfNull: false)
  final int? total;

  /// Total bytes transferred.
  @override
  @JsonKey(includeIfNull: false)
  final int? completed;

  @override
  String toString() {
    return 'PullModelResponse(status: $status, digest: $digest, total: $total, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullModelResponseImpl &&
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
  _$$PullModelResponseImplCopyWith<_$PullModelResponseImpl> get copyWith =>
      __$$PullModelResponseImplCopyWithImpl<_$PullModelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullModelResponseImplToJson(
      this,
    );
  }
}

abstract class _PullModelResponse extends PullModelResponse {
  const factory _PullModelResponse(
          {@JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final PullModelStatus? status,
          @JsonKey(includeIfNull: false) final String? digest,
          @JsonKey(includeIfNull: false) final int? total,
          @JsonKey(includeIfNull: false) final int? completed}) =
      _$PullModelResponseImpl;
  const _PullModelResponse._() : super._();

  factory _PullModelResponse.fromJson(Map<String, dynamic> json) =
      _$PullModelResponseImpl.fromJson;

  @override

  /// Status pulling the model.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PullModelStatus? get status;
  @override

  /// The model's digest.
  @JsonKey(includeIfNull: false)
  String? get digest;
  @override

  /// Total size of the model.
  @JsonKey(includeIfNull: false)
  int? get total;
  @override

  /// Total bytes transferred.
  @JsonKey(includeIfNull: false)
  int? get completed;
  @override
  @JsonKey(ignore: true)
  _$$PullModelResponseImplCopyWith<_$PullModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushModelRequest _$PushModelRequestFromJson(Map<String, dynamic> json) {
  return _PushModelRequest.fromJson(json);
}

/// @nodoc
mixin _$PushModelRequest {
  /// The name of the model to push in the form of <namespace>/<model>:<tag>.
  String get name => throw _privateConstructorUsedError;

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pushing to your library during development.
  bool get insecure => throw _privateConstructorUsedError;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushModelRequestCopyWith<PushModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushModelRequestCopyWith<$Res> {
  factory $PushModelRequestCopyWith(
          PushModelRequest value, $Res Function(PushModelRequest) then) =
      _$PushModelRequestCopyWithImpl<$Res, PushModelRequest>;
  @useResult
  $Res call({String name, bool insecure, bool stream});
}

/// @nodoc
class _$PushModelRequestCopyWithImpl<$Res, $Val extends PushModelRequest>
    implements $PushModelRequestCopyWith<$Res> {
  _$PushModelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = null,
    Object? stream = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: null == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushModelRequestImplCopyWith<$Res>
    implements $PushModelRequestCopyWith<$Res> {
  factory _$$PushModelRequestImplCopyWith(_$PushModelRequestImpl value,
          $Res Function(_$PushModelRequestImpl) then) =
      __$$PushModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool insecure, bool stream});
}

/// @nodoc
class __$$PushModelRequestImplCopyWithImpl<$Res>
    extends _$PushModelRequestCopyWithImpl<$Res, _$PushModelRequestImpl>
    implements _$$PushModelRequestImplCopyWith<$Res> {
  __$$PushModelRequestImplCopyWithImpl(_$PushModelRequestImpl _value,
      $Res Function(_$PushModelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? insecure = null,
    Object? stream = null,
  }) {
    return _then(_$PushModelRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      insecure: null == insecure
          ? _value.insecure
          : insecure // ignore: cast_nullable_to_non_nullable
              as bool,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushModelRequestImpl extends _PushModelRequest {
  const _$PushModelRequestImpl(
      {required this.name, this.insecure = false, this.stream = false})
      : super._();

  factory _$PushModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushModelRequestImplFromJson(json);

  /// The name of the model to push in the form of <namespace>/<model>:<tag>.
  @override
  final String name;

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pushing to your library during development.
  @override
  @JsonKey()
  final bool insecure;

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  @override
  @JsonKey()
  final bool stream;

  @override
  String toString() {
    return 'PushModelRequest(name: $name, insecure: $insecure, stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushModelRequestImpl &&
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
  _$$PushModelRequestImplCopyWith<_$PushModelRequestImpl> get copyWith =>
      __$$PushModelRequestImplCopyWithImpl<_$PushModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushModelRequestImplToJson(
      this,
    );
  }
}

abstract class _PushModelRequest extends PushModelRequest {
  const factory _PushModelRequest(
      {required final String name,
      final bool insecure,
      final bool stream}) = _$PushModelRequestImpl;
  const _PushModelRequest._() : super._();

  factory _PushModelRequest.fromJson(Map<String, dynamic> json) =
      _$PushModelRequestImpl.fromJson;

  @override

  /// The name of the model to push in the form of <namespace>/<model>:<tag>.
  String get name;
  @override

  /// Allow insecure connections to the library.
  ///
  /// Only use this if you are pushing to your library during development.
  bool get insecure;
  @override

  /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
  bool get stream;
  @override
  @JsonKey(ignore: true)
  _$$PushModelRequestImplCopyWith<_$PushModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushModelResponse _$PushModelResponseFromJson(Map<String, dynamic> json) {
  return _PushModelResponse.fromJson(json);
}

/// @nodoc
mixin _$PushModelResponse {
  /// Status pushing the model.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PushModelStatus? get status => throw _privateConstructorUsedError;

  /// the model's digest
  @JsonKey(includeIfNull: false)
  String? get digest => throw _privateConstructorUsedError;

  /// total size of the model
  @JsonKey(includeIfNull: false)
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushModelResponseCopyWith<PushModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushModelResponseCopyWith<$Res> {
  factory $PushModelResponseCopyWith(
          PushModelResponse value, $Res Function(PushModelResponse) then) =
      _$PushModelResponseCopyWithImpl<$Res, PushModelResponse>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PushModelStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total});
}

/// @nodoc
class _$PushModelResponseCopyWithImpl<$Res, $Val extends PushModelResponse>
    implements $PushModelResponseCopyWith<$Res> {
  _$PushModelResponseCopyWithImpl(this._value, this._then);

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
              as PushModelStatus?,
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
abstract class _$$PushModelResponseImplCopyWith<$Res>
    implements $PushModelResponseCopyWith<$Res> {
  factory _$$PushModelResponseImplCopyWith(_$PushModelResponseImpl value,
          $Res Function(_$PushModelResponseImpl) then) =
      __$$PushModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      PushModelStatus? status,
      @JsonKey(includeIfNull: false) String? digest,
      @JsonKey(includeIfNull: false) int? total});
}

/// @nodoc
class __$$PushModelResponseImplCopyWithImpl<$Res>
    extends _$PushModelResponseCopyWithImpl<$Res, _$PushModelResponseImpl>
    implements _$$PushModelResponseImplCopyWith<$Res> {
  __$$PushModelResponseImplCopyWithImpl(_$PushModelResponseImpl _value,
      $Res Function(_$PushModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? digest = freezed,
    Object? total = freezed,
  }) {
    return _then(_$PushModelResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PushModelStatus?,
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
class _$PushModelResponseImpl extends _PushModelResponse {
  const _$PushModelResponseImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.status,
      @JsonKey(includeIfNull: false) this.digest,
      @JsonKey(includeIfNull: false) this.total})
      : super._();

  factory _$PushModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushModelResponseImplFromJson(json);

  /// Status pushing the model.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final PushModelStatus? status;

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
    return 'PushModelResponse(status: $status, digest: $digest, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushModelResponseImpl &&
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
  _$$PushModelResponseImplCopyWith<_$PushModelResponseImpl> get copyWith =>
      __$$PushModelResponseImplCopyWithImpl<_$PushModelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushModelResponseImplToJson(
      this,
    );
  }
}

abstract class _PushModelResponse extends PushModelResponse {
  const factory _PushModelResponse(
          {@JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final PushModelStatus? status,
          @JsonKey(includeIfNull: false) final String? digest,
          @JsonKey(includeIfNull: false) final int? total}) =
      _$PushModelResponseImpl;
  const _PushModelResponse._() : super._();

  factory _PushModelResponse.fromJson(Map<String, dynamic> json) =
      _$PushModelResponseImpl.fromJson;

  @override

  /// Status pushing the model.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  PushModelStatus? get status;
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
  _$$PushModelResponseImplCopyWith<_$PushModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
