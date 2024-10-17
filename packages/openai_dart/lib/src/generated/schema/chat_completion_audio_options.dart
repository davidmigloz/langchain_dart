// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionAudioOptions
// ==========================================

/// Parameters for audio output. Required when audio output is requested with `modalities: ["audio"]`.
/// [Learn more](https://platform.openai.com/docs/guides/audio).
@freezed
class ChatCompletionAudioOptions with _$ChatCompletionAudioOptions {
  const ChatCompletionAudioOptions._();

  /// Factory constructor for ChatCompletionAudioOptions
  const factory ChatCompletionAudioOptions({
    /// Specifies the voice type. Supported voices are `alloy`, `echo`, `fable`, `onyx`, `nova`, and `shimmer`.
    required ChatCompletionAudioVoice voice,

    /// Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`, or `pcm16`.
    required ChatCompletionAudioFormat format,
  }) = _ChatCompletionAudioOptions;

  /// Object construction from a JSON representation
  factory ChatCompletionAudioOptions.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionAudioOptionsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['voice', 'format'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'voice': voice,
      'format': format,
    };
  }
}
