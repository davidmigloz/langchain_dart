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

  /// Add a new Item to the Conversation's context, including messages, function calls, and function call
  /// responses. This event can be used both to populate a "history" of the conversation and to add new
  /// items mid-stream, but has the current limitation that it cannot populate assistant audio messages.
  ///
  /// If successful, the server will respond with a `conversation.item.created` event, otherwise an `error`
  /// event will be sent.

  @FreezedUnionValue('conversation.item.create')
  const factory RealtimeEvent.conversationItemCreate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemCreate) RealtimeEventType type,

    /// The ID of the preceding item after which the new item will be inserted. If not set, the new item
    /// will be appended to the end of the conversation. If set, it allows an item to be inserted
    /// mid-conversation. If the ID cannot be found, an error will be returned and the item will not be
    /// added.
    @JsonKey(name: 'previous_item_id', includeIfNull: false)
    String? previousItemId,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventConversationItemCreate;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemDelete
  // ------------------------------------------

  /// Send this event when you want to remove any item from the conversation history. The server will
  /// respond with a `conversation.item.deleted` event, unless the item does not exist in the conversation
  /// history, in which case the server will respond with an error.

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

  /// Send this event to truncate a previous assistant message's audio. The server will produce audio faster
  /// than realtime, so this event is useful when the user interrupts to truncate audio that has already
  /// been sent to the client but not yet played. This will synchronize the server's understanding of the
  /// audio with the client's playback.
  ///
  /// Truncating audio will delete the server-side text transcript to ensure there is not text in the
  /// context that hasn't been heard by the user.
  ///
  /// If successful, the server will respond with a `conversation.item.truncated` event.

  @FreezedUnionValue('conversation.item.truncate')
  const factory RealtimeEvent.conversationItemTruncate({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemTruncate) RealtimeEventType type,

    /// The ID of the assistant message item to truncate. Only assistant message items can be truncated.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part to truncate. Set this to 0.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Inclusive duration up to which audio is truncated, in milliseconds. If the audio_end_ms is greater
    /// than the actual audio duration, the server will respond with an error.
    @JsonKey(name: 'audio_end_ms') required int audioEndMs,
  }) = RealtimeEventConversationItemTruncate;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferAppend
  // ------------------------------------------

  /// Send this event to append audio bytes to the input audio buffer. The audio buffer is temporary storage
  /// you can write to and later commit. In Server VAD mode, the audio buffer is used to detect speech and
  /// the server will decide when to commit. When Server VAD is disabled, you must commit the audio buffer
  /// manually.
  ///
  /// The client may choose how much audio to place in each event up to a maximum of 15 MiB, for example
  /// streaming smaller chunks from the client may allow the VAD to be more responsive. Unlike made other
  /// client events, the server will not send a confirmation response to this event.

  @FreezedUnionValue('input_audio_buffer.append')
  const factory RealtimeEvent.inputAudioBufferAppend({
    /// Optional client-generated ID used to identify this event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferAppend) RealtimeEventType type,

    /// Base64-encoded audio bytes. This must be in the format specified by the `input_audio_format` field
    /// in the session configuration.
    required String audio,
  }) = RealtimeEventInputAudioBufferAppend;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferClear
  // ------------------------------------------

  /// Send this event to clear the audio bytes in the buffer. The server will respond with an
  /// `input_audio_buffer.cleared` event.

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

  /// Send this event to commit the user input audio buffer, which will create a new user message item in
  /// the conversation. This event will produce an error if the input audio buffer is empty. When in Server
  /// VAD mode, the client does not need to send this event, the server will commit the audio buffer
  /// automatically.
  ///
  /// Committing the input audio buffer will trigger input audio transcription (if enabled in session
  /// configuration), but it will not create a response from the model. The server will respond with an
  /// `input_audio_buffer.committed` event.

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

  /// Send this event to cancel an in-progress response. The server will respond with a `response.cancelled`
  /// event or an error if there is no response to cancel.

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

  /// This event instructs the server to create a Response, which means triggering model inference. When in
  /// Server VAD mode, the server will create Responses automatically.
  ///
  /// A Response will include at least one Item, and may have two, in which case the second will be a
  /// function call. These Items will be appended to the conversation history.
  ///
  /// The server will respond with a `response.created` event, events for Items and content created, and
  /// finally a `response.done` event to indicate the Response is complete.
  ///
  /// The `response.create` event includes inference configuration like `instructions`, and `temperature`.
  /// These fields will override the Session's configuration for this Response only.

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

  /// Send this event to update the session's default configuration. The client may send this event at any
  /// time to update the session configuration, and any field may be updated at any time, except for
  /// "voice". The server will respond with a `session.updated` event that shows the full effective
  /// configuration. Only fields that are present are updated, thus the correct way to clear a field like
  /// "instructions" is to pass an empty string.

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

  /// Returned when a conversation item is created. There are several scenarios that produce this event:
  ///   - The server is generating a Response, which if successful will produce either one or two Items, which will
  ///     be of type `message` (role `assistant`) or type `function_call`.
  ///   - The input audio buffer has been committed, either by the client or the server (in `server_vad` mode). The
  ///     server will take the content of the input audio buffer and add it to a new user message Item.
  ///   - The client has sent a `conversation.item.create` event to add a new Item to the Conversation.

  @FreezedUnionValue('conversation.item.created')
  const factory RealtimeEvent.conversationItemCreated({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemCreated) RealtimeEventType type,

    /// The ID of the preceding item in the Conversation context, allows the client to understand the
    /// order of the conversation.
    @JsonKey(name: 'previous_item_id') required String? previousItemId,

    /// The item to add to the conversation.
    /// Any of: [ItemMessage], [ItemFunctionCall], [ItemFunctionCallOutput]
    required Item item,
  }) = RealtimeEventConversationItemCreated;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemDeleted
  // ------------------------------------------

  /// Returned when an item in the conversation is deleted by the client with a `conversation.item.delete`
  /// event. This event is used to synchronize the server's understanding of the conversation history with
  /// the client's view.

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

  /// This event is the output of audio transcription for user audio written to the user audio buffer.
  /// Transcription begins when the input audio buffer is committed by the client or server (in `server_vad`
  /// mode). Transcription runs asynchronously with Response creation, so this event may come before or
  /// after the Response events.
  ///
  /// Realtime API models accept audio natively, and thus input transcription is a separate process run on a
  /// separate ASR (Automatic Speech Recognition) model, currently always `whisper-1`. Thus the transcript
  /// may diverge somewhat from the model's interpretation, and should be treated as a rough guide.

  @FreezedUnionValue('conversation.item.input_audio_transcription.completed')
  const factory RealtimeEvent.conversationItemInputAudioTranscriptionCompleted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.conversationItemInputAudioTranscriptionCompleted)
    RealtimeEventType type,

    /// The ID of the user message item containing the audio.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the content part containing the audio.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The transcribed text.
    required String transcript,
  }) = RealtimeEventConversationItemInputAudioTranscriptionCompleted;

  // ------------------------------------------
  // UNION: RealtimeEventConversationItemInputAudioTranscriptionFailed
  // ------------------------------------------

  /// Returned when input audio transcription is configured, and a transcription request for a user message
  /// failed. These events are separate from other `error` events so that the client can identify the
  /// related Item.

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

  /// Returned when an earlier assistant audio message item is truncated by the client with a
  /// `conversation.item.truncate` event. This event is used to synchronize the server's understanding of
  /// the audio with the client's playback.
  ///
  /// This action will truncate the audio and remove the server-side text transcript to ensure there is no
  /// text in the context that hasn't been heard by the user.

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

  /// Returned when an error occurs, which could be a client problem or a server problem. Most errors are
  /// recoverable and the session will stay open, we recommend to implementors to monitor and log error
  /// messages by default.

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

  /// Returned when the input audio buffer is cleared by the client with a `input_audio_buffer.clear` event.

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

  /// Returned when an input audio buffer is committed, either by the client or automatically in server VAD
  /// mode. The `item_id` property is the ID of the user message item that will be created, thus a
  /// `conversation.item.created` event will also be sent to the client.

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

  /// Sent by the server when in `server_vad` mode to indicate that speech has been detected in the audio
  /// buffer. This can happen any time audio is added to the buffer (unless speech is already detected). The
  /// client may want to use this event to interrupt audio playback or provide visual feedback to the user.
  /// The client should expect to receive a `input_audio_buffer.speech_stopped` event when speech stops. The
  /// `item_id` property is the ID of the user message item that will be created when speech stops and will
  /// also be included in the `input_audio_buffer.speech_stopped` event (unless the client manually commits
  /// the audio buffer during VAD activation).

  @FreezedUnionValue('input_audio_buffer.speech_started')
  const factory RealtimeEvent.inputAudioBufferSpeechStarted({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferSpeechStarted)
    RealtimeEventType type,

    /// Milliseconds from the start of all audio written to the buffer during the session when speech was
    /// first detected. This will correspond to the beginning of audio sent to the model, and thus
    /// includes the `prefix_padding_ms` configured in the Session.
    @JsonKey(name: 'audio_start_ms') required int audioStartMs,

    /// The ID of the user message item that will be created when speech stops.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventInputAudioBufferSpeechStarted;

  // ------------------------------------------
  // UNION: RealtimeEventInputAudioBufferSpeechStopped
  // ------------------------------------------

  /// Returned in `server_vad` mode when the server detects the end of speech in the audio buffer. The
  /// server will also send an `conversation.item.created` event with the user message item that is created
  /// from the audio buffer.

  @FreezedUnionValue('input_audio_buffer.speech_stopped')
  const factory RealtimeEvent.inputAudioBufferSpeechStopped({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.inputAudioBufferSpeechStopped)
    RealtimeEventType type,

    /// Milliseconds since the session started when speech stopped. This will correspond to the end of
    /// audio sent to the model, and thus includes the `min_silence_duration_ms` configured in the
    /// Session.
    @JsonKey(name: 'audio_end_ms') required int audioEndMs,

    /// The ID of the user message item that will be created.
    @JsonKey(name: 'item_id') required String itemId,
  }) = RealtimeEventInputAudioBufferSpeechStopped;

  // ------------------------------------------
  // UNION: RealtimeEventRateLimitsUpdated
  // ------------------------------------------

  /// Emitted at the beginning of a Response to indicate the updated rate limits. When a Response is created
  /// some tokens will be "reserved" for the output tokens, the rate limits shown here reflect that
  /// reservation, which is then adjusted accordingly once the Response is completed.

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

  /// Returned when a new Response is created. The first event of response creation, where the response is
  /// in an initial state of `in_progress`.

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

  /// Returned when a Response is done streaming. Always emitted, no matter the final state. The Response
  /// object included in the `response.done` event will include all output Items in the Response but will
  /// omit the raw audio data.

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

  /// Returned when a new Item is created during Response generation.

  @FreezedUnionValue('response.output_item.added')
  const factory RealtimeEvent.responseOutputItemAdded({
    /// The unique ID of the server event.
    @JsonKey(name: 'event_id') required String eventId,

    /// The type of the event.
    @Default(RealtimeEventType.responseOutputItemAdded) RealtimeEventType type,

    /// The ID of the Response to which the item belongs.
    @JsonKey(name: 'response_id') required String responseId,

    /// The index of the output item in the Response.
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

    /// The ID of the Response to which the item belongs.
    @JsonKey(name: 'response_id') required String responseId,

    /// The index of the output item in the Response.
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

  /// Returned when a Session is created. Emitted automatically when a new connection is established as the
  /// first server event. This event will contain the default Session configuration.

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

  /// Returned when a session is updated with a `session.update` event, unless there is an error.

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
