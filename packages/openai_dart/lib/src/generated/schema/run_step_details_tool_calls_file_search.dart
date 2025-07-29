// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsFileSearch
// ==========================================

/// The definition of the file search that was called.
@freezed
abstract class RunStepDetailsToolCallsFileSearch
    with _$RunStepDetailsToolCallsFileSearch {
  const RunStepDetailsToolCallsFileSearch._();

  /// Factory constructor for RunStepDetailsToolCallsFileSearch
  const factory RunStepDetailsToolCallsFileSearch({
    /// The ranking options for the file search.
    @JsonKey(name: 'ranking_options', includeIfNull: false)
    RunStepDetailsToolCallsFileSearchRankingOptionsObject? rankingOptions,

    /// The results of the file search.
    @JsonKey(includeIfNull: false)
    List<RunStepDetailsToolCallsFileSearchResultObject>? results,
  }) = _RunStepDetailsToolCallsFileSearch;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsFileSearch.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsFileSearchFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['ranking_options', 'results'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'ranking_options': rankingOptions,
      'results': results,
    };
  }
}
