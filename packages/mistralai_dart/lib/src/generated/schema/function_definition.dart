// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: FunctionDefinition
// ==========================================

/// A function that the model may call.
@freezed
abstract class FunctionDefinition with _$FunctionDefinition {
  const FunctionDefinition._();

  /// Factory constructor for FunctionDefinition
  const factory FunctionDefinition({
    /// The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes,
    /// with a maximum length of 64.
    required String name,

    /// A description of what the function does, used by the model to choose when and how to call the function.
    @JsonKey(includeIfNull: false) String? description,

    /// The parameters the functions accepts, described as a JSON Schema object.
    /// Omitting parameters defines a function with an empty parameter list.
    required Map<String, dynamic> parameters,
  }) = _FunctionDefinition;

  /// Object construction from a JSON representation
  factory FunctionDefinition.fromJson(Map<String, dynamic> json) =>
      _$FunctionDefinitionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'parameters',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'name': name, 'description': description, 'parameters': parameters};
  }
}
