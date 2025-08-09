// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: Verbosity
// ==========================================

/// Constrains the verbosity of the model's response. Lower values will result in
/// more concise responses, while higher values will result in more verbose responses.
/// Currently supported values are `low`, `medium`, and `high`.
enum Verbosity {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}
