// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: CitationMetadata
// ==========================================

/// A collection of source attributions for a piece of content.
@freezed
class CitationMetadata with _$CitationMetadata {
  const CitationMetadata._();

  /// Factory constructor for CitationMetadata
  const factory CitationMetadata({
    /// Citations to sources for a specific response.
    @JsonKey(includeIfNull: false) List<CitationSource>? citationSources,
  }) = _CitationMetadata;

  /// Object construction from a JSON representation
  factory CitationMetadata.fromJson(Map<String, dynamic> json) =>
      _$CitationMetadataFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['citationSources'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'citationSources': citationSources,
    };
  }
}
