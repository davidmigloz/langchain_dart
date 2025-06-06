// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: OutputContent
// ==========================================

/// Output content.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class OutputContent with _$OutputContent {
  const OutputContent._();

  // ------------------------------------------
  // UNION: OutputContentText
  // ------------------------------------------

  /// Text output content.

  const factory OutputContent.outputContentText({
    /// The type of the content. Always `text`.
    required OutputContentTextType type,

    /// The text content.
    required String text,

    /// No Description
    @JsonKey(includeIfNull: false) List<Annotation>? annotations,
  }) = OutputContentText;

  // ------------------------------------------
  // UNION: OutputContentImageFile
  // ------------------------------------------

  /// Image file output content.

  const factory OutputContent.outputContentImageFile({
    /// The type of the content. Always `image_file`.
    required OutputContentImageFileType type,

    /// The image file data.
    @JsonKey(name: 'image_file')
    required OutputContentImageFileImageFile imageFile,
  }) = OutputContentImageFile;

  // ------------------------------------------
  // UNION: OutputContentImage
  // ------------------------------------------

  /// Image output content.

  const factory OutputContent.outputContentImage({
    /// The type of the content. Always `image`.
    required OutputContentImageType type,

    /// The image data.
    required OutputContentImageImage image,
  }) = OutputContentImage;

  // ------------------------------------------
  // UNION: OutputContentAudio
  // ------------------------------------------

  /// Audio output content.

  const factory OutputContent.outputContentAudio({
    /// The type of the content. Always `audio`.
    required OutputContentAudioType type,

    /// The audio data.
    required OutputContentAudioAudio audio,
  }) = OutputContentAudio;

  // ------------------------------------------
  // UNION: OutputContentVideo
  // ------------------------------------------

  /// Video output content.

  const factory OutputContent.outputContentVideo({
    /// The type of the content. Always `video`.
    required OutputContentVideoType type,

    /// The video data.
    required OutputContentVideoVideo video,
  }) = OutputContentVideo;

  // ------------------------------------------
  // UNION: OutputContentRefusal
  // ------------------------------------------

  /// Refusal output content.

  const factory OutputContent.outputContentRefusal({
    /// The type of the content. Always `refusal`.
    required OutputContentRefusalType type,

    /// The refusal message.
    required String refusal,
  }) = OutputContentRefusal;

  // ------------------------------------------
  // UNION: OutputToolCall
  // ------------------------------------------

  /// A tool call.

  const factory OutputContent.outputToolCall({
    /// The type of the tool call. Always `tool_call`.
    required OutputToolCallType type,

    /// The function called by the tool.
    @JsonKey(name: 'tool_call') required OutputToolCallFunction toolCall,
  }) = OutputToolCall;

  /// Object construction from a JSON representation
  factory OutputContent.fromJson(Map<String, dynamic> json) =>
      _$OutputContentFromJson(json);
}

// ==========================================
// ENUM: OutputContentTextType
// ==========================================

/// The type of the content. Always `text`.
enum OutputContentTextType {
  @JsonValue('text')
  text,
}

// ==========================================
// ENUM: OutputContentImageFileType
// ==========================================

/// The type of the content. Always `image_file`.
enum OutputContentImageFileType {
  @JsonValue('image_file')
  imageFile,
}

// ==========================================
// CLASS: OutputContentImageFileImageFile
// ==========================================

/// The image file data.
@freezed
class OutputContentImageFileImageFile with _$OutputContentImageFileImageFile {
  const OutputContentImageFileImageFile._();

  /// Factory constructor for OutputContentImageFileImageFile
  const factory OutputContentImageFileImageFile({
    /// The ID of the image file.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _OutputContentImageFileImageFile;

  /// Object construction from a JSON representation
  factory OutputContentImageFileImageFile.fromJson(Map<String, dynamic> json) =>
      _$OutputContentImageFileImageFileFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
    };
  }
}

// ==========================================
// ENUM: OutputContentImageType
// ==========================================

/// The type of the content. Always `image`.
enum OutputContentImageType {
  @JsonValue('image')
  image,
}

// ==========================================
// CLASS: OutputContentImageImage
// ==========================================

/// The image data.
@freezed
class OutputContentImageImage with _$OutputContentImageImage {
  const OutputContentImageImage._();

  /// Factory constructor for OutputContentImageImage
  const factory OutputContentImageImage({
    /// Base64 encoded image data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the image data.
    required String format,
  }) = _OutputContentImageImage;

  /// Object construction from a JSON representation
  factory OutputContentImageImage.fromJson(Map<String, dynamic> json) =>
      _$OutputContentImageImageFromJson(json);

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
// ENUM: OutputContentAudioType
// ==========================================

/// The type of the content. Always `audio`.
enum OutputContentAudioType {
  @JsonValue('audio')
  audio,
}

// ==========================================
// CLASS: OutputContentAudioAudio
// ==========================================

/// The audio data.
@freezed
class OutputContentAudioAudio with _$OutputContentAudioAudio {
  const OutputContentAudioAudio._();

  /// Factory constructor for OutputContentAudioAudio
  const factory OutputContentAudioAudio({
    /// Base64 encoded audio data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the audio data.
    required String format,
  }) = _OutputContentAudioAudio;

  /// Object construction from a JSON representation
  factory OutputContentAudioAudio.fromJson(Map<String, dynamic> json) =>
      _$OutputContentAudioAudioFromJson(json);

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
// ENUM: OutputContentVideoType
// ==========================================

/// The type of the content. Always `video`.
enum OutputContentVideoType {
  @JsonValue('video')
  video,
}

// ==========================================
// CLASS: OutputContentVideoVideo
// ==========================================

/// The video data.
@freezed
class OutputContentVideoVideo with _$OutputContentVideoVideo {
  const OutputContentVideoVideo._();

  /// Factory constructor for OutputContentVideoVideo
  const factory OutputContentVideoVideo({
    /// Base64 encoded video data.
    @Uint8ListConverter() required Uint8List data,

    /// The format of the video data.
    required String format,
  }) = _OutputContentVideoVideo;

  /// Object construction from a JSON representation
  factory OutputContentVideoVideo.fromJson(Map<String, dynamic> json) =>
      _$OutputContentVideoVideoFromJson(json);

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
// ENUM: OutputContentRefusalType
// ==========================================

/// The type of the content. Always `refusal`.
enum OutputContentRefusalType {
  @JsonValue('refusal')
  refusal,
}

// ==========================================
// ENUM: OutputToolCallType
// ==========================================

/// The type of the tool call. Always `tool_call`.
enum OutputToolCallType {
  @JsonValue('tool_call')
  toolCall,
}
