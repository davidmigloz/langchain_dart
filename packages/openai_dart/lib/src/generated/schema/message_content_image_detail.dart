// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: MessageContentImageDetail
// ==========================================

/// Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
enum MessageContentImageDetail {
  @JsonValue('auto')
  auto,
  @JsonValue('low')
  low,
  @JsonValue('high')
  high,
}
