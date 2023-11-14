// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CompletionChoice
// ==========================================

/// A choice the model generated for the input prompt.
@freezed
class CompletionChoice with _$CompletionChoice {
  const CompletionChoice._();

  /// Factory constructor for CompletionChoice
  const factory CompletionChoice({
    /// The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
    /// `length` if the maximum number of tokens specified in the request was reached,
    /// or `content_filter` if content was omitted due to a flag from our content filters.
    @JsonKey(
      name: 'finish_reason',
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    required CompletionFinishReason? finishReason,

    /// The index of the choice in the list of generated choices.
    required int index,

    /// The probabilities on the `logprobs` most likely tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
    required CompletionLogprobs? logprobs,

    /// The text of the completion.
    required String text,
  }) = _CompletionChoice;

  /// Object construction from a JSON representation
  factory CompletionChoice.fromJson(Map<String, dynamic> json) =>
      _$CompletionChoiceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'finish_reason',
    'index',
    'logprobs',
    'text'
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
      'logprobs': logprobs,
      'text': text,
    };
  }
}
