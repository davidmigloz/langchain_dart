// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: CodeExecutionToolResultErrorCode
// ==========================================

/// The error code for a code execution tool result error.
enum CodeExecutionToolResultErrorCode {
  @JsonValue('invalid_request')
  invalidRequest,
  @JsonValue('unavailable')
  unavailable,
  @JsonValue('max_duration_exceeded')
  maxDurationExceeded,
  @JsonValue('internal_error')
  internalError,
}
