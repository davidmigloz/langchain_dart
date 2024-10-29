// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ResponseStatusIncompleteReason
// ==========================================

/// The reason the response is incomplete.
enum ResponseStatusIncompleteReason {
  @JsonValue('interruption')
  interruption,
  @JsonValue('max_output_tokens')
  maxOutputTokens,
  @JsonValue('content_filter')
  contentFilter,
}
