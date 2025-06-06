// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: UnionSchema
// ==========================================

/// Union class for [InputContentText], [InputContentImage], [InputContentAudio], [InputContentVideo]
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class UnionSchema with _$UnionSchema {
  const UnionSchema._();

  // ------------------------------------------
  // UNION: InputContentText
  // ------------------------------------------

  /// Text input content.

  const factory UnionSchema.inputContentText({
    /// The type of the content. Always `text`.
    required InputContentTextType type,

    /// The text content.
    required String text,
  }) = InputContentText;

  // ------------------------------------------
  // UNION: InputContentImage
  // ------------------------------------------

  /// Image input content.

  const factory UnionSchema.inputContentImage({
    /// The type of the content. Always `image`.
    required InputContentImageType type,

    /// The image data.
    required InputContentImageImage image,
  }) = InputContentImage;

  // ------------------------------------------
  // UNION: InputContentAudio
  // ------------------------------------------

  /// Audio input content.

  const factory UnionSchema.inputContentAudio({
    /// The type of the content. Always `audio`.
    required InputContentAudioType type,

    /// The audio data.
    required InputContentAudioAudio audio,
  }) = InputContentAudio;

  // ------------------------------------------
  // UNION: InputContentVideo
  // ------------------------------------------

  /// Video input content.

  const factory UnionSchema.inputContentVideo({
    /// The type of the content. Always `video`.
    required InputContentVideoType type,

    /// The video data.
    required InputContentVideoVideo video,
  }) = InputContentVideo;

  /// Object construction from a JSON representation
  factory UnionSchema.fromJson(Map<String, dynamic> json) =>
      _$UnionSchemaFromJson(json);
}

// ==========================================
// ENUM: InputContentTextType
// ==========================================

/// The type of the content. Always `text`.
enum InputContentTextType {
  @JsonValue('text')
  text,
}

// ==========================================
// ENUM: InputContentImageType
// ==========================================

/// The type of the content. Always `image`.
enum InputContentImageType {
  @JsonValue('image')
  image,
}

// ==========================================
// CLASS: InputContentImageImage
// ==========================================

/// The image data.
@freezed
class InputContentImageImage with _$InputContentImageImage {
  const InputContentImageImage._();

  /// Factory constructor for InputContentImageImage
  const factory InputContentImageImage({
    /// Base64 encoded image data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the image data.
    required String format,
  }) = _InputContentImageImage;

  /// Object construction from a JSON representation
  factory InputContentImageImage.fromJson(Map<String, dynamic> json) =>
      _$InputContentImageImageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'format'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'format': format,
    };
  }
}

// ==========================================
// ENUM: InputContentAudioType
// ==========================================

/// The type of the content. Always `audio`.
enum InputContentAudioType {
  @JsonValue('audio')
  audio,
}

// ==========================================
// CLASS: InputContentAudioAudio
// ==========================================

/// The audio data.
@freezed
class InputContentAudioAudio with _$InputContentAudioAudio {
  const InputContentAudioAudio._();

  /// Factory constructor for InputContentAudioAudio
  const factory InputContentAudioAudio({
    /// Base64 encoded audio data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the audio data.
    required String format,
  }) = _InputContentAudioAudio;

  /// Object construction from a JSON representation
  factory InputContentAudioAudio.fromJson(Map<String, dynamic> json) =>
      _$InputContentAudioAudioFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'format'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'format': format,
    };
  }
}

// ==========================================
// ENUM: InputContentVideoType
// ==========================================

/// The type of the content. Always `video`.
enum InputContentVideoType {
  @JsonValue('video')
  video,
}

// ==========================================
// CLASS: InputContentVideoVideo
// ==========================================

/// The video data.
@freezed
class InputContentVideoVideo with _$InputContentVideoVideo {
  const InputContentVideoVideo._();

  /// Factory constructor for InputContentVideoVideo
  const factory InputContentVideoVideo({
    /// Base64 encoded video data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the video data.
    required String format,
  }) = _InputContentVideoVideo;

  /// Object construction from a JSON representation
  factory InputContentVideoVideo.fromJson(Map<String, dynamic> json) =>
      _$InputContentVideoVideoFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'format'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'format': format,
    };
  }
}
