// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ResponseContentTextAnnotationsFileCitation
// ==========================================

/// A file citation annotation for response text.
@freezed
class ResponseContentTextAnnotationsFileCitation
    with _$ResponseContentTextAnnotationsFileCitation {
  const ResponseContentTextAnnotationsFileCitation._();

  /// Factory constructor for ResponseContentTextAnnotationsFileCitation
  const factory ResponseContentTextAnnotationsFileCitation({
    /// The ID of the file.
    @JsonKey(name: 'file_id') required String fileId,

    /// The specific quote from the file.
    @JsonKey(includeIfNull: false) String? quote,
  }) = _ResponseContentTextAnnotationsFileCitation;

  /// Object construction from a JSON representation
  factory ResponseContentTextAnnotationsFileCitation.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseContentTextAnnotationsFileCitationFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_id', 'quote'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'file_id': fileId,
      'quote': quote,
    };
  }
}
