// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaStepDetailsToolCalls
// ==========================================

/// Tool calls the run step was involved in.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDeltaStepDetailsToolCalls
    with _$RunStepDeltaStepDetailsToolCalls {
  const RunStepDeltaStepDetailsToolCalls._();

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsCodeObject
  // ------------------------------------------

  /// Details of the Code Interpreter tool call the run step was involved in.

  const factory RunStepDeltaStepDetailsToolCalls.codeInterpreter({
    /// The index of the tool call in the tool calls array.
    required int index,

    /// The ID of the tool call.
    @JsonKey(includeIfNull: false) String? id,

    /// Always `code_interpreter`.
    required String type,

    /// The Code Interpreter tool call definition. - outputs
    @JsonKey(name: 'code_interpreter', includeIfNull: false)
    RunStepDeltaStepDetailsToolCallsCodeObjectCodeInterpreter? codeInterpreter,
  }) = RunStepDeltaStepDetailsToolCallsCodeObject;

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsFileSearchObject
  // ------------------------------------------

  /// File search tool call

  const factory RunStepDeltaStepDetailsToolCalls.fileSearch({
    /// The index of the tool call in the tool calls array.
    required int index,

    /// The ID of the tool call object.
    @JsonKey(includeIfNull: false) String? id,

    /// The type of tool call. This is always going to be `file_search` for this type of tool call.
    required String type,

    /// For now, this is always going to be an empty object.
    @JsonKey(name: 'file_search') required Map<String, dynamic> fileSearch,
  }) = RunStepDeltaStepDetailsToolCallsFileSearchObject;

  // ------------------------------------------
  // UNION: RunStepDeltaStepDetailsToolCallsFunctionObject
  // ------------------------------------------

  /// Function tool call

  const factory RunStepDeltaStepDetailsToolCalls.function({
    /// The index of the tool call in the tool calls array.
    required int index,

    /// The ID of the tool call object.
    @JsonKey(includeIfNull: false) String? id,

    /// Always `function`.
    required String type,

    /// The definition of the function that was called.
    @JsonKey(includeIfNull: false)
    RunStepDeltaStepDetailsToolCallsFunction? function,
  }) = RunStepDeltaStepDetailsToolCallsFunctionObject;

  /// Object construction from a JSON representation
  factory RunStepDeltaStepDetailsToolCalls.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDeltaStepDetailsToolCallsFromJson(json);
}

// ==========================================
// CLASS: RunStepDeltaStepDetailsToolCallsFunction
// ==========================================

/// The definition of the function that was called.
@freezed
class RunStepDeltaStepDetailsToolCallsFunction
    with _$RunStepDeltaStepDetailsToolCallsFunction {
  const RunStepDeltaStepDetailsToolCallsFunction._();

  /// Factory constructor for RunStepDeltaStepDetailsToolCallsFunction
  const factory RunStepDeltaStepDetailsToolCallsFunction({
    /// The name of the function.
    @JsonKey(includeIfNull: false) String? name,

    /// The arguments passed to the function.
    @JsonKey(includeIfNull: false) String? arguments,

    /// The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
    @JsonKey(includeIfNull: false) String? output,
  }) = _RunStepDeltaStepDetailsToolCallsFunction;

  /// Object construction from a JSON representation
  factory RunStepDeltaStepDetailsToolCallsFunction.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDeltaStepDetailsToolCallsFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'arguments', 'output'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'arguments': arguments,
      'output': output,
    };
  }
}
