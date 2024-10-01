// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: VectorStoreObject
// ==========================================

/// A vector store is a collection of processed files can be used by the `file_search` tool.
@freezed
class VectorStoreObject with _$VectorStoreObject {
  const VectorStoreObject._();

  /// Factory constructor for VectorStoreObject
  const factory VectorStoreObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `vector_store`.
    required String object,

    /// The Unix timestamp (in seconds) for when the vector store was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The name of the vector store.
    required String? name,

    /// The total number of bytes used by the files in the vector store.
    @JsonKey(name: 'usage_bytes') required int usageBytes,

    /// The number of files in the vector store.
    @JsonKey(name: 'file_counts')
    required VectorStoreObjectFileCounts fileCounts,

    /// The status of the vector store, which can be either `expired`, `in_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
    required VectorStoreObjectStatus status,

    /// The expiration policy for a vector store.
    @JsonKey(name: 'expires_after', includeIfNull: false)
    VectorStoreExpirationAfter? expiresAfter,

    /// The Unix timestamp (in seconds) for when the vector store will expire.
    @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt,

    /// The Unix timestamp (in seconds) for when the vector store was last active.
    @JsonKey(name: 'last_active_at') required int? lastActiveAt,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    required dynamic metadata,
  }) = _VectorStoreObject;

  /// Object construction from a JSON representation
  factory VectorStoreObject.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'name',
    'usage_bytes',
    'file_counts',
    'status',
    'expires_after',
    'expires_at',
    'last_active_at',
    'metadata'
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
      'name': name,
      'usage_bytes': usageBytes,
      'file_counts': fileCounts,
      'status': status,
      'expires_after': expiresAfter,
      'expires_at': expiresAt,
      'last_active_at': lastActiveAt,
      'metadata': metadata,
    };
  }
}

// ==========================================
// CLASS: VectorStoreObjectFileCounts
// ==========================================

/// The number of files in the vector store.
@freezed
class VectorStoreObjectFileCounts with _$VectorStoreObjectFileCounts {
  const VectorStoreObjectFileCounts._();

  /// Factory constructor for VectorStoreObjectFileCounts
  const factory VectorStoreObjectFileCounts({
    /// The number of files that are currently being processed.
    @JsonKey(name: 'in_progress') required int inProgress,

    /// The number of files that have been successfully processed.
    required int completed,

    /// The number of files that have failed to process.
    required int failed,

    /// The number of files that were cancelled.
    required int cancelled,

    /// The total number of files.
    required int total,
  }) = _VectorStoreObjectFileCounts;

  /// Object construction from a JSON representation
  factory VectorStoreObjectFileCounts.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreObjectFileCountsFromJson(json);

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

// ==========================================
// ENUM: VectorStoreObjectStatus
// ==========================================

/// The status of the vector store, which can be either `expired`, `in_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
enum VectorStoreObjectStatus {
  @JsonValue('expired')
  expired,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
}
