// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ChatCompletionMessageRole
// ==========================================

/// The role of the messages author. One of `system`, `user`, `assistant`, or `tool` (`function` is deprecated).
enum ChatCompletionMessageRole {
  @JsonValue('system')
  system,
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
  @JsonValue('tool')
  tool,
  @JsonValue('function')
  function,
}
