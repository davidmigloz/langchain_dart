// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageDeltaUsage
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
class MessageDeltaUsage with _$MessageDeltaUsage {
  const MessageDeltaUsage._();

  /// Factory constructor for MessageDeltaUsage
  const factory MessageDeltaUsage({
    /// The cumulative number of output tokens which were used.
    @JsonKey(name: 'output_tokens') required int outputTokens,
  }) = _MessageDeltaUsage;

  /// Object construction from a JSON representation
  factory MessageDeltaUsage.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['output_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'output_tokens': outputTokens};
  }
}
