// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: EmbeddingRequest
// ==========================================

/// Generate embeddings from a model
@freezed
class EmbeddingRequest with _$EmbeddingRequest {
  const EmbeddingRequest._();

  /// Factory constructor for EmbeddingRequest
  const factory EmbeddingRequest({
    /// name of model to generate embeddings from
    required String model,

    /// text to generate embeddings for
    required String prompt,

    /// additional model parameters listed in the documentation for the Modelfile such as temperature
    @JsonKey(includeIfNull: false) Options? options,
  }) = _EmbeddingRequest;

  /// Object construction from a JSON representation
  factory EmbeddingRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingRequestFromJson(json);

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
