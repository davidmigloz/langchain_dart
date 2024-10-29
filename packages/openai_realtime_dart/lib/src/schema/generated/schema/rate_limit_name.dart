// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: RateLimitName
// ==========================================

/// The name of the rate limit.
enum RateLimitName {
  @JsonValue('requests')
  requests,
  @JsonValue('tokens')
  tokens,
  @JsonValue('input_tokens')
  inputTokens,
  @JsonValue('output_tokens')
  outputTokens,
}
