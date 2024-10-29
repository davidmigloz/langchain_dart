// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ItemStatus
// ==========================================

/// The status of the item.
enum ItemStatus {
  @JsonValue('completed')
  completed,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('incomplete')
  incomplete,
}
