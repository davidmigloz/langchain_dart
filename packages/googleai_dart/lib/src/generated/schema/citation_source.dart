// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: CitationSource
// ==========================================

/// A citation to a source for a portion of a specific response.
@freezed
class CitationSource with _$CitationSource {
  const CitationSource._();

  /// Factory constructor for CitationSource
  const factory CitationSource({
    /// Optional. End of the attributed segment, exclusive.
    @JsonKey(includeIfNull: false) int? endIndex,

    /// Optional. License for the GitHub project that is attributed as a source for segment. License info is required for code citations.
    @JsonKey(includeIfNull: false) String? license,

    /// Optional. URI that is attributed as a source for a portion of the text.
    @JsonKey(includeIfNull: false) String? uri,

    /// Optional. Start of segment of the response that is attributed to this source. Index indicates the start of the segment, measured in bytes.
    @JsonKey(includeIfNull: false) int? startIndex,
  }) = _CitationSource;

  /// Object construction from a JSON representation
  factory CitationSource.fromJson(Map<String, dynamic> json) =>
      _$CitationSourceFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'endIndex',
    'license',
    'uri',
    'startIndex'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'endIndex': endIndex,
      'license': license,
      'uri': uri,
      'startIndex': startIndex,
    };
  }
}
