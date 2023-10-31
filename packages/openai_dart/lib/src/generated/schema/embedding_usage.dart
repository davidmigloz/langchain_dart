// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: EmbeddingUsage
// ==========================================

/// The usage information for the request.
@freezed
class EmbeddingUsage with _$EmbeddingUsage {
  const EmbeddingUsage._();

  /// Factory constructor for EmbeddingUsage
  const factory EmbeddingUsage({
    /// The number of tokens used by the prompt.
    @JsonKey(name: 'prompt_tokens') required int promptTokens,

    /// The total number of tokens used by the request.
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
