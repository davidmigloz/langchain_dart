// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: EventType
// ==========================================

/// The type of the event.
enum EventType {
  @JsonValue('thread.created')
  threadCreated,
  @JsonValue('thread.run.created')
  threadRunCreated,
  @JsonValue('thread.run.queued')
  threadRunQueued,
  @JsonValue('thread.run.in_progress')
  threadRunInProgress,
  @JsonValue('thread.run.requires_action')
  threadRunRequiresAction,
  @JsonValue('thread.run.completed')
  threadRunCompleted,
  @JsonValue('thread.run.failed')
  threadRunFailed,
  @JsonValue('thread.run.cancelling')
  threadRunCancelling,
  @JsonValue('thread.run.cancelled')
  threadRunCancelled,
  @JsonValue('thread.run.expired')
  threadRunExpired,
  @JsonValue('thread.run.step.created')
  threadRunStepCreated,
  @JsonValue('thread.run.step.in_progress')
  threadRunStepInProgress,
  @JsonValue('thread.run.step.delta')
  threadRunStepDelta,
  @JsonValue('thread.run.step.completed')
  threadRunStepCompleted,
  @JsonValue('thread.run.step.failed')
  threadRunStepFailed,
  @JsonValue('thread.run.step.cancelled')
  threadRunStepCancelled,
  @JsonValue('thread.run.step.expired')
  threadRunStepExpired,
  @JsonValue('thread.message.created')
  threadMessageCreated,
  @JsonValue('thread.message.in_progress')
  threadMessageInProgress,
  @JsonValue('thread.message.delta')
  threadMessageDelta,
  @JsonValue('thread.message.completed')
  threadMessageCompleted,
  @JsonValue('thread.message.failed')
  threadMessageFailed,
  @JsonValue('error')
  error,
  @JsonValue('done')
  done,
}
