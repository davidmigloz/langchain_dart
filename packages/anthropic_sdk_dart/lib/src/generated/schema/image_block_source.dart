// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ImageBlockSource
// ==========================================

/// The source of an image block.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ImageBlockSource with _$ImageBlockSource {
  const ImageBlockSource._();

  // ------------------------------------------
  // UNION: Base64ImageSource
  // ------------------------------------------

  /// An image source using base64-encoded data.

  @FreezedUnionValue('base64')
  const factory ImageBlockSource.base64ImageSource({
    /// The type of image source.
    required String type,

    /// The media type of the image.
    @JsonKey(name: 'media_type') required Base64ImageSourceMediaType mediaType,

    /// The base64-encoded image data.
    required String data,
  }) = Base64ImageSource;

  // ------------------------------------------
  // UNION: UrlImageSource
  // ------------------------------------------

  /// An image source using a URL.

  @FreezedUnionValue('url')
  const factory ImageBlockSource.urlImageSource({
    /// The type of image source.
    required String type,

    /// The URL of the image.
    required String url,
  }) = UrlImageSource;

  /// Object construction from a JSON representation
  factory ImageBlockSource.fromJson(Map<String, dynamic> json) =>
      _$ImageBlockSourceFromJson(json);
}

// ==========================================
// ENUM: ImageBlockSourceEnumType
// ==========================================

enum ImageBlockSourceEnumType {
  @JsonValue('base64')
  base64,
  @JsonValue('url')
  url,
}

// ==========================================
// ENUM: Base64ImageSourceMediaType
// ==========================================

/// The media type of the image.
enum Base64ImageSourceMediaType {
  @JsonValue('image/jpeg')
  imageJpeg,
  @JsonValue('image/png')
  imagePng,
  @JsonValue('image/gif')
  imageGif,
  @JsonValue('image/webp')
  imageWebp,
}
