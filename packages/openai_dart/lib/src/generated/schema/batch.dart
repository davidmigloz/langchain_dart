// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: Batch
// ==========================================

/// Represents a batch of requests.
@freezed
class Batch with _$Batch {
  const Batch._();

  /// Factory constructor for Batch
  const factory Batch({
    /// No Description
    required String id,

    /// The object type, which is always `batch`.
    required BatchObject object,

    /// The endpoint to be used for all requests in the batch. Currently `/v1/chat/completions`, `/v1/embeddings`, and `/v1/completions` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
    required BatchEndpoint endpoint,

    /// No Description
    @JsonKey(includeIfNull: false) BatchErrors? errors,

    /// The ID of the input file for the batch.
    @JsonKey(name: 'input_file_id') required String inputFileId,

    /// The time frame within which the batch should be processed. Currently only `24h` is supported.
    @JsonKey(name: 'completion_window')
    required BatchCompletionWindow completionWindow,

    /// The current status of the batch.
    required BatchStatus status,

    /// The ID of the file containing the outputs of successfully executed requests.
    @JsonKey(name: 'output_file_id', includeIfNull: false) String? outputFileId,

    /// The ID of the file containing the outputs of requests with errors.
    @JsonKey(name: 'error_file_id', includeIfNull: false) String? errorFileId,

    /// The Unix timestamp (in seconds) for when the batch was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The Unix timestamp (in seconds) for when the batch started processing.
    @JsonKey(name: 'in_progress_at', includeIfNull: false) int? inProgressAt,

    /// The Unix timestamp (in seconds) for when the batch will expire.
    @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt,

    /// The Unix timestamp (in seconds) for when the batch started finalizing.
    @JsonKey(name: 'finalizing_at', includeIfNull: false) int? finalizingAt,

    /// The Unix timestamp (in seconds) for when the batch was completed.
    @JsonKey(name: 'completed_at', includeIfNull: false) int? completedAt,

    /// The Unix timestamp (in seconds) for when the batch failed.
    @JsonKey(name: 'failed_at', includeIfNull: false) int? failedAt,

    /// The Unix timestamp (in seconds) for when the batch expired.
    @JsonKey(name: 'expired_at', includeIfNull: false) int? expiredAt,

    /// The Unix timestamp (in seconds) for when the batch started cancelling.
    @JsonKey(name: 'cancelling_at', includeIfNull: false) int? cancellingAt,

    /// The Unix timestamp (in seconds) for when the batch was cancelled.
    @JsonKey(name: 'cancelled_at', includeIfNull: false) int? cancelledAt,

    /// The request counts for different statuses within the batch.
    @JsonKey(name: 'request_counts', includeIfNull: false)
    BatchRequestCounts? requestCounts,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) dynamic metadata,
  }) = _Batch;

  /// Object construction from a JSON representation
  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'endpoint',
    'errors',
    'input_file_id',
    'completion_window',
    'status',
    'output_file_id',
    'error_file_id',
    'created_at',
    'in_progress_at',
    'expires_at',
    'finalizing_at',
    'completed_at',
    'failed_at',
    'expired_at',
    'cancelling_at',
    'cancelled_at',
    'request_counts',
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
      'endpoint': endpoint,
      'errors': errors,
      'input_file_id': inputFileId,
      'completion_window': completionWindow,
      'status': status,
      'output_file_id': outputFileId,
      'error_file_id': errorFileId,
      'created_at': createdAt,
      'in_progress_at': inProgressAt,
      'expires_at': expiresAt,
      'finalizing_at': finalizingAt,
      'completed_at': completedAt,
      'failed_at': failedAt,
      'expired_at': expiredAt,
      'cancelling_at': cancellingAt,
      'cancelled_at': cancelledAt,
      'request_counts': requestCounts,
      'metadata': metadata,
    };
  }
}

// ==========================================
// ENUM: BatchObject
// ==========================================

/// The object type, which is always `batch`.
enum BatchObject {
  @JsonValue('batch')
  batch,
}

// ==========================================
// CLASS: BatchErrors
// ==========================================

/// No Description
@freezed
class BatchErrors with _$BatchErrors {
  const BatchErrors._();

  /// Factory constructor for BatchErrors
  const factory BatchErrors({
    /// The object type, which is always `list`.
    @JsonKey(includeIfNull: false) String? object,

    /// No Description
    @JsonKey(includeIfNull: false) List<BatchErrorsDataInner>? data,
  }) = _BatchErrors;

  /// Object construction from a JSON representation
  factory BatchErrors.fromJson(Map<String, dynamic> json) =>
      _$BatchErrorsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['object', 'data'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'data': data,
    };
  }
}

// ==========================================
// ENUM: BatchStatus
// ==========================================

/// The current status of the batch.
enum BatchStatus {
  @JsonValue('validating')
  validating,
  @JsonValue('failed')
  failed,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('finalizing')
  finalizing,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
  @JsonValue('cancelling')
  cancelling,
  @JsonValue('cancelled')
  cancelled,
}

// ==========================================
// CLASS: BatchRequestCounts
// ==========================================

/// The request counts for different statuses within the batch.
@freezed
class BatchRequestCounts with _$BatchRequestCounts {
  const BatchRequestCounts._();

  /// Factory constructor for BatchRequestCounts
  const factory BatchRequestCounts({
    /// Total number of requests in the batch.
    required int total,

    /// Number of requests that have been completed successfully.
    required int completed,

    /// Number of requests that have failed.
    required int failed,
  }) = _BatchRequestCounts;

  /// Object construction from a JSON representation
  factory BatchRequestCounts.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestCountsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['total', 'completed', 'failed'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'completed': completed,
      'failed': failed,
    };
  }
}

// ==========================================
// CLASS: BatchErrorsDataInner
// ==========================================

/// No Description
@freezed
class BatchErrorsDataInner with _$BatchErrorsDataInner {
  const BatchErrorsDataInner._();

  /// Factory constructor for BatchErrorsDataInner
  const factory BatchErrorsDataInner({
    /// An error code identifying the error type.
    @JsonKey(includeIfNull: false) String? code,

    /// A human-readable message providing more details about the error.
    @JsonKey(includeIfNull: false) String? message,

    /// The name of the parameter that caused the error, if applicable.
    @JsonKey(includeIfNull: false) String? param,

    /// The line number of the input file where the error occurred, if applicable.
    @JsonKey(includeIfNull: false) int? line,
  }) = _BatchErrorsDataInner;

  /// Object construction from a JSON representation
  factory BatchErrorsDataInner.fromJson(Map<String, dynamic> json) =>
      _$BatchErrorsDataInnerFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'code',
    'message',
    'param',
    'line'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'param': param,
      'line': line,
    };
  }
}
