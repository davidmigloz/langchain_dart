// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseFormat
// ==========================================

/// An object specifying the format that the model must output. Compatible with
/// [GPT-4o](https://platform.openai.com/docs/models#gpt-4o),
/// [GPT-4o mini](https://platform.openai.com/docs/models#gpt-4o-mini),
/// [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer
/// than `gpt-3.5-turbo-1106`.
///
/// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs which ensures the model
/// will match your supplied JSON schema.
/// Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
///
/// Setting to `{ "type": "json_object" }` enables JSON mode, which ensures the message the model generates is
/// valid JSON.
///
/// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system
/// or user message. Without this, the model may generate an unending stream of whitespace until the generation
/// reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message
/// content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded
/// `max_tokens` or the conversation exceeded the max context length.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ResponseFormat with _$ResponseFormat {
  const ResponseFormat._();

  // ------------------------------------------
  // UNION: ResponseFormatText
  // ------------------------------------------

  /// The model should respond with plain text.

  @FreezedUnionValue('text')
  const factory ResponseFormat.text({
    /// The type of response format being defined.
    @Default(ResponseFormatType.text) ResponseFormatType type,
  }) = ResponseFormatText;

  // ------------------------------------------
  // UNION: ResponseFormatJsonObject
  // ------------------------------------------

  /// The model should respond with a JSON object.

  @FreezedUnionValue('json_object')
  const factory ResponseFormat.jsonObject({
    /// The type of response format being defined.
    @Default(ResponseFormatType.jsonObject) ResponseFormatType type,
  }) = ResponseFormatJsonObject;

  // ------------------------------------------
  // UNION: ResponseFormatJsonSchema
  // ------------------------------------------

  /// The model should respond with a JSON object that adheres to the specified schema.

  @FreezedUnionValue('json_schema')
  const factory ResponseFormat.jsonSchema({
    /// The type of response format being defined.
    @Default(ResponseFormatType.jsonSchema) ResponseFormatType type,

    /// A JSON Schema object.
    @JsonKey(name: 'json_schema') required JsonSchemaObject jsonSchema,
  }) = ResponseFormatJsonSchema;

  /// Object construction from a JSON representation
  factory ResponseFormat.fromJson(Map<String, dynamic> json) =>
      _$ResponseFormatFromJson(json);
}

// ==========================================
// ENUM: ResponseFormatEnumType
// ==========================================

enum ResponseFormatEnumType {
  @JsonValue('text')
  text,
  @JsonValue('json_object')
  jsonObject,
  @JsonValue('json_schema')
  jsonSchema,
}
