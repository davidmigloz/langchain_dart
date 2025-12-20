// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ToolChoiceTool
// ==========================================

/// Forces the model to call a specific tool.
@freezed
abstract class ToolChoiceTool with _$ToolChoiceTool {
  const ToolChoiceTool._();

  /// Factory constructor for ToolChoiceTool
  const factory ToolChoiceTool({
    /// The type of the tool.
    required ToolType type,

    /// The function to force the model to call.
    required ToolChoiceToolFunction function,
  }) = _ToolChoiceTool;

  /// Object construction from a JSON representation
  factory ToolChoiceTool.fromJson(Map<String, dynamic> json) =>
      _$ToolChoiceToolFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'function': function};
  }
}
