// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: ToolChoiceType
// ==========================================

/// How the model should use the provided tools. The model can use a specific tool,
/// any available tool, or decide by itself.
///
/// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
/// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
/// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
enum ToolChoiceType {
  @JsonValue('auto')
  auto,
  @JsonValue('any')
  any,
  @JsonValue('tool')
  tool,
}
