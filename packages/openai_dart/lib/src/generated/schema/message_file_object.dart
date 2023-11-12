// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: MessageFileObject
// ==========================================

/// A list of files attached to a `message`.
@freezed
class MessageFileObject with _$MessageFileObject {
  const MessageFileObject._();

  /// Factory constructor for MessageFileObject
  const factory MessageFileObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread.message.file`.
    required MessageFileObjectObject object,

    /// The Unix timestamp (in seconds) for when the message file was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The ID of the [message](https://platform.openai.com/docs/api-reference/messages) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
    @JsonKey(name: 'message_id') required String messageId,
  }) = _MessageFileObject;

  /// Object construction from a JSON representation
  factory MessageFileObject.fromJson(Map<String, dynamic> json) =>
      _$MessageFileObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'message_id'
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
      'message_id': messageId,
    };
  }
}

// ==========================================
// ENUM: MessageFileObjectObject
// ==========================================

/// The object type, which is always `thread.message.file`.
enum MessageFileObjectObject {
  @JsonValue('thread.message.file')
  threadMessageFile,
}
