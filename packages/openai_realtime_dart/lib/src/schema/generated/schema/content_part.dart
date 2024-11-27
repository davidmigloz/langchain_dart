// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ContentPart
// ==========================================

/// A part of the content.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ContentPart with _$ContentPart {
  const ContentPart._();

  // ------------------------------------------
  // UNION: ContentPartInputText
  // ------------------------------------------

  /// A part of the input text content.

  @FreezedUnionValue('input_text')
  const factory ContentPart.inputText({
    /// The content type.
    @Default(ContentType.inputText) ContentType type,

    /// The text content.
    required String text,
  }) = ContentPartInputText;

  // ------------------------------------------
  // UNION: ContentPartInputAudio
  // ------------------------------------------

  /// A part of the input audio content.

  @FreezedUnionValue('input_audio')
  const factory ContentPart.inputAudio({
    /// The content type.
    @Default(ContentType.inputAudio) ContentType type,

    /// Base64-encoded audio bytes.
    @JsonKey(includeIfNull: false) String? audio,

    /// The transcript of the audio.
    @JsonKey(includeIfNull: false) String? transcript,
  }) = ContentPartInputAudio;

  // ------------------------------------------
  // UNION: ContentPartText
  // ------------------------------------------

  /// A part of the text content.

  @FreezedUnionValue('text')
  const factory ContentPart.text({
    /// The content type.
    @Default(ContentType.text) ContentType type,

    /// The text content.
    required String text,
  }) = ContentPartText;

  // ------------------------------------------
  // UNION: ContentPartAudio
  // ------------------------------------------

  /// A part of the audio content.

  @FreezedUnionValue('audio')
  const factory ContentPart.audio({
    /// The content type.
    @Default(ContentType.audio) ContentType type,

    /// Base64-encoded audio bytes.
    @JsonKey(includeIfNull: false) String? audio,

    /// The transcript of the audio.
    @JsonKey(includeIfNull: false) String? transcript,
  }) = ContentPartAudio;

  /// Object construction from a JSON representation
  factory ContentPart.fromJson(Map<String, dynamic> json) =>
      _$ContentPartFromJson(json);
}

// ==========================================
// ENUM: ContentPartEnumType
// ==========================================

enum ContentPartEnumType {
  @JsonValue('input_text')
  inputText,
  @JsonValue('input_audio')
  inputAudio,
  @JsonValue('text')
  text,
  @JsonValue('audio')
  audio,
}
