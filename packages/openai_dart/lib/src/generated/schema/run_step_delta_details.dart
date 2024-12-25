// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaDetails
// ==========================================

/// The details of the run step
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDeltaDetails with _$RunStepDeltaDetails {
  const RunStepDeltaDetails._();

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsMessageCreationObject
  // ------------------------------------------

  /// Details of the message creation by the run step.

  const factory RunStepDeltaDetails.messageCreation({
    /// Always `message_creation`.
    required String type,

    /// Details of the message creation by the run step.
    @JsonKey(name: 'message_creation', includeIfNull: false)
    RunStepDeltaStepDetailsMessageCreation? messageCreation,
  }) = RunStepDeltaStepDetailsMessageCreationObject;

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsObject
  // ------------------------------------------

  /// Details of the tool call.

  const factory RunStepDeltaDetails.toolCalls({
    /// Always `tool_calls`.
    required String type,

    /// An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code_interpreter`, `file_search`, or `function`.
    @JsonKey(name: 'tool_calls', includeIfNull: false)
    List<RunStepDeltaStepDetailsToolCalls>? toolCalls,
  }) = RunStepDeltaStepDetailsToolCallsObject;

  /// Object construction from a JSON representation
  factory RunStepDeltaDetails.fromJson(Map<String, dynamic> json) =>
      _$RunStepDeltaDetailsFromJson(json);
}
