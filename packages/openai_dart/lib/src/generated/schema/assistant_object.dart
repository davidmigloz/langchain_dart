// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantObject
// ==========================================

/// Represents an `assistant` that can call the model and use tools.
@freezed
class AssistantObject with _$AssistantObject {
  const AssistantObject._();

  /// Factory constructor for AssistantObject
  const factory AssistantObject({
    /// The identifier, which can be referenced in API endpoints.
    required String id,

    /// The object type, which is always `assistant`.
    required AssistantObjectObject object,

    /// The Unix timestamp (in seconds) for when the assistant was created.
    @JsonKey(name: 'created_at') required int createdAt,

    /// The name of the assistant. The maximum length is 256 characters.
    required String? name,

    /// The description of the assistant. The maximum length is 512 characters.
    required String? description,

    /// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
    required String model,

    /// The system instructions that the assistant uses. The maximum length is 32768 characters.
    required String? instructions,

    /// A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `retrieval`, or `function`.
    required List<AssistantTools> tools,

    /// A list of [file](https://platform.openai.com/docs/api-reference/files) IDs attached to this assistant. There can be a maximum of 20 files attached to the assistant. Files are ordered by their creation date in ascending order.
    @JsonKey(name: 'file_ids') required List<String> fileIds,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    required Map<String, dynamic>? metadata,
  }) = _AssistantObject;

  /// Object construction from a JSON representation
  factory AssistantObject.fromJson(Map<String, dynamic> json) =>
      _$AssistantObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'created_at',
    'name',
    'description',
    'model',
    'instructions',
    'tools',
    'file_ids',
    'metadata'
  ];

  /// Validation constants
  static const nameMaxLengthValue = 256;
  static const descriptionMaxLengthValue = 512;
  static const instructionsMaxLengthValue = 32768;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (name != null && name!.length > nameMaxLengthValue) {
      return "The length of 'name' cannot be > $nameMaxLengthValue characters";
    }
    if (description != null &&
        description!.length > descriptionMaxLengthValue) {
      return "The length of 'description' cannot be > $descriptionMaxLengthValue characters";
    }
    if (instructions != null &&
        instructions!.length > instructionsMaxLengthValue) {
      return "The length of 'instructions' cannot be > $instructionsMaxLengthValue characters";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created_at': createdAt,
      'name': name,
      'description': description,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'file_ids': fileIds,
      'metadata': metadata,
    };
  }
}

// ==========================================
// ENUM: AssistantObjectObject
// ==========================================

/// The object type, which is always `assistant`.
enum AssistantObjectObject {
  @JsonValue('assistant')
  assistant,
}
