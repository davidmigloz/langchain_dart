// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_annotation_target, type=lint
part of chroma_api_schema;

// ==========================================
// CLASS: QueryEmbedding
// ==========================================

/// Request model for query items from collection.
@freezed
class QueryEmbedding with _$QueryEmbedding {
  const QueryEmbedding._();

  /// Factory constructor for QueryEmbedding
  const factory QueryEmbedding({
    /// Optional query embeddings to use for the search.
    @JsonKey(name: 'query_embeddings')
    required List<List<double>> queryEmbeddings,

    /// Optional number of results to return
    @JsonKey(name: 'n_results') @Default(10) int nResults,

    /// Optional query condition to filter results based on metadata values.
    Map<String, dynamic>? where,

    /// Optional query condition to filter results based on document content.
    @JsonKey(name: 'where_document') Map<String, dynamic>? whereDocument,

    /// Optional list of items to include in the response.
    List<String>? include,
  }) = _QueryEmbedding;

  /// Object construction from a JSON representation
  factory QueryEmbedding.fromJson(Map<String, dynamic> json) =>
      _$QueryEmbeddingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'query_embeddings',
    'n_results',
    'where',
    'where_document',
    'include'
  ];

  /// Validation constants
  static const nResultsDefaultValue = 10;

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'query_embeddings': queryEmbeddings,
      'n_results': nResults,
      'where': where,
      'where_document': whereDocument,
      'include': include,
    };
  }
}
