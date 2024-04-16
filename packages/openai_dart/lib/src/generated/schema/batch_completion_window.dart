// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: BatchCompletionWindow
// ==========================================

/// The time frame within which the batch should be processed. Currently only `24h` is supported.
enum BatchCompletionWindow {
  @JsonValue('24h')
  v24h,
}
