// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ToolDefinition
// ==========================================

/// The definition of a tool the model may use.
@freezed
class ToolDefinition with _$ToolDefinition {
  const ToolDefinition._();

  /// Factory constructor for ToolDefinition
  const factory ToolDefinition({
    /// The type of the tool, i.e. `function`.
    @Default(ToolType.function) ToolType type,

    /// The name of the function.
    required String name,

    /// The description of the function, including guidance on when and how
    /// to call it, and guidance about what to tell the user when calling
    /// (if anything).
    @JsonKey(includeIfNull: false) String? description,

    /// Parameters of the function in JSON Schema.
    @JsonKey(includeIfNull: false) dynamic parameters,
  }) = _ToolDefinition;

  /// Object construction from a JSON representation
  factory ToolDefinition.fromJson(Map<String, dynamic> json) =>
      _$ToolDefinitionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
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
      'type': type,
      'name': name,
      'description': description,
      'parameters': parameters,
    };
  }
}
