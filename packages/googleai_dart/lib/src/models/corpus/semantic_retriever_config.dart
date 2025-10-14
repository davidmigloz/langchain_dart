import '../content/content.dart';
import '../copy_with_sentinel.dart';
import 'metadata_filter.dart';

/// Configuration for retrieving grounding content from a Corpus or Document
/// using the Semantic Retriever API.
class SemanticRetrieverConfig {
  /// Creates a new [SemanticRetrieverConfig] instance.
  const SemanticRetrieverConfig({
    required this.source,
    required this.query,
    this.metadataFilters,
    this.maxChunksCount,
    this.minimumRelevanceScore,
  });

  /// Name of the resource for retrieval.
  ///
  /// Required.
  ///
  /// Example: `corpora/123` or `corpora/123/documents/abc`
  final String source;

  /// Query to use for matching Chunks by similarity.
  ///
  /// Required.
  final Content query;

  /// Filters for selecting Documents and/or Chunks.
  final List<MetadataFilter>? metadataFilters;

  /// Maximum number of relevant Chunks to retrieve.
  final int? maxChunksCount;

  /// Minimum relevance score for retrieved Chunks.
  final double? minimumRelevanceScore;

  /// Creates a [SemanticRetrieverConfig] from JSON.
  factory SemanticRetrieverConfig.fromJson(Map<String, dynamic> json) {
    return SemanticRetrieverConfig(
      source: json['source'] as String,
      query: Content.fromJson(json['query'] as Map<String, dynamic>),
      metadataFilters: json['metadataFilters'] != null
          ? (json['metadataFilters'] as List)
              .map((e) => MetadataFilter.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      maxChunksCount: json['maxChunksCount'] as int?,
      minimumRelevanceScore: json['minimumRelevanceScore'] != null
          ? (json['minimumRelevanceScore'] as num).toDouble()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'query': query.toJson(),
      if (metadataFilters != null)
        'metadataFilters': metadataFilters!.map((e) => e.toJson()).toList(),
      if (maxChunksCount != null) 'maxChunksCount': maxChunksCount,
      if (minimumRelevanceScore != null)
        'minimumRelevanceScore': minimumRelevanceScore,
    };
  }

  /// Creates a copy with replaced values.
  SemanticRetrieverConfig copyWith({
    Object? source = unsetCopyWithValue,
    Object? query = unsetCopyWithValue,
    Object? metadataFilters = unsetCopyWithValue,
    Object? maxChunksCount = unsetCopyWithValue,
    Object? minimumRelevanceScore = unsetCopyWithValue,
  }) {
    return SemanticRetrieverConfig(
      source: source == unsetCopyWithValue ? this.source : source! as String,
      query: query == unsetCopyWithValue ? this.query : query! as Content,
      metadataFilters: metadataFilters == unsetCopyWithValue
          ? this.metadataFilters
          : metadataFilters as List<MetadataFilter>?,
      maxChunksCount: maxChunksCount == unsetCopyWithValue
          ? this.maxChunksCount
          : maxChunksCount as int?,
      minimumRelevanceScore: minimumRelevanceScore == unsetCopyWithValue
          ? this.minimumRelevanceScore
          : minimumRelevanceScore as double?,
    );
  }

  @override
  String toString() => 'SemanticRetrieverConfig('
      'source: $source, '
      'query: $query, '
      'metadataFilters: $metadataFilters, '
      'maxChunksCount: $maxChunksCount, '
      'minimumRelevanceScore: $minimumRelevanceScore)';
}
