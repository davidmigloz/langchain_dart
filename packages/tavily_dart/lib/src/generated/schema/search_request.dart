// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of tavily_schema;

// ==========================================
// CLASS: SearchRequest
// ==========================================

/// The search request object.
@freezed
abstract class SearchRequest with _$SearchRequest {
  const SearchRequest._();

  /// Factory constructor for SearchRequest
  const factory SearchRequest({
    /// Your unique API key.
    @JsonKey(name: 'api_key', includeIfNull: false) String? apiKey,

    /// The search query string.
    required String query,

    /// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
    @JsonKey(name: 'search_depth')
    @Default(SearchRequestSearchDepth.basic)
    SearchRequestSearchDepth searchDepth,

    /// Include a list of query related images in the response. Default is False.
    @JsonKey(name: 'include_images') @Default(false) bool includeImages,

    /// Include answers in the search results. Default is False.
    @JsonKey(name: 'include_answer') @Default(false) bool includeAnswer,

    /// Include raw content in the search results. Default is False.
    @JsonKey(name: 'include_raw_content')
    @Default(false)
    bool includeRawContent,

    /// The number of maximum search results to return. Default is 5.
    @JsonKey(name: 'max_results') @Default(5) int maxResults,

    /// A list of domains to specifically include in the search results. Default is None.
    @JsonKey(name: 'include_domains', includeIfNull: false)
    List<String>? includeDomains,

    /// A list of domains to specifically exclude from the search results. Default is None.
    @JsonKey(name: 'exclude_domains', includeIfNull: false)
    List<String>? excludeDomains,
  }) = _SearchRequest;

  /// Object construction from a JSON representation
  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'api_key',
    'query',
    'search_depth',
    'include_images',
    'include_answer',
    'include_raw_content',
    'max_results',
    'include_domains',
    'exclude_domains'
  ];

  /// Validation constants
  static const maxResultsDefaultValue = 5;

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'api_key': apiKey,
      'query': query,
      'search_depth': searchDepth,
      'include_images': includeImages,
      'include_answer': includeAnswer,
      'include_raw_content': includeRawContent,
      'max_results': maxResults,
      'include_domains': includeDomains,
      'exclude_domains': excludeDomains,
    };
  }
}

// ==========================================
// ENUM: SearchRequestSearchDepth
// ==========================================

/// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
enum SearchRequestSearchDepth {
  @JsonValue('basic')
  basic,
  @JsonValue('advanced')
  advanced,
}
