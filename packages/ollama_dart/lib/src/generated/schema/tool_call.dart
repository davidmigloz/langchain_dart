// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of ollama_schema;

// ==========================================
// CLASS: ToolCall
// ==========================================

/// The tool the model wants to call.
@freezed
class ToolCall with _$ToolCall {
  const ToolCall._();

  /// Factory constructor for ToolCall
  const factory ToolCall({
    /// The function the model wants to call.
    @JsonKey(includeIfNull: false) ToolCallFunction? function,
  }) = _ToolCall;

  /// Object construction from a JSON representation
  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['function'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'function': function,
    };
  }
}
