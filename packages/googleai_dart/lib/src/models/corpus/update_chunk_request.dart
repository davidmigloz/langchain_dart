import '../copy_with_sentinel.dart';
import 'chunk.dart';

/// Request to update a Chunk.
class UpdateChunkRequest {
  /// Creates a new [UpdateChunkRequest] instance.
  const UpdateChunkRequest({
    required this.chunk,
    required this.updateMask,
  });

  /// The Chunk to update.
  ///
  /// Required.
  final Chunk chunk;

  /// The list of fields to update.
  ///
  /// Required. Currently only supports updating `custom_metadata` and `data`.
  final String updateMask;

  /// Creates an [UpdateChunkRequest] from JSON data.
  factory UpdateChunkRequest.fromJson(Map<String, dynamic> json) {
    return UpdateChunkRequest(
      chunk: Chunk.fromJson(json['chunk'] as Map<String, dynamic>),
      updateMask: json['updateMask'] as String,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'chunk': chunk.toJson(),
      'updateMask': updateMask,
    };
  }

  /// Creates a copy with replaced values.
  UpdateChunkRequest copyWith({
    Object? chunk = unsetCopyWithValue,
    Object? updateMask = unsetCopyWithValue,
  }) {
    return UpdateChunkRequest(
      chunk: chunk == unsetCopyWithValue ? this.chunk : chunk! as Chunk,
      updateMask: updateMask == unsetCopyWithValue
          ? this.updateMask
          : updateMask! as String,
    );
  }

  @override
  String toString() =>
      'UpdateChunkRequest('
      'chunk: $chunk, '
      'updateMask: $updateMask)';
}
