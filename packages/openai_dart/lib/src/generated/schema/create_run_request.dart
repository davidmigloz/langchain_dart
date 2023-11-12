// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateRunRequest
// ==========================================

/// Request object for the Create run endpoint.
@freezed
class CreateRunRequest with _$CreateRunRequest {
  const CreateRunRequest._();

  /// Factory constructor for CreateRunRequest
  const factory CreateRunRequest({
    /// The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.
    @JsonKey(name: 'assistant_id') required String assistantId,

    /// The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
    @JsonKey(includeIfNull: false) String? model,

    /// Overrides the [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant) of the assistant. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) String? instructions,

    /// Appends additional instructions at the end of the instructions for the run. This is useful for modifying the behavior on a per-run basis without overriding other instructions.
    @JsonKey(name: 'additional_instructions', includeIfNull: false)
    String? additionalInstructions,

    /// Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) List<AssistantTools>? tools,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CreateRunRequest;

  /// Object construction from a JSON representation
  factory CreateRunRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRunRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'assistant_id',
    'model',
    'instructions',
    'additional_instructions',
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
      'model': model,
      'instructions': instructions,
      'additional_instructions': additionalInstructions,
      'tools': tools,
      'metadata': metadata,
    };
  }
}
