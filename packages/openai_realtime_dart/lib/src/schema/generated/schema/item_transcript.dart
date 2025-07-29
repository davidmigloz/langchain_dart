// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: ItemTranscript
// ==========================================

/// The transcript item.
@freezed
abstract class ItemTranscript with _$ItemTranscript {
  const ItemTranscript._();

  /// Factory constructor for ItemTranscript
  const factory ItemTranscript({
    /// The transcript.
    required String transcript,
  }) = _ItemTranscript;

  /// Object construction from a JSON representation
  factory ItemTranscript.fromJson(Map<String, dynamic> json) =>
      _$ItemTranscriptFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['transcript'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'transcript': transcript,
    };
  }
}
