// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: StaticChunkingStrategy
// ==========================================

/// Static chunking strategy
@freezed
class StaticChunkingStrategy with _$StaticChunkingStrategy {
  const StaticChunkingStrategy._();

  /// Factory constructor for StaticChunkingStrategy
  const factory StaticChunkingStrategy({
    /// The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the
    /// maximum value is `4096`.
    @JsonKey(name: 'max_chunk_size_tokens') required int maxChunkSizeTokens,

    /// The number of tokens that overlap between chunks. The default value is `400`.
    ///
    /// Note that the overlap must not exceed half of `max_chunk_size_tokens`.
    @JsonKey(name: 'chunk_overlap_tokens') required int chunkOverlapTokens,
  }) = _StaticChunkingStrategy;

  /// Object construction from a JSON representation
  factory StaticChunkingStrategy.fromJson(Map<String, dynamic> json) =>
      _$StaticChunkingStrategyFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'max_chunk_size_tokens',
    'chunk_overlap_tokens'
  ];

  /// Validation constants
  static const maxChunkSizeTokensMinValue = 100;
  static const maxChunkSizeTokensMaxValue = 4096;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (maxChunkSizeTokens < maxChunkSizeTokensMinValue) {
      return "The value of 'maxChunkSizeTokens' cannot be < $maxChunkSizeTokensMinValue";
    }
    if (maxChunkSizeTokens > maxChunkSizeTokensMaxValue) {
      return "The value of 'maxChunkSizeTokens' cannot be > $maxChunkSizeTokensMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'max_chunk_size_tokens': maxChunkSizeTokens,
      'chunk_overlap_tokens': chunkOverlapTokens,
    };
  }
}
