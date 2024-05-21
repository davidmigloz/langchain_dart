// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: TextBlock
// ==========================================

/// No Description
@freezed
class TextBlock with _$TextBlock {
  const TextBlock._();

  /// Factory constructor for TextBlock
  const factory TextBlock({
    /// No Description
    required String text,

    ///
    required TextBlockType type,
  }) = _TextBlock;

  /// Object construction from a JSON representation
  factory TextBlock.fromJson(Map<String, dynamic> json) =>
      _$TextBlockFromJson(json);

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
// ENUM: TextBlockType
// ==========================================

/// No Description
enum TextBlockType {
  @JsonValue('text')
  text,
}
