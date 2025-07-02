/// The reason the model stopped generating tokens.
enum FinishReason {
  /// The model hit a natural stop point or a provided stop sequence.
  ///
  /// Some providers call this "end_turn".
  stop,

  /// The maximum number of tokens specified in the request was reached.
  ///
  /// Some providers call this "max_tokens".
  length,

  /// The content was flagged for content filter reasons.
  contentFilter,

  /// The content content was flagged for recitation reasons.
  recitation,

  /// The model called a tool.
  ///
  /// Some providers call this "tool_use".
  toolCalls,

  /// The finish reason is unspecified.
  unspecified,
}
