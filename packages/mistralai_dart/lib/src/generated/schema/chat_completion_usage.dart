// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of mistral_a_i_schema;

// ==========================================
// CLASS: ChatCompletionUsage
// ==========================================

/// The usage statistics for this completion.
@freezed
class ChatCompletionUsage with _$ChatCompletionUsage {
  const ChatCompletionUsage._();

  /// Factory constructor for ChatCompletionUsage
  const factory ChatCompletionUsage({
    /// The number of tokens in the prompt.
    @JsonKey(name: 'prompt_tokens') required int promptTokens,

    /// The number of tokens in the completion.
    @JsonKey(name: 'completion_tokens') required int completionTokens,

    /// The total number of tokens generated.
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _ChatCompletionUsage;

  /// Object construction from a JSON representation
  factory ChatCompletionUsage.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'prompt_tokens',
    'completion_tokens',
    'total_tokens'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
    };
  }
}
