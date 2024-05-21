// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_a_i_schema;

// ==========================================
// CLASS: MessageStreamEvent
// ==========================================

/// Union class for [MessageStartEvent], [MessageDeltaEvent], [MessageStopEvent], [ContentBlockStartEvent], [ContentBlockDeltaEvent], [ContentBlockStopEvent]
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageStreamEvent with _$MessageStreamEvent {
  const MessageStreamEvent._();

  // ------------------------------------------
  // UNION: MessageStartEvent
  // ------------------------------------------

  /// Union constructor for [MessageStartEvent]
  const factory MessageStreamEvent.messageStartEvent({
    /// No Description
    required Message message,

    ///
    required MessageStartEventType type,
  }) = MessageStartEvent;

  // ------------------------------------------
  // UNION: MessageDeltaEvent
  // ------------------------------------------

  /// Union constructor for [MessageDeltaEvent]
  const factory MessageStreamEvent.messageDeltaEvent({
    /// No Description
    required MessageDeltaEventDelta delta,

    ///
    required MessageDeltaEventType type,

    /// Billing and rate-limit usage.
    ///
    /// Anthropic's API bills and rate-limits by token counts, as tokens represent the
    /// underlying cost to our systems.
    ///
    /// Under the hood, the API transforms requests into a format suitable for the
    /// model. The model's output then goes through a parsing stage before becoming an
    /// API response. As a result, the token counts in `usage` will not match one-to-one
    /// with the exact visible content of an API request or response.
    ///
    /// For example, `output_tokens` will be non-zero, even for an empty string response
    /// from Claude.
    required MessageDeltaUsage usage,
  }) = MessageDeltaEvent;

  // ------------------------------------------
  // UNION: MessageStopEvent
  // ------------------------------------------

  /// Union constructor for [MessageStopEvent]
  const factory MessageStreamEvent.messageStopEvent({
    ///
    required MessageStopEventType type,
  }) = MessageStopEvent;

  // ------------------------------------------
  // UNION: ContentBlockStartEvent
  // ------------------------------------------

  /// Union constructor for [ContentBlockStartEvent]
  const factory MessageStreamEvent.contentBlockStartEvent({
    /// No Description
    @JsonKey(name: 'content_block') required TextBlock contentBlock,

    /// No Description
    required int index,

    ///
    required ContentBlockStartEventType type,
  }) = ContentBlockStartEvent;

  // ------------------------------------------
  // UNION: ContentBlockDeltaEvent
  // ------------------------------------------

  /// Union constructor for [ContentBlockDeltaEvent]
  const factory MessageStreamEvent.contentBlockDeltaEvent({
    /// No Description
    required TextDelta delta,

    /// No Description
    required int index,

    ///
    required ContentBlockDeltaEventType type,
  }) = ContentBlockDeltaEvent;

  // ------------------------------------------
  // UNION: ContentBlockStopEvent
  // ------------------------------------------

  /// Union constructor for [ContentBlockStopEvent]
  const factory MessageStreamEvent.contentBlockStopEvent({
    /// No Description
    required int index,

    ///
    required ContentBlockStopEventType type,
  }) = ContentBlockStopEvent;

  /// Object construction from a JSON representation
  factory MessageStreamEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageStreamEventFromJson(json);
}

// ==========================================
// ENUM: MessageStartEventType
// ==========================================

/// No Description
enum MessageStartEventType {
  @JsonValue('message_start')
  messageStart,
}

// ==========================================
// ENUM: MessageDeltaEventType
// ==========================================

/// No Description
enum MessageDeltaEventType {
  @JsonValue('message_delta')
  messageDelta,
}

// ==========================================
// ENUM: MessageStopEventType
// ==========================================

/// No Description
enum MessageStopEventType {
  @JsonValue('message_stop')
  messageStop,
}

// ==========================================
// ENUM: ContentBlockStartEventType
// ==========================================

/// No Description
enum ContentBlockStartEventType {
  @JsonValue('content_block_start')
  contentBlockStart,
}

// ==========================================
// ENUM: ContentBlockDeltaEventType
// ==========================================

/// No Description
enum ContentBlockDeltaEventType {
  @JsonValue('content_block_delta')
  contentBlockDelta,
}

// ==========================================
// ENUM: ContentBlockStopEventType
// ==========================================

/// No Description
enum ContentBlockStopEventType {
  @JsonValue('content_block_stop')
  contentBlockStop,
}
