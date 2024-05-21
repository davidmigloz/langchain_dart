// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: TextBlockParam
// ==========================================

/// No Description
@freezed
class TextBlockParam with _$TextBlockParam {
  const TextBlockParam._();

  /// Factory constructor for TextBlockParam
  const factory TextBlockParam({
    /// No Description
    required String text,

    ///
    required TextBlockParamType type,
  }) = _TextBlockParam;

  /// Object construction from a JSON representation
  factory TextBlockParam.fromJson(Map<String, dynamic> json) =>
      _$TextBlockParamFromJson(json);

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
// ENUM: TextBlockParamType
// ==========================================

/// No Description
enum TextBlockParamType {
  @JsonValue('text')
  text,
}
