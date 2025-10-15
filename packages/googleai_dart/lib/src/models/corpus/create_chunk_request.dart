import '../copy_with_sentinel.dart';
import 'chunk.dart';

/// Request to create a Chunk.
class CreateChunkRequest {
  /// Creates a new [CreateChunkRequest] instance.
  const CreateChunkRequest({
    required this.parent,
    required this.chunk,
  });

  /// The name of the Document where this Chunk will be created.
  ///
  /// Required.
  ///
  /// Example: `corpora/my-corpus-123/documents/the-doc-abc`
  final String parent;

  /// The Chunk to create.
  ///
  /// Required.
  final Chunk chunk;

  /// Creates a [CreateChunkRequest] from JSON.
  factory CreateChunkRequest.fromJson(Map<String, dynamic> json) {
    return CreateChunkRequest(
      parent: json['parent'] as String,
      chunk: Chunk.fromJson(json['chunk'] as Map<String, dynamic>),
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      'parent': parent,
      'chunk': chunk.toJson(),
    };
  }

  /// Creates a copy with replaced values.
  CreateChunkRequest copyWith({
    Object? parent = unsetCopyWithValue,
    Object? chunk = unsetCopyWithValue,
  }) {
    return CreateChunkRequest(
      parent: parent == unsetCopyWithValue ? this.parent : parent! as String,
      chunk: chunk == unsetCopyWithValue ? this.chunk : chunk! as Chunk,
    );
  }

  @override
  String toString() =>
      'CreateChunkRequest('
      'parent: $parent, '
      'chunk: $chunk)';
}
