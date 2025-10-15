// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Session
// ==========================================

/// The session resource.
@freezed
abstract class Session with _$Session {
  const Session._();

  /// Factory constructor for Session
  const factory Session({
    /// The unique ID of the session.
    @JsonKey(includeIfNull: false) String? id,

    /// The object type, must be "realtime.session".
    @Default(ObjectType.realtimeSession) ObjectType object,

    /// The default model used for this session.
    @JsonKey(includeIfNull: false) String? model,

    /// The time at which the session expires.
    @JsonKey(name: 'expires_at', includeIfNull: false) int? expiresAt,

    /// The set of modalities the model can respond with.
    @JsonKey(includeIfNull: false) List<Modality>? modalities,

    /// The default system instructions.
    @JsonKey(includeIfNull: false) String? instructions,

    /// The voice the model uses to respond. Voice cannot be changed during the
    /// session once the model has responded with audio at least once. Current
    /// voice options are `alloy`, `ash`, `ballad`, `coral`, `echo` `sage`,
    /// `shimmer` and `verse`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    Voice? voice,

    /// The format of input audio.
    @JsonKey(
      name: 'input_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    AudioFormat? inputAudioFormat,

    /// The format of output audio.
    @JsonKey(
      name: 'output_audio_format',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    AudioFormat? outputAudioFormat,

    /// Configuration for input audio transcription, defaults to off and can be  set to `null` to turn off
    /// once on. Input audio transcription is not native to the model, since the model consumes audio
    /// directly. Transcription runs  asynchronously through [the /audio/transcriptions
    /// endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be
    /// treated as guidance of input audio content rather than precisely what the model heard. The client
    /// can optionally set the language and prompt for transcription, these offer additional guidance to
    /// the transcription service.
    @JsonKey(name: 'input_audio_transcription', includeIfNull: false)
    InputAudioTranscriptionConfig? inputAudioTranscription,

    /// Configuration for turn detection. Can be set to `null` to turn off. Server
    /// VAD means that the model will detect the start and end of speech based on
    /// audio volume and respond at the end of user speech.
    @JsonKey(name: 'turn_detection', includeIfNull: false)
    TurnDetection? turnDetection,

    /// Tools (functions) available to the model.
    @JsonKey(includeIfNull: false) List<ToolDefinition>? tools,

    /// How the model chooses tools.
    @_SessionToolChoiceConverter()
    @JsonKey(name: 'tool_choice', includeIfNull: false)
    SessionToolChoice? toolChoice,

    /// Sampling temperature.
    @JsonKey(includeIfNull: false) double? temperature,

    /// Maximum number of output tokens for a single assistant response,
    /// inclusive of tool calls. Provide an integer between 1 and 4096 to
    /// limit output tokens, or `inf` for the maximum available tokens for a
    /// given model. Defaults to `inf`.
    @_SessionMaxResponseOutputTokensConverter()
    @JsonKey(name: 'max_response_output_tokens', includeIfNull: false)
    SessionMaxResponseOutputTokens? maxResponseOutputTokens,
  }) = _Session;

  /// Object construction from a JSON representation
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'object',
    'model',
    'expires_at',
    'modalities',
    'instructions',
    'voice',
    'input_audio_format',
    'output_audio_format',
    'input_audio_transcription',
    'turn_detection',
    'tools',
    'tool_choice',
    'temperature',
    'max_response_output_tokens',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'model': model,
      'expires_at': expiresAt,
      'modalities': modalities,
      'instructions': instructions,
      'voice': voice,
      'input_audio_format': inputAudioFormat,
      'output_audio_format': outputAudioFormat,
      'input_audio_transcription': inputAudioTranscription,
      'turn_detection': turnDetection,
      'tools': tools,
      'tool_choice': toolChoice,
      'temperature': temperature,
      'max_response_output_tokens': maxResponseOutputTokens,
    };
  }
}

// ==========================================
// ENUM: SessionToolChoiceMode
// ==========================================

/// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
enum SessionToolChoiceMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
  @JsonValue('required')
  required,
}

// ==========================================
// CLASS: SessionToolChoice
// ==========================================

/// How the model chooses tools.
@freezed
sealed class SessionToolChoice with _$SessionToolChoice {
  const SessionToolChoice._();

  /// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
  const factory SessionToolChoice.mode(
    SessionToolChoiceMode value,
  ) = SessionToolChoiceEnumeration;

  /// No Description
  const factory SessionToolChoice.toolChoiceForced(
    ToolChoiceForced value,
  ) = SessionToolChoiceToolChoiceForced;

  /// Object construction from a JSON representation
  factory SessionToolChoice.fromJson(Map<String, dynamic> json) =>
      _$SessionToolChoiceFromJson(json);
}

/// Custom JSON converter for [SessionToolChoice]
class _SessionToolChoiceConverter
    implements JsonConverter<SessionToolChoice?, Object?> {
  const _SessionToolChoiceConverter();

  @override
  SessionToolChoice? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$SessionToolChoiceModeEnumMap.values.contains(data)) {
      return SessionToolChoiceEnumeration(
        _$SessionToolChoiceModeEnumMap.keys.elementAt(
          _$SessionToolChoiceModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return SessionToolChoiceToolChoiceForced(
          ToolChoiceForced.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for SessionToolChoice: $data',
    );
  }

  @override
  Object? toJson(SessionToolChoice? data) {
    return switch (data) {
      SessionToolChoiceEnumeration(value: final v) =>
        _$SessionToolChoiceModeEnumMap[v]!,
      SessionToolChoiceToolChoiceForced(value: final v) => v.toJson(),
      null => null,
    };
  }
}

// ==========================================
// CLASS: SessionMaxResponseOutputTokens
// ==========================================

/// Maximum number of output tokens for a single assistant response,
/// inclusive of tool calls. Provide an integer between 1 and 4096 to
/// limit output tokens, or `inf` for the maximum available tokens for a
/// given model. Defaults to `inf`.
@freezed
sealed class SessionMaxResponseOutputTokens
    with _$SessionMaxResponseOutputTokens {
  const SessionMaxResponseOutputTokens._();

  /// Provide an integer between 1 and 4096 to limit output tokens.
  const factory SessionMaxResponseOutputTokens.int(
    int value,
  ) = SessionMaxResponseOutputTokensInt;

  /// Use inf for the maximum available tokens for a given model.
  const factory SessionMaxResponseOutputTokens.string(
    String value,
  ) = SessionMaxResponseOutputTokensString;

  /// Object construction from a JSON representation
  factory SessionMaxResponseOutputTokens.fromJson(Map<String, dynamic> json) =>
      _$SessionMaxResponseOutputTokensFromJson(json);
}

/// Custom JSON converter for [SessionMaxResponseOutputTokens]
class _SessionMaxResponseOutputTokensConverter
    implements JsonConverter<SessionMaxResponseOutputTokens?, Object?> {
  const _SessionMaxResponseOutputTokensConverter();

  @override
  SessionMaxResponseOutputTokens? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is int) {
      return SessionMaxResponseOutputTokensInt(data);
    }
    if (data is String) {
      return SessionMaxResponseOutputTokensString(data);
    }
    throw Exception(
      'Unexpected value for SessionMaxResponseOutputTokens: $data',
    );
  }

  @override
  Object? toJson(SessionMaxResponseOutputTokens? data) {
    return switch (data) {
      SessionMaxResponseOutputTokensInt(value: final v) => v,
      SessionMaxResponseOutputTokensString(value: final v) => v,
      null => null,
    };
  }
}
