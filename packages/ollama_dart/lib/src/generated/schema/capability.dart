// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: Capability
// ==========================================

/// Capability of a model.
enum Capability {
  @JsonValue('completion')
  completion,
  @JsonValue('tools')
  tools,
  @JsonValue('insert')
  insert,
  @JsonValue('vision')
  vision,
  @JsonValue('embedding')
  embedding,
  @JsonValue('thinking')
  thinking,
}
