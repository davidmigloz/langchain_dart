// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageRequestContentTextObject
// ==========================================

/// The text content that is part of a message.
@freezed
class MessageRequestContentTextObject with _$MessageRequestContentTextObject {
  const MessageRequestContentTextObject._();

  /// Factory constructor for MessageRequestContentTextObject
  const factory MessageRequestContentTextObject({
    /// Always `text`.
    required String type,

    /// Text content to be sent to the model
    required String text,
  }) = _MessageRequestContentTextObject;

  /// Object construction from a JSON representation
  factory MessageRequestContentTextObject.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestContentTextObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
    };
  }
}
