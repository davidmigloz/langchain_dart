// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// CLASS: RealtimeEvent
// ==========================================

/// A Realtime API event.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class RealtimeEvent with _$RealtimeEvent {
  const RealtimeEvent._();

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemCreate
  // ------------------------------------------

  /// Send this event when adding an item to the conversation.

  @FreezedUnionValue('conversation.item.create')
  const factory RealtimeEvent.conversationItemCreate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemCreate) RealtimeEventType type,

    /// The ID of the preceding item after which the new item will be inserted.
    @JsonKey(name: 'previous_item_id', includeIfNull: false)
    String? previousItemId,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventConversationItemCreate;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemDelete
  // ------------------------------------------

  /// Send this event when you want to remove any item from the conversation history.

  @FreezedUnionValue('conversation.item.delete')
  const factory RealtimeEvent.conversationItemDelete({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemDelete) RealtimeEventType type,

    /// The ID of the item to delete.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventConversationItemDelete;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemTruncate
  // ------------------------------------------

  /// Send this event when you want to truncate a previous assistant message’s audio.

  @FreezedUnionValue('conversation.item.truncate')
  const factory RealtimeEvent.conversationItemTruncate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemTruncate) RealtimeEventType type,

    /// The ID of the assistant message item to truncate.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part to truncate.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Inclusive duration up to which audio is truncated, in milliseconds.
    @JsonKey(name: 'audio_end_ms') required int audioEndMs,
  }) = RealtimeEventConversationItemTruncate;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferAppend
  // ------------------------------------------

  /// Send this event to append audio bytes to the input audio buffer.

  @FreezedUnionValue('input_audio_buffer.append')
  const factory RealtimeEvent.inputAudioBufferAppend({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferAppend) RealtimeEventType type,

    /// Base64-encoded audio bytes.
    required String audio,
  }) = RealtimeEventInputAudioBufferAppend;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferClear
  // ------------------------------------------

  /// Send this event to clear the audio bytes in the buffer.

  @FreezedUnionValue('input_audio_buffer.clear')
  const factory RealtimeEvent.inputAudioBufferClear({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferClear) RealtimeEventType type,
  }) = RealtimeEventInputAudioBufferClear;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferCommit
  // ------------------------------------------

  /// Send this event to commit audio bytes to a user message.

  @FreezedUnionValue('input_audio_buffer.commit')
  const factory RealtimeEvent.inputAudioBufferCommit({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferCommit) RealtimeEventType type,
  }) = RealtimeEventInputAudioBufferCommit;

  // ------------------------------------------
  // UNION: RealtimeEventResponseCancel
  // ------------------------------------------

  /// Send this event to cancel an in-progress response.

  @FreezedUnionValue('response.cancel')
  const factory RealtimeEvent.responseCancel({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseCancel) RealtimeEventType type,
  }) = RealtimeEventResponseCancel;

  // ------------------------------------------
  // UNION: RealtimeEventResponseCreate
  // ------------------------------------------

  /// Send this event to trigger a response generation.

  @FreezedUnionValue('response.create')
  const factory RealtimeEvent.responseCreate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseCreate) RealtimeEventType type,

    /// Configuration for the response.
    @JsonKey(includeIfNull: false) ResponseConfig? response,
  }) = RealtimeEventResponseCreate;

  // ------------------------------------------
  // UNION: RealtimeEventSessionUpdate
  // ------------------------------------------

  /// Send this event to update the session’s default configuration.

  @FreezedUnionValue('session.update')
  const factory RealtimeEvent.sessionUpdate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id', includeIfNull: false) String? eventId,

    /// The type of the event.
    @Default(RealtimeEventType.sessionUpdate) RealtimeEventType type,

    /// Session configuration to update.
    required SessionConfig session,
  }) = RealtimeEventSessionUpdate;

  // ------------------------------------------
  // UNION: RealtimeEventConversationCreated
  // ------------------------------------------

  /// Returned when a conversation is created. Emitted right after session creation.

  @FreezedUnionValue('conversation.created')
  const factory RealtimeEvent.conversationCreated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationCreated) RealtimeEventType type,

    /// The conversation resource.
    required Conversation conversation,
  }) = RealtimeEventConversationCreated;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemCreated
  // ------------------------------------------

  /// Returned when a conversation item is created.

  @FreezedUnionValue('conversation.item.created')
  const factory RealtimeEvent.conversationItemCreated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemCreated) RealtimeEventType type,

    /// The ID of the preceding item.
    @JsonKey(name: 'previous_item_id') required String? previousItemId,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventConversationItemCreated;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemDeleted
  // ------------------------------------------

  /// Returned when an item in the conversation is deleted.

  @FreezedUnionValue('conversation.item.deleted')
  const factory RealtimeEvent.conversationItemDeleted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemDeleted) RealtimeEventType type,

    /// The ID of the item that was deleted.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventConversationItemDeleted;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemInputAudioTranscriptionCompleted
  // ------------------------------------------

  /// Returned when input audio transcription is enabled and a transcription succeeds.

  @FreezedUnionValue('conversation.item.input_audio_transcription.completed')
  const factory RealtimeEvent.conversationItemInputAudioTranscriptionCompleted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemInputAudioTranscriptionCompleted)
    RealtimeEventType type,

    /// The ID of the user message item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part containing the audio.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The transcribed text.
    required String transcript,
  }) = RealtimeEventConversationItemInputAudioTranscriptionCompleted;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemInputAudioTranscriptionFailed
  // ------------------------------------------

  /// Returned when input audio transcription is configured, and a transcription request for a user message failed.

  @FreezedUnionValue('conversation.item.input_audio_transcription.failed')
  const factory RealtimeEvent.conversationItemInputAudioTranscriptionFailed({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemInputAudioTranscriptionFailed)
    RealtimeEventType type,

    /// The ID of the user message item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part containing the audio.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Details of the transcription error.
    required TranscriptionError error,
  }) = RealtimeEventConversationItemInputAudioTranscriptionFailed;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemTruncated
  // ------------------------------------------

  /// Returned when an earlier assistant audio message item is truncated by the client.

  @FreezedUnionValue('conversation.item.truncated')
  const factory RealtimeEvent.conversationItemTruncated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemTruncated)
    RealtimeEventType type,

    /// The ID of the assistant message item that was truncated.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part that was truncated.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The duration up to which the audio was truncated, in milliseconds.
    @JsonKey(name: 'audio_end_ms') required int audioEndMs,
  }) = RealtimeEventConversationItemTruncated;

  // ------------------------------------------
  // UNION: RealtimeEventError
  // ------------------------------------------

  /// Returned when an error occurs.

  @FreezedUnionValue('error')
  const factory RealtimeEvent.error({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.error) RealtimeEventType type,

    /// Details of the API error.
    required APIError error,
  }) = RealtimeEventError;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferCleared
  // ------------------------------------------

  /// Returned when the input audio buffer is cleared by the client.

  @FreezedUnionValue('input_audio_buffer.cleared')
  const factory RealtimeEvent.inputAudioBufferCleared({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferCleared) RealtimeEventType type,
  }) = RealtimeEventInputAudioBufferCleared;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferCommitted
  // ------------------------------------------

  /// Returned when an input audio buffer is committed, either by the client or automatically in server VAD mode.

  @FreezedUnionValue('input_audio_buffer.committed')
  const factory RealtimeEvent.inputAudioBufferCommitted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferCommitted)
    RealtimeEventType type,

    /// The ID of the preceding item after which the new item will be inserted.
    @JsonKey(name: 'previous_item_id') required String previousItemId,

    /// The ID of the user message item that will be created.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventInputAudioBufferCommitted;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferSpeechStarted
  // ------------------------------------------

  /// Returned in server turn detection mode when speech is detected.

  @FreezedUnionValue('input_audio_buffer.speech_started')
  const factory RealtimeEvent.inputAudioBufferSpeechStarted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferSpeechStarted)
    RealtimeEventType type,

    /// Milliseconds since the session started when speech was detected.
    @JsonKey(name: 'audio_start_ms') required int audioStartMs,

    /// The ID of the user message item that will be created when speech stops.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventInputAudioBufferSpeechStarted;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferSpeechStopped
  // ------------------------------------------

  /// Returned in server turn detection mode when speech stops.

  @FreezedUnionValue('input_audio_buffer.speech_stopped')
  const factory RealtimeEvent.inputAudioBufferSpeechStopped({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferSpeechStopped)
    RealtimeEventType type,

    /// Milliseconds since the session started when speech stopped.
    @JsonKey(name: 'audio_end_ms') required int audioEndMs,

    /// The ID of the user message item that will be created.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventInputAudioBufferSpeechStopped;

  // ------------------------------------------
  // UNION: RealtimeEventRateLimitsUpdated
  // ------------------------------------------

  /// Emitted after every "response.done" event to indicate the updated rate limits.

  @FreezedUnionValue('rate_limits.updated')
  const factory RealtimeEvent.rateLimitsUpdated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.rateLimitsUpdated) RealtimeEventType type,

    /// List of rate limit information.
    @JsonKey(name: 'rate_limits') required List<RateLimit> rateLimits,
  }) = RealtimeEventRateLimitsUpdated;

  // ------------------------------------------
  // UNION: RealtimeEventResponseAudioDelta
  // ------------------------------------------

  /// Returned when the model-generated audio is updated.

  @FreezedUnionValue('response.audio.delta')
  const factory RealtimeEvent.responseAudioDelta({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseAudioDelta) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Base64-encoded audio data delta.
    required String delta,
  }) = RealtimeEventResponseAudioDelta;

  // ------------------------------------------
  // UNION: RealtimeEventResponseAudioDone
  // ------------------------------------------

  /// Returned when the model-generated audio is done. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.audio.done')
  const factory RealtimeEvent.responseAudioDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseAudioDone) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,
  }) = RealtimeEventResponseAudioDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseAudioTranscriptDelta
  // ------------------------------------------

  /// Returned when the model-generated transcription of audio output is updated.

  @FreezedUnionValue('response.audio_transcript.delta')
  const factory RealtimeEvent.responseAudioTranscriptDelta({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseAudioTranscriptDelta)
    RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The transcript delta.
    required String delta,
  }) = RealtimeEventResponseAudioTranscriptDelta;

  // ------------------------------------------
  // UNION: RealtimeEventResponseAudioTranscriptDone
  // ------------------------------------------

  /// Returned when the model-generated transcription of audio output is done streaming. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.audio_transcript.done')
  const factory RealtimeEvent.responseAudioTranscriptDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseAudioTranscriptDone)
    RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The final transcript of the audio.
    required String transcript,
  }) = RealtimeEventResponseAudioTranscriptDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseContentPartAdded
  // ------------------------------------------

  /// Returned when a new content part is added to an assistant message item during response generation.

  @FreezedUnionValue('response.content_part.added')
  const factory RealtimeEvent.responseContentPartAdded({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseContentPartAdded) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item to which the content part was added.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// A part of the content.
    /// Any of: [ContentPartInputText], [ContentPartInputAudio], [ContentPartText], [ContentPartAudio]
    required ContentPart part,
  }) = RealtimeEventResponseContentPartAdded;

  // ------------------------------------------
  // UNION: RealtimeEventResponseContentPartDone
  // ------------------------------------------

  /// Returned when a content part is done streaming in an assistant message item. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.content_part.done')
  const factory RealtimeEvent.responseContentPartDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseContentPartDone) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// A part of the content.
    /// Any of: [ContentPartInputText], [ContentPartInputAudio], [ContentPartText], [ContentPartAudio]
    required ContentPart part,
  }) = RealtimeEventResponseContentPartDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseCreated
  // ------------------------------------------

  /// Returned when a new Response is created. The first event of response creation, where the response is in an initial state of "in_progress".

  @FreezedUnionValue('response.created')
  const factory RealtimeEvent.responseCreated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseCreated) RealtimeEventType type,

    /// The response resource.
    required Response response,
  }) = RealtimeEventResponseCreated;

  // ------------------------------------------
  // UNION: RealtimeEventResponseDone
  // ------------------------------------------

  /// Returned when a Response is done streaming. Always emitted, no matter the final state.

  @FreezedUnionValue('response.done')
  const factory RealtimeEvent.responseDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseDone) RealtimeEventType type,

    /// The response resource.
    required Response response,
  }) = RealtimeEventResponseDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseFunctionCallArgumentsDelta
  // ------------------------------------------

  /// Returned when the model-generated function call arguments are updated.

  @FreezedUnionValue('response.function_call_arguments.delta')
  const factory RealtimeEvent.responseFunctionCallArgumentsDelta({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseFunctionCallArgumentsDelta)
    RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the function call item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The ID of the function call.
    @JsonKey(name: 'call_id') required String callId,

    /// The arguments delta as a JSON string.
    required String delta,
  }) = RealtimeEventResponseFunctionCallArgumentsDelta;

  // ------------------------------------------
  // UNION: RealtimeEventResponseFunctionCallArgumentsDone
  // ------------------------------------------

  /// Returned when the model-generated function call arguments are done streaming. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.function_call_arguments.done')
  const factory RealtimeEvent.responseFunctionCallArgumentsDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseFunctionCallArgumentsDone)
    RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the function call item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The ID of the function call.
    @JsonKey(name: 'call_id') required String callId,

    /// The final arguments as a JSON string.
    required String arguments,
  }) = RealtimeEventResponseFunctionCallArgumentsDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseOutputItemAdded
  // ------------------------------------------

  /// Returned when a new Item is created during response generation.

  @FreezedUnionValue('response.output_item.added')
  const factory RealtimeEvent.responseOutputItemAdded({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseOutputItemAdded) RealtimeEventType type,

    /// The ID of the response to which the item belongs.
    @JsonKey(name: 'response_id') required String responseId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventResponseOutputItemAdded;

  // ------------------------------------------
  // UNION: RealtimeEventResponseOutputItemDone
  // ------------------------------------------

  /// Returned when an Item is done streaming. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.output_item.done')
  const factory RealtimeEvent.responseOutputItemDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseOutputItemDone) RealtimeEventType type,

    /// The ID of the response to which the item belongs.
    @JsonKey(name: 'response_id') required String responseId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventResponseOutputItemDone;

  // ------------------------------------------
  // UNION: RealtimeEventResponseTextDelta
  // ------------------------------------------

  /// Returned when the text value of a "text" content part is updated.

  @FreezedUnionValue('response.text.delta')
  const factory RealtimeEvent.responseTextDelta({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseTextDelta) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The text delta.
    required String delta,
  }) = RealtimeEventResponseTextDelta;

  // ------------------------------------------
  // UNION: RealtimeEventResponseTextDone
  // ------------------------------------------

  /// Returned when the text value of a "text" content part is done streaming. Also emitted when a Response is interrupted, incomplete, or cancelled.

  @FreezedUnionValue('response.text.done')
  const factory RealtimeEvent.responseTextDone({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseTextDone) RealtimeEventType type,

    /// The ID of the response.
    @JsonKey(name: 'response_id') required String responseId,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item in the response.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part in the item's content array.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The final text content.
    required String text,
  }) = RealtimeEventResponseTextDone;

  // ------------------------------------------
  // UNION: RealtimeEventSessionCreated
  // ------------------------------------------

  /// Returned when a session is created. Emitted automatically when a new connection is established.

  @FreezedUnionValue('session.created')
  const factory RealtimeEvent.sessionCreated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.sessionCreated) RealtimeEventType type,

    /// The session resource.
    required Session session,
  }) = RealtimeEventSessionCreated;

  // ------------------------------------------
  // UNION: RealtimeEventSessionUpdated
  // ------------------------------------------

  /// Returned when a session is updated.

  @FreezedUnionValue('session.updated')
  const factory RealtimeEvent.sessionUpdated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.sessionUpdated) RealtimeEventType type,

    /// The session resource.
    required Session session,
  }) = RealtimeEventSessionUpdated;

  // ------------------------------------------
  // UNION: RealtimeEventClose
  // ------------------------------------------

  /// The websocket connection was closed.

  @FreezedUnionValue('close')
  const factory RealtimeEvent.close({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.close) RealtimeEventType type,

    /// Whether the close was due to an error.
    required bool error,
  }) = RealtimeEventClose;

  // ------------------------------------------
  // UNION: RealtimeEventConversationInterrupted
  // ------------------------------------------

  /// The conversation was interrupted.

  @FreezedUnionValue('conversation.interrupted')
  const factory RealtimeEvent.conversationInterrupted({
    /// The unique ID of the event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationInterrupted) RealtimeEventType type,
  }) = RealtimeEventConversationInterrupted;

  // ------------------------------------------
  // UNION: RealtimeEventConversationUpdated
  // ------------------------------------------

  /// The conversation was updated.

  @FreezedUnionValue('conversation.updated')
  const factory RealtimeEvent.conversationUpdated({
    /// The unique ID of the event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationUpdated) RealtimeEventType type,

    /// No Description
    required EventHandlerResult result,
  }) = RealtimeEventConversationUpdated;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemAppended
  // ------------------------------------------

  /// An item was appended to the conversation.

  @FreezedUnionValue('conversation.item.appended')
  const factory RealtimeEvent.conversationItemAppended({
    /// The unique ID of the event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemAppended) RealtimeEventType type,

    /// A formatted item.
    required FormattedItem item,
  }) = RealtimeEventConversationItemAppended;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemCompleted
  // ------------------------------------------

  /// An item was completed.

  @FreezedUnionValue('conversation.item.completed')
  const factory RealtimeEvent.conversationItemCompleted({
    /// The unique ID of the event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemCompleted)
    RealtimeEventType type,

    /// A formatted item.
    required FormattedItem item,
  }) = RealtimeEventConversationItemCompleted;

  // ------------------------------------------
  // UNION: RealtimeEventGeneric
  // ------------------------------------------

  /// A generic realtime event.

  @FreezedUnionValue('realtime.event')
  const factory RealtimeEvent.generic({
    /// The unique ID of the event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.realtimeEvent) RealtimeEventType type,

    /// A Realtime API event.
    /// Any of: [RealtimeEventConversationItemCreate], [RealtimeEventConversationItemDelete], [RealtimeEventConversationItemTruncate], [RealtimeEventInputAudioBufferAppend], [RealtimeEventInputAudioBufferClear], [RealtimeEventInputAudioBufferCommit], [RealtimeEventResponseCancel], [RealtimeEventResponseCreate], [RealtimeEventSessionUpdate], [RealtimeEventConversationCreated], [RealtimeEventConversationItemCreated], [RealtimeEventConversationItemDeleted], [RealtimeEventConversationItemInputAudioTranscriptionCompleted], [RealtimeEventConversationItemInputAudioTranscriptionFailed], [RealtimeEventConversationItemTruncated], [RealtimeEventError], [RealtimeEventInputAudioBufferCleared], [RealtimeEventInputAudioBufferCommitted], [RealtimeEventInputAudioBufferSpeechStarted], [RealtimeEventInputAudioBufferSpeechStopped], [RealtimeEventRateLimitsUpdated], [RealtimeEventResponseAudioDelta], [RealtimeEventResponseAudioDone], [RealtimeEventResponseAudioTranscriptDelta], [RealtimeEventResponseAudioTranscriptDone], [RealtimeEventResponseContentPartAdded], [RealtimeEventResponseContentPartDone], [RealtimeEventResponseCreated], [RealtimeEventResponseDone], [RealtimeEventResponseFunctionCallArgumentsDelta], [RealtimeEventResponseFunctionCallArgumentsDone], [RealtimeEventResponseOutputItemAdded], [RealtimeEventResponseOutputItemDone], [RealtimeEventResponseTextDelta], [RealtimeEventResponseTextDone], [RealtimeEventSessionCreated], [RealtimeEventSessionUpdated], [RealtimeEventClose], [RealtimeEventConversationInterrupted], [RealtimeEventConversationUpdated], [RealtimeEventConversationItemAppended], [RealtimeEventConversationItemCompleted], [RealtimeEventGeneric]
    required RealtimeEvent event,
  }) = RealtimeEventGeneric;

  /// Object construction from a JSON representation
  factory RealtimeEvent.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventFromJson(json);
}

// ==========================================
// ENUM: RealtimeEventEnumType
// ==========================================

enum RealtimeEventEnumType {
  @JsonValue('conversation.item.create')
  conversationItemCreate,
  @JsonValue('conversation.item.delete')
  conversationItemDelete,
  @JsonValue('conversation.item.truncate')
  conversationItemTruncate,
  @JsonValue('input_audio_buffer.append')
  inputAudioBufferAppend,
  @JsonValue('input_audio_buffer.clear')
  inputAudioBufferClear,
  @JsonValue('input_audio_buffer.commit')
  inputAudioBufferCommit,
  @JsonValue('response.cancel')
  responseCancel,
  @JsonValue('response.create')
  responseCreate,
  @JsonValue('session.update')
  sessionUpdate,
  @JsonValue('conversation.created')
  conversationCreated,
  @JsonValue('conversation.item.created')
  conversationItemCreated,
  @JsonValue('conversation.item.deleted')
  conversationItemDeleted,
  @JsonValue('conversation.item.input_audio_transcription.completed')
  conversationItemInputAudioTranscriptionCompleted,
  @JsonValue('conversation.item.input_audio_transcription.failed')
  conversationItemInputAudioTranscriptionFailed,
  @JsonValue('conversation.item.truncated')
  conversationItemTruncated,
  @JsonValue('error')
  error,
  @JsonValue('input_audio_buffer.cleared')
  inputAudioBufferCleared,
  @JsonValue('input_audio_buffer.committed')
  inputAudioBufferCommitted,
  @JsonValue('input_audio_buffer.speech_started')
  inputAudioBufferSpeechStarted,
  @JsonValue('input_audio_buffer.speech_stopped')
  inputAudioBufferSpeechStopped,
  @JsonValue('rate_limits.updated')
  rateLimitsUpdated,
  @JsonValue('response.audio.delta')
  responseAudioDelta,
  @JsonValue('response.audio.done')
  responseAudioDone,
  @JsonValue('response.audio_transcript.delta')
  responseAudioTranscriptDelta,
  @JsonValue('response.audio_transcript.done')
  responseAudioTranscriptDone,
  @JsonValue('response.content_part.added')
  responseContentPartAdded,
  @JsonValue('response.content_part.done')
  responseContentPartDone,
  @JsonValue('response.created')
  responseCreated,
  @JsonValue('response.done')
  responseDone,
  @JsonValue('response.function_call_arguments.delta')
  responseFunctionCallArgumentsDelta,
  @JsonValue('response.function_call_arguments.done')
  responseFunctionCallArgumentsDone,
  @JsonValue('response.output_item.added')
  responseOutputItemAdded,
  @JsonValue('response.output_item.done')
  responseOutputItemDone,
  @JsonValue('response.text.delta')
  responseTextDelta,
  @JsonValue('response.text.done')
  responseTextDone,
  @JsonValue('session.created')
  sessionCreated,
  @JsonValue('session.updated')
  sessionUpdated,
  @JsonValue('close')
  close,
  @JsonValue('conversation.interrupted')
  conversationInterrupted,
  @JsonValue('conversation.updated')
  conversationUpdated,
  @JsonValue('conversation.item.appended')
  conversationItemAppended,
  @JsonValue('conversation.item.completed')
  conversationItemCompleted,
  @JsonValue('realtime.event')
  realtimeEvent,
}
