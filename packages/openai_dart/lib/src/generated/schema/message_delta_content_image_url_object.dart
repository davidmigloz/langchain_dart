// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDeltaContentImageUrlObject
// ==========================================

/// References an image URL in the content of a message.
@freezed
class MessageDeltaContentImageUrlObject
    with _$MessageDeltaContentImageUrlObject {
  const MessageDeltaContentImageUrlObject._();

  /// Factory constructor for MessageDeltaContentImageUrlObject
  const factory MessageDeltaContentImageUrlObject({
    /// The index of the content part in the message.
    @JsonKey(includeIfNull: false) int? index,

    /// Always `image_url`.
    @JsonKey(includeIfNull: false) String? type,

    /// The image URL part of a message.
    @JsonKey(name: 'image_url', includeIfNull: false)
    MessageContentImageUrl? imageUrl,
  }) = _MessageDeltaContentImageUrlObject;

  /// Object construction from a JSON representation
  factory MessageDeltaContentImageUrlObject.fromJson(
          Map<String, dynamic> json) =>
      _$MessageDeltaContentImageUrlObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['index', 'type', 'image_url'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'type': type,
      'image_url': imageUrl,
    };
  }
}
