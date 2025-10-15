import '../copy_with_sentinel.dart';
import 'metadata_filter.dart';

/// Request for querying a Document.
class QueryDocumentRequest {
  /// Creates a new [QueryDocumentRequest] instance.
  const QueryDocumentRequest({
    required this.query,
    this.resultsCount,
    this.metadataFilters,
  });

  /// Query string to perform semantic search.
  ///
  /// Required.
  final String query;

  /// Maximum number of Chunks to return.
  ///
  /// Default: 10, Max: 100
  final int? resultsCount;

  /// Filter for Chunk metadata.
  ///
  /// Document-level filtering is not supported for this request.
  final List<MetadataFilter>? metadataFilters;

  /// Creates a [QueryDocumentRequest] from JSON.
  factory QueryDocumentRequest.fromJson(Map<String, dynamic> json) {
    return QueryDocumentRequest(
      query: json['query'] as String,
      resultsCount: json['resultsCount'] as int?,
      metadataFilters: json['metadataFilters'] != null
          ? (json['metadataFilters'] as List)
                .map((e) => MetadataFilter.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'query': query,
      if (resultsCount != null) 'resultsCount': resultsCount,
      if (metadataFilters != null)
        'metadataFilters': metadataFilters!.map((e) => e.toJson()).toList(),
    };
  }

  /// Creates a copy with replaced values.
  QueryDocumentRequest copyWith({
    Object? query = unsetCopyWithValue,
    Object? resultsCount = unsetCopyWithValue,
    Object? metadataFilters = unsetCopyWithValue,
  }) {
    return QueryDocumentRequest(
      query: query == unsetCopyWithValue ? this.query : query! as String,
      resultsCount: resultsCount == unsetCopyWithValue
          ? this.resultsCount
          : resultsCount as int?,
      metadataFilters: metadataFilters == unsetCopyWithValue
          ? this.metadataFilters
          : metadataFilters as List<MetadataFilter>?,
    );
  }

  @override
  String toString() =>
      'QueryDocumentRequest('
      'query: $query, '
      'resultsCount: $resultsCount, '
      'metadataFilters: $metadataFilters)';
}
