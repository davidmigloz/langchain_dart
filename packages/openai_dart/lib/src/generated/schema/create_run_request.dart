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
    @_CreateRunRequestModelConverter()
    @JsonKey(includeIfNull: false)
    CreateRunRequestModel? model,

    /// Overrides the [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant) of the assistant. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) String? instructions,

    /// Appends additional instructions at the end of the instructions for the run. This is useful for modifying the behavior on a per-run basis without overriding other instructions.
    @JsonKey(name: 'additional_instructions', includeIfNull: false)
    String? additionalInstructions,

    /// Adds additional messages to the thread before creating the run.
    @JsonKey(name: 'additional_messages', includeIfNull: false)
    List<CreateMessageRequest>? additionalMessages,

    /// Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) List<AssistantTools>? tools,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    @JsonKey(includeIfNull: false) @Default(1.0) double? temperature,

    /// The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `complete`. See `incomplete_details` for more info.
    @JsonKey(name: 'max_prompt_tokens', includeIfNull: false)
    int? maxPromptTokens,

    /// The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `complete`. See `incomplete_details` for more info.
    @JsonKey(name: 'max_completion_tokens', includeIfNull: false)
    int? maxCompletionTokens,

    /// Thread truncation controls
    @JsonKey(name: 'truncation_strategy', includeIfNull: false)
    TruncationObject? truncationStrategy,

    /// If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
    @JsonKey(includeIfNull: false) bool? stream,
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
    'additional_messages',
    'tools',
    'metadata',
    'temperature',
    'max_prompt_tokens',
    'max_completion_tokens',
    'truncation_strategy',
    'stream'
  ];

  /// Validation constants
  static const temperatureDefaultValue = 1.0;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 2.0;
  static const maxPromptTokensMinValue = 256;
  static const maxCompletionTokensMinValue = 256;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (temperature != null && temperature! < temperatureMinValue) {
      return "The value of 'temperature' cannot be < $temperatureMinValue";
    }
    if (temperature != null && temperature! > temperatureMaxValue) {
      return "The value of 'temperature' cannot be > $temperatureMaxValue";
    }
    if (maxPromptTokens != null && maxPromptTokens! < maxPromptTokensMinValue) {
      return "The value of 'maxPromptTokens' cannot be < $maxPromptTokensMinValue";
    }
    if (maxCompletionTokens != null &&
        maxCompletionTokens! < maxCompletionTokensMinValue) {
      return "The value of 'maxCompletionTokens' cannot be < $maxCompletionTokensMinValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'assistant_id': assistantId,
      'model': model,
      'instructions': instructions,
      'additional_instructions': additionalInstructions,
      'additional_messages': additionalMessages,
      'tools': tools,
      'metadata': metadata,
      'temperature': temperature,
      'max_prompt_tokens': maxPromptTokens,
      'max_completion_tokens': maxCompletionTokens,
      'truncation_strategy': truncationStrategy,
      'stream': stream,
    };
  }
}

// ==========================================
// ENUM: RunModels
// ==========================================

/// Available models. Mind that the list may not be exhaustive nor up-to-date.
enum RunModels {
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
// CLASS: CreateRunRequestModel
// ==========================================

/// The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
@freezed
sealed class CreateRunRequestModel with _$CreateRunRequestModel {
  const CreateRunRequestModel._();

  /// Available models. Mind that the list may not be exhaustive nor up-to-date.
  const factory CreateRunRequestModel.enumeration(
    RunModels value,
  ) = CreateRunRequestModelEnumeration;

  /// The ID of the model to use for this request.
  const factory CreateRunRequestModel.string(
    String value,
  ) = CreateRunRequestModelString;

  /// Object construction from a JSON representation
  factory CreateRunRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateRunRequestModelFromJson(json);
}

/// Custom JSON converter for [CreateRunRequestModel]
class _CreateRunRequestModelConverter
    implements JsonConverter<CreateRunRequestModel?, Object?> {
  const _CreateRunRequestModelConverter();

  @override
  CreateRunRequestModel? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String && _$RunModelsEnumMap.values.contains(data)) {
      return CreateRunRequestModelEnumeration(
        _$RunModelsEnumMap.keys.elementAt(
          _$RunModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return CreateRunRequestModelString(data);
    }
    throw Exception(
      'Unexpected value for CreateRunRequestModel: $data',
    );
  }

  @override
  Object? toJson(CreateRunRequestModel? data) {
    return switch (data) {
      CreateRunRequestModelEnumeration(value: final v) =>
        _$RunModelsEnumMap[v]!,
      CreateRunRequestModelString(value: final v) => v,
      null => null,
    };
  }
}
