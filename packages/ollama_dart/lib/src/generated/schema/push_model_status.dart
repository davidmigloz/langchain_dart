// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: PushModelStatus
// ==========================================

/// Status pushing the model.
enum PushModelStatus {
  @JsonValue('retrieving manifest')
  retrievingManifest,
  @JsonValue('starting upload')
  startingUpload,
  @JsonValue('pushing manifest')
  pushingManifest,
  @JsonValue('success')
  success,
}
