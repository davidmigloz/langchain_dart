// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ToolCallFunction
// ==========================================

/// The function the model wants to call.
@freezed
abstract class ToolCallFunction with _$ToolCallFunction {
  const ToolCallFunction._();

  /// Factory constructor for ToolCallFunction
  const factory ToolCallFunction({
    /// The name of the function to be called.
    required String name,

    /// The arguments to pass to the function.
    required ToolCallFunctionArgs arguments,

    /// The index of the tool call in the list of tool calls
    @JsonKey(includeIfNull: false) int? index,
  }) = _ToolCallFunction;

  /// Object construction from a JSON representation
  factory ToolCallFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name', 'arguments', 'index'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'arguments': arguments,
      'index': index,
    };
  }
}
