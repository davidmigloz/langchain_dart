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
    /// The model to use for transcription, `whisper-1` is the only currently
    /// supported model.
    @JsonKey(includeIfNull: false) String? model,
  }) = _InputAudioTranscriptionConfig;

  /// Object construction from a JSON representation
  factory InputAudioTranscriptionConfig.fromJson(Map<String, dynamic> json) =>
      _$InputAudioTranscriptionConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['model'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
    };
  }
}
