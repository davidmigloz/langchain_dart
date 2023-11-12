// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateAssistantRequest
// ==========================================

/// Request object for the Create assistant endpoint.
@freezed
class CreateAssistantRequest with _$CreateAssistantRequest {
  const CreateAssistantRequest._();

  /// Factory constructor for CreateAssistantRequest
  const factory CreateAssistantRequest({
    /// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
    @_CreateAssistantRequestModelConverter()
    required CreateAssistantRequestModel model,

    /// The name of the assistant. The maximum length is 256 characters.
    @JsonKey(includeIfNull: false) String? name,

    /// The description of the assistant. The maximum length is 512 characters.
    @JsonKey(includeIfNull: false) String? description,

    /// The system instructions that the assistant uses. The maximum length is 32768 characters.
    @JsonKey(includeIfNull: false) String? instructions,

    /// A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `retrieval`, or `function`.
    @Default([]) List<AssistantTools> tools,

    /// A list of [file](https://platform.openai.com/docs/api-reference/files) IDs attached to this assistant. There can be a maximum of 20 files attached to the assistant. Files are ordered by their creation date in ascending order.
    @JsonKey(name: 'file_ids') @Default([]) List<String> fileIds,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,
  }) = _CreateAssistantRequest;

  /// Object construction from a JSON representation
  factory CreateAssistantRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssistantRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'name',
    'description',
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
      'model': model,
      'name': name,
      'description': description,
      'instructions': instructions,
      'tools': tools,
      'file_ids': fileIds,
      'metadata': metadata,
    };
  }
}

// ==========================================
// CLASS: CreateAssistantRequestModel
// ==========================================

/// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
@freezed
sealed class CreateAssistantRequestModel with _$CreateAssistantRequestModel {
  const CreateAssistantRequestModel._();

  /// The ID of the model to use.
  const factory CreateAssistantRequestModel.string(
    String value,
  ) = CreateAssistantRequestModelString;

  /// Object construction from a JSON representation
  factory CreateAssistantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAssistantRequestModelFromJson(json);
}

/// Custom JSON converter for [CreateAssistantRequestModel]
class _CreateAssistantRequestModelConverter
    implements JsonConverter<CreateAssistantRequestModel, Object?> {
  const _CreateAssistantRequestModelConverter();

  @override
  CreateAssistantRequestModel fromJson(Object? data) {
    if (data is String) {
      return CreateAssistantRequestModelString(data);
    }
    throw Exception(
      'Unexpected value for CreateAssistantRequestModel: $data',
    );
  }

  @override
  Object? toJson(CreateAssistantRequestModel data) {
    return switch (data) {
      CreateAssistantRequestModelString(value: final v) => v,
    };
  }
}
