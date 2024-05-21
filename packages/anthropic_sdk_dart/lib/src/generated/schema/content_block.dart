// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: ContentBlock
// ==========================================

/// No Description
@freezed
class ContentBlock with _$ContentBlock {
  const ContentBlock._();

  /// Factory constructor for ContentBlock
  const factory ContentBlock({
    /// No Description
    required String text,

    ///
    required ContentBlockType type,
  }) = _ContentBlock;

  /// Object construction from a JSON representation
  factory ContentBlock.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockFromJson(json);

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
// ENUM: ContentBlockType
// ==========================================

/// No Description
enum ContentBlockType {
  @JsonValue('text')
  text,
}
