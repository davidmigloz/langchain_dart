// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ChatCompletionModality
// ==========================================

/// Output types that you would like the model to generate for this request.
///
/// Most models are capable of generating text, which is the default:
/// `["text"]`
///
/// The `gpt-4o-audio-preview` model can also be used to [generate audio](https://platform.openai.com/docs/guides/audio).
/// To request that this model generate both text and audio responses, you can use:
/// `["text", "audio"]`
enum ChatCompletionModality {
  @JsonValue('text')
  text,
  @JsonValue('audio')
  audio,
}
