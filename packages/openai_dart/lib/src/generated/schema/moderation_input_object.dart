// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModerationInputObject
// ==========================================

/// Multi-modal inputs to the moderation model.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ModerationInputObject with _$ModerationInputObject {
  const ModerationInputObject._();

  // ------------------------------------------
  // UNION: ModerationInputObjectImageUrl
  // ------------------------------------------

  /// An object describing an image to classify.

  @FreezedUnionValue('image_url')
  const factory ModerationInputObject.imageUrl({
    /// The type of the input object.
    @Default(ModerationInputObjectType.imageUrl) ModerationInputObjectType type,

    /// Contains either an image URL or a data URL for a base64 encoded image.
    @JsonKey(name: 'image_url')
    required ModerationInputObjectImageUrlImageUrl imageUrl,
  }) = ModerationInputObjectImageUrl;

  // ------------------------------------------
  // UNION: ModerationInputObjectText
  // ------------------------------------------

  /// An object describing text to classify.

  @FreezedUnionValue('text')
  const factory ModerationInputObject.text({
    /// The type of the input object.
    @Default(ModerationInputObjectType.text) ModerationInputObjectType type,

    /// A string of text to classify.
    required String text,
  }) = ModerationInputObjectText;

  /// Object construction from a JSON representation
  factory ModerationInputObject.fromJson(Map<String, dynamic> json) =>
      _$ModerationInputObjectFromJson(json);
}

// ==========================================
// ENUM: ModerationInputObjectEnumType
// ==========================================

enum ModerationInputObjectEnumType {
  @JsonValue('image_url')
  imageUrl,
  @JsonValue('text')
  text,
}

// ==========================================
// CLASS: ModerationInputObjectImageUrlImageUrl
// ==========================================

/// Contains either an image URL or a data URL for a base64 encoded image.
@freezed
class ModerationInputObjectImageUrlImageUrl
    with _$ModerationInputObjectImageUrlImageUrl {
  const ModerationInputObjectImageUrlImageUrl._();

  /// Factory constructor for ModerationInputObjectImageUrlImageUrl
  const factory ModerationInputObjectImageUrlImageUrl({
    /// Either a URL of the image or the base64 encoded image data.
    required String url,
  }) = _ModerationInputObjectImageUrlImageUrl;

  /// Object construction from a JSON representation
  factory ModerationInputObjectImageUrlImageUrl.fromJson(
          Map<String, dynamic> json) =>
      _$ModerationInputObjectImageUrlImageUrlFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['url'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }
}
