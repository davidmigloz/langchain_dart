// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateEmbeddingRequest
// ==========================================

/// Generate embeddings from a model.
@freezed
class GenerateEmbeddingRequest with _$GenerateEmbeddingRequest {
  const GenerateEmbeddingRequest._();

  /// Factory constructor for GenerateEmbeddingRequest
  const factory GenerateEmbeddingRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama2:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// Text to generate embeddings for.
    required String prompt,

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// How long (in minutes) to keep the model loaded in memory.
    ///
    /// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
    /// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
    /// - If set to 0, the model will be unloaded immediately once finished.
    /// - If not set, the model will stay loaded for 5 minutes by default
    @JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,
  }) = _GenerateEmbeddingRequest;

  /// Object construction from a JSON representation
  factory GenerateEmbeddingRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateEmbeddingRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'prompt',
    'options',
    'keep_alive'
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
      'options': options,
      'keep_alive': keepAlive,
    };
  }
}
