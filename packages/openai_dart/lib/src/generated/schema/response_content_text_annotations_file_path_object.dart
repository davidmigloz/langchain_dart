// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseContentTextAnnotationsFilePathObject
// ==========================================

/// A file path annotation object for response text.
@freezed
class ResponseContentTextAnnotationsFilePathObject
    with _$ResponseContentTextAnnotationsFilePathObject {
  const ResponseContentTextAnnotationsFilePathObject._();

  /// Factory constructor for ResponseContentTextAnnotationsFilePathObject
  const factory ResponseContentTextAnnotationsFilePathObject({
    ///
    required ResponseContentTextAnnotationsFilePathObjectType type,

    /// The text in the content that refers to the file path.
    required String text,

    /// No Description
    @JsonKey(name: 'start_index') required int startIndex,

    /// No Description
    @JsonKey(name: 'end_index') required int endIndex,

    /// A file path annotation for response text.
    @JsonKey(name: 'file_path')
    required ResponseContentTextAnnotationsFilePath filePath,
  }) = _ResponseContentTextAnnotationsFilePathObject;

  /// Object construction from a JSON representation
  factory ResponseContentTextAnnotationsFilePathObject.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseContentTextAnnotationsFilePathObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'text',
    'start_index',
    'end_index',
    'file_path'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
      'start_index': startIndex,
      'end_index': endIndex,
      'file_path': filePath,
    };
  }
}

// ==========================================
// ENUM: ResponseContentTextAnnotationsFilePathObjectType
// ==========================================

/// No Description
enum ResponseContentTextAnnotationsFilePathObjectType {
  @JsonValue('file_path')
  filePath,
}
