// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCalls
// ==========================================

/// Tool calls the run step was involved in.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RunStepDetailsToolCalls with _$RunStepDetailsToolCalls {
  const RunStepDetailsToolCalls._();

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsCodeObject
  // ------------------------------------------

  /// Details of the Code Interpreter tool call the run step was involved in.
  const factory RunStepDetailsToolCalls.codeInterpreter({
    /// The ID of the tool call.
    required String id,

    /// The type of tool call. This is always going to be `code_interpreter` for this type of tool call.
    required RunStepDetailsToolCallsCodeObjectType type,

    /// The Code Interpreter tool call definition.
    @JsonKey(name: 'code_interpreter')
    required RunStepDetailsToolCallsCodeObjectCodeInterpreter codeInterpreter,
  }) = RunStepDetailsToolCallsCodeObject;

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsRetrievalObject
  // ------------------------------------------

  /// Retrieval tool call
  const factory RunStepDetailsToolCalls.retrieval({
    /// The ID of the tool call object.
    required String id,

    /// The type of tool call. This is always going to be `retrieval` for this type of tool call.
    required RunStepDetailsToolCallsRetrievalObjectType type,

    /// For now, this is always going to be an empty object.
    required Map<String, dynamic> retrieval,
  }) = RunStepDetailsToolCallsRetrievalObject;

  // ------------------------------------------
  // UNION: RunStepDetailsToolCallsFunctionObject
  // ------------------------------------------

  /// Function tool call
  const factory RunStepDetailsToolCalls.function({
    /// The ID of the tool call object.
    required String id,

    /// The type of tool call. This is always going to be `function` for this type of tool call.
    required RunStepDetailsToolCallsFunctionObjectType type,

    /// The definition of the function that was called.
    required RunStepDetailsToolCallsFunction function,
  }) = RunStepDetailsToolCallsFunctionObject;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCalls.fromJson(Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsFromJson(json);
}

// ==========================================
// ENUM: RunStepDetailsToolCallsCodeObjectType
// ==========================================

/// The type of tool call. This is always going to be `code_interpreter` for this type of tool call.
enum RunStepDetailsToolCallsCodeObjectType {
  @JsonValue('code_interpreter')
  codeInterpreter,
}

// ==========================================
// ENUM: RunStepDetailsToolCallsRetrievalObjectType
// ==========================================

/// The type of tool call. This is always going to be `retrieval` for this type of tool call.
enum RunStepDetailsToolCallsRetrievalObjectType {
  @JsonValue('retrieval')
  retrieval,
}

// ==========================================
// ENUM: RunStepDetailsToolCallsFunctionObjectType
// ==========================================

/// The type of tool call. This is always going to be `function` for this type of tool call.
enum RunStepDetailsToolCallsFunctionObjectType {
  @JsonValue('function')
  function,
}

// ==========================================
// CLASS: RunStepDetailsToolCallsFunction
// ==========================================

/// The definition of the function that was called.
@freezed
class RunStepDetailsToolCallsFunction with _$RunStepDetailsToolCallsFunction {
  const RunStepDetailsToolCallsFunction._();

  /// Factory constructor for RunStepDetailsToolCallsFunction
  const factory RunStepDetailsToolCallsFunction({
    /// The name of the function.
    required String name,

    /// The arguments passed to the function.
    required String arguments,

    /// The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
    required String? output,
  }) = _RunStepDetailsToolCallsFunction;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsFunction.fromJson(Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsFunctionFromJson(json);

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
