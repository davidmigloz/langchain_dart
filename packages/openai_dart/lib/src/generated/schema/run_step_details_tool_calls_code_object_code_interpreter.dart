// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsCodeObjectCodeInterpreter
// ==========================================

/// The Code Interpreter tool call definition.
@freezed
class RunStepDetailsToolCallsCodeObjectCodeInterpreter
    with _$RunStepDetailsToolCallsCodeObjectCodeInterpreter {
  const RunStepDetailsToolCallsCodeObjectCodeInterpreter._();

  /// Factory constructor for RunStepDetailsToolCallsCodeObjectCodeInterpreter
  const factory RunStepDetailsToolCallsCodeObjectCodeInterpreter({
    /// The input to the Code Interpreter tool call.
    required String input,

    /// The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
    required List<RunStepDetailsToolCallsCodeOutput> outputs,
  }) = _RunStepDetailsToolCallsCodeObjectCodeInterpreter;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsCodeObjectCodeInterpreter.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsCodeObjectCodeInterpreterFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['input', 'outputs'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'input': input,
      'outputs': outputs,
    };
  }
}
