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
    /// or `function_call` if the model called a function.
    @JsonKey(name: 'finish_reason')
    required ChatCompletionFinishReason finishReason,

    /// The index of the choice in the list of choices.
    required int index,

    /// A message in a chat conversation.
    required ChatCompletionMessage message,
  }) = _ChatCompletionResponseChoice;

  /// Object construction from a JSON representation
  factory ChatCompletionResponseChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionResponseChoiceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'finish_reason',
    'index',
    'message'
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
    };
  }
}
