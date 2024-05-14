// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: BatchEndpoint
// ==========================================

/// The endpoint to be used for all requests in the batch. Currently `/v1/chat/completions`, `/v1/embeddings`, and `/v1/completions` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
enum BatchEndpoint {
  @JsonValue('/v1/chat/completions')
  v1ChatCompletions,
  @JsonValue('/v1/embeddings')
  v1Embeddings,
  @JsonValue('/v1/completions')
  v1Completions,
}
