// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target, unused_import
part of open_a_i_schema;

// ==========================================
// CLASS: CreateImageRequest
// ==========================================

/// Request object for the Create image endpoint.
@freezed
class CreateImageRequest with _$CreateImageRequest {
  const CreateImageRequest._();

  /// Factory constructor for CreateImageRequest
  const factory CreateImageRequest({
    /// A text description of the desired image(s). The maximum length is 1000 characters.
    required String prompt,

    /// The number of images to generate. Must be between 1 and 10.
    @JsonKey(includeIfNull: false) @Default(1) int? n,

    /// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    @JsonKey(
      name: 'response_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    @Default(ImageResponseFormat.url)
    ImageResponseFormat? responseFormat,

    /// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    @Default(ImageSize.v1024x1024)
    ImageSize? size,

    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids).
    @JsonKey(includeIfNull: false) String? user,
  }) = _CreateImageRequest;

  /// Object construction from a JSON representation
  factory CreateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateImageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'prompt',
    'n',
    'response_format',
    'size',
    'user'
  ];

  /// Validation constants
  static const nDefaultValue = 1;
  static const nMinValue = 1;
  static const nMaxValue = 10;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (n != null && n! < nMinValue) {
      return "The value of 'n' cannot be < $nMinValue";
    }
    if (n != null && n! > nMaxValue) {
      return "The value of 'n' cannot be > $nMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'prompt': prompt,
      'n': n,
      'response_format': responseFormat,
      'size': size,
      'user': user,
    };
  }
}

// ==========================================
// ENUM: ImageResponseFormat
// ==========================================

/// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
enum ImageResponseFormat {
  @JsonValue('url')
  url,
  @JsonValue('b64_json')
  b64Json,
}

// ==========================================
// ENUM: ImageSize
// ==========================================

/// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
enum ImageSize {
  @JsonValue('256x256')
  v256x256,
  @JsonValue('512x512')
  v512x512,
  @JsonValue('1024x1024')
  v1024x1024,
}
