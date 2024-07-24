// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ToolFunction
// ==========================================

/// A function that the model may call.
@freezed
class ToolFunction with _$ToolFunction {
  const ToolFunction._();

  /// Factory constructor for ToolFunction
  const factory ToolFunction({
    /// The name of the function to be called.
    required String name,

    /// A description of what the function does, used by the model to choose when and how to call the function.
    required String description,

    /// The parameters the functions accepts, described as a JSON Schema object.
    required ToolFunctionParams parameters,
  }) = _ToolFunction;

  /// Object construction from a JSON representation
  factory ToolFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'parameters'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'parameters': parameters,
    };
  }
}
