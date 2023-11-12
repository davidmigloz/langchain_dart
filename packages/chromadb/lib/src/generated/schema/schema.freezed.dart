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

AddEmbedding _$AddEmbeddingFromJson(Map<String, dynamic> json) {
  return _AddEmbedding.fromJson(json);
}

/// @nodoc
mixin _$AddEmbedding {
  /// Optional embeddings of the items to add.
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings => throw _privateConstructorUsedError;

  /// Optional metadatas of the items to add.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas =>
      throw _privateConstructorUsedError;

  /// Optional documents of the items to add.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents => throw _privateConstructorUsedError;

  /// Optional uris of the items to add.
  @JsonKey(includeIfNull: false)
  List<String?>? get uris => throw _privateConstructorUsedError;

  /// IDs of the items to add.
  List<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddEmbeddingCopyWith<AddEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEmbeddingCopyWith<$Res> {
  factory $AddEmbeddingCopyWith(
          AddEmbedding value, $Res Function(AddEmbedding) then) =
      _$AddEmbeddingCopyWithImpl<$Res, AddEmbedding>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents,
      @JsonKey(includeIfNull: false) List<String?>? uris,
      List<String> ids});
}

/// @nodoc
class _$AddEmbeddingCopyWithImpl<$Res, $Val extends AddEmbedding>
    implements $AddEmbeddingCopyWith<$Res> {
  _$AddEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? uris = freezed,
    Object? ids = null,
  }) {
    return _then(_value.copyWith(
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>?>?,
      metadatas: freezed == metadatas
          ? _value.metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      uris: freezed == uris
          ? _value.uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddEmbeddingImplCopyWith<$Res>
    implements $AddEmbeddingCopyWith<$Res> {
  factory _$$AddEmbeddingImplCopyWith(
          _$AddEmbeddingImpl value, $Res Function(_$AddEmbeddingImpl) then) =
      __$$AddEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents,
      @JsonKey(includeIfNull: false) List<String?>? uris,
      List<String> ids});
}

/// @nodoc
class __$$AddEmbeddingImplCopyWithImpl<$Res>
    extends _$AddEmbeddingCopyWithImpl<$Res, _$AddEmbeddingImpl>
    implements _$$AddEmbeddingImplCopyWith<$Res> {
  __$$AddEmbeddingImplCopyWithImpl(
      _$AddEmbeddingImpl _value, $Res Function(_$AddEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? uris = freezed,
    Object? ids = null,
  }) {
    return _then(_$AddEmbeddingImpl(
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>?>?,
      metadatas: freezed == metadatas
          ? _value._metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      uris: freezed == uris
          ? _value._uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddEmbeddingImpl extends _AddEmbedding {
  const _$AddEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) final List<String?>? documents,
      @JsonKey(includeIfNull: false) final List<String?>? uris,
      required final List<String> ids})
      : _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        _uris = uris,
        _ids = ids,
        super._();

  factory _$AddEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddEmbeddingImplFromJson(json);

  /// Optional embeddings of the items to add.
  final List<List<double>?>? _embeddings;

  /// Optional embeddings of the items to add.
  @override
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional metadatas of the items to add.
  final List<Map<String, dynamic>?>? _metadatas;

  /// Optional metadatas of the items to add.
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional documents of the items to add.
  final List<String?>? _documents;

  /// Optional documents of the items to add.
  @override
  @JsonKey(includeIfNull: false)
  List<String?>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional uris of the items to add.
  final List<String?>? _uris;

  /// Optional uris of the items to add.
  @override
  @JsonKey(includeIfNull: false)
  List<String?>? get uris {
    final value = _uris;
    if (value == null) return null;
    if (_uris is EqualUnmodifiableListView) return _uris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// IDs of the items to add.
  final List<String> _ids;

  /// IDs of the items to add.
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'AddEmbedding(embeddings: $embeddings, metadatas: $metadatas, documents: $documents, uris: $uris, ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEmbeddingImpl &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            const DeepCollectionEquality()
                .equals(other._metadatas, _metadatas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality().equals(other._uris, _uris) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_embeddings),
      const DeepCollectionEquality().hash(_metadatas),
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_uris),
      const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEmbeddingImplCopyWith<_$AddEmbeddingImpl> get copyWith =>
      __$$AddEmbeddingImplCopyWithImpl<_$AddEmbeddingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _AddEmbedding extends AddEmbedding {
  const factory _AddEmbedding(
      {@JsonKey(includeIfNull: false) final List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) final List<String?>? documents,
      @JsonKey(includeIfNull: false) final List<String?>? uris,
      required final List<String> ids}) = _$AddEmbeddingImpl;
  const _AddEmbedding._() : super._();

  factory _AddEmbedding.fromJson(Map<String, dynamic> json) =
      _$AddEmbeddingImpl.fromJson;

  @override

  /// Optional embeddings of the items to add.
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings;
  @override

  /// Optional metadatas of the items to add.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas;
  @override

  /// Optional documents of the items to add.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents;
  @override

  /// Optional uris of the items to add.
  @JsonKey(includeIfNull: false)
  List<String?>? get uris;
  @override

  /// IDs of the items to add.
  List<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$$AddEmbeddingImplCopyWith<_$AddEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectionType _$CollectionTypeFromJson(Map<String, dynamic> json) {
  return _CollectionType.fromJson(json);
}

/// @nodoc
mixin _$CollectionType {
  /// Name of the collection.
  String get name => throw _privateConstructorUsedError;

  /// Id of the collection.
  String get id => throw _privateConstructorUsedError;

  /// Metadata of the collection.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionTypeCopyWith<CollectionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionTypeCopyWith<$Res> {
  factory $CollectionTypeCopyWith(
          CollectionType value, $Res Function(CollectionType) then) =
      _$CollectionTypeCopyWithImpl<$Res, CollectionType>;
  @useResult
  $Res call(
      {String name,
      String id,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CollectionTypeCopyWithImpl<$Res, $Val extends CollectionType>
    implements $CollectionTypeCopyWith<$Res> {
  _$CollectionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionTypeImplCopyWith<$Res>
    implements $CollectionTypeCopyWith<$Res> {
  factory _$$CollectionTypeImplCopyWith(_$CollectionTypeImpl value,
          $Res Function(_$CollectionTypeImpl) then) =
      __$$CollectionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CollectionTypeImplCopyWithImpl<$Res>
    extends _$CollectionTypeCopyWithImpl<$Res, _$CollectionTypeImpl>
    implements _$$CollectionTypeImplCopyWith<$Res> {
  __$$CollectionTypeImplCopyWithImpl(
      _$CollectionTypeImpl _value, $Res Function(_$CollectionTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? metadata = freezed,
  }) {
    return _then(_$CollectionTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionTypeImpl extends _CollectionType {
  const _$CollectionTypeImpl(
      {required this.name,
      required this.id,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$CollectionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionTypeImplFromJson(json);

  /// Name of the collection.
  @override
  final String name;

  /// Id of the collection.
  @override
  final String id;

  /// Metadata of the collection.
  final Map<String, dynamic>? _metadata;

  /// Metadata of the collection.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CollectionType(name: $name, id: $id, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionTypeImplCopyWith<_$CollectionTypeImpl> get copyWith =>
      __$$CollectionTypeImplCopyWithImpl<_$CollectionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionTypeImplToJson(
      this,
    );
  }
}

abstract class _CollectionType extends CollectionType {
  const factory _CollectionType(
      {required final String name,
      required final String id,
      @JsonKey(includeIfNull: false)
      final Map<String, dynamic>? metadata}) = _$CollectionTypeImpl;
  const _CollectionType._() : super._();

  factory _CollectionType.fromJson(Map<String, dynamic> json) =
      _$CollectionTypeImpl.fromJson;

  @override

  /// Name of the collection.
  String get name;
  @override

  /// Id of the collection.
  String get id;
  @override

  /// Metadata of the collection.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$CollectionTypeImplCopyWith<_$CollectionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateCollection _$CreateCollectionFromJson(Map<String, dynamic> json) {
  return _CreateCollection.fromJson(json);
}

/// @nodoc
mixin _$CreateCollection {
  /// Name of the collection.
  String get name => throw _privateConstructorUsedError;

  /// Metadata of the collection.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// If true, will return existing collection if it exists.
  @JsonKey(name: 'get_or_create')
  bool get getOrCreate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCollectionCopyWith<CreateCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCollectionCopyWith<$Res> {
  factory $CreateCollectionCopyWith(
          CreateCollection value, $Res Function(CreateCollection) then) =
      _$CreateCollectionCopyWithImpl<$Res, CreateCollection>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(name: 'get_or_create') bool getOrCreate});
}

/// @nodoc
class _$CreateCollectionCopyWithImpl<$Res, $Val extends CreateCollection>
    implements $CreateCollectionCopyWith<$Res> {
  _$CreateCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = freezed,
    Object? getOrCreate = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      getOrCreate: null == getOrCreate
          ? _value.getOrCreate
          : getOrCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCollectionImplCopyWith<$Res>
    implements $CreateCollectionCopyWith<$Res> {
  factory _$$CreateCollectionImplCopyWith(_$CreateCollectionImpl value,
          $Res Function(_$CreateCollectionImpl) then) =
      __$$CreateCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
      @JsonKey(name: 'get_or_create') bool getOrCreate});
}

/// @nodoc
class __$$CreateCollectionImplCopyWithImpl<$Res>
    extends _$CreateCollectionCopyWithImpl<$Res, _$CreateCollectionImpl>
    implements _$$CreateCollectionImplCopyWith<$Res> {
  __$$CreateCollectionImplCopyWithImpl(_$CreateCollectionImpl _value,
      $Res Function(_$CreateCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = freezed,
    Object? getOrCreate = null,
  }) {
    return _then(_$CreateCollectionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      getOrCreate: null == getOrCreate
          ? _value.getOrCreate
          : getOrCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCollectionImpl extends _CreateCollection {
  const _$CreateCollectionImpl(
      {required this.name,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
      @JsonKey(name: 'get_or_create') this.getOrCreate = false})
      : _metadata = metadata,
        super._();

  factory _$CreateCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCollectionImplFromJson(json);

  /// Name of the collection.
  @override
  final String name;

  /// Metadata of the collection.
  final Map<String, dynamic>? _metadata;

  /// Metadata of the collection.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// If true, will return existing collection if it exists.
  @override
  @JsonKey(name: 'get_or_create')
  final bool getOrCreate;

  @override
  String toString() {
    return 'CreateCollection(name: $name, metadata: $metadata, getOrCreate: $getOrCreate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCollectionImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.getOrCreate, getOrCreate) ||
                other.getOrCreate == getOrCreate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_metadata), getOrCreate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCollectionImplCopyWith<_$CreateCollectionImpl> get copyWith =>
      __$$CreateCollectionImplCopyWithImpl<_$CreateCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCollectionImplToJson(
      this,
    );
  }
}

abstract class _CreateCollection extends CreateCollection {
  const factory _CreateCollection(
          {required final String name,
          @JsonKey(includeIfNull: false) final Map<String, dynamic>? metadata,
          @JsonKey(name: 'get_or_create') final bool getOrCreate}) =
      _$CreateCollectionImpl;
  const _CreateCollection._() : super._();

  factory _CreateCollection.fromJson(Map<String, dynamic> json) =
      _$CreateCollectionImpl.fromJson;

  @override

  /// Name of the collection.
  String get name;
  @override

  /// Metadata of the collection.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get metadata;
  @override

  /// If true, will return existing collection if it exists.
  @JsonKey(name: 'get_or_create')
  bool get getOrCreate;
  @override
  @JsonKey(ignore: true)
  _$$CreateCollectionImplCopyWith<_$CreateCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DatabaseType _$DatabaseTypeFromJson(Map<String, dynamic> json) {
  return _DatabaseType.fromJson(json);
}

/// @nodoc
mixin _$DatabaseType {
  /// Id of the database.
  String get id => throw _privateConstructorUsedError;

  /// Name of the database.
  String get name => throw _privateConstructorUsedError;

  /// Tenant of the database.
  @JsonKey(includeIfNull: false)
  String? get tenant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatabaseTypeCopyWith<DatabaseType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseTypeCopyWith<$Res> {
  factory $DatabaseTypeCopyWith(
          DatabaseType value, $Res Function(DatabaseType) then) =
      _$DatabaseTypeCopyWithImpl<$Res, DatabaseType>;
  @useResult
  $Res call(
      {String id, String name, @JsonKey(includeIfNull: false) String? tenant});
}

/// @nodoc
class _$DatabaseTypeCopyWithImpl<$Res, $Val extends DatabaseType>
    implements $DatabaseTypeCopyWith<$Res> {
  _$DatabaseTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tenant = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseTypeImplCopyWith<$Res>
    implements $DatabaseTypeCopyWith<$Res> {
  factory _$$DatabaseTypeImplCopyWith(
          _$DatabaseTypeImpl value, $Res Function(_$DatabaseTypeImpl) then) =
      __$$DatabaseTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, @JsonKey(includeIfNull: false) String? tenant});
}

/// @nodoc
class __$$DatabaseTypeImplCopyWithImpl<$Res>
    extends _$DatabaseTypeCopyWithImpl<$Res, _$DatabaseTypeImpl>
    implements _$$DatabaseTypeImplCopyWith<$Res> {
  __$$DatabaseTypeImplCopyWithImpl(
      _$DatabaseTypeImpl _value, $Res Function(_$DatabaseTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tenant = freezed,
  }) {
    return _then(_$DatabaseTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseTypeImpl extends _DatabaseType {
  const _$DatabaseTypeImpl(
      {required this.id,
      required this.name,
      @JsonKey(includeIfNull: false) this.tenant})
      : super._();

  factory _$DatabaseTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseTypeImplFromJson(json);

  /// Id of the database.
  @override
  final String id;

  /// Name of the database.
  @override
  final String name;

  /// Tenant of the database.
  @override
  @JsonKey(includeIfNull: false)
  final String? tenant;

  @override
  String toString() {
    return 'DatabaseType(id: $id, name: $name, tenant: $tenant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tenant, tenant) || other.tenant == tenant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, tenant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseTypeImplCopyWith<_$DatabaseTypeImpl> get copyWith =>
      __$$DatabaseTypeImplCopyWithImpl<_$DatabaseTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseTypeImplToJson(
      this,
    );
  }
}

abstract class _DatabaseType extends DatabaseType {
  const factory _DatabaseType(
          {required final String id,
          required final String name,
          @JsonKey(includeIfNull: false) final String? tenant}) =
      _$DatabaseTypeImpl;
  const _DatabaseType._() : super._();

  factory _DatabaseType.fromJson(Map<String, dynamic> json) =
      _$DatabaseTypeImpl.fromJson;

  @override

  /// Id of the database.
  String get id;
  @override

  /// Name of the database.
  String get name;
  @override

  /// Tenant of the database.
  @JsonKey(includeIfNull: false)
  String? get tenant;
  @override
  @JsonKey(ignore: true)
  _$$DatabaseTypeImplCopyWith<_$DatabaseTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateDatabase _$CreateDatabaseFromJson(Map<String, dynamic> json) {
  return _CreateDatabase.fromJson(json);
}

/// @nodoc
mixin _$CreateDatabase {
  /// Name of the database.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateDatabaseCopyWith<CreateDatabase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDatabaseCopyWith<$Res> {
  factory $CreateDatabaseCopyWith(
          CreateDatabase value, $Res Function(CreateDatabase) then) =
      _$CreateDatabaseCopyWithImpl<$Res, CreateDatabase>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$CreateDatabaseCopyWithImpl<$Res, $Val extends CreateDatabase>
    implements $CreateDatabaseCopyWith<$Res> {
  _$CreateDatabaseCopyWithImpl(this._value, this._then);

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
abstract class _$$CreateDatabaseImplCopyWith<$Res>
    implements $CreateDatabaseCopyWith<$Res> {
  factory _$$CreateDatabaseImplCopyWith(_$CreateDatabaseImpl value,
          $Res Function(_$CreateDatabaseImpl) then) =
      __$$CreateDatabaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CreateDatabaseImplCopyWithImpl<$Res>
    extends _$CreateDatabaseCopyWithImpl<$Res, _$CreateDatabaseImpl>
    implements _$$CreateDatabaseImplCopyWith<$Res> {
  __$$CreateDatabaseImplCopyWithImpl(
      _$CreateDatabaseImpl _value, $Res Function(_$CreateDatabaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CreateDatabaseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDatabaseImpl extends _CreateDatabase {
  const _$CreateDatabaseImpl({required this.name}) : super._();

  factory _$CreateDatabaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDatabaseImplFromJson(json);

  /// Name of the database.
  @override
  final String name;

  @override
  String toString() {
    return 'CreateDatabase(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDatabaseImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDatabaseImplCopyWith<_$CreateDatabaseImpl> get copyWith =>
      __$$CreateDatabaseImplCopyWithImpl<_$CreateDatabaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDatabaseImplToJson(
      this,
    );
  }
}

abstract class _CreateDatabase extends CreateDatabase {
  const factory _CreateDatabase({required final String name}) =
      _$CreateDatabaseImpl;
  const _CreateDatabase._() : super._();

  factory _CreateDatabase.fromJson(Map<String, dynamic> json) =
      _$CreateDatabaseImpl.fromJson;

  @override

  /// Name of the database.
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$CreateDatabaseImplCopyWith<_$CreateDatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TenantType _$TenantTypeFromJson(Map<String, dynamic> json) {
  return _TenantType.fromJson(json);
}

/// @nodoc
mixin _$TenantType {
  /// Name of the tenant.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantTypeCopyWith<TenantType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantTypeCopyWith<$Res> {
  factory $TenantTypeCopyWith(
          TenantType value, $Res Function(TenantType) then) =
      _$TenantTypeCopyWithImpl<$Res, TenantType>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TenantTypeCopyWithImpl<$Res, $Val extends TenantType>
    implements $TenantTypeCopyWith<$Res> {
  _$TenantTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$TenantTypeImplCopyWith<$Res>
    implements $TenantTypeCopyWith<$Res> {
  factory _$$TenantTypeImplCopyWith(
          _$TenantTypeImpl value, $Res Function(_$TenantTypeImpl) then) =
      __$$TenantTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$TenantTypeImplCopyWithImpl<$Res>
    extends _$TenantTypeCopyWithImpl<$Res, _$TenantTypeImpl>
    implements _$$TenantTypeImplCopyWith<$Res> {
  __$$TenantTypeImplCopyWithImpl(
      _$TenantTypeImpl _value, $Res Function(_$TenantTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$TenantTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TenantTypeImpl extends _TenantType {
  const _$TenantTypeImpl({required this.name}) : super._();

  factory _$TenantTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenantTypeImplFromJson(json);

  /// Name of the tenant.
  @override
  final String name;

  @override
  String toString() {
    return 'TenantType(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenantTypeImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenantTypeImplCopyWith<_$TenantTypeImpl> get copyWith =>
      __$$TenantTypeImplCopyWithImpl<_$TenantTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenantTypeImplToJson(
      this,
    );
  }
}

abstract class _TenantType extends TenantType {
  const factory _TenantType({required final String name}) = _$TenantTypeImpl;
  const _TenantType._() : super._();

  factory _TenantType.fromJson(Map<String, dynamic> json) =
      _$TenantTypeImpl.fromJson;

  @override

  /// Name of the tenant.
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TenantTypeImplCopyWith<_$TenantTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTenant _$CreateTenantFromJson(Map<String, dynamic> json) {
  return _CreateTenant.fromJson(json);
}

/// @nodoc
mixin _$CreateTenant {
  /// Name of the tenant.
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTenantCopyWith<CreateTenant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTenantCopyWith<$Res> {
  factory $CreateTenantCopyWith(
          CreateTenant value, $Res Function(CreateTenant) then) =
      _$CreateTenantCopyWithImpl<$Res, CreateTenant>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$CreateTenantCopyWithImpl<$Res, $Val extends CreateTenant>
    implements $CreateTenantCopyWith<$Res> {
  _$CreateTenantCopyWithImpl(this._value, this._then);

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
abstract class _$$CreateTenantImplCopyWith<$Res>
    implements $CreateTenantCopyWith<$Res> {
  factory _$$CreateTenantImplCopyWith(
          _$CreateTenantImpl value, $Res Function(_$CreateTenantImpl) then) =
      __$$CreateTenantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CreateTenantImplCopyWithImpl<$Res>
    extends _$CreateTenantCopyWithImpl<$Res, _$CreateTenantImpl>
    implements _$$CreateTenantImplCopyWith<$Res> {
  __$$CreateTenantImplCopyWithImpl(
      _$CreateTenantImpl _value, $Res Function(_$CreateTenantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CreateTenantImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTenantImpl extends _CreateTenant {
  const _$CreateTenantImpl({required this.name}) : super._();

  factory _$CreateTenantImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTenantImplFromJson(json);

  /// Name of the tenant.
  @override
  final String name;

  @override
  String toString() {
    return 'CreateTenant(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTenantImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTenantImplCopyWith<_$CreateTenantImpl> get copyWith =>
      __$$CreateTenantImplCopyWithImpl<_$CreateTenantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTenantImplToJson(
      this,
    );
  }
}

abstract class _CreateTenant extends CreateTenant {
  const factory _CreateTenant({required final String name}) =
      _$CreateTenantImpl;
  const _CreateTenant._() : super._();

  factory _CreateTenant.fromJson(Map<String, dynamic> json) =
      _$CreateTenantImpl.fromJson;

  @override

  /// Name of the tenant.
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$CreateTenantImplCopyWith<_$CreateTenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteEmbedding _$DeleteEmbeddingFromJson(Map<String, dynamic> json) {
  return _DeleteEmbedding.fromJson(json);
}

/// @nodoc
mixin _$DeleteEmbedding {
  /// Optional IDs of the items to delete.
  @JsonKey(includeIfNull: false)
  List<String>? get ids => throw _privateConstructorUsedError;

  /// Optional query condition to filter items to delete based on metadata values.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where => throw _privateConstructorUsedError;

  /// Optional query condition to filter items to delete based on document content.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteEmbeddingCopyWith<DeleteEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteEmbeddingCopyWith<$Res> {
  factory $DeleteEmbeddingCopyWith(
          DeleteEmbedding value, $Res Function(DeleteEmbedding) then) =
      _$DeleteEmbeddingCopyWithImpl<$Res, DeleteEmbedding>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<String>? ids,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument});
}

/// @nodoc
class _$DeleteEmbeddingCopyWithImpl<$Res, $Val extends DeleteEmbedding>
    implements $DeleteEmbeddingCopyWith<$Res> {
  _$DeleteEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? where = freezed,
    Object? whereDocument = freezed,
  }) {
    return _then(_value.copyWith(
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      where: freezed == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteEmbeddingImplCopyWith<$Res>
    implements $DeleteEmbeddingCopyWith<$Res> {
  factory _$$DeleteEmbeddingImplCopyWith(_$DeleteEmbeddingImpl value,
          $Res Function(_$DeleteEmbeddingImpl) then) =
      __$$DeleteEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<String>? ids,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument});
}

/// @nodoc
class __$$DeleteEmbeddingImplCopyWithImpl<$Res>
    extends _$DeleteEmbeddingCopyWithImpl<$Res, _$DeleteEmbeddingImpl>
    implements _$$DeleteEmbeddingImplCopyWith<$Res> {
  __$$DeleteEmbeddingImplCopyWithImpl(
      _$DeleteEmbeddingImpl _value, $Res Function(_$DeleteEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? where = freezed,
    Object? whereDocument = freezed,
  }) {
    return _then(_$DeleteEmbeddingImpl(
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      where: freezed == where
          ? _value._where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value._whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteEmbeddingImpl extends _DeleteEmbedding {
  const _$DeleteEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final List<String>? ids,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      final Map<String, dynamic>? whereDocument})
      : _ids = ids,
        _where = where,
        _whereDocument = whereDocument,
        super._();

  factory _$DeleteEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteEmbeddingImplFromJson(json);

  /// Optional IDs of the items to delete.
  final List<String>? _ids;

  /// Optional IDs of the items to delete.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional query condition to filter items to delete based on metadata values.
  final Map<String, dynamic>? _where;

  /// Optional query condition to filter items to delete based on metadata values.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where {
    final value = _where;
    if (value == null) return null;
    if (_where is EqualUnmodifiableMapView) return _where;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional query condition to filter items to delete based on document content.
  final Map<String, dynamic>? _whereDocument;

  /// Optional query condition to filter items to delete based on document content.
  @override
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument {
    final value = _whereDocument;
    if (value == null) return null;
    if (_whereDocument is EqualUnmodifiableMapView) return _whereDocument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DeleteEmbedding(ids: $ids, where: $where, whereDocument: $whereDocument)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEmbeddingImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality().equals(other._where, _where) &&
            const DeepCollectionEquality()
                .equals(other._whereDocument, _whereDocument));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_where),
      const DeepCollectionEquality().hash(_whereDocument));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEmbeddingImplCopyWith<_$DeleteEmbeddingImpl> get copyWith =>
      __$$DeleteEmbeddingImplCopyWithImpl<_$DeleteEmbeddingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _DeleteEmbedding extends DeleteEmbedding {
  const factory _DeleteEmbedding(
      {@JsonKey(includeIfNull: false) final List<String>? ids,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      final Map<String, dynamic>? whereDocument}) = _$DeleteEmbeddingImpl;
  const _DeleteEmbedding._() : super._();

  factory _DeleteEmbedding.fromJson(Map<String, dynamic> json) =
      _$DeleteEmbeddingImpl.fromJson;

  @override

  /// Optional IDs of the items to delete.
  @JsonKey(includeIfNull: false)
  List<String>? get ids;
  @override

  /// Optional query condition to filter items to delete based on metadata values.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where;
  @override

  /// Optional query condition to filter items to delete based on document content.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument;
  @override
  @JsonKey(ignore: true)
  _$$DeleteEmbeddingImplCopyWith<_$DeleteEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetEmbedding _$GetEmbeddingFromJson(Map<String, dynamic> json) {
  return _GetEmbedding.fromJson(json);
}

/// @nodoc
mixin _$GetEmbedding {
  /// Optional IDs of the items to get.
  @JsonKey(includeIfNull: false)
  List<String>? get ids => throw _privateConstructorUsedError;

  /// Optional where clause to filter items by.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where => throw _privateConstructorUsedError;

  /// Optional where clause to filter items by.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument => throw _privateConstructorUsedError;

  /// Sort items.
  @JsonKey(includeIfNull: false)
  String? get sort => throw _privateConstructorUsedError;

  /// Optional limit on the number of items to get.
  @JsonKey(includeIfNull: false)
  int? get limit => throw _privateConstructorUsedError;

  /// Optional offset on the items to get.
  @JsonKey(includeIfNull: false)
  int? get offset => throw _privateConstructorUsedError;

  /// Optional list of items to include in the response.
  @JsonKey(includeIfNull: false)
  List<String>? get include => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetEmbeddingCopyWith<GetEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetEmbeddingCopyWith<$Res> {
  factory $GetEmbeddingCopyWith(
          GetEmbedding value, $Res Function(GetEmbedding) then) =
      _$GetEmbeddingCopyWithImpl<$Res, GetEmbedding>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<String>? ids,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument,
      @JsonKey(includeIfNull: false) String? sort,
      @JsonKey(includeIfNull: false) int? limit,
      @JsonKey(includeIfNull: false) int? offset,
      @JsonKey(includeIfNull: false) List<String>? include});
}

/// @nodoc
class _$GetEmbeddingCopyWithImpl<$Res, $Val extends GetEmbedding>
    implements $GetEmbeddingCopyWith<$Res> {
  _$GetEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? include = freezed,
  }) {
    return _then(_value.copyWith(
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      where: freezed == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      include: freezed == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetEmbeddingImplCopyWith<$Res>
    implements $GetEmbeddingCopyWith<$Res> {
  factory _$$GetEmbeddingImplCopyWith(
          _$GetEmbeddingImpl value, $Res Function(_$GetEmbeddingImpl) then) =
      __$$GetEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<String>? ids,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument,
      @JsonKey(includeIfNull: false) String? sort,
      @JsonKey(includeIfNull: false) int? limit,
      @JsonKey(includeIfNull: false) int? offset,
      @JsonKey(includeIfNull: false) List<String>? include});
}

/// @nodoc
class __$$GetEmbeddingImplCopyWithImpl<$Res>
    extends _$GetEmbeddingCopyWithImpl<$Res, _$GetEmbeddingImpl>
    implements _$$GetEmbeddingImplCopyWith<$Res> {
  __$$GetEmbeddingImplCopyWithImpl(
      _$GetEmbeddingImpl _value, $Res Function(_$GetEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? sort = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? include = freezed,
  }) {
    return _then(_$GetEmbeddingImpl(
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      where: freezed == where
          ? _value._where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value._whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      include: freezed == include
          ? _value._include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetEmbeddingImpl extends _GetEmbedding {
  const _$GetEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final List<String>? ids,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      final Map<String, dynamic>? whereDocument,
      @JsonKey(includeIfNull: false) this.sort,
      @JsonKey(includeIfNull: false) this.limit,
      @JsonKey(includeIfNull: false) this.offset,
      @JsonKey(includeIfNull: false) final List<String>? include})
      : _ids = ids,
        _where = where,
        _whereDocument = whereDocument,
        _include = include,
        super._();

  factory _$GetEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetEmbeddingImplFromJson(json);

  /// Optional IDs of the items to get.
  final List<String>? _ids;

  /// Optional IDs of the items to get.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional where clause to filter items by.
  final Map<String, dynamic>? _where;

  /// Optional where clause to filter items by.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where {
    final value = _where;
    if (value == null) return null;
    if (_where is EqualUnmodifiableMapView) return _where;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional where clause to filter items by.
  final Map<String, dynamic>? _whereDocument;

  /// Optional where clause to filter items by.
  @override
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument {
    final value = _whereDocument;
    if (value == null) return null;
    if (_whereDocument is EqualUnmodifiableMapView) return _whereDocument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Sort items.
  @override
  @JsonKey(includeIfNull: false)
  final String? sort;

  /// Optional limit on the number of items to get.
  @override
  @JsonKey(includeIfNull: false)
  final int? limit;

  /// Optional offset on the items to get.
  @override
  @JsonKey(includeIfNull: false)
  final int? offset;

  /// Optional list of items to include in the response.
  final List<String>? _include;

  /// Optional list of items to include in the response.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get include {
    final value = _include;
    if (value == null) return null;
    if (_include is EqualUnmodifiableListView) return _include;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetEmbedding(ids: $ids, where: $where, whereDocument: $whereDocument, sort: $sort, limit: $limit, offset: $offset, include: $include)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEmbeddingImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality().equals(other._where, _where) &&
            const DeepCollectionEquality()
                .equals(other._whereDocument, _whereDocument) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._include, _include));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_where),
      const DeepCollectionEquality().hash(_whereDocument),
      sort,
      limit,
      offset,
      const DeepCollectionEquality().hash(_include));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetEmbeddingImplCopyWith<_$GetEmbeddingImpl> get copyWith =>
      __$$GetEmbeddingImplCopyWithImpl<_$GetEmbeddingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _GetEmbedding extends GetEmbedding {
  const factory _GetEmbedding(
          {@JsonKey(includeIfNull: false) final List<String>? ids,
          @JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
          @JsonKey(name: 'where_document', includeIfNull: false)
          final Map<String, dynamic>? whereDocument,
          @JsonKey(includeIfNull: false) final String? sort,
          @JsonKey(includeIfNull: false) final int? limit,
          @JsonKey(includeIfNull: false) final int? offset,
          @JsonKey(includeIfNull: false) final List<String>? include}) =
      _$GetEmbeddingImpl;
  const _GetEmbedding._() : super._();

  factory _GetEmbedding.fromJson(Map<String, dynamic> json) =
      _$GetEmbeddingImpl.fromJson;

  @override

  /// Optional IDs of the items to get.
  @JsonKey(includeIfNull: false)
  List<String>? get ids;
  @override

  /// Optional where clause to filter items by.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where;
  @override

  /// Optional where clause to filter items by.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument;
  @override

  /// Sort items.
  @JsonKey(includeIfNull: false)
  String? get sort;
  @override

  /// Optional limit on the number of items to get.
  @JsonKey(includeIfNull: false)
  int? get limit;
  @override

  /// Optional offset on the items to get.
  @JsonKey(includeIfNull: false)
  int? get offset;
  @override

  /// Optional list of items to include in the response.
  @JsonKey(includeIfNull: false)
  List<String>? get include;
  @override
  @JsonKey(ignore: true)
  _$$GetEmbeddingImplCopyWith<_$GetEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetResponse _$GetResponseFromJson(Map<String, dynamic> json) {
  return _GetResponse.fromJson(json);
}

/// @nodoc
mixin _$GetResponse {
  /// List of ids of the items.
  List<String> get ids => throw _privateConstructorUsedError;

  /// List of embeddings of the items.
  @JsonKey(includeIfNull: false)
  List<List<double>>? get embeddings => throw _privateConstructorUsedError;

  /// List of metadatas of the items.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas =>
      throw _privateConstructorUsedError;

  /// List of documents of the items.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetResponseCopyWith<GetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetResponseCopyWith<$Res> {
  factory $GetResponseCopyWith(
          GetResponse value, $Res Function(GetResponse) then) =
      _$GetResponseCopyWithImpl<$Res, GetResponse>;
  @useResult
  $Res call(
      {List<String> ids,
      @JsonKey(includeIfNull: false) List<List<double>>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents});
}

/// @nodoc
class _$GetResponseCopyWithImpl<$Res, $Val extends GetResponse>
    implements $GetResponseCopyWith<$Res> {
  _$GetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
      metadatas: freezed == metadatas
          ? _value.metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetResponseImplCopyWith<$Res>
    implements $GetResponseCopyWith<$Res> {
  factory _$$GetResponseImplCopyWith(
          _$GetResponseImpl value, $Res Function(_$GetResponseImpl) then) =
      __$$GetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> ids,
      @JsonKey(includeIfNull: false) List<List<double>>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents});
}

/// @nodoc
class __$$GetResponseImplCopyWithImpl<$Res>
    extends _$GetResponseCopyWithImpl<$Res, _$GetResponseImpl>
    implements _$$GetResponseImplCopyWith<$Res> {
  __$$GetResponseImplCopyWithImpl(
      _$GetResponseImpl _value, $Res Function(_$GetResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$GetResponseImpl(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
      metadatas: freezed == metadatas
          ? _value._metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetResponseImpl extends _GetResponse {
  const _$GetResponseImpl(
      {required final List<String> ids,
      @JsonKey(includeIfNull: false) final List<List<double>>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) final List<String?>? documents})
      : _ids = ids,
        _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        super._();

  factory _$GetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetResponseImplFromJson(json);

  /// List of ids of the items.
  final List<String> _ids;

  /// List of ids of the items.
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  /// List of embeddings of the items.
  final List<List<double>>? _embeddings;

  /// List of embeddings of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<double>>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of metadatas of the items.
  final List<Map<String, dynamic>?>? _metadatas;

  /// List of metadatas of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of documents of the items.
  final List<String?>? _documents;

  /// List of documents of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<String?>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetResponse(ids: $ids, embeddings: $embeddings, metadatas: $metadatas, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetResponseImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            const DeepCollectionEquality()
                .equals(other._metadatas, _metadatas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_embeddings),
      const DeepCollectionEquality().hash(_metadatas),
      const DeepCollectionEquality().hash(_documents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetResponseImplCopyWith<_$GetResponseImpl> get copyWith =>
      __$$GetResponseImplCopyWithImpl<_$GetResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetResponseImplToJson(
      this,
    );
  }
}

abstract class _GetResponse extends GetResponse {
  const factory _GetResponse(
          {required final List<String> ids,
          @JsonKey(includeIfNull: false) final List<List<double>>? embeddings,
          @JsonKey(includeIfNull: false)
          final List<Map<String, dynamic>?>? metadatas,
          @JsonKey(includeIfNull: false) final List<String?>? documents}) =
      _$GetResponseImpl;
  const _GetResponse._() : super._();

  factory _GetResponse.fromJson(Map<String, dynamic> json) =
      _$GetResponseImpl.fromJson;

  @override

  /// List of ids of the items.
  List<String> get ids;
  @override

  /// List of embeddings of the items.
  @JsonKey(includeIfNull: false)
  List<List<double>>? get embeddings;
  @override

  /// List of metadatas of the items.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas;
  @override

  /// List of documents of the items.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents;
  @override
  @JsonKey(ignore: true)
  _$$GetResponseImplCopyWith<_$GetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HTTPValidationError _$HTTPValidationErrorFromJson(Map<String, dynamic> json) {
  return _HTTPValidationError.fromJson(json);
}

/// @nodoc
mixin _$HTTPValidationError {
  /// No Description
  @JsonKey(includeIfNull: false)
  List<ValidationError>? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HTTPValidationErrorCopyWith<HTTPValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HTTPValidationErrorCopyWith<$Res> {
  factory $HTTPValidationErrorCopyWith(
          HTTPValidationError value, $Res Function(HTTPValidationError) then) =
      _$HTTPValidationErrorCopyWithImpl<$Res, HTTPValidationError>;
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<ValidationError>? detail});
}

/// @nodoc
class _$HTTPValidationErrorCopyWithImpl<$Res, $Val extends HTTPValidationError>
    implements $HTTPValidationErrorCopyWith<$Res> {
  _$HTTPValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<ValidationError>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HTTPValidationErrorImplCopyWith<$Res>
    implements $HTTPValidationErrorCopyWith<$Res> {
  factory _$$HTTPValidationErrorImplCopyWith(_$HTTPValidationErrorImpl value,
          $Res Function(_$HTTPValidationErrorImpl) then) =
      __$$HTTPValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: false) List<ValidationError>? detail});
}

/// @nodoc
class __$$HTTPValidationErrorImplCopyWithImpl<$Res>
    extends _$HTTPValidationErrorCopyWithImpl<$Res, _$HTTPValidationErrorImpl>
    implements _$$HTTPValidationErrorImplCopyWith<$Res> {
  __$$HTTPValidationErrorImplCopyWithImpl(_$HTTPValidationErrorImpl _value,
      $Res Function(_$HTTPValidationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
  }) {
    return _then(_$HTTPValidationErrorImpl(
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<ValidationError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HTTPValidationErrorImpl extends _HTTPValidationError {
  const _$HTTPValidationErrorImpl(
      {@JsonKey(includeIfNull: false) final List<ValidationError>? detail})
      : _detail = detail,
        super._();

  factory _$HTTPValidationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$HTTPValidationErrorImplFromJson(json);

  /// No Description
  final List<ValidationError>? _detail;

  /// No Description
  @override
  @JsonKey(includeIfNull: false)
  List<ValidationError>? get detail {
    final value = _detail;
    if (value == null) return null;
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HTTPValidationError(detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HTTPValidationErrorImpl &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HTTPValidationErrorImplCopyWith<_$HTTPValidationErrorImpl> get copyWith =>
      __$$HTTPValidationErrorImplCopyWithImpl<_$HTTPValidationErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HTTPValidationErrorImplToJson(
      this,
    );
  }
}

abstract class _HTTPValidationError extends HTTPValidationError {
  const factory _HTTPValidationError(
      {@JsonKey(includeIfNull: false)
      final List<ValidationError>? detail}) = _$HTTPValidationErrorImpl;
  const _HTTPValidationError._() : super._();

  factory _HTTPValidationError.fromJson(Map<String, dynamic> json) =
      _$HTTPValidationErrorImpl.fromJson;

  @override

  /// No Description
  @JsonKey(includeIfNull: false)
  List<ValidationError>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$HTTPValidationErrorImplCopyWith<_$HTTPValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryEmbedding _$QueryEmbeddingFromJson(Map<String, dynamic> json) {
  return _QueryEmbedding.fromJson(json);
}

/// @nodoc
mixin _$QueryEmbedding {
  /// Optional query condition to filter results based on metadata values.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where => throw _privateConstructorUsedError;

  /// Optional query condition to filter results based on document content.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument => throw _privateConstructorUsedError;

  /// Optional query embeddings to use for the search.
  @JsonKey(name: 'query_embeddings')
  List<List<double>> get queryEmbeddings => throw _privateConstructorUsedError;

  /// Optional number of results to return
  @JsonKey(name: 'n_results')
  int get nResults => throw _privateConstructorUsedError;

  /// Optional list of items to include in the response.
  @JsonKey(includeIfNull: false)
  List<String>? get include => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryEmbeddingCopyWith<QueryEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryEmbeddingCopyWith<$Res> {
  factory $QueryEmbeddingCopyWith(
          QueryEmbedding value, $Res Function(QueryEmbedding) then) =
      _$QueryEmbeddingCopyWithImpl<$Res, QueryEmbedding>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument,
      @JsonKey(name: 'query_embeddings') List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') int nResults,
      @JsonKey(includeIfNull: false) List<String>? include});
}

/// @nodoc
class _$QueryEmbeddingCopyWithImpl<$Res, $Val extends QueryEmbedding>
    implements $QueryEmbeddingCopyWith<$Res> {
  _$QueryEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? queryEmbeddings = null,
    Object? nResults = null,
    Object? include = freezed,
  }) {
    return _then(_value.copyWith(
      where: freezed == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      queryEmbeddings: null == queryEmbeddings
          ? _value.queryEmbeddings
          : queryEmbeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      nResults: null == nResults
          ? _value.nResults
          : nResults // ignore: cast_nullable_to_non_nullable
              as int,
      include: freezed == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryEmbeddingImplCopyWith<$Res>
    implements $QueryEmbeddingCopyWith<$Res> {
  factory _$$QueryEmbeddingImplCopyWith(_$QueryEmbeddingImpl value,
          $Res Function(_$QueryEmbeddingImpl) then) =
      __$$QueryEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      Map<String, dynamic>? whereDocument,
      @JsonKey(name: 'query_embeddings') List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') int nResults,
      @JsonKey(includeIfNull: false) List<String>? include});
}

/// @nodoc
class __$$QueryEmbeddingImplCopyWithImpl<$Res>
    extends _$QueryEmbeddingCopyWithImpl<$Res, _$QueryEmbeddingImpl>
    implements _$$QueryEmbeddingImplCopyWith<$Res> {
  __$$QueryEmbeddingImplCopyWithImpl(
      _$QueryEmbeddingImpl _value, $Res Function(_$QueryEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? queryEmbeddings = null,
    Object? nResults = null,
    Object? include = freezed,
  }) {
    return _then(_$QueryEmbeddingImpl(
      where: freezed == where
          ? _value._where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value._whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      queryEmbeddings: null == queryEmbeddings
          ? _value._queryEmbeddings
          : queryEmbeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      nResults: null == nResults
          ? _value.nResults
          : nResults // ignore: cast_nullable_to_non_nullable
              as int,
      include: freezed == include
          ? _value._include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryEmbeddingImpl extends _QueryEmbedding {
  const _$QueryEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document', includeIfNull: false)
      final Map<String, dynamic>? whereDocument,
      @JsonKey(name: 'query_embeddings')
      required final List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') this.nResults = 10,
      @JsonKey(includeIfNull: false) final List<String>? include})
      : _where = where,
        _whereDocument = whereDocument,
        _queryEmbeddings = queryEmbeddings,
        _include = include,
        super._();

  factory _$QueryEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryEmbeddingImplFromJson(json);

  /// Optional query condition to filter results based on metadata values.
  final Map<String, dynamic>? _where;

  /// Optional query condition to filter results based on metadata values.
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where {
    final value = _where;
    if (value == null) return null;
    if (_where is EqualUnmodifiableMapView) return _where;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional query condition to filter results based on document content.
  final Map<String, dynamic>? _whereDocument;

  /// Optional query condition to filter results based on document content.
  @override
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument {
    final value = _whereDocument;
    if (value == null) return null;
    if (_whereDocument is EqualUnmodifiableMapView) return _whereDocument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional query embeddings to use for the search.
  final List<List<double>> _queryEmbeddings;

  /// Optional query embeddings to use for the search.
  @override
  @JsonKey(name: 'query_embeddings')
  List<List<double>> get queryEmbeddings {
    if (_queryEmbeddings is EqualUnmodifiableListView) return _queryEmbeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queryEmbeddings);
  }

  /// Optional number of results to return
  @override
  @JsonKey(name: 'n_results')
  final int nResults;

  /// Optional list of items to include in the response.
  final List<String>? _include;

  /// Optional list of items to include in the response.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get include {
    final value = _include;
    if (value == null) return null;
    if (_include is EqualUnmodifiableListView) return _include;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueryEmbedding(where: $where, whereDocument: $whereDocument, queryEmbeddings: $queryEmbeddings, nResults: $nResults, include: $include)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryEmbeddingImpl &&
            const DeepCollectionEquality().equals(other._where, _where) &&
            const DeepCollectionEquality()
                .equals(other._whereDocument, _whereDocument) &&
            const DeepCollectionEquality()
                .equals(other._queryEmbeddings, _queryEmbeddings) &&
            (identical(other.nResults, nResults) ||
                other.nResults == nResults) &&
            const DeepCollectionEquality().equals(other._include, _include));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_where),
      const DeepCollectionEquality().hash(_whereDocument),
      const DeepCollectionEquality().hash(_queryEmbeddings),
      nResults,
      const DeepCollectionEquality().hash(_include));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryEmbeddingImplCopyWith<_$QueryEmbeddingImpl> get copyWith =>
      __$$QueryEmbeddingImplCopyWithImpl<_$QueryEmbeddingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _QueryEmbedding extends QueryEmbedding {
  const factory _QueryEmbedding(
          {@JsonKey(includeIfNull: false) final Map<String, dynamic>? where,
          @JsonKey(name: 'where_document', includeIfNull: false)
          final Map<String, dynamic>? whereDocument,
          @JsonKey(name: 'query_embeddings')
          required final List<List<double>> queryEmbeddings,
          @JsonKey(name: 'n_results') final int nResults,
          @JsonKey(includeIfNull: false) final List<String>? include}) =
      _$QueryEmbeddingImpl;
  const _QueryEmbedding._() : super._();

  factory _QueryEmbedding.fromJson(Map<String, dynamic> json) =
      _$QueryEmbeddingImpl.fromJson;

  @override

  /// Optional query condition to filter results based on metadata values.
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get where;
  @override

  /// Optional query condition to filter results based on document content.
  @JsonKey(name: 'where_document', includeIfNull: false)
  Map<String, dynamic>? get whereDocument;
  @override

  /// Optional query embeddings to use for the search.
  @JsonKey(name: 'query_embeddings')
  List<List<double>> get queryEmbeddings;
  @override

  /// Optional number of results to return
  @JsonKey(name: 'n_results')
  int get nResults;
  @override

  /// Optional list of items to include in the response.
  @JsonKey(includeIfNull: false)
  List<String>? get include;
  @override
  @JsonKey(ignore: true)
  _$$QueryEmbeddingImplCopyWith<_$QueryEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) {
  return _QueryResponse.fromJson(json);
}

/// @nodoc
mixin _$QueryResponse {
  /// List of embeddings of the items.
  @JsonKey(includeIfNull: false)
  List<List<List<double>>>? get embeddings =>
      throw _privateConstructorUsedError;

  /// List of metadatas of the items.
  @JsonKey(includeIfNull: false)
  List<List<Map<String, dynamic>?>>? get metadatas =>
      throw _privateConstructorUsedError;

  /// List of documents of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get documents => throw _privateConstructorUsedError;

  /// List of data of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get data => throw _privateConstructorUsedError;

  /// List of uris of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get uris => throw _privateConstructorUsedError;

  /// List of ids of the items.
  List<List<String>> get ids => throw _privateConstructorUsedError;

  /// List of distances of the items.
  @JsonKey(includeIfNull: false)
  List<List<double>>? get distances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryResponseCopyWith<QueryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryResponseCopyWith<$Res> {
  factory $QueryResponseCopyWith(
          QueryResponse value, $Res Function(QueryResponse) then) =
      _$QueryResponseCopyWithImpl<$Res, QueryResponse>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<List<double>>>? embeddings,
      @JsonKey(includeIfNull: false)
      List<List<Map<String, dynamic>?>>? metadatas,
      @JsonKey(includeIfNull: false) List<List<String?>>? documents,
      @JsonKey(includeIfNull: false) List<List<String?>>? data,
      @JsonKey(includeIfNull: false) List<List<String?>>? uris,
      List<List<String>> ids,
      @JsonKey(includeIfNull: false) List<List<double>>? distances});
}

/// @nodoc
class _$QueryResponseCopyWithImpl<$Res, $Val extends QueryResponse>
    implements $QueryResponseCopyWith<$Res> {
  _$QueryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? data = freezed,
    Object? uris = freezed,
    Object? ids = null,
    Object? distances = freezed,
  }) {
    return _then(_value.copyWith(
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>?,
      metadatas: freezed == metadatas
          ? _value.metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<List<Map<String, dynamic>?>>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      uris: freezed == uris
          ? _value.uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      distances: freezed == distances
          ? _value.distances
          : distances // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryResponseImplCopyWith<$Res>
    implements $QueryResponseCopyWith<$Res> {
  factory _$$QueryResponseImplCopyWith(
          _$QueryResponseImpl value, $Res Function(_$QueryResponseImpl) then) =
      __$$QueryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<List<double>>>? embeddings,
      @JsonKey(includeIfNull: false)
      List<List<Map<String, dynamic>?>>? metadatas,
      @JsonKey(includeIfNull: false) List<List<String?>>? documents,
      @JsonKey(includeIfNull: false) List<List<String?>>? data,
      @JsonKey(includeIfNull: false) List<List<String?>>? uris,
      List<List<String>> ids,
      @JsonKey(includeIfNull: false) List<List<double>>? distances});
}

/// @nodoc
class __$$QueryResponseImplCopyWithImpl<$Res>
    extends _$QueryResponseCopyWithImpl<$Res, _$QueryResponseImpl>
    implements _$$QueryResponseImplCopyWith<$Res> {
  __$$QueryResponseImplCopyWithImpl(
      _$QueryResponseImpl _value, $Res Function(_$QueryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? data = freezed,
    Object? uris = freezed,
    Object? ids = null,
    Object? distances = freezed,
  }) {
    return _then(_$QueryResponseImpl(
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>?,
      metadatas: freezed == metadatas
          ? _value._metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<List<Map<String, dynamic>?>>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      uris: freezed == uris
          ? _value._uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<List<String?>>?,
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      distances: freezed == distances
          ? _value._distances
          : distances // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryResponseImpl extends _QueryResponse {
  const _$QueryResponseImpl(
      {@JsonKey(includeIfNull: false)
      final List<List<List<double>>>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<List<Map<String, dynamic>?>>? metadatas,
      @JsonKey(includeIfNull: false) final List<List<String?>>? documents,
      @JsonKey(includeIfNull: false) final List<List<String?>>? data,
      @JsonKey(includeIfNull: false) final List<List<String?>>? uris,
      required final List<List<String>> ids,
      @JsonKey(includeIfNull: false) final List<List<double>>? distances})
      : _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        _data = data,
        _uris = uris,
        _ids = ids,
        _distances = distances,
        super._();

  factory _$QueryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryResponseImplFromJson(json);

  /// List of embeddings of the items.
  final List<List<List<double>>>? _embeddings;

  /// List of embeddings of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<List<double>>>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of metadatas of the items.
  final List<List<Map<String, dynamic>?>>? _metadatas;

  /// List of metadatas of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<Map<String, dynamic>?>>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of documents of the items.
  final List<List<String?>>? _documents;

  /// List of documents of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of data of the items.
  final List<List<String?>>? _data;

  /// List of data of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of uris of the items.
  final List<List<String?>>? _uris;

  /// List of uris of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get uris {
    final value = _uris;
    if (value == null) return null;
    if (_uris is EqualUnmodifiableListView) return _uris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of ids of the items.
  final List<List<String>> _ids;

  /// List of ids of the items.
  @override
  List<List<String>> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  /// List of distances of the items.
  final List<List<double>>? _distances;

  /// List of distances of the items.
  @override
  @JsonKey(includeIfNull: false)
  List<List<double>>? get distances {
    final value = _distances;
    if (value == null) return null;
    if (_distances is EqualUnmodifiableListView) return _distances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueryResponse(embeddings: $embeddings, metadatas: $metadatas, documents: $documents, data: $data, uris: $uris, ids: $ids, distances: $distances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            const DeepCollectionEquality()
                .equals(other._metadatas, _metadatas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._uris, _uris) &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality()
                .equals(other._distances, _distances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_embeddings),
      const DeepCollectionEquality().hash(_metadatas),
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_uris),
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_distances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryResponseImplCopyWith<_$QueryResponseImpl> get copyWith =>
      __$$QueryResponseImplCopyWithImpl<_$QueryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryResponseImplToJson(
      this,
    );
  }
}

abstract class _QueryResponse extends QueryResponse {
  const factory _QueryResponse(
          {@JsonKey(includeIfNull: false)
          final List<List<List<double>>>? embeddings,
          @JsonKey(includeIfNull: false)
          final List<List<Map<String, dynamic>?>>? metadatas,
          @JsonKey(includeIfNull: false) final List<List<String?>>? documents,
          @JsonKey(includeIfNull: false) final List<List<String?>>? data,
          @JsonKey(includeIfNull: false) final List<List<String?>>? uris,
          required final List<List<String>> ids,
          @JsonKey(includeIfNull: false) final List<List<double>>? distances}) =
      _$QueryResponseImpl;
  const _QueryResponse._() : super._();

  factory _QueryResponse.fromJson(Map<String, dynamic> json) =
      _$QueryResponseImpl.fromJson;

  @override

  /// List of embeddings of the items.
  @JsonKey(includeIfNull: false)
  List<List<List<double>>>? get embeddings;
  @override

  /// List of metadatas of the items.
  @JsonKey(includeIfNull: false)
  List<List<Map<String, dynamic>?>>? get metadatas;
  @override

  /// List of documents of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get documents;
  @override

  /// List of data of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get data;
  @override

  /// List of uris of the items.
  @JsonKey(includeIfNull: false)
  List<List<String?>>? get uris;
  @override

  /// List of ids of the items.
  List<List<String>> get ids;
  @override

  /// List of distances of the items.
  @JsonKey(includeIfNull: false)
  List<List<double>>? get distances;
  @override
  @JsonKey(ignore: true)
  _$$QueryResponseImplCopyWith<_$QueryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateCollection _$UpdateCollectionFromJson(Map<String, dynamic> json) {
  return _UpdateCollection.fromJson(json);
}

/// @nodoc
mixin _$UpdateCollection {
  /// New name of the collection.
  @JsonKey(name: 'new_name', includeIfNull: false)
  String? get newName => throw _privateConstructorUsedError;

  /// New metadata of the collection.
  @JsonKey(name: 'new_metadata', includeIfNull: false)
  Map<String, dynamic>? get newMetadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCollectionCopyWith<UpdateCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCollectionCopyWith<$Res> {
  factory $UpdateCollectionCopyWith(
          UpdateCollection value, $Res Function(UpdateCollection) then) =
      _$UpdateCollectionCopyWithImpl<$Res, UpdateCollection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'new_name', includeIfNull: false) String? newName,
      @JsonKey(name: 'new_metadata', includeIfNull: false)
      Map<String, dynamic>? newMetadata});
}

/// @nodoc
class _$UpdateCollectionCopyWithImpl<$Res, $Val extends UpdateCollection>
    implements $UpdateCollectionCopyWith<$Res> {
  _$UpdateCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newName = freezed,
    Object? newMetadata = freezed,
  }) {
    return _then(_value.copyWith(
      newName: freezed == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String?,
      newMetadata: freezed == newMetadata
          ? _value.newMetadata
          : newMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCollectionImplCopyWith<$Res>
    implements $UpdateCollectionCopyWith<$Res> {
  factory _$$UpdateCollectionImplCopyWith(_$UpdateCollectionImpl value,
          $Res Function(_$UpdateCollectionImpl) then) =
      __$$UpdateCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'new_name', includeIfNull: false) String? newName,
      @JsonKey(name: 'new_metadata', includeIfNull: false)
      Map<String, dynamic>? newMetadata});
}

/// @nodoc
class __$$UpdateCollectionImplCopyWithImpl<$Res>
    extends _$UpdateCollectionCopyWithImpl<$Res, _$UpdateCollectionImpl>
    implements _$$UpdateCollectionImplCopyWith<$Res> {
  __$$UpdateCollectionImplCopyWithImpl(_$UpdateCollectionImpl _value,
      $Res Function(_$UpdateCollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newName = freezed,
    Object? newMetadata = freezed,
  }) {
    return _then(_$UpdateCollectionImpl(
      newName: freezed == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String?,
      newMetadata: freezed == newMetadata
          ? _value._newMetadata
          : newMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCollectionImpl extends _UpdateCollection {
  const _$UpdateCollectionImpl(
      {@JsonKey(name: 'new_name', includeIfNull: false) this.newName,
      @JsonKey(name: 'new_metadata', includeIfNull: false)
      final Map<String, dynamic>? newMetadata})
      : _newMetadata = newMetadata,
        super._();

  factory _$UpdateCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCollectionImplFromJson(json);

  /// New name of the collection.
  @override
  @JsonKey(name: 'new_name', includeIfNull: false)
  final String? newName;

  /// New metadata of the collection.
  final Map<String, dynamic>? _newMetadata;

  /// New metadata of the collection.
  @override
  @JsonKey(name: 'new_metadata', includeIfNull: false)
  Map<String, dynamic>? get newMetadata {
    final value = _newMetadata;
    if (value == null) return null;
    if (_newMetadata is EqualUnmodifiableMapView) return _newMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UpdateCollection(newName: $newName, newMetadata: $newMetadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCollectionImpl &&
            (identical(other.newName, newName) || other.newName == newName) &&
            const DeepCollectionEquality()
                .equals(other._newMetadata, _newMetadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, newName, const DeepCollectionEquality().hash(_newMetadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCollectionImplCopyWith<_$UpdateCollectionImpl> get copyWith =>
      __$$UpdateCollectionImplCopyWithImpl<_$UpdateCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCollectionImplToJson(
      this,
    );
  }
}

abstract class _UpdateCollection extends UpdateCollection {
  const factory _UpdateCollection(
      {@JsonKey(name: 'new_name', includeIfNull: false) final String? newName,
      @JsonKey(name: 'new_metadata', includeIfNull: false)
      final Map<String, dynamic>? newMetadata}) = _$UpdateCollectionImpl;
  const _UpdateCollection._() : super._();

  factory _UpdateCollection.fromJson(Map<String, dynamic> json) =
      _$UpdateCollectionImpl.fromJson;

  @override

  /// New name of the collection.
  @JsonKey(name: 'new_name', includeIfNull: false)
  String? get newName;
  @override

  /// New metadata of the collection.
  @JsonKey(name: 'new_metadata', includeIfNull: false)
  Map<String, dynamic>? get newMetadata;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCollectionImplCopyWith<_$UpdateCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateEmbedding _$UpdateEmbeddingFromJson(Map<String, dynamic> json) {
  return _UpdateEmbedding.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmbedding {
  /// Optional embeddings of the items to update.
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings => throw _privateConstructorUsedError;

  /// Optional metadatas of the items to update.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas =>
      throw _privateConstructorUsedError;

  /// Optional documents of the items to update.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents => throw _privateConstructorUsedError;

  /// Optional uris of the items to update.
  @JsonKey(includeIfNull: false)
  List<String?>? get uris => throw _privateConstructorUsedError;

  /// IDs of the items to update
  List<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateEmbeddingCopyWith<UpdateEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmbeddingCopyWith<$Res> {
  factory $UpdateEmbeddingCopyWith(
          UpdateEmbedding value, $Res Function(UpdateEmbedding) then) =
      _$UpdateEmbeddingCopyWithImpl<$Res, UpdateEmbedding>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents,
      @JsonKey(includeIfNull: false) List<String?>? uris,
      List<String> ids});
}

/// @nodoc
class _$UpdateEmbeddingCopyWithImpl<$Res, $Val extends UpdateEmbedding>
    implements $UpdateEmbeddingCopyWith<$Res> {
  _$UpdateEmbeddingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? uris = freezed,
    Object? ids = null,
  }) {
    return _then(_value.copyWith(
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>?>?,
      metadatas: freezed == metadatas
          ? _value.metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      uris: freezed == uris
          ? _value.uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEmbeddingImplCopyWith<$Res>
    implements $UpdateEmbeddingCopyWith<$Res> {
  factory _$$UpdateEmbeddingImplCopyWith(_$UpdateEmbeddingImpl value,
          $Res Function(_$UpdateEmbeddingImpl) then) =
      __$$UpdateEmbeddingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) List<String?>? documents,
      @JsonKey(includeIfNull: false) List<String?>? uris,
      List<String> ids});
}

/// @nodoc
class __$$UpdateEmbeddingImplCopyWithImpl<$Res>
    extends _$UpdateEmbeddingCopyWithImpl<$Res, _$UpdateEmbeddingImpl>
    implements _$$UpdateEmbeddingImplCopyWith<$Res> {
  __$$UpdateEmbeddingImplCopyWithImpl(
      _$UpdateEmbeddingImpl _value, $Res Function(_$UpdateEmbeddingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? uris = freezed,
    Object? ids = null,
  }) {
    return _then(_$UpdateEmbeddingImpl(
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>?>?,
      metadatas: freezed == metadatas
          ? _value._metadatas
          : metadatas // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>?>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      uris: freezed == uris
          ? _value._uris
          : uris // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmbeddingImpl extends _UpdateEmbedding {
  const _$UpdateEmbeddingImpl(
      {@JsonKey(includeIfNull: false) final List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) final List<String?>? documents,
      @JsonKey(includeIfNull: false) final List<String?>? uris,
      required final List<String> ids})
      : _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        _uris = uris,
        _ids = ids,
        super._();

  factory _$UpdateEmbeddingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEmbeddingImplFromJson(json);

  /// Optional embeddings of the items to update.
  final List<List<double>?>? _embeddings;

  /// Optional embeddings of the items to update.
  @override
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional metadatas of the items to update.
  final List<Map<String, dynamic>?>? _metadatas;

  /// Optional metadatas of the items to update.
  @override
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional documents of the items to update.
  final List<String?>? _documents;

  /// Optional documents of the items to update.
  @override
  @JsonKey(includeIfNull: false)
  List<String?>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional uris of the items to update.
  final List<String?>? _uris;

  /// Optional uris of the items to update.
  @override
  @JsonKey(includeIfNull: false)
  List<String?>? get uris {
    final value = _uris;
    if (value == null) return null;
    if (_uris is EqualUnmodifiableListView) return _uris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// IDs of the items to update
  final List<String> _ids;

  /// IDs of the items to update
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'UpdateEmbedding(embeddings: $embeddings, metadatas: $metadatas, documents: $documents, uris: $uris, ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmbeddingImpl &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            const DeepCollectionEquality()
                .equals(other._metadatas, _metadatas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality().equals(other._uris, _uris) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_embeddings),
      const DeepCollectionEquality().hash(_metadatas),
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_uris),
      const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmbeddingImplCopyWith<_$UpdateEmbeddingImpl> get copyWith =>
      __$$UpdateEmbeddingImplCopyWithImpl<_$UpdateEmbeddingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmbeddingImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmbedding extends UpdateEmbedding {
  const factory _UpdateEmbedding(
      {@JsonKey(includeIfNull: false) final List<List<double>?>? embeddings,
      @JsonKey(includeIfNull: false)
      final List<Map<String, dynamic>?>? metadatas,
      @JsonKey(includeIfNull: false) final List<String?>? documents,
      @JsonKey(includeIfNull: false) final List<String?>? uris,
      required final List<String> ids}) = _$UpdateEmbeddingImpl;
  const _UpdateEmbedding._() : super._();

  factory _UpdateEmbedding.fromJson(Map<String, dynamic> json) =
      _$UpdateEmbeddingImpl.fromJson;

  @override

  /// Optional embeddings of the items to update.
  @JsonKey(includeIfNull: false)
  List<List<double>?>? get embeddings;
  @override

  /// Optional metadatas of the items to update.
  @JsonKey(includeIfNull: false)
  List<Map<String, dynamic>?>? get metadatas;
  @override

  /// Optional documents of the items to update.
  @JsonKey(includeIfNull: false)
  List<String?>? get documents;
  @override

  /// Optional uris of the items to update.
  @JsonKey(includeIfNull: false)
  List<String?>? get uris;
  @override

  /// IDs of the items to update
  List<String> get ids;
  @override
  @JsonKey(ignore: true)
  _$$UpdateEmbeddingImplCopyWith<_$UpdateEmbeddingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  /// No Description
  List<dynamic> get loc => throw _privateConstructorUsedError;

  /// No Description
  String get msg => throw _privateConstructorUsedError;

  /// No Description
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationErrorCopyWith<ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorCopyWith<$Res> {
  factory $ValidationErrorCopyWith(
          ValidationError value, $Res Function(ValidationError) then) =
      _$ValidationErrorCopyWithImpl<$Res, ValidationError>;
  @useResult
  $Res call({List<dynamic> loc, String msg, String type});
}

/// @nodoc
class _$ValidationErrorCopyWithImpl<$Res, $Val extends ValidationError>
    implements $ValidationErrorCopyWith<$Res> {
  _$ValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loc = null,
    Object? msg = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      loc: null == loc
          ? _value.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> loc, String msg, String type});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loc = null,
    Object? msg = null,
    Object? type = null,
  }) {
    return _then(_$ValidationErrorImpl(
      loc: null == loc
          ? _value._loc
          : loc // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationErrorImpl extends _ValidationError {
  const _$ValidationErrorImpl(
      {required final List<dynamic> loc, required this.msg, required this.type})
      : _loc = loc,
        super._();

  factory _$ValidationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationErrorImplFromJson(json);

  /// No Description
  final List<dynamic> _loc;

  /// No Description
  @override
  List<dynamic> get loc {
    if (_loc is EqualUnmodifiableListView) return _loc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loc);
  }

  /// No Description
  @override
  final String msg;

  /// No Description
  @override
  final String type;

  @override
  String toString() {
    return 'ValidationError(loc: $loc, msg: $msg, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            const DeepCollectionEquality().equals(other._loc, _loc) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_loc), msg, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationErrorImplToJson(
      this,
    );
  }
}

abstract class _ValidationError extends ValidationError {
  const factory _ValidationError(
      {required final List<dynamic> loc,
      required final String msg,
      required final String type}) = _$ValidationErrorImpl;
  const _ValidationError._() : super._();

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$ValidationErrorImpl.fromJson;

  @override

  /// No Description
  List<dynamic> get loc;
  @override

  /// No Description
  String get msg;
  @override

  /// No Description
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
