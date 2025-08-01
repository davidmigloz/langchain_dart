// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Message
// ==========================================

/// A message in the chat endpoint
@freezed
class Message with _$Message {
  const Message._();

  /// Factory constructor for Message
  const factory Message({
    /// The role of the message
    required MessageRole role,

    /// The content of the message
    required String content,

    /// Contains the text that was inside thinking tags in the original model output when `think` is enabled.
    @JsonKey(includeIfNull: false) String? thinking,

    /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
    @JsonKey(includeIfNull: false) List<String>? images,

    /// A list of tools the model wants to call.
    @JsonKey(name: 'tool_calls', includeIfNull: false)
    List<ToolCall>? toolCalls,
  }) = _Message;

  /// Object construction from a JSON representation
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'role',
    'content',
    'thinking',
    'images',
    'tool_calls'
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
      'thinking': thinking,
      'images': images,
      'tool_calls': toolCalls,
    };
  }
}

// ==========================================
// ENUM: MessageRole
// ==========================================

/// The role of the message
enum MessageRole {
  @JsonValue('system')
  system,
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
  @JsonValue('tool')
  tool,
}
