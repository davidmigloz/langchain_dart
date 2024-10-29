// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: FormattedTool
// ==========================================

/// A formatted tool.
@freezed
class FormattedTool with _$FormattedTool {
  const FormattedTool._();

  /// Factory constructor for FormattedTool
  const factory FormattedTool({
    /// The type of the tool. Currently, only `function` is supported.
    @Default(ToolType.function) ToolType type,

    /// The name of the function.
    required String name,

    /// The call id.
    @JsonKey(name: 'call_id') required String callId,

    /// The arguments.
    required String arguments,
  }) = _FormattedTool;

  /// Object construction from a JSON representation
  factory FormattedTool.fromJson(Map<String, dynamic> json) =>
      _$FormattedToolFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'name',
    'call_id',
    'arguments'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'call_id': callId,
      'arguments': arguments,
    };
  }
}
