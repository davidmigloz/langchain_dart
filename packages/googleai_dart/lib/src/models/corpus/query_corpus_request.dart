import '../copy_with_sentinel.dart';
import 'metadata_filter.dart';

/// Request for querying a Corpus.
class QueryCorpusRequest {
  /// Creates a new [QueryCorpusRequest] instance.
  const QueryCorpusRequest({
    required this.query,
    this.metadataFilters,
    this.resultsCount,
  });

  /// Query string to perform semantic search.
  ///
  /// Required.
  final String query;

  /// Filter for Chunk and Document metadata.
  ///
  /// Multiple filters are joined by logical AND.
  /// Supports complex queries at document and chunk level.
  final List<MetadataFilter>? metadataFilters;

  /// Maximum number of Chunks to return.
  ///
  /// Default: 10, Max: 100
  final int? resultsCount;

  /// Creates a [QueryCorpusRequest] from JSON.
  factory QueryCorpusRequest.fromJson(Map<String, dynamic> json) {
    return QueryCorpusRequest(
      query: json['query'] as String,
      metadataFilters: json['metadataFilters'] != null
          ? (json['metadataFilters'] as List)
                .map((e) => MetadataFilter.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      resultsCount: json['resultsCount'] as int?,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'query': query,
      if (metadataFilters != null)
        'metadataFilters': metadataFilters!.map((e) => e.toJson()).toList(),
      if (resultsCount != null) 'resultsCount': resultsCount,
    };
  }

  /// Creates a copy with replaced values.
  QueryCorpusRequest copyWith({
    Object? query = unsetCopyWithValue,
    Object? metadataFilters = unsetCopyWithValue,
    Object? resultsCount = unsetCopyWithValue,
  }) {
    return QueryCorpusRequest(
      query: query == unsetCopyWithValue ? this.query : query! as String,
      metadataFilters: metadataFilters == unsetCopyWithValue
          ? this.metadataFilters
          : metadataFilters as List<MetadataFilter>?,
      resultsCount: resultsCount == unsetCopyWithValue
          ? this.resultsCount
          : resultsCount as int?,
    );
  }

  @override
  String toString() =>
      'QueryCorpusRequest('
      'query: $query, '
      'metadataFilters: $metadataFilters, '
      'resultsCount: $resultsCount)';
}
