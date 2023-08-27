// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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
    /// IDs of the items to update
    required List<String> ids,

    /// Optional embeddings of the items to update.
    List<List<double>>? embeddings,

    /// Optional metadatas of the items to update.
    List<Map<String, dynamic>>? metadatas,

    /// Optional documents of the items to update.
    List<String>? documents,
  }) = _UpdateEmbedding;

  /// Object construction from a JSON representation
  factory UpdateEmbedding.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'ids',
    'embeddings',
    'metadatas',
    'documents'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'ids': ids,
      'embeddings': embeddings,
      'metadatas': metadatas,
      'documents': documents,
    };
  }
}
