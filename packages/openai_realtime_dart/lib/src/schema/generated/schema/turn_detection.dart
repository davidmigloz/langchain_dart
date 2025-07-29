// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: TurnDetection
// ==========================================

/// Configuration for turn detection. Can be set to `null` to turn off. Server
/// VAD means that the model will detect the start and end of speech based on
/// audio volume and respond at the end of user speech.
@freezed
abstract class TurnDetection with _$TurnDetection {
  const TurnDetection._();

  /// Factory constructor for TurnDetection
  const factory TurnDetection({
    /// Type of turn detection, only `server_vad` is currently supported.
    required TurnDetectionType type,

    /// Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
    /// higher threshold will require louder audio to activate the model, and
    /// thus might perform better in noisy environments.
    @JsonKey(includeIfNull: false) double? threshold,

    /// Amount of audio to include before the VAD detected speech (in
    /// milliseconds). Defaults to 300ms.
    @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
    int? prefixPaddingMs,

    /// Duration of silence to detect speech stop (in milliseconds). Defaults
    /// to 500ms. With shorter values the model will respond more quickly,
    /// but may jump in on short pauses from the user.
    @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
    int? silenceDurationMs,

    /// Whether or not to automatically generate a response when VAD is
    /// enabled. `true` by default.
    @JsonKey(name: 'create_response') @Default(true) bool createResponse,
  }) = _TurnDetection;

  /// Object construction from a JSON representation
  factory TurnDetection.fromJson(Map<String, dynamic> json) =>
      _$TurnDetectionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'threshold',
    'prefix_padding_ms',
    'silence_duration_ms',
    'create_response'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'threshold': threshold,
      'prefix_padding_ms': prefixPaddingMs,
      'silence_duration_ms': silenceDurationMs,
      'create_response': createResponse,
    };
  }
}
