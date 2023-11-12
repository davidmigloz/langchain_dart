// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionTokenTopLogprob
// ==========================================

/// Most likely tokens and their log probability, at this token position.
@freezed
class ChatCompletionTokenTopLogprob with _$ChatCompletionTokenTopLogprob {
  const ChatCompletionTokenTopLogprob._();

  /// Factory constructor for ChatCompletionTokenTopLogprob
  const factory ChatCompletionTokenTopLogprob({
    /// The token.
    required String token,

    /// The log probability of this token.
    required double logprob,

    /// A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
    required List<int>? bytes,
  }) = _ChatCompletionTokenTopLogprob;

  /// Object construction from a JSON representation
  factory ChatCompletionTokenTopLogprob.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionTokenTopLogprobFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['token', 'logprob', 'bytes'];

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
    };
  }
}
