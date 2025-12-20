// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: WebSearchToolResultErrorCode
// ==========================================

/// The error code for a web search tool result error.
enum WebSearchToolResultErrorCode {
  @JsonValue('invalid_request')
  invalidRequest,
  @JsonValue('unavailable')
  unavailable,
  @JsonValue('max_uses_exceeded')
  maxUsesExceeded,
  @JsonValue('too_many_requests')
  tooManyRequests,
  @JsonValue('query_too_long')
  queryTooLong,
  @JsonValue('filtered')
  filtered,
  @JsonValue('internal_error')
  internalError,
}
