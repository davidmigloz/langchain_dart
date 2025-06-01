// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: InputAudioTranscriptionConfig
// ==========================================

/// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
/// once on. Input audio transcription is not native to the model, since the model consumes audio
/// directly. Transcription runs  asynchronously through [the /audio/transcriptions
/// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
/// treated as guidance of input audio content rather than precisely what the model heard. The client
/// can optionally set the language and prompt for transcription, these offer additional guidance to
/// the transcription service.
@freezed
class InputAudioTranscriptionConfig with _$InputAudioTranscriptionConfig {
  const InputAudioTranscriptionConfig._();

  /// Factory constructor for InputAudioTranscriptionConfig
  const factory InputAudioTranscriptionConfig({
    /// The model to use for transcription, current options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `whisper-1`.
    @JsonKey(includeIfNull: false) String? model,

    /// The language of the input audio. Supplying the input language in
    /// [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
    /// will improve accuracy and latency.
    @JsonKey(includeIfNull: false) String? language,

    /// An optional text to guide the model's style or continue a previous audio
    /// segment.
    /// For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
    /// For `gpt-4o-transcribe` models, the prompt is a free text string, for example "expect words related to technology".
    @JsonKey(includeIfNull: false) String? prompt,
  }) = _InputAudioTranscriptionConfig;

  /// Object construction from a JSON representation
  factory InputAudioTranscriptionConfig.fromJson(Map<String, dynamic> json) =>
      _$InputAudioTranscriptionConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['model', 'language', 'prompt'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'language': language,
      'prompt': prompt,
    };
  }
}
