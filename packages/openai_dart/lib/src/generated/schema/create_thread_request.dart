// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateThreadRequest
// ==========================================

/// Request object for the Create thread endpoint.
@freezed
abstract class CreateThreadRequest with _$CreateThreadRequest {
  const CreateThreadRequest._();

  /// Factory constructor for CreateThreadRequest
  const factory CreateThreadRequest({
    /// A list of [messages](https://platform.openai.com/docs/api-reference/messages) to start the thread with.
    @JsonKey(includeIfNull: false) List<CreateMessageRequest>? messages,

    /// A set of resources that are made available to the assistant's tools in this thread. The resources are specific
    /// to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the
    /// `file_search` tool requires a list of vector store IDs.
    @JsonKey(name: 'tool_resources', includeIfNull: false)
    ToolResources? toolResources,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maximum of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CreateThreadRequest;

  /// Object construction from a JSON representation
  factory CreateThreadRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateThreadRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'messages',
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
      'messages': messages,
      'tool_resources': toolResources,
      'metadata': metadata,
    };
  }
}
