// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageRequestContent
// ==========================================

/// The content of a message in a request.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageRequestContent with _$MessageRequestContent {
  const MessageRequestContent._();

  // ------------------------------------------
  // UNION: MessageRequestContentImageFileObject
  // ------------------------------------------

  /// References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message request.

  @FreezedUnionValue('image_file')
  const factory MessageRequestContent.imageFile({
    /// Always `image_file`.
    @Default('image_file') String type,

    /// The image file that is part of a message.
    @JsonKey(name: 'image_file') required MessageContentImageFile imageFile,
  }) = MessageRequestContentImageFileObject;

  // ------------------------------------------
  // UNION: MessageRequestContentImageUrlObject
  // ------------------------------------------

  /// References an image URL in the content of a message request.

  @FreezedUnionValue('image_url')
  const factory MessageRequestContent.imageUrl({
    /// The type of the content part. Always `image_url`.
    @Default('image_url') String type,

    /// The image URL part of a message.
    @JsonKey(name: 'image_url') required MessageContentImageUrl imageUrl,
  }) = MessageRequestContentImageUrlObject;

  // ------------------------------------------
  // UNION: MessageRequestContentTextObject
  // ------------------------------------------

  /// The text content that is part of a message.

  const factory MessageRequestContent.text({
    /// Always `text`.
    required String type,

    /// Text content to be sent to the model
    required String text,
  }) = MessageRequestContentTextObject;

  /// Object construction from a JSON representation
  factory MessageRequestContent.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestContentFromJson(json);
}

// ==========================================
// ENUM: MessageRequestContentEnumType
// ==========================================

enum MessageRequestContentEnumType {
  @JsonValue('image_file')
  imageFile,
  @JsonValue('image_url')
  imageUrl,
}
