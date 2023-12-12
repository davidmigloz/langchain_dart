// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// ENUM: ChatCompletionFinishReason
// ==========================================

/// The reason the model stopped generating tokens.
enum ChatCompletionFinishReason {
  @JsonValue('stop')
  stop,
  @JsonValue('length')
  length,
  @JsonValue('model_length')
  modelLength,
}
