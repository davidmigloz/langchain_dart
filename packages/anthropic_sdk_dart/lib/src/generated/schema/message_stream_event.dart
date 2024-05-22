// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageStreamEvent
// ==========================================

/// A event in a streaming conversation.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageStreamEvent with _$MessageStreamEvent {
  const MessageStreamEvent._();

  // ------------------------------------------
  // UNION: MessageStartEvent
  // ------------------------------------------

  /// A start event in a streaming conversation.
  const factory MessageStreamEvent.messageStart({
    /// A message in a chat conversation.
    required Message message,

    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = MessageStartEvent;

  // ------------------------------------------
  // UNION: MessageDeltaEvent
  // ------------------------------------------

  /// A delta event in a streaming conversation.
  const factory MessageStreamEvent.messageDelta({
    /// No Description
    required MessageDelta delta,

    /// The type of a streaming event.
    required MessageStreamEventType type,

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

  /// A stop event in a streaming conversation.
  const factory MessageStreamEvent.messageStop({
    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = MessageStopEvent;

  // ------------------------------------------
  // UNION: ContentBlockStartEvent
  // ------------------------------------------

  /// A start event in a streaming content block.
  const factory MessageStreamEvent.contentBlockStart({
    /// A block of text content.
    @JsonKey(name: 'content_block') required TextBlock contentBlock,

    /// The index of the content block.
    required int index,

    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = ContentBlockStartEvent;

  // ------------------------------------------
  // UNION: ContentBlockDeltaEvent
  // ------------------------------------------

  /// A delta event in a streaming content block.
  const factory MessageStreamEvent.contentBlockDelta({
    /// A delta in a streaming text block.
    required TextBlockDelta delta,

    /// The index of the content block.
    required int index,

    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = ContentBlockDeltaEvent;

  // ------------------------------------------
  // UNION: ContentBlockStopEvent
  // ------------------------------------------

  /// A stop event in a streaming content block.
  const factory MessageStreamEvent.contentBlockStop({
    /// The index of the content block.
    required int index,

    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = ContentBlockStopEvent;

  // ------------------------------------------
  // UNION: PingEvent
  // ------------------------------------------

  /// A ping event in a streaming conversation.
  const factory MessageStreamEvent.ping({
    /// The type of a streaming event.
    required MessageStreamEventType type,
  }) = PingEvent;

  /// Object construction from a JSON representation
  factory MessageStreamEvent.fromJson(Map<String, dynamic> json) =>
      _$MessageStreamEventFromJson(json);
}
