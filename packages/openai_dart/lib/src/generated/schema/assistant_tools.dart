// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: AssistantTools
// ==========================================

/// A tool that can be used by an assistant.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class AssistantTools with _$AssistantTools {
  const AssistantTools._();

  // ------------------------------------------
  // UNION: AssistantToolsCodeInterpreter
  // ------------------------------------------

  /// Code interpreter tool
  const factory AssistantTools.codeInterpreter({
    /// The type of tool being defined: `code_interpreter`
    @Default('code_interpreter') String type,
  }) = AssistantToolsCodeInterpreter;

  // ------------------------------------------
  // UNION: AssistantToolsFileSearch
  // ------------------------------------------

  /// FileSearch tool
  const factory AssistantTools.fileSearch({
    /// The type of tool being defined: `file_search`
    required String type,

    /// Overrides for the file search tool.
    @JsonKey(name: 'file_search', includeIfNull: false)
    AssistantToolsFileSearchFileSearch? fileSearch,
  }) = AssistantToolsFileSearch;

  // ------------------------------------------
  // UNION: AssistantToolsFunction
  // ------------------------------------------

  /// Function tool
  const factory AssistantTools.function({
    /// The type of tool being defined: `function`
    @Default('function') String type,

    /// A function that the model may call.
    required FunctionObject function,
  }) = AssistantToolsFunction;

  /// Object construction from a JSON representation
  factory AssistantTools.fromJson(Map<String, dynamic> json) =>
      _$AssistantToolsFromJson(json);
}

// ==========================================
// ENUM: AssistantToolsEnumType
// ==========================================

enum AssistantToolsEnumType {
  @JsonValue('code_interpreter')
  codeInterpreter,
  @JsonValue('file_search')
  fileSearch,
  @JsonValue('function')
  function,
}

// ==========================================
// CLASS: AssistantToolsFileSearchFileSearch
// ==========================================

/// Overrides for the file search tool.
@freezed
class AssistantToolsFileSearchFileSearch
    with _$AssistantToolsFileSearchFileSearch {
  const AssistantToolsFileSearchFileSearch._();

  /// Factory constructor for AssistantToolsFileSearchFileSearch
  const factory AssistantToolsFileSearchFileSearch({
    /// The maximum number of results the file search tool should output. The default is 20 for `gpt-4*` models
    /// and 5 for gpt-3.5-turbo. This number should be between 1 and 50 inclusive.
    ///
    /// Note that the file search tool may output fewer than `max_num_results` results. See the
    /// [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search/customizing-file-search-settings)
    /// for more information.
    @JsonKey(name: 'max_num_results', includeIfNull: false) int? maxNumResults,

    /// The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and
    /// a score_threshold of 0.
    ///
    /// See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search/customizing-file-search-settings)
    /// for more information.
    @JsonKey(name: 'ranking_options', includeIfNull: false)
    FileSearchRankingOptions? rankingOptions,
  }) = _AssistantToolsFileSearchFileSearch;

  /// Object construction from a JSON representation
  factory AssistantToolsFileSearchFileSearch.fromJson(
          Map<String, dynamic> json) =>
      _$AssistantToolsFileSearchFileSearchFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'max_num_results',
    'ranking_options'
  ];

  /// Validation constants
  static const maxNumResultsMinValue = 1;
  static const maxNumResultsMaxValue = 50;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (maxNumResults != null && maxNumResults! < maxNumResultsMinValue) {
      return "The value of 'maxNumResults' cannot be < $maxNumResultsMinValue";
    }
    if (maxNumResults != null && maxNumResults! > maxNumResultsMaxValue) {
      return "The value of 'maxNumResults' cannot be > $maxNumResultsMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'max_num_results': maxNumResults,
      'ranking_options': rankingOptions,
    };
  }
}
