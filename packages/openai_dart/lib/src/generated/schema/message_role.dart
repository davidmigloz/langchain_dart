// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: MessageRole
// ==========================================

/// The entity that produced the message. One of `user` or `assistant`.
enum MessageRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}
