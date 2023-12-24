// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateChatCompletionRequest
// ==========================================

/// Request class for the chat endpoint.
@freezed
class GenerateChatCompletionRequest with _$GenerateChatCompletionRequest {
  const GenerateChatCompletionRequest._();

  /// Factory constructor for GenerateChatCompletionRequest
  const factory GenerateChatCompletionRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The messages of the chat, this can be used to keep a chat memory
    required List<Message> messages,

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

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,
  }) = _GenerateChatCompletionRequest;

  /// Object construction from a JSON representation
  factory GenerateChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateChatCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'format',
    'options',
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
      'messages': messages,
      'format': format,
      'options': options,
      'stream': stream,
    };
  }
}
