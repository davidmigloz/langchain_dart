// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: CreateCollection
// ==========================================

/// Request model for create collection.
@freezed
class CreateCollection with _$CreateCollection {
  const CreateCollection._();

  /// Factory constructor for CreateCollection
  const factory CreateCollection({
    /// Name of the collection.
    required String name,

    /// Metadata of the collection.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// If true, will return existing collection if it exists.
    @JsonKey(name: 'get_or_create') @Default(false) bool getOrCreate,
  }) = _CreateCollection;

  /// Object construction from a JSON representation
  factory CreateCollection.fromJson(Map<String, dynamic> json) =>
      _$CreateCollectionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'metadata',
    'get_or_create'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'metadata': metadata,
      'get_or_create': getOrCreate,
    };
  }
}
