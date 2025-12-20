// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CitationLocation
// ==========================================

/// A citation location reference.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class CitationLocation with _$CitationLocation {
  const CitationLocation._();

  // ------------------------------------------
  // UNION: CitationCharLocation
  // ------------------------------------------

  /// A character-based citation location within a document.

  @FreezedUnionValue('char_location')
  const factory CitationLocation.citationCharLocation({
    /// The type of citation location.
    required CitationCharLocationType type,

    /// The cited text from the document.
    @JsonKey(name: 'cited_text') required String citedText,

    /// The index of the document in the request.
    @JsonKey(name: 'document_index') required int documentIndex,

    /// The title of the cited document.
    @JsonKey(name: 'document_title', includeIfNull: false)
    String? documentTitle,

    /// The starting character index of the citation.
    @JsonKey(name: 'start_char_index') required int startCharIndex,

    /// The ending character index of the citation.
    @JsonKey(name: 'end_char_index') required int endCharIndex,
  }) = CitationCharLocation;

  // ------------------------------------------
  // UNION: CitationPageLocation
  // ------------------------------------------

  /// A page-based citation location within a document.

  @FreezedUnionValue('page_location')
  const factory CitationLocation.citationPageLocation({
    /// The type of citation location.
    required CitationPageLocationType type,

    /// The cited text from the document.
    @JsonKey(name: 'cited_text') required String citedText,

    /// The index of the document in the request.
    @JsonKey(name: 'document_index') required int documentIndex,

    /// The title of the cited document.
    @JsonKey(name: 'document_title', includeIfNull: false)
    String? documentTitle,

    /// The starting page number of the citation.
    @JsonKey(name: 'start_page_number') required int startPageNumber,

    /// The ending page number of the citation.
    @JsonKey(name: 'end_page_number') required int endPageNumber,
  }) = CitationPageLocation;

  // ------------------------------------------
  // UNION: CitationContentBlockLocation
  // ------------------------------------------

  /// A content block-based citation location.

  @FreezedUnionValue('content_block_location')
  const factory CitationLocation.citationContentBlockLocation({
    /// The type of citation location.
    required CitationContentBlockLocationType type,

    /// The cited text from the content block.
    @JsonKey(name: 'cited_text') required String citedText,

    /// The index of the document in the request.
    @JsonKey(name: 'document_index') required int documentIndex,

    /// The title of the cited document.
    @JsonKey(name: 'document_title', includeIfNull: false)
    String? documentTitle,

    /// The starting block index of the citation.
    @JsonKey(name: 'start_block_index') required int startBlockIndex,

    /// The ending block index of the citation.
    @JsonKey(name: 'end_block_index') required int endBlockIndex,
  }) = CitationContentBlockLocation;

  /// Object construction from a JSON representation
  factory CitationLocation.fromJson(Map<String, dynamic> json) =>
      _$CitationLocationFromJson(json);
}

// ==========================================
// ENUM: CitationLocationEnumType
// ==========================================

enum CitationLocationEnumType {
  @JsonValue('char_location')
  charLocation,
  @JsonValue('page_location')
  pageLocation,
  @JsonValue('content_block_location')
  contentBlockLocation,
}

// ==========================================
// ENUM: CitationCharLocationType
// ==========================================

/// The type of citation location.
enum CitationCharLocationType {
  @JsonValue('char_location')
  charLocation,
}

// ==========================================
// ENUM: CitationPageLocationType
// ==========================================

/// The type of citation location.
enum CitationPageLocationType {
  @JsonValue('page_location')
  pageLocation,
}

// ==========================================
// ENUM: CitationContentBlockLocationType
// ==========================================

/// The type of citation location.
enum CitationContentBlockLocationType {
  @JsonValue('content_block_location')
  contentBlockLocation,
}
