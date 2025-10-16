import '../copy_with_sentinel.dart';

/// Request to delete a Chunk.
class DeleteChunkRequest {
  /// Creates a new [DeleteChunkRequest] instance.
  const DeleteChunkRequest({required this.name});

  /// The resource name of the Chunk to delete.
  ///
  /// Required.
  ///
  /// Example: `corpora/my-corpus-123/documents/the-doc-abc/chunks/some-chunk`
  final String name;

  /// Creates a [DeleteChunkRequest] from JSON.
  factory DeleteChunkRequest.fromJson(Map<String, dynamic> json) {
    return DeleteChunkRequest(name: json['name'] as String);
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  /// Creates a copy with replaced values.
  DeleteChunkRequest copyWith({Object? name = unsetCopyWithValue}) {
    return DeleteChunkRequest(
      name: name == unsetCopyWithValue ? this.name : name! as String,
    );
  }

  @override
  String toString() => 'DeleteChunkRequest(name: $name)';
}
