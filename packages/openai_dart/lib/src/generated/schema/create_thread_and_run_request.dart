// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateThreadAndRunRequest
// ==========================================

/// Request object for the Create thread and run endpoint.
@freezed
class CreateThreadAndRunRequest with _$CreateThreadAndRunRequest {
  const CreateThreadAndRunRequest._();

  /// Factory constructor for CreateThreadAndRunRequest
  const factory CreateThreadAndRunRequest({
    /// The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.
    @JsonKey(name: 'assistant_id') required String assistantId,

    /// If no thread is provided, an empty thread will be created.
    @JsonKey(includeIfNull: false) CreateThreadRequest? thread,

    /// The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
    @JsonKey(includeIfNull: false) String? model,

    /// Override the default system message of the assistant. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) String? instructions,

    /// Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) List<AssistantTools>? tools,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CreateThreadAndRunRequest;

  /// Object construction from a JSON representation
  factory CreateThreadAndRunRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateThreadAndRunRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'assistant_id',
    'thread',
    'model',
    'instructions',
    'tools',
    'metadata'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'assistant_id': assistantId,
      'thread': thread,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'metadata': metadata,
    };
  }
}
