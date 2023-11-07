// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target, unused_import
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionMessage
// ==========================================

/// A chat completion message generated by the model.
@freezed
class ChatCompletionMessage with _$ChatCompletionMessage {
  const ChatCompletionMessage._();

  /// Factory constructor for ChatCompletionMessage
  const factory ChatCompletionMessage({
    /// The role of the messages author. One of `system`, `user`, `assistant`, or `tool` (`function` is deprecated).
    required ChatCompletionMessageRole role,

    /// The contents of the message. `content` is required for all messages, and may be null for assistant messages with function calls.
    required String? content,

    /// No Description
    @JsonKey(name: 'tool_calls', includeIfNull: false)
    ChatCompletionMessageToolCalls? toolCalls,

    /// Deprecated and replaced by `tool_calls`. The name and arguments of a function that should be called, as generated by the model.
    @JsonKey(name: 'function_call', includeIfNull: false)
    ChatCompletionMessageFunctionCall? functionCall,

    /// Tool call that this message is responding to.
    @JsonKey(name: 'tool_call_id', includeIfNull: false) String? toolCallId,

    /// The name of the author of this message. `name` is required if role is `function`, and it should be the name of the function whose response is in the `content`. May contain a-z, A-Z, 0-9, and underscores, with a maximum length of 64 characters.
    @JsonKey(includeIfNull: false) String? name,
  }) = _ChatCompletionMessage;

  /// Object construction from a JSON representation
  factory ChatCompletionMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionMessageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'role',
    'content',
    'tool_calls',
    'function_call',
    'tool_call_id',
    'name'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'content': content,
      'tool_calls': toolCalls,
      'function_call': functionCall,
      'tool_call_id': toolCallId,
      'name': name,
    };
  }
}
