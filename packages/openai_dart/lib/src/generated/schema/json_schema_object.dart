// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: JsonSchemaObject
// ==========================================

/// A JSON Schema object.
@freezed
abstract class JsonSchemaObject with _$JsonSchemaObject {
  const JsonSchemaObject._();

  /// Factory constructor for JsonSchemaObject
  const factory JsonSchemaObject({
    /// The name of the response format. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum
    /// length of 64.
    required String name,

    /// A description of what the response format is for, used by the model to determine how to respond in the
    /// format.
    @JsonKey(includeIfNull: false) String? description,

    /// The schema for the response format, described as a JSON Schema object.
    required Map<String, dynamic> schema,

    /// Whether to enable strict schema adherence when generating the output. If set to true, the model will always
    /// follow the exact schema defined in the `schema` field. Only a subset of JSON Schema is supported when
    /// `strict` is `true`. To learn more, read the
    /// [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
    @JsonKey(includeIfNull: false) @Default(false) bool? strict,
  }) = _JsonSchemaObject;

  /// Object construction from a JSON representation
  factory JsonSchemaObject.fromJson(Map<String, dynamic> json) =>
      _$JsonSchemaObjectFromJson(json);

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
