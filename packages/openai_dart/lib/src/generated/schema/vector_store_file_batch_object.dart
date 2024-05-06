// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: VectorStoreFileBatchObject
// ==========================================

/// A batch of files attached to a vector store.
@freezed
class VectorStoreFileBatchObject with _$VectorStoreFileBatchObject {
  const VectorStoreFileBatchObject._();

  /// Factory constructor for VectorStoreFileBatchObject
  const factory VectorStoreFileBatchObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `vector_store.file_batch`.
    required VectorStoreFileBatchObjectObject object,

    /// The Unix timestamp (in seconds) for when the vector store files batch was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
    @JsonKey(name: 'vector_store_id') required String vectorStoreId,

    /// The status of the vector store files batch, which can be either `in_progress`, `completed`, `cancelled` or `failed`.
    required VectorStoreFileBatchObjectStatus status,

    /// The number of files per status.
    @JsonKey(name: 'file_counts')
    required VectorStoreFileBatchObjectFileCounts fileCounts,
  }) = _VectorStoreFileBatchObject;

  /// Object construction from a JSON representation
  factory VectorStoreFileBatchObject.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreFileBatchObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'vector_store_id',
    'status',
    'file_counts'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created_at': createdAt,
      'vector_store_id': vectorStoreId,
      'status': status,
      'file_counts': fileCounts,
    };
  }
}

// ==========================================
// ENUM: VectorStoreFileBatchObjectObject
// ==========================================

/// The object type, which is always `vector_store.file_batch`.
enum VectorStoreFileBatchObjectObject {
  @JsonValue('vector_store.files_batch')
  vectorStoreFilesBatch,
}

// ==========================================
// ENUM: VectorStoreFileBatchObjectStatus
// ==========================================

/// The status of the vector store files batch, which can be either `in_progress`, `completed`, `cancelled` or `failed`.
enum VectorStoreFileBatchObjectStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
}

// ==========================================
// CLASS: VectorStoreFileBatchObjectFileCounts
// ==========================================

/// The number of files per status.
@freezed
class VectorStoreFileBatchObjectFileCounts
    with _$VectorStoreFileBatchObjectFileCounts {
  const VectorStoreFileBatchObjectFileCounts._();

  /// Factory constructor for VectorStoreFileBatchObjectFileCounts
  const factory VectorStoreFileBatchObjectFileCounts({
    /// The number of files that are currently being processed.
    @JsonKey(name: 'in_progress') required int inProgress,

    /// The number of files that have been processed.
    required int completed,

    /// The number of files that have failed to process.
    required int failed,

    /// The number of files that where cancelled.
    required int cancelled,

    /// The total number of files.
    required int total,
  }) = _VectorStoreFileBatchObjectFileCounts;

  /// Object construction from a JSON representation
  factory VectorStoreFileBatchObjectFileCounts.fromJson(
          Map<String, dynamic> json) =>
      _$VectorStoreFileBatchObjectFileCountsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'in_progress',
    'completed',
    'failed',
    'cancelled',
    'total'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'in_progress': inProgress,
      'completed': completed,
      'failed': failed,
      'cancelled': cancelled,
      'total': total,
    };
  }
}
