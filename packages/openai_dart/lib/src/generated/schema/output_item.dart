// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: OutputItem
// ==========================================

/// An output item from a response.
@freezed
class OutputItem with _$OutputItem {
  const OutputItem._();

  /// Factory constructor for OutputItem
  const factory OutputItem({
    /// The ID of the output item.
    required String id,

    /// The type of the output item.
    required OutputType type,

    /// No Description
    @JsonKey(includeIfNull: false) List<OutputContent>? content,

    /// Information about the tool use.
    @JsonKey(name: 'tool_use', includeIfNull: false) OutputItemToolUse? toolUse,

    /// Information about the tool result.
    @JsonKey(name: 'tool_result', includeIfNull: false)
    OutputItemToolResult? toolResult,
  }) = _OutputItem;

  /// Object construction from a JSON representation
  factory OutputItem.fromJson(Map<String, dynamic> json) =>
      _$OutputItemFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'type',
    'content',
    'tool_use',
    'tool_result'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'content': content,
      'tool_use': toolUse,
      'tool_result': toolResult,
    };
  }
}

// ==========================================
// CLASS: OutputItemToolUse
// ==========================================

/// Information about the tool use.
@freezed
class OutputItemToolUse with _$OutputItemToolUse {
  const OutputItemToolUse._();

  /// Factory constructor for OutputItemToolUse
  const factory OutputItemToolUse({
    /// The ID of the tool use.
    required String id,

    /// The name of the tool.
    required String name,

    /// The input to the tool.
    required Map<String, dynamic> input,
  }) = _OutputItemToolUse;

  /// Object construction from a JSON representation
  factory OutputItemToolUse.fromJson(Map<String, dynamic> json) =>
      _$OutputItemToolUseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'name', 'input'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'input': input,
    };
  }
}

// ==========================================
// CLASS: OutputItemToolResult
// ==========================================

/// Information about the tool result.
@freezed
class OutputItemToolResult with _$OutputItemToolResult {
  const OutputItemToolResult._();

  /// Factory constructor for OutputItemToolResult
  const factory OutputItemToolResult({
    /// The ID of the tool use this result is for.
    required String id,

    /// The content of the tool result.
    required List<OutputContent> content,
  }) = _OutputItemToolResult;

  /// Object construction from a JSON representation
  factory OutputItemToolResult.fromJson(Map<String, dynamic> json) =>
      _$OutputItemToolResultFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }
}
