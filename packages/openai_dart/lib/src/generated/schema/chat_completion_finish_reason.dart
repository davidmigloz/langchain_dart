// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// ENUM: ChatCompletionFinishReason
// ==========================================

/// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
/// `length` if the maximum number of tokens specified in the request was reached,
/// `content_filter` if content was omitted due to a flag from our content filters,
/// `tool_calls` if the model called a tool, or `function_call` (deprecated) if the model called a function.
enum ChatCompletionFinishReason {
  @JsonValue('stop')
  stop,
  @JsonValue('length')
  length,
  @JsonValue('tool_calls')
  toolCalls,
  @JsonValue('content_filter')
  contentFilter,
  @JsonValue('function_call')
  functionCall,
}
