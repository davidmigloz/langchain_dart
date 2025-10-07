// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ItemSpeech
// ==========================================

/// The speech item.
@freezed
abstract class ItemSpeech with _$ItemSpeech {
  const ItemSpeech._();

  /// Factory constructor for ItemSpeech
  const factory ItemSpeech({
    /// The start time of the audio in milliseconds.
    required int audioStartMs,

    /// The end time of the audio in milliseconds.
    @JsonKey(includeIfNull: false) int? audioEndMs,

    /// The audio bytes.
    @Uint8ListConverter() @JsonKey(includeIfNull: false) Uint8List? audio,
  }) = _ItemSpeech;

  /// Object construction from a JSON representation
  factory ItemSpeech.fromJson(Map<String, dynamic> json) =>
      _$ItemSpeechFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'audioStartMs',
    'audioEndMs',
    'audio'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'audioStartMs': audioStartMs,
      'audioEndMs': audioEndMs,
      'audio': audio,
    };
  }
}
