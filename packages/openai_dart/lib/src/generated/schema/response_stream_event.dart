// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseStreamEvent
// ==========================================

/// Represents an event emitted when streaming a Response.
/// This will be one of the specific event types defined above, discriminated by the `event` property.
@Freezed(unionKey: 'event', unionValueCase: FreezedUnionCase.snake)
sealed class ResponseStreamEvent with _$ResponseStreamEvent {
  const ResponseStreamEvent._();

  // ------------------------------------------
  // UNION: ResponseCreatedEvent
  // ------------------------------------------

  /// Emitted when a response is created.

  const factory ResponseStreamEvent.responseCreatedEvent({
    /// The type of the event. Always `response.created`.
    required ResponseCreatedEventEvent event,

    /// The response that was created.
    required Response data,
  }) = ResponseCreatedEvent;

  // ------------------------------------------
  // UNION: ResponseInProgressEvent
  // ------------------------------------------

  /// Emitted when the response is in progress.

  const factory ResponseStreamEvent.responseInProgressEvent({
    /// The type of the event. Always `response.in_progress`.
    required ResponseInProgressEventEvent event,

    /// The response that is in progress.
    required Response response,
  }) = ResponseInProgressEvent;

  // ------------------------------------------
  // UNION: ResponseCompletedEvent
  // ------------------------------------------

  /// Emitted when the model response is complete.

  const factory ResponseStreamEvent.responseCompletedEvent({
    /// The type of the event. Always `response.completed`.
    required ResponseCompletedEventEvent event,

    /// Properties of the completed response.
    required Response response,
  }) = ResponseCompletedEvent;

  // ------------------------------------------
  // UNION: ResponseContentImageFileDeltaEvent
  // ------------------------------------------

  /// Emitted when there is a delta for an image file content part.

  const factory ResponseStreamEvent.responseContentImageFileDeltaEvent({
    /// The type of the event. Always `response.content_image_file.delta`.
    required ResponseContentImageFileDeltaEventEvent event,

    /// The ID of the output item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Image file output content.
    required OutputContentImageFile delta,
  }) = ResponseContentImageFileDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseContentImageFileDoneEvent
  // ------------------------------------------

  /// Emitted when an image file content part is done.

  const factory ResponseStreamEvent.responseContentImageFileDoneEvent({
    /// The type of the event. Always `response.content_image_file.done`.
    required ResponseContentImageFileDoneEventEvent event,

    /// The ID of the output item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// Image file output content.
    @JsonKey(name: 'image_file') required OutputContentImageFile imageFile,
  }) = ResponseContentImageFileDoneEvent;

  // ------------------------------------------
  // UNION: ResponseContentPartAddedEvent
  // ------------------------------------------

  /// Emitted when a new content part is added.

  const factory ResponseStreamEvent.responseContentPartAddedEvent({
    /// The type of the event. Always `response.content_part.added`.
    required ResponseContentPartAddedEventEvent event,

    /// The ID of the output item that the content part was added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the content part was added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that was added.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The content part that was added.
    /// Any of: [OutputContentText], [OutputContentImageFile], [OutputContentImage], [OutputContentAudio], [OutputContentVideo], [OutputContentRefusal], [OutputToolCall]
    required OutputContent part,
  }) = ResponseContentPartAddedEvent;

  // ------------------------------------------
  // UNION: ResponseContentPartDoneEvent
  // ------------------------------------------

  /// Emitted when a content part is done.

  const factory ResponseStreamEvent.responseContentPartDoneEvent({
    /// The type of the event. Always `response.content_part.done`.
    required ResponseContentPartDoneEventEvent event,

    /// The ID of the output item that the content part was added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the content part was added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that is done.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The content part that is done.
    /// Any of: [OutputContentText], [OutputContentImageFile], [OutputContentImage], [OutputContentAudio], [OutputContentVideo], [OutputContentRefusal], [OutputToolCall]
    required OutputContent part,
  }) = ResponseContentPartDoneEvent;

  // ------------------------------------------
  // UNION: ResponseDoneEvent
  // ------------------------------------------

  /// Occurs when a stream ends.

  const factory ResponseStreamEvent.responseDoneEvent({
    ///
    required ResponseDoneEventEvent event,

    ///
    required ResponseDoneEventData data,
  }) = ResponseDoneEvent;

  // ------------------------------------------
  // UNION: ResponseErrorEvent
  // ------------------------------------------

  /// Occurs when an error occurs. This can happen due to an internal server error or a timeout.

  const factory ResponseStreamEvent.responseErrorEvent({
    ///
    required ResponseErrorEventEvent event,

    /// Represents an error that occurred during an API request.
    required Error data,
  }) = ResponseErrorEvent;

  // ------------------------------------------
  // UNION: ResponseFailedEvent
  // ------------------------------------------

  /// An event that is emitted when a response fails.

  const factory ResponseStreamEvent.responseFailedEvent({
    /// The type of the event. Always `response.failed`.
    required ResponseFailedEventEvent event,

    /// The response that failed.
    required Response response,
  }) = ResponseFailedEvent;

  // ------------------------------------------
  // UNION: ResponseFileSearchCallCompletedEvent
  // ------------------------------------------

  /// Emitted when a file search call is completed (results found).

  const factory ResponseStreamEvent.responseFileSearchCallCompletedEvent({
    /// The type of the event. Always `response.file_search_call.completed`.
    required ResponseFileSearchCallCompletedEventEvent event,

    /// The index of the output item that the file search call is completed.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the file search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseFileSearchCallCompletedEvent;

  // ------------------------------------------
  // UNION: ResponseFileSearchCallInProgressEvent
  // ------------------------------------------

  /// Emitted when a file search call is initiated.

  const factory ResponseStreamEvent.responseFileSearchCallInProgressEvent({
    /// The type of the event. Always `response.file_search_call.in_progress`.
    required ResponseFileSearchCallInProgressEventEvent event,

    /// The index of the output item that the file search call is initiated.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the file search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseFileSearchCallInProgressEvent;

  // ------------------------------------------
  // UNION: ResponseFileSearchCallSearchingEvent
  // ------------------------------------------

  /// Emitted when a file search is currently searching.

  const factory ResponseStreamEvent.responseFileSearchCallSearchingEvent({
    /// The type of the event. Always `response.file_search_call.searching`.
    required ResponseFileSearchCallSearchingEventEvent event,

    /// The index of the output item that the file search call is searching.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the file search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseFileSearchCallSearchingEvent;

  // ------------------------------------------
  // UNION: ResponseFunctionCallArgumentsDeltaEvent
  // ------------------------------------------

  /// Emitted when there is a partial function-call arguments delta.

  const factory ResponseStreamEvent.responseFunctionCallArgumentsDeltaEvent({
    /// The type of the event. Always `response.function_call_arguments.delta`.
    required ResponseFunctionCallArgumentsDeltaEventEvent event,

    /// The ID of the output item that the function-call arguments delta is added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the function-call arguments delta is added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The function-call arguments delta that is added.
    required String delta,
  }) = ResponseFunctionCallArgumentsDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseFunctionCallArgumentsDoneEvent
  // ------------------------------------------

  /// Emitted when function-call arguments are finalized.

  const factory ResponseStreamEvent.responseFunctionCallArgumentsDoneEvent({
    ///
    required ResponseFunctionCallArgumentsDoneEventEvent event,

    /// The ID of the item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The function-call arguments.
    required String arguments,
  }) = ResponseFunctionCallArgumentsDoneEvent;

  // ------------------------------------------
  // UNION: ResponseIncompleteEvent
  // ------------------------------------------

  /// An event that is emitted when a response finishes as incomplete.

  const factory ResponseStreamEvent.responseIncompleteEvent({
    /// The type of the event. Always `response.incomplete`.
    required ResponseIncompleteEventEvent event,

    /// The response that was incomplete.
    required Response response,
  }) = ResponseIncompleteEvent;

  // ------------------------------------------
  // UNION: ResponseOutputItemAddedEvent
  // ------------------------------------------

  /// Emitted when a new output item is added.

  const factory ResponseStreamEvent.responseOutputItemAddedEvent({
    /// The type of the event. Always `response.output_item.added`.
    required ResponseOutputItemAddedEventEvent event,

    /// The index of the output item that was added.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The output item that was added.
    required OutputItem item,
  }) = ResponseOutputItemAddedEvent;

  // ------------------------------------------
  // UNION: ResponseOutputItemDoneEvent
  // ------------------------------------------

  /// Emitted when an output item is marked done.

  const factory ResponseStreamEvent.responseOutputItemDoneEvent({
    /// The type of the event. Always `response.output_item.done`.
    required ResponseOutputItemDoneEventEvent event,

    /// The index of the output item that was marked done.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The output item that was marked done.
    required OutputItem item,
  }) = ResponseOutputItemDoneEvent;

  // ------------------------------------------
  // UNION: ResponseReasoningSummaryPartAddedEvent
  // ------------------------------------------

  /// Emitted when a new reasoning summary part is added.

  const factory ResponseStreamEvent.responseReasoningSummaryPartAddedEvent({
    /// The type of the event. Always `response.reasoning_summary_part.added`.
    required ResponseReasoningSummaryPartAddedEventEvent event,

    /// The ID of the item this summary part is associated with.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item this summary part is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the summary part within the reasoning summary.
    @JsonKey(name: 'summary_index') required int summaryIndex,

    /// The summary part that was added.
    required ResponseReasoningSummaryPartAddedEventPart part,
  }) = ResponseReasoningSummaryPartAddedEvent;

  // ------------------------------------------
  // UNION: ResponseReasoningSummaryPartDoneEvent
  // ------------------------------------------

  /// Emitted when a reasoning summary part is completed.

  const factory ResponseStreamEvent.responseReasoningSummaryPartDoneEvent({
    /// The type of the event. Always `response.reasoning_summary_part.done`.
    required ResponseReasoningSummaryPartDoneEventEvent event,

    /// The ID of the item this summary part is associated with.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item this summary part is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the summary part within the reasoning summary.
    @JsonKey(name: 'summary_index') required int summaryIndex,

    /// The completed summary part.
    required ResponseReasoningSummaryPartDoneEventPart part,
  }) = ResponseReasoningSummaryPartDoneEvent;

  // ------------------------------------------
  // UNION: ResponseReasoningSummaryTextDeltaEvent
  // ------------------------------------------

  /// Emitted when a delta is added to a reasoning summary text.

  const factory ResponseStreamEvent.responseReasoningSummaryTextDeltaEvent({
    /// The type of the event. Always `response.reasoning_summary_text.delta`.
    required ResponseReasoningSummaryTextDeltaEventEvent event,

    /// The ID of the item this summary text delta is associated with.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item this summary text delta is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the summary part within the reasoning summary.
    @JsonKey(name: 'summary_index') required int summaryIndex,

    /// The text delta that was added to the summary.
    required String delta,
  }) = ResponseReasoningSummaryTextDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseReasoningSummaryTextDoneEvent
  // ------------------------------------------

  /// Emitted when a reasoning summary text is completed.

  const factory ResponseStreamEvent.responseReasoningSummaryTextDoneEvent({
    /// The type of the event. Always `response.reasoning_summary_text.done`.
    required ResponseReasoningSummaryTextDoneEventEvent event,

    /// The ID of the item this summary text is associated with.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item this summary text is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the summary part within the reasoning summary.
    @JsonKey(name: 'summary_index') required int summaryIndex,

    /// The full text of the completed reasoning summary.
    required String text,
  }) = ResponseReasoningSummaryTextDoneEvent;

  // ------------------------------------------
  // UNION: ResponseRefusalDeltaEvent
  // ------------------------------------------

  /// Emitted when there is a partial refusal text.

  const factory ResponseStreamEvent.responseRefusalDeltaEvent({
    /// The type of the event. Always `response.refusal.delta`.
    required ResponseRefusalDeltaEventEvent event,

    /// The ID of the output item that the refusal text is added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the refusal text is added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that the refusal text is added to.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The refusal text that is added.
    required String delta,
  }) = ResponseRefusalDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseRefusalDoneEvent
  // ------------------------------------------

  /// Emitted when refusal text is finalized.

  const factory ResponseStreamEvent.responseRefusalDoneEvent({
    /// The type of the event. Always `response.refusal.done`.
    required ResponseRefusalDoneEventEvent event,

    /// The ID of the output item that the refusal text is finalized.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the refusal text is finalized.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that the refusal text is finalized.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The refusal text that is finalized.
    required String refusal,
  }) = ResponseRefusalDoneEvent;

  // ------------------------------------------
  // UNION: ResponseTextAnnotationDeltaEvent
  // ------------------------------------------

  /// Emitted when a text annotation is added.

  const factory ResponseStreamEvent.responseTextAnnotationDeltaEvent({
    /// The type of the event. Always `response.output_text.annotation.added`.
    required ResponseTextAnnotationDeltaEventEvent event,

    /// The ID of the output item that the text annotation was added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the text annotation was added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that the text annotation was added to.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The index of the annotation that was added.
    @JsonKey(name: 'annotation_index') required int annotationIndex,

    /// A URL citation when using web search.
    required Annotation annotation,
  }) = ResponseTextAnnotationDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseTextDeltaEvent
  // ------------------------------------------

  /// Emitted when there is an additional text delta.

  const factory ResponseStreamEvent.responseTextDeltaEvent({
    /// The type of the event. Always `response.output_text.delta`.
    required ResponseTextDeltaEventEvent event,

    /// The ID of the output item that the text delta was added to.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the text delta was added to.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that the text delta was added to.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The text delta that was added.
    required String delta,
  }) = ResponseTextDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseTextDoneEvent
  // ------------------------------------------

  /// Emitted when text content is finalized.

  const factory ResponseStreamEvent.responseTextDoneEvent({
    /// The type of the event. Always `response.output_text.done`.
    required ResponseTextDoneEventEvent event,

    /// The ID of the output item that the text content is finalized.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item that the text content is finalized.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the content part that the text content is finalized.
    @JsonKey(name: 'content_index') required int contentIndex,

    /// The text content that is finalized.
    required String text,
  }) = ResponseTextDoneEvent;

  // ------------------------------------------
  // UNION: ResponseToolCallDeltaEvent
  // ------------------------------------------

  /// Emitted when there is a delta for a tool call.

  const factory ResponseStreamEvent.responseToolCallDeltaEvent({
    /// The type of the event. Always `response.tool_call.delta`.
    required ResponseToolCallDeltaEventEvent event,

    /// The ID of the output item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the tool call.
    @JsonKey(name: 'tool_call_index') required int toolCallIndex,

    /// The function called by the tool.
    required OutputToolCallFunction delta,
  }) = ResponseToolCallDeltaEvent;

  // ------------------------------------------
  // UNION: ResponseToolCallDoneEvent
  // ------------------------------------------

  /// Emitted when a tool call is done.

  const factory ResponseStreamEvent.responseToolCallDoneEvent({
    /// The type of the event. Always `response.tool_call.done`.
    required ResponseToolCallDoneEventEvent event,

    /// The ID of the output item.
    @JsonKey(name: 'item_id') required String itemId,

    /// The index of the output item.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// The index of the tool call.
    @JsonKey(name: 'tool_call_index') required int toolCallIndex,

    /// The function called by the tool.
    @JsonKey(name: 'tool_call') required OutputToolCallFunction toolCall,
  }) = ResponseToolCallDoneEvent;

  // ------------------------------------------
  // UNION: ResponseWebSearchCallCompletedEvent
  // ------------------------------------------

  /// Emitted when a web search call is completed.

  const factory ResponseStreamEvent.responseWebSearchCallCompletedEvent({
    /// The type of the event. Always `response.web_search_call.completed`.
    required ResponseWebSearchCallCompletedEventEvent event,

    /// The index of the output item that the web search call is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the web search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseWebSearchCallCompletedEvent;

  // ------------------------------------------
  // UNION: ResponseWebSearchCallInProgressEvent
  // ------------------------------------------

  /// Emitted when a web search call is initiated.

  const factory ResponseStreamEvent.responseWebSearchCallInProgressEvent({
    /// The type of the event. Always `response.web_search_call.in_progress`.
    required ResponseWebSearchCallInProgressEventEvent event,

    /// The index of the output item that the web search call is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the web search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseWebSearchCallInProgressEvent;

  // ------------------------------------------
  // UNION: ResponseWebSearchCallSearchingEvent
  // ------------------------------------------

  /// Emitted when a web search call is executing.

  const factory ResponseStreamEvent.responseWebSearchCallSearchingEvent({
    /// The type of the event. Always `response.web_search_call.searching`.
    required ResponseWebSearchCallSearchingEventEvent event,

    /// The index of the output item that the web search call is associated with.
    @JsonKey(name: 'output_index') required int outputIndex,

    /// Unique ID for the output item associated with the web search call.
    @JsonKey(name: 'item_id') required String itemId,
  }) = ResponseWebSearchCallSearchingEvent;

  /// Object construction from a JSON representation
  factory ResponseStreamEvent.fromJson(Map<String, dynamic> json) =>
      _$ResponseStreamEventFromJson(json);
}

// ==========================================
// ENUM: ResponseCreatedEventEvent
// ==========================================

/// The type of the event. Always `response.created`.
enum ResponseCreatedEventEvent {
  @JsonValue('response.created')
  responseCreated,
}

// ==========================================
// ENUM: ResponseInProgressEventEvent
// ==========================================

/// The type of the event. Always `response.in_progress`.
enum ResponseInProgressEventEvent {
  @JsonValue('response.in_progress')
  responseInProgress,
}

// ==========================================
// ENUM: ResponseCompletedEventEvent
// ==========================================

/// The type of the event. Always `response.completed`.
enum ResponseCompletedEventEvent {
  @JsonValue('response.completed')
  responseCompleted,
}

// ==========================================
// ENUM: ResponseContentImageFileDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.content_image_file.delta`.
enum ResponseContentImageFileDeltaEventEvent {
  @JsonValue('response.content_image_file.delta')
  responseContentImageFileDelta,
}

// ==========================================
// ENUM: ResponseContentImageFileDoneEventEvent
// ==========================================

/// The type of the event. Always `response.content_image_file.done`.
enum ResponseContentImageFileDoneEventEvent {
  @JsonValue('response.content_image_file.done')
  responseContentImageFileDone,
}

// ==========================================
// ENUM: ResponseContentPartAddedEventEvent
// ==========================================

/// The type of the event. Always `response.content_part.added`.
enum ResponseContentPartAddedEventEvent {
  @JsonValue('response.content_part.added')
  responseContentPartAdded,
}

// ==========================================
// ENUM: ResponseContentPartDoneEventEvent
// ==========================================

/// The type of the event. Always `response.content_part.done`.
enum ResponseContentPartDoneEventEvent {
  @JsonValue('response.content_part.done')
  responseContentPartDone,
}

// ==========================================
// ENUM: ResponseDoneEventEvent
// ==========================================

/// No Description
enum ResponseDoneEventEvent {
  @JsonValue('done')
  done,
}

// ==========================================
// ENUM: ResponseDoneEventData
// ==========================================

/// No Description
enum ResponseDoneEventData {
  @JsonValue('DONE_MARKER')
  doneMarker,
}

// ==========================================
// ENUM: ResponseErrorEventEvent
// ==========================================

/// No Description
enum ResponseErrorEventEvent {
  @JsonValue('error')
  error,
}

// ==========================================
// ENUM: ResponseFailedEventEvent
// ==========================================

/// The type of the event. Always `response.failed`.
enum ResponseFailedEventEvent {
  @JsonValue('response.failed')
  responseFailed,
}

// ==========================================
// ENUM: ResponseFileSearchCallCompletedEventEvent
// ==========================================

/// The type of the event. Always `response.file_search_call.completed`.
enum ResponseFileSearchCallCompletedEventEvent {
  @JsonValue('response.file_search_call.completed')
  responseFileSearchCallCompleted,
}

// ==========================================
// ENUM: ResponseFileSearchCallInProgressEventEvent
// ==========================================

/// The type of the event. Always `response.file_search_call.in_progress`.
enum ResponseFileSearchCallInProgressEventEvent {
  @JsonValue('response.file_search_call.in_progress')
  responseFileSearchCallInProgress,
}

// ==========================================
// ENUM: ResponseFileSearchCallSearchingEventEvent
// ==========================================

/// The type of the event. Always `response.file_search_call.searching`.
enum ResponseFileSearchCallSearchingEventEvent {
  @JsonValue('response.file_search_call.searching')
  responseFileSearchCallSearching,
}

// ==========================================
// ENUM: ResponseFunctionCallArgumentsDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.function_call_arguments.delta`.
enum ResponseFunctionCallArgumentsDeltaEventEvent {
  @JsonValue('response.function_call_arguments.delta')
  responseFunctionCallArgumentsDelta,
}

// ==========================================
// ENUM: ResponseFunctionCallArgumentsDoneEventEvent
// ==========================================

/// No Description
enum ResponseFunctionCallArgumentsDoneEventEvent {
  @JsonValue('response.function_call_arguments.done')
  responseFunctionCallArgumentsDone,
}

// ==========================================
// ENUM: ResponseIncompleteEventEvent
// ==========================================

/// The type of the event. Always `response.incomplete`.
enum ResponseIncompleteEventEvent {
  @JsonValue('response.incomplete')
  responseIncomplete,
}

// ==========================================
// ENUM: ResponseOutputItemAddedEventEvent
// ==========================================

/// The type of the event. Always `response.output_item.added`.
enum ResponseOutputItemAddedEventEvent {
  @JsonValue('response.output_item.added')
  responseOutputItemAdded,
}

// ==========================================
// ENUM: ResponseOutputItemDoneEventEvent
// ==========================================

/// The type of the event. Always `response.output_item.done`.
enum ResponseOutputItemDoneEventEvent {
  @JsonValue('response.output_item.done')
  responseOutputItemDone,
}

// ==========================================
// ENUM: ResponseReasoningSummaryPartAddedEventEvent
// ==========================================

/// The type of the event. Always `response.reasoning_summary_part.added`.
enum ResponseReasoningSummaryPartAddedEventEvent {
  @JsonValue('response.reasoning_summary_part.added')
  responseReasoningSummaryPartAdded,
}

// ==========================================
// CLASS: ResponseReasoningSummaryPartAddedEventPart
// ==========================================

/// The summary part that was added.
@freezed
class ResponseReasoningSummaryPartAddedEventPart
    with _$ResponseReasoningSummaryPartAddedEventPart {
  const ResponseReasoningSummaryPartAddedEventPart._();

  /// Factory constructor for ResponseReasoningSummaryPartAddedEventPart
  const factory ResponseReasoningSummaryPartAddedEventPart({
    /// The type of the summary part. Always `summary_text`.
    required ResponseReasoningSummaryPartAddedEventPartType type,

    /// The text of the summary part.
    required String text,
  }) = _ResponseReasoningSummaryPartAddedEventPart;

  /// Object construction from a JSON representation
  factory ResponseReasoningSummaryPartAddedEventPart.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseReasoningSummaryPartAddedEventPartFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
    };
  }
}

// ==========================================
// ENUM: ResponseReasoningSummaryPartAddedEventPartType
// ==========================================

/// The type of the summary part. Always `summary_text`.
enum ResponseReasoningSummaryPartAddedEventPartType {
  @JsonValue('summary_text')
  summaryText,
}

// ==========================================
// ENUM: ResponseReasoningSummaryPartDoneEventEvent
// ==========================================

/// The type of the event. Always `response.reasoning_summary_part.done`.
enum ResponseReasoningSummaryPartDoneEventEvent {
  @JsonValue('response.reasoning_summary_part.done')
  responseReasoningSummaryPartDone,
}

// ==========================================
// CLASS: ResponseReasoningSummaryPartDoneEventPart
// ==========================================

/// The completed summary part.
@freezed
class ResponseReasoningSummaryPartDoneEventPart
    with _$ResponseReasoningSummaryPartDoneEventPart {
  const ResponseReasoningSummaryPartDoneEventPart._();

  /// Factory constructor for ResponseReasoningSummaryPartDoneEventPart
  const factory ResponseReasoningSummaryPartDoneEventPart({
    /// The type of the summary part. Always `summary_text`.
    required ResponseReasoningSummaryPartDoneEventPartType type,

    /// The text of the summary part.
    required String text,
  }) = _ResponseReasoningSummaryPartDoneEventPart;

  /// Object construction from a JSON representation
  factory ResponseReasoningSummaryPartDoneEventPart.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseReasoningSummaryPartDoneEventPartFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
    };
  }
}

// ==========================================
// ENUM: ResponseReasoningSummaryPartDoneEventPartType
// ==========================================

/// The type of the summary part. Always `summary_text`.
enum ResponseReasoningSummaryPartDoneEventPartType {
  @JsonValue('summary_text')
  summaryText,
}

// ==========================================
// ENUM: ResponseReasoningSummaryTextDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.reasoning_summary_text.delta`.
enum ResponseReasoningSummaryTextDeltaEventEvent {
  @JsonValue('response.reasoning_summary_text.delta')
  responseReasoningSummaryTextDelta,
}

// ==========================================
// ENUM: ResponseReasoningSummaryTextDoneEventEvent
// ==========================================

/// The type of the event. Always `response.reasoning_summary_text.done`.
enum ResponseReasoningSummaryTextDoneEventEvent {
  @JsonValue('response.reasoning_summary_text.done')
  responseReasoningSummaryTextDone,
}

// ==========================================
// ENUM: ResponseRefusalDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.refusal.delta`.
enum ResponseRefusalDeltaEventEvent {
  @JsonValue('response.refusal.delta')
  responseRefusalDelta,
}

// ==========================================
// ENUM: ResponseRefusalDoneEventEvent
// ==========================================

/// The type of the event. Always `response.refusal.done`.
enum ResponseRefusalDoneEventEvent {
  @JsonValue('response.refusal.done')
  responseRefusalDone,
}

// ==========================================
// ENUM: ResponseTextAnnotationDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.output_text.annotation.added`.
enum ResponseTextAnnotationDeltaEventEvent {
  @JsonValue('response.output_text.annotation.added')
  responseOutputTextAnnotationAdded,
}

// ==========================================
// ENUM: ResponseTextDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.output_text.delta`.
enum ResponseTextDeltaEventEvent {
  @JsonValue('response.output_text.delta')
  responseOutputTextDelta,
}

// ==========================================
// ENUM: ResponseTextDoneEventEvent
// ==========================================

/// The type of the event. Always `response.output_text.done`.
enum ResponseTextDoneEventEvent {
  @JsonValue('response.output_text.done')
  responseOutputTextDone,
}

// ==========================================
// ENUM: ResponseToolCallDeltaEventEvent
// ==========================================

/// The type of the event. Always `response.tool_call.delta`.
enum ResponseToolCallDeltaEventEvent {
  @JsonValue('response.tool_call.delta')
  responseToolCallDelta,
}

// ==========================================
// ENUM: ResponseToolCallDoneEventEvent
// ==========================================

/// The type of the event. Always `response.tool_call.done`.
enum ResponseToolCallDoneEventEvent {
  @JsonValue('response.tool_call.done')
  responseToolCallDone,
}

// ==========================================
// ENUM: ResponseWebSearchCallCompletedEventEvent
// ==========================================

/// The type of the event. Always `response.web_search_call.completed`.
enum ResponseWebSearchCallCompletedEventEvent {
  @JsonValue('response.web_search_call.completed')
  responseWebSearchCallCompleted,
}

// ==========================================
// ENUM: ResponseWebSearchCallInProgressEventEvent
// ==========================================

/// The type of the event. Always `response.web_search_call.in_progress`.
enum ResponseWebSearchCallInProgressEventEvent {
  @JsonValue('response.web_search_call.in_progress')
  responseWebSearchCallInProgress,
}

// ==========================================
// ENUM: ResponseWebSearchCallSearchingEventEvent
// ==========================================

/// The type of the event. Always `response.web_search_call.searching`.
enum ResponseWebSearchCallSearchingEventEvent {
  @JsonValue('response.web_search_call.searching')
  responseWebSearchCallSearching,
}
