// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunCompletionUsage
// ==========================================

/// Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in_progress`, `queued`, etc.).
@freezed
class RunCompletionUsage with _$RunCompletionUsage {
  const RunCompletionUsage._();

  /// Factory constructor for RunCompletionUsage
  const factory RunCompletionUsage({
    /// Number of completion tokens used over the course of the run.
    @JsonKey(name: 'completion_tokens') required int completionTokens,

    /// Number of prompt tokens used over the course of the run.
    @JsonKey(name: 'prompt_tokens') required int promptTokens,

    /// Total number of tokens used (prompt + completion).
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _RunCompletionUsage;

  /// Object construction from a JSON representation
  factory RunCompletionUsage.fromJson(Map<String, dynamic> json) =>
      _$RunCompletionUsageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'completion_tokens',
    'prompt_tokens',
    'total_tokens'
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
    };
  }
}
