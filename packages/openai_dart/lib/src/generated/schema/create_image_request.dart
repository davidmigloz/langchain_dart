// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
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
    /// A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2` and 4000 characters for `dall-e-3`.
    required String prompt,

    /// The model to use for image generation.
    @_CreateImageRequestModelConverter()
    @JsonKey(includeIfNull: false)
    @Default(
      CreateImageRequestModelString('dall-e-2'),
    )
    CreateImageRequestModel? model,

    /// The number of images to generate. Must be between 1 and 10. For `dall-e-3`, only `n=1` is supported.
    @JsonKey(includeIfNull: false) @Default(1) int? n,

    /// The quality of the image that will be generated. `hd` creates images with finer details and greater consistency across the image. This param is only supported for `dall-e-3`.
    @Default(ImageQuality.standard) ImageQuality quality,

    /// The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    @JsonKey(
      name: 'response_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    @Default(ImageResponseFormat.url)
    ImageResponseFormat? responseFormat,

    /// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`. Must be one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3` models.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    @Default(ImageSize.v1024x1024)
    ImageSize? size,

    /// The style of the generated images. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images. This param is only supported for `dall-e-3`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    @Default(ImageStyle.vivid)
    ImageStyle? style,

    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids).
    @JsonKey(includeIfNull: false) String? user,
  }) = _CreateImageRequest;

  /// Object construction from a JSON representation
  factory CreateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateImageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'prompt',
    'model',
    'n',
    'quality',
    'response_format',
    'size',
    'style',
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
      'model': model,
      'n': n,
      'quality': quality,
      'response_format': responseFormat,
      'size': size,
      'style': style,
      'user': user,
    };
  }
}

// ==========================================
// ENUM: ImageModels
// ==========================================

/// Available models for image generation. Mind that the list may not be exhaustive nor up-to-date.
enum ImageModels {
  @JsonValue('dall-e-2')
  dallE2,
  @JsonValue('dall-e-3')
  dallE3,
}

// ==========================================
// CLASS: CreateImageRequestModel
// ==========================================

/// The model to use for image generation.
@freezed
sealed class CreateImageRequestModel with _$CreateImageRequestModel {
  const CreateImageRequestModel._();

  /// Available models for image generation. Mind that the list may not be exhaustive nor up-to-date.
  const factory CreateImageRequestModel.model(
    ImageModels value,
  ) = CreateImageRequestModelEnumeration;

  /// The ID of the model to use for this request.
  const factory CreateImageRequestModel.modelId(
    String value,
  ) = CreateImageRequestModelString;

  /// Object construction from a JSON representation
  factory CreateImageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateImageRequestModelFromJson(json);
}

/// Custom JSON converter for [CreateImageRequestModel]
class _CreateImageRequestModelConverter
    implements JsonConverter<CreateImageRequestModel?, Object?> {
  const _CreateImageRequestModelConverter();

  @override
  CreateImageRequestModel? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String && _$ImageModelsEnumMap.values.contains(data)) {
      return CreateImageRequestModelEnumeration(
        _$ImageModelsEnumMap.keys.elementAt(
          _$ImageModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return CreateImageRequestModelString(data);
    }
    return CreateImageRequestModelString('dall-e-2');
  }

  @override
  Object? toJson(CreateImageRequestModel? data) {
    return switch (data) {
      CreateImageRequestModelEnumeration(value: final v) =>
        _$ImageModelsEnumMap[v]!,
      CreateImageRequestModelString(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: ImageQuality
// ==========================================

/// The quality of the image that will be generated. `hd` creates images with finer details and greater consistency across the image. This param is only supported for `dall-e-3`.
enum ImageQuality {
  @JsonValue('standard')
  standard,
  @JsonValue('hd')
  hd,
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

/// The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`. Must be one of `1024x1024`, `1792x1024`, or `1024x1792` for `dall-e-3` models.
enum ImageSize {
  @JsonValue('256x256')
  v256x256,
  @JsonValue('512x512')
  v512x512,
  @JsonValue('1024x1024')
  v1024x1024,
  @JsonValue('1792x1024')
  v1792x1024,
  @JsonValue('1024x1792')
  v1024x1792,
}

// ==========================================
// ENUM: ImageStyle
// ==========================================

/// The style of the generated images. Must be one of `vivid` or `natural`. Vivid causes the model to lean towards generating hyper-real and dramatic images. Natural causes the model to produce more natural, less hyper-real looking images. This param is only supported for `dall-e-3`.
enum ImageStyle {
  @JsonValue('vivid')
  vivid,
  @JsonValue('natural')
  natural,
}
