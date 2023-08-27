// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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
    /// List of ids of the items.
    required List<List<String>> ids,

    /// List of embeddings of the items.
    List<List<List<double>>>? embeddings,

    /// List of metadatas of the items.
    List<List<Map<String, dynamic>?>>? metadatas,

    /// List of documents of the items.
    List<List<String?>>? documents,

    /// List of distances of the items.
    List<List<double>>? distances,
  }) = _QueryResponse;

  /// Object construction from a JSON representation
  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'ids',
    'embeddings',
    'metadatas',
    'documents',
    'distances'
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
      'distances': distances,
    };
  }
}
