// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ContentType
// ==========================================

/// The type of the content.
enum ContentType {
  @JsonValue('input_text')
  inputText,
  @JsonValue('input_audio')
  inputAudio,
  @JsonValue('text')
  text,
  @JsonValue('audio')
  audio,
}
