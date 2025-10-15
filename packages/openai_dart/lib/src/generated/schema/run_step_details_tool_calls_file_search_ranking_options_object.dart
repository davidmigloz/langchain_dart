// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsFileSearchRankingOptionsObject
// ==========================================

/// The ranking options for the file search.
@freezed
abstract class RunStepDetailsToolCallsFileSearchRankingOptionsObject
    with _$RunStepDetailsToolCallsFileSearchRankingOptionsObject {
  const RunStepDetailsToolCallsFileSearchRankingOptionsObject._();

  /// Factory constructor for RunStepDetailsToolCallsFileSearchRankingOptionsObject
  const factory RunStepDetailsToolCallsFileSearchRankingOptionsObject({
    /// The ranker to use for the file search. If not specified will use the `auto` ranker.
    required FileSearchRanker ranker,

    /// The score threshold for the file search. All values must be a floating point number between 0 and 1.
    @JsonKey(name: 'score_threshold') required double scoreThreshold,
  }) = _RunStepDetailsToolCallsFileSearchRankingOptionsObject;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsFileSearchRankingOptionsObject.fromJson(
    Map<String, dynamic> json,
  ) => _$RunStepDetailsToolCallsFileSearchRankingOptionsObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['ranker', 'score_threshold'];

  /// Validation constants
  static const scoreThresholdMinValue = 0.0;
  static const scoreThresholdMaxValue = 1.0;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (scoreThreshold < scoreThresholdMinValue) {
      return "The value of 'scoreThreshold' cannot be < $scoreThresholdMinValue";
    }
    if (scoreThreshold > scoreThresholdMaxValue) {
      return "The value of 'scoreThreshold' cannot be > $scoreThresholdMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'ranker': ranker,
      'score_threshold': scoreThreshold,
    };
  }
}
