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
    @_ThreadAndRunModelConverter()
    @JsonKey(includeIfNull: false)
    ThreadAndRunModel? model,

    /// Override the default system message of the assistant. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) String? instructions,

    /// Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
    @JsonKey(includeIfNull: false) List<AssistantTools>? tools,

    /// A set of resources that are made available to the assistant's tools in this thread. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.
    @JsonKey(name: 'tool_resources', includeIfNull: false)
    ToolResources? toolResources,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    @JsonKey(includeIfNull: false) @Default(1.0) double? temperature,

    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    ///
    /// We generally recommend altering this or temperature but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) @Default(1.0) double? topP,

    /// The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    @JsonKey(name: 'max_prompt_tokens', includeIfNull: false)
    int? maxPromptTokens,

    /// The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete_details` for more info.
    @JsonKey(name: 'max_completion_tokens', includeIfNull: false)
    int? maxCompletionTokens,

    /// Controls for how a thread will be truncated prior to the run. Use this to control the intial context window of the run.
    @JsonKey(name: 'truncation_strategy', includeIfNull: false)
    TruncationObject? truncationStrategy,

    /// Controls which (if any) tool is called by the model.
    /// `none` means the model will not call any tools and instead generates a message.
    /// `auto` is the default value and means the model can pick between generating a message or calling one or more tools.
    /// `required` means the model must call one or more tools before responding to the user.
    /// Specifying a particular tool like `{"type": "file_search"}` or `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.
    @_CreateThreadAndRunRequestToolChoiceConverter()
    @JsonKey(name: 'tool_choice', includeIfNull: false)
    CreateThreadAndRunRequestToolChoice? toolChoice,

    /// Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models/gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
    ///
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
    ///
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
    @_CreateThreadAndRunRequestResponseFormatConverter()
    @JsonKey(name: 'response_format', includeIfNull: false)
    CreateThreadAndRunRequestResponseFormat? responseFormat,

    /// If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
    @JsonKey(includeIfNull: false) bool? stream,
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
    'tool_resources',
    'metadata',
    'temperature',
    'top_p',
    'max_prompt_tokens',
    'max_completion_tokens',
    'truncation_strategy',
    'tool_choice',
    'response_format',
    'stream'
  ];

  /// Validation constants
  static const temperatureDefaultValue = 1.0;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 2.0;
  static const topPDefaultValue = 1.0;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;
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
    if (topP != null && topP! < topPMinValue) {
      return "The value of 'topP' cannot be < $topPMinValue";
    }
    if (topP != null && topP! > topPMaxValue) {
      return "The value of 'topP' cannot be > $topPMaxValue";
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
      'thread': thread,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'tool_resources': toolResources,
      'metadata': metadata,
      'temperature': temperature,
      'top_p': topP,
      'max_prompt_tokens': maxPromptTokens,
      'max_completion_tokens': maxCompletionTokens,
      'truncation_strategy': truncationStrategy,
      'tool_choice': toolChoice,
      'response_format': responseFormat,
      'stream': stream,
    };
  }
}

// ==========================================
// ENUM: ThreadAndRunModels
// ==========================================

/// Available models. Mind that the list may not be exhaustive nor up-to-date.
enum ThreadAndRunModels {
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
  @JsonValue('gpt-4-turbo')
  gpt4Turbo,
  @JsonValue('gpt-4-turbo-2024-04-09')
  gpt4Turbo20240409,
  @JsonValue('gpt-4-turbo-preview')
  gpt4TurboPreview,
  @JsonValue('gpt-4-vision-preview')
  gpt4VisionPreview,
  @JsonValue('gpt-4o')
  gpt4o,
  @JsonValue('gpt-4o-2024-05-13')
  gpt4o20240513,
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo,
  @JsonValue('gpt-3.5-turbo-16k')
  gpt35Turbo16k,
  @JsonValue('gpt-3.5-turbo-16k-0613')
  gpt35Turbo16k0613,
  @JsonValue('gpt-3.5-turbo-0125')
  gpt35Turbo0125,
  @JsonValue('gpt-3.5-turbo-0301')
  gpt35Turbo0301,
  @JsonValue('gpt-3.5-turbo-0613')
  gpt35Turbo0613,
  @JsonValue('gpt-3.5-turbo-1106')
  gpt35Turbo1106,
}

// ==========================================
// CLASS: ThreadAndRunModel
// ==========================================

/// The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
@freezed
sealed class ThreadAndRunModel with _$ThreadAndRunModel {
  const ThreadAndRunModel._();

  /// Available models. Mind that the list may not be exhaustive nor up-to-date.
  const factory ThreadAndRunModel.model(
    ThreadAndRunModels value,
  ) = ThreadAndRunModelEnumeration;

  /// The ID of the model to use for this request.
  const factory ThreadAndRunModel.modelId(
    String value,
  ) = ThreadAndRunModelString;

  /// Object construction from a JSON representation
  factory ThreadAndRunModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadAndRunModelFromJson(json);
}

/// Custom JSON converter for [ThreadAndRunModel]
class _ThreadAndRunModelConverter
    implements JsonConverter<ThreadAndRunModel?, Object?> {
  const _ThreadAndRunModelConverter();

  @override
  ThreadAndRunModel? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String && _$ThreadAndRunModelsEnumMap.values.contains(data)) {
      return ThreadAndRunModelEnumeration(
        _$ThreadAndRunModelsEnumMap.keys.elementAt(
          _$ThreadAndRunModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ThreadAndRunModelString(data);
    }
    throw Exception(
      'Unexpected value for ThreadAndRunModel: $data',
    );
  }

  @override
  Object? toJson(ThreadAndRunModel? data) {
    return switch (data) {
      ThreadAndRunModelEnumeration(value: final v) =>
        _$ThreadAndRunModelsEnumMap[v]!,
      ThreadAndRunModelString(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: CreateThreadAndRunRequestToolChoiceMode
// ==========================================

/// `none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
enum CreateThreadAndRunRequestToolChoiceMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
  @JsonValue('required')
  required,
}

// ==========================================
// CLASS: CreateThreadAndRunRequestToolChoice
// ==========================================

/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tools and instead generates a message.
/// `auto` is the default value and means the model can pick between generating a message or calling one or more tools.
/// `required` means the model must call one or more tools before responding to the user.
/// Specifying a particular tool like `{"type": "file_search"}` or `{"type": "function", "function": {"name": "my_function"}}` forces the model to call that tool.
@freezed
sealed class CreateThreadAndRunRequestToolChoice
    with _$CreateThreadAndRunRequestToolChoice {
  const CreateThreadAndRunRequestToolChoice._();

  /// `none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
  const factory CreateThreadAndRunRequestToolChoice.mode(
    CreateThreadAndRunRequestToolChoiceMode value,
  ) = CreateThreadAndRunRequestToolChoiceEnumeration;

  /// No Description
  const factory CreateThreadAndRunRequestToolChoice.tool(
    AssistantsNamedToolChoice value,
  ) = CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice;

  /// Object construction from a JSON representation
  factory CreateThreadAndRunRequestToolChoice.fromJson(
          Map<String, dynamic> json) =>
      _$CreateThreadAndRunRequestToolChoiceFromJson(json);
}

/// Custom JSON converter for [CreateThreadAndRunRequestToolChoice]
class _CreateThreadAndRunRequestToolChoiceConverter
    implements JsonConverter<CreateThreadAndRunRequestToolChoice?, Object?> {
  const _CreateThreadAndRunRequestToolChoiceConverter();

  @override
  CreateThreadAndRunRequestToolChoice? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$CreateThreadAndRunRequestToolChoiceModeEnumMap.values
            .contains(data)) {
      return CreateThreadAndRunRequestToolChoiceEnumeration(
        _$CreateThreadAndRunRequestToolChoiceModeEnumMap.keys.elementAt(
          _$CreateThreadAndRunRequestToolChoiceModeEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice(
          AssistantsNamedToolChoice.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for CreateThreadAndRunRequestToolChoice: $data',
    );
  }

  @override
  Object? toJson(CreateThreadAndRunRequestToolChoice? data) {
    return switch (data) {
      CreateThreadAndRunRequestToolChoiceEnumeration(value: final v) =>
        _$CreateThreadAndRunRequestToolChoiceModeEnumMap[v]!,
      CreateThreadAndRunRequestToolChoiceAssistantsNamedToolChoice(
        value: final v
      ) =>
        v.toJson(),
      null => null,
    };
  }
}

// ==========================================
// ENUM: CreateThreadAndRunRequestResponseFormatMode
// ==========================================

/// `auto` is the default value
enum CreateThreadAndRunRequestResponseFormatMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: CreateThreadAndRunRequestResponseFormat
// ==========================================

/// Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models/gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
///
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
///
/// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
@freezed
sealed class CreateThreadAndRunRequestResponseFormat
    with _$CreateThreadAndRunRequestResponseFormat {
  const CreateThreadAndRunRequestResponseFormat._();

  /// `auto` is the default value
  const factory CreateThreadAndRunRequestResponseFormat.mode(
    CreateThreadAndRunRequestResponseFormatMode value,
  ) = CreateThreadAndRunRequestResponseFormatEnumeration;

  /// No Description
  const factory CreateThreadAndRunRequestResponseFormat.format(
    AssistantsResponseFormat value,
  ) = CreateThreadAndRunRequestResponseFormatAssistantsResponseFormat;

  /// Object construction from a JSON representation
  factory CreateThreadAndRunRequestResponseFormat.fromJson(
          Map<String, dynamic> json) =>
      _$CreateThreadAndRunRequestResponseFormatFromJson(json);
}

/// Custom JSON converter for [CreateThreadAndRunRequestResponseFormat]
class _CreateThreadAndRunRequestResponseFormatConverter
    implements
        JsonConverter<CreateThreadAndRunRequestResponseFormat?, Object?> {
  const _CreateThreadAndRunRequestResponseFormatConverter();

  @override
  CreateThreadAndRunRequestResponseFormat? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$CreateThreadAndRunRequestResponseFormatModeEnumMap.values
            .contains(data)) {
      return CreateThreadAndRunRequestResponseFormatEnumeration(
        _$CreateThreadAndRunRequestResponseFormatModeEnumMap.keys.elementAt(
          _$CreateThreadAndRunRequestResponseFormatModeEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return CreateThreadAndRunRequestResponseFormatAssistantsResponseFormat(
          AssistantsResponseFormat.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for CreateThreadAndRunRequestResponseFormat: $data',
    );
  }

  @override
  Object? toJson(CreateThreadAndRunRequestResponseFormat? data) {
    return switch (data) {
      CreateThreadAndRunRequestResponseFormatEnumeration(value: final v) =>
        _$CreateThreadAndRunRequestResponseFormatModeEnumMap[v]!,
      CreateThreadAndRunRequestResponseFormatAssistantsResponseFormat(
        value: final v
      ) =>
        v.toJson(),
      null => null,
    };
  }
}
