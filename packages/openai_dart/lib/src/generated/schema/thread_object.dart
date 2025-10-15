// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ThreadObject
// ==========================================

/// Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
@freezed
abstract class ThreadObject with _$ThreadObject {
  const ThreadObject._();

  /// Factory constructor for ThreadObject
  const factory ThreadObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `thread`.
    required ThreadObjectObject object,

    /// The Unix timestamp (in seconds) for when the thread was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// A set of resources that are made available to the assistant's tools in this thread. The resources are specific
    /// to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the
    /// `file_search` tool requires a list of vector store IDs.
    @JsonKey(name: 'tool_resources') required ToolResources? toolResources,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maximum of 512 characters long.
    required Map<String, dynamic>? metadata,
  }) = _ThreadObject;

  /// Object construction from a JSON representation
  factory ThreadObject.fromJson(Map<String, dynamic> json) =>
      _$ThreadObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'tool_resources',
    'metadata',
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
      'tool_resources': toolResources,
      'metadata': metadata,
    };
  }
}

// ==========================================
// ENUM: ThreadObjectObject
// ==========================================

/// The object type, which is always `thread`.
enum ThreadObjectObject {
  @JsonValue('thread')
  thread,
}
