// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsFileSearchResultObject
// ==========================================

/// A result instance of the file search.
@freezed
class RunStepDetailsToolCallsFileSearchResultObject
    with _$RunStepDetailsToolCallsFileSearchResultObject {
  const RunStepDetailsToolCallsFileSearchResultObject._();

  /// Factory constructor for RunStepDetailsToolCallsFileSearchResultObject
  const factory RunStepDetailsToolCallsFileSearchResultObject({
    /// The ID of the file that result was found in.
    @JsonKey(name: 'file_id') required String fileId,

    /// The name of the file that result was found in.
    @JsonKey(name: 'file_name') required String fileName,

    /// The score of the result. All values must be a floating point number between 0 and 1.
    required double score,

    /// The content of the result that was found. The content is only included if requested via the include
    /// query parameter.
    @JsonKey(includeIfNull: false)
    List<RunStepDetailsToolCallsFileSearchResultContent>? content,
  }) = _RunStepDetailsToolCallsFileSearchResultObject;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsFileSearchResultObject.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsFileSearchResultObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'file_id',
    'file_name',
    'score',
    'content'
  ];

  /// Validation constants
  static const scoreMinValue = 0.0;
  static const scoreMaxValue = 1.0;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (score < scoreMinValue) {
      return "The value of 'score' cannot be < $scoreMinValue";
    }
    if (score > scoreMaxValue) {
      return "The value of 'score' cannot be > $scoreMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
      'file_name': fileName,
      'score': score,
      'content': content,
    };
  }
}
