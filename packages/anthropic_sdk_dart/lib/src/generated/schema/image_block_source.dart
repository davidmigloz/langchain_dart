// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ImageBlockSource
// ==========================================

/// The source of an image block.
@freezed
abstract class ImageBlockSource with _$ImageBlockSource {
  const ImageBlockSource._();

  /// Factory constructor for ImageBlockSource
  const factory ImageBlockSource({
    /// The base64-encoded image data.
    required String data,

    /// The media type of the image.
    @JsonKey(name: 'media_type') required ImageBlockSourceMediaType mediaType,

    /// The type of image source.
    required ImageBlockSourceType type,
  }) = _ImageBlockSource;

  /// Object construction from a JSON representation
  factory ImageBlockSource.fromJson(Map<String, dynamic> json) =>
      _$ImageBlockSourceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['data', 'media_type', 'type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'media_type': mediaType,
      'type': type,
    };
  }
}

// ==========================================
// ENUM: ImageBlockSourceMediaType
// ==========================================

/// The media type of the image.
enum ImageBlockSourceMediaType {
  @JsonValue('image/jpeg')
  imageJpeg,
  @JsonValue('image/png')
  imagePng,
  @JsonValue('image/gif')
  imageGif,
  @JsonValue('image/webp')
  imageWebp,
}

// ==========================================
// ENUM: ImageBlockSourceType
// ==========================================

/// The type of image source.
enum ImageBlockSourceType {
  @JsonValue('base64')
  base64,
}
