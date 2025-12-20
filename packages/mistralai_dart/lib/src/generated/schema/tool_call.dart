// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ToolCall
// ==========================================

/// A tool call made by the model.
@freezed
abstract class ToolCall with _$ToolCall {
  const ToolCall._();

  /// Factory constructor for ToolCall
  const factory ToolCall({
    /// The unique identifier of the tool call.
    required String id,

    /// The type of the tool.
    required ToolType type,

    /// A function call made by the model.
    required FunctionCall function,

    /// The index of the tool call in the list of tool calls.
    @JsonKey(includeIfNull: false) int? index,
  }) = _ToolCall;

  /// Object construction from a JSON representation
  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'type', 'function', 'index'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type, 'function': function, 'index': index};
  }
}
