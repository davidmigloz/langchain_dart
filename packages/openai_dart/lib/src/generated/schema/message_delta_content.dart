// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDeltaContent
// ==========================================

/// The content of a message delta.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageDeltaContent with _$MessageDeltaContent {
  const MessageDeltaContent._();

  // ------------------------------------------
  // UNION: MessageDeltaContentImageFileObject
  // ------------------------------------------

  /// References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
  const factory MessageDeltaContent.imageFile({
    /// The index of the content part in the message.
    required int index,

    /// Always `image_file`.
    required String type,

    /// The image file that is part of a message.
    @JsonKey(name: 'image_file', includeIfNull: false)
    MessageContentImageFile? imageFile,
  }) = MessageDeltaContentImageFileObject;

  // ------------------------------------------
  // UNION: MessageDeltaContentTextObject
  // ------------------------------------------

  /// The text content that is part of a message.
  const factory MessageDeltaContent.text({
    /// The index of the content part in the message.
    required int index,

    /// Always `text`.
    required String type,

    /// The text content that is part of a message.
    @JsonKey(includeIfNull: false) MessageDeltaContentText? text,
  }) = MessageDeltaContentTextObject;

  /// Object construction from a JSON representation
  factory MessageDeltaContent.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaContentFromJson(json);
}
