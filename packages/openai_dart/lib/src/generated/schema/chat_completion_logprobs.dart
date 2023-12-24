// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChatCompletionLogprobs
// ==========================================

/// Log probability information for the choice.
@freezed
class ChatCompletionLogprobs with _$ChatCompletionLogprobs {
  const ChatCompletionLogprobs._();

  /// Factory constructor for ChatCompletionLogprobs
  const factory ChatCompletionLogprobs({
    /// A list of message content tokens with log probability information.
    required List<ChatCompletionTokenLogprob>? content,
  }) = _ChatCompletionLogprobs;

  /// Object construction from a JSON representation
  factory ChatCompletionLogprobs.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionLogprobsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['content'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }
}
