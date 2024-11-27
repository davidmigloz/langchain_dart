// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: InputAudioTranscriptionConfig
// ==========================================

/// Configuration for input audio transcription.
@freezed
class InputAudioTranscriptionConfig with _$InputAudioTranscriptionConfig {
  const InputAudioTranscriptionConfig._();

  /// Factory constructor for InputAudioTranscriptionConfig
  const factory InputAudioTranscriptionConfig({
    /// Whether input audio transcription is enabled.
    @JsonKey(includeIfNull: false) bool? enabled,

    /// The model to use for transcription, `whisper-1` is the only currently
    /// supported model.
    @JsonKey(includeIfNull: false) String? model,
  }) = _InputAudioTranscriptionConfig;

  /// Object construction from a JSON representation
  factory InputAudioTranscriptionConfig.fromJson(Map<String, dynamic> json) =>
      _$InputAudioTranscriptionConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['enabled', 'model'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'enabled': enabled,
      'model': model,
    };
  }
}
