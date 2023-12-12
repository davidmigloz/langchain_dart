// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ChatCompletionMessage
// ==========================================

/// A message in a chat conversation.
@freezed
class ChatCompletionMessage with _$ChatCompletionMessage {
  const ChatCompletionMessage._();

  /// Factory constructor for ChatCompletionMessage
  const factory ChatCompletionMessage({
    /// The role of the message.
    required ChatCompletionMessageRole role,

    /// The message content.
    required String content,
  }) = _ChatCompletionMessage;

  /// Object construction from a JSON representation
  factory ChatCompletionMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionMessageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['role', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }
}
