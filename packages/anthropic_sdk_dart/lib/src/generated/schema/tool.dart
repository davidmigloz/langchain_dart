// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Tool
// ==========================================

/// A tool the model may use.
@freezed
class Tool with _$Tool {
  const Tool._();

  /// Factory constructor for Tool
  const factory Tool({
    /// The name of the tool. Must match the regex `^[a-zA-Z0-9_-]{1,64}$`.
    required String name,

    /// Description of what this tool does.
    ///
    /// Tool descriptions should be as detailed as possible. The more information that
    /// the model has about what the tool is and how to use it, the better it will
    /// perform. You can use natural language descriptions to reinforce important
    /// aspects of the tool input JSON schema.
    @JsonKey(includeIfNull: false) String? description,

    /// [JSON schema](https://json-schema.org/) for this tool's input.
    ///
    /// This defines the shape of the `input` that your tool accepts and that the model
    /// will produce.
    @JsonKey(name: 'input_schema') required Map<String, dynamic> inputSchema,
  }) = _Tool;

  /// Object construction from a JSON representation
  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'input_schema'
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
      'input_schema': inputSchema,
    };
  }
}
