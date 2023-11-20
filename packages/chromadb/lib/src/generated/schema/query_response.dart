// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of chroma_api_schema;

// ==========================================
// CLASS: QueryResponse
// ==========================================

/// Response model for query items from collection.
@freezed
class QueryResponse with _$QueryResponse {
  const QueryResponse._();

  /// Factory constructor for QueryResponse
  const factory QueryResponse({
    /// List of embeddings of the items.
    @JsonKey(includeIfNull: false) List<List<List<double>>>? embeddings,

    /// List of metadatas of the items.
    @JsonKey(includeIfNull: false) List<List<Map<String, dynamic>?>>? metadatas,

    /// List of documents of the items.
    @JsonKey(includeIfNull: false) List<List<String?>>? documents,

    /// List of data of the items.
    @JsonKey(includeIfNull: false) List<List<String?>>? data,

    /// List of uris of the items.
    @JsonKey(includeIfNull: false) List<List<String?>>? uris,

    /// List of ids of the items.
    required List<List<String>> ids,

    /// List of distances of the items.
    @JsonKey(includeIfNull: false) List<List<double>>? distances,
  }) = _QueryResponse;

  /// Object construction from a JSON representation
  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'embeddings',
    'metadatas',
    'documents',
    'data',
    'uris',
    'ids',
    'distances'
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
      'data': data,
      'uris': uris,
      'ids': ids,
      'distances': distances,
    };
  }
}
