// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ChatCompletionMessageRole
// ==========================================

/// The role of the messages author.
/// One of `developer`, `user`, `assistant`, or `tool` (`function` and `system` are deprecated).
enum ChatCompletionMessageRole {
  @JsonValue('developer')
  developer,
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
  @JsonValue('tool')
  tool,
  @JsonValue('system')
  system,
  @JsonValue('function')
  function,
}
