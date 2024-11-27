// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Usage
// ==========================================

/// Billing and rate-limit usage.
///
/// Anthropic's API bills and rate-limits by token counts, as tokens represent the
/// underlying cost to our systems.
///
/// Under the hood, the API transforms requests into a format suitable for the
/// model. The model's output then goes through a parsing stage before becoming an
/// API response. As a result, the token counts in `usage` will not match one-to-one
/// with the exact visible content of an API request or response.
///
/// For example, `output_tokens` will be non-zero, even for an empty string response
/// from Claude.
@freezed
class Usage with _$Usage {
  const Usage._();

  /// Factory constructor for Usage
  const factory Usage({
    /// The number of input tokens which were used.
    @JsonKey(name: 'input_tokens') required int inputTokens,

    /// The number of output tokens which were used.
    @JsonKey(name: 'output_tokens') required int outputTokens,

    /// The number of input tokens read from the cache.
    @JsonKey(name: 'cache_creation_input_tokens', includeIfNull: false)
    int? cacheCreationInputTokens,

    /// The number of input tokens used to create the cache entry.
    @JsonKey(name: 'cache_read_input_tokens', includeIfNull: false)
    int? cacheReadInputTokens,
  }) = _Usage;

  /// Object construction from a JSON representation
  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'input_tokens',
    'output_tokens',
    'cache_creation_input_tokens',
    'cache_read_input_tokens'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'input_tokens': inputTokens,
      'output_tokens': outputTokens,
      'cache_creation_input_tokens': cacheCreationInputTokens,
      'cache_read_input_tokens': cacheReadInputTokens,
    };
  }
}
