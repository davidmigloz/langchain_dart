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
  /// IDs of the items to add
  List<String> get ids => throw _privateConstructorUsedError;

  /// Optional embeddings of the items to add.
  List<List<double>>? get embeddings => throw _privateConstructorUsedError;

  /// Optional metadatas of the items to add.
  List<Map<String, dynamic>>? get metadatas =>
      throw _privateConstructorUsedError;

  /// Optional documents of the items to add.
  List<String>? get documents => throw _privateConstructorUsedError;

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
      {List<String> ids,
      List<List<double>>? embeddings,
      List<Map<String, dynamic>>? metadatas,
      List<String>? documents});
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
              as List<Map<String, dynamic>>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddEmbeddingCopyWith<$Res>
    implements $AddEmbeddingCopyWith<$Res> {
  factory _$$_AddEmbeddingCopyWith(
          _$_AddEmbedding value, $Res Function(_$_AddEmbedding) then) =
      __$$_AddEmbeddingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> ids,
      List<List<double>>? embeddings,
      List<Map<String, dynamic>>? metadatas,
      List<String>? documents});
}

/// @nodoc
class __$$_AddEmbeddingCopyWithImpl<$Res>
    extends _$AddEmbeddingCopyWithImpl<$Res, _$_AddEmbedding>
    implements _$$_AddEmbeddingCopyWith<$Res> {
  __$$_AddEmbeddingCopyWithImpl(
      _$_AddEmbedding _value, $Res Function(_$_AddEmbedding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_AddEmbedding(
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
              as List<Map<String, dynamic>>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddEmbedding extends _AddEmbedding {
  const _$_AddEmbedding(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>>? metadatas,
      final List<String>? documents})
      : _ids = ids,
        _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        super._();

  factory _$_AddEmbedding.fromJson(Map<String, dynamic> json) =>
      _$$_AddEmbeddingFromJson(json);

  /// IDs of the items to add
  final List<String> _ids;

  /// IDs of the items to add
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  /// Optional embeddings of the items to add.
  final List<List<double>>? _embeddings;

  /// Optional embeddings of the items to add.
  @override
  List<List<double>>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional metadatas of the items to add.
  final List<Map<String, dynamic>>? _metadatas;

  /// Optional metadatas of the items to add.
  @override
  List<Map<String, dynamic>>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional documents of the items to add.
  final List<String>? _documents;

  /// Optional documents of the items to add.
  @override
  List<String>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddEmbedding(ids: $ids, embeddings: $embeddings, metadatas: $metadatas, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEmbedding &&
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
  _$$_AddEmbeddingCopyWith<_$_AddEmbedding> get copyWith =>
      __$$_AddEmbeddingCopyWithImpl<_$_AddEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddEmbeddingToJson(
      this,
    );
  }
}

abstract class _AddEmbedding extends AddEmbedding {
  const factory _AddEmbedding(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>>? metadatas,
      final List<String>? documents}) = _$_AddEmbedding;
  const _AddEmbedding._() : super._();

  factory _AddEmbedding.fromJson(Map<String, dynamic> json) =
      _$_AddEmbedding.fromJson;

  @override

  /// IDs of the items to add
  List<String> get ids;
  @override

  /// Optional embeddings of the items to add.
  List<List<double>>? get embeddings;
  @override

  /// Optional metadatas of the items to add.
  List<Map<String, dynamic>>? get metadatas;
  @override

  /// Optional documents of the items to add.
  List<String>? get documents;
  @override
  @JsonKey(ignore: true)
  _$$_AddEmbeddingCopyWith<_$_AddEmbedding> get copyWith =>
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
  $Res call({String name, String id, Map<String, dynamic>? metadata});
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
abstract class _$$_CollectionTypeCopyWith<$Res>
    implements $CollectionTypeCopyWith<$Res> {
  factory _$$_CollectionTypeCopyWith(
          _$_CollectionType value, $Res Function(_$_CollectionType) then) =
      __$$_CollectionTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$_CollectionTypeCopyWithImpl<$Res>
    extends _$CollectionTypeCopyWithImpl<$Res, _$_CollectionType>
    implements _$$_CollectionTypeCopyWith<$Res> {
  __$$_CollectionTypeCopyWithImpl(
      _$_CollectionType _value, $Res Function(_$_CollectionType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? metadata = freezed,
  }) {
    return _then(_$_CollectionType(
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
class _$_CollectionType extends _CollectionType {
  const _$_CollectionType(
      {required this.name,
      required this.id,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$_CollectionType.fromJson(Map<String, dynamic> json) =>
      _$$_CollectionTypeFromJson(json);

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
            other is _$_CollectionType &&
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
  _$$_CollectionTypeCopyWith<_$_CollectionType> get copyWith =>
      __$$_CollectionTypeCopyWithImpl<_$_CollectionType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectionTypeToJson(
      this,
    );
  }
}

abstract class _CollectionType extends CollectionType {
  const factory _CollectionType(
      {required final String name,
      required final String id,
      final Map<String, dynamic>? metadata}) = _$_CollectionType;
  const _CollectionType._() : super._();

  factory _CollectionType.fromJson(Map<String, dynamic> json) =
      _$_CollectionType.fromJson;

  @override

  /// Name of the collection.
  String get name;
  @override

  /// Id of the collection.
  String get id;
  @override

  /// Metadata of the collection.
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionTypeCopyWith<_$_CollectionType> get copyWith =>
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
      Map<String, dynamic>? metadata,
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
abstract class _$$_CreateCollectionCopyWith<$Res>
    implements $CreateCollectionCopyWith<$Res> {
  factory _$$_CreateCollectionCopyWith(
          _$_CreateCollection value, $Res Function(_$_CreateCollection) then) =
      __$$_CreateCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'get_or_create') bool getOrCreate});
}

/// @nodoc
class __$$_CreateCollectionCopyWithImpl<$Res>
    extends _$CreateCollectionCopyWithImpl<$Res, _$_CreateCollection>
    implements _$$_CreateCollectionCopyWith<$Res> {
  __$$_CreateCollectionCopyWithImpl(
      _$_CreateCollection _value, $Res Function(_$_CreateCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = freezed,
    Object? getOrCreate = null,
  }) {
    return _then(_$_CreateCollection(
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
class _$_CreateCollection extends _CreateCollection {
  const _$_CreateCollection(
      {required this.name,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'get_or_create') this.getOrCreate = false})
      : _metadata = metadata,
        super._();

  factory _$_CreateCollection.fromJson(Map<String, dynamic> json) =>
      _$$_CreateCollectionFromJson(json);

  /// Name of the collection.
  @override
  final String name;

  /// Metadata of the collection.
  final Map<String, dynamic>? _metadata;

  /// Metadata of the collection.
  @override
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
            other is _$_CreateCollection &&
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
  _$$_CreateCollectionCopyWith<_$_CreateCollection> get copyWith =>
      __$$_CreateCollectionCopyWithImpl<_$_CreateCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateCollectionToJson(
      this,
    );
  }
}

abstract class _CreateCollection extends CreateCollection {
  const factory _CreateCollection(
          {required final String name,
          final Map<String, dynamic>? metadata,
          @JsonKey(name: 'get_or_create') final bool getOrCreate}) =
      _$_CreateCollection;
  const _CreateCollection._() : super._();

  factory _CreateCollection.fromJson(Map<String, dynamic> json) =
      _$_CreateCollection.fromJson;

  @override

  /// Name of the collection.
  String get name;
  @override

  /// Metadata of the collection.
  Map<String, dynamic>? get metadata;
  @override

  /// If true, will return existing collection if it exists.
  @JsonKey(name: 'get_or_create')
  bool get getOrCreate;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCollectionCopyWith<_$_CreateCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteEmbedding _$DeleteEmbeddingFromJson(Map<String, dynamic> json) {
  return _DeleteEmbedding.fromJson(json);
}

/// @nodoc
mixin _$DeleteEmbedding {
  /// Optional IDs of the items to delete.
  List<String>? get ids => throw _privateConstructorUsedError;

  /// Optional query condition to filter items to delete based on metadata values..
  Map<String, dynamic>? get where => throw _privateConstructorUsedError;

  /// Optional query condition to filter items to delete based on document content.
  @JsonKey(name: 'where_document')
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
      {List<String>? ids,
      Map<String, dynamic>? where,
      @JsonKey(name: 'where_document') Map<String, dynamic>? whereDocument});
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
abstract class _$$_DeleteEmbeddingCopyWith<$Res>
    implements $DeleteEmbeddingCopyWith<$Res> {
  factory _$$_DeleteEmbeddingCopyWith(
          _$_DeleteEmbedding value, $Res Function(_$_DeleteEmbedding) then) =
      __$$_DeleteEmbeddingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? ids,
      Map<String, dynamic>? where,
      @JsonKey(name: 'where_document') Map<String, dynamic>? whereDocument});
}

/// @nodoc
class __$$_DeleteEmbeddingCopyWithImpl<$Res>
    extends _$DeleteEmbeddingCopyWithImpl<$Res, _$_DeleteEmbedding>
    implements _$$_DeleteEmbeddingCopyWith<$Res> {
  __$$_DeleteEmbeddingCopyWithImpl(
      _$_DeleteEmbedding _value, $Res Function(_$_DeleteEmbedding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = freezed,
    Object? where = freezed,
    Object? whereDocument = freezed,
  }) {
    return _then(_$_DeleteEmbedding(
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
class _$_DeleteEmbedding extends _DeleteEmbedding {
  const _$_DeleteEmbedding(
      {final List<String>? ids,
      final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document')
      final Map<String, dynamic>? whereDocument})
      : _ids = ids,
        _where = where,
        _whereDocument = whereDocument,
        super._();

  factory _$_DeleteEmbedding.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteEmbeddingFromJson(json);

  /// Optional IDs of the items to delete.
  final List<String>? _ids;

  /// Optional IDs of the items to delete.
  @override
  List<String>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional query condition to filter items to delete based on metadata values..
  final Map<String, dynamic>? _where;

  /// Optional query condition to filter items to delete based on metadata values..
  @override
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
  @JsonKey(name: 'where_document')
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
            other is _$_DeleteEmbedding &&
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
  _$$_DeleteEmbeddingCopyWith<_$_DeleteEmbedding> get copyWith =>
      __$$_DeleteEmbeddingCopyWithImpl<_$_DeleteEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteEmbeddingToJson(
      this,
    );
  }
}

abstract class _DeleteEmbedding extends DeleteEmbedding {
  const factory _DeleteEmbedding(
      {final List<String>? ids,
      final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document')
      final Map<String, dynamic>? whereDocument}) = _$_DeleteEmbedding;
  const _DeleteEmbedding._() : super._();

  factory _DeleteEmbedding.fromJson(Map<String, dynamic> json) =
      _$_DeleteEmbedding.fromJson;

  @override

  /// Optional IDs of the items to delete.
  List<String>? get ids;
  @override

  /// Optional query condition to filter items to delete based on metadata values..
  Map<String, dynamic>? get where;
  @override

  /// Optional query condition to filter items to delete based on document content.
  @JsonKey(name: 'where_document')
  Map<String, dynamic>? get whereDocument;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteEmbeddingCopyWith<_$_DeleteEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

GetEmbedding _$GetEmbeddingFromJson(Map<String, dynamic> json) {
  return _GetEmbedding.fromJson(json);
}

/// @nodoc
mixin _$GetEmbedding {
  /// Optional IDs of the items to get.
  List<String>? get ids => throw _privateConstructorUsedError;

  /// Optional where clause to filter items by.
  dynamic get where => throw _privateConstructorUsedError;

  /// Optional where clause to filter items by.
  @JsonKey(name: 'where_document')
  dynamic get whereDocument => throw _privateConstructorUsedError;

  /// Sort items.
  String? get sort => throw _privateConstructorUsedError;

  /// Optional limit on the number of items to get.
  int? get limit => throw _privateConstructorUsedError;

  /// Optional offset on the items to get.
  int? get offset => throw _privateConstructorUsedError;

  /// Optional list of items to include in the response.
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
      {List<String>? ids,
      dynamic where,
      @JsonKey(name: 'where_document') dynamic whereDocument,
      String? sort,
      int? limit,
      int? offset,
      List<String>? include});
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
              as dynamic,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_GetEmbeddingCopyWith<$Res>
    implements $GetEmbeddingCopyWith<$Res> {
  factory _$$_GetEmbeddingCopyWith(
          _$_GetEmbedding value, $Res Function(_$_GetEmbedding) then) =
      __$$_GetEmbeddingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? ids,
      dynamic where,
      @JsonKey(name: 'where_document') dynamic whereDocument,
      String? sort,
      int? limit,
      int? offset,
      List<String>? include});
}

/// @nodoc
class __$$_GetEmbeddingCopyWithImpl<$Res>
    extends _$GetEmbeddingCopyWithImpl<$Res, _$_GetEmbedding>
    implements _$$_GetEmbeddingCopyWith<$Res> {
  __$$_GetEmbeddingCopyWithImpl(
      _$_GetEmbedding _value, $Res Function(_$_GetEmbedding) _then)
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
    return _then(_$_GetEmbedding(
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      where: freezed == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as dynamic,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$_GetEmbedding extends _GetEmbedding {
  const _$_GetEmbedding(
      {final List<String>? ids,
      this.where,
      @JsonKey(name: 'where_document') this.whereDocument,
      this.sort,
      this.limit,
      this.offset,
      final List<String>? include})
      : _ids = ids,
        _include = include,
        super._();

  factory _$_GetEmbedding.fromJson(Map<String, dynamic> json) =>
      _$$_GetEmbeddingFromJson(json);

  /// Optional IDs of the items to get.
  final List<String>? _ids;

  /// Optional IDs of the items to get.
  @override
  List<String>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional where clause to filter items by.
  @override
  final dynamic where;

  /// Optional where clause to filter items by.
  @override
  @JsonKey(name: 'where_document')
  final dynamic whereDocument;

  /// Sort items.
  @override
  final String? sort;

  /// Optional limit on the number of items to get.
  @override
  final int? limit;

  /// Optional offset on the items to get.
  @override
  final int? offset;

  /// Optional list of items to include in the response.
  final List<String>? _include;

  /// Optional list of items to include in the response.
  @override
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
            other is _$_GetEmbedding &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality().equals(other.where, where) &&
            const DeepCollectionEquality()
                .equals(other.whereDocument, whereDocument) &&
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
      const DeepCollectionEquality().hash(where),
      const DeepCollectionEquality().hash(whereDocument),
      sort,
      limit,
      offset,
      const DeepCollectionEquality().hash(_include));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetEmbeddingCopyWith<_$_GetEmbedding> get copyWith =>
      __$$_GetEmbeddingCopyWithImpl<_$_GetEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetEmbeddingToJson(
      this,
    );
  }
}

abstract class _GetEmbedding extends GetEmbedding {
  const factory _GetEmbedding(
      {final List<String>? ids,
      final dynamic where,
      @JsonKey(name: 'where_document') final dynamic whereDocument,
      final String? sort,
      final int? limit,
      final int? offset,
      final List<String>? include}) = _$_GetEmbedding;
  const _GetEmbedding._() : super._();

  factory _GetEmbedding.fromJson(Map<String, dynamic> json) =
      _$_GetEmbedding.fromJson;

  @override

  /// Optional IDs of the items to get.
  List<String>? get ids;
  @override

  /// Optional where clause to filter items by.
  dynamic get where;
  @override

  /// Optional where clause to filter items by.
  @JsonKey(name: 'where_document')
  dynamic get whereDocument;
  @override

  /// Sort items.
  String? get sort;
  @override

  /// Optional limit on the number of items to get.
  int? get limit;
  @override

  /// Optional offset on the items to get.
  int? get offset;
  @override

  /// Optional list of items to include in the response.
  List<String>? get include;
  @override
  @JsonKey(ignore: true)
  _$$_GetEmbeddingCopyWith<_$_GetEmbedding> get copyWith =>
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
  List<List<double>>? get embeddings => throw _privateConstructorUsedError;

  /// List of metadatas of the items.
  List<Map<String, dynamic>?>? get metadatas =>
      throw _privateConstructorUsedError;

  /// List of documents of the items.
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
      List<List<double>>? embeddings,
      List<Map<String, dynamic>?>? metadatas,
      List<String?>? documents});
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
abstract class _$$_GetResponseCopyWith<$Res>
    implements $GetResponseCopyWith<$Res> {
  factory _$$_GetResponseCopyWith(
          _$_GetResponse value, $Res Function(_$_GetResponse) then) =
      __$$_GetResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> ids,
      List<List<double>>? embeddings,
      List<Map<String, dynamic>?>? metadatas,
      List<String?>? documents});
}

/// @nodoc
class __$$_GetResponseCopyWithImpl<$Res>
    extends _$GetResponseCopyWithImpl<$Res, _$_GetResponse>
    implements _$$_GetResponseCopyWith<$Res> {
  __$$_GetResponseCopyWithImpl(
      _$_GetResponse _value, $Res Function(_$_GetResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_GetResponse(
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
class _$_GetResponse extends _GetResponse {
  const _$_GetResponse(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>?>? metadatas,
      final List<String?>? documents})
      : _ids = ids,
        _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        super._();

  factory _$_GetResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetResponseFromJson(json);

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
            other is _$_GetResponse &&
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
  _$$_GetResponseCopyWith<_$_GetResponse> get copyWith =>
      __$$_GetResponseCopyWithImpl<_$_GetResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetResponseToJson(
      this,
    );
  }
}

abstract class _GetResponse extends GetResponse {
  const factory _GetResponse(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>?>? metadatas,
      final List<String?>? documents}) = _$_GetResponse;
  const _GetResponse._() : super._();

  factory _GetResponse.fromJson(Map<String, dynamic> json) =
      _$_GetResponse.fromJson;

  @override

  /// List of ids of the items.
  List<String> get ids;
  @override

  /// List of embeddings of the items.
  List<List<double>>? get embeddings;
  @override

  /// List of metadatas of the items.
  List<Map<String, dynamic>?>? get metadatas;
  @override

  /// List of documents of the items.
  List<String?>? get documents;
  @override
  @JsonKey(ignore: true)
  _$$_GetResponseCopyWith<_$_GetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryEmbedding _$QueryEmbeddingFromJson(Map<String, dynamic> json) {
  return _QueryEmbedding.fromJson(json);
}

/// @nodoc
mixin _$QueryEmbedding {
  /// Optional query embeddings to use for the search.
  @JsonKey(name: 'query_embeddings')
  List<List<double>> get queryEmbeddings => throw _privateConstructorUsedError;

  /// Optional number of results to return
  @JsonKey(name: 'n_results')
  int get nResults => throw _privateConstructorUsedError;

  /// Optional query condition to filter results based on metadata values.
  Map<String, dynamic>? get where => throw _privateConstructorUsedError;

  /// Optional query condition to filter results based on document content.
  @JsonKey(name: 'where_document')
  Map<String, dynamic>? get whereDocument => throw _privateConstructorUsedError;

  /// Optional list of items to include in the response.
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
      {@JsonKey(name: 'query_embeddings') List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') int nResults,
      Map<String, dynamic>? where,
      @JsonKey(name: 'where_document') Map<String, dynamic>? whereDocument,
      List<String>? include});
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
    Object? queryEmbeddings = null,
    Object? nResults = null,
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? include = freezed,
  }) {
    return _then(_value.copyWith(
      queryEmbeddings: null == queryEmbeddings
          ? _value.queryEmbeddings
          : queryEmbeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      nResults: null == nResults
          ? _value.nResults
          : nResults // ignore: cast_nullable_to_non_nullable
              as int,
      where: freezed == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value.whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      include: freezed == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryEmbeddingCopyWith<$Res>
    implements $QueryEmbeddingCopyWith<$Res> {
  factory _$$_QueryEmbeddingCopyWith(
          _$_QueryEmbedding value, $Res Function(_$_QueryEmbedding) then) =
      __$$_QueryEmbeddingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'query_embeddings') List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') int nResults,
      Map<String, dynamic>? where,
      @JsonKey(name: 'where_document') Map<String, dynamic>? whereDocument,
      List<String>? include});
}

/// @nodoc
class __$$_QueryEmbeddingCopyWithImpl<$Res>
    extends _$QueryEmbeddingCopyWithImpl<$Res, _$_QueryEmbedding>
    implements _$$_QueryEmbeddingCopyWith<$Res> {
  __$$_QueryEmbeddingCopyWithImpl(
      _$_QueryEmbedding _value, $Res Function(_$_QueryEmbedding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryEmbeddings = null,
    Object? nResults = null,
    Object? where = freezed,
    Object? whereDocument = freezed,
    Object? include = freezed,
  }) {
    return _then(_$_QueryEmbedding(
      queryEmbeddings: null == queryEmbeddings
          ? _value._queryEmbeddings
          : queryEmbeddings // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      nResults: null == nResults
          ? _value.nResults
          : nResults // ignore: cast_nullable_to_non_nullable
              as int,
      where: freezed == where
          ? _value._where
          : where // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      whereDocument: freezed == whereDocument
          ? _value._whereDocument
          : whereDocument // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      include: freezed == include
          ? _value._include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryEmbedding extends _QueryEmbedding {
  const _$_QueryEmbedding(
      {@JsonKey(name: 'query_embeddings')
      required final List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') this.nResults = 10,
      final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document')
      final Map<String, dynamic>? whereDocument,
      final List<String>? include})
      : _queryEmbeddings = queryEmbeddings,
        _where = where,
        _whereDocument = whereDocument,
        _include = include,
        super._();

  factory _$_QueryEmbedding.fromJson(Map<String, dynamic> json) =>
      _$$_QueryEmbeddingFromJson(json);

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

  /// Optional query condition to filter results based on metadata values.
  final Map<String, dynamic>? _where;

  /// Optional query condition to filter results based on metadata values.
  @override
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
  @JsonKey(name: 'where_document')
  Map<String, dynamic>? get whereDocument {
    final value = _whereDocument;
    if (value == null) return null;
    if (_whereDocument is EqualUnmodifiableMapView) return _whereDocument;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Optional list of items to include in the response.
  final List<String>? _include;

  /// Optional list of items to include in the response.
  @override
  List<String>? get include {
    final value = _include;
    if (value == null) return null;
    if (_include is EqualUnmodifiableListView) return _include;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueryEmbedding(queryEmbeddings: $queryEmbeddings, nResults: $nResults, where: $where, whereDocument: $whereDocument, include: $include)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryEmbedding &&
            const DeepCollectionEquality()
                .equals(other._queryEmbeddings, _queryEmbeddings) &&
            (identical(other.nResults, nResults) ||
                other.nResults == nResults) &&
            const DeepCollectionEquality().equals(other._where, _where) &&
            const DeepCollectionEquality()
                .equals(other._whereDocument, _whereDocument) &&
            const DeepCollectionEquality().equals(other._include, _include));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_queryEmbeddings),
      nResults,
      const DeepCollectionEquality().hash(_where),
      const DeepCollectionEquality().hash(_whereDocument),
      const DeepCollectionEquality().hash(_include));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryEmbeddingCopyWith<_$_QueryEmbedding> get copyWith =>
      __$$_QueryEmbeddingCopyWithImpl<_$_QueryEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryEmbeddingToJson(
      this,
    );
  }
}

abstract class _QueryEmbedding extends QueryEmbedding {
  const factory _QueryEmbedding(
      {@JsonKey(name: 'query_embeddings')
      required final List<List<double>> queryEmbeddings,
      @JsonKey(name: 'n_results') final int nResults,
      final Map<String, dynamic>? where,
      @JsonKey(name: 'where_document')
      final Map<String, dynamic>? whereDocument,
      final List<String>? include}) = _$_QueryEmbedding;
  const _QueryEmbedding._() : super._();

  factory _QueryEmbedding.fromJson(Map<String, dynamic> json) =
      _$_QueryEmbedding.fromJson;

  @override

  /// Optional query embeddings to use for the search.
  @JsonKey(name: 'query_embeddings')
  List<List<double>> get queryEmbeddings;
  @override

  /// Optional number of results to return
  @JsonKey(name: 'n_results')
  int get nResults;
  @override

  /// Optional query condition to filter results based on metadata values.
  Map<String, dynamic>? get where;
  @override

  /// Optional query condition to filter results based on document content.
  @JsonKey(name: 'where_document')
  Map<String, dynamic>? get whereDocument;
  @override

  /// Optional list of items to include in the response.
  List<String>? get include;
  @override
  @JsonKey(ignore: true)
  _$$_QueryEmbeddingCopyWith<_$_QueryEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) {
  return _QueryResponse.fromJson(json);
}

/// @nodoc
mixin _$QueryResponse {
  /// List of ids of the items.
  List<List<String>> get ids => throw _privateConstructorUsedError;

  /// List of embeddings of the items.
  List<List<List<double>>>? get embeddings =>
      throw _privateConstructorUsedError;

  /// List of metadatas of the items.
  List<List<Map<String, dynamic>?>>? get metadatas =>
      throw _privateConstructorUsedError;

  /// List of documents of the items.
  List<List<String?>>? get documents => throw _privateConstructorUsedError;

  /// List of distances of the items.
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
      {List<List<String>> ids,
      List<List<List<double>>>? embeddings,
      List<List<Map<String, dynamic>?>>? metadatas,
      List<List<String?>>? documents,
      List<List<double>>? distances});
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
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? distances = freezed,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
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
      distances: freezed == distances
          ? _value.distances
          : distances // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryResponseCopyWith<$Res>
    implements $QueryResponseCopyWith<$Res> {
  factory _$$_QueryResponseCopyWith(
          _$_QueryResponse value, $Res Function(_$_QueryResponse) then) =
      __$$_QueryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>> ids,
      List<List<List<double>>>? embeddings,
      List<List<Map<String, dynamic>?>>? metadatas,
      List<List<String?>>? documents,
      List<List<double>>? distances});
}

/// @nodoc
class __$$_QueryResponseCopyWithImpl<$Res>
    extends _$QueryResponseCopyWithImpl<$Res, _$_QueryResponse>
    implements _$$_QueryResponseCopyWith<$Res> {
  __$$_QueryResponseCopyWithImpl(
      _$_QueryResponse _value, $Res Function(_$_QueryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
    Object? distances = freezed,
  }) {
    return _then(_$_QueryResponse(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
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
      distances: freezed == distances
          ? _value._distances
          : distances // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryResponse extends _QueryResponse {
  const _$_QueryResponse(
      {required final List<List<String>> ids,
      final List<List<List<double>>>? embeddings,
      final List<List<Map<String, dynamic>?>>? metadatas,
      final List<List<String?>>? documents,
      final List<List<double>>? distances})
      : _ids = ids,
        _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        _distances = distances,
        super._();

  factory _$_QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QueryResponseFromJson(json);

  /// List of ids of the items.
  final List<List<String>> _ids;

  /// List of ids of the items.
  @override
  List<List<String>> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  /// List of embeddings of the items.
  final List<List<List<double>>>? _embeddings;

  /// List of embeddings of the items.
  @override
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
  List<List<String?>>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// List of distances of the items.
  final List<List<double>>? _distances;

  /// List of distances of the items.
  @override
  List<List<double>>? get distances {
    final value = _distances;
    if (value == null) return null;
    if (_distances is EqualUnmodifiableListView) return _distances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QueryResponse(ids: $ids, embeddings: $embeddings, metadatas: $metadatas, documents: $documents, distances: $distances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryResponse &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            const DeepCollectionEquality()
                .equals(other._metadatas, _metadatas) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._distances, _distances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ids),
      const DeepCollectionEquality().hash(_embeddings),
      const DeepCollectionEquality().hash(_metadatas),
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_distances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryResponseCopyWith<_$_QueryResponse> get copyWith =>
      __$$_QueryResponseCopyWithImpl<_$_QueryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryResponseToJson(
      this,
    );
  }
}

abstract class _QueryResponse extends QueryResponse {
  const factory _QueryResponse(
      {required final List<List<String>> ids,
      final List<List<List<double>>>? embeddings,
      final List<List<Map<String, dynamic>?>>? metadatas,
      final List<List<String?>>? documents,
      final List<List<double>>? distances}) = _$_QueryResponse;
  const _QueryResponse._() : super._();

  factory _QueryResponse.fromJson(Map<String, dynamic> json) =
      _$_QueryResponse.fromJson;

  @override

  /// List of ids of the items.
  List<List<String>> get ids;
  @override

  /// List of embeddings of the items.
  List<List<List<double>>>? get embeddings;
  @override

  /// List of metadatas of the items.
  List<List<Map<String, dynamic>?>>? get metadatas;
  @override

  /// List of documents of the items.
  List<List<String?>>? get documents;
  @override

  /// List of distances of the items.
  List<List<double>>? get distances;
  @override
  @JsonKey(ignore: true)
  _$$_QueryResponseCopyWith<_$_QueryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateCollection _$UpdateCollectionFromJson(Map<String, dynamic> json) {
  return _UpdateCollection.fromJson(json);
}

/// @nodoc
mixin _$UpdateCollection {
  /// New name of the collection.
  @JsonKey(name: 'new_name')
  String? get newName => throw _privateConstructorUsedError;

  /// New metadata of the collection.
  @JsonKey(name: 'new_metadata')
  dynamic get newMetadata => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'new_name') String? newName,
      @JsonKey(name: 'new_metadata') dynamic newMetadata});
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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateCollectionCopyWith<$Res>
    implements $UpdateCollectionCopyWith<$Res> {
  factory _$$_UpdateCollectionCopyWith(
          _$_UpdateCollection value, $Res Function(_$_UpdateCollection) then) =
      __$$_UpdateCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'new_name') String? newName,
      @JsonKey(name: 'new_metadata') dynamic newMetadata});
}

/// @nodoc
class __$$_UpdateCollectionCopyWithImpl<$Res>
    extends _$UpdateCollectionCopyWithImpl<$Res, _$_UpdateCollection>
    implements _$$_UpdateCollectionCopyWith<$Res> {
  __$$_UpdateCollectionCopyWithImpl(
      _$_UpdateCollection _value, $Res Function(_$_UpdateCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newName = freezed,
    Object? newMetadata = freezed,
  }) {
    return _then(_$_UpdateCollection(
      newName: freezed == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String?,
      newMetadata: freezed == newMetadata
          ? _value.newMetadata
          : newMetadata // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateCollection extends _UpdateCollection {
  const _$_UpdateCollection(
      {@JsonKey(name: 'new_name') this.newName,
      @JsonKey(name: 'new_metadata') this.newMetadata})
      : super._();

  factory _$_UpdateCollection.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateCollectionFromJson(json);

  /// New name of the collection.
  @override
  @JsonKey(name: 'new_name')
  final String? newName;

  /// New metadata of the collection.
  @override
  @JsonKey(name: 'new_metadata')
  final dynamic newMetadata;

  @override
  String toString() {
    return 'UpdateCollection(newName: $newName, newMetadata: $newMetadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCollection &&
            (identical(other.newName, newName) || other.newName == newName) &&
            const DeepCollectionEquality()
                .equals(other.newMetadata, newMetadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, newName, const DeepCollectionEquality().hash(newMetadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCollectionCopyWith<_$_UpdateCollection> get copyWith =>
      __$$_UpdateCollectionCopyWithImpl<_$_UpdateCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateCollectionToJson(
      this,
    );
  }
}

abstract class _UpdateCollection extends UpdateCollection {
  const factory _UpdateCollection(
          {@JsonKey(name: 'new_name') final String? newName,
          @JsonKey(name: 'new_metadata') final dynamic newMetadata}) =
      _$_UpdateCollection;
  const _UpdateCollection._() : super._();

  factory _UpdateCollection.fromJson(Map<String, dynamic> json) =
      _$_UpdateCollection.fromJson;

  @override

  /// New name of the collection.
  @JsonKey(name: 'new_name')
  String? get newName;
  @override

  /// New metadata of the collection.
  @JsonKey(name: 'new_metadata')
  dynamic get newMetadata;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateCollectionCopyWith<_$_UpdateCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateEmbedding _$UpdateEmbeddingFromJson(Map<String, dynamic> json) {
  return _UpdateEmbedding.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmbedding {
  /// IDs of the items to update
  List<String> get ids => throw _privateConstructorUsedError;

  /// Optional embeddings of the items to update.
  List<List<double>>? get embeddings => throw _privateConstructorUsedError;

  /// Optional metadatas of the items to update.
  List<Map<String, dynamic>>? get metadatas =>
      throw _privateConstructorUsedError;

  /// Optional documents of the items to update.
  List<String>? get documents => throw _privateConstructorUsedError;

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
      {List<String> ids,
      List<List<double>>? embeddings,
      List<Map<String, dynamic>>? metadatas,
      List<String>? documents});
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
              as List<Map<String, dynamic>>?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateEmbeddingCopyWith<$Res>
    implements $UpdateEmbeddingCopyWith<$Res> {
  factory _$$_UpdateEmbeddingCopyWith(
          _$_UpdateEmbedding value, $Res Function(_$_UpdateEmbedding) then) =
      __$$_UpdateEmbeddingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> ids,
      List<List<double>>? embeddings,
      List<Map<String, dynamic>>? metadatas,
      List<String>? documents});
}

/// @nodoc
class __$$_UpdateEmbeddingCopyWithImpl<$Res>
    extends _$UpdateEmbeddingCopyWithImpl<$Res, _$_UpdateEmbedding>
    implements _$$_UpdateEmbeddingCopyWith<$Res> {
  __$$_UpdateEmbeddingCopyWithImpl(
      _$_UpdateEmbedding _value, $Res Function(_$_UpdateEmbedding) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? embeddings = freezed,
    Object? metadatas = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_UpdateEmbedding(
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
              as List<Map<String, dynamic>>?,
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateEmbedding extends _UpdateEmbedding {
  const _$_UpdateEmbedding(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>>? metadatas,
      final List<String>? documents})
      : _ids = ids,
        _embeddings = embeddings,
        _metadatas = metadatas,
        _documents = documents,
        super._();

  factory _$_UpdateEmbedding.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateEmbeddingFromJson(json);

  /// IDs of the items to update
  final List<String> _ids;

  /// IDs of the items to update
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  /// Optional embeddings of the items to update.
  final List<List<double>>? _embeddings;

  /// Optional embeddings of the items to update.
  @override
  List<List<double>>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional metadatas of the items to update.
  final List<Map<String, dynamic>>? _metadatas;

  /// Optional metadatas of the items to update.
  @override
  List<Map<String, dynamic>>? get metadatas {
    final value = _metadatas;
    if (value == null) return null;
    if (_metadatas is EqualUnmodifiableListView) return _metadatas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Optional documents of the items to update.
  final List<String>? _documents;

  /// Optional documents of the items to update.
  @override
  List<String>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpdateEmbedding(ids: $ids, embeddings: $embeddings, metadatas: $metadatas, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateEmbedding &&
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
  _$$_UpdateEmbeddingCopyWith<_$_UpdateEmbedding> get copyWith =>
      __$$_UpdateEmbeddingCopyWithImpl<_$_UpdateEmbedding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateEmbeddingToJson(
      this,
    );
  }
}

abstract class _UpdateEmbedding extends UpdateEmbedding {
  const factory _UpdateEmbedding(
      {required final List<String> ids,
      final List<List<double>>? embeddings,
      final List<Map<String, dynamic>>? metadatas,
      final List<String>? documents}) = _$_UpdateEmbedding;
  const _UpdateEmbedding._() : super._();

  factory _UpdateEmbedding.fromJson(Map<String, dynamic> json) =
      _$_UpdateEmbedding.fromJson;

  @override

  /// IDs of the items to update
  List<String> get ids;
  @override

  /// Optional embeddings of the items to update.
  List<List<double>>? get embeddings;
  @override

  /// Optional metadatas of the items to update.
  List<Map<String, dynamic>>? get metadatas;
  @override

  /// Optional documents of the items to update.
  List<String>? get documents;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateEmbeddingCopyWith<_$_UpdateEmbedding> get copyWith =>
      throw _privateConstructorUsedError;
}

HTTPValidationError _$HTTPValidationErrorFromJson(Map<String, dynamic> json) {
  return _HTTPValidationError.fromJson(json);
}

/// @nodoc
mixin _$HTTPValidationError {
  /// No Description
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
  $Res call({List<ValidationError>? detail});
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
abstract class _$$_HTTPValidationErrorCopyWith<$Res>
    implements $HTTPValidationErrorCopyWith<$Res> {
  factory _$$_HTTPValidationErrorCopyWith(_$_HTTPValidationError value,
          $Res Function(_$_HTTPValidationError) then) =
      __$$_HTTPValidationErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ValidationError>? detail});
}

/// @nodoc
class __$$_HTTPValidationErrorCopyWithImpl<$Res>
    extends _$HTTPValidationErrorCopyWithImpl<$Res, _$_HTTPValidationError>
    implements _$$_HTTPValidationErrorCopyWith<$Res> {
  __$$_HTTPValidationErrorCopyWithImpl(_$_HTTPValidationError _value,
      $Res Function(_$_HTTPValidationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = freezed,
  }) {
    return _then(_$_HTTPValidationError(
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<ValidationError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HTTPValidationError extends _HTTPValidationError {
  const _$_HTTPValidationError({final List<ValidationError>? detail})
      : _detail = detail,
        super._();

  factory _$_HTTPValidationError.fromJson(Map<String, dynamic> json) =>
      _$$_HTTPValidationErrorFromJson(json);

  /// No Description
  final List<ValidationError>? _detail;

  /// No Description
  @override
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
            other is _$_HTTPValidationError &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HTTPValidationErrorCopyWith<_$_HTTPValidationError> get copyWith =>
      __$$_HTTPValidationErrorCopyWithImpl<_$_HTTPValidationError>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HTTPValidationErrorToJson(
      this,
    );
  }
}

abstract class _HTTPValidationError extends HTTPValidationError {
  const factory _HTTPValidationError({final List<ValidationError>? detail}) =
      _$_HTTPValidationError;
  const _HTTPValidationError._() : super._();

  factory _HTTPValidationError.fromJson(Map<String, dynamic> json) =
      _$_HTTPValidationError.fromJson;

  @override

  /// No Description
  List<ValidationError>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_HTTPValidationErrorCopyWith<_$_HTTPValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return _ValidationError.fromJson(json);
}

/// @nodoc
mixin _$ValidationError {
  /// No Description
  dynamic get loc => throw _privateConstructorUsedError;

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
  $Res call({dynamic loc, String msg, String type});
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
    Object? loc = freezed,
    Object? msg = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      loc: freezed == loc
          ? _value.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_ValidationErrorCopyWith<$Res>
    implements $ValidationErrorCopyWith<$Res> {
  factory _$$_ValidationErrorCopyWith(
          _$_ValidationError value, $Res Function(_$_ValidationError) then) =
      __$$_ValidationErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic loc, String msg, String type});
}

/// @nodoc
class __$$_ValidationErrorCopyWithImpl<$Res>
    extends _$ValidationErrorCopyWithImpl<$Res, _$_ValidationError>
    implements _$$_ValidationErrorCopyWith<$Res> {
  __$$_ValidationErrorCopyWithImpl(
      _$_ValidationError _value, $Res Function(_$_ValidationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loc = freezed,
    Object? msg = null,
    Object? type = null,
  }) {
    return _then(_$_ValidationError(
      loc: freezed == loc
          ? _value.loc
          : loc // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$_ValidationError extends _ValidationError {
  const _$_ValidationError(
      {required this.loc, required this.msg, required this.type})
      : super._();

  factory _$_ValidationError.fromJson(Map<String, dynamic> json) =>
      _$$_ValidationErrorFromJson(json);

  /// No Description
  @override
  final dynamic loc;

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
            other is _$_ValidationError &&
            const DeepCollectionEquality().equals(other.loc, loc) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loc), msg, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationErrorCopyWith<_$_ValidationError> get copyWith =>
      __$$_ValidationErrorCopyWithImpl<_$_ValidationError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidationErrorToJson(
      this,
    );
  }
}

abstract class _ValidationError extends ValidationError {
  const factory _ValidationError(
      {required final dynamic loc,
      required final String msg,
      required final String type}) = _$_ValidationError;
  const _ValidationError._() : super._();

  factory _ValidationError.fromJson(Map<String, dynamic> json) =
      _$_ValidationError.fromJson;

  @override

  /// No Description
  dynamic get loc;
  @override

  /// No Description
  String get msg;
  @override

  /// No Description
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ValidationErrorCopyWith<_$_ValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}
