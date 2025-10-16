// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContentImageUrl
// ==========================================

/// The image URL part of a message.
@freezed
abstract class MessageContentImageUrl with _$MessageContentImageUrl {
  const MessageContentImageUrl._();

  /// Factory constructor for MessageContentImageUrl
  const factory MessageContentImageUrl({
    /// The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
    required String url,

    /// Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
    @Default(MessageContentImageDetail.auto) MessageContentImageDetail detail,
  }) = _MessageContentImageUrl;

  /// Object construction from a JSON representation
  factory MessageContentImageUrl.fromJson(Map<String, dynamic> json) =>
      _$MessageContentImageUrlFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['url', 'detail'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'url': url, 'detail': detail};
  }
}
