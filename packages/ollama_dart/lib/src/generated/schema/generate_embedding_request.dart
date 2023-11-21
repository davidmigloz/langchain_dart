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
  }) = _GenerateEmbeddingRequest;

  /// Object construction from a JSON representation
  factory GenerateEmbeddingRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateEmbeddingRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['model', 'prompt', 'options'];

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
    };
  }
}
