// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionResponseChoice
// ==========================================

/// A choice the model generated for the input prompt.
@freezed
class ChatCompletionResponseChoice with _$ChatCompletionResponseChoice {
  const ChatCompletionResponseChoice._();

  /// Factory constructor for ChatCompletionResponseChoice
  const factory ChatCompletionResponseChoice({
    /// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
    /// `length` if the maximum number of tokens specified in the request was reached,
    /// `content_filter` if content was omitted due to a flag from our content filters,
    /// `tool_calls` if the model called a tool, or `function_call` (deprecated) if the model called a function.
    @JsonKey(
      name: 'finish_reason',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    required ChatCompletionFinishReason? finishReason,

    /// The index of the choice in the list of choices.
    @JsonKey(includeIfNull: false) int? index,

    /// An assistant message in a chat conversation.
    required ChatCompletionAssistantMessage message,

    /// Log probability information for the choice.
    required ChatCompletionLogprobs? logprobs,
  }) = _ChatCompletionResponseChoice;

  /// Object construction from a JSON representation
  factory ChatCompletionResponseChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionResponseChoiceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'finish_reason',
    'index',
    'message',
    'logprobs'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'finish_reason': finishReason,
      'index': index,
      'message': message,
      'logprobs': logprobs,
    };
  }
}
