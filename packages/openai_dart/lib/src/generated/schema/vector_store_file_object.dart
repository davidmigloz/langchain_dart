// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: VectorStoreFileObject
// ==========================================

/// A list of files attached to a vector store.
@freezed
abstract class VectorStoreFileObject with _$VectorStoreFileObject {
  const VectorStoreFileObject._();

  /// Factory constructor for VectorStoreFileObject
  const factory VectorStoreFileObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `vector_store.file`.
    required String object,

    /// The total vector store usage in bytes. Note that this may be different from the original file size.
    @JsonKey(name: 'usage_bytes') required int usageBytes,

    /// The Unix timestamp (in seconds) for when the vector store file was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
    @JsonKey(name: 'vector_store_id') required String vectorStoreId,

    /// The status of the vector store file, which can be either `in_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
    required VectorStoreFileStatus status,

    /// The last error associated with this vector store file. Will be `null` if there are no errors.
    @JsonKey(name: 'last_error')
    required VectorStoreFileObjectLastError? lastError,

    /// The chunking strategy used to chunk the file(s).
    /// Any of: [StaticChunkingStrategyResponseParam], [OtherChunkingStrategyResponseParam]
    @JsonKey(name: 'chunking_strategy', includeIfNull: false)
    ChunkingStrategyResponseParam? chunkingStrategy,
  }) = _VectorStoreFileObject;

  /// Object construction from a JSON representation
  factory VectorStoreFileObject.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreFileObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'usage_bytes',
    'created_at',
    'vector_store_id',
    'status',
    'last_error',
    'chunking_strategy'
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
      'usage_bytes': usageBytes,
      'created_at': createdAt,
      'vector_store_id': vectorStoreId,
      'status': status,
      'last_error': lastError,
      'chunking_strategy': chunkingStrategy,
    };
  }
}

// ==========================================
// ENUM: VectorStoreFileStatus
// ==========================================

/// The status of the vector store file, which can be either `in_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
enum VectorStoreFileStatus {
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
// CLASS: VectorStoreFileObjectLastError
// ==========================================

/// The last error associated with this vector store file. Will be `null` if there are no errors.
@freezed
abstract class VectorStoreFileObjectLastError with _$VectorStoreFileObjectLastError {
  const VectorStoreFileObjectLastError._();

  /// Factory constructor for VectorStoreFileObjectLastError
  const factory VectorStoreFileObjectLastError({
    /// One of `server_error` or `rate_limit_exceeded`.
    required VectorStoreFileObjectLastErrorCode code,

    /// A human-readable description of the error.
    required String message,
  }) = _VectorStoreFileObjectLastError;

  /// Object construction from a JSON representation
  factory VectorStoreFileObjectLastError.fromJson(Map<String, dynamic> json) =>
      _$VectorStoreFileObjectLastErrorFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['code', 'message'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }
}

// ==========================================
// ENUM: VectorStoreFileObjectLastErrorCode
// ==========================================

/// One of `server_error` or `rate_limit_exceeded`.
enum VectorStoreFileObjectLastErrorCode {
  @JsonValue('server_error')
  serverError,
  @JsonValue('unsupported_file')
  unsupportedFile,
  @JsonValue('invalid_file')
  invalidFile,
}
