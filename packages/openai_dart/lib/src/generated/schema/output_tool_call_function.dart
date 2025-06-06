// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: OutputToolCallFunction
// ==========================================

/// The function called by the tool.
@freezed
class OutputToolCallFunction with _$OutputToolCallFunction {
  const OutputToolCallFunction._();

  /// Factory constructor for OutputToolCallFunction
  const factory OutputToolCallFunction({
    /// The ID of the tool call.
    required String id,

    /// The name of the function.
    required String name,

    /// The arguments to the function.
    required String arguments,
  }) = _OutputToolCallFunction;

  /// Object construction from a JSON representation
  factory OutputToolCallFunction.fromJson(Map<String, dynamic> json) =>
      _$OutputToolCallFunctionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'name', 'arguments'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'arguments': arguments,
    };
  }
}
