// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ModifyAssistantRequest
// ==========================================

/// Request object for the Modify assistant endpoint.
@freezed
class ModifyAssistantRequest with _$ModifyAssistantRequest {
  const ModifyAssistantRequest._();

  /// Factory constructor for ModifyAssistantRequest
  const factory ModifyAssistantRequest({
    /// ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models/overview) for descriptions of them.
    @JsonKey(includeIfNull: false) String? model,

    /// The name of the assistant. The maximum length is 256 characters.
    @JsonKey(includeIfNull: false) String? name,

    /// The description of the assistant. The maximum length is 512 characters.
    @JsonKey(includeIfNull: false) String? description,

    /// The system instructions that the assistant uses. The maximum length is 256,000 characters.
    @JsonKey(includeIfNull: false) String? instructions,

    /// A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code_interpreter`, `file_search`, or `function`.
    @Default([]) List<AssistantTools> tools,

    /// A list of [File](https://platform.openai.com/docs/api-reference/files) IDs attached to this assistant. There can be a maximum of 20 files attached to the assistant. Files are ordered by their creation date in ascending order. If a file was previosuly attached to the list but does not show up in the list, it will be deleted from the assistant.
    @JsonKey(name: 'file_ids') @Default([]) List<String> fileIds,

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

    /// Specifies the format that the model must output. Compatible with [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer than `gpt-3.5-turbo-1106`.
    ///
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
    ///
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
    @_ModifyAssistantRequestResponseFormatConverter()
    @JsonKey(name: 'response_format', includeIfNull: false)
    ModifyAssistantRequestResponseFormat? responseFormat,
  }) = _ModifyAssistantRequest;

  /// Object construction from a JSON representation
  factory ModifyAssistantRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyAssistantRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'name',
    'description',
    'instructions',
    'tools',
    'file_ids',
    'tool_resources',
    'metadata',
    'temperature',
    'top_p',
    'response_format'
  ];

  /// Validation constants
  static const nameMaxLengthValue = 256;
  static const descriptionMaxLengthValue = 512;
  static const instructionsMaxLengthValue = 256000;
  static const temperatureDefaultValue = 1.0;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 2.0;
  static const topPDefaultValue = 1.0;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;

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
      'tool_resources': toolResources,
      'metadata': metadata,
      'temperature': temperature,
      'top_p': topP,
      'response_format': responseFormat,
    };
  }
}

// ==========================================
// ENUM: ModifyAssistantResponseFormatMode
// ==========================================

/// `auto` is the default value
enum ModifyAssistantResponseFormatMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: ModifyAssistantRequestResponseFormat
// ==========================================

/// Specifies the format that the model must output. Compatible with [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer than `gpt-3.5-turbo-1106`.
///
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates is valid JSON.
///
/// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded `max_tokens` or the conversation exceeded the max context length.
@freezed
sealed class ModifyAssistantRequestResponseFormat
    with _$ModifyAssistantRequestResponseFormat {
  const ModifyAssistantRequestResponseFormat._();

  /// `auto` is the default value
  const factory ModifyAssistantRequestResponseFormat.mode(
    ModifyAssistantResponseFormatMode value,
  ) = ModifyAssistantRequestResponseFormatEnumeration;

  /// No Description
  const factory ModifyAssistantRequestResponseFormat.format(
    AssistantsResponseFormat value,
  ) = ModifyAssistantRequestResponseFormatAssistantsResponseFormat;

  /// Object construction from a JSON representation
  factory ModifyAssistantRequestResponseFormat.fromJson(
          Map<String, dynamic> json) =>
      _$ModifyAssistantRequestResponseFormatFromJson(json);
}

/// Custom JSON converter for [ModifyAssistantRequestResponseFormat]
class _ModifyAssistantRequestResponseFormatConverter
    implements JsonConverter<ModifyAssistantRequestResponseFormat?, Object?> {
  const _ModifyAssistantRequestResponseFormatConverter();

  @override
  ModifyAssistantRequestResponseFormat? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ModifyAssistantResponseFormatModeEnumMap.values.contains(data)) {
      return ModifyAssistantRequestResponseFormatEnumeration(
        _$ModifyAssistantResponseFormatModeEnumMap.keys.elementAt(
          _$ModifyAssistantResponseFormatModeEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return ModifyAssistantRequestResponseFormatAssistantsResponseFormat(
          AssistantsResponseFormat.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for ModifyAssistantRequestResponseFormat: $data',
    );
  }

  @override
  Object? toJson(ModifyAssistantRequestResponseFormat? data) {
    return switch (data) {
      ModifyAssistantRequestResponseFormatEnumeration(value: final v) =>
        _$ModifyAssistantResponseFormatModeEnumMap[v]!,
      ModifyAssistantRequestResponseFormatAssistantsResponseFormat(
        value: final v
      ) =>
        v.toJson(),
      null => null,
    };
  }
}
