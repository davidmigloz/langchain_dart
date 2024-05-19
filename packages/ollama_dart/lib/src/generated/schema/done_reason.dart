// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: DoneReason
// ==========================================

/// Reason why the model is done generating a response.
enum DoneReason {
  @JsonValue('stop')
  stop,
  @JsonValue('length')
  length,
  @JsonValue('load')
  load,
}
