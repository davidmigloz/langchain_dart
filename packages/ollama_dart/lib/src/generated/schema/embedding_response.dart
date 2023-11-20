// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: EmbeddingResponse
// ==========================================

/// Returns the embedding information
@freezed
class EmbeddingResponse with _$EmbeddingResponse {
  const EmbeddingResponse._();

  /// Factory constructor for EmbeddingResponse
  const factory EmbeddingResponse({
    /// No Description
    @JsonKey(includeIfNull: false) List<double>? embedding,
  }) = _EmbeddingResponse;

  /// Object construction from a JSON representation
  factory EmbeddingResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingResponseFromJson(json);

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
