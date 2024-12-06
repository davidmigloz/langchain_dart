// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantStreamEvent
// ==========================================

/// Represents an event emitted when streaming a Run.
///
/// Each event in a server-sent events stream has an `event` and `data` property:
///
/// ```
/// event: thread.created
/// data: {"id": "thread_123", "object": "thread", ...}
/// ```
///
/// We emit events whenever a new object is created, transitions to a new state, or is being
/// streamed in parts (deltas). For example, we emit `thread.run.created` when a new run
/// is created, `thread.run.completed` when a run completes, and so on. When an Assistant chooses
/// to create a message during a run, we emit a `thread.message.created event`, a
/// `thread.message.in_progress` event, many `thread.message.delta` events, and finally a
/// `thread.message.completed` event.
///
/// We may add additional events over time, so we recommend handling unknown events gracefully
/// in your code. See the [Assistants API quickstart](https://platform.openai.com/docs/assistants/overview) to learn how to
/// integrate the Assistants API with streaming.
@Freezed(unionKey: 'event', unionValueCase: FreezedUnionCase.snake)
sealed class AssistantStreamEvent with _$AssistantStreamEvent {
  const AssistantStreamEvent._();

  // ------------------------------------------
  // UNION: ThreadStreamEvent
  // ------------------------------------------

  /// Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.

  const factory AssistantStreamEvent.threadStreamEvent({
    /// The type of the event.
    required EventType event,

    /// Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
    required ThreadObject data,
  }) = ThreadStreamEvent;

  // ------------------------------------------
  // UNION: RunStreamEvent
  // ------------------------------------------

  /// Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) changes state.

  const factory AssistantStreamEvent.runStreamEvent({
    /// The type of the event.
    required EventType event,

    /// Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
    required RunObject data,
  }) = RunStreamEvent;

  // ------------------------------------------
  // UNION: RunStepStreamEvent
  // ------------------------------------------

  /// Occurs when a new [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) changes state.

  const factory AssistantStreamEvent.runStepStreamEvent({
    /// The type of the event.
    required EventType event,

    /// Represents a step in execution of a run.
    required RunStepObject data,
  }) = RunStepStreamEvent;

  // ------------------------------------------
  // UNION: RunStepStreamDeltaEvent
  // ------------------------------------------

  /// Occurs when a new [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) changes state.

  const factory AssistantStreamEvent.runStepStreamDeltaEvent({
    /// The type of the event.
    required EventType event,

    /// Represents a run step delta i.e. any changed fields on a run step during streaming.
    required RunStepDeltaObject data,
  }) = RunStepStreamDeltaEvent;

  // ------------------------------------------
  // UNION: MessageStreamEvent
  // ------------------------------------------

  /// Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) changes state.

  const factory AssistantStreamEvent.messageStreamEvent({
    /// The type of the event.
    required EventType event,

    /// Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
    required MessageObject data,
  }) = MessageStreamEvent;

  // ------------------------------------------
  // UNION: MessageStreamDeltaEvent
  // ------------------------------------------

  /// Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) changes state.

  const factory AssistantStreamEvent.messageStreamDeltaEvent({
    /// The type of the event.
    required EventType event,

    /// Represents a message delta i.e. any changed fields on a message during streaming.
    required MessageDeltaObject data,
  }) = MessageStreamDeltaEvent;

  // ------------------------------------------
  // UNION: ErrorEvent
  // ------------------------------------------

  /// Occurs when an [error](https://platform.openai.com/docs/guides/error-codes/api-errors) occurs. This can happen due to an internal server error or a timeout.

  const factory AssistantStreamEvent.errorEvent({
    /// The type of the event.
    required EventType event,

    /// Represents an error that occurred during an API request.
    required Error data,
  }) = ErrorEvent;

  // ------------------------------------------
  // UNION: DoneEvent
  // ------------------------------------------

  /// Occurs when a stream ends.

  const factory AssistantStreamEvent.doneEvent({
    /// The type of the event.
    required EventType event,

    /// No Description
    required String data,
  }) = DoneEvent;

  /// Object construction from a JSON representation
  factory AssistantStreamEvent.fromJson(Map<String, dynamic> json) =>
      _$AssistantStreamEventFromJson(json);
}
