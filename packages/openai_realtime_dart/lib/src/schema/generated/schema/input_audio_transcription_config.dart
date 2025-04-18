// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: InputAudioTranscriptionConfig
// ==========================================

/// Configuration for input audio transcription, defaults to off and can be
/// set to `null` to turn off once on. Input audio transcription is not native
/// to the model, since the model consumes audio directly. Transcription runs
/// asynchronously through Whisper and should be treated as rough guidance
/// rather than the representation understood by the model.
@freezed
class InputAudioTranscriptionConfig with _$InputAudioTranscriptionConfig {
  const InputAudioTranscriptionConfig._();

  /// Factory constructor for InputAudioTranscriptionConfig
  const factory InputAudioTranscriptionConfig({
    /// The language of the audio to transcribe.
    @JsonKey(includeIfNull: false) String? language,

    /// The model to use for transcription. Current options are `gpt-4o-transcribe`,
    /// `gpt-4o-mini-transcribe`, and `whisper-1`.
    @JsonKey(includeIfNull: false) String? model,

    /// An optional text to guide the model's style or continue a previous audio segment.
    @JsonKey(includeIfNull: false) String? prompt,
  }) = _InputAudioTranscriptionConfig;

  /// Object construction from a JSON representation
  factory InputAudioTranscriptionConfig.fromJson(Map<String, dynamic> json) =>
      _$InputAudioTranscriptionConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['language', 'model', 'prompt'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'model': model,
      'prompt': prompt,
    };
  }
}
