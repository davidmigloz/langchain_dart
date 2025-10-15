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
abstract class ResponseConfig with _$ResponseConfig {
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

    /// Controls which conversation the response is added to. Currently supports
    /// `auto` and `none`, with `auto` as the default value. The `auto` value
    /// means that the contents of the response will be added to the default
    /// conversation. Set this to `none` to create an out-of-band response which
    /// will not add items to default conversation.
    @_ResponseConfigConversationConverter()
    @JsonKey(includeIfNull: false)
    ResponseConfigConversation? conversation,

    /// Set of 16 key-value pairs that can be attached to an object. This can be
    /// useful for storing additional information about the object in a structured
    /// format. Keys can be a maximum of 64 characters long and values can be a
    /// maximum of 512 characters long.
    @JsonKey(includeIfNull: false) Map<String, dynamic>? metadata,

    /// Input items to include in the prompt for the model. Creates a new context
    /// for this response, without including the default conversation. Can include
    /// references to items from the default conversation.
    @JsonKey(includeIfNull: false) List<Item>? input,
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
    'max_response_output_tokens',
    'conversation',
    'metadata',
    'input',
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
      'conversation': conversation,
      'metadata': metadata,
      'input': input,
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
    Map<String, dynamic> json,
  ) => _$ResponseConfigMaxResponseOutputTokensFromJson(json);
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

// ==========================================
// ENUM: ResponseConfigConversationEnum
// ==========================================

/// No Description
enum ResponseConfigConversationEnum {
  @JsonValue('auto')
  auto,
  @JsonValue('none')
  none,
}

// ==========================================
// CLASS: ResponseConfigConversation
// ==========================================

/// Controls which conversation the response is added to. Currently supports
/// `auto` and `none`, with `auto` as the default value. The `auto` value
/// means that the contents of the response will be added to the default
/// conversation. Set this to `none` to create an out-of-band response which
/// will not add items to default conversation.
@freezed
sealed class ResponseConfigConversation with _$ResponseConfigConversation {
  const ResponseConfigConversation._();

  /// No Description
  const factory ResponseConfigConversation.enumeration(
    ResponseConfigConversationEnum value,
  ) = ResponseConfigConversationEnumeration;

  /// No Description
  const factory ResponseConfigConversation.string(
    String value,
  ) = ResponseConfigConversationString;

  /// Object construction from a JSON representation
  factory ResponseConfigConversation.fromJson(Map<String, dynamic> json) =>
      _$ResponseConfigConversationFromJson(json);
}

/// Custom JSON converter for [ResponseConfigConversation]
class _ResponseConfigConversationConverter
    implements JsonConverter<ResponseConfigConversation?, Object?> {
  const _ResponseConfigConversationConverter();

  @override
  ResponseConfigConversation? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ResponseConfigConversationEnumEnumMap.values.contains(data)) {
      return ResponseConfigConversationEnumeration(
        _$ResponseConfigConversationEnumEnumMap.keys.elementAt(
          _$ResponseConfigConversationEnumEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ResponseConfigConversationString(data);
    }
    throw Exception(
      'Unexpected value for ResponseConfigConversation: $data',
    );
  }

  @override
  Object? toJson(ResponseConfigConversation? data) {
    return switch (data) {
      ResponseConfigConversationEnumeration(value: final v) =>
        _$ResponseConfigConversationEnumEnumMap[v]!,
      ResponseConfigConversationString(value: final v) => v,
      null => null,
    };
  }
}
