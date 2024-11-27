// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ResponseStatusIncompleteReason
// ==========================================

/// The reason the Response did not complete. For a `cancelled` Response, one of `turn_detected`
/// (the server VAD detected a new start of speech) or `client_cancelled` (the client sent a
/// cancel event). For an `incomplete` Response, one of `max_output_tokens` or `content_filter`
/// (the server-side safety filter activated and cut off the response).
enum ResponseStatusIncompleteReason {
  @JsonValue('turn_detected')
  turnDetected,
  @JsonValue('client_cancelled')
  clientCancelled,
  @JsonValue('interruption')
  interruption,
  @JsonValue('max_output_tokens')
  maxOutputTokens,
  @JsonValue('content_filter')
  contentFilter,
}
