// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: OutputType
// ==========================================

/// The type of the output item.
enum OutputType {
  @JsonValue('text')
  text,
  @JsonValue('tool_use')
  toolUse,
  @JsonValue('tool_result')
  toolResult,
  @JsonValue('image')
  image,
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
  @JsonValue('refusal')
  refusal,
  @JsonValue('error')
  error,
}
