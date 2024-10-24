// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: FormattedProperty
// ==========================================

/// A formatted property.
@freezed
class FormattedProperty with _$FormattedProperty {
  const FormattedProperty._();

  /// Factory constructor for FormattedProperty
  const factory FormattedProperty({
    /// The audio bytes.
    @Uint8ListConverter() required Uint8List audio,

    /// The text.
    required String text,

    /// The transcript.
    required String transcript,

    /// A formatted tool.
    @JsonKey(includeIfNull: false) FormattedTool? tool,

    /// The output.
    @JsonKey(includeIfNull: false) String? output,
  }) = _FormattedProperty;

  /// Object construction from a JSON representation
  factory FormattedProperty.fromJson(Map<String, dynamic> json) =>
      _$FormattedPropertyFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'audio',
    'text',
    'transcript',
    'tool',
    'output'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'audio': audio,
      'text': text,
      'transcript': transcript,
      'tool': tool,
      'output': output,
    };
  }
}
