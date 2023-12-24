// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: RunStepDetailsToolCallsCodeOutputImage
// ==========================================

/// Code interpreter image output.
@freezed
class RunStepDetailsToolCallsCodeOutputImage
    with _$RunStepDetailsToolCallsCodeOutputImage {
  const RunStepDetailsToolCallsCodeOutputImage._();

  /// Factory constructor for RunStepDetailsToolCallsCodeOutputImage
  const factory RunStepDetailsToolCallsCodeOutputImage({
    /// The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _RunStepDetailsToolCallsCodeOutputImage;

  /// Object construction from a JSON representation
  factory RunStepDetailsToolCallsCodeOutputImage.fromJson(
          Map<String, dynamic> json) =>
      _$RunStepDetailsToolCallsCodeOutputImageFromJson(json);

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
