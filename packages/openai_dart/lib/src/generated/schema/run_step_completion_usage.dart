// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepCompletionUsage
// ==========================================

/// Usage statistics related to the run step. This value will be `null` while the run step's status is `in_progress`.
@freezed
class RunStepCompletionUsage with _$RunStepCompletionUsage {
  const RunStepCompletionUsage._();

  /// Factory constructor for RunStepCompletionUsage
  const factory RunStepCompletionUsage({
    /// Number of completion tokens used over the course of the run step.
    @JsonKey(name: 'completion_tokens') required int completionTokens,

    /// Number of prompt tokens used over the course of the run step.
    @JsonKey(name: 'prompt_tokens') required int promptTokens,

    /// Total number of tokens used (prompt + completion).
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _RunStepCompletionUsage;

  /// Object construction from a JSON representation
  factory RunStepCompletionUsage.fromJson(Map<String, dynamic> json) =>
      _$RunStepCompletionUsageFromJson(json);

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
