// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ToolChoiceToolFunction
// ==========================================

/// The function to force the model to call.
@freezed
abstract class ToolChoiceToolFunction with _$ToolChoiceToolFunction {
  const ToolChoiceToolFunction._();

  /// Factory constructor for ToolChoiceToolFunction
  const factory ToolChoiceToolFunction({
    /// The name of the function to call.
    required String name,
  }) = _ToolChoiceToolFunction;

  /// Object construction from a JSON representation
  factory ToolChoiceToolFunction.fromJson(Map<String, dynamic> json) =>
      _$ToolChoiceToolFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['name'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
