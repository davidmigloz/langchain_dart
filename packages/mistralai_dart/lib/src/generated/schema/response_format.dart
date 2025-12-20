// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ResponseFormat
// ==========================================

/// An object specifying the format that the model must output.
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message
/// the model generates is valid JSON.
/// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs
/// which guarantees the model will match your supplied JSON schema.
@freezed
abstract class ResponseFormat with _$ResponseFormat {
  const ResponseFormat._();

  /// Factory constructor for ResponseFormat
  const factory ResponseFormat({
    /// The type of response format.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ResponseFormatType? type,

    /// The JSON schema for structured output.
    @JsonKey(name: 'json_schema', includeIfNull: false) JsonSchema? jsonSchema,
  }) = _ResponseFormat;

  /// Object construction from a JSON representation
  factory ResponseFormat.fromJson(Map<String, dynamic> json) =>
      _$ResponseFormatFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'json_schema'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'json_schema': jsonSchema};
  }
}
