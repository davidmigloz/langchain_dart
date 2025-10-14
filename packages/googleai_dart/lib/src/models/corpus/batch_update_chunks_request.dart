import '../copy_with_sentinel.dart';
import 'update_chunk_request.dart';

/// Request to batch update Chunks.
class BatchUpdateChunksRequest {
  /// Creates a new [BatchUpdateChunksRequest] instance.
  const BatchUpdateChunksRequest({
    required this.requests,
  });

  /// The request messages specifying the Chunks to update.
  ///
  /// Required. Maximum 100 Chunks per batch.
  final List<UpdateChunkRequest> requests;

  /// Creates a [BatchUpdateChunksRequest] from JSON.
  factory BatchUpdateChunksRequest.fromJson(Map<String, dynamic> json) {
    return BatchUpdateChunksRequest(
      requests: ((json['requests'] as List?) ?? [])
          .map((e) => UpdateChunkRequest.fromJson(e as Map<String, dynamic>))
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
  BatchUpdateChunksRequest copyWith({
    Object? requests = unsetCopyWithValue,
  }) {
    return BatchUpdateChunksRequest(
      requests: requests == unsetCopyWithValue
          ? this.requests
          : requests! as List<UpdateChunkRequest>,
    );
  }

  @override
  String toString() => 'BatchUpdateChunksRequest(requests: $requests)';
}
