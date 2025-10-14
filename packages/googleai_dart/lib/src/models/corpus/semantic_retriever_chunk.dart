import '../copy_with_sentinel.dart';

/// Identifier for a Chunk retrieved via Semantic Retriever.
class SemanticRetrieverChunk {
  /// Creates a new [SemanticRetrieverChunk] instance.
  const SemanticRetrieverChunk({
    this.source,
    this.chunk,
  });

  /// Name of the source matching the request's SemanticRetrieverConfig.source.
  ///
  /// Output only.
  ///
  /// Example: `corpora/123` or `corpora/123/documents/abc`
  final String? source;

  /// Name of the Chunk containing the attributed text.
  ///
  /// Output only.
  ///
  /// Example: `corpora/123/documents/abc/chunks/xyz`
  final String? chunk;

  /// Creates a [SemanticRetrieverChunk] from JSON.
  factory SemanticRetrieverChunk.fromJson(Map<String, dynamic> json) {
    return SemanticRetrieverChunk(
      source: json['source'] as String?,
      chunk: json['chunk'] as String?,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (source != null) 'source': source,
      if (chunk != null) 'chunk': chunk,
    };
  }

  /// Creates a copy with replaced values.
  SemanticRetrieverChunk copyWith({
    Object? source = unsetCopyWithValue,
    Object? chunk = unsetCopyWithValue,
  }) {
    return SemanticRetrieverChunk(
      source: source == unsetCopyWithValue ? this.source : source as String?,
      chunk: chunk == unsetCopyWithValue ? this.chunk : chunk as String?,
    );
  }

  @override
  String toString() => 'SemanticRetrieverChunk('
      'source: $source, '
      'chunk: $chunk)';
}
