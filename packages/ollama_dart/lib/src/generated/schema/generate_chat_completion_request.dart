// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: GenerateChatCompletionRequest
// ==========================================

/// Request class for the chat endpoint.
@freezed
abstract class GenerateChatCompletionRequest
    with _$GenerateChatCompletionRequest {
  const GenerateChatCompletionRequest._();

  /// Factory constructor for GenerateChatCompletionRequest
  const factory GenerateChatCompletionRequest({
    /// The model name.
    ///
    /// Model names follow a `model:tag` format. Some examples are `orca-mini:3b-q4_1` and `llama3:70b`. The tag is optional and, if not provided, will default to `latest`. The tag is used to identify a specific version.
    required String model,

    /// The messages of the chat, this can be used to keep a chat memory
    required List<Message> messages,

    /// If `false` the response will be returned as a single response object, otherwise the response will be streamed as a series of objects.
    @Default(false) bool stream,

    /// The format to return a response in. Can be:
    /// - "json" string to enable JSON mode
    /// - JSON schema object for structured output validation
    @_GenerateChatCompletionRequestFormatConverter()
    @JsonKey(includeIfNull: false)
    GenerateChatCompletionRequestFormat? format,

    /// How long (in minutes) to keep the model loaded in memory.
    ///
    /// - If set to a positive duration (e.g. 20), the model will stay loaded for the provided duration.
    /// - If set to a negative duration (e.g. -1), the model will stay loaded indefinitely.
    /// - If set to 0, the model will be unloaded immediately once finished.
    /// - If not set, the model will stay loaded for 5 minutes by default
    @JsonKey(name: 'keep_alive', includeIfNull: false) int? keepAlive,

    /// A list of tools the model may call.
    @JsonKey(includeIfNull: false) List<Tool>? tools,

    /// Additional model parameters listed in the documentation for the Modelfile such as `temperature`.
    @JsonKey(includeIfNull: false) RequestOptions? options,

    /// Think controls whether thinking/reasoning models will think before
    /// responding. Needs to be a pointer so we can distinguish between false
    /// (request that thinking _not_ be used) and unset (use the old behavior
    /// before this option was introduced).
    @JsonKey(includeIfNull: false) bool? think,
  }) = _GenerateChatCompletionRequest;

  /// Object construction from a JSON representation
  factory GenerateChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateChatCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'stream',
    'format',
    'keep_alive',
    'tools',
    'options',
    'think',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'messages': messages,
      'stream': stream,
      'format': format,
      'keep_alive': keepAlive,
      'tools': tools,
      'options': options,
      'think': think,
    };
  }
}

// ==========================================
// ENUM: GenerateChatCompletionRequestFormatEnum
// ==========================================

/// Enable JSON mode
enum GenerateChatCompletionRequestFormatEnum {
  @JsonValue('json')
  json,
}

// ==========================================
// CLASS: GenerateChatCompletionRequestFormat
// ==========================================

/// The format to return a response in. Can be:
/// - "json" string to enable JSON mode
/// - JSON schema object for structured output validation
@freezed
sealed class GenerateChatCompletionRequestFormat
    with _$GenerateChatCompletionRequestFormat {
  const GenerateChatCompletionRequestFormat._();

  /// Enable JSON mode
  const factory GenerateChatCompletionRequestFormat.enumeration(
    GenerateChatCompletionRequestFormatEnum value,
  ) = GenerateChatCompletionRequestFormatEnumeration;

  /// JSON schema object for structured output validation
  const factory GenerateChatCompletionRequestFormat.mapStringDynamic(
    Map<String, dynamic> value,
  ) = GenerateChatCompletionRequestFormatMapStringDynamic;

  /// Object construction from a JSON representation
  factory GenerateChatCompletionRequestFormat.fromJson(
    Map<String, dynamic> json,
  ) => _$GenerateChatCompletionRequestFormatFromJson(json);
}

/// Custom JSON converter for [GenerateChatCompletionRequestFormat]
class _GenerateChatCompletionRequestFormatConverter
    implements JsonConverter<GenerateChatCompletionRequestFormat?, Object?> {
  const _GenerateChatCompletionRequestFormatConverter();

  @override
  GenerateChatCompletionRequestFormat? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$GenerateChatCompletionRequestFormatEnumEnumMap.values.contains(
          data,
        )) {
      return GenerateChatCompletionRequestFormatEnumeration(
        _$GenerateChatCompletionRequestFormatEnumEnumMap.keys.elementAt(
          _$GenerateChatCompletionRequestFormatEnumEnumMap.values
              .toList()
              .indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      return GenerateChatCompletionRequestFormatMapStringDynamic(data);
    }
    throw Exception(
      'Unexpected value for GenerateChatCompletionRequestFormat: $data',
    );
  }

  @override
  Object? toJson(GenerateChatCompletionRequestFormat? data) {
    return switch (data) {
      GenerateChatCompletionRequestFormatEnumeration(value: final v) =>
        _$GenerateChatCompletionRequestFormatEnumEnumMap[v]!,
      GenerateChatCompletionRequestFormatMapStringDynamic(value: final v) => v,
      null => null,
    };
  }
}
