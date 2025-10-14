import '../copy_with_sentinel.dart';
import 'create_chunk_request.dart';

/// Request to batch create Chunks.
class BatchCreateChunksRequest {
  /// Creates a new [BatchCreateChunksRequest] instance.
  const BatchCreateChunksRequest({
    required this.requests,
  });

  /// The request messages specifying the Chunks to create.
  ///
  /// Required. Maximum 100 Chunks per batch.
  final List<CreateChunkRequest> requests;

  /// Creates a [BatchCreateChunksRequest] from JSON.
  factory BatchCreateChunksRequest.fromJson(Map<String, dynamic> json) {
    return BatchCreateChunksRequest(
      requests: ((json['requests'] as List?) ?? [])
          .map((e) => CreateChunkRequest.fromJson(e as Map<String, dynamic>))
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
  BatchCreateChunksRequest copyWith({
    Object? requests = unsetCopyWithValue,
  }) {
    return BatchCreateChunksRequest(
      requests: requests == unsetCopyWithValue
          ? this.requests
          : requests! as List<CreateChunkRequest>,
    );
  }

  @override
  String toString() => 'BatchCreateChunksRequest(requests: $requests)';
}
