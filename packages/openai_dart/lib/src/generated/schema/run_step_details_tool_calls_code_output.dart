// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsCodeOutput
// ==========================================

/// The output of the Code Interpreter tool call.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDetailsToolCallsCodeOutput
    with _$RunStepDetailsToolCallsCodeOutput {
  const RunStepDetailsToolCallsCodeOutput._();

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsCodeOutputLogsObject
  // ------------------------------------------

  /// Text output from the Code Interpreter tool call as part of a run step.
  const factory RunStepDetailsToolCallsCodeOutput.logs({
    /// Always `logs`.
    required RunStepDetailsToolCallsCodeOutputLogsObjectType type,

    /// The text output from the Code Interpreter tool call.
    required String logs,
  }) = RunStepDetailsToolCallsCodeOutputLogsObject;

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsCodeOutputImageObject
  // ------------------------------------------

  /// Code interpreter image output
  const factory RunStepDetailsToolCallsCodeOutput.image({
    /// Always `image`.
    required RunStepDetailsToolCallsCodeOutputImageObjectType type,

    /// Code interpreter image output.
    required RunStepDetailsToolCallsCodeOutputImage image,
  }) = RunStepDetailsToolCallsCodeOutputImageObject;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsCodeOutput.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsCodeOutputFromJson(json);
}

// ==========================================
// ENUM: RunStepDetailsToolCallsCodeOutputLogsObjectType
// ==========================================

/// Always `logs`.
enum RunStepDetailsToolCallsCodeOutputLogsObjectType {
  @JsonValue('logs')
  logs,
}

// ==========================================
// ENUM: RunStepDetailsToolCallsCodeOutputImageObjectType
// ==========================================

/// Always `image`.
enum RunStepDetailsToolCallsCodeOutputImageObjectType {
  @JsonValue('image')
  image,
}
