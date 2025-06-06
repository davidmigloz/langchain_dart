// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseContentTextAnnotationsFilePath
// ==========================================

/// A file path annotation for response text.
@freezed
class ResponseContentTextAnnotationsFilePath
    with _$ResponseContentTextAnnotationsFilePath {
  const ResponseContentTextAnnotationsFilePath._();

  /// Factory constructor for ResponseContentTextAnnotationsFilePath
  const factory ResponseContentTextAnnotationsFilePath({
    /// The ID of the file.
    @JsonKey(name: 'file_id') required String fileId,
  }) = _ResponseContentTextAnnotationsFilePath;

  /// Object construction from a JSON representation
  factory ResponseContentTextAnnotationsFilePath.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseContentTextAnnotationsFilePathFromJson(json);

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
