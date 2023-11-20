// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: UpdateCollection
// ==========================================

/// Request model for update collection.
@freezed
class UpdateCollection with _$UpdateCollection {
  const UpdateCollection._();

  /// Factory constructor for UpdateCollection
  const factory UpdateCollection({
    /// New name of the collection.
    @JsonKey(name: 'new_name', includeIfNull: false) String? newName,

    /// New metadata of the collection.
    @JsonKey(name: 'new_metadata', includeIfNull: false)
    Map<String, dynamic>? newMetadata,
  }) = _UpdateCollection;

  /// Object construction from a JSON representation
  factory UpdateCollection.fromJson(Map<String, dynamic> json) =>
      _$UpdateCollectionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['new_name', 'new_metadata'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'new_name': newName,
      'new_metadata': newMetadata,
    };
  }
}
