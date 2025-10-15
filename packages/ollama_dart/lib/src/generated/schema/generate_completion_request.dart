// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateCompletionRequest
// ==========================================

/// Request class for the generate endpoint.
@freezed
abstract class GenerateCompletionRequest with _$GenerateCompletionRequest {
  const GenerateCompletionRequest._();

  /// Factory constructor for GenerateCompletionRequest
  const factory GenerateCompletionRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The prompt to generate a response.
    required String prompt,

    /// The text that comes after the inserted text.
    @JsonKey(includeIfNull: false) String? suffix,

    /// The system prompt to (overrides what is defined in the Modelfile).
    @JsonKey(includeIfNull: false) String? system,

    /// The full prompt or prompt template (overrides what is defined in the Modelfile).
    @JsonKey(includeIfNull: false) String? template,

    /// The context parameter returned from a previous request to [generateCompletion], this can be used to keep a short conversational memory.
    @JsonKey(includeIfNull: false) List<int>? context,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,

    /// If `true` no formatting will be applied to the prompt and no context will be returned.
    ///
    /// You may choose to use the `raw` parameter if you are specifying a full templated prompt in your request to the API, and are managing history yourself.
    @JsonKey(includeIfNull: false) bool? raw,

    /// The format to return a response in. Can be:
    /// - "json" string to enable JSON mode
    /// - JSON schema object for structured output validation
    @_GenerateCompletionRequestFormatConverter()
    @JsonKey(includeIfNull: false)
    GenerateCompletionRequestFormat? format,

    /// How long (in minutes) to keep the model loaded in memory.
    ///
    /// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
    /// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
    /// - If set to 0, the model will be unloaded immediately once finished.
    /// - If not set, the model will stay loaded for 5 minutes by default
    @JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,

    /// (optional) a list of Base64-encoded images to include in the message (for multimodal models such as llava)
    @JsonKey(includeIfNull: false) List<String>? images,

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// Controls whether thinking/reasoning models will think before responding.
    /// Can be:
    /// - boolean: true/false to enable/disable thinking
    /// - string: "high", "medium", "low" to set thinking intensity level
    @_GenerateCompletionRequestThinkConverter()
    @JsonKey(includeIfNull: false)
    GenerateCompletionRequestThink? think,

    /// Truncates the end of the prompt if it exceeds the context length
    @JsonKey(includeIfNull: false) bool? truncate,

    /// Shifts the oldest parts out of the context window when the context limit is reached
    @JsonKey(includeIfNull: false) bool? shift,
  }) = _GenerateCompletionRequest;

  /// Object construction from a JSON representation
  factory GenerateCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'prompt',
    'suffix',
    'system',
    'template',
    'context',
    'stream',
    'raw',
    'format',
    'keep_alive',
    'images',
    'options',
    'think',
    'truncate',
    'shift',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'prompt': prompt,
      'suffix': suffix,
      'system': system,
      'template': template,
      'context': context,
      'stream': stream,
      'raw': raw,
      'format': format,
      'keep_alive': keepAlive,
      'images': images,
      'options': options,
      'think': think,
      'truncate': truncate,
      'shift': shift,
    };
  }
}

// ==========================================
// ENUM: GenerateCompletionRequestFormatEnum
// ==========================================

/// Enable JSON mode
enum GenerateCompletionRequestFormatEnum {
  @JsonValue('json')
  json,
}

// ==========================================
// CLASS: GenerateCompletionRequestFormat
// ==========================================

/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@freezed
sealed class GenerateCompletionRequestFormat
    with _$GenerateCompletionRequestFormat {
  const GenerateCompletionRequestFormat._();

  /// Enable JSON mode
  const factory GenerateCompletionRequestFormat.enumeration(
    GenerateCompletionRequestFormatEnum value,
  ) = GenerateCompletionRequestFormatEnumeration;

  /// JSON schema object for structured output validation
  const factory GenerateCompletionRequestFormat.mapStringDynamic(
    Map<String, dynamic> value,
  ) = GenerateCompletionRequestFormatMapStringDynamic;

  /// Object construction from a JSON representation
  factory GenerateCompletionRequestFormat.fromJson(Map<String, dynamic> json) =>
      _$GenerateCompletionRequestFormatFromJson(json);
}

/// Custom JSON converter for [GenerateCompletionRequestFormat]
class _GenerateCompletionRequestFormatConverter
    implements JsonConverter<GenerateCompletionRequestFormat?, Object?> {
  const _GenerateCompletionRequestFormatConverter();

  @override
  GenerateCompletionRequestFormat? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$GenerateCompletionRequestFormatEnumEnumMap.values.contains(data)) {
      return GenerateCompletionRequestFormatEnumeration(
        _$GenerateCompletionRequestFormatEnumEnumMap.keys.elementAt(
          _$GenerateCompletionRequestFormatEnumEnumMap.values.toList().indexOf(
            data,
          ),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      return GenerateCompletionRequestFormatMapStringDynamic(data);
    }
    throw Exception(
      'Unexpected value for GenerateCompletionRequestFormat: $data',
    );
  }

  @override
  Object? toJson(GenerateCompletionRequestFormat? data) {
    return switch (data) {
      GenerateCompletionRequestFormatEnumeration(value: final v) =>
        _$GenerateCompletionRequestFormatEnumEnumMap[v]!,
      GenerateCompletionRequestFormatMapStringDynamic(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: GenerateCompletionRequestThinkEnum
// ==========================================

/// No Description
enum GenerateCompletionRequestThinkEnum {
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
}

// ==========================================
// CLASS: GenerateCompletionRequestThink
// ==========================================

/// Controls whether thinking/reasoning models will think before responding.
/// Can be:
/// - boolean: true/false to enable/disable thinking
/// - string: "high", "medium", "low" to set thinking intensity level
@freezed
sealed class GenerateCompletionRequestThink
    with _$GenerateCompletionRequestThink {
  const GenerateCompletionRequestThink._();

  /// No Description
  const factory GenerateCompletionRequestThink.enumeration(
    GenerateCompletionRequestThinkEnum value,
  ) = GenerateCompletionRequestThinkEnumeration;

  /// Object construction from a JSON representation
  factory GenerateCompletionRequestThink.fromJson(Map<String, dynamic> json) =>
      _$GenerateCompletionRequestThinkFromJson(json);
}

/// Custom JSON converter for [GenerateCompletionRequestThink]
class _GenerateCompletionRequestThinkConverter
    implements JsonConverter<GenerateCompletionRequestThink?, Object?> {
  const _GenerateCompletionRequestThinkConverter();

  @override
  GenerateCompletionRequestThink? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$GenerateCompletionRequestThinkEnumEnumMap.values.contains(data)) {
      return GenerateCompletionRequestThinkEnumeration(
        _$GenerateCompletionRequestThinkEnumEnumMap.keys.elementAt(
          _$GenerateCompletionRequestThinkEnumEnumMap.values.toList().indexOf(
            data,
          ),
        ),
      );
    }
    throw Exception(
      'Unexpected value for GenerateCompletionRequestThink: $data',
    );
  }

  @override
  Object? toJson(GenerateCompletionRequestThink? data) {
    return switch (data) {
      GenerateCompletionRequestThinkEnumeration(value: final v) =>
        _$GenerateCompletionRequestThinkEnumEnumMap[v]!,
      null => null,
    };
  }
}
