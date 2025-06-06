// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseContentTextAnnotationsFileCitationObject
// ==========================================

/// A file citation annotation object for response text.
@freezed
class ResponseContentTextAnnotationsFileCitationObject
    with _$ResponseContentTextAnnotationsFileCitationObject {
  const ResponseContentTextAnnotationsFileCitationObject._();

  /// Factory constructor for ResponseContentTextAnnotationsFileCitationObject
  const factory ResponseContentTextAnnotationsFileCitationObject({
    ///
    required ResponseContentTextAnnotationsFileCitationObjectType type,

    /// The text in the content that is being cited.
    required String text,

    /// No Description
    @JsonKey(name: 'start_index') required int startIndex,

    /// No Description
    @JsonKey(name: 'end_index') required int endIndex,

    /// A file citation annotation for response text.
    @JsonKey(name: 'file_citation')
    required ResponseContentTextAnnotationsFileCitation fileCitation,
  }) = _ResponseContentTextAnnotationsFileCitationObject;

  /// Object construction from a JSON representation
  factory ResponseContentTextAnnotationsFileCitationObject.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseContentTextAnnotationsFileCitationObjectFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'type',
    'text',
    'start_index',
    'end_index',
    'file_citation'
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
      'file_citation': fileCitation,
    };
  }
}

// ==========================================
// ENUM: ResponseContentTextAnnotationsFileCitationObjectType
// ==========================================

/// No Description
enum ResponseContentTextAnnotationsFileCitationObjectType {
  @JsonValue('file_citation')
  fileCitation,
}
