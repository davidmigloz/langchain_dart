import '../copy_with_sentinel.dart';
import 'chunk_data.dart';
import 'chunk_state.dart';
import 'custom_metadata.dart';

/// A subpart of a Document that is treated as an independent unit for
/// vector representation and storage.
///
/// Chunks are the fundamental units for semantic retrieval.
/// The maximum number of tokens per chunk is 2043.
///
/// Example name:
/// `corpora/{corpus_id}/documents/{document_id}/chunks/123a456b789c`
class Chunk {
  /// Creates a new [Chunk] instance.
  const Chunk({
    required this.data,
    this.name,
    this.customMetadata,
    this.createTime,
    this.updateTime,
    this.state,
  });

  /// The Chunk resource name.
  ///
  /// Immutable. Identifier.
  /// The ID can contain up to 40 lowercase alphanumeric or dash characters.
  /// A random 12-character ID is generated if empty on create.
  ///
  /// Example:
  /// `corpora/{corpus_id}/documents/{document_id}/chunks/123a456b789c`
  final String? name;

  /// The content for the Chunk.
  ///
  /// Required. Maximum 2043 tokens.
  final ChunkData data;

  /// User-provided custom metadata as key-value pairs.
  ///
  /// A maximum of 20 [CustomMetadata] per Chunk is supported.
  final List<CustomMetadata>? customMetadata;

  /// Timestamp when the Chunk was created.
  ///
  /// Output only.
  final DateTime? createTime;

  /// Timestamp when the Chunk was last updated.
  ///
  /// Output only.
  final DateTime? updateTime;

  /// Current state of the Chunk.
  ///
  /// Output only.
  final ChunkState? state;

  /// Creates a [Chunk] from JSON.
  factory Chunk.fromJson(Map<String, dynamic> json) {
    return Chunk(
      name: json['name'] as String?,
      data: ChunkData.fromJson(json['data'] as Map<String, dynamic>),
      customMetadata: json['customMetadata'] != null
          ? (json['customMetadata'] as List)
              .map((e) => CustomMetadata.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      createTime: json['createTime'] != null
          ? DateTime.parse(json['createTime'] as String)
          : null,
      updateTime: json['updateTime'] != null
          ? DateTime.parse(json['updateTime'] as String)
          : null,
      state: json['state'] != null
          ? chunkStateFromString(json['state'] as String)
          : null,
    );
  }

  /// Converts to JSON.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      'data': data.toJson(),
      if (customMetadata != null)
        'customMetadata': customMetadata!.map((e) => e.toJson()).toList(),
      if (createTime != null) 'createTime': createTime!.toIso8601String(),
      if (updateTime != null) 'updateTime': updateTime!.toIso8601String(),
      if (state != null) 'state': chunkStateToString(state!),
    };
  }

  /// Creates a copy with replaced values.
  Chunk copyWith({
    Object? name = unsetCopyWithValue,
    Object? data = unsetCopyWithValue,
    Object? customMetadata = unsetCopyWithValue,
    Object? createTime = unsetCopyWithValue,
    Object? updateTime = unsetCopyWithValue,
    Object? state = unsetCopyWithValue,
  }) {
    return Chunk(
      name: name == unsetCopyWithValue ? this.name : name as String?,
      data: data == unsetCopyWithValue ? this.data : data! as ChunkData,
      customMetadata: customMetadata == unsetCopyWithValue
          ? this.customMetadata
          : customMetadata as List<CustomMetadata>?,
      createTime: createTime == unsetCopyWithValue
          ? this.createTime
          : createTime as DateTime?,
      updateTime: updateTime == unsetCopyWithValue
          ? this.updateTime
          : updateTime as DateTime?,
      state: state == unsetCopyWithValue ? this.state : state as ChunkState?,
    );
  }

  @override
  String toString() => 'Chunk('
      'name: $name, '
      'data: $data, '
      'customMetadata: $customMetadata, '
      'createTime: $createTime, '
      'updateTime: $updateTime, '
      'state: $state)';
}
