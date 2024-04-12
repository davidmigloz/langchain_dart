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

    /// The status of the message, which can be either `in_progress`, `incomplete`, or `completed`.
    @JsonKey(
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    required MessageObjectStatus? status,

    /// On an incomplete message, details about why the message is incomplete.
    @JsonKey(name: 'incomplete_details')
    required MessageObjectIncompleteDetails? incompleteDetails,

    /// The Unix timestamp (in seconds) for when the message was completed.
    @JsonKey(name: 'completed_at') required int? completedAt,

    /// The Unix timestamp (in seconds) for when the message was marked as incomplete.
    @JsonKey(name: 'incomplete_at') required int? incompleteAt,

    /// The entity that produced the message. One of `user` or `assistant`.
    required MessageRole role,

    /// The content of the message in array of text and/or images.
    required List<MessageContent> content,

    /// If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
    @JsonKey(name: 'assistant_id') required String? assistantId,

    /// The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
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
    'status',
    'incomplete_details',
    'completed_at',
    'incomplete_at',
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
      'status': status,
      'incomplete_details': incompleteDetails,
      'completed_at': completedAt,
      'incomplete_at': incompleteAt,
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
// ENUM: MessageObjectStatus
// ==========================================

/// The status of the message, which can be either `in_progress`, `incomplete`, or `completed`.
enum MessageObjectStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('incomplete')
  incomplete,
  @JsonValue('completed')
  completed,
}

// ==========================================
// CLASS: MessageObjectIncompleteDetails
// ==========================================

/// On an incomplete message, details about why the message is incomplete.
@freezed
class MessageObjectIncompleteDetails with _$MessageObjectIncompleteDetails {
  const MessageObjectIncompleteDetails._();

  /// Factory constructor for MessageObjectIncompleteDetails
  const factory MessageObjectIncompleteDetails({
    /// The reason the message is incomplete.
    required MessageObjectIncompleteDetailsReason reason,
  }) = _MessageObjectIncompleteDetails;

  /// Object construction from a JSON representation
  factory MessageObjectIncompleteDetails.fromJson(Map<String, dynamic> json) =>
      _$MessageObjectIncompleteDetailsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['reason'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
    };
  }
}

// ==========================================
// ENUM: MessageObjectIncompleteDetailsReason
// ==========================================

/// The reason the message is incomplete.
enum MessageObjectIncompleteDetailsReason {
  @JsonValue('content_filter')
  contentFilter,
  @JsonValue('max_tokens')
  maxTokens,
  @JsonValue('run_cancelled')
  runCancelled,
  @JsonValue('run_expired')
  runExpired,
  @JsonValue('run_failed')
  runFailed,
}
