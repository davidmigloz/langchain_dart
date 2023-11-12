// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageObject
// ==========================================

/// Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
@freezed
class MessageObject with _$MessageObject {
  const MessageObject._();

  /// Factory constructor for MessageObject
  const factory MessageObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.message`.
    required MessageObjectObject object,

    /// The Unix timestamp (in seconds) for when the message was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
    @JsonKey(name: 'thread_id') required String threadId,

    /// The entity that produced the message. One of `user` or `assistant`.
    required MessageObjectRole role,

    /// The content of the message in array of text and/or images.
    required List<MessageContent> content,

    /// If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
    @JsonKey(name: 'assistant_id') required String? assistantId,

    /// If applicable, the ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the authoring of this message.
    @JsonKey(name: 'run_id') required String? runId,

    /// A list of [file](https://platform.openai.com/docs/api-reference/files) IDs that the assistant should use. Useful for tools like retrieval and code_interpreter that can access files. A maximum of 10 files can be attached to a message.
    @JsonKey(name: 'file_ids') required List<String> fileIds,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    required Map<String, dynamic>? metadata,
  }) = _MessageObject;

  /// Object construction from a JSON representation
  factory MessageObject.fromJson(Map<String, dynamic> json) =>
      _$MessageObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'thread_id',
    'role',
    'content',
    'assistant_id',
    'run_id',
    'file_ids',
    'metadata'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created_at': createdAt,
      'thread_id': threadId,
      'role': role,
      'content': content,
      'assistant_id': assistantId,
      'run_id': runId,
      'file_ids': fileIds,
      'metadata': metadata,
    };
  }
}

// ==========================================
// ENUM: MessageObjectObject
// ==========================================

/// The object type, which is always `thread.message`.
enum MessageObjectObject {
  @JsonValue('thread.message')
  threadMessage,
}

// ==========================================
// ENUM: MessageObjectRole
// ==========================================

/// The entity that produced the message. One of `user` or `assistant`.
enum MessageObjectRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}
