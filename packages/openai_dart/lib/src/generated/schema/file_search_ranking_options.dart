// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: FileSearchRankingOptions
// ==========================================

/// The ranking options for the file search.
///
/// See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search/customizing-file-search-settings)
/// for more information.
@freezed
class FileSearchRankingOptions with _$FileSearchRankingOptions {
  const FileSearchRankingOptions._();

  /// Factory constructor for FileSearchRankingOptions
  const factory FileSearchRankingOptions({
    /// The ranker to use for the file search. If not specified will use the `auto` ranker.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    FileSearchRanker? ranker,

    /// The score threshold for the file search. All values must be a floating point number between 0 and 1.
    @JsonKey(name: 'score_threshold', includeIfNull: false)
    double? scoreThreshold,
  }) = _FileSearchRankingOptions;

  /// Object construction from a JSON representation
  factory FileSearchRankingOptions.fromJson(Map<String, dynamic> json) =>
      _$FileSearchRankingOptionsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['ranker', 'score_threshold'];

  /// Validation constants
  static const scoreThresholdMinValue = 0.0;
  static const scoreThresholdMaxValue = 1.0;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (scoreThreshold != null && scoreThreshold! < scoreThresholdMinValue) {
      return "The value of 'scoreThreshold' cannot be < $scoreThresholdMinValue";
    }
    if (scoreThreshold != null && scoreThreshold! > scoreThresholdMaxValue) {
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
