// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: BatchEndpoint
// ==========================================

/// The endpoint to be used for all requests in the batch. Currently only `/v1/chat/completions` is supported.
enum BatchEndpoint {
  @JsonValue('/v1/chat/completions')
  v1ChatCompletions,
}
