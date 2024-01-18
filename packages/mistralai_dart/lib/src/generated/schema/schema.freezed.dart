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

ChatCompletionRequest _$ChatCompletionRequestFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionRequest {
  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @_ChatCompletionModelConverter()
  ChatCompletionModel get model => throw _privateConstructorUsedError;

  /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
  List<ChatCompletionMessage> get messages =>
      throw _privateConstructorUsedError;

  /// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
  ///
  /// We generally recommend altering this or `top_p` but not both.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
  ///
  /// We generally recommend altering this or `temperature` but not both.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
  @JsonKey(name: 'max_tokens', includeIfNull: false)
  int? get maxTokens => throw _privateConstructorUsedError;

  /// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  /// Whether to inject a safety prompt before all conversations.
  @JsonKey(name: 'safe_prompt', includeIfNull: false)
  bool? get safePrompt => throw _privateConstructorUsedError;

  /// The seed to use for random sampling. If set, different calls will generate deterministic results.
  @JsonKey(name: 'random_seed', includeIfNull: false)
  int? get randomSeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionRequestCopyWith<ChatCompletionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionRequestCopyWith<$Res> {
  factory $ChatCompletionRequestCopyWith(ChatCompletionRequest value,
          $Res Function(ChatCompletionRequest) then) =
      _$ChatCompletionRequestCopyWithImpl<$Res, ChatCompletionRequest>;
  @useResult
  $Res call(
      {@_ChatCompletionModelConverter() ChatCompletionModel model,
      List<ChatCompletionMessage> messages,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      @JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,
      @JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed});

  $ChatCompletionModelCopyWith<$Res> get model;
}

/// @nodoc
class _$ChatCompletionRequestCopyWithImpl<$Res,
        $Val extends ChatCompletionRequest>
    implements $ChatCompletionRequestCopyWith<$Res> {
  _$ChatCompletionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? maxTokens = freezed,
    Object? stream = freezed,
    Object? safePrompt = freezed,
    Object? randomSeed = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ChatCompletionModel,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionMessage>,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      maxTokens: freezed == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      safePrompt: freezed == safePrompt
          ? _value.safePrompt
          : safePrompt // ignore: cast_nullable_to_non_nullable
              as bool?,
      randomSeed: freezed == randomSeed
          ? _value.randomSeed
          : randomSeed // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCompletionModelCopyWith<$Res> get model {
    return $ChatCompletionModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCompletionRequestImplCopyWith<$Res>
    implements $ChatCompletionRequestCopyWith<$Res> {
  factory _$$ChatCompletionRequestImplCopyWith(
          _$ChatCompletionRequestImpl value,
          $Res Function(_$ChatCompletionRequestImpl) then) =
      __$$ChatCompletionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_ChatCompletionModelConverter() ChatCompletionModel model,
      List<ChatCompletionMessage> messages,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP,
      @JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(name: 'safe_prompt', includeIfNull: false) bool? safePrompt,
      @JsonKey(name: 'random_seed', includeIfNull: false) int? randomSeed});

  @override
  $ChatCompletionModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$ChatCompletionRequestImplCopyWithImpl<$Res>
    extends _$ChatCompletionRequestCopyWithImpl<$Res,
        _$ChatCompletionRequestImpl>
    implements _$$ChatCompletionRequestImplCopyWith<$Res> {
  __$$ChatCompletionRequestImplCopyWithImpl(_$ChatCompletionRequestImpl _value,
      $Res Function(_$ChatCompletionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? maxTokens = freezed,
    Object? stream = freezed,
    Object? safePrompt = freezed,
    Object? randomSeed = freezed,
  }) {
    return _then(_$ChatCompletionRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ChatCompletionModel,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionMessage>,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      maxTokens: freezed == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      safePrompt: freezed == safePrompt
          ? _value.safePrompt
          : safePrompt // ignore: cast_nullable_to_non_nullable
              as bool?,
      randomSeed: freezed == randomSeed
          ? _value.randomSeed
          : randomSeed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionRequestImpl extends _ChatCompletionRequest {
  const _$ChatCompletionRequestImpl(
      {@_ChatCompletionModelConverter() required this.model,
      required final List<ChatCompletionMessage> messages,
      @JsonKey(includeIfNull: false) this.temperature = 0.7,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP = 1.0,
      @JsonKey(name: 'max_tokens', includeIfNull: false) this.maxTokens,
      @JsonKey(includeIfNull: false) this.stream = false,
      @JsonKey(name: 'safe_prompt', includeIfNull: false)
      this.safePrompt = false,
      @JsonKey(name: 'random_seed', includeIfNull: false) this.randomSeed})
      : _messages = messages,
        super._();

  factory _$ChatCompletionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionRequestImplFromJson(json);

  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @override
  @_ChatCompletionModelConverter()
  final ChatCompletionModel model;

  /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
  final List<ChatCompletionMessage> _messages;

  /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
  @override
  List<ChatCompletionMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
  ///
  /// We generally recommend altering this or `top_p` but not both.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
  ///
  /// We generally recommend altering this or `temperature` but not both.
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  /// The maximum number of tokens to generate in the completion.
  ///
  /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
  @override
  @JsonKey(name: 'max_tokens', includeIfNull: false)
  final int? maxTokens;

  /// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  /// Whether to inject a safety prompt before all conversations.
  @override
  @JsonKey(name: 'safe_prompt', includeIfNull: false)
  final bool? safePrompt;

  /// The seed to use for random sampling. If set, different calls will generate deterministic results.
  @override
  @JsonKey(name: 'random_seed', includeIfNull: false)
  final int? randomSeed;

  @override
  String toString() {
    return 'ChatCompletionRequest(model: $model, messages: $messages, temperature: $temperature, topP: $topP, maxTokens: $maxTokens, stream: $stream, safePrompt: $safePrompt, randomSeed: $randomSeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.safePrompt, safePrompt) ||
                other.safePrompt == safePrompt) &&
            (identical(other.randomSeed, randomSeed) ||
                other.randomSeed == randomSeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(_messages),
      temperature,
      topP,
      maxTokens,
      stream,
      safePrompt,
      randomSeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionRequestImplCopyWith<_$ChatCompletionRequestImpl>
      get copyWith => __$$ChatCompletionRequestImplCopyWithImpl<
          _$ChatCompletionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionRequestImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionRequest extends ChatCompletionRequest {
  const factory _ChatCompletionRequest(
      {@_ChatCompletionModelConverter()
      required final ChatCompletionModel model,
      required final List<ChatCompletionMessage> messages,
      @JsonKey(includeIfNull: false) final double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) final double? topP,
      @JsonKey(name: 'max_tokens', includeIfNull: false) final int? maxTokens,
      @JsonKey(includeIfNull: false) final bool? stream,
      @JsonKey(name: 'safe_prompt', includeIfNull: false)
      final bool? safePrompt,
      @JsonKey(name: 'random_seed', includeIfNull: false)
      final int? randomSeed}) = _$ChatCompletionRequestImpl;
  const _ChatCompletionRequest._() : super._();

  factory _ChatCompletionRequest.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionRequestImpl.fromJson;

  @override

  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @_ChatCompletionModelConverter()
  ChatCompletionModel get model;
  @override

  /// The prompt(s) to generate completions for, encoded as a list of dict with role and content. The first prompt role should be `user` or `system`.
  List<ChatCompletionMessage> get messages;
  @override

  /// What sampling temperature to use, between 0.0 and 1.0. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
  ///
  /// We generally recommend altering this or `top_p` but not both.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// Nucleus sampling, where the model considers the results of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
  ///
  /// We generally recommend altering this or `temperature` but not both.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override

  /// The maximum number of tokens to generate in the completion.
  ///
  /// The token count of your prompt plus `max_tokens` cannot exceed the model's context length.
  @JsonKey(name: 'max_tokens', includeIfNull: false)
  int? get maxTokens;
  @override

  /// Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message. Otherwise, the server will hold the request open until the timeout or until completion, with the response containing the full result as JSON.
  @JsonKey(includeIfNull: false)
  bool? get stream;
  @override

  /// Whether to inject a safety prompt before all conversations.
  @JsonKey(name: 'safe_prompt', includeIfNull: false)
  bool? get safePrompt;
  @override

  /// The seed to use for random sampling. If set, different calls will generate deterministic results.
  @JsonKey(name: 'random_seed', includeIfNull: false)
  int? get randomSeed;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionRequestImplCopyWith<_$ChatCompletionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionModel _$ChatCompletionModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'model':
      return ChatCompletionModelEnumeration.fromJson(json);
    case 'modelId':
      return ChatCompletionModelString.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatCompletionModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatCompletionModel {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatCompletionModels value) model,
    required TResult Function(String value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModels value)? model,
    TResult? Function(String value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatCompletionModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatCompletionModelEnumeration value) model,
    required TResult Function(ChatCompletionModelString value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModelEnumeration value)? model,
    TResult? Function(ChatCompletionModelString value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatCompletionModelEnumeration value)? model,
    TResult Function(ChatCompletionModelString value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionModelCopyWith<$Res> {
  factory $ChatCompletionModelCopyWith(
          ChatCompletionModel value, $Res Function(ChatCompletionModel) then) =
      _$ChatCompletionModelCopyWithImpl<$Res, ChatCompletionModel>;
}

/// @nodoc
class _$ChatCompletionModelCopyWithImpl<$Res, $Val extends ChatCompletionModel>
    implements $ChatCompletionModelCopyWith<$Res> {
  _$ChatCompletionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatCompletionModelEnumerationImplCopyWith<$Res> {
  factory _$$ChatCompletionModelEnumerationImplCopyWith(
          _$ChatCompletionModelEnumerationImpl value,
          $Res Function(_$ChatCompletionModelEnumerationImpl) then) =
      __$$ChatCompletionModelEnumerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatCompletionModels value});
}

/// @nodoc
class __$$ChatCompletionModelEnumerationImplCopyWithImpl<$Res>
    extends _$ChatCompletionModelCopyWithImpl<$Res,
        _$ChatCompletionModelEnumerationImpl>
    implements _$$ChatCompletionModelEnumerationImplCopyWith<$Res> {
  __$$ChatCompletionModelEnumerationImplCopyWithImpl(
      _$ChatCompletionModelEnumerationImpl _value,
      $Res Function(_$ChatCompletionModelEnumerationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ChatCompletionModelEnumerationImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ChatCompletionModels,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionModelEnumerationImpl
    extends ChatCompletionModelEnumeration {
  const _$ChatCompletionModelEnumerationImpl(this.value, {final String? $type})
      : $type = $type ?? 'model',
        super._();

  factory _$ChatCompletionModelEnumerationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatCompletionModelEnumerationImplFromJson(json);

  @override
  final ChatCompletionModels value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatCompletionModel.model(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionModelEnumerationImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionModelEnumerationImplCopyWith<
          _$ChatCompletionModelEnumerationImpl>
      get copyWith => __$$ChatCompletionModelEnumerationImplCopyWithImpl<
          _$ChatCompletionModelEnumerationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatCompletionModels value) model,
    required TResult Function(String value) modelId,
  }) {
    return model(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModels value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return model?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatCompletionModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatCompletionModelEnumeration value) model,
    required TResult Function(ChatCompletionModelString value) modelId,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModelEnumeration value)? model,
    TResult? Function(ChatCompletionModelString value)? modelId,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatCompletionModelEnumeration value)? model,
    TResult Function(ChatCompletionModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionModelEnumerationImplToJson(
      this,
    );
  }
}

abstract class ChatCompletionModelEnumeration extends ChatCompletionModel {
  const factory ChatCompletionModelEnumeration(
      final ChatCompletionModels value) = _$ChatCompletionModelEnumerationImpl;
  const ChatCompletionModelEnumeration._() : super._();

  factory ChatCompletionModelEnumeration.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionModelEnumerationImpl.fromJson;

  @override
  ChatCompletionModels get value;
  @JsonKey(ignore: true)
  _$$ChatCompletionModelEnumerationImplCopyWith<
          _$ChatCompletionModelEnumerationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatCompletionModelStringImplCopyWith<$Res> {
  factory _$$ChatCompletionModelStringImplCopyWith(
          _$ChatCompletionModelStringImpl value,
          $Res Function(_$ChatCompletionModelStringImpl) then) =
      __$$ChatCompletionModelStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ChatCompletionModelStringImplCopyWithImpl<$Res>
    extends _$ChatCompletionModelCopyWithImpl<$Res,
        _$ChatCompletionModelStringImpl>
    implements _$$ChatCompletionModelStringImplCopyWith<$Res> {
  __$$ChatCompletionModelStringImplCopyWithImpl(
      _$ChatCompletionModelStringImpl _value,
      $Res Function(_$ChatCompletionModelStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ChatCompletionModelStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionModelStringImpl extends ChatCompletionModelString {
  const _$ChatCompletionModelStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'modelId',
        super._();

  factory _$ChatCompletionModelStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionModelStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatCompletionModel.modelId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionModelStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionModelStringImplCopyWith<_$ChatCompletionModelStringImpl>
      get copyWith => __$$ChatCompletionModelStringImplCopyWithImpl<
          _$ChatCompletionModelStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatCompletionModels value) model,
    required TResult Function(String value) modelId,
  }) {
    return modelId(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModels value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return modelId?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatCompletionModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatCompletionModelEnumeration value) model,
    required TResult Function(ChatCompletionModelString value) modelId,
  }) {
    return modelId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatCompletionModelEnumeration value)? model,
    TResult? Function(ChatCompletionModelString value)? modelId,
  }) {
    return modelId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatCompletionModelEnumeration value)? model,
    TResult Function(ChatCompletionModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionModelStringImplToJson(
      this,
    );
  }
}

abstract class ChatCompletionModelString extends ChatCompletionModel {
  const factory ChatCompletionModelString(final String value) =
      _$ChatCompletionModelStringImpl;
  const ChatCompletionModelString._() : super._();

  factory ChatCompletionModelString.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionModelStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$ChatCompletionModelStringImplCopyWith<_$ChatCompletionModelStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionResponse _$ChatCompletionResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionResponse {
  /// The unique identifier for this completion.
  String get id => throw _privateConstructorUsedError;

  /// The object type, which is always `chat.completion`.
  String get object => throw _privateConstructorUsedError;

  /// The timestamp of when this completion was created.
  int get created => throw _privateConstructorUsedError;

  /// The model used for this completion.
  String get model => throw _privateConstructorUsedError;

  /// The list of choices for this completion.
  List<ChatCompletionResponseChoicesInner> get choices =>
      throw _privateConstructorUsedError;

  /// The usage statistics for this completion.
  ChatCompletionUsage get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionResponseCopyWith<ChatCompletionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionResponseCopyWith<$Res> {
  factory $ChatCompletionResponseCopyWith(ChatCompletionResponse value,
          $Res Function(ChatCompletionResponse) then) =
      _$ChatCompletionResponseCopyWithImpl<$Res, ChatCompletionResponse>;
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<ChatCompletionResponseChoicesInner> choices,
      ChatCompletionUsage usage});

  $ChatCompletionUsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$ChatCompletionResponseCopyWithImpl<$Res,
        $Val extends ChatCompletionResponse>
    implements $ChatCompletionResponseCopyWith<$Res> {
  _$ChatCompletionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionResponseChoicesInner>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ChatCompletionUsage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCompletionUsageCopyWith<$Res> get usage {
    return $ChatCompletionUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCompletionResponseImplCopyWith<$Res>
    implements $ChatCompletionResponseCopyWith<$Res> {
  factory _$$ChatCompletionResponseImplCopyWith(
          _$ChatCompletionResponseImpl value,
          $Res Function(_$ChatCompletionResponseImpl) then) =
      __$$ChatCompletionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<ChatCompletionResponseChoicesInner> choices,
      ChatCompletionUsage usage});

  @override
  $ChatCompletionUsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$ChatCompletionResponseImplCopyWithImpl<$Res>
    extends _$ChatCompletionResponseCopyWithImpl<$Res,
        _$ChatCompletionResponseImpl>
    implements _$$ChatCompletionResponseImplCopyWith<$Res> {
  __$$ChatCompletionResponseImplCopyWithImpl(
      _$ChatCompletionResponseImpl _value,
      $Res Function(_$ChatCompletionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_$ChatCompletionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionResponseChoicesInner>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ChatCompletionUsage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionResponseImpl extends _ChatCompletionResponse {
  const _$ChatCompletionResponseImpl(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required final List<ChatCompletionResponseChoicesInner> choices,
      required this.usage})
      : _choices = choices,
        super._();

  factory _$ChatCompletionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionResponseImplFromJson(json);

  /// The unique identifier for this completion.
  @override
  final String id;

  /// The object type, which is always `chat.completion`.
  @override
  final String object;

  /// The timestamp of when this completion was created.
  @override
  final int created;

  /// The model used for this completion.
  @override
  final String model;

  /// The list of choices for this completion.
  final List<ChatCompletionResponseChoicesInner> _choices;

  /// The list of choices for this completion.
  @override
  List<ChatCompletionResponseChoicesInner> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  /// The usage statistics for this completion.
  @override
  final ChatCompletionUsage usage;

  @override
  String toString() {
    return 'ChatCompletionResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      const DeepCollectionEquality().hash(_choices), usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionResponseImplCopyWith<_$ChatCompletionResponseImpl>
      get copyWith => __$$ChatCompletionResponseImplCopyWithImpl<
          _$ChatCompletionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionResponse extends ChatCompletionResponse {
  const factory _ChatCompletionResponse(
      {required final String id,
      required final String object,
      required final int created,
      required final String model,
      required final List<ChatCompletionResponseChoicesInner> choices,
      required final ChatCompletionUsage usage}) = _$ChatCompletionResponseImpl;
  const _ChatCompletionResponse._() : super._();

  factory _ChatCompletionResponse.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionResponseImpl.fromJson;

  @override

  /// The unique identifier for this completion.
  String get id;
  @override

  /// The object type, which is always `chat.completion`.
  String get object;
  @override

  /// The timestamp of when this completion was created.
  int get created;
  @override

  /// The model used for this completion.
  String get model;
  @override

  /// The list of choices for this completion.
  List<ChatCompletionResponseChoicesInner> get choices;
  @override

  /// The usage statistics for this completion.
  ChatCompletionUsage get usage;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionResponseImplCopyWith<_$ChatCompletionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionResponseChoicesInner _$ChatCompletionResponseChoicesInnerFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionResponseChoicesInner.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionResponseChoicesInner {
  /// The index of this choice.
  int get index => throw _privateConstructorUsedError;

  /// A message in a chat conversation.
  @JsonKey(includeIfNull: false)
  ChatCompletionMessage? get message => throw _privateConstructorUsedError;

  /// The reason the model stopped generating tokens.
  @JsonKey(name: 'finish_reason')
  ChatCompletionFinishReason get finishReason =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionResponseChoicesInnerCopyWith<
          ChatCompletionResponseChoicesInner>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  factory $ChatCompletionResponseChoicesInnerCopyWith(
          ChatCompletionResponseChoicesInner value,
          $Res Function(ChatCompletionResponseChoicesInner) then) =
      _$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res,
          ChatCompletionResponseChoicesInner>;
  @useResult
  $Res call(
      {int index,
      @JsonKey(includeIfNull: false) ChatCompletionMessage? message,
      @JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason});

  $ChatCompletionMessageCopyWith<$Res>? get message;
}

/// @nodoc
class _$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res,
        $Val extends ChatCompletionResponseChoicesInner>
    implements $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  _$ChatCompletionResponseChoicesInnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? message = freezed,
    Object? finishReason = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessage?,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as ChatCompletionFinishReason,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCompletionMessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $ChatCompletionMessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCompletionResponseChoicesInnerImplCopyWith<$Res>
    implements $ChatCompletionResponseChoicesInnerCopyWith<$Res> {
  factory _$$ChatCompletionResponseChoicesInnerImplCopyWith(
          _$ChatCompletionResponseChoicesInnerImpl value,
          $Res Function(_$ChatCompletionResponseChoicesInnerImpl) then) =
      __$$ChatCompletionResponseChoicesInnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      @JsonKey(includeIfNull: false) ChatCompletionMessage? message,
      @JsonKey(name: 'finish_reason') ChatCompletionFinishReason finishReason});

  @override
  $ChatCompletionMessageCopyWith<$Res>? get message;
}

/// @nodoc
class __$$ChatCompletionResponseChoicesInnerImplCopyWithImpl<$Res>
    extends _$ChatCompletionResponseChoicesInnerCopyWithImpl<$Res,
        _$ChatCompletionResponseChoicesInnerImpl>
    implements _$$ChatCompletionResponseChoicesInnerImplCopyWith<$Res> {
  __$$ChatCompletionResponseChoicesInnerImplCopyWithImpl(
      _$ChatCompletionResponseChoicesInnerImpl _value,
      $Res Function(_$ChatCompletionResponseChoicesInnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? message = freezed,
    Object? finishReason = null,
  }) {
    return _then(_$ChatCompletionResponseChoicesInnerImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessage?,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as ChatCompletionFinishReason,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionResponseChoicesInnerImpl
    extends _ChatCompletionResponseChoicesInner {
  const _$ChatCompletionResponseChoicesInnerImpl(
      {required this.index,
      @JsonKey(includeIfNull: false) this.message,
      @JsonKey(name: 'finish_reason') required this.finishReason})
      : super._();

  factory _$ChatCompletionResponseChoicesInnerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatCompletionResponseChoicesInnerImplFromJson(json);

  /// The index of this choice.
  @override
  final int index;

  /// A message in a chat conversation.
  @override
  @JsonKey(includeIfNull: false)
  final ChatCompletionMessage? message;

  /// The reason the model stopped generating tokens.
  @override
  @JsonKey(name: 'finish_reason')
  final ChatCompletionFinishReason finishReason;

  @override
  String toString() {
    return 'ChatCompletionResponseChoicesInner(index: $index, message: $message, finishReason: $finishReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionResponseChoicesInnerImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, message, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionResponseChoicesInnerImplCopyWith<
          _$ChatCompletionResponseChoicesInnerImpl>
      get copyWith => __$$ChatCompletionResponseChoicesInnerImplCopyWithImpl<
          _$ChatCompletionResponseChoicesInnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionResponseChoicesInnerImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionResponseChoicesInner
    extends ChatCompletionResponseChoicesInner {
  const factory _ChatCompletionResponseChoicesInner(
          {required final int index,
          @JsonKey(includeIfNull: false) final ChatCompletionMessage? message,
          @JsonKey(name: 'finish_reason')
          required final ChatCompletionFinishReason finishReason}) =
      _$ChatCompletionResponseChoicesInnerImpl;
  const _ChatCompletionResponseChoicesInner._() : super._();

  factory _ChatCompletionResponseChoicesInner.fromJson(
          Map<String, dynamic> json) =
      _$ChatCompletionResponseChoicesInnerImpl.fromJson;

  @override

  /// The index of this choice.
  int get index;
  @override

  /// A message in a chat conversation.
  @JsonKey(includeIfNull: false)
  ChatCompletionMessage? get message;
  @override

  /// The reason the model stopped generating tokens.
  @JsonKey(name: 'finish_reason')
  ChatCompletionFinishReason get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionResponseChoicesInnerImplCopyWith<
          _$ChatCompletionResponseChoicesInnerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionMessage _$ChatCompletionMessageFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionMessage {
  /// The role of the message.
  ChatCompletionMessageRole get role => throw _privateConstructorUsedError;

  /// The message content.
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionMessageCopyWith<ChatCompletionMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionMessageCopyWith<$Res> {
  factory $ChatCompletionMessageCopyWith(ChatCompletionMessage value,
          $Res Function(ChatCompletionMessage) then) =
      _$ChatCompletionMessageCopyWithImpl<$Res, ChatCompletionMessage>;
  @useResult
  $Res call({ChatCompletionMessageRole role, String content});
}

/// @nodoc
class _$ChatCompletionMessageCopyWithImpl<$Res,
        $Val extends ChatCompletionMessage>
    implements $ChatCompletionMessageCopyWith<$Res> {
  _$ChatCompletionMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCompletionMessageImplCopyWith<$Res>
    implements $ChatCompletionMessageCopyWith<$Res> {
  factory _$$ChatCompletionMessageImplCopyWith(
          _$ChatCompletionMessageImpl value,
          $Res Function(_$ChatCompletionMessageImpl) then) =
      __$$ChatCompletionMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatCompletionMessageRole role, String content});
}

/// @nodoc
class __$$ChatCompletionMessageImplCopyWithImpl<$Res>
    extends _$ChatCompletionMessageCopyWithImpl<$Res,
        _$ChatCompletionMessageImpl>
    implements _$$ChatCompletionMessageImplCopyWith<$Res> {
  __$$ChatCompletionMessageImplCopyWithImpl(_$ChatCompletionMessageImpl _value,
      $Res Function(_$ChatCompletionMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$ChatCompletionMessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionMessageImpl extends _ChatCompletionMessage {
  const _$ChatCompletionMessageImpl({required this.role, required this.content})
      : super._();

  factory _$ChatCompletionMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionMessageImplFromJson(json);

  /// The role of the message.
  @override
  final ChatCompletionMessageRole role;

  /// The message content.
  @override
  final String content;

  @override
  String toString() {
    return 'ChatCompletionMessage(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionMessageImplCopyWith<_$ChatCompletionMessageImpl>
      get copyWith => __$$ChatCompletionMessageImplCopyWithImpl<
          _$ChatCompletionMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionMessage extends ChatCompletionMessage {
  const factory _ChatCompletionMessage(
      {required final ChatCompletionMessageRole role,
      required final String content}) = _$ChatCompletionMessageImpl;
  const _ChatCompletionMessage._() : super._();

  factory _ChatCompletionMessage.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionMessageImpl.fromJson;

  @override

  /// The role of the message.
  ChatCompletionMessageRole get role;
  @override

  /// The message content.
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionMessageImplCopyWith<_$ChatCompletionMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionUsage _$ChatCompletionUsageFromJson(Map<String, dynamic> json) {
  return _ChatCompletionUsage.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionUsage {
  /// The number of tokens in the prompt.
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens => throw _privateConstructorUsedError;

  /// The number of tokens in the completion.
  @JsonKey(name: 'completion_tokens')
  int get completionTokens => throw _privateConstructorUsedError;

  /// The total number of tokens generated.
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionUsageCopyWith<ChatCompletionUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionUsageCopyWith<$Res> {
  factory $ChatCompletionUsageCopyWith(
          ChatCompletionUsage value, $Res Function(ChatCompletionUsage) then) =
      _$ChatCompletionUsageCopyWithImpl<$Res, ChatCompletionUsage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class _$ChatCompletionUsageCopyWithImpl<$Res, $Val extends ChatCompletionUsage>
    implements $ChatCompletionUsageCopyWith<$Res> {
  _$ChatCompletionUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCompletionUsageImplCopyWith<$Res>
    implements $ChatCompletionUsageCopyWith<$Res> {
  factory _$$ChatCompletionUsageImplCopyWith(_$ChatCompletionUsageImpl value,
          $Res Function(_$ChatCompletionUsageImpl) then) =
      __$$ChatCompletionUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class __$$ChatCompletionUsageImplCopyWithImpl<$Res>
    extends _$ChatCompletionUsageCopyWithImpl<$Res, _$ChatCompletionUsageImpl>
    implements _$$ChatCompletionUsageImplCopyWith<$Res> {
  __$$ChatCompletionUsageImplCopyWithImpl(_$ChatCompletionUsageImpl _value,
      $Res Function(_$ChatCompletionUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$ChatCompletionUsageImpl(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionUsageImpl extends _ChatCompletionUsage {
  const _$ChatCompletionUsageImpl(
      {@JsonKey(name: 'prompt_tokens') required this.promptTokens,
      @JsonKey(name: 'completion_tokens') required this.completionTokens,
      @JsonKey(name: 'total_tokens') required this.totalTokens})
      : super._();

  factory _$ChatCompletionUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionUsageImplFromJson(json);

  /// The number of tokens in the prompt.
  @override
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;

  /// The number of tokens in the completion.
  @override
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;

  /// The total number of tokens generated.
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  @override
  String toString() {
    return 'ChatCompletionUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionUsageImpl &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionUsageImplCopyWith<_$ChatCompletionUsageImpl> get copyWith =>
      __$$ChatCompletionUsageImplCopyWithImpl<_$ChatCompletionUsageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionUsageImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionUsage extends ChatCompletionUsage {
  const factory _ChatCompletionUsage(
      {@JsonKey(name: 'prompt_tokens') required final int promptTokens,
      @JsonKey(name: 'completion_tokens') required final int completionTokens,
      @JsonKey(name: 'total_tokens')
      required final int totalTokens}) = _$ChatCompletionUsageImpl;
  const _ChatCompletionUsage._() : super._();

  factory _ChatCompletionUsage.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionUsageImpl.fromJson;

  @override

  /// The number of tokens in the prompt.
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens;
  @override

  /// The number of tokens in the completion.
  @JsonKey(name: 'completion_tokens')
  int get completionTokens;
  @override

  /// The total number of tokens generated.
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionUsageImplCopyWith<_$ChatCompletionUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatCompletionStreamResponse _$ChatCompletionStreamResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionStreamResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionStreamResponse {
  /// The unique identifier for this completion.
  String get id => throw _privateConstructorUsedError;

  /// The object type, which is always `chat.completion.chunk`.
  @JsonKey(includeIfNull: false)
  String? get object => throw _privateConstructorUsedError;

  /// The timestamp of when this completion was created.
  @JsonKey(includeIfNull: false)
  int? get created => throw _privateConstructorUsedError;

  /// The model used for this completion.
  String get model => throw _privateConstructorUsedError;

  /// The list of choices for this completion.
  List<ChatCompletionStreamResponseChoicesInner> get choices =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionStreamResponseCopyWith<ChatCompletionStreamResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionStreamResponseCopyWith<$Res> {
  factory $ChatCompletionStreamResponseCopyWith(
          ChatCompletionStreamResponse value,
          $Res Function(ChatCompletionStreamResponse) then) =
      _$ChatCompletionStreamResponseCopyWithImpl<$Res,
          ChatCompletionStreamResponse>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(includeIfNull: false) String? object,
      @JsonKey(includeIfNull: false) int? created,
      String model,
      List<ChatCompletionStreamResponseChoicesInner> choices});
}

/// @nodoc
class _$ChatCompletionStreamResponseCopyWithImpl<$Res,
        $Val extends ChatCompletionStreamResponse>
    implements $ChatCompletionStreamResponseCopyWith<$Res> {
  _$ChatCompletionStreamResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? created = freezed,
    Object? model = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionStreamResponseChoicesInner>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCompletionStreamResponseImplCopyWith<$Res>
    implements $ChatCompletionStreamResponseCopyWith<$Res> {
  factory _$$ChatCompletionStreamResponseImplCopyWith(
          _$ChatCompletionStreamResponseImpl value,
          $Res Function(_$ChatCompletionStreamResponseImpl) then) =
      __$$ChatCompletionStreamResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(includeIfNull: false) String? object,
      @JsonKey(includeIfNull: false) int? created,
      String model,
      List<ChatCompletionStreamResponseChoicesInner> choices});
}

/// @nodoc
class __$$ChatCompletionStreamResponseImplCopyWithImpl<$Res>
    extends _$ChatCompletionStreamResponseCopyWithImpl<$Res,
        _$ChatCompletionStreamResponseImpl>
    implements _$$ChatCompletionStreamResponseImplCopyWith<$Res> {
  __$$ChatCompletionStreamResponseImplCopyWithImpl(
      _$ChatCompletionStreamResponseImpl _value,
      $Res Function(_$ChatCompletionStreamResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? created = freezed,
    Object? model = null,
    Object? choices = null,
  }) {
    return _then(_$ChatCompletionStreamResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatCompletionStreamResponseChoicesInner>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionStreamResponseImpl extends _ChatCompletionStreamResponse {
  const _$ChatCompletionStreamResponseImpl(
      {required this.id,
      @JsonKey(includeIfNull: false) this.object,
      @JsonKey(includeIfNull: false) this.created,
      required this.model,
      required final List<ChatCompletionStreamResponseChoicesInner> choices})
      : _choices = choices,
        super._();

  factory _$ChatCompletionStreamResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatCompletionStreamResponseImplFromJson(json);

  /// The unique identifier for this completion.
  @override
  final String id;

  /// The object type, which is always `chat.completion.chunk`.
  @override
  @JsonKey(includeIfNull: false)
  final String? object;

  /// The timestamp of when this completion was created.
  @override
  @JsonKey(includeIfNull: false)
  final int? created;

  /// The model used for this completion.
  @override
  final String model;

  /// The list of choices for this completion.
  final List<ChatCompletionStreamResponseChoicesInner> _choices;

  /// The list of choices for this completion.
  @override
  List<ChatCompletionStreamResponseChoicesInner> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'ChatCompletionStreamResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionStreamResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionStreamResponseImplCopyWith<
          _$ChatCompletionStreamResponseImpl>
      get copyWith => __$$ChatCompletionStreamResponseImplCopyWithImpl<
          _$ChatCompletionStreamResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionStreamResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionStreamResponse
    extends ChatCompletionStreamResponse {
  const factory _ChatCompletionStreamResponse(
      {required final String id,
      @JsonKey(includeIfNull: false) final String? object,
      @JsonKey(includeIfNull: false) final int? created,
      required final String model,
      required final List<ChatCompletionStreamResponseChoicesInner>
          choices}) = _$ChatCompletionStreamResponseImpl;
  const _ChatCompletionStreamResponse._() : super._();

  factory _ChatCompletionStreamResponse.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionStreamResponseImpl.fromJson;

  @override

  /// The unique identifier for this completion.
  String get id;
  @override

  /// The object type, which is always `chat.completion.chunk`.
  @JsonKey(includeIfNull: false)
  String? get object;
  @override

  /// The timestamp of when this completion was created.
  @JsonKey(includeIfNull: false)
  int? get created;
  @override

  /// The model used for this completion.
  String get model;
  @override

  /// The list of choices for this completion.
  List<ChatCompletionStreamResponseChoicesInner> get choices;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionStreamResponseImplCopyWith<
          _$ChatCompletionStreamResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionStreamResponseChoicesInner
    _$ChatCompletionStreamResponseChoicesInnerFromJson(
        Map<String, dynamic> json) {
  return _ChatCompletionStreamResponseChoicesInner.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionStreamResponseChoicesInner {
  /// The index of this choice.
  int get index => throw _privateConstructorUsedError;

  /// A chat completion delta generated by streamed model responses.
  ChatCompletionStreamDelta get delta => throw _privateConstructorUsedError;

  /// The reason the model stopped generating tokens.
  @JsonKey(
      name: 'finish_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ChatCompletionFinishReason? get finishReason =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionStreamResponseChoicesInnerCopyWith<
          ChatCompletionStreamResponseChoicesInner>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  factory $ChatCompletionStreamResponseChoicesInnerCopyWith(
          ChatCompletionStreamResponseChoicesInner value,
          $Res Function(ChatCompletionStreamResponseChoicesInner) then) =
      _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<$Res,
          ChatCompletionStreamResponseChoicesInner>;
  @useResult
  $Res call(
      {int index,
      ChatCompletionStreamDelta delta,
      @JsonKey(
          name: 'finish_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ChatCompletionFinishReason? finishReason});

  $ChatCompletionStreamDeltaCopyWith<$Res> get delta;
}

/// @nodoc
class _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<$Res,
        $Val extends ChatCompletionStreamResponseChoicesInner>
    implements $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? delta = null,
    Object? finishReason = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as ChatCompletionStreamDelta,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as ChatCompletionFinishReason?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCompletionStreamDeltaCopyWith<$Res> get delta {
    return $ChatCompletionStreamDeltaCopyWith<$Res>(_value.delta, (value) {
      return _then(_value.copyWith(delta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatCompletionStreamResponseChoicesInnerImplCopyWith<$Res>
    implements $ChatCompletionStreamResponseChoicesInnerCopyWith<$Res> {
  factory _$$ChatCompletionStreamResponseChoicesInnerImplCopyWith(
          _$ChatCompletionStreamResponseChoicesInnerImpl value,
          $Res Function(_$ChatCompletionStreamResponseChoicesInnerImpl) then) =
      __$$ChatCompletionStreamResponseChoicesInnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      ChatCompletionStreamDelta delta,
      @JsonKey(
          name: 'finish_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ChatCompletionFinishReason? finishReason});

  @override
  $ChatCompletionStreamDeltaCopyWith<$Res> get delta;
}

/// @nodoc
class __$$ChatCompletionStreamResponseChoicesInnerImplCopyWithImpl<$Res>
    extends _$ChatCompletionStreamResponseChoicesInnerCopyWithImpl<$Res,
        _$ChatCompletionStreamResponseChoicesInnerImpl>
    implements _$$ChatCompletionStreamResponseChoicesInnerImplCopyWith<$Res> {
  __$$ChatCompletionStreamResponseChoicesInnerImplCopyWithImpl(
      _$ChatCompletionStreamResponseChoicesInnerImpl _value,
      $Res Function(_$ChatCompletionStreamResponseChoicesInnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? delta = null,
    Object? finishReason = freezed,
  }) {
    return _then(_$ChatCompletionStreamResponseChoicesInnerImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as ChatCompletionStreamDelta,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as ChatCompletionFinishReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionStreamResponseChoicesInnerImpl
    extends _ChatCompletionStreamResponseChoicesInner {
  const _$ChatCompletionStreamResponseChoicesInnerImpl(
      {required this.index,
      required this.delta,
      @JsonKey(
          name: 'finish_reason',
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.finishReason})
      : super._();

  factory _$ChatCompletionStreamResponseChoicesInnerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatCompletionStreamResponseChoicesInnerImplFromJson(json);

  /// The index of this choice.
  @override
  final int index;

  /// A chat completion delta generated by streamed model responses.
  @override
  final ChatCompletionStreamDelta delta;

  /// The reason the model stopped generating tokens.
  @override
  @JsonKey(
      name: 'finish_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ChatCompletionFinishReason? finishReason;

  @override
  String toString() {
    return 'ChatCompletionStreamResponseChoicesInner(index: $index, delta: $delta, finishReason: $finishReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionStreamResponseChoicesInnerImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, delta, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionStreamResponseChoicesInnerImplCopyWith<
          _$ChatCompletionStreamResponseChoicesInnerImpl>
      get copyWith =>
          __$$ChatCompletionStreamResponseChoicesInnerImplCopyWithImpl<
              _$ChatCompletionStreamResponseChoicesInnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionStreamResponseChoicesInnerImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionStreamResponseChoicesInner
    extends ChatCompletionStreamResponseChoicesInner {
  const factory _ChatCompletionStreamResponseChoicesInner(
          {required final int index,
          required final ChatCompletionStreamDelta delta,
          @JsonKey(
              name: 'finish_reason',
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final ChatCompletionFinishReason? finishReason}) =
      _$ChatCompletionStreamResponseChoicesInnerImpl;
  const _ChatCompletionStreamResponseChoicesInner._() : super._();

  factory _ChatCompletionStreamResponseChoicesInner.fromJson(
          Map<String, dynamic> json) =
      _$ChatCompletionStreamResponseChoicesInnerImpl.fromJson;

  @override

  /// The index of this choice.
  int get index;
  @override

  /// A chat completion delta generated by streamed model responses.
  ChatCompletionStreamDelta get delta;
  @override

  /// The reason the model stopped generating tokens.
  @JsonKey(
      name: 'finish_reason',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ChatCompletionFinishReason? get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionStreamResponseChoicesInnerImplCopyWith<
          _$ChatCompletionStreamResponseChoicesInnerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatCompletionStreamDelta _$ChatCompletionStreamDeltaFromJson(
    Map<String, dynamic> json) {
  return _ChatCompletionStreamDelta.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionStreamDelta {
  /// The role of the message.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ChatCompletionMessageRole? get role => throw _privateConstructorUsedError;

  /// The message content.
  @JsonKey(includeIfNull: false)
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionStreamDeltaCopyWith<ChatCompletionStreamDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionStreamDeltaCopyWith<$Res> {
  factory $ChatCompletionStreamDeltaCopyWith(ChatCompletionStreamDelta value,
          $Res Function(ChatCompletionStreamDelta) then) =
      _$ChatCompletionStreamDeltaCopyWithImpl<$Res, ChatCompletionStreamDelta>;
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ChatCompletionMessageRole? role,
      @JsonKey(includeIfNull: false) String? content});
}

/// @nodoc
class _$ChatCompletionStreamDeltaCopyWithImpl<$Res,
        $Val extends ChatCompletionStreamDelta>
    implements $ChatCompletionStreamDeltaCopyWith<$Res> {
  _$ChatCompletionStreamDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessageRole?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCompletionStreamDeltaImplCopyWith<$Res>
    implements $ChatCompletionStreamDeltaCopyWith<$Res> {
  factory _$$ChatCompletionStreamDeltaImplCopyWith(
          _$ChatCompletionStreamDeltaImpl value,
          $Res Function(_$ChatCompletionStreamDeltaImpl) then) =
      __$$ChatCompletionStreamDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      ChatCompletionMessageRole? role,
      @JsonKey(includeIfNull: false) String? content});
}

/// @nodoc
class __$$ChatCompletionStreamDeltaImplCopyWithImpl<$Res>
    extends _$ChatCompletionStreamDeltaCopyWithImpl<$Res,
        _$ChatCompletionStreamDeltaImpl>
    implements _$$ChatCompletionStreamDeltaImplCopyWith<$Res> {
  __$$ChatCompletionStreamDeltaImplCopyWithImpl(
      _$ChatCompletionStreamDeltaImpl _value,
      $Res Function(_$ChatCompletionStreamDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_$ChatCompletionStreamDeltaImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ChatCompletionMessageRole?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionStreamDeltaImpl extends _ChatCompletionStreamDelta {
  const _$ChatCompletionStreamDeltaImpl(
      {@JsonKey(
          includeIfNull: false,
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      this.role,
      @JsonKey(includeIfNull: false) this.content})
      : super._();

  factory _$ChatCompletionStreamDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionStreamDeltaImplFromJson(json);

  /// The role of the message.
  @override
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final ChatCompletionMessageRole? role;

  /// The message content.
  @override
  @JsonKey(includeIfNull: false)
  final String? content;

  @override
  String toString() {
    return 'ChatCompletionStreamDelta(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionStreamDeltaImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionStreamDeltaImplCopyWith<_$ChatCompletionStreamDeltaImpl>
      get copyWith => __$$ChatCompletionStreamDeltaImplCopyWithImpl<
          _$ChatCompletionStreamDeltaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionStreamDeltaImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionStreamDelta extends ChatCompletionStreamDelta {
  const factory _ChatCompletionStreamDelta(
          {@JsonKey(
              includeIfNull: false,
              unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
          final ChatCompletionMessageRole? role,
          @JsonKey(includeIfNull: false) final String? content}) =
      _$ChatCompletionStreamDeltaImpl;
  const _ChatCompletionStreamDelta._() : super._();

  factory _ChatCompletionStreamDelta.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionStreamDeltaImpl.fromJson;

  @override

  /// The role of the message.
  @JsonKey(
      includeIfNull: false, unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  ChatCompletionMessageRole? get role;
  @override

  /// The message content.
  @JsonKey(includeIfNull: false)
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionStreamDeltaImplCopyWith<_$ChatCompletionStreamDeltaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmbeddingRequest _$EmbeddingRequestFromJson(Map<String, dynamic> json) {
  return _EmbeddingRequest.fromJson(json);
}

/// @nodoc
mixin _$EmbeddingRequest {
  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @_EmbeddingModelConverter()
  EmbeddingModel get model => throw _privateConstructorUsedError;

  /// The list of strings to embed.
  List<String> get input => throw _privateConstructorUsedError;

  /// The format of the output data.
  @JsonKey(name: 'encoding_format')
  EmbeddingEncodingFormat get encodingFormat =>
      throw _privateConstructorUsedError;

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
      {@_EmbeddingModelConverter() EmbeddingModel model,
      List<String> input,
      @JsonKey(name: 'encoding_format')
      EmbeddingEncodingFormat encodingFormat});

  $EmbeddingModelCopyWith<$Res> get model;
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
    Object? input = null,
    Object? encodingFormat = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as EmbeddingModel,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as List<String>,
      encodingFormat: null == encodingFormat
          ? _value.encodingFormat
          : encodingFormat // ignore: cast_nullable_to_non_nullable
              as EmbeddingEncodingFormat,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmbeddingModelCopyWith<$Res> get model {
    return $EmbeddingModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
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
      {@_EmbeddingModelConverter() EmbeddingModel model,
      List<String> input,
      @JsonKey(name: 'encoding_format')
      EmbeddingEncodingFormat encodingFormat});

  @override
  $EmbeddingModelCopyWith<$Res> get model;
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
    Object? input = null,
    Object? encodingFormat = null,
  }) {
    return _then(_$EmbeddingRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as EmbeddingModel,
      input: null == input
          ? _value._input
          : input // ignore: cast_nullable_to_non_nullable
              as List<String>,
      encodingFormat: null == encodingFormat
          ? _value.encodingFormat
          : encodingFormat // ignore: cast_nullable_to_non_nullable
              as EmbeddingEncodingFormat,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingRequestImpl extends _EmbeddingRequest {
  const _$EmbeddingRequestImpl(
      {@_EmbeddingModelConverter() required this.model,
      required final List<String> input,
      @JsonKey(name: 'encoding_format')
      this.encodingFormat = EmbeddingEncodingFormat.float})
      : _input = input,
        super._();

  factory _$EmbeddingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingRequestImplFromJson(json);

  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @override
  @_EmbeddingModelConverter()
  final EmbeddingModel model;

  /// The list of strings to embed.
  final List<String> _input;

  /// The list of strings to embed.
  @override
  List<String> get input {
    if (_input is EqualUnmodifiableListView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_input);
  }

  /// The format of the output data.
  @override
  @JsonKey(name: 'encoding_format')
  final EmbeddingEncodingFormat encodingFormat;

  @override
  String toString() {
    return 'EmbeddingRequest(model: $model, input: $input, encodingFormat: $encodingFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            (identical(other.encodingFormat, encodingFormat) ||
                other.encodingFormat == encodingFormat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model,
      const DeepCollectionEquality().hash(_input), encodingFormat);

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
      {@_EmbeddingModelConverter() required final EmbeddingModel model,
      required final List<String> input,
      @JsonKey(name: 'encoding_format')
      final EmbeddingEncodingFormat encodingFormat}) = _$EmbeddingRequestImpl;
  const _EmbeddingRequest._() : super._();

  factory _EmbeddingRequest.fromJson(Map<String, dynamic> json) =
      _$EmbeddingRequestImpl.fromJson;

  @override

  /// ID of the model to use. You can use the [List Available Models](https://docs.mistral.ai/api#operation/listModels) API to see all of your available models, or see our [Model overview](https://docs.mistral.ai/models) for model descriptions.
  @_EmbeddingModelConverter()
  EmbeddingModel get model;
  @override

  /// The list of strings to embed.
  List<String> get input;
  @override

  /// The format of the output data.
  @JsonKey(name: 'encoding_format')
  EmbeddingEncodingFormat get encodingFormat;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingRequestImplCopyWith<_$EmbeddingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmbeddingModel _$EmbeddingModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'model':
      return EmbeddingModelEnumeration.fromJson(json);
    case 'modelId':
      return EmbeddingModelString.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EmbeddingModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EmbeddingModel {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmbeddingModels value) model,
    required TResult Function(String value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModels value)? model,
    TResult? Function(String value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmbeddingModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmbeddingModelEnumeration value) model,
    required TResult Function(EmbeddingModelString value) modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModelEnumeration value)? model,
    TResult? Function(EmbeddingModelString value)? modelId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmbeddingModelEnumeration value)? model,
    TResult Function(EmbeddingModelString value)? modelId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddingModelCopyWith<$Res> {
  factory $EmbeddingModelCopyWith(
          EmbeddingModel value, $Res Function(EmbeddingModel) then) =
      _$EmbeddingModelCopyWithImpl<$Res, EmbeddingModel>;
}

/// @nodoc
class _$EmbeddingModelCopyWithImpl<$Res, $Val extends EmbeddingModel>
    implements $EmbeddingModelCopyWith<$Res> {
  _$EmbeddingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmbeddingModelEnumerationImplCopyWith<$Res> {
  factory _$$EmbeddingModelEnumerationImplCopyWith(
          _$EmbeddingModelEnumerationImpl value,
          $Res Function(_$EmbeddingModelEnumerationImpl) then) =
      __$$EmbeddingModelEnumerationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmbeddingModels value});
}

/// @nodoc
class __$$EmbeddingModelEnumerationImplCopyWithImpl<$Res>
    extends _$EmbeddingModelCopyWithImpl<$Res, _$EmbeddingModelEnumerationImpl>
    implements _$$EmbeddingModelEnumerationImplCopyWith<$Res> {
  __$$EmbeddingModelEnumerationImplCopyWithImpl(
      _$EmbeddingModelEnumerationImpl _value,
      $Res Function(_$EmbeddingModelEnumerationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$EmbeddingModelEnumerationImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as EmbeddingModels,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingModelEnumerationImpl extends EmbeddingModelEnumeration {
  const _$EmbeddingModelEnumerationImpl(this.value, {final String? $type})
      : $type = $type ?? 'model',
        super._();

  factory _$EmbeddingModelEnumerationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingModelEnumerationImplFromJson(json);

  @override
  final EmbeddingModels value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EmbeddingModel.model(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingModelEnumerationImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingModelEnumerationImplCopyWith<_$EmbeddingModelEnumerationImpl>
      get copyWith => __$$EmbeddingModelEnumerationImplCopyWithImpl<
          _$EmbeddingModelEnumerationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmbeddingModels value) model,
    required TResult Function(String value) modelId,
  }) {
    return model(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModels value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return model?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmbeddingModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmbeddingModelEnumeration value) model,
    required TResult Function(EmbeddingModelString value) modelId,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModelEnumeration value)? model,
    TResult? Function(EmbeddingModelString value)? modelId,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmbeddingModelEnumeration value)? model,
    TResult Function(EmbeddingModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingModelEnumerationImplToJson(
      this,
    );
  }
}

abstract class EmbeddingModelEnumeration extends EmbeddingModel {
  const factory EmbeddingModelEnumeration(final EmbeddingModels value) =
      _$EmbeddingModelEnumerationImpl;
  const EmbeddingModelEnumeration._() : super._();

  factory EmbeddingModelEnumeration.fromJson(Map<String, dynamic> json) =
      _$EmbeddingModelEnumerationImpl.fromJson;

  @override
  EmbeddingModels get value;
  @JsonKey(ignore: true)
  _$$EmbeddingModelEnumerationImplCopyWith<_$EmbeddingModelEnumerationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmbeddingModelStringImplCopyWith<$Res> {
  factory _$$EmbeddingModelStringImplCopyWith(_$EmbeddingModelStringImpl value,
          $Res Function(_$EmbeddingModelStringImpl) then) =
      __$$EmbeddingModelStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$EmbeddingModelStringImplCopyWithImpl<$Res>
    extends _$EmbeddingModelCopyWithImpl<$Res, _$EmbeddingModelStringImpl>
    implements _$$EmbeddingModelStringImplCopyWith<$Res> {
  __$$EmbeddingModelStringImplCopyWithImpl(_$EmbeddingModelStringImpl _value,
      $Res Function(_$EmbeddingModelStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$EmbeddingModelStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingModelStringImpl extends EmbeddingModelString {
  const _$EmbeddingModelStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'modelId',
        super._();

  factory _$EmbeddingModelStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingModelStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'EmbeddingModel.modelId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingModelStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingModelStringImplCopyWith<_$EmbeddingModelStringImpl>
      get copyWith =>
          __$$EmbeddingModelStringImplCopyWithImpl<_$EmbeddingModelStringImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmbeddingModels value) model,
    required TResult Function(String value) modelId,
  }) {
    return modelId(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModels value)? model,
    TResult? Function(String value)? modelId,
  }) {
    return modelId?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmbeddingModels value)? model,
    TResult Function(String value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmbeddingModelEnumeration value) model,
    required TResult Function(EmbeddingModelString value) modelId,
  }) {
    return modelId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmbeddingModelEnumeration value)? model,
    TResult? Function(EmbeddingModelString value)? modelId,
  }) {
    return modelId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmbeddingModelEnumeration value)? model,
    TResult Function(EmbeddingModelString value)? modelId,
    required TResult orElse(),
  }) {
    if (modelId != null) {
      return modelId(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingModelStringImplToJson(
      this,
    );
  }
}

abstract class EmbeddingModelString extends EmbeddingModel {
  const factory EmbeddingModelString(final String value) =
      _$EmbeddingModelStringImpl;
  const EmbeddingModelString._() : super._();

  factory EmbeddingModelString.fromJson(Map<String, dynamic> json) =
      _$EmbeddingModelStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$EmbeddingModelStringImplCopyWith<_$EmbeddingModelStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EmbeddingResponse _$EmbeddingResponseFromJson(Map<String, dynamic> json) {
  return _EmbeddingResponse.fromJson(json);
}

/// @nodoc
mixin _$EmbeddingResponse {
  /// The unique identifier for this embedding response.
  String get id => throw _privateConstructorUsedError;

  /// The object type, which is always `list`.
  String get object => throw _privateConstructorUsedError;

  /// The list of embeddings.
  List<Embedding> get data => throw _privateConstructorUsedError;

  /// The model used for this embedding.
  String get model => throw _privateConstructorUsedError;

  /// The usage statistics for this embedding.
  EmbeddingUsage get usage => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      String object,
      List<Embedding> data,
      String model,
      EmbeddingUsage usage});

  $EmbeddingUsageCopyWith<$Res> get usage;
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
    Object? id = null,
    Object? object = null,
    Object? data = null,
    Object? model = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Embedding>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as EmbeddingUsage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmbeddingUsageCopyWith<$Res> get usage {
    return $EmbeddingUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
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
  $Res call(
      {String id,
      String object,
      List<Embedding> data,
      String model,
      EmbeddingUsage usage});

  @override
  $EmbeddingUsageCopyWith<$Res> get usage;
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
    Object? id = null,
    Object? object = null,
    Object? data = null,
    Object? model = null,
    Object? usage = null,
  }) {
    return _then(_$EmbeddingResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Embedding>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as EmbeddingUsage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingResponseImpl extends _EmbeddingResponse {
  const _$EmbeddingResponseImpl(
      {required this.id,
      required this.object,
      required final List<Embedding> data,
      required this.model,
      required this.usage})
      : _data = data,
        super._();

  factory _$EmbeddingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingResponseImplFromJson(json);

  /// The unique identifier for this embedding response.
  @override
  final String id;

  /// The object type, which is always `list`.
  @override
  final String object;

  /// The list of embeddings.
  final List<Embedding> _data;

  /// The list of embeddings.
  @override
  List<Embedding> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// The model used for this embedding.
  @override
  final String model;

  /// The usage statistics for this embedding.
  @override
  final EmbeddingUsage usage;

  @override
  String toString() {
    return 'EmbeddingResponse(id: $id, object: $object, data: $data, model: $model, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object,
      const DeepCollectionEquality().hash(_data), model, usage);

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
      {required final String id,
      required final String object,
      required final List<Embedding> data,
      required final String model,
      required final EmbeddingUsage usage}) = _$EmbeddingResponseImpl;
  const _EmbeddingResponse._() : super._();

  factory _EmbeddingResponse.fromJson(Map<String, dynamic> json) =
      _$EmbeddingResponseImpl.fromJson;

  @override

  /// The unique identifier for this embedding response.
  String get id;
  @override

  /// The object type, which is always `list`.
  String get object;
  @override

  /// The list of embeddings.
  List<Embedding> get data;
  @override

  /// The model used for this embedding.
  String get model;
  @override

  /// The usage statistics for this embedding.
  EmbeddingUsage get usage;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingResponseImplCopyWith<_$EmbeddingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmbeddingUsage _$EmbeddingUsageFromJson(Map<String, dynamic> json) {
  return _EmbeddingUsage.fromJson(json);
}

/// @nodoc
mixin _$EmbeddingUsage {
  /// The number of tokens in the prompt.
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens => throw _privateConstructorUsedError;

  /// The total number of tokens generated.
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbeddingUsageCopyWith<EmbeddingUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddingUsageCopyWith<$Res> {
  factory $EmbeddingUsageCopyWith(
          EmbeddingUsage value, $Res Function(EmbeddingUsage) then) =
      _$EmbeddingUsageCopyWithImpl<$Res, EmbeddingUsage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class _$EmbeddingUsageCopyWithImpl<$Res, $Val extends EmbeddingUsage>
    implements $EmbeddingUsageCopyWith<$Res> {
  _$EmbeddingUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmbeddingUsageImplCopyWith<$Res>
    implements $EmbeddingUsageCopyWith<$Res> {
  factory _$$EmbeddingUsageImplCopyWith(_$EmbeddingUsageImpl value,
          $Res Function(_$EmbeddingUsageImpl) then) =
      __$$EmbeddingUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class __$$EmbeddingUsageImplCopyWithImpl<$Res>
    extends _$EmbeddingUsageCopyWithImpl<$Res, _$EmbeddingUsageImpl>
    implements _$$EmbeddingUsageImplCopyWith<$Res> {
  __$$EmbeddingUsageImplCopyWithImpl(
      _$EmbeddingUsageImpl _value, $Res Function(_$EmbeddingUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$EmbeddingUsageImpl(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingUsageImpl extends _EmbeddingUsage {
  const _$EmbeddingUsageImpl(
      {@JsonKey(name: 'prompt_tokens') required this.promptTokens,
      @JsonKey(name: 'total_tokens') required this.totalTokens})
      : super._();

  factory _$EmbeddingUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingUsageImplFromJson(json);

  /// The number of tokens in the prompt.
  @override
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;

  /// The total number of tokens generated.
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  @override
  String toString() {
    return 'EmbeddingUsage(promptTokens: $promptTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingUsageImpl &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promptTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingUsageImplCopyWith<_$EmbeddingUsageImpl> get copyWith =>
      __$$EmbeddingUsageImplCopyWithImpl<_$EmbeddingUsageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingUsageImplToJson(
      this,
    );
  }
}

abstract class _EmbeddingUsage extends EmbeddingUsage {
  const factory _EmbeddingUsage(
          {@JsonKey(name: 'prompt_tokens') required final int promptTokens,
          @JsonKey(name: 'total_tokens') required final int totalTokens}) =
      _$EmbeddingUsageImpl;
  const _EmbeddingUsage._() : super._();

  factory _EmbeddingUsage.fromJson(Map<String, dynamic> json) =
      _$EmbeddingUsageImpl.fromJson;

  @override

  /// The number of tokens in the prompt.
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens;
  @override

  /// The total number of tokens generated.
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingUsageImplCopyWith<_$EmbeddingUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Embedding _$EmbeddingFromJson(Map<String, dynamic> json) {
  return _Embedding.fromJson(json);
}

/// @nodoc
mixin _$Embedding {
  /// The object type, which is always `embedding`.
  String get object => throw _privateConstructorUsedError;

  /// The embedding vector.
  List<double> get embedding => throw _privateConstructorUsedError;

  /// The index of this embedding.
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmbeddingCopyWith<Embedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddingCopyWith<$Res> {
  factory $EmbeddingCopyWith(Embedding value, $Res Function(Embedding) then) =
      _$EmbeddingCopyWithImpl<$Res, Embedding>;
  @useResult
  $Res call({String object, List<double> embedding, int index});
}

/// @nodoc
class _$EmbeddingCopyWithImpl<$Res, $Val extends Embedding>
    implements $EmbeddingCopyWith<$Res> {
  _$EmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? embedding = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      embedding: null == embedding
          ? _value.embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmbeddingImplCopyWith<$Res>
    implements $EmbeddingCopyWith<$Res> {
  factory _$$EmbeddingImplCopyWith(
          _$EmbeddingImpl value, $Res Function(_$EmbeddingImpl) then) =
      __$$EmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String object, List<double> embedding, int index});
}

/// @nodoc
class __$$EmbeddingImplCopyWithImpl<$Res>
    extends _$EmbeddingCopyWithImpl<$Res, _$EmbeddingImpl>
    implements _$$EmbeddingImplCopyWith<$Res> {
  __$$EmbeddingImplCopyWithImpl(
      _$EmbeddingImpl _value, $Res Function(_$EmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? embedding = null,
    Object? index = null,
  }) {
    return _then(_$EmbeddingImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      embedding: null == embedding
          ? _value._embedding
          : embedding // ignore: cast_nullable_to_non_nullable
              as List<double>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmbeddingImpl extends _Embedding {
  const _$EmbeddingImpl(
      {required this.object,
      required final List<double> embedding,
      required this.index})
      : _embedding = embedding,
        super._();

  factory _$EmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddingImplFromJson(json);

  /// The object type, which is always `embedding`.
  @override
  final String object;

  /// The embedding vector.
  final List<double> _embedding;

  /// The embedding vector.
  @override
  List<double> get embedding {
    if (_embedding is EqualUnmodifiableListView) return _embedding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_embedding);
  }

  /// The index of this embedding.
  @override
  final int index;

  @override
  String toString() {
    return 'Embedding(object: $object, embedding: $embedding, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddingImpl &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality()
                .equals(other._embedding, _embedding) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, object,
      const DeepCollectionEquality().hash(_embedding), index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddingImplCopyWith<_$EmbeddingImpl> get copyWith =>
      __$$EmbeddingImplCopyWithImpl<_$EmbeddingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddingImplToJson(
      this,
    );
  }
}

abstract class _Embedding extends Embedding {
  const factory _Embedding(
      {required final String object,
      required final List<double> embedding,
      required final int index}) = _$EmbeddingImpl;
  const _Embedding._() : super._();

  factory _Embedding.fromJson(Map<String, dynamic> json) =
      _$EmbeddingImpl.fromJson;

  @override

  /// The object type, which is always `embedding`.
  String get object;
  @override

  /// The embedding vector.
  List<double> get embedding;
  @override

  /// The index of this embedding.
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$EmbeddingImplCopyWith<_$EmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelList _$ModelListFromJson(Map<String, dynamic> json) {
  return _ModelList.fromJson(json);
}

/// @nodoc
mixin _$ModelList {
  /// The object type, which is always `list`.
  String get object => throw _privateConstructorUsedError;

  /// The list of models.
  List<Model> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelListCopyWith<ModelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelListCopyWith<$Res> {
  factory $ModelListCopyWith(ModelList value, $Res Function(ModelList) then) =
      _$ModelListCopyWithImpl<$Res, ModelList>;
  @useResult
  $Res call({String object, List<Model> data});
}

/// @nodoc
class _$ModelListCopyWithImpl<$Res, $Val extends ModelList>
    implements $ModelListCopyWith<$Res> {
  _$ModelListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelListImplCopyWith<$Res>
    implements $ModelListCopyWith<$Res> {
  factory _$$ModelListImplCopyWith(
          _$ModelListImpl value, $Res Function(_$ModelListImpl) then) =
      __$$ModelListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String object, List<Model> data});
}

/// @nodoc
class __$$ModelListImplCopyWithImpl<$Res>
    extends _$ModelListCopyWithImpl<$Res, _$ModelListImpl>
    implements _$$ModelListImplCopyWith<$Res> {
  __$$ModelListImplCopyWithImpl(
      _$ModelListImpl _value, $Res Function(_$ModelListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? data = null,
  }) {
    return _then(_$ModelListImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelListImpl extends _ModelList {
  const _$ModelListImpl({required this.object, required final List<Model> data})
      : _data = data,
        super._();

  factory _$ModelListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelListImplFromJson(json);

  /// The object type, which is always `list`.
  @override
  final String object;

  /// The list of models.
  final List<Model> _data;

  /// The list of models.
  @override
  List<Model> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ModelList(object: $object, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelListImpl &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, object, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelListImplCopyWith<_$ModelListImpl> get copyWith =>
      __$$ModelListImplCopyWithImpl<_$ModelListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelListImplToJson(
      this,
    );
  }
}

abstract class _ModelList extends ModelList {
  const factory _ModelList(
      {required final String object,
      required final List<Model> data}) = _$ModelListImpl;
  const _ModelList._() : super._();

  factory _ModelList.fromJson(Map<String, dynamic> json) =
      _$ModelListImpl.fromJson;

  @override

  /// The object type, which is always `list`.
  String get object;
  @override

  /// The list of models.
  List<Model> get data;
  @override
  @JsonKey(ignore: true)
  _$$ModelListImplCopyWith<_$ModelListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return _Model.fromJson(json);
}

/// @nodoc
mixin _$Model {
  /// The unique identifier for this model.
  String get id => throw _privateConstructorUsedError;

  /// The object type, which is always `model`.
  String get object => throw _privateConstructorUsedError;

  /// The timestamp of when this model was created.
  int get created => throw _privateConstructorUsedError;

  /// The organization who owns this model.
  @JsonKey(name: 'owned_by')
  String get ownedBy => throw _privateConstructorUsedError;

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
      {String id,
      String object,
      int created,
      @JsonKey(name: 'owned_by') String ownedBy});
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
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? ownedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      ownedBy: null == ownedBy
          ? _value.ownedBy
          : ownedBy // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String id,
      String object,
      int created,
      @JsonKey(name: 'owned_by') String ownedBy});
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
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? ownedBy = null,
  }) {
    return _then(_$ModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      ownedBy: null == ownedBy
          ? _value.ownedBy
          : ownedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelImpl extends _Model {
  const _$ModelImpl(
      {required this.id,
      required this.object,
      required this.created,
      @JsonKey(name: 'owned_by') required this.ownedBy})
      : super._();

  factory _$ModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelImplFromJson(json);

  /// The unique identifier for this model.
  @override
  final String id;

  /// The object type, which is always `model`.
  @override
  final String object;

  /// The timestamp of when this model was created.
  @override
  final int created;

  /// The organization who owns this model.
  @override
  @JsonKey(name: 'owned_by')
  final String ownedBy;

  @override
  String toString() {
    return 'Model(id: $id, object: $object, created: $created, ownedBy: $ownedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.ownedBy, ownedBy) || other.ownedBy == ownedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, ownedBy);

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
      {required final String id,
      required final String object,
      required final int created,
      @JsonKey(name: 'owned_by') required final String ownedBy}) = _$ModelImpl;
  const _Model._() : super._();

  factory _Model.fromJson(Map<String, dynamic> json) = _$ModelImpl.fromJson;

  @override

  /// The unique identifier for this model.
  String get id;
  @override

  /// The object type, which is always `model`.
  String get object;
  @override

  /// The timestamp of when this model was created.
  int get created;
  @override

  /// The organization who owns this model.
  @JsonKey(name: 'owned_by')
  String get ownedBy;
  @override
  @JsonKey(ignore: true)
  _$$ModelImplCopyWith<_$ModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
