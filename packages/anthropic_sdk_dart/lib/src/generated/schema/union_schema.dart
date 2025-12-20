// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: UnionSchema
// ==========================================

/// Union class for [CodeExecutionResultBlock], [CodeExecutionToolResultError]
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class UnionSchema with _$UnionSchema {
  const UnionSchema._();

  // ------------------------------------------
  // UNION: CodeExecutionResultBlock
  // ------------------------------------------

  /// The result of successful code execution.

  @FreezedUnionValue('code_execution_result')
  const factory UnionSchema.codeExecutionResultBlock({
    /// The type of block.
    required String type,

    /// The return code of the execution.
    @JsonKey(name: 'return_code') required int returnCode,

    /// The standard output from execution.
    required String stdout,

    /// The standard error from execution.
    required String stderr,

    /// Additional content from the execution.
    @JsonKey(includeIfNull: false) List<CodeExecutionOutputBlock>? content,
  }) = CodeExecutionResultBlock;

  // ------------------------------------------
  // UNION: CodeExecutionToolResultError
  // ------------------------------------------

  /// An error from code execution.

  @FreezedUnionValue('code_execution_tool_result_error')
  const factory UnionSchema.codeExecutionToolResultError({
    /// The type of error block.
    required String type,

    /// The error code for a code execution tool result error.
    @JsonKey(name: 'error_code')
    required CodeExecutionToolResultErrorCode errorCode,
  }) = CodeExecutionToolResultError;

  /// Object construction from a JSON representation
  factory UnionSchema.fromJson(Map<String, dynamic> json) =>
      _$UnionSchemaFromJson(json);
}

// ==========================================
// ENUM: UnionSchemaEnumType
// ==========================================

enum UnionSchemaEnumType {
  @JsonValue('code_execution_result')
  codeExecutionResult,
  @JsonValue('code_execution_tool_result_error')
  codeExecutionToolResultError,
}
