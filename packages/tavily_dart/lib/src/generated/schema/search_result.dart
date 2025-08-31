// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of tavily_schema;

// ==========================================
// CLASS: SearchResult
// ==========================================

/// The search result object.
@freezed
abstract class SearchResult with _$SearchResult {
  const SearchResult._();

  /// Factory constructor for SearchResult
  const factory SearchResult({
    /// The title of the search result url.
    required String title,

    /// The url of the search result.
    required String url,

    /// The most query related content from the scraped url.
    required String content,

    /// The parsed and cleaned HTML of the site. For now includes parsed text only.
    @JsonKey(name: 'raw_content', includeIfNull: false) String? rawContent,

    /// The relevance score of the search result.
    required double score,
  }) = _SearchResult;

  /// Object construction from a JSON representation
  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'title',
    'url',
    'content',
    'raw_content',
    'score'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
      'content': content,
      'raw_content': rawContent,
      'score': score,
    };
  }
}
