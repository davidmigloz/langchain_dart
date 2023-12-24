// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateCompletionRequest
// ==========================================

/// Request class for the generate endpoint.
@freezed
class GenerateCompletionRequest with _$GenerateCompletionRequest {
  const GenerateCompletionRequest._();

  /// Factory constructor for GenerateCompletionRequest
  const factory GenerateCompletionRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The prompt to generate a response.
    required String prompt,

    /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
    @JsonKey(includeIfNull: false) List<String>? images,

    /// The system prompt to (overrides what is defined in the Modelfile).
    @JsonKey(includeIfNull: false) String? system,

    /// The full prompt or prompt template (overrides what is defined in the Modelfile).
    @JsonKey(includeIfNull: false) String? template,

    /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
    @JsonKey(includeIfNull: false) List<int>? context,

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// The format to return a response in. Currently the only accepted value is json.
    ///
    /// Enable JSON mode by setting the format parameter to json. This will structure the response as valid JSON.
    ///
    /// Note: it's important to instruct the model to use JSON in the prompt. Otherwise, the model may generate large amounts whitespace.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    ResponseFormat? format,

    /// If `true` no formatting will be applied to the prompt and no context will be returned.
    ///
    /// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
    @JsonKey(includeIfNull: false) bool? raw,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,
  }) = _GenerateCompletionRequest;

  /// Object construction from a JSON representation
  factory GenerateCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'prompt',
    'images',
    'system',
    'template',
    'context',
    'options',
    'format',
    'raw',
    'stream'
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
      'images': images,
      'system': system,
      'template': template,
      'context': context,
      'options': options,
      'format': format,
      'raw': raw,
      'stream': stream,
    };
  }
}
