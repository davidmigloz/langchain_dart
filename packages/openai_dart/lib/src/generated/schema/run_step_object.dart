// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepObject
// ==========================================

/// Represents a step in execution of a run.
@freezed
class RunStepObject with _$RunStepObject {
  const RunStepObject._();

  /// Factory constructor for RunStepObject
  const factory RunStepObject({
    /// The identifier of the run step, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.run.step`.
    required RunStepObjectObject object,

    /// The Unix timestamp (in seconds) for when the run step was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
    @JsonKey(name: 'assistant_id') required String assistantId,

    /// The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
    @JsonKey(name: 'thread_id') required String threadId,

    /// The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
    @JsonKey(name: 'run_id') required String runId,

    /// The type of run step, which can be either `message_creation` or `tool_calls`.
    required RunStepType type,

    /// The status of the run step, which can be either `in_progress`, `cancelled`, `failed`, `completed`, or `expired`.
    required RunStepStatus status,

    /// The details of the run step.
    /// Any of: [RunStepDetailsMessageCreationObject], [RunStepDetailsToolCallsObject]
    @JsonKey(name: 'step_details') required RunStepDetails stepDetails,

    /// The last error associated with this run step. Will be `null` if there are no errors.
    @JsonKey(name: 'last_error') required RunStepLastError? lastError,

    /// The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
    @JsonKey(name: 'expired_at') required int? expiredAt,

    /// The Unix timestamp (in seconds) for when the run step was cancelled.
    @JsonKey(name: 'cancelled_at') required int? cancelledAt,

    /// The Unix timestamp (in seconds) for when the run step failed.
    @JsonKey(name: 'failed_at') required int? failedAt,

    /// The Unix timestamp (in seconds) for when the run step completed.
    @JsonKey(name: 'completed_at') required int? completedAt,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    required Map<String, dynamic>? metadata,

    /// Usage statistics related to the run step. This value will be `null` while the run step's status is `in_progress`.
    required RunStepCompletionUsage? usage,
  }) = _RunStepObject;

  /// Object construction from a JSON representation
  factory RunStepObject.fromJson(Map<String, dynamic> json) =>
      _$RunStepObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'assistant_id',
    'thread_id',
    'run_id',
    'type',
    'status',
    'step_details',
    'last_error',
    'expired_at',
    'cancelled_at',
    'failed_at',
    'completed_at',
    'metadata',
    'usage'
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
      'assistant_id': assistantId,
      'thread_id': threadId,
      'run_id': runId,
      'type': type,
      'status': status,
      'step_details': stepDetails,
      'last_error': lastError,
      'expired_at': expiredAt,
      'cancelled_at': cancelledAt,
      'failed_at': failedAt,
      'completed_at': completedAt,
      'metadata': metadata,
      'usage': usage,
    };
  }
}

// ==========================================
// ENUM: RunStepObjectObject
// ==========================================

/// The object type, which is always `thread.run.step`.
enum RunStepObjectObject {
  @JsonValue('thread.run.step')
  threadRunStep,
}

// ==========================================
// ENUM: RunStepType
// ==========================================

/// The type of run step, which can be either `message_creation` or `tool_calls`.
enum RunStepType {
  @JsonValue('message_creation')
  messageCreation,
  @JsonValue('tool_calls')
  toolCalls,
}

// ==========================================
// ENUM: RunStepStatus
// ==========================================

/// The status of the run step, which can be either `in_progress`, `cancelled`, `failed`, `completed`, or `expired`.
enum RunStepStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
}

// ==========================================
// CLASS: RunStepLastError
// ==========================================

/// The last error associated with this run step. Will be `null` if there are no errors.
@freezed
class RunStepLastError with _$RunStepLastError {
  const RunStepLastError._();

  /// Factory constructor for RunStepLastError
  const factory RunStepLastError({
    /// One of `server_error` or `rate_limit_exceeded`.
    required RunStepLastErrorCode code,

    /// A human-readable description of the error.
    required String message,
  }) = _RunStepLastError;

  /// Object construction from a JSON representation
  factory RunStepLastError.fromJson(Map<String, dynamic> json) =>
      _$RunStepLastErrorFromJson(json);

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
// ENUM: RunStepLastErrorCode
// ==========================================

/// One of `server_error` or `rate_limit_exceeded`.
enum RunStepLastErrorCode {
  @JsonValue('server_error')
  serverError,
  @JsonValue('rate_limit_exceeded')
  rateLimitExceeded,
}
