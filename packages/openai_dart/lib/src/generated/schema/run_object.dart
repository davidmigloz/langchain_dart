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

    /// Details on why the run is incomplete. Will be `null` if the run is not incomplete.
    @JsonKey(name: 'incomplete_details')
    required RunObjectIncompleteDetails? incompleteDetails,

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

    /// The sampling temperature used for this run. If not set, defaults to 1.
    @JsonKey(includeIfNull: false) double? temperature,

    /// The maximum number of prompt tokens specified to have been used over the course of the run.
    @JsonKey(name: 'max_prompt_tokens') required int? maxPromptTokens,

    /// The maximum number of completion tokens specified to have been used over the course of the run.
    @JsonKey(name: 'max_completion_tokens') required int? maxCompletionTokens,

    /// Thread truncation controls
    @JsonKey(name: 'truncation_strategy')
    required TruncationObject? truncationStrategy,

    /// Controls which (if any) tool is called by the model.
    /// `none` means the model will not call any tools and instead generates a message.
    /// `auto` is the default value and means the model can pick between generating a message or calling a tool.
    /// Specifying a particular tool like `{"type": "TOOL_TYPE"}` or `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.
    @_RunObjectToolChoiceConverter()
    @JsonKey(name: 'tool_choice')
    required RunObjectToolChoice? toolChoice,

    /// Specifies the format that the model must output. Compatible with [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer than `gpt-3.5-turbo-1106`.
    ///
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
    ///
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
    @_RunObjectResponseFormatConverter()
    @JsonKey(name: 'response_format')
    required RunObjectResponseFormat responseFormat,
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
    'incomplete_details',
    'model',
    'instructions',
    'tools',
    'file_ids',
    'metadata',
    'usage',
    'temperature',
    'max_prompt_tokens',
    'max_completion_tokens',
    'truncation_strategy',
    'tool_choice',
    'response_format'
  ];

  /// Validation constants
  static const maxPromptTokensMinValue = 256;
  static const maxCompletionTokensMinValue = 256;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (maxPromptTokens != null && maxPromptTokens! < maxPromptTokensMinValue) {
      return "The value of 'maxPromptTokens' cannot be < $maxPromptTokensMinValue";
    }
    if (maxCompletionTokens != null &&
        maxCompletionTokens! < maxCompletionTokensMinValue) {
      return "The value of 'maxCompletionTokens' cannot be < $maxCompletionTokensMinValue";
    }
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
      'incomplete_details': incompleteDetails,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'file_ids': fileIds,
      'metadata': metadata,
      'usage': usage,
      'temperature': temperature,
      'max_prompt_tokens': maxPromptTokens,
      'max_completion_tokens': maxCompletionTokens,
      'truncation_strategy': truncationStrategy,
      'tool_choice': toolChoice,
      'response_format': responseFormat,
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
    /// One of `server_error`, `rate_limit_exceeded`, or `invalid_prompt`.
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
// CLASS: RunObjectIncompleteDetails
// ==========================================

/// Details on why the run is incomplete. Will be `null` if the run is not incomplete.
@freezed
class RunObjectIncompleteDetails with _$RunObjectIncompleteDetails {
  const RunObjectIncompleteDetails._();

  /// Factory constructor for RunObjectIncompleteDetails
  const factory RunObjectIncompleteDetails({
    /// The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    RunObjectIncompleteDetailsReason? reason,
  }) = _RunObjectIncompleteDetails;

  /// Object construction from a JSON representation
  factory RunObjectIncompleteDetails.fromJson(Map<String, dynamic> json) =>
      _$RunObjectIncompleteDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['reason'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
    };
  }
}

// ==========================================
// ENUM: RunObjectToolChoiceMode
// ==========================================

/// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
enum RunObjectToolChoiceMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: RunObjectToolChoice
// ==========================================

/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tools and instead generates a message.
/// `auto` is the default value and means the model can pick between generating a message or calling a tool.
/// Specifying a particular tool like `{"type": "TOOL_TYPE"}` or `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.
@freezed
sealed class RunObjectToolChoice with _$RunObjectToolChoice {
  const RunObjectToolChoice._();

  /// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
  const factory RunObjectToolChoice.mode(
    RunObjectToolChoiceMode value,
  ) = RunObjectToolChoiceEnumeration;

  /// No Description
  const factory RunObjectToolChoice.tool(
    AssistantsNamedToolChoice value,
  ) = RunObjectToolChoiceAssistantsNamedToolChoice;

  /// Object construction from a JSON representation
  factory RunObjectToolChoice.fromJson(Map<String, dynamic> json) =>
      _$RunObjectToolChoiceFromJson(json);
}

/// Custom JSON converter for [RunObjectToolChoice]
class _RunObjectToolChoiceConverter
    implements JsonConverter<RunObjectToolChoice, Object?> {
  const _RunObjectToolChoiceConverter();

  @override
  RunObjectToolChoice fromJson(Object? data) {
    if (data is String &&
        _$RunObjectToolChoiceModeEnumMap.values.contains(data)) {
      return RunObjectToolChoiceEnumeration(
        _$RunObjectToolChoiceModeEnumMap.keys.elementAt(
          _$RunObjectToolChoiceModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return RunObjectToolChoiceAssistantsNamedToolChoice(
          AssistantsNamedToolChoice.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for RunObjectToolChoice: $data',
    );
  }

  @override
  Object? toJson(RunObjectToolChoice data) {
    return switch (data) {
      RunObjectToolChoiceEnumeration(value: final v) =>
        _$RunObjectToolChoiceModeEnumMap[v]!,
      RunObjectToolChoiceAssistantsNamedToolChoice(value: final v) =>
        v.toJson(),
    };
  }
}

// ==========================================
// ENUM: RunObjectResponseFormatMode
// ==========================================

/// `auto` is the default value
enum RunObjectResponseFormatMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: RunObjectResponseFormat
// ==========================================

/// Specifies the format that the model must output. Compatible with [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer than `gpt-3.5-turbo-1106`.
///
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
///
/// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
@freezed
sealed class RunObjectResponseFormat with _$RunObjectResponseFormat {
  const RunObjectResponseFormat._();

  /// `auto` is the default value
  const factory RunObjectResponseFormat.mode(
    RunObjectResponseFormatMode value,
  ) = RunObjectResponseFormatEnumeration;

  /// No Description
  const factory RunObjectResponseFormat.format(
    AssistantsResponseFormat value,
  ) = RunObjectResponseFormatAssistantsResponseFormat;

  /// Object construction from a JSON representation
  factory RunObjectResponseFormat.fromJson(Map<String, dynamic> json) =>
      _$RunObjectResponseFormatFromJson(json);
}

/// Custom JSON converter for [RunObjectResponseFormat]
class _RunObjectResponseFormatConverter
    implements JsonConverter<RunObjectResponseFormat, Object?> {
  const _RunObjectResponseFormatConverter();

  @override
  RunObjectResponseFormat fromJson(Object? data) {
    if (data is String &&
        _$RunObjectResponseFormatModeEnumMap.values.contains(data)) {
      return RunObjectResponseFormatEnumeration(
        _$RunObjectResponseFormatModeEnumMap.keys.elementAt(
          _$RunObjectResponseFormatModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return RunObjectResponseFormatAssistantsResponseFormat(
          AssistantsResponseFormat.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for RunObjectResponseFormat: $data',
    );
  }

  @override
  Object? toJson(RunObjectResponseFormat data) {
    return switch (data) {
      RunObjectResponseFormatEnumeration(value: final v) =>
        _$RunObjectResponseFormatModeEnumMap[v]!,
      RunObjectResponseFormatAssistantsResponseFormat(value: final v) =>
        v.toJson(),
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

/// One of `server_error`, `rate_limit_exceeded`, or `invalid_prompt`.
enum RunLastErrorCode {
  @JsonValue('server_error')
  serverError,
  @JsonValue('rate_limit_exceeded')
  rateLimitExceeded,
  @JsonValue('invalid_prompt')
  invalidPrompt,
}

// ==========================================
// ENUM: RunObjectIncompleteDetailsReason
// ==========================================

/// The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
enum RunObjectIncompleteDetailsReason {
  @JsonValue('max_completion_tokens')
  maxCompletionTokens,
  @JsonValue('max_prompt_tokens')
  maxPromptTokens,
}
