// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: UpdateEmbedding
// ==========================================

/// Request model for update items in collection.
@freezed
class UpdateEmbedding with _$UpdateEmbedding {
  const UpdateEmbedding._();

  /// Factory constructor for UpdateEmbedding
  const factory UpdateEmbedding({
    /// Optional embeddings of the items to update.
    @JsonKey(includeIfNull: false) List<List<double>?>? embeddings,

    /// Optional metadatas of the items to update.
    @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,

    /// Optional documents of the items to update.
    @JsonKey(includeIfNull: false) List<String?>? documents,

    /// Optional uris of the items to update.
    @JsonKey(includeIfNull: false) List<String?>? uris,

    /// IDs of the items to update
    required List<String> ids,
  }) = _UpdateEmbedding;

  /// Object construction from a JSON representation
  factory UpdateEmbedding.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'embeddings',
    'metadatas',
    'documents',
    'uris',
    'ids'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'embeddings': embeddings,
      'metadatas': metadatas,
      'documents': documents,
      'uris': uris,
      'ids': ids,
    };
  }
}
