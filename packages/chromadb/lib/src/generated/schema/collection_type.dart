// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: CollectionType
// ==========================================

/// A collection of items.
@freezed
class CollectionType with _$CollectionType {
  const CollectionType._();

  /// Factory constructor for CollectionType
  const factory CollectionType({
    /// Name of the collection.
    required String name,

    /// Id of the collection.
    required String id,

    /// Metadata of the collection.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CollectionType;

  /// Object construction from a JSON representation
  factory CollectionType.fromJson(Map<String, dynamic> json) =>
      _$CollectionTypeFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'id', 'metadata'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'metadata': metadata,
    };
  }
}
