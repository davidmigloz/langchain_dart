// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ResponseConfig
// ==========================================

/// Configuration for the response.
@freezed
class ResponseConfig with _$ResponseConfig {
  const ResponseConfig._();

  /// Factory constructor for ResponseConfig
  const factory ResponseConfig({
    /// The modalities for the response.
    @JsonKey(includeIfNull: false) List<Modality>? modalities,

    /// Instructions for the model.
    @JsonKey(includeIfNull: false) String? instructions,

    /// The voice the model uses to respond - one of `alloy`, `echo`, or `shimmer`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    Voice? voice,

    /// The format of output audio.
    @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    AudioFormat? outputAudioFormat,

    /// Tools (functions) available to the model.
    @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,

    /// How the model chooses tools.
    @_ResponseConfigToolChoiceConverter()
    @JsonKey(name: 'tool_choice', includeIfNull: false)
    ResponseConfigToolChoice? toolChoice,

    /// Sampling temperature.
    @JsonKey(includeIfNull: false) double? temperature,

    /// Maximum number of output tokens for a single assistant response, inclusive of tool calls. Defaults to "inf".
    @_ResponseConfigMaxResponseOutputTokensConverter()
    @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
    ResponseConfigMaxResponseOutputTokens? maxResponseOutputTokens,
  }) = _ResponseConfig;

  /// Object construction from a JSON representation
  factory ResponseConfig.fromJson(Map<String, dynamic> json) =>
      _$ResponseConfigFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'modalities',
    'instructions',
    'voice',
    'output_audio_format',
    'tools',
    'tool_choice',
    'temperature',
    'max_response_output_tokens'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'modalities': modalities,
      'instructions': instructions,
      'voice': voice,
      'output_audio_format': outputAudioFormat,
      'tools': tools,
      'tool_choice': toolChoice,
      'temperature': temperature,
      'max_response_output_tokens': maxResponseOutputTokens,
    };
  }
}

// ==========================================
// ENUM: ResponseConfigToolChoiceMode
// ==========================================

/// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
enum ResponseConfigToolChoiceMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
  @JsonValue('required')
  required,
}

// ==========================================
// CLASS: ResponseConfigToolChoice
// ==========================================

/// How the model chooses tools.
@freezed
sealed class ResponseConfigToolChoice with _$ResponseConfigToolChoice {
  const ResponseConfigToolChoice._();

  /// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
  const factory ResponseConfigToolChoice.mode(
    ResponseConfigToolChoiceMode value,
  ) = ResponseConfigToolChoiceEnumeration;

  /// No Description
  const factory ResponseConfigToolChoice.toolChoiceForced(
    ToolChoiceForced value,
  ) = ResponseConfigToolChoiceToolChoiceForced;

  /// Object construction from a JSON representation
  factory ResponseConfigToolChoice.fromJson(Map<String, dynamic> json) =>
      _$ResponseConfigToolChoiceFromJson(json);
}

/// Custom JSON converter for [ResponseConfigToolChoice]
class _ResponseConfigToolChoiceConverter
    implements JsonConverter<ResponseConfigToolChoice?, Object?> {
  const _ResponseConfigToolChoiceConverter();

  @override
  ResponseConfigToolChoice? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ResponseConfigToolChoiceModeEnumMap.values.contains(data)) {
      return ResponseConfigToolChoiceEnumeration(
        _$ResponseConfigToolChoiceModeEnumMap.keys.elementAt(
          _$ResponseConfigToolChoiceModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return ResponseConfigToolChoiceToolChoiceForced(
          ToolChoiceForced.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for ResponseConfigToolChoice: $data',
    );
  }

  @override
  Object? toJson(ResponseConfigToolChoice? data) {
    return switch (data) {
      ResponseConfigToolChoiceEnumeration(value: final v) =>
        _$ResponseConfigToolChoiceModeEnumMap[v]!,
      ResponseConfigToolChoiceToolChoiceForced(value: final v) => v.toJson(),
      null => null,
    };
  }
}

// ==========================================
// CLASS: ResponseConfigMaxResponseOutputTokens
// ==========================================

/// Maximum number of output tokens for a single assistant response, inclusive of tool calls. Defaults to "inf".
@freezed
sealed class ResponseConfigMaxResponseOutputTokens
    with _$ResponseConfigMaxResponseOutputTokens {
  const ResponseConfigMaxResponseOutputTokens._();

  /// Provide an integer between 1 and 4096 to limit output tokens.
  const factory ResponseConfigMaxResponseOutputTokens.int(
    int value,
  ) = ResponseConfigMaxResponseOutputTokensInt;

  /// Use inf for the maximum available tokens for a given model.
  const factory ResponseConfigMaxResponseOutputTokens.string(
    String value,
  ) = ResponseConfigMaxResponseOutputTokensString;

  /// Object construction from a JSON representation
  factory ResponseConfigMaxResponseOutputTokens.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseConfigMaxResponseOutputTokensFromJson(json);
}

/// Custom JSON converter for [ResponseConfigMaxResponseOutputTokens]
class _ResponseConfigMaxResponseOutputTokensConverter
    implements JsonConverter<ResponseConfigMaxResponseOutputTokens?, Object?> {
  const _ResponseConfigMaxResponseOutputTokensConverter();

  @override
  ResponseConfigMaxResponseOutputTokens? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is int) {
      return ResponseConfigMaxResponseOutputTokensInt(data);
    }
    if (data is String) {
      return ResponseConfigMaxResponseOutputTokensString(data);
    }
    throw Exception(
      'Unexpected value for ResponseConfigMaxResponseOutputTokens: $data',
    );
  }

  @override
  Object? toJson(ResponseConfigMaxResponseOutputTokens? data) {
    return switch (data) {
      ResponseConfigMaxResponseOutputTokensInt(value: final v) => v,
      ResponseConfigMaxResponseOutputTokensString(value: final v) => v,
      null => null,
    };
  }
}
