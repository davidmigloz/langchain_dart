// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: TextDelta
// ==========================================

/// No Description
@freezed
class TextDelta with _$TextDelta {
  const TextDelta._();

  /// Factory constructor for TextDelta
  const factory TextDelta({
    /// No Description
    required String text,

    ///
    required TextDeltaType type,
  }) = _TextDelta;

  /// Object construction from a JSON representation
  factory TextDelta.fromJson(Map<String, dynamic> json) =>
      _$TextDeltaFromJson(json);

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

// ==========================================
// ENUM: TextDeltaType
// ==========================================

/// No Description
enum TextDeltaType {
  @JsonValue('text_delta')
  textDelta,
}
