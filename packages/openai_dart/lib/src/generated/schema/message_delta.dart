// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageDelta
// ==========================================

/// The delta containing the fields that have changed on the Message.
@freezed
abstract class MessageDelta with _$MessageDelta {
  const MessageDelta._();

  /// Factory constructor for MessageDelta
  const factory MessageDelta({
    /// The entity that produced the message. One of `user` or `assistant`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    MessageRole? role,

    /// The content of the message in array of text and/or images.
    @JsonKey(includeIfNull: false) List<MessageDeltaContent>? content,
  }) = _MessageDelta;

  /// Object construction from a JSON representation
  factory MessageDelta.fromJson(Map<String, dynamic> json) =>
      _$MessageDeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['role', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'role': role, 'content': content};
  }
}
