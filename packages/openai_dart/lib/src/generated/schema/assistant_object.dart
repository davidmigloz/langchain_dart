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

    /// The system instructions that the assistant uses. The maximum length is 256,000 characters.
    required String? instructions,

    /// A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of
    /// types `code_interpreter`, `file_search`, or `function`.
    required List<AssistantTools> tools,

    /// A set of resources that are made available to the assistant's tools in this thread. The resources are specific to the type of tool. For example, the `code_interpreter` tool requires a list of file IDs, while the `file_search` tool requires a list of vector store IDs.
    @JsonKey(name: 'tool_resources', includeIfNull: false)
    ToolResources? toolResources,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maxium of 512 characters long.
    required Map<String, dynamic>? metadata,

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random,
    /// while lower values like 0.2 will make it more focused and deterministic.
    @JsonKey(includeIfNull: false) @Default(1.0) double? temperature,

    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results
    /// of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability
    /// mass are considered.
    ///
    /// We generally recommend altering this or temperature but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) @Default(1.0) double? topP,

    /// Specifies the format that the model must output. Compatible with
    /// [GPT-4o](https://platform.openai.com/docs/models/gpt-4o),
    /// [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models
    /// since `gpt-3.5-turbo-1106`.
    ///
    /// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs which guarantees
    /// the model will match your supplied JSON schema. Learn more in the
    /// [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
    ///
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates
    /// is valid JSON.
    ///
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a
    /// system or user message. Without this, the model may generate an unending stream of whitespace until the
    /// generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note
    /// that the message content may be partially cut off if `finish_reason="length"`, which indicates the
    /// generation exceeded `max_tokens` or the conversation exceeded the max context length.
    @_AssistantObjectResponseFormatConverter()
    @JsonKey(name: 'response_format', includeIfNull: false)
    AssistantObjectResponseFormat? responseFormat,
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
      'id': id,
      'object': object,
      'created_at': createdAt,
      'name': name,
      'description': description,
      'model': model,
      'instructions': instructions,
      'tools': tools,
      'tool_resources': toolResources,
      'metadata': metadata,
      'temperature': temperature,
      'top_p': topP,
      'response_format': responseFormat,
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

// ==========================================
// ENUM: AssistantResponseFormatMode
// ==========================================

/// `auto` is the default value
enum AssistantResponseFormatMode {
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: AssistantObjectResponseFormat
// ==========================================

/// Specifies the format that the model must output. Compatible with
/// [GPT-4o](https://platform.openai.com/docs/models/gpt-4o),
/// [GPT-4 Turbo](https://platform.openai.com/docs/models/gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models
/// since `gpt-3.5-turbo-1106`.
///
/// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs which guarantees
/// the model will match your supplied JSON schema. Learn more in the
/// [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
///
/// Setting to `{ "type": "json_object" }` enables JSON mode, which guarantees the message the model generates
/// is valid JSON.
///
/// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a
/// system or user message. Without this, the model may generate an unending stream of whitespace until the
/// generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note
/// that the message content may be partially cut off if `finish_reason="length"`, which indicates the
/// generation exceeded `max_tokens` or the conversation exceeded the max context length.
@freezed
sealed class AssistantObjectResponseFormat
    with _$AssistantObjectResponseFormat {
  const AssistantObjectResponseFormat._();

  /// `auto` is the default value
  const factory AssistantObjectResponseFormat.mode(
    AssistantResponseFormatMode value,
  ) = AssistantObjectResponseFormatEnumeration;

  /// No Description
  const factory AssistantObjectResponseFormat.responseFormat(
    ResponseFormat value,
  ) = AssistantObjectResponseFormatResponseFormat;

  /// Object construction from a JSON representation
  factory AssistantObjectResponseFormat.fromJson(Map<String, dynamic> json) =>
      _$AssistantObjectResponseFormatFromJson(json);
}

/// Custom JSON converter for [AssistantObjectResponseFormat]
class _AssistantObjectResponseFormatConverter
    implements JsonConverter<AssistantObjectResponseFormat?, Object?> {
  const _AssistantObjectResponseFormatConverter();

  @override
  AssistantObjectResponseFormat? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$AssistantResponseFormatModeEnumMap.values.contains(data)) {
      return AssistantObjectResponseFormatEnumeration(
        _$AssistantResponseFormatModeEnumMap.keys.elementAt(
          _$AssistantResponseFormatModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return AssistantObjectResponseFormatResponseFormat(
          ResponseFormat.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for AssistantObjectResponseFormat: $data',
    );
  }

  @override
  Object? toJson(AssistantObjectResponseFormat? data) {
    return switch (data) {
      AssistantObjectResponseFormatEnumeration(value: final v) =>
        _$AssistantResponseFormatModeEnumMap[v]!,
      AssistantObjectResponseFormatResponseFormat(value: final v) => v.toJson(),
      null => null,
    };
  }
}
