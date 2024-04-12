// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaStepDetailsToolCallsCodeOutput
// ==========================================

/// The output of the Code Interpreter tool call.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDeltaStepDetailsToolCallsCodeOutput
    with _$RunStepDeltaStepDetailsToolCallsCodeOutput {
  const RunStepDeltaStepDetailsToolCallsCodeOutput._();

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject
  // ------------------------------------------

  /// Text output from the Code Interpreter tool call as part of a run step.
  const factory RunStepDeltaStepDetailsToolCallsCodeOutput.logs({
    /// The index of the output in the outputs array.
    required int index,

    /// Always `logs`.
    required String type,

    /// The text output from the Code Interpreter tool call.
    @JsonKey(includeIfNull: false) String? logs,
  }) = RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject;

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsCodeOutputImageObject
  // ------------------------------------------

  /// Code interpreter image output
  const factory RunStepDeltaStepDetailsToolCallsCodeOutput.image({
    /// The index of the output in the outputs array.
    required int index,

    /// Always `image`.
    required String type,

    /// Code interpreter image output.
    @JsonKey(includeIfNull: false)
    RunStepDeltaStepDetailsToolCallsCodeOutputImage? image,
  }) = RunStepDeltaStepDetailsToolCallsCodeOutputImageObject;

  /// Object construction from a JSON representation
  factory RunStepDeltaStepDetailsToolCallsCodeOutput.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDeltaStepDetailsToolCallsCodeOutputFromJson(json);
}
