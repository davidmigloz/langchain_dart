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
    @_AssistantModelConverter() required AssistantModel model,

    /// The name of the assistant. The maximum length is 256 characters.
    @JsonKey(includeIfNull: false) String? name,

    /// The description of the assistant. The maximum length is 512 characters.
    @JsonKey(includeIfNull: false) String? description,

    /// The system instructions that the assistant uses. The maximum length is 256,000 characters.
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
  static const instructionsMaxLengthValue = 256000;

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
// ENUM: AssistantModels
// ==========================================

/// Available assistant models. Mind that the list may not be exhaustive nor up-to-date.
enum AssistantModels {
  @JsonValue('gpt-4')
  gpt4,
  @JsonValue('gpt-4-32k')
  gpt432k,
  @JsonValue('gpt-4-32k-0314')
  gpt432k0314,
  @JsonValue('gpt-4-32k-0613')
  gpt432k0613,
  @JsonValue('gpt-4-0125-preview')
  gpt40125Preview,
  @JsonValue('gpt-4-0314')
  gpt40314,
  @JsonValue('gpt-4-0613')
  gpt40613,
  @JsonValue('gpt-4-1106-preview')
  gpt41106Preview,
  @JsonValue('gpt-4-vision-preview')
  gpt4VisionPreview,
  @JsonValue('gpt-4-turbo')
  gpt4Turbo,
  @JsonValue('gpt-4-turbo-2024-04-09')
  gpt4Turbo20240409,
  @JsonValue('gpt-4-turbo-preview')
  gpt4TurboPreview,
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo,
  @JsonValue('gpt-3.5-turbo-16k')
  gpt35Turbo16k,
  @JsonValue('gpt-3.5-turbo-16k-0613')
  gpt35Turbo16k0613,
  @JsonValue('gpt-3.5-turbo-0125')
  gpt35Turbo0125,
  @JsonValue('gpt-3.5-turbo-0613')
  gpt35Turbo0613,
  @JsonValue('gpt-3.5-turbo-1106')
  gpt35Turbo1106,
}

// ==========================================
// CLASS: AssistantModel
// ==========================================

/// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
@freezed
sealed class AssistantModel with _$AssistantModel {
  const AssistantModel._();

  /// Available assistant models. Mind that the list may not be exhaustive nor up-to-date.
  const factory AssistantModel.model(
    AssistantModels value,
  ) = AssistantModelEnumeration;

  /// The ID of the model to use.
  const factory AssistantModel.modelId(
    String value,
  ) = AssistantModelString;

  /// Object construction from a JSON representation
  factory AssistantModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantModelFromJson(json);
}

/// Custom JSON converter for [AssistantModel]
class _AssistantModelConverter
    implements JsonConverter<AssistantModel, Object?> {
  const _AssistantModelConverter();

  @override
  AssistantModel fromJson(Object? data) {
    if (data is String && _$AssistantModelsEnumMap.values.contains(data)) {
      return AssistantModelEnumeration(
        _$AssistantModelsEnumMap.keys.elementAt(
          _$AssistantModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return AssistantModelString(data);
    }
    throw Exception(
      'Unexpected value for AssistantModel: $data',
    );
  }

  @override
  Object? toJson(AssistantModel data) {
    return switch (data) {
      AssistantModelEnumeration(value: final v) => _$AssistantModelsEnumMap[v]!,
      AssistantModelString(value: final v) => v,
    };
  }
}
