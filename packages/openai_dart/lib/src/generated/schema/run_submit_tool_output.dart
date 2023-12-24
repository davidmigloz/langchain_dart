// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunSubmitToolOutput
// ==========================================

/// Output of a tool.
@freezed
class RunSubmitToolOutput with _$RunSubmitToolOutput {
  const RunSubmitToolOutput._();

  /// Factory constructor for RunSubmitToolOutput
  const factory RunSubmitToolOutput({
    /// The ID of the tool call in the `required_action` object within the run object the output is being submitted for.
    @JsonKey(name: 'tool_call_id', includeIfNull: false) String? toolCallId,

    /// The output of the tool call to be submitted to continue the run.
    @JsonKey(includeIfNull: false) String? output,
  }) = _RunSubmitToolOutput;

  /// Object construction from a JSON representation
  factory RunSubmitToolOutput.fromJson(Map<String, dynamic> json) =>
      _$RunSubmitToolOutputFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['tool_call_id', 'output'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'tool_call_id': toolCallId,
      'output': output,
    };
  }
}
