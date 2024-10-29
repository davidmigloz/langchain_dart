// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: ObjectType
// ==========================================

/// The object type.
enum ObjectType {
  @JsonValue('realtime.item')
  realtimeItem,
  @JsonValue('realtime.response')
  realtimeResponse,
  @JsonValue('realtime.session')
  realtimeSession,
  @JsonValue('realtime.conversation')
  realtimeConversation,
}
