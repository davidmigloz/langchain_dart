// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: TextBlockDelta
// ==========================================

/// A delta in a streaming text block.
@freezed
class TextBlockDelta with _$TextBlockDelta {
  const TextBlockDelta._();

  /// Factory constructor for TextBlockDelta
  const factory TextBlockDelta({
    /// The text delta.
    required String text,

    /// The type of content block.
    required String type,
  }) = _TextBlockDelta;

  /// Object construction from a JSON representation
  factory TextBlockDelta.fromJson(Map<String, dynamic> json) =>
      _$TextBlockDeltaFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['text', 'type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'type': type,
    };
  }
}
