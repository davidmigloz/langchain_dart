// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDeltaStepDetailsToolCallsCodeOutputImage
// ==========================================

/// Code interpreter image output.
@freezed
class RunStepDeltaStepDetailsToolCallsCodeOutputImage
    with _$RunStepDeltaStepDetailsToolCallsCodeOutputImage {
  const RunStepDeltaStepDetailsToolCallsCodeOutputImage._();

  /// Factory constructor for RunStepDeltaStepDetailsToolCallsCodeOutputImage
  const factory RunStepDeltaStepDetailsToolCallsCodeOutputImage({
    /// The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
    @JsonKey(name: 'file_id', includeIfNull: false) String? fileId,
  }) = _RunStepDeltaStepDetailsToolCallsCodeOutputImage;

  /// Object construction from a JSON representation
  factory RunStepDeltaStepDetailsToolCallsCodeOutputImage.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDeltaStepDetailsToolCallsCodeOutputImageFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
    };
  }
}
