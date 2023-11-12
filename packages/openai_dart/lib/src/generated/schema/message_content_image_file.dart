// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContentImageFile
// ==========================================

/// The image file that is part of a message.
@freezed
class MessageContentImageFile with _$MessageContentImageFile {
  const MessageContentImageFile._();

  /// Factory constructor for MessageContentImageFile
  const factory MessageContentImageFile({
    /// The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _MessageContentImageFile;

  /// Object construction from a JSON representation
  factory MessageContentImageFile.fromJson(Map<String, dynamic> json) =>
      _$MessageContentImageFileFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
    };
  }
}
