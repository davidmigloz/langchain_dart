// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: MessageStreamEventType
// ==========================================

/// The type of a streaming event.
enum MessageStreamEventType {
  @JsonValue('message_start')
  messageStart,
  @JsonValue('message_delta')
  messageDelta,
  @JsonValue('message_stop')
  messageStop,
  @JsonValue('content_block_start')
  contentBlockStart,
  @JsonValue('content_block_delta')
  contentBlockDelta,
  @JsonValue('content_block_stop')
  contentBlockStop,
  @JsonValue('ping')
  ping,
}
