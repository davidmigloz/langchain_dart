import '../copy_with_sentinel.dart';
import 'chunk.dart';
import 'document.dart';

/// Information for a chunk relevant to a query.
class RelevantChunk {
  /// Creates a new [RelevantChunk] instance.
  const RelevantChunk({this.chunkRelevanceScore, this.chunk, this.document});

  /// Chunk relevance to the query.
  ///
  /// Higher scores indicate higher relevance.
  final double? chunkRelevanceScore;

  /// Chunk associated with the query.
  final Chunk? chunk;

  /// Document associated with the chunk.
  final Document? document;

  /// Creates a [RelevantChunk] from JSON.
  factory RelevantChunk.fromJson(Map<String, dynamic> json) {
    return RelevantChunk(
      chunkRelevanceScore: json['chunkRelevanceScore'] != null
          ? (json['chunkRelevanceScore'] as num).toDouble()
          : null,
      chunk: json['chunk'] != null
          ? Chunk.fromJson(json['chunk'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? Document.fromJson(json['document'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (chunkRelevanceScore != null)
        'chunkRelevanceScore': chunkRelevanceScore,
      if (chunk != null) 'chunk': chunk!.toJson(),
      if (document != null) 'document': document!.toJson(),
    };
  }

  /// Creates a copy with replaced values.
  RelevantChunk copyWith({
    Object? chunkRelevanceScore = unsetCopyWithValue,
    Object? chunk = unsetCopyWithValue,
    Object? document = unsetCopyWithValue,
  }) {
    return RelevantChunk(
      chunkRelevanceScore: chunkRelevanceScore == unsetCopyWithValue
          ? this.chunkRelevanceScore
          : chunkRelevanceScore as double?,
      chunk: chunk == unsetCopyWithValue ? this.chunk : chunk as Chunk?,
      document: document == unsetCopyWithValue
          ? this.document
          : document as Document?,
    );
  }

  @override
  String toString() =>
      'RelevantChunk('
      'chunkRelevanceScore: $chunkRelevanceScore, '
      'chunk: $chunk, '
      'document: $document)';
}
