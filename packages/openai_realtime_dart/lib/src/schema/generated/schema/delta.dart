// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: Delta
// ==========================================

/// Delta object.
@freezed
abstract class Delta with _$Delta {
  const Delta._();

  /// Factory constructor for Delta
  const factory Delta({
    /// The transcript of the audio.
    @JsonKey(includeIfNull: false) String? transcript,

    /// The audio bytes.
    @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio,

    /// The text.
    @JsonKey(includeIfNull: false) String? text,

    /// The arguments.
    @JsonKey(includeIfNull: false) String? arguments,
  }) = _Delta;

  /// Object construction from a JSON representation
  factory Delta.fromJson(Map<String, dynamic> json) => _$DeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'transcript',
    'audio',
    'text',
    'arguments'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'transcript': transcript,
      'audio': audio,
      'text': text,
      'arguments': arguments,
    };
  }
}
