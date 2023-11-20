// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: AddEmbedding
// ==========================================

/// Request model for add items to collection.
@freezed
class AddEmbedding with _$AddEmbedding {
  const AddEmbedding._();

  /// Factory constructor for AddEmbedding
  const factory AddEmbedding({
    /// Optional embeddings of the items to add.
    @JsonKey(includeIfNull: false) List<List<double>?>? embeddings,

    /// Optional metadatas of the items to add.
    @JsonKey(includeIfNull: false) List<Map<String, dynamic>?>? metadatas,

    /// Optional documents of the items to add.
    @JsonKey(includeIfNull: false) List<String?>? documents,

    /// Optional uris of the items to add.
    @JsonKey(includeIfNull: false) List<String?>? uris,

    /// IDs of the items to add.
    required List<String> ids,
  }) = _AddEmbedding;

  /// Object construction from a JSON representation
  factory AddEmbedding.fromJson(Map<String, dynamic> json) =>
      _$AddEmbeddingFromJson(json);

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
