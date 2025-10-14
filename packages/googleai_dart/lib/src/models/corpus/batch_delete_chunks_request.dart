import '../copy_with_sentinel.dart';
import 'delete_chunk_request.dart';

/// Request to batch delete Chunks.
class BatchDeleteChunksRequest {
  /// Creates a new [BatchDeleteChunksRequest] instance.
  const BatchDeleteChunksRequest({
    required this.requests,
  });

  /// The request messages specifying the Chunks to delete.
  ///
  /// Required.
  final List<DeleteChunkRequest> requests;

  /// Creates a [BatchDeleteChunksRequest] from JSON.
  factory BatchDeleteChunksRequest.fromJson(Map<String, dynamic> json) {
    return BatchDeleteChunksRequest(
      requests: ((json['requests'] as List?) ?? [])
          .map((e) => DeleteChunkRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'requests': requests.map((e) => e.toJson()).toList(),
    };
  }

  /// Creates a copy with replaced values.
  BatchDeleteChunksRequest copyWith({
    Object? requests = unsetCopyWithValue,
  }) {
    return BatchDeleteChunksRequest(
      requests: requests == unsetCopyWithValue
          ? this.requests
          : requests! as List<DeleteChunkRequest>,
    );
  }

  @override
  String toString() => 'BatchDeleteChunksRequest(requests: $requests)';
}
