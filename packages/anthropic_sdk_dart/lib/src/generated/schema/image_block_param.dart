// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: ImageBlockParam
// ==========================================

/// No Description
@freezed
class ImageBlockParam with _$ImageBlockParam {
  const ImageBlockParam._();

  /// Factory constructor for ImageBlockParam
  const factory ImageBlockParam({
    /// No Description
    required ImageBlockParamSource source,

    ///
    required ImageBlockParamType type,
  }) = _ImageBlockParam;

  /// Object construction from a JSON representation
  factory ImageBlockParam.fromJson(Map<String, dynamic> json) =>
      _$ImageBlockParamFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['source', 'type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'type': type,
    };
  }
}

// ==========================================
// ENUM: ImageBlockParamType
// ==========================================

/// No Description
enum ImageBlockParamType {
  @JsonValue('image')
  image,
}
