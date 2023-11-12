// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionTokenLogprob
// ==========================================

/// Log probability information for a token.
@freezed
class ChatCompletionTokenLogprob with _$ChatCompletionTokenLogprob {
  const ChatCompletionTokenLogprob._();

  /// Factory constructor for ChatCompletionTokenLogprob
  const factory ChatCompletionTokenLogprob({
    /// The token.
    required String token,

    /// The log probability of this token.
    required double logprob,

    /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
    required List<int>? bytes,

    /// List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top_logprobs` returned.
    @JsonKey(name: 'top_logprobs')
    required List<ChatCompletionTokenTopLogprob> topLogprobs,
  }) = _ChatCompletionTokenLogprob;

  /// Object construction from a JSON representation
  factory ChatCompletionTokenLogprob.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionTokenLogprobFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'token',
    'logprob',
    'bytes',
    'top_logprobs'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'logprob': logprob,
      'bytes': bytes,
      'top_logprobs': topLogprobs,
    };
  }
}
