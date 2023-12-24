// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantTools
// ==========================================

/// A tool that can be used by an assistant.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class AssistantTools with _$AssistantTools {
  const AssistantTools._();

  // ------------------------------------------
  // UNION: AssistantToolsCodeInterpreter
  // ------------------------------------------

  /// Code interpreter tool
  const factory AssistantTools.codeInterpreter({
    /// The type of tool being defined: `code_interpreter`
    @Default('code_interpreter') String type,
  }) = AssistantToolsCodeInterpreter;

  // ------------------------------------------
  // UNION: AssistantToolsRetrieval
  // ------------------------------------------

  /// Retrieval tool
  const factory AssistantTools.retrieval({
    /// The type of tool being defined: `retrieval`
    @Default('retrieval') String type,
  }) = AssistantToolsRetrieval;

  // ------------------------------------------
  // UNION: AssistantToolsFunction
  // ------------------------------------------

  /// Function tool
  const factory AssistantTools.function({
    /// The type of tool being defined: `function`
    @Default('function') String type,

    /// A function that the model may call.
    required FunctionObject function,
  }) = AssistantToolsFunction;

  /// Object construction from a JSON representation
  factory AssistantTools.fromJson(Map<String, dynamic> json) =>
      _$AssistantToolsFromJson(json);
}

// ==========================================
// ENUM: AssistantToolsEnumType
// ==========================================

enum AssistantToolsEnumType {
  @JsonValue('code_interpreter')
  codeInterpreter,
  @JsonValue('retrieval')
  retrieval,
  @JsonValue('function')
  function,
}
