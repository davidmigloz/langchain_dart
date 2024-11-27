// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ResponseStatusType
// ==========================================

/// The type of error that caused the response to fail.
enum ResponseStatusType {
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('incomplete')
  incomplete,
  @JsonValue('failed')
  failed,
}
