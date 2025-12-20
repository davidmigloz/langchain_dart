// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MCPToolResultContent
// ==========================================

/// Content within an MCP tool result.
@freezed
abstract class MCPToolResultContent with _$MCPToolResultContent {
  const MCPToolResultContent._();

  /// Factory constructor for MCPToolResultContent
  const factory MCPToolResultContent({
    /// The type of content.
    required String type,

    /// The text content.
    @JsonKey(includeIfNull: false) String? text,
  }) = _MCPToolResultContent;

  /// Object construction from a JSON representation
  factory MCPToolResultContent.fromJson(Map<String, dynamic> json) =>
      _$MCPToolResultContentFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'type': type, 'text': text};
  }
}
