// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetails
// ==========================================

/// The details of the run step.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDetails with _$RunStepDetails {
  const RunStepDetails._();

  // ------------------------------------------
  // UNION: RunStepDetailsMessageCreationObject
  // ------------------------------------------

  /// Details of the message creation by the run step.
  const factory RunStepDetails.messageCreation({
    /// Always `message_creation`.
    required RunStepDetailsMessageCreationObjectType type,

    /// Details of the message creation by the run step.
    @JsonKey(name: 'message_creation')
    required RunStepDetailsMessageCreation messageCreation,
  }) = RunStepDetailsMessageCreationObject;

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsObject
  // ------------------------------------------

  /// Details of the tool call.
  const factory RunStepDetails.toolCalls({
    /// Always `tool_calls`.
    required RunStepDetailsToolCallsObjectType type,

    /// An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code_interpreter`, `retrieval`, or `function`.
    @JsonKey(name: 'tool_calls')
    required List<RunStepDetailsToolCalls> toolCalls,
  }) = RunStepDetailsToolCallsObject;

  /// Object construction from a JSON representation
  factory RunStepDetails.fromJson(Map<String, dynamic> json) =>
      _$RunStepDetailsFromJson(json);
}

// ==========================================
// ENUM: RunStepDetailsMessageCreationObjectType
// ==========================================

/// Always `message_creation`.
enum RunStepDetailsMessageCreationObjectType {
  @JsonValue('message_creation')
  messageCreation,
}

// ==========================================
// ENUM: RunStepDetailsToolCallsObjectType
// ==========================================

/// Always `tool_calls`.
enum RunStepDetailsToolCallsObjectType {
  @JsonValue('tool_calls')
  toolCalls,
}
