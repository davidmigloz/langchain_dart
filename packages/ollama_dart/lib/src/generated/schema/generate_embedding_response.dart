// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateEmbeddingResponse
// ==========================================

/// Returns the embedding information.
@freezed
class GenerateEmbeddingResponse with _$GenerateEmbeddingResponse {
  const GenerateEmbeddingResponse._();

  /// Factory constructor for GenerateEmbeddingResponse
  const factory GenerateEmbeddingResponse({
    /// The embedding for the prompt.
    @JsonKey(includeIfNull: false) List<double>? embedding,
  }) = _GenerateEmbeddingResponse;

  /// Object construction from a JSON representation
  factory GenerateEmbeddingResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateEmbeddingResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['embedding'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'embedding': embedding,
    };
  }
}
