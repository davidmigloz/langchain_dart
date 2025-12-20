// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CodeExecutionOutputBlock
// ==========================================

/// Output content from code execution.
@freezed
abstract class CodeExecutionOutputBlock with _$CodeExecutionOutputBlock {
  const CodeExecutionOutputBlock._();

  /// Factory constructor for CodeExecutionOutputBlock
  const factory CodeExecutionOutputBlock({
    /// The type of output.
    required String type,

    /// The file ID for the output.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _CodeExecutionOutputBlock;

  /// Object construction from a JSON representation
  factory CodeExecutionOutputBlock.fromJson(Map<String, dynamic> json) =>
      _$CodeExecutionOutputBlockFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'file_id': fileId};
  }
}
