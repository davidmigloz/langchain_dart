// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// ENUM: PullModelStatus
// ==========================================

/// Status pulling the model.
enum PullModelStatus {
  @JsonValue('pulling manifest')
  pullingManifest,
  @JsonValue('downloading digestname')
  downloadingDigestname,
  @JsonValue('verifying sha256 digest')
  verifyingSha256Digest,
  @JsonValue('writing manifest')
  writingManifest,
  @JsonValue('removing any unused layers')
  removingAnyUnusedLayers,
  @JsonValue('success')
  success,
}
