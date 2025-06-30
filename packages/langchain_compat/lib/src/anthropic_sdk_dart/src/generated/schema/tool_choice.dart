// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: ToolChoice
// ==========================================

/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
@freezed
class ToolChoice with _$ToolChoice {
  const ToolChoice._();

  /// Factory constructor for ToolChoice
  const factory ToolChoice({
    /// How the model should use the provided tools. The model can use a specific tool,
    /// any available tool, or decide by itself.
    ///
    /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
    /// - `any`: tells Claude that it must use one of the provided tools, but doesn't force a particular tool.
    /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
    required ToolChoiceType type,

    /// The name of the tool to use.
    @JsonKey(includeIfNull: false) String? name,

    /// Whether to disable parallel tool use.
    @JsonKey(name: 'disable_parallel_tool_use', includeIfNull: false)
    bool? disableParallelToolUse,
  }) = _ToolChoice;

  /// Object construction from a JSON representation
  factory ToolChoice.fromJson(Map<String, dynamic> json) =>
      _$ToolChoiceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'name',
    'disable_parallel_tool_use',
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
      'disable_parallel_tool_use': disableParallelToolUse,
    };
  }
}
