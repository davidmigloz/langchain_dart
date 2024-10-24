// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: TurnDetection
// ==========================================

/// Configuration for turn detection.
@freezed
class TurnDetection with _$TurnDetection {
  const TurnDetection._();

  /// Factory constructor for TurnDetection
  const factory TurnDetection({
    /// The type of turn detection ("server_vad" or "none").
    required TurnDetectionType type,

    /// Activation threshold for VAD.
    @JsonKey(includeIfNull: false) double? threshold,

    /// Audio included before speech starts (in milliseconds).
    @JsonKey(name: 'prefix_padding_ms', includeIfNull: false)
    int? prefixPaddingMs,

    /// Duration of silence to detect speech stop (in milliseconds).
    @JsonKey(name: 'silence_duration_ms', includeIfNull: false)
    int? silenceDurationMs,
  }) = _TurnDetection;

  /// Object construction from a JSON representation
  factory TurnDetection.fromJson(Map<String, dynamic> json) =>
      _$TurnDetectionFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'threshold',
    'prefix_padding_ms',
    'silence_duration_ms'
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
    };
  }
}
