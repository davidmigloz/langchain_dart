// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageContentText
// ==========================================

/// The text content that is part of a message.
@freezed
class MessageContentText with _$MessageContentText {
  const MessageContentText._();

  /// Factory constructor for MessageContentText
  const factory MessageContentText({
    /// The data that makes up the text.
    required String value,

    /// A list of annotations that point to specific quotes from specific files.
    required List<MessageContentTextAnnotations> annotations,
  }) = _MessageContentText;

  /// Object construction from a JSON representation
  factory MessageContentText.fromJson(Map<String, dynamic> json) =>
      _$MessageContentTextFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['value', 'annotations'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'annotations': annotations,
    };
  }
}
