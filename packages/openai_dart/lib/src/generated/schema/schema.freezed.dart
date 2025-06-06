CreateResponseRequest _$CreateResponseRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateResponseRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateResponseRequest {
  /// The ID of the model to use.
  String get model => throw _privateConstructorUsedError;

  /// Text or items to generate a response for.
  @_CreateResponseRequestInputConverter()
  CreateResponseRequestInput get input => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get tools => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  bool? get stream => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(includeIfNull: false)
  double? get temperature => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP => throw _privateConstructorUsedError;

  /// Serializes this CreateResponseRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateResponseRequestCopyWith<CreateResponseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateResponseRequestCopyWith<$Res> {
  factory $CreateResponseRequestCopyWith(CreateResponseRequest value,
          $Res Function(CreateResponseRequest) then) =
      _$CreateResponseRequestCopyWithImpl<$Res, CreateResponseRequest>;
  @useResult
  $Res call(
      {String model,
      @_CreateResponseRequestInputConverter() CreateResponseRequestInput input,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? tools,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  $CreateResponseRequestInputCopyWith<$Res> get input;
}

/// @nodoc
class _$CreateResponseRequestCopyWithImpl<$Res,
        $Val extends CreateResponseRequest>
    implements $CreateResponseRequestCopyWith<$Res> {
  _$CreateResponseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? input = null,
    Object? tools = freezed,
    Object? metadata = freezed,
    Object? stream = freezed,
    Object? temperature = freezed,
    Object? topP = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as CreateResponseRequestInput,
      tools: freezed == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateResponseRequestInputCopyWith<$Res> get input {
    return $CreateResponseRequestInputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateResponseRequestImplCopyWith<$Res>
    implements $CreateResponseRequestCopyWith<$Res> {
  factory _$$CreateResponseRequestImplCopyWith(
          _$CreateResponseRequestImpl value,
          $Res Function(_$CreateResponseRequestImpl) then) =
      __$$CreateResponseRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      @_CreateResponseRequestInputConverter() CreateResponseRequestInput input,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>>? tools,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) bool? stream,
      @JsonKey(includeIfNull: false) double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) double? topP});

  @override
  $CreateResponseRequestInputCopyWith<$Res> get input;
}

/// @nodoc
class __$$CreateResponseRequestImplCopyWithImpl<$Res>
    extends _$CreateResponseRequestCopyWithImpl<$Res,
        _$CreateResponseRequestImpl>
    implements _$$CreateResponseRequestImplCopyWith<$Res> {
  __$$CreateResponseRequestImplCopyWithImpl(_$CreateResponseRequestImpl _value,
      $Res Function(_$CreateResponseRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? input = null,
    Object? tools = freezed,
    Object? metadata = freezed,
    Object? stream = freezed,
    Object? temperature = freezed,
    Object? topP = freezed,
  }) {
    return _then(_$CreateResponseRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as CreateResponseRequestInput,
      tools: freezed == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateResponseRequestImpl extends _CreateResponseRequest {
  const _$CreateResponseRequestImpl(
      {required this.model,
      @_CreateResponseRequestInputConverter() required this.input,
      @JsonKey(includeIfNull: false) final List<Map<String, dynamic>>? tools,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) this.stream,
      @JsonKey(includeIfNull: false) this.temperature,
      @JsonKey(name: 'top_p', includeIfNull: false) this.topP})
      : _tools = tools,
        _metadata = metadata,
        super._();

  factory _$CreateResponseRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateResponseRequestImplFromJson(json);

  /// The ID of the model to use.
  @override
  final String model;

  /// Text or items to generate a response for.
  @override
  @_CreateResponseRequestInputConverter()
  final CreateResponseRequestInput input;

  /// No Description
  final List<Map<String, dynamic>>? _tools;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// No Description
  final Map<String, dynamic>? _metadata;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final bool? stream;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  final double? temperature;

  /// No Description
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  final double? topP;

  @override
  String toString() {
    return 'CreateResponseRequest(model: $model, input: $input, tools: $tools, metadata: $metadata, stream: $stream, temperature: $temperature, topP: $topP)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateResponseRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.input, input) || other.input == input) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.stream, stream) || other.stream == stream) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      input,
      const DeepCollectionEquality().hash(_tools),
      const DeepCollectionEquality().hash(_metadata),
      stream,
      temperature,
      topP);

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateResponseRequestImplCopyWith<_$CreateResponseRequestImpl>
      get copyWith => __$$CreateResponseRequestImplCopyWithImpl<
          _$CreateResponseRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateResponseRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateResponseRequest extends CreateResponseRequest {
  const factory _CreateResponseRequest(
      {required final String model,
      @_CreateResponseRequestInputConverter()
      required final CreateResponseRequestInput input,
      @JsonKey(includeIfNull: false) final List<Map<String, dynamic>>? tools,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(includeIfNull: false) final bool? stream,
      @JsonKey(includeIfNull: false) final double? temperature,
      @JsonKey(name: 'top_p', includeIfNull: false)
      final double? topP}) = _$CreateResponseRequestImpl;
  const _CreateResponseRequest._() : super._();

  factory _CreateResponseRequest.fromJson(Map<String, dynamic> json) =
      _$CreateResponseRequestImpl.fromJson;

  /// The ID of the model to use.
  @override
  String get model;

  /// Text or items to generate a response for.
  @override
  @_CreateResponseRequestInputConverter()
  CreateResponseRequestInput get input;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>>? get tools;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  bool? get stream;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  double? get temperature;

  /// No Description
  @override
  @JsonKey(name: 'top_p', includeIfNull: false)
  double? get topP;

  /// Create a copy of CreateResponseRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateResponseRequestImplCopyWith<_$CreateResponseRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateResponseRequestInput _$CreateResponseRequestInputFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'listMapStringDynamic':
      return CreateResponseRequestInputListMapStringDynamic.fromJson(json);
    case 'string':
      return CreateResponseRequestInputString.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'CreateResponseRequestInput',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CreateResponseRequestInput {
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
    required TResult Function(
            CreateResponseRequestInputListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(CreateResponseRequestInputString value) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(CreateResponseRequestInputString value)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(CreateResponseRequestInputString value)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateResponseRequestInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateResponseRequestInputCopyWith<$Res> {
  factory $CreateResponseRequestInputCopyWith(CreateResponseRequestInput value,
          $Res Function(CreateResponseRequestInput) then) =
      _$CreateResponseRequestInputCopyWithImpl<$Res,
          CreateResponseRequestInput>;
}

/// @nodoc
class _$CreateResponseRequestInputCopyWithImpl<$Res,
        $Val extends CreateResponseRequestInput>
    implements $CreateResponseRequestInputCopyWith<$Res> {
  _$CreateResponseRequestInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateResponseRequestInputListMapStringDynamicImplCopyWith<
    $Res> {
  factory _$$CreateResponseRequestInputListMapStringDynamicImplCopyWith(
          _$CreateResponseRequestInputListMapStringDynamicImpl value,
          $Res Function(_$CreateResponseRequestInputListMapStringDynamicImpl)
              then) =
      __$$CreateResponseRequestInputListMapStringDynamicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> value});
}

/// @nodoc
class __$$CreateResponseRequestInputListMapStringDynamicImplCopyWithImpl<$Res>
    extends _$CreateResponseRequestInputCopyWithImpl<$Res,
        _$CreateResponseRequestInputListMapStringDynamicImpl>
    implements
        _$$CreateResponseRequestInputListMapStringDynamicImplCopyWith<$Res> {
  __$$CreateResponseRequestInputListMapStringDynamicImplCopyWithImpl(
      _$CreateResponseRequestInputListMapStringDynamicImpl _value,
      $Res Function(_$CreateResponseRequestInputListMapStringDynamicImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CreateResponseRequestInputListMapStringDynamicImpl(
      null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateResponseRequestInputListMapStringDynamicImpl
    extends CreateResponseRequestInputListMapStringDynamic {
  const _$CreateResponseRequestInputListMapStringDynamicImpl(
      final List<Map<String, dynamic>> value,
      {final String? $type})
      : _value = value,
        $type = $type ?? 'listMapStringDynamic',
        super._();

  factory _$CreateResponseRequestInputListMapStringDynamicImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateResponseRequestInputListMapStringDynamicImplFromJson(json);

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
    return 'CreateResponseRequestInput.listMapStringDynamic(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateResponseRequestInputListMapStringDynamicImpl &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateResponseRequestInputListMapStringDynamicImplCopyWith<
          _$CreateResponseRequestInputListMapStringDynamicImpl>
      get copyWith =>
          __$$CreateResponseRequestInputListMapStringDynamicImplCopyWithImpl<
                  _$CreateResponseRequestInputListMapStringDynamicImpl>(
              this, _$identity);

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
    required TResult Function(
            CreateResponseRequestInputListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(CreateResponseRequestInputString value) string,
  }) {
    return listMapStringDynamic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(CreateResponseRequestInputString value)? string,
  }) {
    return listMapStringDynamic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(CreateResponseRequestInputString value)? string,
    required TResult orElse(),
  }) {
    if (listMapStringDynamic != null) {
      return listMapStringDynamic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateResponseRequestInputListMapStringDynamicImplToJson(
      this,
    );
  }
}

abstract class CreateResponseRequestInputListMapStringDynamic
    extends CreateResponseRequestInput {
  const factory CreateResponseRequestInputListMapStringDynamic(
          final List<Map<String, dynamic>> value) =
      _$CreateResponseRequestInputListMapStringDynamicImpl;
  const CreateResponseRequestInputListMapStringDynamic._() : super._();

  factory CreateResponseRequestInputListMapStringDynamic.fromJson(
          Map<String, dynamic> json) =
      _$CreateResponseRequestInputListMapStringDynamicImpl.fromJson;

  @override
  List<Map<String, dynamic>> get value;

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateResponseRequestInputListMapStringDynamicImplCopyWith<
          _$CreateResponseRequestInputListMapStringDynamicImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateResponseRequestInputStringImplCopyWith<$Res> {
  factory _$$CreateResponseRequestInputStringImplCopyWith(
          _$CreateResponseRequestInputStringImpl value,
          $Res Function(_$CreateResponseRequestInputStringImpl) then) =
      __$$CreateResponseRequestInputStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$CreateResponseRequestInputStringImplCopyWithImpl<$Res>
    extends _$CreateResponseRequestInputCopyWithImpl<$Res,
        _$CreateResponseRequestInputStringImpl>
    implements _$$CreateResponseRequestInputStringImplCopyWith<$Res> {
  __$$CreateResponseRequestInputStringImplCopyWithImpl(
      _$CreateResponseRequestInputStringImpl _value,
      $Res Function(_$CreateResponseRequestInputStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CreateResponseRequestInputStringImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateResponseRequestInputStringImpl
    extends CreateResponseRequestInputString {
  const _$CreateResponseRequestInputStringImpl(this.value,
      {final String? $type})
      : $type = $type ?? 'string',
        super._();

  factory _$CreateResponseRequestInputStringImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateResponseRequestInputStringImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateResponseRequestInput.string(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateResponseRequestInputStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateResponseRequestInputStringImplCopyWith<
          _$CreateResponseRequestInputStringImpl>
      get copyWith => __$$CreateResponseRequestInputStringImplCopyWithImpl<
          _$CreateResponseRequestInputStringImpl>(this, _$identity);

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
    required TResult Function(
            CreateResponseRequestInputListMapStringDynamic value)
        listMapStringDynamic,
    required TResult Function(CreateResponseRequestInputString value) string,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult? Function(CreateResponseRequestInputString value)? string,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateResponseRequestInputListMapStringDynamic value)?
        listMapStringDynamic,
    TResult Function(CreateResponseRequestInputString value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateResponseRequestInputStringImplToJson(
      this,
    );
  }
}

abstract class CreateResponseRequestInputString
    extends CreateResponseRequestInput {
  const factory CreateResponseRequestInputString(final String value) =
      _$CreateResponseRequestInputStringImpl;
  const CreateResponseRequestInputString._() : super._();

  factory CreateResponseRequestInputString.fromJson(Map<String, dynamic> json) =
      _$CreateResponseRequestInputStringImpl.fromJson;

  @override
  String get value;

  /// Create a copy of CreateResponseRequestInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateResponseRequestInputStringImplCopyWith<
          _$CreateResponseRequestInputStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return _Response.fromJson(json);
}

/// @nodoc
mixin _$Response {
  /// No Description
  String get id => throw _privateConstructorUsedError;

  /// No Description
  String get object => throw _privateConstructorUsedError;

  /// No Description
  String get status => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;

  /// No Description
  List<Map<String, dynamic>> get output => throw _privateConstructorUsedError;

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCopyWith<Response> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res, Response>;
  @useResult
  $Res call(
      {String id,
      String object,
      String status,
      @JsonKey(name: 'created_at') int createdAt,
      List<Map<String, dynamic>> output});
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res, $Val extends Response>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? createdAt = null,
    Object? output = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseImplCopyWith<$Res>
    implements $ResponseCopyWith<$Res> {
  factory _$$ResponseImplCopyWith(
          _$ResponseImpl value, $Res Function(_$ResponseImpl) then) =
      __$$ResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      String status,
      @JsonKey(name: 'created_at') int createdAt,
      List<Map<String, dynamic>> output});
}

/// @nodoc
class __$$ResponseImplCopyWithImpl<$Res>
    extends _$ResponseCopyWithImpl<$Res, _$ResponseImpl>
    implements _$$ResponseImplCopyWith<$Res> {
  __$$ResponseImplCopyWithImpl(
      _$ResponseImpl _value, $Res Function(_$ResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? status = null,
    Object? createdAt = null,
    Object? output = null,
  }) {
    return _then(_$ResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      output: null == output
          ? _value._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseImpl extends _Response {
  const _$ResponseImpl(
      {required this.id,
      required this.object,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      required final List<Map<String, dynamic>> output})
      : _output = output,
        super._();

  factory _$ResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseImplFromJson(json);

  /// No Description
  @override
  final String id;

  /// No Description
  @override
  final String object;

  /// No Description
  @override
  final String status;

  /// No Description
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;

  /// No Description
  final List<Map<String, dynamic>> _output;

  /// No Description
  @override
  List<Map<String, dynamic>> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  String toString() {
    return 'Response(id: $id, object: $object, status: $status, createdAt: $createdAt, output: $output)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._output, _output));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, status, createdAt,
      const DeepCollectionEquality().hash(_output));

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseImplCopyWith<_$ResponseImpl> get copyWith =>
      __$$ResponseImplCopyWithImpl<_$ResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseImplToJson(
      this,
    );
  }
}

abstract class _Response extends Response {
  const factory _Response(
      {required final String id,
      required final String object,
      required final String status,
      @JsonKey(name: 'created_at') required final int createdAt,
      required final List<Map<String, dynamic>> output}) = _$ResponseImpl;
  const _Response._() : super._();

  factory _Response.fromJson(Map<String, dynamic> json) =
      _$ResponseImpl.fromJson;

  /// No Description
  @override
  String get id;

  /// No Description
  @override
  String get object;

  /// No Description
  @override
  String get status;

  /// No Description
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;

  /// No Description
  @override
  List<Map<String, dynamic>> get output;

  /// Create a copy of Response
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseImplCopyWith<_$ResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteResponseResponse _$DeleteResponseResponseFromJson(
    Map<String, dynamic> json) {
  return _DeleteResponseResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteResponseResponse {
  /// No Description
  String get id => throw _privateConstructorUsedError;

  ///
  DeleteResponseResponseObject get object => throw _privateConstructorUsedError;

  /// No Description
  bool get deleted => throw _privateConstructorUsedError;

  /// Serializes this DeleteResponseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteResponseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteResponseResponseCopyWith<DeleteResponseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteResponseResponseCopyWith<$Res> {
  factory $DeleteResponseResponseCopyWith(DeleteResponseResponse value,
          $Res Function(DeleteResponseResponse) then) =
      _$DeleteResponseResponseCopyWithImpl<$Res, DeleteResponseResponse>;
  @useResult
  $Res call({String id, DeleteResponseResponseObject object, bool deleted});
}

/// @nodoc
class _$DeleteResponseResponseCopyWithImpl<$Res,
        $Val extends DeleteResponseResponse>
    implements $DeleteResponseResponseCopyWith<$Res> {
  _$DeleteResponseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteResponseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as DeleteResponseResponseObject,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteResponseResponseImplCopyWith<$Res>
    implements $DeleteResponseResponseCopyWith<$Res> {
  factory _$$DeleteResponseResponseImplCopyWith(
          _$DeleteResponseResponseImpl value,
          $Res Function(_$DeleteResponseResponseImpl) then) =
      __$$DeleteResponseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DeleteResponseResponseObject object, bool deleted});
}

/// @nodoc
class __$$DeleteResponseResponseImplCopyWithImpl<$Res>
    extends _$DeleteResponseResponseCopyWithImpl<$Res,
        _$DeleteResponseResponseImpl>
    implements _$$DeleteResponseResponseImplCopyWith<$Res> {
  __$$DeleteResponseResponseImplCopyWithImpl(
      _$DeleteResponseResponseImpl _value,
      $Res Function(_$DeleteResponseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteResponseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? deleted = null,
  }) {
    return _then(_$DeleteResponseResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as DeleteResponseResponseObject,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteResponseResponseImpl extends _DeleteResponseResponse {
  const _$DeleteResponseResponseImpl(
      {required this.id, required this.object, required this.deleted})
      : super._();

  factory _$DeleteResponseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteResponseResponseImplFromJson(json);

  /// No Description
  @override
  final String id;

  ///
  @override
  final DeleteResponseResponseObject object;

  /// No Description
  @override
  final bool deleted;

  @override
  String toString() {
    return 'DeleteResponseResponse(id: $id, object: $object, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteResponseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, deleted);

  /// Create a copy of DeleteResponseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteResponseResponseImplCopyWith<_$DeleteResponseResponseImpl>
      get copyWith => __$$DeleteResponseResponseImplCopyWithImpl<
          _$DeleteResponseResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteResponseResponseImplToJson(
      this,
    );
  }
}

abstract class _DeleteResponseResponse extends DeleteResponseResponse {
  const factory _DeleteResponseResponse(
      {required final String id,
      required final DeleteResponseResponseObject object,
      required final bool deleted}) = _$DeleteResponseResponseImpl;
  const _DeleteResponseResponse._() : super._();

  factory _DeleteResponseResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteResponseResponseImpl.fromJson;

  /// No Description
  @override
  String get id;

  ///
  @override
  DeleteResponseResponseObject get object;

  /// No Description
  @override
  bool get deleted;

  /// Create a copy of DeleteResponseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteResponseResponseImplCopyWith<_$DeleteResponseResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseItemList _$ResponseItemListFromJson(Map<String, dynamic> json) {
  return _ResponseItemList.fromJson(json);
}

/// @nodoc
mixin _$ResponseItemList {
  /// No Description
  String get object => throw _privateConstructorUsedError;

  /// No Description
  List<Map<String, dynamic>> get data => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'first_id')
  String get firstId => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'last_id')
  String get lastId => throw _privateConstructorUsedError;

  /// No Description
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this ResponseItemList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseItemListCopyWith<ResponseItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseItemListCopyWith<$Res> {
  factory $ResponseItemListCopyWith(
          ResponseItemList value, $Res Function(ResponseItemList) then) =
      _$ResponseItemListCopyWithImpl<$Res, ResponseItemList>;
  @useResult
  $Res call(
      {String object,
      List<Map<String, dynamic>> data,
      @JsonKey(name: 'first_id') String firstId,
      @JsonKey(name: 'last_id') String lastId,
      @JsonKey(name: 'has_more') bool hasMore});
}

/// @nodoc
class _$ResponseItemListCopyWithImpl<$Res, $Val extends ResponseItemList>
    implements $ResponseItemListCopyWith<$Res> {
  _$ResponseItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? data = null,
    Object? firstId = null,
    Object? lastId = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      firstId: null == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as String,
      lastId: null == lastId
          ? _value.lastId
          : lastId // ignore: cast_nullable_to_non_nullable
              as String,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseItemListImplCopyWith<$Res>
    implements $ResponseItemListCopyWith<$Res> {
  factory _$$ResponseItemListImplCopyWith(_$ResponseItemListImpl value,
          $Res Function(_$ResponseItemListImpl) then) =
      __$$ResponseItemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String object,
      List<Map<String, dynamic>> data,
      @JsonKey(name: 'first_id') String firstId,
      @JsonKey(name: 'last_id') String lastId,
      @JsonKey(name: 'has_more') bool hasMore});
}

/// @nodoc
class __$$ResponseItemListImplCopyWithImpl<$Res>
    extends _$ResponseItemListCopyWithImpl<$Res, _$ResponseItemListImpl>
    implements _$$ResponseItemListImplCopyWith<$Res> {
  __$$ResponseItemListImplCopyWithImpl(_$ResponseItemListImpl _value,
      $Res Function(_$ResponseItemListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? data = null,
    Object? firstId = null,
    Object? lastId = null,
    Object? hasMore = null,
  }) {
    return _then(_$ResponseItemListImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      firstId: null == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as String,
      lastId: null == lastId
          ? _value.lastId
          : lastId // ignore: cast_nullable_to_non_nullable
              as String,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseItemListImpl extends _ResponseItemList {
  const _$ResponseItemListImpl(
      {required this.object,
      required final List<Map<String, dynamic>> data,
      @JsonKey(name: 'first_id') required this.firstId,
      @JsonKey(name: 'last_id') required this.lastId,
      @JsonKey(name: 'has_more') required this.hasMore})
      : _data = data,
        super._();

  factory _$ResponseItemListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseItemListImplFromJson(json);

  /// No Description
  @override
  final String object;

  /// No Description
  final List<Map<String, dynamic>> _data;

  /// No Description
  @override
  List<Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// No Description
  @override
  @JsonKey(name: 'first_id')
  final String firstId;

  /// No Description
  @override
  @JsonKey(name: 'last_id')
  final String lastId;

  /// No Description
  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;

  @override
  String toString() {
    return 'ResponseItemList(object: $object, data: $data, firstId: $firstId, lastId: $lastId, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseItemListImpl &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.firstId, firstId) || other.firstId == firstId) &&
            (identical(other.lastId, lastId) || other.lastId == lastId) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, object,
      const DeepCollectionEquality().hash(_data), firstId, lastId, hasMore);

  /// Create a copy of ResponseItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseItemListImplCopyWith<_$ResponseItemListImpl> get copyWith =>
      __$$ResponseItemListImplCopyWithImpl<_$ResponseItemListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseItemListImplToJson(
      this,
    );
  }
}

abstract class _ResponseItemList extends ResponseItemList {
  const factory _ResponseItemList(
          {required final String object,
          required final List<Map<String, dynamic>> data,
          @JsonKey(name: 'first_id') required final String firstId,
          @JsonKey(name: 'last_id') required final String lastId,
          @JsonKey(name: 'has_more') required final bool hasMore}) =
      _$ResponseItemListImpl;
  const _ResponseItemList._() : super._();

  factory _ResponseItemList.fromJson(Map<String, dynamic> json) =
      _$ResponseItemListImpl.fromJson;

  /// No Description
  @override
  String get object;

  /// No Description
  @override
  List<Map<String, dynamic>> get data;

  /// No Description
  @override
  @JsonKey(name: 'first_id')
  String get firstId;

  /// No Description
  @override
  @JsonKey(name: 'last_id')
  String get lastId;

  /// No Description
  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;

  /// Create a copy of ResponseItemList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseItemListImplCopyWith<_$ResponseItemListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

