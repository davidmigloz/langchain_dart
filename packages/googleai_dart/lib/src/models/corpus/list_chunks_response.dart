import '../copy_with_sentinel.dart';
import 'chunk.dart';

/// Response from ListChunks containing a paginated list of Chunks.
///
/// Results are sorted by ascending chunk.create_time.
class ListChunksResponse {
  /// Creates a new [ListChunksResponse] instance.
  const ListChunksResponse({
    this.chunks,
    this.nextPageToken,
  });

  /// The returned Chunks.
  final List<Chunk>? chunks;

  /// Token for retrieving the next page.
  ///
  /// If omitted, no more pages exist.
  final String? nextPageToken;

  /// Creates a [ListChunksResponse] from JSON.
  factory ListChunksResponse.fromJson(Map<String, dynamic> json) {
    return ListChunksResponse(
      chunks: json['chunks'] != null
          ? (json['chunks'] as List)
              .map((e) => Chunk.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (chunks != null) 'chunks': chunks!.map((e) => e.toJson()).toList(),
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }

  /// Creates a copy with replaced values.
  ListChunksResponse copyWith({
    Object? chunks = unsetCopyWithValue,
    Object? nextPageToken = unsetCopyWithValue,
  }) {
    return ListChunksResponse(
      chunks:
          chunks == unsetCopyWithValue ? this.chunks : chunks as List<Chunk>?,
      nextPageToken: nextPageToken == unsetCopyWithValue
          ? this.nextPageToken
          : nextPageToken as String?,
    );
  }

  @override
  String toString() => 'ListChunksResponse('
      'chunks: $chunks, '
      'nextPageToken: $nextPageToken)';
}
