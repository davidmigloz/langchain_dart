// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Usage
// ==========================================

/// Usage statistics for the response
@freezed
class Usage with _$Usage {
  const Usage._();

  /// Factory constructor for Usage
  const factory Usage({
    /// The total number of tokens used.
    @JsonKey(name: 'total_tokens', includeIfNull: false) int? totalTokens,

    /// The number of input tokens used.
    @JsonKey(name: 'input_tokens', includeIfNull: false) int? inputTokens,

    /// The number of output tokens used.
    @JsonKey(name: 'output_tokens', includeIfNull: false) int? outputTokens,

    /// Details about the input tokens used.
    @JsonKey(name: 'input_token_details', includeIfNull: false)
    UsageInputTokenDetails? inputTokenDetails,
  }) = _Usage;

  /// Object construction from a JSON representation
  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'total_tokens',
    'input_tokens',
    'output_tokens',
    'input_token_details'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'total_tokens': totalTokens,
      'input_tokens': inputTokens,
      'output_tokens': outputTokens,
      'input_token_details': inputTokenDetails,
    };
  }
}

// ==========================================
// CLASS: UsageInputTokenDetails
// ==========================================

/// Details about the input tokens used.
@freezed
class UsageInputTokenDetails with _$UsageInputTokenDetails {
  const UsageInputTokenDetails._();

  /// Factory constructor for UsageInputTokenDetails
  const factory UsageInputTokenDetails({
    /// The number of cached tokens used.
    @JsonKey(name: 'cached_tokens', includeIfNull: false) int? cachedTokens,

    /// The number of text tokens used.
    @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,

    /// The number of audio tokens used.
    @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens,
  }) = _UsageInputTokenDetails;

  /// Object construction from a JSON representation
  factory UsageInputTokenDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageInputTokenDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'cached_tokens',
    'text_tokens',
    'audio_tokens'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'cached_tokens': cachedTokens,
      'text_tokens': textTokens,
      'audio_tokens': audioTokens,
    };
  }
}
