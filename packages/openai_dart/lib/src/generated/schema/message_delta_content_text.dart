// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDeltaContentText
// ==========================================

/// The text content that is part of a message.
@freezed
class MessageDeltaContentText with _$MessageDeltaContentText {
  const MessageDeltaContentText._();

  /// Factory constructor for MessageDeltaContentText
  const factory MessageDeltaContentText({
    /// The data that makes up the text.
    @JsonKey(includeIfNull: false) String? value,

    /// A list of annotations that point to specific quotes from specific files.
    @JsonKey(includeIfNull: false)
    List<MessageDeltaContentTextAnnotations>? annotations,
  }) = _MessageDeltaContentText;

  /// Object construction from a JSON representation
  factory MessageDeltaContentText.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaContentTextFromJson(json);

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
