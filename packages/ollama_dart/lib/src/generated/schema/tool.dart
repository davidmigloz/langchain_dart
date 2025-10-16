// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: Tool
// ==========================================

/// A tool the model may call.
@freezed
abstract class Tool with _$Tool {
  const Tool._();

  /// Factory constructor for Tool
  const factory Tool({
    /// The type of tool.
    @Default(ToolType.function) ToolType type,

    /// A function that the model may call.
    @JsonKey(includeIfNull: false) ToolFunction? function,
  }) = _Tool;

  /// Object construction from a JSON representation
  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'function': function};
  }
}

// ==========================================
// ENUM: ToolType
// ==========================================

/// The type of tool.
enum ToolType {
  @JsonValue('function')
  function,
}
