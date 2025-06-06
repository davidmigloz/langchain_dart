// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CompletionUsage
// ==========================================

/// Usage statistics for the completion request.
@freezed
class CompletionUsage with _$CompletionUsage {
  const CompletionUsage._();

  /// Factory constructor for CompletionUsage
  const factory CompletionUsage({
    /// Number of tokens in the generated completion.
    @JsonKey(name: 'completion_tokens', includeIfNull: false)
    int? completionTokens,

    /// Number of tokens in the prompt.
    @JsonKey(name: 'prompt_tokens', includeIfNull: false) int? promptTokens,

    /// Total number of tokens used in the request (prompt + completion).
    @JsonKey(name: 'total_tokens', includeIfNull: false) int? totalTokens,

    /// Breakdown of tokens used in a completion.
    @JsonKey(name: 'completion_tokens_details', includeIfNull: false)
    CompletionTokensDetails? completionTokensDetails,
  }) = _CompletionUsage;

  /// Object construction from a JSON representation
  factory CompletionUsage.fromJson(Map<String, dynamic> json) =>
      _$CompletionUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'completion_tokens',
    'prompt_tokens',
    'total_tokens',
    'completion_tokens_details'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'completion_tokens': completionTokens,
      'prompt_tokens': promptTokens,
      'total_tokens': totalTokens,
      'completion_tokens_details': completionTokensDetails,
    };
  }
}
