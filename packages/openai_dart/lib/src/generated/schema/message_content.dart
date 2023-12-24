// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContent
// ==========================================

/// The content of a message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageContent with _$MessageContent {
  const MessageContent._();

  // ------------------------------------------
  // UNION: MessageContentImageFileObject
  // ------------------------------------------

  /// References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
  const factory MessageContent.imageFile({
    /// Always `image_file`.
    required String type,

    /// The image file that is part of a message.
    @JsonKey(name: 'image_file') required MessageContentImageFile imageFile,
  }) = MessageContentImageFileObject;

  // ------------------------------------------
  // UNION: MessageContentTextObject
  // ------------------------------------------

  /// The text content that is part of a message.
  const factory MessageContent.text({
    /// Always `text`.
    required String type,

    /// The text content that is part of a message.
    required MessageContentText text,
  }) = MessageContentTextObject;

  /// Object construction from a JSON representation
  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
}
