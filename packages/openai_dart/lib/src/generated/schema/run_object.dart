// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunObject
// ==========================================

/// Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
@freezed
class RunObject with _$RunObject {
  const RunObject._();

  /// Factory constructor for RunObject
  const factory RunObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.run`.
    required RunObjectObject object,

    /// The Unix timestamp (in seconds) for when the run was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
    @JsonKey(name: 'thread_id') required String threadId,

    /// The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
    @JsonKey(name: 'assistant_id') required String assistantId,

    /// The status of the run, which can be either `queued`, `in_progress`, `requires_action`, `cancelling`, `cancelled`, `failed`, `completed`, or `expired`.
    required RunStatus status,

    /// Details on the action required to continue the run. Will be `null` if no action is required.
    @JsonKey(name: 'required_action')
    required RunRequiredAction? requiredAction,

    /// The last error associated with this run. Will be `null` if there are no errors.
    @JsonKey(name: 'last_error') required RunLastError? lastError,

    /// The Unix timestamp (in seconds) for when the run will expire.
    @JsonKey(name: 'expires_at') required int? expiresAt,

    /// The Unix timestamp (in seconds) for when the run was started.
    @JsonKey(name: 'started_at') required int? startedAt,

    /// The Unix timestamp (in seconds) for when the run was cancelled.
    @JsonKey(name: 'cancelled_at') required int? cancelledAt,

    /// The Unix timestamp (in seconds) for when the run failed.
    @JsonKey(name: 'failed_at') required int? failedAt,

    /// The Unix timestamp (in seconds) for when the run was completed.
    @JsonKey(name: 'completed_at') required int? completedAt,

    /// The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
    required String model,

    /// The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
    required String instructions,

    /// The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
    required List<AssistantTools> tools,

    /// The list of [File](https://platform.openai.com/docs/api-reference/files) IDs the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
    @JsonKey(name: 'file_ids') required List<String> fileIds,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    required Map<String, dynamic>? metadata,

    /// Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in_progress`, `queued`, etc.).
    required RunCompletionUsage? usage,
  }) = _RunObject;

  /// Object construction from a JSON representation
  factory RunObject.fromJson(Map<String, dynamic> json) =>
      _$RunObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'thread_id',
    'assistant_id',
    'status',
    'required_action',
    'last_error',
    'expires_at',
    'started_at',
    'cancelled_at',
    'failed_at',
    'completed_at',
    'model',
    'instructions',
    'tools',
    'file_ids',
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
      'thread_id': threadId,
      'assistant_id': assistantId,
      'status': status,
      'required_action': requiredAction,
      'last_error': lastError,
      'expires_at': expiresAt,
      'started_at': startedAt,
      'cancelled_at': cancelledAt,
      'failed_at': failedAt,
      'completed_at': completedAt,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'file_ids': fileIds,
      'metadata': metadata,
      'usage': usage,
    };
  }
}

// ==========================================
// ENUM: RunObjectObject
// ==========================================

/// The object type, which is always `thread.run`.
enum RunObjectObject {
  @JsonValue('thread.run')
  threadRun,
}

// ==========================================
// ENUM: RunStatus
// ==========================================

/// The status of the run, which can be either `queued`, `in_progress`, `requires_action`, `cancelling`, `cancelled`, `failed`, `completed`, or `expired`.
enum RunStatus {
  @JsonValue('queued')
  queued,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('requires_action')
  requiresAction,
  @JsonValue('cancelling')
  cancelling,
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
// CLASS: RunRequiredAction
// ==========================================

/// Details on the action required to continue the run. Will be `null` if no action is required.
@freezed
class RunRequiredAction with _$RunRequiredAction {
  const RunRequiredAction._();

  /// Factory constructor for RunRequiredAction
  const factory RunRequiredAction({
    /// For now, this is always `submit_tool_outputs`.
    required RunRequiredActionType type,

    /// Details on the tool outputs needed for this run to continue.
    @JsonKey(name: 'submit_tool_outputs')
    required RunSubmitToolOutputs submitToolOutputs,
  }) = _RunRequiredAction;

  /// Object construction from a JSON representation
  factory RunRequiredAction.fromJson(Map<String, dynamic> json) =>
      _$RunRequiredActionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'submit_tool_outputs'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'submit_tool_outputs': submitToolOutputs,
    };
  }
}

// ==========================================
// CLASS: RunLastError
// ==========================================

/// The last error associated with this run. Will be `null` if there are no errors.
@freezed
class RunLastError with _$RunLastError {
  const RunLastError._();

  /// Factory constructor for RunLastError
  const factory RunLastError({
    /// One of `server_error` or `rate_limit_exceeded`.
    required RunLastErrorCode code,

    /// A human-readable description of the error.
    required String message,
  }) = _RunLastError;

  /// Object construction from a JSON representation
  factory RunLastError.fromJson(Map<String, dynamic> json) =>
      _$RunLastErrorFromJson(json);

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
// ENUM: RunRequiredActionType
// ==========================================

/// For now, this is always `submit_tool_outputs`.
enum RunRequiredActionType {
  @JsonValue('submit_tool_outputs')
  submitToolOutputs,
}

// ==========================================
// CLASS: RunSubmitToolOutputs
// ==========================================

/// Details on the tool outputs needed for this run to continue.
@freezed
class RunSubmitToolOutputs with _$RunSubmitToolOutputs {
  const RunSubmitToolOutputs._();

  /// Factory constructor for RunSubmitToolOutputs
  const factory RunSubmitToolOutputs({
    /// A list of the relevant tool calls.
    @JsonKey(name: 'tool_calls') required List<RunToolCallObject> toolCalls,
  }) = _RunSubmitToolOutputs;

  /// Object construction from a JSON representation
  factory RunSubmitToolOutputs.fromJson(Map<String, dynamic> json) =>
      _$RunSubmitToolOutputsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['tool_calls'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'tool_calls': toolCalls,
    };
  }
}

// ==========================================
// ENUM: RunLastErrorCode
// ==========================================

/// One of `server_error` or `rate_limit_exceeded`.
enum RunLastErrorCode {
  @JsonValue('server_error')
  serverError,
  @JsonValue('rate_limit_exceeded')
  rateLimitExceeded,
}
