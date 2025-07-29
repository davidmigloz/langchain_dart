// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of tavily_schema;

// ==========================================
// CLASS: SearchResponse
// ==========================================

/// The response data from the search query.
@freezed
abstract class SearchResponse with _$SearchResponse {
  const SearchResponse._();

  /// Factory constructor for SearchResponse
  const factory SearchResponse({
    /// The answer to your search query.
    @JsonKey(includeIfNull: false) String? answer,

    /// Your search query.
    required String query,

    /// Your search result response time.
    @JsonKey(name: 'response_time') required double responseTime,

    /// A list of query related image urls.
    @JsonKey(includeIfNull: false) List<String>? images,

    /// A list of suggested research follow up questions related to original query.
    @JsonKey(name: 'follow_up_questions', includeIfNull: false)
    List<String>? followUpQuestions,

    /// A list of search results.
    required List<SearchResult> results,
  }) = _SearchResponse;

  /// Object construction from a JSON representation
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'answer',
    'query',
    'response_time',
    'images',
    'follow_up_questions',
    'results'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'query': query,
      'response_time': responseTime,
      'images': images,
      'follow_up_questions': followUpQuestions,
      'results': results,
    };
  }
}
