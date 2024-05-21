// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: ImageBlockParamSource
// ==========================================

/// No Description
@freezed
class ImageBlockParamSource with _$ImageBlockParamSource {
  const ImageBlockParamSource._();

  /// Factory constructor for ImageBlockParamSource
  const factory ImageBlockParamSource({
    /// No Description
    required String data,

    ///
    @JsonKey(name: 'media_type')
    required ImageBlockParamSourceMediaType mediaType,

    ///
    required ImageBlockParamSourceType type,
  }) = _ImageBlockParamSource;

  /// Object construction from a JSON representation
  factory ImageBlockParamSource.fromJson(Map<String, dynamic> json) =>
      _$ImageBlockParamSourceFromJson(json);

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
// ENUM: ImageBlockParamSourceMediaType
// ==========================================

/// No Description
enum ImageBlockParamSourceMediaType {
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
// ENUM: ImageBlockParamSourceType
// ==========================================

/// No Description
enum ImageBlockParamSourceType {
  @JsonValue('base64')
  base64,
}
