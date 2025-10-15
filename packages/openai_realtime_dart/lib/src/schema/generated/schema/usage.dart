// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Usage
// ==========================================

/// Usage statistics for the Response, this will correspond to billing. A Realtime API session will
/// maintain a conversation context and append new Items to the Conversation, thus output from
/// previous turns (text and audio tokens) will become the input for later turns.
@freezed
abstract class Usage with _$Usage {
  const Usage._();

  /// Factory constructor for Usage
  const factory Usage({
    /// The total number of tokens in the Response including input and output text and audio tokens.
    @JsonKey(name: 'total_tokens', includeIfNull: false) int? totalTokens,

    /// The number of input tokens used in the Response, including text and audio tokens.
    @JsonKey(name: 'input_tokens', includeIfNull: false) int? inputTokens,

    /// The number of output tokens sent in the Response, including text and audio tokens.
    @JsonKey(name: 'output_tokens', includeIfNull: false) int? outputTokens,

    /// Details about the input tokens used in the Response.
    @JsonKey(name: 'input_token_details', includeIfNull: false)
    UsageInputTokenDetails? inputTokenDetails,

    /// Details about the output tokens used in the Response.
    @JsonKey(name: 'output_token_details', includeIfNull: false)
    UsageOutputTokenDetails? outputTokenDetails,
  }) = _Usage;

  /// Object construction from a JSON representation
  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'total_tokens',
    'input_tokens',
    'output_tokens',
    'input_token_details',
    'output_token_details',
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
      'output_token_details': outputTokenDetails,
    };
  }
}

// ==========================================
// CLASS: UsageInputTokenDetails
// ==========================================

/// Details about the input tokens used in the Response.
@freezed
abstract class UsageInputTokenDetails with _$UsageInputTokenDetails {
  const UsageInputTokenDetails._();

  /// Factory constructor for UsageInputTokenDetails
  const factory UsageInputTokenDetails({
    /// The number of cached tokens used in the Response.
    @JsonKey(name: 'cached_tokens', includeIfNull: false) int? cachedTokens,

    /// The number of text tokens used in the Response.
    @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,

    /// The number of audio tokens used in the Response.
    @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens,
  }) = _UsageInputTokenDetails;

  /// Object construction from a JSON representation
  factory UsageInputTokenDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageInputTokenDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'cached_tokens',
    'text_tokens',
    'audio_tokens',
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

// ==========================================
// CLASS: UsageOutputTokenDetails
// ==========================================

/// Details about the output tokens used in the Response.
@freezed
abstract class UsageOutputTokenDetails with _$UsageOutputTokenDetails {
  const UsageOutputTokenDetails._();

  /// Factory constructor for UsageOutputTokenDetails
  const factory UsageOutputTokenDetails({
    /// The number of text tokens used in the Response.
    @JsonKey(name: 'text_tokens', includeIfNull: false) int? textTokens,

    /// The number of audio tokens used in the Response.
    @JsonKey(name: 'audio_tokens', includeIfNull: false) int? audioTokens,
  }) = _UsageOutputTokenDetails;

  /// Object construction from a JSON representation
  factory UsageOutputTokenDetails.fromJson(Map<String, dynamic> json) =>
      _$UsageOutputTokenDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['text_tokens', 'audio_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'text_tokens': textTokens,
      'audio_tokens': audioTokens,
    };
  }
}
