// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: DeleteEmbedding
// ==========================================

/// Request model for delete items from collection.
@freezed
class DeleteEmbedding with _$DeleteEmbedding {
  const DeleteEmbedding._();

  /// Factory constructor for DeleteEmbedding
  const factory DeleteEmbedding({
    /// Optional IDs of the items to delete.
    @JsonKey(includeIfNull: false) List<String>? ids,

    /// Optional query condition to filter items to delete based on metadata values.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? where,

    /// Optional query condition to filter items to delete based on document content.
    @JsonKey(name: 'where_document', includeIfNull: false)
    Map<String, dynamic>? whereDocument,
  }) = _DeleteEmbedding;

  /// Object construction from a JSON representation
  factory DeleteEmbedding.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['ids', 'where', 'where_document'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'ids': ids,
      'where': where,
      'where_document': whereDocument,
    };
  }
}
