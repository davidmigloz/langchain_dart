import '../copy_with_sentinel.dart';
import 'chunk.dart';

/// Response from BatchUpdateChunks containing a list of updated Chunks.
class BatchUpdateChunksResponse {
  /// Creates a new [BatchUpdateChunksResponse] instance.
  const BatchUpdateChunksResponse({
    this.chunks,
  });

  /// Chunks updated.
  final List<Chunk>? chunks;

  /// Creates a [BatchUpdateChunksResponse] from JSON.
  factory BatchUpdateChunksResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateChunksResponse(
      chunks: json['chunks'] != null
          ? (json['chunks'] as List)
                .map((e) => Chunk.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (chunks != null) 'chunks': chunks!.map((e) => e.toJson()).toList(),
    };
  }

  /// Creates a copy with replaced values.
  BatchUpdateChunksResponse copyWith({
    Object? chunks = unsetCopyWithValue,
  }) {
    return BatchUpdateChunksResponse(
      chunks: chunks == unsetCopyWithValue
          ? this.chunks
          : chunks as List<Chunk>?,
    );
  }

  @override
  String toString() => 'BatchUpdateChunksResponse(chunks: $chunks)';
}
