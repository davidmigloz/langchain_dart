import '../copy_with_sentinel.dart';
import 'relevant_chunk.dart';

/// Response from QueryCorpus containing a list of relevant chunks.
class QueryCorpusResponse {
  /// Creates a new [QueryCorpusResponse] instance.
  const QueryCorpusResponse({
    this.relevantChunks,
  });

  /// The relevant chunks.
  final List<RelevantChunk>? relevantChunks;

  /// Creates a [QueryCorpusResponse] from JSON.
  factory QueryCorpusResponse.fromJson(Map<String, dynamic> json) {
    return QueryCorpusResponse(
      relevantChunks: json['relevantChunks'] != null
          ? (json['relevantChunks'] as List)
                .map((e) => RelevantChunk.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (relevantChunks != null)
        'relevantChunks': relevantChunks!.map((e) => e.toJson()).toList(),
    };
  }

  /// Creates a copy with replaced values.
  QueryCorpusResponse copyWith({
    Object? relevantChunks = unsetCopyWithValue,
  }) {
    return QueryCorpusResponse(
      relevantChunks: relevantChunks == unsetCopyWithValue
          ? this.relevantChunks
          : relevantChunks as List<RelevantChunk>?,
    );
  }

  @override
  String toString() => 'QueryCorpusResponse(relevantChunks: $relevantChunks)';
}
