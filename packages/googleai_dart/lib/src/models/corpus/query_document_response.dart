import '../copy_with_sentinel.dart';
import 'relevant_chunk.dart';

/// Response from QueryDocument containing a list of relevant chunks.
class QueryDocumentResponse {
  /// Creates a new [QueryDocumentResponse] instance.
  const QueryDocumentResponse({
    this.relevantChunks,
  });

  /// The returned relevant chunks.
  final List<RelevantChunk>? relevantChunks;

  /// Creates a [QueryDocumentResponse] from JSON.
  factory QueryDocumentResponse.fromJson(Map<String, dynamic> json) {
    return QueryDocumentResponse(
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
  QueryDocumentResponse copyWith({
    Object? relevantChunks = unsetCopyWithValue,
  }) {
    return QueryDocumentResponse(
      relevantChunks: relevantChunks == unsetCopyWithValue
          ? this.relevantChunks
          : relevantChunks as List<RelevantChunk>?,
    );
  }

  @override
  String toString() => 'QueryDocumentResponse(relevantChunks: $relevantChunks)';
}
