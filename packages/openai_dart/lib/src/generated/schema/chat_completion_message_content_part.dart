// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionMessageContentPart
// ==========================================

/// A content part of a user message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ChatCompletionMessageContentPart
    with _$ChatCompletionMessageContentPart {
  const ChatCompletionMessageContentPart._();

  // ------------------------------------------
  // UNION: ChatCompletionMessageContentPartText
  // ------------------------------------------

  /// A text content part of a user message.
  const factory ChatCompletionMessageContentPart.text({
    /// The type of the content part, in this case `text`.
    @Default(ChatCompletionMessageContentPartType.text)
    ChatCompletionMessageContentPartType type,

    /// The text content.
    required String text,
  }) = ChatCompletionMessageContentPartText;

  // ------------------------------------------
  // UNION: ChatCompletionMessageContentPartImage
  // ------------------------------------------

  /// Union constructor for [ChatCompletionMessageContentPartImage]
  @FreezedUnionValue('image_url')
  const factory ChatCompletionMessageContentPart.image({
    /// The type of the content part, in this case `image_url`.
    @Default(ChatCompletionMessageContentPartType.imageUrl)
    ChatCompletionMessageContentPartType type,

    /// The URL of the image.
    @JsonKey(name: 'image_url') required ChatCompletionMessageImageUrl imageUrl,
  }) = ChatCompletionMessageContentPartImage;

  /// Object construction from a JSON representation
  factory ChatCompletionMessageContentPart.fromJson(
          Map<String, dynamic> json) =>
      _$ChatCompletionMessageContentPartFromJson(json);
}

// ==========================================
// ENUM: ChatCompletionMessageContentPartEnumType
// ==========================================

enum ChatCompletionMessageContentPartEnumType {
  @JsonValue('text')
  text,
  @JsonValue('image_url')
  imageUrl,
}

// ==========================================
// CLASS: ChatCompletionMessageImageUrl
// ==========================================

/// The URL of the image.
@freezed
class ChatCompletionMessageImageUrl with _$ChatCompletionMessageImageUrl {
  const ChatCompletionMessageImageUrl._();

  /// Factory constructor for ChatCompletionMessageImageUrl
  const factory ChatCompletionMessageImageUrl({
    /// Either a URL of the image or the base64 encoded image data.
    required String url,

    /// Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision/low-or-high-fidelity-image-understanding).
    @Default(ChatCompletionMessageImageDetail.auto)
    ChatCompletionMessageImageDetail detail,
  }) = _ChatCompletionMessageImageUrl;

  /// Object construction from a JSON representation
  factory ChatCompletionMessageImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionMessageImageUrlFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['url', 'detail'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'detail': detail,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionMessageImageDetail
// ==========================================

/// Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision/low-or-high-fidelity-image-understanding).
enum ChatCompletionMessageImageDetail {
  @JsonValue('auto')
  auto,
  @JsonValue('low')
  low,
  @JsonValue('high')
  high,
}
