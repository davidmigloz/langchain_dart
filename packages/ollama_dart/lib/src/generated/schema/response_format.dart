// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: ResponseFormat
// ==========================================

/// The format to return a response in. Currently the only accepted value is json.
///
/// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
///
/// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
enum ResponseFormat {
  @JsonValue('json')
  json,
}
