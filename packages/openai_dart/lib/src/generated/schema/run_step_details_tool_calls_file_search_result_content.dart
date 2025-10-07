// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsFileSearchResultContent
// ==========================================

/// The content of the result that was found.
@freezed
abstract class RunStepDetailsToolCallsFileSearchResultContent
    with _$RunStepDetailsToolCallsFileSearchResultContent {
  const RunStepDetailsToolCallsFileSearchResultContent._();

  /// Factory constructor for RunStepDetailsToolCallsFileSearchResultContent
  const factory RunStepDetailsToolCallsFileSearchResultContent({
    /// The type of the content.
    @Default('text') String type,

    /// The text content of the file.
    @JsonKey(includeIfNull: false) String? text,
  }) = _RunStepDetailsToolCallsFileSearchResultContent;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsFileSearchResultContent.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsFileSearchResultContentFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'text'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
    };
  }
}
