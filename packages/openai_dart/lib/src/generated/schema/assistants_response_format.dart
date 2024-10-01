// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantsResponseFormat
// ==========================================

/// An object describing the expected output of the model. If `json_object` only `function` type `tools` are allowed to be passed to the Run. If `text` the model can return text or any value needed.
@freezed
class AssistantsResponseFormat with _$AssistantsResponseFormat {
  const AssistantsResponseFormat._();

  /// Factory constructor for AssistantsResponseFormat
  const factory AssistantsResponseFormat({
    /// Must be one of `text` or `json_object`.
    @Default(AssistantsResponseFormatType.text)
    AssistantsResponseFormatType type,
  }) = _AssistantsResponseFormat;

  /// Object construction from a JSON representation
  factory AssistantsResponseFormat.fromJson(Map<String, dynamic> json) =>
      _$AssistantsResponseFormatFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }
}

// ==========================================
// ENUM: AssistantsResponseFormatType
// ==========================================

/// Must be one of `text` or `json_object`.
enum AssistantsResponseFormatType {
  @JsonValue('text')
  text,
  @JsonValue('json_object')
  jsonObject,
}
