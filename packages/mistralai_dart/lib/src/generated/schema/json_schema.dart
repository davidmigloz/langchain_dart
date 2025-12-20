// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: JsonSchema
// ==========================================

/// The JSON schema for structured output.
@freezed
abstract class JsonSchema with _$JsonSchema {
  const JsonSchema._();

  /// Factory constructor for JsonSchema
  const factory JsonSchema({
    /// The name of the response format.
    required String name,

    /// A description of the response format.
    @JsonKey(includeIfNull: false) String? description,

    /// The JSON schema object.
    required Map<String, dynamic> schema,

    /// Whether to enable strict schema adherence.
    @JsonKey(includeIfNull: false) bool? strict,
  }) = _JsonSchema;

  /// Object construction from a JSON representation
  factory JsonSchema.fromJson(Map<String, dynamic> json) =>
      _$JsonSchemaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'description',
    'schema',
    'strict',
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
      'schema': schema,
      'strict': strict,
    };
  }
}
