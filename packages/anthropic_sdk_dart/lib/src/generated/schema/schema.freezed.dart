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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentBlock _$ContentBlockFromJson(Map<String, dynamic> json) {
  return _ContentBlock.fromJson(json);
}

/// @nodoc
mixin _$ContentBlock {
  /// No Description
  String get text => throw _privateConstructorUsedError;

  ///
  ContentBlockType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentBlockCopyWith<ContentBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentBlockCopyWith<$Res> {
  factory $ContentBlockCopyWith(
          ContentBlock value, $Res Function(ContentBlock) then) =
      _$ContentBlockCopyWithImpl<$Res, ContentBlock>;
  @useResult
  $Res call({String text, ContentBlockType type});
}

/// @nodoc
class _$ContentBlockCopyWithImpl<$Res, $Val extends ContentBlock>
    implements $ContentBlockCopyWith<$Res> {
  _$ContentBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentBlockType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentBlockImplCopyWith<$Res>
    implements $ContentBlockCopyWith<$Res> {
  factory _$$ContentBlockImplCopyWith(
          _$ContentBlockImpl value, $Res Function(_$ContentBlockImpl) then) =
      __$$ContentBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, ContentBlockType type});
}

/// @nodoc
class __$$ContentBlockImplCopyWithImpl<$Res>
    extends _$ContentBlockCopyWithImpl<$Res, _$ContentBlockImpl>
    implements _$$ContentBlockImplCopyWith<$Res> {
  __$$ContentBlockImplCopyWithImpl(
      _$ContentBlockImpl _value, $Res Function(_$ContentBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentBlockType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockImpl extends _ContentBlock {
  const _$ContentBlockImpl({required this.text, required this.type})
      : super._();

  factory _$ContentBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockImplFromJson(json);

  /// No Description
  @override
  final String text;

  ///
  @override
  final ContentBlockType type;

  @override
  String toString() {
    return 'ContentBlock(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockImplCopyWith<_$ContentBlockImpl> get copyWith =>
      __$$ContentBlockImplCopyWithImpl<_$ContentBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockImplToJson(
      this,
    );
  }
}

abstract class _ContentBlock extends ContentBlock {
  const factory _ContentBlock(
      {required final String text,
      required final ContentBlockType type}) = _$ContentBlockImpl;
  const _ContentBlock._() : super._();

  factory _ContentBlock.fromJson(Map<String, dynamic> json) =
      _$ContentBlockImpl.fromJson;

  @override

  /// No Description
  String get text;
  @override

  ///
  ContentBlockType get type;
  @override
  @JsonKey(ignore: true)
  _$$ContentBlockImplCopyWith<_$ContentBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageBlockParam _$ImageBlockParamFromJson(Map<String, dynamic> json) {
  return _ImageBlockParam.fromJson(json);
}

/// @nodoc
mixin _$ImageBlockParam {
  /// No Description
  ImageBlockParamSource get source => throw _privateConstructorUsedError;

  ///
  ImageBlockParamType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageBlockParamCopyWith<ImageBlockParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageBlockParamCopyWith<$Res> {
  factory $ImageBlockParamCopyWith(
          ImageBlockParam value, $Res Function(ImageBlockParam) then) =
      _$ImageBlockParamCopyWithImpl<$Res, ImageBlockParam>;
  @useResult
  $Res call({ImageBlockParamSource source, ImageBlockParamType type});

  $ImageBlockParamSourceCopyWith<$Res> get source;
}

/// @nodoc
class _$ImageBlockParamCopyWithImpl<$Res, $Val extends ImageBlockParam>
    implements $ImageBlockParamCopyWith<$Res> {
  _$ImageBlockParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSource,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageBlockParamSourceCopyWith<$Res> get source {
    return $ImageBlockParamSourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageBlockParamImplCopyWith<$Res>
    implements $ImageBlockParamCopyWith<$Res> {
  factory _$$ImageBlockParamImplCopyWith(_$ImageBlockParamImpl value,
          $Res Function(_$ImageBlockParamImpl) then) =
      __$$ImageBlockParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageBlockParamSource source, ImageBlockParamType type});

  @override
  $ImageBlockParamSourceCopyWith<$Res> get source;
}

/// @nodoc
class __$$ImageBlockParamImplCopyWithImpl<$Res>
    extends _$ImageBlockParamCopyWithImpl<$Res, _$ImageBlockParamImpl>
    implements _$$ImageBlockParamImplCopyWith<$Res> {
  __$$ImageBlockParamImplCopyWithImpl(
      _$ImageBlockParamImpl _value, $Res Function(_$ImageBlockParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? type = null,
  }) {
    return _then(_$ImageBlockParamImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSource,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageBlockParamImpl extends _ImageBlockParam {
  const _$ImageBlockParamImpl({required this.source, required this.type})
      : super._();

  factory _$ImageBlockParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageBlockParamImplFromJson(json);

  /// No Description
  @override
  final ImageBlockParamSource source;

  ///
  @override
  final ImageBlockParamType type;

  @override
  String toString() {
    return 'ImageBlockParam(source: $source, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageBlockParamImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageBlockParamImplCopyWith<_$ImageBlockParamImpl> get copyWith =>
      __$$ImageBlockParamImplCopyWithImpl<_$ImageBlockParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageBlockParamImplToJson(
      this,
    );
  }
}

abstract class _ImageBlockParam extends ImageBlockParam {
  const factory _ImageBlockParam(
      {required final ImageBlockParamSource source,
      required final ImageBlockParamType type}) = _$ImageBlockParamImpl;
  const _ImageBlockParam._() : super._();

  factory _ImageBlockParam.fromJson(Map<String, dynamic> json) =
      _$ImageBlockParamImpl.fromJson;

  @override

  /// No Description
  ImageBlockParamSource get source;
  @override

  ///
  ImageBlockParamType get type;
  @override
  @JsonKey(ignore: true)
  _$$ImageBlockParamImplCopyWith<_$ImageBlockParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageBlockParamSource _$ImageBlockParamSourceFromJson(
    Map<String, dynamic> json) {
  return _ImageBlockParamSource.fromJson(json);
}

/// @nodoc
mixin _$ImageBlockParamSource {
  /// No Description
  String get data => throw _privateConstructorUsedError;

  ///
  @JsonKey(name: 'media_type')
  ImageBlockParamSourceMediaType get mediaType =>
      throw _privateConstructorUsedError;

  ///
  ImageBlockParamSourceType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageBlockParamSourceCopyWith<ImageBlockParamSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageBlockParamSourceCopyWith<$Res> {
  factory $ImageBlockParamSourceCopyWith(ImageBlockParamSource value,
          $Res Function(ImageBlockParamSource) then) =
      _$ImageBlockParamSourceCopyWithImpl<$Res, ImageBlockParamSource>;
  @useResult
  $Res call(
      {String data,
      @JsonKey(name: 'media_type') ImageBlockParamSourceMediaType mediaType,
      ImageBlockParamSourceType type});
}

/// @nodoc
class _$ImageBlockParamSourceCopyWithImpl<$Res,
        $Val extends ImageBlockParamSource>
    implements $ImageBlockParamSourceCopyWith<$Res> {
  _$ImageBlockParamSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? mediaType = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSourceMediaType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSourceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageBlockParamSourceImplCopyWith<$Res>
    implements $ImageBlockParamSourceCopyWith<$Res> {
  factory _$$ImageBlockParamSourceImplCopyWith(
          _$ImageBlockParamSourceImpl value,
          $Res Function(_$ImageBlockParamSourceImpl) then) =
      __$$ImageBlockParamSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String data,
      @JsonKey(name: 'media_type') ImageBlockParamSourceMediaType mediaType,
      ImageBlockParamSourceType type});
}

/// @nodoc
class __$$ImageBlockParamSourceImplCopyWithImpl<$Res>
    extends _$ImageBlockParamSourceCopyWithImpl<$Res,
        _$ImageBlockParamSourceImpl>
    implements _$$ImageBlockParamSourceImplCopyWith<$Res> {
  __$$ImageBlockParamSourceImplCopyWithImpl(_$ImageBlockParamSourceImpl _value,
      $Res Function(_$ImageBlockParamSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? mediaType = null,
    Object? type = null,
  }) {
    return _then(_$ImageBlockParamSourceImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSourceMediaType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImageBlockParamSourceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageBlockParamSourceImpl extends _ImageBlockParamSource {
  const _$ImageBlockParamSourceImpl(
      {required this.data,
      @JsonKey(name: 'media_type') required this.mediaType,
      required this.type})
      : super._();

  factory _$ImageBlockParamSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageBlockParamSourceImplFromJson(json);

  /// No Description
  @override
  final String data;

  ///
  @override
  @JsonKey(name: 'media_type')
  final ImageBlockParamSourceMediaType mediaType;

  ///
  @override
  final ImageBlockParamSourceType type;

  @override
  String toString() {
    return 'ImageBlockParamSource(data: $data, mediaType: $mediaType, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageBlockParamSourceImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, mediaType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageBlockParamSourceImplCopyWith<_$ImageBlockParamSourceImpl>
      get copyWith => __$$ImageBlockParamSourceImplCopyWithImpl<
          _$ImageBlockParamSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageBlockParamSourceImplToJson(
      this,
    );
  }
}

abstract class _ImageBlockParamSource extends ImageBlockParamSource {
  const factory _ImageBlockParamSource(
          {required final String data,
          @JsonKey(name: 'media_type')
          required final ImageBlockParamSourceMediaType mediaType,
          required final ImageBlockParamSourceType type}) =
      _$ImageBlockParamSourceImpl;
  const _ImageBlockParamSource._() : super._();

  factory _ImageBlockParamSource.fromJson(Map<String, dynamic> json) =
      _$ImageBlockParamSourceImpl.fromJson;

  @override

  /// No Description
  String get data;
  @override

  ///
  @JsonKey(name: 'media_type')
  ImageBlockParamSourceMediaType get mediaType;
  @override

  ///
  ImageBlockParamSourceType get type;
  @override
  @JsonKey(ignore: true)
  _$$ImageBlockParamSourceImplCopyWith<_$ImageBlockParamSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  String get id => throw _privateConstructorUsedError;

  /// Content generated by the model.
  ///
  /// This is an array of content blocks, each of which has a `type` that determines
  /// its shape. Currently, the only `type` in responses is `"text"`.
  ///
  /// Example:
  ///
  /// ```json
  /// [{ "type": "text", "text": "Hi, I'm Claude." }]
  /// ```
  ///
  /// If the request input `messages` ended with an `assistant` turn, then the
  /// response `content` will continue directly from that last turn. You can use this
  /// to constrain the model's output.
  ///
  /// For example, if the input `messages` were:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Then the response `content` might be:
  ///
  /// ```json
  /// [{ "type": "text", "text": "B)" }]
  /// ```
  List<TextBlock> get content => throw _privateConstructorUsedError;

  /// The model that handled the request.
  String get model => throw _privateConstructorUsedError;

  /// Conversational role of the generated message.
  ///
  /// This will always be `"assistant"`.
  MessageRole get role => throw _privateConstructorUsedError;

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  MessageStopReason? get stopReason => throw _privateConstructorUsedError;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence')
  String? get stopSequence => throw _privateConstructorUsedError;

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  MessageType get type => throw _privateConstructorUsedError;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  Usage get usage => throw _privateConstructorUsedError;

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
      {String id,
      List<TextBlock> content,
      String model,
      MessageRole role,
      @JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      MessageStopReason? stopReason,
      @JsonKey(name: 'stop_sequence') String? stopSequence,
      MessageType type,
      Usage usage});

  $UsageCopyWith<$Res> get usage;
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
    Object? id = null,
    Object? content = null,
    Object? model = null,
    Object? role = null,
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
    Object? type = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as MessageStopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res> get usage {
    return $UsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
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
      {String id,
      List<TextBlock> content,
      String model,
      MessageRole role,
      @JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      MessageStopReason? stopReason,
      @JsonKey(name: 'stop_sequence') String? stopSequence,
      MessageType type,
      Usage usage});

  @override
  $UsageCopyWith<$Res> get usage;
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
    Object? id = null,
    Object? content = null,
    Object? model = null,
    Object? role = null,
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
    Object? type = null,
    Object? usage = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as MessageStopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {required this.id,
      required final List<TextBlock> content,
      required this.model,
      required this.role,
      @JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      required this.stopReason,
      @JsonKey(name: 'stop_sequence') required this.stopSequence,
      required this.type,
      required this.usage})
      : _content = content,
        super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  @override
  final String id;

  /// Content generated by the model.
  ///
  /// This is an array of content blocks, each of which has a `type` that determines
  /// its shape. Currently, the only `type` in responses is `"text"`.
  ///
  /// Example:
  ///
  /// ```json
  /// [{ "type": "text", "text": "Hi, I'm Claude." }]
  /// ```
  ///
  /// If the request input `messages` ended with an `assistant` turn, then the
  /// response `content` will continue directly from that last turn. You can use this
  /// to constrain the model's output.
  ///
  /// For example, if the input `messages` were:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Then the response `content` might be:
  ///
  /// ```json
  /// [{ "type": "text", "text": "B)" }]
  /// ```
  final List<TextBlock> _content;

  /// Content generated by the model.
  ///
  /// This is an array of content blocks, each of which has a `type` that determines
  /// its shape. Currently, the only `type` in responses is `"text"`.
  ///
  /// Example:
  ///
  /// ```json
  /// [{ "type": "text", "text": "Hi, I'm Claude." }]
  /// ```
  ///
  /// If the request input `messages` ended with an `assistant` turn, then the
  /// response `content` will continue directly from that last turn. You can use this
  /// to constrain the model's output.
  ///
  /// For example, if the input `messages` were:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Then the response `content` might be:
  ///
  /// ```json
  /// [{ "type": "text", "text": "B)" }]
  /// ```
  @override
  List<TextBlock> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// The model that handled the request.
  @override
  final String model;

  /// Conversational role of the generated message.
  ///
  /// This will always be `"assistant"`.
  @override
  final MessageRole role;

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @override
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MessageStopReason? stopReason;

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @override
  @JsonKey(name: 'stop_sequence')
  final String? stopSequence;

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  @override
  final MessageType type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @override
  final Usage usage;

  @override
  String toString() {
    return 'Message(id: $id, content: $content, model: $model, role: $role, stopReason: $stopReason, stopSequence: $stopSequence, type: $type, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.stopReason, stopReason) ||
                other.stopReason == stopReason) &&
            (identical(other.stopSequence, stopSequence) ||
                other.stopSequence == stopSequence) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_content),
      model,
      role,
      stopReason,
      stopSequence,
      type,
      usage);

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
      {required final String id,
      required final List<TextBlock> content,
      required final String model,
      required final MessageRole role,
      @JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      required final MessageStopReason? stopReason,
      @JsonKey(name: 'stop_sequence') required final String? stopSequence,
      required final MessageType type,
      required final Usage usage}) = _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override

  /// Unique object identifier.
  ///
  /// The format and length of IDs may change over time.
  String get id;
  @override

  /// Content generated by the model.
  ///
  /// This is an array of content blocks, each of which has a `type` that determines
  /// its shape. Currently, the only `type` in responses is `"text"`.
  ///
  /// Example:
  ///
  /// ```json
  /// [{ "type": "text", "text": "Hi, I'm Claude." }]
  /// ```
  ///
  /// If the request input `messages` ended with an `assistant` turn, then the
  /// response `content` will continue directly from that last turn. You can use this
  /// to constrain the model's output.
  ///
  /// For example, if the input `messages` were:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Then the response `content` might be:
  ///
  /// ```json
  /// [{ "type": "text", "text": "B)" }]
  /// ```
  List<TextBlock> get content;
  @override

  /// The model that handled the request.
  String get model;
  @override

  /// Conversational role of the generated message.
  ///
  /// This will always be `"assistant"`.
  MessageRole get role;
  @override

  /// The reason that we stopped.
  ///
  /// This may be one the following values:
  ///
  /// - `"end_turn"`: the model reached a natural stopping point
  /// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
  /// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
  ///
  /// In non-streaming mode this value is always non-null. In streaming mode, it is
  /// null in the `message_start` event and non-null otherwise.
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  MessageStopReason? get stopReason;
  @override

  /// Which custom stop sequence was generated, if any.
  ///
  /// This value will be a non-null string if one of your custom stop sequences was
  /// generated.
  @JsonKey(name: 'stop_sequence')
  String? get stopSequence;
  @override

  /// Object type.
  ///
  /// For Messages, this is always `"message"`.
  MessageType get type;
  @override

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  Usage get usage;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageDeltaEventDelta _$MessageDeltaEventDeltaFromJson(
    Map<String, dynamic> json) {
  return _MessageDeltaEventDelta.fromJson(json);
}

/// @nodoc
mixin _$MessageDeltaEventDelta {
  ///
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  MessageDeltaEventDeltaStopReason? get stopReason =>
      throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'stop_sequence')
  String? get stopSequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDeltaEventDeltaCopyWith<MessageDeltaEventDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDeltaEventDeltaCopyWith<$Res> {
  factory $MessageDeltaEventDeltaCopyWith(MessageDeltaEventDelta value,
          $Res Function(MessageDeltaEventDelta) then) =
      _$MessageDeltaEventDeltaCopyWithImpl<$Res, MessageDeltaEventDelta>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      MessageDeltaEventDeltaStopReason? stopReason,
      @JsonKey(name: 'stop_sequence') String? stopSequence});
}

/// @nodoc
class _$MessageDeltaEventDeltaCopyWithImpl<$Res,
        $Val extends MessageDeltaEventDelta>
    implements $MessageDeltaEventDeltaCopyWith<$Res> {
  _$MessageDeltaEventDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
  }) {
    return _then(_value.copyWith(
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as MessageDeltaEventDeltaStopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDeltaEventDeltaImplCopyWith<$Res>
    implements $MessageDeltaEventDeltaCopyWith<$Res> {
  factory _$$MessageDeltaEventDeltaImplCopyWith(
          _$MessageDeltaEventDeltaImpl value,
          $Res Function(_$MessageDeltaEventDeltaImpl) then) =
      __$$MessageDeltaEventDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      MessageDeltaEventDeltaStopReason? stopReason,
      @JsonKey(name: 'stop_sequence') String? stopSequence});
}

/// @nodoc
class __$$MessageDeltaEventDeltaImplCopyWithImpl<$Res>
    extends _$MessageDeltaEventDeltaCopyWithImpl<$Res,
        _$MessageDeltaEventDeltaImpl>
    implements _$$MessageDeltaEventDeltaImplCopyWith<$Res> {
  __$$MessageDeltaEventDeltaImplCopyWithImpl(
      _$MessageDeltaEventDeltaImpl _value,
      $Res Function(_$MessageDeltaEventDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopReason = freezed,
    Object? stopSequence = freezed,
  }) {
    return _then(_$MessageDeltaEventDeltaImpl(
      stopReason: freezed == stopReason
          ? _value.stopReason
          : stopReason // ignore: cast_nullable_to_non_nullable
              as MessageDeltaEventDeltaStopReason?,
      stopSequence: freezed == stopSequence
          ? _value.stopSequence
          : stopSequence // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaEventDeltaImpl extends _MessageDeltaEventDelta {
  const _$MessageDeltaEventDeltaImpl(
      {@JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      required this.stopReason,
      @JsonKey(name: 'stop_sequence') required this.stopSequence})
      : super._();

  factory _$MessageDeltaEventDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaEventDeltaImplFromJson(json);

  ///
  @override
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final MessageDeltaEventDeltaStopReason? stopReason;

  /// No Description
  @override
  @JsonKey(name: 'stop_sequence')
  final String? stopSequence;

  @override
  String toString() {
    return 'MessageDeltaEventDelta(stopReason: $stopReason, stopSequence: $stopSequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaEventDeltaImpl &&
            (identical(other.stopReason, stopReason) ||
                other.stopReason == stopReason) &&
            (identical(other.stopSequence, stopSequence) ||
                other.stopSequence == stopSequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stopReason, stopSequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaEventDeltaImplCopyWith<_$MessageDeltaEventDeltaImpl>
      get copyWith => __$$MessageDeltaEventDeltaImplCopyWithImpl<
          _$MessageDeltaEventDeltaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaEventDeltaImplToJson(
      this,
    );
  }
}

abstract class _MessageDeltaEventDelta extends MessageDeltaEventDelta {
  const factory _MessageDeltaEventDelta(
      {@JsonKey(
          name: 'stop_reason',
          unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
      required final MessageDeltaEventDeltaStopReason? stopReason,
      @JsonKey(name: 'stop_sequence')
      required final String? stopSequence}) = _$MessageDeltaEventDeltaImpl;
  const _MessageDeltaEventDelta._() : super._();

  factory _MessageDeltaEventDelta.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaEventDeltaImpl.fromJson;

  @override

  ///
  @JsonKey(
      name: 'stop_reason', unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  MessageDeltaEventDeltaStopReason? get stopReason;
  @override

  /// No Description
  @JsonKey(name: 'stop_sequence')
  String? get stopSequence;
  @override
  @JsonKey(ignore: true)
  _$$MessageDeltaEventDeltaImplCopyWith<_$MessageDeltaEventDeltaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageDeltaUsage _$MessageDeltaUsageFromJson(Map<String, dynamic> json) {
  return _MessageDeltaUsage.fromJson(json);
}

/// @nodoc
mixin _$MessageDeltaUsage {
  /// The cumulative number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDeltaUsageCopyWith<MessageDeltaUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDeltaUsageCopyWith<$Res> {
  factory $MessageDeltaUsageCopyWith(
          MessageDeltaUsage value, $Res Function(MessageDeltaUsage) then) =
      _$MessageDeltaUsageCopyWithImpl<$Res, MessageDeltaUsage>;
  @useResult
  $Res call({@JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class _$MessageDeltaUsageCopyWithImpl<$Res, $Val extends MessageDeltaUsage>
    implements $MessageDeltaUsageCopyWith<$Res> {
  _$MessageDeltaUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputTokens = null,
  }) {
    return _then(_value.copyWith(
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDeltaUsageImplCopyWith<$Res>
    implements $MessageDeltaUsageCopyWith<$Res> {
  factory _$$MessageDeltaUsageImplCopyWith(_$MessageDeltaUsageImpl value,
          $Res Function(_$MessageDeltaUsageImpl) then) =
      __$$MessageDeltaUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class __$$MessageDeltaUsageImplCopyWithImpl<$Res>
    extends _$MessageDeltaUsageCopyWithImpl<$Res, _$MessageDeltaUsageImpl>
    implements _$$MessageDeltaUsageImplCopyWith<$Res> {
  __$$MessageDeltaUsageImplCopyWithImpl(_$MessageDeltaUsageImpl _value,
      $Res Function(_$MessageDeltaUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputTokens = null,
  }) {
    return _then(_$MessageDeltaUsageImpl(
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaUsageImpl extends _MessageDeltaUsage {
  const _$MessageDeltaUsageImpl(
      {@JsonKey(name: 'output_tokens') required this.outputTokens})
      : super._();

  factory _$MessageDeltaUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaUsageImplFromJson(json);

  /// The cumulative number of output tokens which were used.
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;

  @override
  String toString() {
    return 'MessageDeltaUsage(outputTokens: $outputTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaUsageImpl &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outputTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaUsageImplCopyWith<_$MessageDeltaUsageImpl> get copyWith =>
      __$$MessageDeltaUsageImplCopyWithImpl<_$MessageDeltaUsageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaUsageImplToJson(
      this,
    );
  }
}

abstract class _MessageDeltaUsage extends MessageDeltaUsage {
  const factory _MessageDeltaUsage(
          {@JsonKey(name: 'output_tokens') required final int outputTokens}) =
      _$MessageDeltaUsageImpl;
  const _MessageDeltaUsage._() : super._();

  factory _MessageDeltaUsage.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaUsageImpl.fromJson;

  @override

  /// The cumulative number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @override
  @JsonKey(ignore: true)
  _$$MessageDeltaUsageImplCopyWith<_$MessageDeltaUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageParam _$MessageParamFromJson(Map<String, dynamic> json) {
  return _MessageParam.fromJson(json);
}

/// @nodoc
mixin _$MessageParam {
  /// No Description
  @_MessageParamContentConverter()
  MessageParamContent get content => throw _privateConstructorUsedError;

  ///
  MessageParamRole get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageParamCopyWith<MessageParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageParamCopyWith<$Res> {
  factory $MessageParamCopyWith(
          MessageParam value, $Res Function(MessageParam) then) =
      _$MessageParamCopyWithImpl<$Res, MessageParam>;
  @useResult
  $Res call(
      {@_MessageParamContentConverter() MessageParamContent content,
      MessageParamRole role});

  $MessageParamContentCopyWith<$Res> get content;
}

/// @nodoc
class _$MessageParamCopyWithImpl<$Res, $Val extends MessageParam>
    implements $MessageParamCopyWith<$Res> {
  _$MessageParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageParamContent,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageParamRole,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageParamContentCopyWith<$Res> get content {
    return $MessageParamContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageParamImplCopyWith<$Res>
    implements $MessageParamCopyWith<$Res> {
  factory _$$MessageParamImplCopyWith(
          _$MessageParamImpl value, $Res Function(_$MessageParamImpl) then) =
      __$$MessageParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@_MessageParamContentConverter() MessageParamContent content,
      MessageParamRole role});

  @override
  $MessageParamContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$MessageParamImplCopyWithImpl<$Res>
    extends _$MessageParamCopyWithImpl<$Res, _$MessageParamImpl>
    implements _$$MessageParamImplCopyWith<$Res> {
  __$$MessageParamImplCopyWithImpl(
      _$MessageParamImpl _value, $Res Function(_$MessageParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? role = null,
  }) {
    return _then(_$MessageParamImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageParamContent,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageParamRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageParamImpl extends _MessageParam {
  const _$MessageParamImpl(
      {@_MessageParamContentConverter() required this.content,
      required this.role})
      : super._();

  factory _$MessageParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageParamImplFromJson(json);

  /// No Description
  @override
  @_MessageParamContentConverter()
  final MessageParamContent content;

  ///
  @override
  final MessageParamRole role;

  @override
  String toString() {
    return 'MessageParam(content: $content, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageParamImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageParamImplCopyWith<_$MessageParamImpl> get copyWith =>
      __$$MessageParamImplCopyWithImpl<_$MessageParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageParamImplToJson(
      this,
    );
  }
}

abstract class _MessageParam extends MessageParam {
  const factory _MessageParam(
      {@_MessageParamContentConverter()
      required final MessageParamContent content,
      required final MessageParamRole role}) = _$MessageParamImpl;
  const _MessageParam._() : super._();

  factory _MessageParam.fromJson(Map<String, dynamic> json) =
      _$MessageParamImpl.fromJson;

  @override

  /// No Description
  @_MessageParamContentConverter()
  MessageParamContent get content;
  @override

  ///
  MessageParamRole get role;
  @override
  @JsonKey(ignore: true)
  _$$MessageParamImplCopyWith<_$MessageParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageParamContent _$MessageParamContentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'listMapStringDynamic':
      return MessageParamContentListMapStringDynamic.fromJson(json);
    case 'string':
      return MessageParamContentString.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MessageParamContent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MessageParamContent {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> value)
        listMapStringDynamic,
    required TResult Function(String value) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult? Function(String value)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageParamContentListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(MessageParamContentString value) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(MessageParamContentString value)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(MessageParamContentString value)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageParamContentCopyWith<$Res> {
  factory $MessageParamContentCopyWith(
          MessageParamContent value, $Res Function(MessageParamContent) then) =
      _$MessageParamContentCopyWithImpl<$Res, MessageParamContent>;
}

/// @nodoc
class _$MessageParamContentCopyWithImpl<$Res, $Val extends MessageParamContent>
    implements $MessageParamContentCopyWith<$Res> {
  _$MessageParamContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageParamContentListMapStringDynamicImplCopyWith<$Res> {
  factory _$$MessageParamContentListMapStringDynamicImplCopyWith(
          _$MessageParamContentListMapStringDynamicImpl value,
          $Res Function(_$MessageParamContentListMapStringDynamicImpl) then) =
      __$$MessageParamContentListMapStringDynamicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> value});
}

/// @nodoc
class __$$MessageParamContentListMapStringDynamicImplCopyWithImpl<$Res>
    extends _$MessageParamContentCopyWithImpl<$Res,
        _$MessageParamContentListMapStringDynamicImpl>
    implements _$$MessageParamContentListMapStringDynamicImplCopyWith<$Res> {
  __$$MessageParamContentListMapStringDynamicImplCopyWithImpl(
      _$MessageParamContentListMapStringDynamicImpl _value,
      $Res Function(_$MessageParamContentListMapStringDynamicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MessageParamContentListMapStringDynamicImpl(
      null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageParamContentListMapStringDynamicImpl
    extends MessageParamContentListMapStringDynamic {
  const _$MessageParamContentListMapStringDynamicImpl(
      final List<Map<String, dynamic>> value,
      {final String? $type})
      : _value = value,
        $type = $type ?? 'listMapStringDynamic',
        super._();

  factory _$MessageParamContentListMapStringDynamicImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageParamContentListMapStringDynamicImplFromJson(json);

  final List<Map<String, dynamic>> _value;
  @override
  List<Map<String, dynamic>> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MessageParamContent.listMapStringDynamic(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageParamContentListMapStringDynamicImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageParamContentListMapStringDynamicImplCopyWith<
          _$MessageParamContentListMapStringDynamicImpl>
      get copyWith =>
          __$$MessageParamContentListMapStringDynamicImplCopyWithImpl<
              _$MessageParamContentListMapStringDynamicImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> value)
        listMapStringDynamic,
    required TResult Function(String value) string,
  }) {
    return listMapStringDynamic(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult? Function(String value)? string,
  }) {
    return listMapStringDynamic?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) {
    if (listMapStringDynamic != null) {
      return listMapStringDynamic(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageParamContentListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(MessageParamContentString value) string,
  }) {
    return listMapStringDynamic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(MessageParamContentString value)? string,
  }) {
    return listMapStringDynamic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(MessageParamContentString value)? string,
    required TResult orElse(),
  }) {
    if (listMapStringDynamic != null) {
      return listMapStringDynamic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageParamContentListMapStringDynamicImplToJson(
      this,
    );
  }
}

abstract class MessageParamContentListMapStringDynamic
    extends MessageParamContent {
  const factory MessageParamContentListMapStringDynamic(
          final List<Map<String, dynamic>> value) =
      _$MessageParamContentListMapStringDynamicImpl;
  const MessageParamContentListMapStringDynamic._() : super._();

  factory MessageParamContentListMapStringDynamic.fromJson(
          Map<String, dynamic> json) =
      _$MessageParamContentListMapStringDynamicImpl.fromJson;

  @override
  List<Map<String, dynamic>> get value;
  @JsonKey(ignore: true)
  _$$MessageParamContentListMapStringDynamicImplCopyWith<
          _$MessageParamContentListMapStringDynamicImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageParamContentStringImplCopyWith<$Res> {
  factory _$$MessageParamContentStringImplCopyWith(
          _$MessageParamContentStringImpl value,
          $Res Function(_$MessageParamContentStringImpl) then) =
      __$$MessageParamContentStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$MessageParamContentStringImplCopyWithImpl<$Res>
    extends _$MessageParamContentCopyWithImpl<$Res,
        _$MessageParamContentStringImpl>
    implements _$$MessageParamContentStringImplCopyWith<$Res> {
  __$$MessageParamContentStringImplCopyWithImpl(
      _$MessageParamContentStringImpl _value,
      $Res Function(_$MessageParamContentStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MessageParamContentStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageParamContentStringImpl extends MessageParamContentString {
  const _$MessageParamContentStringImpl(this.value, {final String? $type})
      : $type = $type ?? 'string',
        super._();

  factory _$MessageParamContentStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageParamContentStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MessageParamContent.string(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageParamContentStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageParamContentStringImplCopyWith<_$MessageParamContentStringImpl>
      get copyWith => __$$MessageParamContentStringImplCopyWithImpl<
          _$MessageParamContentStringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> value)
        listMapStringDynamic,
    required TResult Function(String value) string,
  }) {
    return string(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult? Function(String value)? string,
  }) {
    return string?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> value)? listMapStringDynamic,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageParamContentListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(MessageParamContentString value) string,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(MessageParamContentString value)? string,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageParamContentListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(MessageParamContentString value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageParamContentStringImplToJson(
      this,
    );
  }
}

abstract class MessageParamContentString extends MessageParamContent {
  const factory MessageParamContentString(final String value) =
      _$MessageParamContentStringImpl;
  const MessageParamContentString._() : super._();

  factory MessageParamContentString.fromJson(Map<String, dynamic> json) =
      _$MessageParamContentStringImpl.fromJson;

  @override
  String get value;
  @JsonKey(ignore: true)
  _$$MessageParamContentStringImplCopyWith<_$MessageParamContentStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TextBlock _$TextBlockFromJson(Map<String, dynamic> json) {
  return _TextBlock.fromJson(json);
}

/// @nodoc
mixin _$TextBlock {
  /// No Description
  String get text => throw _privateConstructorUsedError;

  ///
  TextBlockType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextBlockCopyWith<TextBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextBlockCopyWith<$Res> {
  factory $TextBlockCopyWith(TextBlock value, $Res Function(TextBlock) then) =
      _$TextBlockCopyWithImpl<$Res, TextBlock>;
  @useResult
  $Res call({String text, TextBlockType type});
}

/// @nodoc
class _$TextBlockCopyWithImpl<$Res, $Val extends TextBlock>
    implements $TextBlockCopyWith<$Res> {
  _$TextBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextBlockType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextBlockImplCopyWith<$Res>
    implements $TextBlockCopyWith<$Res> {
  factory _$$TextBlockImplCopyWith(
          _$TextBlockImpl value, $Res Function(_$TextBlockImpl) then) =
      __$$TextBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, TextBlockType type});
}

/// @nodoc
class __$$TextBlockImplCopyWithImpl<$Res>
    extends _$TextBlockCopyWithImpl<$Res, _$TextBlockImpl>
    implements _$$TextBlockImplCopyWith<$Res> {
  __$$TextBlockImplCopyWithImpl(
      _$TextBlockImpl _value, $Res Function(_$TextBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$TextBlockImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextBlockType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextBlockImpl extends _TextBlock {
  const _$TextBlockImpl({required this.text, required this.type}) : super._();

  factory _$TextBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextBlockImplFromJson(json);

  /// No Description
  @override
  final String text;

  ///
  @override
  final TextBlockType type;

  @override
  String toString() {
    return 'TextBlock(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextBlockImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextBlockImplCopyWith<_$TextBlockImpl> get copyWith =>
      __$$TextBlockImplCopyWithImpl<_$TextBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextBlockImplToJson(
      this,
    );
  }
}

abstract class _TextBlock extends TextBlock {
  const factory _TextBlock(
      {required final String text,
      required final TextBlockType type}) = _$TextBlockImpl;
  const _TextBlock._() : super._();

  factory _TextBlock.fromJson(Map<String, dynamic> json) =
      _$TextBlockImpl.fromJson;

  @override

  /// No Description
  String get text;
  @override

  ///
  TextBlockType get type;
  @override
  @JsonKey(ignore: true)
  _$$TextBlockImplCopyWith<_$TextBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TextBlockParam _$TextBlockParamFromJson(Map<String, dynamic> json) {
  return _TextBlockParam.fromJson(json);
}

/// @nodoc
mixin _$TextBlockParam {
  /// No Description
  String get text => throw _privateConstructorUsedError;

  ///
  TextBlockParamType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextBlockParamCopyWith<TextBlockParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextBlockParamCopyWith<$Res> {
  factory $TextBlockParamCopyWith(
          TextBlockParam value, $Res Function(TextBlockParam) then) =
      _$TextBlockParamCopyWithImpl<$Res, TextBlockParam>;
  @useResult
  $Res call({String text, TextBlockParamType type});
}

/// @nodoc
class _$TextBlockParamCopyWithImpl<$Res, $Val extends TextBlockParam>
    implements $TextBlockParamCopyWith<$Res> {
  _$TextBlockParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextBlockParamType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextBlockParamImplCopyWith<$Res>
    implements $TextBlockParamCopyWith<$Res> {
  factory _$$TextBlockParamImplCopyWith(_$TextBlockParamImpl value,
          $Res Function(_$TextBlockParamImpl) then) =
      __$$TextBlockParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, TextBlockParamType type});
}

/// @nodoc
class __$$TextBlockParamImplCopyWithImpl<$Res>
    extends _$TextBlockParamCopyWithImpl<$Res, _$TextBlockParamImpl>
    implements _$$TextBlockParamImplCopyWith<$Res> {
  __$$TextBlockParamImplCopyWithImpl(
      _$TextBlockParamImpl _value, $Res Function(_$TextBlockParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$TextBlockParamImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextBlockParamType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextBlockParamImpl extends _TextBlockParam {
  const _$TextBlockParamImpl({required this.text, required this.type})
      : super._();

  factory _$TextBlockParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextBlockParamImplFromJson(json);

  /// No Description
  @override
  final String text;

  ///
  @override
  final TextBlockParamType type;

  @override
  String toString() {
    return 'TextBlockParam(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextBlockParamImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextBlockParamImplCopyWith<_$TextBlockParamImpl> get copyWith =>
      __$$TextBlockParamImplCopyWithImpl<_$TextBlockParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextBlockParamImplToJson(
      this,
    );
  }
}

abstract class _TextBlockParam extends TextBlockParam {
  const factory _TextBlockParam(
      {required final String text,
      required final TextBlockParamType type}) = _$TextBlockParamImpl;
  const _TextBlockParam._() : super._();

  factory _TextBlockParam.fromJson(Map<String, dynamic> json) =
      _$TextBlockParamImpl.fromJson;

  @override

  /// No Description
  String get text;
  @override

  ///
  TextBlockParamType get type;
  @override
  @JsonKey(ignore: true)
  _$$TextBlockParamImplCopyWith<_$TextBlockParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TextDelta _$TextDeltaFromJson(Map<String, dynamic> json) {
  return _TextDelta.fromJson(json);
}

/// @nodoc
mixin _$TextDelta {
  /// No Description
  String get text => throw _privateConstructorUsedError;

  ///
  TextDeltaType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextDeltaCopyWith<TextDelta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDeltaCopyWith<$Res> {
  factory $TextDeltaCopyWith(TextDelta value, $Res Function(TextDelta) then) =
      _$TextDeltaCopyWithImpl<$Res, TextDelta>;
  @useResult
  $Res call({String text, TextDeltaType type});
}

/// @nodoc
class _$TextDeltaCopyWithImpl<$Res, $Val extends TextDelta>
    implements $TextDeltaCopyWith<$Res> {
  _$TextDeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextDeltaType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextDeltaImplCopyWith<$Res>
    implements $TextDeltaCopyWith<$Res> {
  factory _$$TextDeltaImplCopyWith(
          _$TextDeltaImpl value, $Res Function(_$TextDeltaImpl) then) =
      __$$TextDeltaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, TextDeltaType type});
}

/// @nodoc
class __$$TextDeltaImplCopyWithImpl<$Res>
    extends _$TextDeltaCopyWithImpl<$Res, _$TextDeltaImpl>
    implements _$$TextDeltaImplCopyWith<$Res> {
  __$$TextDeltaImplCopyWithImpl(
      _$TextDeltaImpl _value, $Res Function(_$TextDeltaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$TextDeltaImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TextDeltaType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextDeltaImpl extends _TextDelta {
  const _$TextDeltaImpl({required this.text, required this.type}) : super._();

  factory _$TextDeltaImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextDeltaImplFromJson(json);

  /// No Description
  @override
  final String text;

  ///
  @override
  final TextDeltaType type;

  @override
  String toString() {
    return 'TextDelta(text: $text, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextDeltaImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDeltaImplCopyWith<_$TextDeltaImpl> get copyWith =>
      __$$TextDeltaImplCopyWithImpl<_$TextDeltaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextDeltaImplToJson(
      this,
    );
  }
}

abstract class _TextDelta extends TextDelta {
  const factory _TextDelta(
      {required final String text,
      required final TextDeltaType type}) = _$TextDeltaImpl;
  const _TextDelta._() : super._();

  factory _TextDelta.fromJson(Map<String, dynamic> json) =
      _$TextDeltaImpl.fromJson;

  @override

  /// No Description
  String get text;
  @override

  ///
  TextDeltaType get type;
  @override
  @JsonKey(ignore: true)
  _$$TextDeltaImplCopyWith<_$TextDeltaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  /// The number of input tokens which were used.
  @JsonKey(name: 'input_tokens')
  int get inputTokens => throw _privateConstructorUsedError;

  /// The number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTokens = null,
    Object? outputTokens = null,
  }) {
    return _then(_value.copyWith(
      inputTokens: null == inputTokens
          ? _value.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageImplCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$UsageImplCopyWith(
          _$UsageImpl value, $Res Function(_$UsageImpl) then) =
      __$$UsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'input_tokens') int inputTokens,
      @JsonKey(name: 'output_tokens') int outputTokens});
}

/// @nodoc
class __$$UsageImplCopyWithImpl<$Res>
    extends _$UsageCopyWithImpl<$Res, _$UsageImpl>
    implements _$$UsageImplCopyWith<$Res> {
  __$$UsageImplCopyWithImpl(
      _$UsageImpl _value, $Res Function(_$UsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTokens = null,
    Object? outputTokens = null,
  }) {
    return _then(_$UsageImpl(
      inputTokens: null == inputTokens
          ? _value.inputTokens
          : inputTokens // ignore: cast_nullable_to_non_nullable
              as int,
      outputTokens: null == outputTokens
          ? _value.outputTokens
          : outputTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageImpl extends _Usage {
  const _$UsageImpl(
      {@JsonKey(name: 'input_tokens') required this.inputTokens,
      @JsonKey(name: 'output_tokens') required this.outputTokens})
      : super._();

  factory _$UsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageImplFromJson(json);

  /// The number of input tokens which were used.
  @override
  @JsonKey(name: 'input_tokens')
  final int inputTokens;

  /// The number of output tokens which were used.
  @override
  @JsonKey(name: 'output_tokens')
  final int outputTokens;

  @override
  String toString() {
    return 'Usage(inputTokens: $inputTokens, outputTokens: $outputTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageImpl &&
            (identical(other.inputTokens, inputTokens) ||
                other.inputTokens == inputTokens) &&
            (identical(other.outputTokens, outputTokens) ||
                other.outputTokens == outputTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inputTokens, outputTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      __$$UsageImplCopyWithImpl<_$UsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageImplToJson(
      this,
    );
  }
}

abstract class _Usage extends Usage {
  const factory _Usage(
          {@JsonKey(name: 'input_tokens') required final int inputTokens,
          @JsonKey(name: 'output_tokens') required final int outputTokens}) =
      _$UsageImpl;
  const _Usage._() : super._();

  factory _Usage.fromJson(Map<String, dynamic> json) = _$UsageImpl.fromJson;

  @override

  /// The number of input tokens which were used.
  @JsonKey(name: 'input_tokens')
  int get inputTokens;
  @override

  /// The number of output tokens which were used.
  @JsonKey(name: 'output_tokens')
  int get outputTokens;
  @override
  @JsonKey(ignore: true)
  _$$UsageImplCopyWith<_$UsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageCreateParams _$MessageCreateParamsFromJson(Map<String, dynamic> json) {
  return _MessageCreateParams.fromJson(json);
}

/// @nodoc
mixin _$MessageCreateParams {
  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens => throw _privateConstructorUsedError;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<MessageParam> get messages => throw _privateConstructorUsedError;

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  MessageCreateParamsModel get model => throw _privateConstructorUsedError;

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  MessageCreateParamsMetadata? get metadata =>
      throw _privateConstructorUsedError;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences => throw _privateConstructorUsedError;

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  bool get stream => throw _privateConstructorUsedError;

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system => throw _privateConstructorUsedError;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCreateParamsCopyWith<MessageCreateParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCreateParamsCopyWith<$Res> {
  factory $MessageCreateParamsCopyWith(
          MessageCreateParams value, $Res Function(MessageCreateParams) then) =
      _$MessageCreateParamsCopyWithImpl<$Res, MessageCreateParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'max_tokens') int maxTokens,
      List<MessageParam> messages,
      MessageCreateParamsModel model,
      @JsonKey(includeIfNull: false) MessageCreateParamsMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      bool stream,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  $MessageCreateParamsMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$MessageCreateParamsCopyWithImpl<$Res, $Val extends MessageCreateParams>
    implements $MessageCreateParamsCopyWith<$Res> {
  _$MessageCreateParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTokens = null,
    Object? messages = null,
    Object? model = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? stream = null,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
  }) {
    return _then(_value.copyWith(
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageParam>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageCreateParamsModel,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageCreateParamsMetadata?,
      stopSequences: freezed == stopSequences
          ? _value.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCreateParamsMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MessageCreateParamsMetadataCopyWith<$Res>(_value.metadata!,
        (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageCreateParamsImplCopyWith<$Res>
    implements $MessageCreateParamsCopyWith<$Res> {
  factory _$$MessageCreateParamsImplCopyWith(_$MessageCreateParamsImpl value,
          $Res Function(_$MessageCreateParamsImpl) then) =
      __$$MessageCreateParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'max_tokens') int maxTokens,
      List<MessageParam> messages,
      MessageCreateParamsModel model,
      @JsonKey(includeIfNull: false) MessageCreateParamsMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      bool stream,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  @override
  $MessageCreateParamsMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$MessageCreateParamsImplCopyWithImpl<$Res>
    extends _$MessageCreateParamsCopyWithImpl<$Res, _$MessageCreateParamsImpl>
    implements _$$MessageCreateParamsImplCopyWith<$Res> {
  __$$MessageCreateParamsImplCopyWithImpl(_$MessageCreateParamsImpl _value,
      $Res Function(_$MessageCreateParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTokens = null,
    Object? messages = null,
    Object? model = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? stream = null,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
  }) {
    return _then(_$MessageCreateParamsImpl(
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageParam>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageCreateParamsModel,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageCreateParamsMetadata?,
      stopSequences: freezed == stopSequences
          ? _value._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stream: null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageCreateParamsImpl extends _MessageCreateParams {
  const _$MessageCreateParamsImpl(
      {@JsonKey(name: 'max_tokens') required this.maxTokens,
      required final List<MessageParam> messages,
      required this.model,
      @JsonKey(includeIfNull: false) this.metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      final List<String>? stopSequences,
      required this.stream,
      @JsonKey(includeIfNull: false) this.system,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) this.topK,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP})
      : _messages = messages,
        _stopSequences = stopSequences,
        super._();

  factory _$MessageCreateParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageCreateParamsImplFromJson(json);

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @override
  @JsonKey(name: 'max_tokens')
  final int maxTokens;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  final List<MessageParam> _messages;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  @override
  List<MessageParam> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  @override
  final MessageCreateParamsModel model;

  /// An object describing metadata about the request.
  @override
  @JsonKey(includeIfNull: false)
  final MessageCreateParamsMetadata? metadata;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  final List<String>? _stopSequences;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @override
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences {
    final value = _stopSequences;
    if (value == null) return null;
    if (_stopSequences is EqualUnmodifiableListView) return _stopSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  @override
  final bool stream;

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @override
  @JsonKey(includeIfNull: false)
  final String? system;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_k', includeIfNull: false)
  final int? topK;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  @override
  String toString() {
    return 'MessageCreateParams(maxTokens: $maxTokens, messages: $messages, model: $model, metadata: $metadata, stopSequences: $stopSequences, stream: $stream, system: $system, temperature: $temperature, topK: $topK, topP: $topP)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCreateParamsImpl &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      maxTokens,
      const DeepCollectionEquality().hash(_messages),
      model,
      metadata,
      const DeepCollectionEquality().hash(_stopSequences),
      stream,
      system,
      temperature,
      topK,
      topP);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageCreateParamsImplCopyWith<_$MessageCreateParamsImpl> get copyWith =>
      __$$MessageCreateParamsImplCopyWithImpl<_$MessageCreateParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCreateParamsImplToJson(
      this,
    );
  }
}

abstract class _MessageCreateParams extends MessageCreateParams {
  const factory _MessageCreateParams(
          {@JsonKey(name: 'max_tokens') required final int maxTokens,
          required final List<MessageParam> messages,
          required final MessageCreateParamsModel model,
          @JsonKey(includeIfNull: false)
          final MessageCreateParamsMetadata? metadata,
          @JsonKey(name: 'stop_sequences', includeIfNull: false)
          final List<String>? stopSequences,
          required final bool stream,
          @JsonKey(includeIfNull: false) final String? system,
          @JsonKey(includeIfNull: false) final double? temperature,
          @JsonKey(name: 'top_k', includeIfNull: false) final int? topK,
          @JsonKey(name: 'top_p', includeIfNull: false) final double? topP}) =
      _$MessageCreateParamsImpl;
  const _MessageCreateParams._() : super._();

  factory _MessageCreateParams.fromJson(Map<String, dynamic> json) =
      _$MessageCreateParamsImpl.fromJson;

  @override

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens;
  @override

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<MessageParam> get messages;
  @override

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  MessageCreateParamsModel get model;
  @override

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  MessageCreateParamsMetadata? get metadata;
  @override

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences;
  @override

  /// Whether to incrementally stream the response using server-sent events.
  ///
  /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
  /// details.
  bool get stream;
  @override

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system;
  @override

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK;
  @override

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override
  @JsonKey(ignore: true)
  _$$MessageCreateParamsImplCopyWith<_$MessageCreateParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageCreateParamsMetadata _$MessageCreateParamsMetadataFromJson(
    Map<String, dynamic> json) {
  return _MessageCreateParamsMetadata.fromJson(json);
}

/// @nodoc
mixin _$MessageCreateParamsMetadata {
  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCreateParamsMetadataCopyWith<MessageCreateParamsMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCreateParamsMetadataCopyWith<$Res> {
  factory $MessageCreateParamsMetadataCopyWith(
          MessageCreateParamsMetadata value,
          $Res Function(MessageCreateParamsMetadata) then) =
      _$MessageCreateParamsMetadataCopyWithImpl<$Res,
          MessageCreateParamsMetadata>;
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class _$MessageCreateParamsMetadataCopyWithImpl<$Res,
        $Val extends MessageCreateParamsMetadata>
    implements $MessageCreateParamsMetadataCopyWith<$Res> {
  _$MessageCreateParamsMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageCreateParamsMetadataImplCopyWith<$Res>
    implements $MessageCreateParamsMetadataCopyWith<$Res> {
  factory _$$MessageCreateParamsMetadataImplCopyWith(
          _$MessageCreateParamsMetadataImpl value,
          $Res Function(_$MessageCreateParamsMetadataImpl) then) =
      __$$MessageCreateParamsMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class __$$MessageCreateParamsMetadataImplCopyWithImpl<$Res>
    extends _$MessageCreateParamsMetadataCopyWithImpl<$Res,
        _$MessageCreateParamsMetadataImpl>
    implements _$$MessageCreateParamsMetadataImplCopyWith<$Res> {
  __$$MessageCreateParamsMetadataImplCopyWithImpl(
      _$MessageCreateParamsMetadataImpl _value,
      $Res Function(_$MessageCreateParamsMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$MessageCreateParamsMetadataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageCreateParamsMetadataImpl extends _MessageCreateParamsMetadata {
  const _$MessageCreateParamsMetadataImpl(
      {@JsonKey(name: 'user_id', includeIfNull: false) this.userId})
      : super._();

  factory _$MessageCreateParamsMetadataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageCreateParamsMetadataImplFromJson(json);

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  final String? userId;

  @override
  String toString() {
    return 'MessageCreateParamsMetadata(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCreateParamsMetadataImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageCreateParamsMetadataImplCopyWith<_$MessageCreateParamsMetadataImpl>
      get copyWith => __$$MessageCreateParamsMetadataImplCopyWithImpl<
          _$MessageCreateParamsMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCreateParamsMetadataImplToJson(
      this,
    );
  }
}

abstract class _MessageCreateParamsMetadata
    extends MessageCreateParamsMetadata {
  const factory _MessageCreateParamsMetadata(
      {@JsonKey(name: 'user_id', includeIfNull: false)
      final String? userId}) = _$MessageCreateParamsMetadataImpl;
  const _MessageCreateParamsMetadata._() : super._();

  factory _MessageCreateParamsMetadata.fromJson(Map<String, dynamic> json) =
      _$MessageCreateParamsMetadataImpl.fromJson;

  @override

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$MessageCreateParamsMetadataImplCopyWith<_$MessageCreateParamsMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageCreateParamsNonStreaming _$MessageCreateParamsNonStreamingFromJson(
    Map<String, dynamic> json) {
  return _MessageCreateParamsNonStreaming.fromJson(json);
}

/// @nodoc
mixin _$MessageCreateParamsNonStreaming {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCreateParamsNonStreamingCopyWith<$Res> {
  factory $MessageCreateParamsNonStreamingCopyWith(
          MessageCreateParamsNonStreaming value,
          $Res Function(MessageCreateParamsNonStreaming) then) =
      _$MessageCreateParamsNonStreamingCopyWithImpl<$Res,
          MessageCreateParamsNonStreaming>;
}

/// @nodoc
class _$MessageCreateParamsNonStreamingCopyWithImpl<$Res,
        $Val extends MessageCreateParamsNonStreaming>
    implements $MessageCreateParamsNonStreamingCopyWith<$Res> {
  _$MessageCreateParamsNonStreamingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageCreateParamsNonStreamingImplCopyWith<$Res> {
  factory _$$MessageCreateParamsNonStreamingImplCopyWith(
          _$MessageCreateParamsNonStreamingImpl value,
          $Res Function(_$MessageCreateParamsNonStreamingImpl) then) =
      __$$MessageCreateParamsNonStreamingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessageCreateParamsNonStreamingImplCopyWithImpl<$Res>
    extends _$MessageCreateParamsNonStreamingCopyWithImpl<$Res,
        _$MessageCreateParamsNonStreamingImpl>
    implements _$$MessageCreateParamsNonStreamingImplCopyWith<$Res> {
  __$$MessageCreateParamsNonStreamingImplCopyWithImpl(
      _$MessageCreateParamsNonStreamingImpl _value,
      $Res Function(_$MessageCreateParamsNonStreamingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$MessageCreateParamsNonStreamingImpl
    extends _MessageCreateParamsNonStreaming {
  const _$MessageCreateParamsNonStreamingImpl() : super._();

  factory _$MessageCreateParamsNonStreamingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageCreateParamsNonStreamingImplFromJson(json);

  @override
  String toString() {
    return 'MessageCreateParamsNonStreaming()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCreateParamsNonStreamingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCreateParamsNonStreamingImplToJson(
      this,
    );
  }
}

abstract class _MessageCreateParamsNonStreaming
    extends MessageCreateParamsNonStreaming {
  const factory _MessageCreateParamsNonStreaming() =
      _$MessageCreateParamsNonStreamingImpl;
  const _MessageCreateParamsNonStreaming._() : super._();

  factory _MessageCreateParamsNonStreaming.fromJson(Map<String, dynamic> json) =
      _$MessageCreateParamsNonStreamingImpl.fromJson;
}

MessageCreateParamsStreaming _$MessageCreateParamsStreamingFromJson(
    Map<String, dynamic> json) {
  return _MessageCreateParamsStreaming.fromJson(json);
}

/// @nodoc
mixin _$MessageCreateParamsStreaming {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCreateParamsStreamingCopyWith<$Res> {
  factory $MessageCreateParamsStreamingCopyWith(
          MessageCreateParamsStreaming value,
          $Res Function(MessageCreateParamsStreaming) then) =
      _$MessageCreateParamsStreamingCopyWithImpl<$Res,
          MessageCreateParamsStreaming>;
}

/// @nodoc
class _$MessageCreateParamsStreamingCopyWithImpl<$Res,
        $Val extends MessageCreateParamsStreaming>
    implements $MessageCreateParamsStreamingCopyWith<$Res> {
  _$MessageCreateParamsStreamingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageCreateParamsStreamingImplCopyWith<$Res> {
  factory _$$MessageCreateParamsStreamingImplCopyWith(
          _$MessageCreateParamsStreamingImpl value,
          $Res Function(_$MessageCreateParamsStreamingImpl) then) =
      __$$MessageCreateParamsStreamingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessageCreateParamsStreamingImplCopyWithImpl<$Res>
    extends _$MessageCreateParamsStreamingCopyWithImpl<$Res,
        _$MessageCreateParamsStreamingImpl>
    implements _$$MessageCreateParamsStreamingImplCopyWith<$Res> {
  __$$MessageCreateParamsStreamingImplCopyWithImpl(
      _$MessageCreateParamsStreamingImpl _value,
      $Res Function(_$MessageCreateParamsStreamingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$MessageCreateParamsStreamingImpl extends _MessageCreateParamsStreaming {
  const _$MessageCreateParamsStreamingImpl() : super._();

  factory _$MessageCreateParamsStreamingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageCreateParamsStreamingImplFromJson(json);

  @override
  String toString() {
    return 'MessageCreateParamsStreaming()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCreateParamsStreamingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCreateParamsStreamingImplToJson(
      this,
    );
  }
}

abstract class _MessageCreateParamsStreaming
    extends MessageCreateParamsStreaming {
  const factory _MessageCreateParamsStreaming() =
      _$MessageCreateParamsStreamingImpl;
  const _MessageCreateParamsStreaming._() : super._();

  factory _MessageCreateParamsStreaming.fromJson(Map<String, dynamic> json) =
      _$MessageCreateParamsStreamingImpl.fromJson;
}

MessageStreamParams _$MessageStreamParamsFromJson(Map<String, dynamic> json) {
  return _MessageStreamParams.fromJson(json);
}

/// @nodoc
mixin _$MessageStreamParams {
  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens => throw _privateConstructorUsedError;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<MessageParam> get messages => throw _privateConstructorUsedError;

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  MessageStreamParamsModel get model => throw _privateConstructorUsedError;

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  MessageStreamParamsMetadata? get metadata =>
      throw _privateConstructorUsedError;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences => throw _privateConstructorUsedError;

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system => throw _privateConstructorUsedError;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK => throw _privateConstructorUsedError;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageStreamParamsCopyWith<MessageStreamParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamParamsCopyWith<$Res> {
  factory $MessageStreamParamsCopyWith(
          MessageStreamParams value, $Res Function(MessageStreamParams) then) =
      _$MessageStreamParamsCopyWithImpl<$Res, MessageStreamParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'max_tokens') int maxTokens,
      List<MessageParam> messages,
      MessageStreamParamsModel model,
      @JsonKey(includeIfNull: false) MessageStreamParamsMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  $MessageStreamParamsMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$MessageStreamParamsCopyWithImpl<$Res, $Val extends MessageStreamParams>
    implements $MessageStreamParamsCopyWith<$Res> {
  _$MessageStreamParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTokens = null,
    Object? messages = null,
    Object? model = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
  }) {
    return _then(_value.copyWith(
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageParam>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageStreamParamsModel,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageStreamParamsMetadata?,
      stopSequences: freezed == stopSequences
          ? _value.stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageStreamParamsMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MessageStreamParamsMetadataCopyWith<$Res>(_value.metadata!,
        (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageStreamParamsImplCopyWith<$Res>
    implements $MessageStreamParamsCopyWith<$Res> {
  factory _$$MessageStreamParamsImplCopyWith(_$MessageStreamParamsImpl value,
          $Res Function(_$MessageStreamParamsImpl) then) =
      __$$MessageStreamParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'max_tokens') int maxTokens,
      List<MessageParam> messages,
      MessageStreamParamsModel model,
      @JsonKey(includeIfNull: false) MessageStreamParamsMetadata? metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      List<String>? stopSequences,
      @JsonKey(includeIfNull: false) String? system,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) int? topK,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  @override
  $MessageStreamParamsMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$MessageStreamParamsImplCopyWithImpl<$Res>
    extends _$MessageStreamParamsCopyWithImpl<$Res, _$MessageStreamParamsImpl>
    implements _$$MessageStreamParamsImplCopyWith<$Res> {
  __$$MessageStreamParamsImplCopyWithImpl(_$MessageStreamParamsImpl _value,
      $Res Function(_$MessageStreamParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTokens = null,
    Object? messages = null,
    Object? model = null,
    Object? metadata = freezed,
    Object? stopSequences = freezed,
    Object? system = freezed,
    Object? temperature = freezed,
    Object? topK = freezed,
    Object? topP = freezed,
  }) {
    return _then(_$MessageStreamParamsImpl(
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageParam>,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageStreamParamsModel,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageStreamParamsMetadata?,
      stopSequences: freezed == stopSequences
          ? _value._stopSequences
          : stopSequences // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStreamParamsImpl extends _MessageStreamParams {
  const _$MessageStreamParamsImpl(
      {@JsonKey(name: 'max_tokens') required this.maxTokens,
      required final List<MessageParam> messages,
      required this.model,
      @JsonKey(includeIfNull: false) this.metadata,
      @JsonKey(name: 'stop_sequences', includeIfNull: false)
      final List<String>? stopSequences,
      @JsonKey(includeIfNull: false) this.system,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(name: 'top_k', includeIfNull: false) this.topK,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP})
      : _messages = messages,
        _stopSequences = stopSequences,
        super._();

  factory _$MessageStreamParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStreamParamsImplFromJson(json);

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @override
  @JsonKey(name: 'max_tokens')
  final int maxTokens;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  final List<MessageParam> _messages;

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  @override
  List<MessageParam> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  @override
  final MessageStreamParamsModel model;

  /// An object describing metadata about the request.
  @override
  @JsonKey(includeIfNull: false)
  final MessageStreamParamsMetadata? metadata;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  final List<String>? _stopSequences;

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @override
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences {
    final value = _stopSequences;
    if (value == null) return null;
    if (_stopSequences is EqualUnmodifiableListView) return _stopSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @override
  @JsonKey(includeIfNull: false)
  final String? system;

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_k', includeIfNull: false)
  final int? topK;

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  @override
  String toString() {
    return 'MessageStreamParams(maxTokens: $maxTokens, messages: $messages, model: $model, metadata: $metadata, stopSequences: $stopSequences, system: $system, temperature: $temperature, topK: $topK, topP: $topP)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStreamParamsImpl &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality()
                .equals(other._stopSequences, _stopSequences) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.topP, topP) || other.topP == topP));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      maxTokens,
      const DeepCollectionEquality().hash(_messages),
      model,
      metadata,
      const DeepCollectionEquality().hash(_stopSequences),
      system,
      temperature,
      topK,
      topP);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStreamParamsImplCopyWith<_$MessageStreamParamsImpl> get copyWith =>
      __$$MessageStreamParamsImplCopyWithImpl<_$MessageStreamParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStreamParamsImplToJson(
      this,
    );
  }
}

abstract class _MessageStreamParams extends MessageStreamParams {
  const factory _MessageStreamParams(
          {@JsonKey(name: 'max_tokens') required final int maxTokens,
          required final List<MessageParam> messages,
          required final MessageStreamParamsModel model,
          @JsonKey(includeIfNull: false)
          final MessageStreamParamsMetadata? metadata,
          @JsonKey(name: 'stop_sequences', includeIfNull: false)
          final List<String>? stopSequences,
          @JsonKey(includeIfNull: false) final String? system,
          @JsonKey(includeIfNull: false) final double? temperature,
          @JsonKey(name: 'top_k', includeIfNull: false) final int? topK,
          @JsonKey(name: 'top_p', includeIfNull: false) final double? topP}) =
      _$MessageStreamParamsImpl;
  const _MessageStreamParams._() : super._();

  factory _MessageStreamParams.fromJson(Map<String, dynamic> json) =
      _$MessageStreamParamsImpl.fromJson;

  @override

  /// The maximum number of tokens to generate before stopping.
  ///
  /// Note that our models may stop _before_ reaching this maximum. This parameter
  /// only specifies the absolute maximum number of tokens to generate.
  ///
  /// Different models have different maximum values for this parameter. See
  /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
  @JsonKey(name: 'max_tokens')
  int get maxTokens;
  @override

  /// Input messages.
  ///
  /// Our models are trained to operate on alternating `user` and `assistant`
  /// conversational turns. When creating a new `Message`, you specify the prior
  /// conversational turns with the `messages` parameter, and the model then generates
  /// the next `Message` in the conversation.
  ///
  /// Each input message must be an object with a `role` and `content`. You can
  /// specify a single `user`-role message, or you can include multiple `user` and
  /// `assistant` messages. The first message must always use the `user` role.
  ///
  /// If the final message uses the `assistant` role, the response content will
  /// continue immediately from the content in that message. This can be used to
  /// constrain part of the model's response.
  ///
  /// Example with a single `user` message:
  ///
  /// ```json
  /// [{ "role": "user", "content": "Hello, Claude" }]
  /// ```
  ///
  /// Example with multiple conversational turns:
  ///
  /// ```json
  /// [
  ///   { "role": "user", "content": "Hello there." },
  ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
  ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
  /// ]
  /// ```
  ///
  /// Example with a partially-filled response from Claude:
  ///
  /// ```json
  /// [
  ///   {
  ///     "role": "user",
  ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
  ///   },
  ///   { "role": "assistant", "content": "The best answer is (" }
  /// ]
  /// ```
  ///
  /// Each input message `content` may be either a single `string` or an array of
  /// content blocks, where each block has a specific `type`. Using a `string` for
  /// `content` is shorthand for an array of one content block of type `"text"`. The
  /// following input messages are equivalent:
  ///
  /// ```json
  /// { "role": "user", "content": "Hello, Claude" }
  /// ```
  ///
  /// ```json
  /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
  /// ```
  ///
  /// Starting with Claude 3 models, you can also send image content blocks:
  ///
  /// ```json
  /// {
  ///   "role": "user",
  ///   "content": [
  ///     {
  ///       "type": "image",
  ///       "source": {
  ///         "type": "base64",
  ///         "media_type": "image/jpeg",
  ///         "data": "/9j/4AAQSkZJRg..."
  ///       }
  ///     },
  ///     { "type": "text", "text": "What is in this image?" }
  ///   ]
  /// }
  /// ```
  ///
  /// We currently support the `base64` source type for images, and the `image/jpeg`,
  /// `image/png`, `image/gif`, and `image/webp` media types.
  ///
  /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
  /// input examples.
  ///
  /// Note that if you want to include a
  /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
  /// the top-level `system` parameter — there is no `"system"` role for input
  /// messages in the Messages API.
  List<MessageParam> get messages;
  @override

  /// The model that will complete your prompt.
  ///
  /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
  /// details and options.
  MessageStreamParamsModel get model;
  @override

  /// An object describing metadata about the request.
  @JsonKey(includeIfNull: false)
  MessageStreamParamsMetadata? get metadata;
  @override

  /// Custom text sequences that will cause the model to stop generating.
  ///
  /// Our models will normally stop when they have naturally completed their turn,
  /// which will result in a response `stop_reason` of `"end_turn"`.
  ///
  /// If you want the model to stop generating when it encounters custom strings of
  /// text, you can use the `stop_sequences` parameter. If the model encounters one of
  /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
  /// and the response `stop_sequence` value will contain the matched stop sequence.
  @JsonKey(name: 'stop_sequences', includeIfNull: false)
  List<String>? get stopSequences;
  @override

  /// System prompt.
  ///
  /// A system prompt is a way of providing context and instructions to Claude, such
  /// as specifying a particular goal or role. See our
  /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
  @JsonKey(includeIfNull: false)
  String? get system;
  @override

  /// Amount of randomness injected into the response.
  ///
  /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
  /// for analytical / multiple choice, and closer to `1.0` for creative and
  /// generative tasks.
  ///
  /// Note that even with `temperature` of `0.0`, the results will not be fully
  /// deterministic.
  @JsonKey(includeIfNull: false)
  double? get temperature;
  @override

  /// Only sample from the top K options for each subsequent token.
  ///
  /// Used to remove "long tail" low probability responses.
  /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_k', includeIfNull: false)
  int? get topK;
  @override

  /// Use nucleus sampling.
  ///
  /// In nucleus sampling, we compute the cumulative distribution over all the options
  /// for each subsequent token in decreasing probability order and cut it off once it
  /// reaches a particular probability specified by `top_p`. You should either alter
  /// `temperature` or `top_p`, but not both.
  ///
  /// Recommended for advanced use cases only. You usually only need to use
  /// `temperature`.
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;
  @override
  @JsonKey(ignore: true)
  _$$MessageStreamParamsImplCopyWith<_$MessageStreamParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageStreamParamsMetadata _$MessageStreamParamsMetadataFromJson(
    Map<String, dynamic> json) {
  return _MessageStreamParamsMetadata.fromJson(json);
}

/// @nodoc
mixin _$MessageStreamParamsMetadata {
  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageStreamParamsMetadataCopyWith<MessageStreamParamsMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamParamsMetadataCopyWith<$Res> {
  factory $MessageStreamParamsMetadataCopyWith(
          MessageStreamParamsMetadata value,
          $Res Function(MessageStreamParamsMetadata) then) =
      _$MessageStreamParamsMetadataCopyWithImpl<$Res,
          MessageStreamParamsMetadata>;
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class _$MessageStreamParamsMetadataCopyWithImpl<$Res,
        $Val extends MessageStreamParamsMetadata>
    implements $MessageStreamParamsMetadataCopyWith<$Res> {
  _$MessageStreamParamsMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageStreamParamsMetadataImplCopyWith<$Res>
    implements $MessageStreamParamsMetadataCopyWith<$Res> {
  factory _$$MessageStreamParamsMetadataImplCopyWith(
          _$MessageStreamParamsMetadataImpl value,
          $Res Function(_$MessageStreamParamsMetadataImpl) then) =
      __$$MessageStreamParamsMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id', includeIfNull: false) String? userId});
}

/// @nodoc
class __$$MessageStreamParamsMetadataImplCopyWithImpl<$Res>
    extends _$MessageStreamParamsMetadataCopyWithImpl<$Res,
        _$MessageStreamParamsMetadataImpl>
    implements _$$MessageStreamParamsMetadataImplCopyWith<$Res> {
  __$$MessageStreamParamsMetadataImplCopyWithImpl(
      _$MessageStreamParamsMetadataImpl _value,
      $Res Function(_$MessageStreamParamsMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$MessageStreamParamsMetadataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStreamParamsMetadataImpl extends _MessageStreamParamsMetadata {
  const _$MessageStreamParamsMetadataImpl(
      {@JsonKey(name: 'user_id', includeIfNull: false) this.userId})
      : super._();

  factory _$MessageStreamParamsMetadataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MessageStreamParamsMetadataImplFromJson(json);

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  final String? userId;

  @override
  String toString() {
    return 'MessageStreamParamsMetadata(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStreamParamsMetadataImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStreamParamsMetadataImplCopyWith<_$MessageStreamParamsMetadataImpl>
      get copyWith => __$$MessageStreamParamsMetadataImplCopyWithImpl<
          _$MessageStreamParamsMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStreamParamsMetadataImplToJson(
      this,
    );
  }
}

abstract class _MessageStreamParamsMetadata
    extends MessageStreamParamsMetadata {
  const factory _MessageStreamParamsMetadata(
      {@JsonKey(name: 'user_id', includeIfNull: false)
      final String? userId}) = _$MessageStreamParamsMetadataImpl;
  const _MessageStreamParamsMetadata._() : super._();

  factory _MessageStreamParamsMetadata.fromJson(Map<String, dynamic> json) =
      _$MessageStreamParamsMetadataImpl.fromJson;

  @override

  /// An external identifier for the user who is associated with the request.
  ///
  /// This should be a uuid, hash value, or other opaque identifier. Anthropic may use
  /// this id to help detect abuse. Do not include any identifying information such as
  /// name, email address, or phone number.
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$MessageStreamParamsMetadataImplCopyWith<_$MessageStreamParamsMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MessageStreamEvent _$MessageStreamEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'message_start_event':
      return MessageStartEvent.fromJson(json);
    case 'message_delta_event':
      return MessageDeltaEvent.fromJson(json);
    case 'message_stop_event':
      return MessageStopEvent.fromJson(json);
    case 'content_block_start_event':
      return ContentBlockStartEvent.fromJson(json);
    case 'content_block_delta_event':
      return ContentBlockDeltaEvent.fromJson(json);
    case 'content_block_stop_event':
      return ContentBlockStopEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'MessageStreamEvent',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$MessageStreamEvent {
  ///
  Enum get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStreamEventCopyWith<$Res> {
  factory $MessageStreamEventCopyWith(
          MessageStreamEvent value, $Res Function(MessageStreamEvent) then) =
      _$MessageStreamEventCopyWithImpl<$Res, MessageStreamEvent>;
}

/// @nodoc
class _$MessageStreamEventCopyWithImpl<$Res, $Val extends MessageStreamEvent>
    implements $MessageStreamEventCopyWith<$Res> {
  _$MessageStreamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageStartEventImplCopyWith<$Res> {
  factory _$$MessageStartEventImplCopyWith(_$MessageStartEventImpl value,
          $Res Function(_$MessageStartEventImpl) then) =
      __$$MessageStartEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Message message, MessageStartEventType type});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$MessageStartEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageStartEventImpl>
    implements _$$MessageStartEventImplCopyWith<$Res> {
  __$$MessageStartEventImplCopyWithImpl(_$MessageStartEventImpl _value,
      $Res Function(_$MessageStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_$MessageStartEventImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStartEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStartEventImpl extends MessageStartEvent {
  const _$MessageStartEventImpl({required this.message, required this.type})
      : super._();

  factory _$MessageStartEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStartEventImplFromJson(json);

  /// No Description
  @override
  final Message message;

  ///
  @override
  final MessageStartEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.messageStartEvent(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStartEventImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStartEventImplCopyWith<_$MessageStartEventImpl> get copyWith =>
      __$$MessageStartEventImplCopyWithImpl<_$MessageStartEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return messageStartEvent(message, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return messageStartEvent?.call(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageStartEvent != null) {
      return messageStartEvent(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return messageStartEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return messageStartEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageStartEvent != null) {
      return messageStartEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStartEventImplToJson(
      this,
    );
  }
}

abstract class MessageStartEvent extends MessageStreamEvent {
  const factory MessageStartEvent(
      {required final Message message,
      required final MessageStartEventType type}) = _$MessageStartEventImpl;
  const MessageStartEvent._() : super._();

  factory MessageStartEvent.fromJson(Map<String, dynamic> json) =
      _$MessageStartEventImpl.fromJson;

  /// No Description
  Message get message;
  @override

  ///
  MessageStartEventType get type;
  @JsonKey(ignore: true)
  _$$MessageStartEventImplCopyWith<_$MessageStartEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageDeltaEventImplCopyWith<$Res> {
  factory _$$MessageDeltaEventImplCopyWith(_$MessageDeltaEventImpl value,
          $Res Function(_$MessageDeltaEventImpl) then) =
      __$$MessageDeltaEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MessageDeltaEventDelta delta,
      MessageDeltaEventType type,
      MessageDeltaUsage usage});

  $MessageDeltaEventDeltaCopyWith<$Res> get delta;
  $MessageDeltaUsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$MessageDeltaEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageDeltaEventImpl>
    implements _$$MessageDeltaEventImplCopyWith<$Res> {
  __$$MessageDeltaEventImplCopyWithImpl(_$MessageDeltaEventImpl _value,
      $Res Function(_$MessageDeltaEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? type = null,
    Object? usage = null,
  }) {
    return _then(_$MessageDeltaEventImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as MessageDeltaEventDelta,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageDeltaEventType,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as MessageDeltaUsage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDeltaEventDeltaCopyWith<$Res> get delta {
    return $MessageDeltaEventDeltaCopyWith<$Res>(_value.delta, (value) {
      return _then(_value.copyWith(delta: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDeltaUsageCopyWith<$Res> get usage {
    return $MessageDeltaUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDeltaEventImpl extends MessageDeltaEvent {
  const _$MessageDeltaEventImpl(
      {required this.delta, required this.type, required this.usage})
      : super._();

  factory _$MessageDeltaEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDeltaEventImplFromJson(json);

  /// No Description
  @override
  final MessageDeltaEventDelta delta;

  ///
  @override
  final MessageDeltaEventType type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  @override
  final MessageDeltaUsage usage;

  @override
  String toString() {
    return 'MessageStreamEvent.messageDeltaEvent(delta: $delta, type: $type, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDeltaEventImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, delta, type, usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDeltaEventImplCopyWith<_$MessageDeltaEventImpl> get copyWith =>
      __$$MessageDeltaEventImplCopyWithImpl<_$MessageDeltaEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return messageDeltaEvent(delta, type, usage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return messageDeltaEvent?.call(delta, type, usage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageDeltaEvent != null) {
      return messageDeltaEvent(delta, type, usage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return messageDeltaEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return messageDeltaEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageDeltaEvent != null) {
      return messageDeltaEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDeltaEventImplToJson(
      this,
    );
  }
}

abstract class MessageDeltaEvent extends MessageStreamEvent {
  const factory MessageDeltaEvent(
      {required final MessageDeltaEventDelta delta,
      required final MessageDeltaEventType type,
      required final MessageDeltaUsage usage}) = _$MessageDeltaEventImpl;
  const MessageDeltaEvent._() : super._();

  factory MessageDeltaEvent.fromJson(Map<String, dynamic> json) =
      _$MessageDeltaEventImpl.fromJson;

  /// No Description
  MessageDeltaEventDelta get delta;
  @override

  ///
  MessageDeltaEventType get type;

  /// Billing and rate-limit usage.
  ///
  /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
  /// underlying cost to our systems.
  ///
  /// Under the hood, the API transforms requests into a format suitable for the
  /// model. The model's output then goes through a parsing stage before becoming an
  /// API response. As a result, the token counts in `usage` will not match one-to-one
  /// with the exact visible content of an API request or response.
  ///
  /// For example, `output_tokens` will be non-zero, even for an empty string response
  /// from Claude.
  MessageDeltaUsage get usage;
  @JsonKey(ignore: true)
  _$$MessageDeltaEventImplCopyWith<_$MessageDeltaEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageStopEventImplCopyWith<$Res> {
  factory _$$MessageStopEventImplCopyWith(_$MessageStopEventImpl value,
          $Res Function(_$MessageStopEventImpl) then) =
      __$$MessageStopEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageStopEventType type});
}

/// @nodoc
class __$$MessageStopEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$MessageStopEventImpl>
    implements _$$MessageStopEventImplCopyWith<$Res> {
  __$$MessageStopEventImplCopyWithImpl(_$MessageStopEventImpl _value,
      $Res Function(_$MessageStopEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$MessageStopEventImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageStopEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStopEventImpl extends MessageStopEvent {
  const _$MessageStopEventImpl({required this.type}) : super._();

  factory _$MessageStopEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStopEventImplFromJson(json);

  ///
  @override
  final MessageStopEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.messageStopEvent(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStopEventImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStopEventImplCopyWith<_$MessageStopEventImpl> get copyWith =>
      __$$MessageStopEventImplCopyWithImpl<_$MessageStopEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return messageStopEvent(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return messageStopEvent?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageStopEvent != null) {
      return messageStopEvent(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return messageStopEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return messageStopEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (messageStopEvent != null) {
      return messageStopEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStopEventImplToJson(
      this,
    );
  }
}

abstract class MessageStopEvent extends MessageStreamEvent {
  const factory MessageStopEvent({required final MessageStopEventType type}) =
      _$MessageStopEventImpl;
  const MessageStopEvent._() : super._();

  factory MessageStopEvent.fromJson(Map<String, dynamic> json) =
      _$MessageStopEventImpl.fromJson;

  @override

  ///
  MessageStopEventType get type;
  @JsonKey(ignore: true)
  _$$MessageStopEventImplCopyWith<_$MessageStopEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockStartEventImplCopyWith<$Res> {
  factory _$$ContentBlockStartEventImplCopyWith(
          _$ContentBlockStartEventImpl value,
          $Res Function(_$ContentBlockStartEventImpl) then) =
      __$$ContentBlockStartEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(name: 'content_block') TextBlock contentBlock,
      int index,
      ContentBlockStartEventType type});

  $TextBlockCopyWith<$Res> get contentBlock;
}

/// @nodoc
class __$$ContentBlockStartEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockStartEventImpl>
    implements _$$ContentBlockStartEventImplCopyWith<$Res> {
  __$$ContentBlockStartEventImplCopyWithImpl(
      _$ContentBlockStartEventImpl _value,
      $Res Function(_$ContentBlockStartEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentBlock = null,
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockStartEventImpl(
      contentBlock: null == contentBlock
          ? _value.contentBlock
          : contentBlock // ignore: cast_nullable_to_non_nullable
              as TextBlock,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentBlockStartEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TextBlockCopyWith<$Res> get contentBlock {
    return $TextBlockCopyWith<$Res>(_value.contentBlock, (value) {
      return _then(_value.copyWith(contentBlock: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockStartEventImpl extends ContentBlockStartEvent {
  const _$ContentBlockStartEventImpl(
      {@JsonKey(name: 'content_block') required this.contentBlock,
      required this.index,
      required this.type})
      : super._();

  factory _$ContentBlockStartEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockStartEventImplFromJson(json);

  /// No Description
  @override
  @JsonKey(name: 'content_block')
  final TextBlock contentBlock;

  /// No Description
  @override
  final int index;

  ///
  @override
  final ContentBlockStartEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockStartEvent(contentBlock: $contentBlock, index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockStartEventImpl &&
            (identical(other.contentBlock, contentBlock) ||
                other.contentBlock == contentBlock) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentBlock, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockStartEventImplCopyWith<_$ContentBlockStartEventImpl>
      get copyWith => __$$ContentBlockStartEventImplCopyWithImpl<
          _$ContentBlockStartEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return contentBlockStartEvent(contentBlock, index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return contentBlockStartEvent?.call(contentBlock, index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockStartEvent != null) {
      return contentBlockStartEvent(contentBlock, index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return contentBlockStartEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return contentBlockStartEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockStartEvent != null) {
      return contentBlockStartEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockStartEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockStartEvent extends MessageStreamEvent {
  const factory ContentBlockStartEvent(
      {@JsonKey(name: 'content_block') required final TextBlock contentBlock,
      required final int index,
      required final ContentBlockStartEventType
          type}) = _$ContentBlockStartEventImpl;
  const ContentBlockStartEvent._() : super._();

  factory ContentBlockStartEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockStartEventImpl.fromJson;

  /// No Description
  @JsonKey(name: 'content_block')
  TextBlock get contentBlock;

  /// No Description
  int get index;
  @override

  ///
  ContentBlockStartEventType get type;
  @JsonKey(ignore: true)
  _$$ContentBlockStartEventImplCopyWith<_$ContentBlockStartEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockDeltaEventImplCopyWith<$Res> {
  factory _$$ContentBlockDeltaEventImplCopyWith(
          _$ContentBlockDeltaEventImpl value,
          $Res Function(_$ContentBlockDeltaEventImpl) then) =
      __$$ContentBlockDeltaEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextDelta delta, int index, ContentBlockDeltaEventType type});

  $TextDeltaCopyWith<$Res> get delta;
}

/// @nodoc
class __$$ContentBlockDeltaEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockDeltaEventImpl>
    implements _$$ContentBlockDeltaEventImplCopyWith<$Res> {
  __$$ContentBlockDeltaEventImplCopyWithImpl(
      _$ContentBlockDeltaEventImpl _value,
      $Res Function(_$ContentBlockDeltaEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockDeltaEventImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as TextDelta,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentBlockDeltaEventType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TextDeltaCopyWith<$Res> get delta {
    return $TextDeltaCopyWith<$Res>(_value.delta, (value) {
      return _then(_value.copyWith(delta: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockDeltaEventImpl extends ContentBlockDeltaEvent {
  const _$ContentBlockDeltaEventImpl(
      {required this.delta, required this.index, required this.type})
      : super._();

  factory _$ContentBlockDeltaEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockDeltaEventImplFromJson(json);

  /// No Description
  @override
  final TextDelta delta;

  /// No Description
  @override
  final int index;

  ///
  @override
  final ContentBlockDeltaEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockDeltaEvent(delta: $delta, index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockDeltaEventImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, delta, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockDeltaEventImplCopyWith<_$ContentBlockDeltaEventImpl>
      get copyWith => __$$ContentBlockDeltaEventImplCopyWithImpl<
          _$ContentBlockDeltaEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return contentBlockDeltaEvent(delta, index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return contentBlockDeltaEvent?.call(delta, index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockDeltaEvent != null) {
      return contentBlockDeltaEvent(delta, index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return contentBlockDeltaEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return contentBlockDeltaEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockDeltaEvent != null) {
      return contentBlockDeltaEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockDeltaEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockDeltaEvent extends MessageStreamEvent {
  const factory ContentBlockDeltaEvent(
          {required final TextDelta delta,
          required final int index,
          required final ContentBlockDeltaEventType type}) =
      _$ContentBlockDeltaEventImpl;
  const ContentBlockDeltaEvent._() : super._();

  factory ContentBlockDeltaEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockDeltaEventImpl.fromJson;

  /// No Description
  TextDelta get delta;

  /// No Description
  int get index;
  @override

  ///
  ContentBlockDeltaEventType get type;
  @JsonKey(ignore: true)
  _$$ContentBlockDeltaEventImplCopyWith<_$ContentBlockDeltaEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentBlockStopEventImplCopyWith<$Res> {
  factory _$$ContentBlockStopEventImplCopyWith(
          _$ContentBlockStopEventImpl value,
          $Res Function(_$ContentBlockStopEventImpl) then) =
      __$$ContentBlockStopEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, ContentBlockStopEventType type});
}

/// @nodoc
class __$$ContentBlockStopEventImplCopyWithImpl<$Res>
    extends _$MessageStreamEventCopyWithImpl<$Res, _$ContentBlockStopEventImpl>
    implements _$$ContentBlockStopEventImplCopyWith<$Res> {
  __$$ContentBlockStopEventImplCopyWithImpl(_$ContentBlockStopEventImpl _value,
      $Res Function(_$ContentBlockStopEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? type = null,
  }) {
    return _then(_$ContentBlockStopEventImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentBlockStopEventType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentBlockStopEventImpl extends ContentBlockStopEvent {
  const _$ContentBlockStopEventImpl({required this.index, required this.type})
      : super._();

  factory _$ContentBlockStopEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentBlockStopEventImplFromJson(json);

  /// No Description
  @override
  final int index;

  ///
  @override
  final ContentBlockStopEventType type;

  @override
  String toString() {
    return 'MessageStreamEvent.contentBlockStopEvent(index: $index, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentBlockStopEventImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentBlockStopEventImplCopyWith<_$ContentBlockStopEventImpl>
      get copyWith => __$$ContentBlockStopEventImplCopyWithImpl<
          _$ContentBlockStopEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message, MessageStartEventType type)
        messageStartEvent,
    required TResult Function(MessageDeltaEventDelta delta,
            MessageDeltaEventType type, MessageDeltaUsage usage)
        messageDeltaEvent,
    required TResult Function(MessageStopEventType type) messageStopEvent,
    required TResult Function(
            @JsonKey(name: 'content_block') TextBlock contentBlock,
            int index,
            ContentBlockStartEventType type)
        contentBlockStartEvent,
    required TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)
        contentBlockDeltaEvent,
    required TResult Function(int index, ContentBlockStopEventType type)
        contentBlockStopEvent,
  }) {
    return contentBlockStopEvent(index, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult? Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult? Function(MessageStopEventType type)? messageStopEvent,
    TResult? Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult? Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult? Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
  }) {
    return contentBlockStopEvent?.call(index, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message, MessageStartEventType type)?
        messageStartEvent,
    TResult Function(MessageDeltaEventDelta delta, MessageDeltaEventType type,
            MessageDeltaUsage usage)?
        messageDeltaEvent,
    TResult Function(MessageStopEventType type)? messageStopEvent,
    TResult Function(@JsonKey(name: 'content_block') TextBlock contentBlock,
            int index, ContentBlockStartEventType type)?
        contentBlockStartEvent,
    TResult Function(
            TextDelta delta, int index, ContentBlockDeltaEventType type)?
        contentBlockDeltaEvent,
    TResult Function(int index, ContentBlockStopEventType type)?
        contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockStopEvent != null) {
      return contentBlockStopEvent(index, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStartEvent value) messageStartEvent,
    required TResult Function(MessageDeltaEvent value) messageDeltaEvent,
    required TResult Function(MessageStopEvent value) messageStopEvent,
    required TResult Function(ContentBlockStartEvent value)
        contentBlockStartEvent,
    required TResult Function(ContentBlockDeltaEvent value)
        contentBlockDeltaEvent,
    required TResult Function(ContentBlockStopEvent value)
        contentBlockStopEvent,
  }) {
    return contentBlockStopEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageStartEvent value)? messageStartEvent,
    TResult? Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult? Function(MessageStopEvent value)? messageStopEvent,
    TResult? Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult? Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult? Function(ContentBlockStopEvent value)? contentBlockStopEvent,
  }) {
    return contentBlockStopEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStartEvent value)? messageStartEvent,
    TResult Function(MessageDeltaEvent value)? messageDeltaEvent,
    TResult Function(MessageStopEvent value)? messageStopEvent,
    TResult Function(ContentBlockStartEvent value)? contentBlockStartEvent,
    TResult Function(ContentBlockDeltaEvent value)? contentBlockDeltaEvent,
    TResult Function(ContentBlockStopEvent value)? contentBlockStopEvent,
    required TResult orElse(),
  }) {
    if (contentBlockStopEvent != null) {
      return contentBlockStopEvent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentBlockStopEventImplToJson(
      this,
    );
  }
}

abstract class ContentBlockStopEvent extends MessageStreamEvent {
  const factory ContentBlockStopEvent(
          {required final int index,
          required final ContentBlockStopEventType type}) =
      _$ContentBlockStopEventImpl;
  const ContentBlockStopEvent._() : super._();

  factory ContentBlockStopEvent.fromJson(Map<String, dynamic> json) =
      _$ContentBlockStopEventImpl.fromJson;

  /// No Description
  int get index;
  @override

  ///
  ContentBlockStopEventType get type;
  @JsonKey(ignore: true)
  _$$ContentBlockStopEventImplCopyWith<_$ContentBlockStopEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
