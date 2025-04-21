// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of openai_realtime_schema;

// ==========================================
// ENUM: RealtimeEventType
// ==========================================

/// The type of the event.
enum RealtimeEventType {
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
  @JsonValue('conversation.item.input_audio_transcription.delta')
  conversationItemInputAudioTranscriptionDelta,
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
  @JsonValue('all')
  all,
  @JsonValue('server.all')
  serverAll,
  @JsonValue('client.all')
  clientAll,
}
