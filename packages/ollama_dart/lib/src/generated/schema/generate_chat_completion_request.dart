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
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The messages of the chat, this can be used to keep a chat memory
    required List<Message> messages,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,

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

    /// How long (in minutes) to keep the model loaded in memory.
    ///
    /// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
    /// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
    /// - If set to 0, the model will be unloaded immediately once finished.
    /// - If not set, the model will stay loaded for 5 minutes by default
    @JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,

    /// A list of tools the model may call.
    @JsonKey(includeIfNull: false) List<Tool>? tools,

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// Think controls whether thinking/reasoning models will think before
    /// responding. Needs to be a pointer so we can distinguish between false
    /// (request that thinking _not_ be used) and unset (use the old behavior
    /// before this option was introduced).
    @JsonKey(includeIfNull: false) bool? think,
  }) = _GenerateChatCompletionRequest;

  /// Object construction from a JSON representation
  factory GenerateChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateChatCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'stream',
    'format',
    'keep_alive',
    'tools',
    'options',
    'think'
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
      'stream': stream,
      'format': format,
      'keep_alive': keepAlive,
      'tools': tools,
      'options': options,
      'think': think,
    };
  }
}
