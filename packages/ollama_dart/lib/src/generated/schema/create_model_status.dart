// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: CreateModelStatus
// ==========================================

/// Status creating the model
enum CreateModelStatus {
  @JsonValue('creating system layer')
  creatingSystemLayer,
  @JsonValue('parsing modelfile')
  parsingModelfile,
  @JsonValue('success')
  success,
}
