// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateRequest
// ==========================================

/// No Description
@freezed
class GenerateRequest with _$GenerateRequest {
  const GenerateRequest._();

  /// Factory constructor for GenerateRequest
  const factory GenerateRequest({
    /// (required) the model name
    required String model,

    /// the prompt to generate a response for\nRAW- [INST] why is the sky blue? [/INST]\nJSON- What color is the sky at different times of the day? Respond using JSON\n
    required String prompt,

    /// system prompt to (overrides what is defined in the Modelfile)
    @JsonKey(includeIfNull: false) String? system,

    /// the full prompt or prompt template (overrides what is defined in the Modelfile)
    @JsonKey(includeIfNull: false) String? template,

    /// the context parameter returned from a previous request to /generate, this can be used to keep a short conversational memory
    @JsonKey(includeIfNull: false) List<int>? context,

    /// if false the response will be returned as a single response object, rather than a stream of objects
    @JsonKey(includeIfNull: false) bool? stream,

    /// if true no formatting will be applied to the prompt and no context will be returned. You may choose to use the raw parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
    @JsonKey(includeIfNull: false) bool? raw,

    /// the format to return a response in. Currently the only accepted value is json.\nEnable JSON mode by setting the format parameter to json and specifying the model should use JSON in the prompt. This will structure the response as valid JSON.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    GenerateRequestFormat? format,

    /// additional model parameters listed in the documentation for the Modelfile such as temperature
    @JsonKey(includeIfNull: false) Options? options,
  }) = _GenerateRequest;

  /// Object construction from a JSON representation
  factory GenerateRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'prompt',
    'system',
    'template',
    'context',
    'stream',
    'raw',
    'format',
    'options'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'prompt': prompt,
      'system': system,
      'template': template,
      'context': context,
      'stream': stream,
      'raw': raw,
      'format': format,
      'options': options,
    };
  }
}

// ==========================================
// ENUM: GenerateRequestFormat
// ==========================================

/// the format to return a response in. Currently the only accepted value is json.\nEnable JSON mode by setting the format parameter to json and specifying the model should use JSON in the prompt. This will structure the response as valid JSON.
enum GenerateRequestFormat {
  @JsonValue('json')
  json,
}
