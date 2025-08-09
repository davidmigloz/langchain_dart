// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ReasoningEffort
// ==========================================

/// Constrains effort on reasoning for
/// [reasoning models](https://platform.openai.com/docs/guides/reasoning).
/// Currently supported values are `minimal`, `low`, `medium`, and `high`. Reducing
/// reasoning effort can result in faster responses and fewer tokens used
/// on reasoning in a response.
enum ReasoningEffort {
  @JsonValue('minimal')
  minimal,
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}
