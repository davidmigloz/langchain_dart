// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: WebSearchContextSize
// ==========================================

/// High level guidance for the amount of context window space to use for the
/// search. One of `low`, `medium`, or `high`. `medium` is the default.
enum WebSearchContextSize {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}
