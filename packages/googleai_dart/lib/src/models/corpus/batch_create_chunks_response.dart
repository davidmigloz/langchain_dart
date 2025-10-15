import '../copy_with_sentinel.dart';
import 'chunk.dart';

/// Response from BatchCreateChunks containing a list of created Chunks.
class BatchCreateChunksResponse {
  /// Creates a new [BatchCreateChunksResponse] instance.
  const BatchCreateChunksResponse({
    this.chunks,
  });

  /// Chunks created.
  final List<Chunk>? chunks;

  /// Creates a [BatchCreateChunksResponse] from JSON.
  factory BatchCreateChunksResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateChunksResponse(
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
  BatchCreateChunksResponse copyWith({
    Object? chunks = unsetCopyWithValue,
  }) {
    return BatchCreateChunksResponse(
      chunks: chunks == unsetCopyWithValue
          ? this.chunks
          : chunks as List<Chunk>?,
    );
  }

  @override
  String toString() => 'BatchCreateChunksResponse(chunks: $chunks)';
}
