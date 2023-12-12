// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: EmbeddingResponse
// ==========================================

/// Response class for the embedding endpoint.
@freezed
class EmbeddingResponse with _$EmbeddingResponse {
  const EmbeddingResponse._();

  /// Factory constructor for EmbeddingResponse
  const factory EmbeddingResponse({
    /// The unique identifier for this embedding response.
    required String id,

    /// The object type, which is always `list`.
    required String object,

    /// The list of embeddings.
    required List<Embedding> data,

    /// The model used for this embedding.
    required String model,

    /// The usage statistics for this embedding.
    required EmbeddingUsage usage,
  }) = _EmbeddingResponse;

  /// Object construction from a JSON representation
  factory EmbeddingResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'data',
    'model',
    'usage'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'data': data,
      'model': model,
      'usage': usage,
    };
  }
}

// ==========================================
// CLASS: EmbeddingUsage
// ==========================================

/// The usage statistics for this embedding.
@freezed
class EmbeddingUsage with _$EmbeddingUsage {
  const EmbeddingUsage._();

  /// Factory constructor for EmbeddingUsage
  const factory EmbeddingUsage({
    /// The number of tokens in the prompt.
    @JsonKey(name: 'prompt_tokens') required int promptTokens,

    /// The total number of tokens generated.
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _EmbeddingUsage;

  /// Object construction from a JSON representation
  factory EmbeddingUsage.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['prompt_tokens', 'total_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'prompt_tokens': promptTokens,
      'total_tokens': totalTokens,
    };
  }
}
