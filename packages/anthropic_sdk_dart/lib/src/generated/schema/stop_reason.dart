// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// ENUM: StopReason
// ==========================================

/// The reason that we stopped.
///
/// This may be one the following values:
///
/// - `"end_turn"`: the model reached a natural stopping point
/// - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
/// - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
/// - `"tool_use"`: the model invoked one or more tools
///
/// In non-streaming mode this value is always non-null. In streaming mode, it is
/// null in the `message_start` event and non-null otherwise.
enum StopReason {
  @JsonValue('end_turn')
  endTurn,
  @JsonValue('max_tokens')
  maxTokens,
  @JsonValue('stop_sequence')
  stopSequence,
  @JsonValue('tool_use')
  toolUse,
}
