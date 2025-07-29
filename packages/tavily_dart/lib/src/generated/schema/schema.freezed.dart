// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRequest {
  /// Your unique API key.
  @JsonKey(name: 'api_key', includeIfNull: false)
  String? get apiKey;

  /// The search query string.
  String get query;

  /// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
  @JsonKey(name: 'search_depth')
  SearchRequestSearchDepth get searchDepth;

  /// Include a list of query related images in the response. Default is False.
  @JsonKey(name: 'include_images')
  bool get includeImages;

  /// Include answers in the search results. Default is False.
  @JsonKey(name: 'include_answer')
  bool get includeAnswer;

  /// Include raw content in the search results. Default is False.
  @JsonKey(name: 'include_raw_content')
  bool get includeRawContent;

  /// The number of maximum search results to return. Default is 5.
  @JsonKey(name: 'max_results')
  int get maxResults;

  /// A list of domains to specifically include in the search results. Default is None.
  @JsonKey(name: 'include_domains', includeIfNull: false)
  List<String>? get includeDomains;

  /// A list of domains to specifically exclude from the search results. Default is None.
  @JsonKey(name: 'exclude_domains', includeIfNull: false)
  List<String>? get excludeDomains;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchRequestCopyWith<SearchRequest> get copyWith =>
      _$SearchRequestCopyWithImpl<SearchRequest>(
          this as SearchRequest, _$identity);

  /// Serializes this SearchRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchRequest &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.searchDepth, searchDepth) ||
                other.searchDepth == searchDepth) &&
            (identical(other.includeImages, includeImages) ||
                other.includeImages == includeImages) &&
            (identical(other.includeAnswer, includeAnswer) ||
                other.includeAnswer == includeAnswer) &&
            (identical(other.includeRawContent, includeRawContent) ||
                other.includeRawContent == includeRawContent) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            const DeepCollectionEquality()
                .equals(other.includeDomains, includeDomains) &&
            const DeepCollectionEquality()
                .equals(other.excludeDomains, excludeDomains));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiKey,
      query,
      searchDepth,
      includeImages,
      includeAnswer,
      includeRawContent,
      maxResults,
      const DeepCollectionEquality().hash(includeDomains),
      const DeepCollectionEquality().hash(excludeDomains));

  @override
  String toString() {
    return 'SearchRequest(apiKey: $apiKey, query: $query, searchDepth: $searchDepth, includeImages: $includeImages, includeAnswer: $includeAnswer, includeRawContent: $includeRawContent, maxResults: $maxResults, includeDomains: $includeDomains, excludeDomains: $excludeDomains)';
  }
}

/// @nodoc
abstract mixin class $SearchRequestCopyWith<$Res> {
  factory $SearchRequestCopyWith(
          SearchRequest value, $Res Function(SearchRequest) _then) =
      _$SearchRequestCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key', includeIfNull: false) String? apiKey,
      String query,
      @JsonKey(name: 'search_depth') SearchRequestSearchDepth searchDepth,
      @JsonKey(name: 'include_images') bool includeImages,
      @JsonKey(name: 'include_answer') bool includeAnswer,
      @JsonKey(name: 'include_raw_content') bool includeRawContent,
      @JsonKey(name: 'max_results') int maxResults,
      @JsonKey(name: 'include_domains', includeIfNull: false)
      List<String>? includeDomains,
      @JsonKey(name: 'exclude_domains', includeIfNull: false)
      List<String>? excludeDomains});
}

/// @nodoc
class _$SearchRequestCopyWithImpl<$Res>
    implements $SearchRequestCopyWith<$Res> {
  _$SearchRequestCopyWithImpl(this._self, this._then);

  final SearchRequest _self;
  final $Res Function(SearchRequest) _then;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = freezed,
    Object? query = null,
    Object? searchDepth = null,
    Object? includeImages = null,
    Object? includeAnswer = null,
    Object? includeRawContent = null,
    Object? maxResults = null,
    Object? includeDomains = freezed,
    Object? excludeDomains = freezed,
  }) {
    return _then(_self.copyWith(
      apiKey: freezed == apiKey
          ? _self.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchDepth: null == searchDepth
          ? _self.searchDepth
          : searchDepth // ignore: cast_nullable_to_non_nullable
              as SearchRequestSearchDepth,
      includeImages: null == includeImages
          ? _self.includeImages
          : includeImages // ignore: cast_nullable_to_non_nullable
              as bool,
      includeAnswer: null == includeAnswer
          ? _self.includeAnswer
          : includeAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      includeRawContent: null == includeRawContent
          ? _self.includeRawContent
          : includeRawContent // ignore: cast_nullable_to_non_nullable
              as bool,
      maxResults: null == maxResults
          ? _self.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      includeDomains: freezed == includeDomains
          ? _self.includeDomains
          : includeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      excludeDomains: freezed == excludeDomains
          ? _self.excludeDomains
          : excludeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchRequest extends SearchRequest {
  const _SearchRequest(
      {@JsonKey(name: 'api_key', includeIfNull: false) this.apiKey,
      required this.query,
      @JsonKey(name: 'search_depth')
      this.searchDepth = SearchRequestSearchDepth.basic,
      @JsonKey(name: 'include_images') this.includeImages = false,
      @JsonKey(name: 'include_answer') this.includeAnswer = false,
      @JsonKey(name: 'include_raw_content') this.includeRawContent = false,
      @JsonKey(name: 'max_results') this.maxResults = 5,
      @JsonKey(name: 'include_domains', includeIfNull: false)
      final List<String>? includeDomains,
      @JsonKey(name: 'exclude_domains', includeIfNull: false)
      final List<String>? excludeDomains})
      : _includeDomains = includeDomains,
        _excludeDomains = excludeDomains,
        super._();
  factory _SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  /// Your unique API key.
  @override
  @JsonKey(name: 'api_key', includeIfNull: false)
  final String? apiKey;

  /// The search query string.
  @override
  final String query;

  /// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
  @override
  @JsonKey(name: 'search_depth')
  final SearchRequestSearchDepth searchDepth;

  /// Include a list of query related images in the response. Default is False.
  @override
  @JsonKey(name: 'include_images')
  final bool includeImages;

  /// Include answers in the search results. Default is False.
  @override
  @JsonKey(name: 'include_answer')
  final bool includeAnswer;

  /// Include raw content in the search results. Default is False.
  @override
  @JsonKey(name: 'include_raw_content')
  final bool includeRawContent;

  /// The number of maximum search results to return. Default is 5.
  @override
  @JsonKey(name: 'max_results')
  final int maxResults;

  /// A list of domains to specifically include in the search results. Default is None.
  final List<String>? _includeDomains;

  /// A list of domains to specifically include in the search results. Default is None.
  @override
  @JsonKey(name: 'include_domains', includeIfNull: false)
  List<String>? get includeDomains {
    final value = _includeDomains;
    if (value == null) return null;
    if (_includeDomains is EqualUnmodifiableListView) return _includeDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A list of domains to specifically exclude from the search results. Default is None.
  final List<String>? _excludeDomains;

  /// A list of domains to specifically exclude from the search results. Default is None.
  @override
  @JsonKey(name: 'exclude_domains', includeIfNull: false)
  List<String>? get excludeDomains {
    final value = _excludeDomains;
    if (value == null) return null;
    if (_excludeDomains is EqualUnmodifiableListView) return _excludeDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRequestCopyWith<_SearchRequest> get copyWith =>
      __$SearchRequestCopyWithImpl<_SearchRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRequest &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.searchDepth, searchDepth) ||
                other.searchDepth == searchDepth) &&
            (identical(other.includeImages, includeImages) ||
                other.includeImages == includeImages) &&
            (identical(other.includeAnswer, includeAnswer) ||
                other.includeAnswer == includeAnswer) &&
            (identical(other.includeRawContent, includeRawContent) ||
                other.includeRawContent == includeRawContent) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            const DeepCollectionEquality()
                .equals(other._includeDomains, _includeDomains) &&
            const DeepCollectionEquality()
                .equals(other._excludeDomains, _excludeDomains));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiKey,
      query,
      searchDepth,
      includeImages,
      includeAnswer,
      includeRawContent,
      maxResults,
      const DeepCollectionEquality().hash(_includeDomains),
      const DeepCollectionEquality().hash(_excludeDomains));

  @override
  String toString() {
    return 'SearchRequest(apiKey: $apiKey, query: $query, searchDepth: $searchDepth, includeImages: $includeImages, includeAnswer: $includeAnswer, includeRawContent: $includeRawContent, maxResults: $maxResults, includeDomains: $includeDomains, excludeDomains: $excludeDomains)';
  }
}

/// @nodoc
abstract mixin class _$SearchRequestCopyWith<$Res>
    implements $SearchRequestCopyWith<$Res> {
  factory _$SearchRequestCopyWith(
          _SearchRequest value, $Res Function(_SearchRequest) _then) =
      __$SearchRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key', includeIfNull: false) String? apiKey,
      String query,
      @JsonKey(name: 'search_depth') SearchRequestSearchDepth searchDepth,
      @JsonKey(name: 'include_images') bool includeImages,
      @JsonKey(name: 'include_answer') bool includeAnswer,
      @JsonKey(name: 'include_raw_content') bool includeRawContent,
      @JsonKey(name: 'max_results') int maxResults,
      @JsonKey(name: 'include_domains', includeIfNull: false)
      List<String>? includeDomains,
      @JsonKey(name: 'exclude_domains', includeIfNull: false)
      List<String>? excludeDomains});
}

/// @nodoc
class __$SearchRequestCopyWithImpl<$Res>
    implements _$SearchRequestCopyWith<$Res> {
  __$SearchRequestCopyWithImpl(this._self, this._then);

  final _SearchRequest _self;
  final $Res Function(_SearchRequest) _then;

  /// Create a copy of SearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiKey = freezed,
    Object? query = null,
    Object? searchDepth = null,
    Object? includeImages = null,
    Object? includeAnswer = null,
    Object? includeRawContent = null,
    Object? maxResults = null,
    Object? includeDomains = freezed,
    Object? excludeDomains = freezed,
  }) {
    return _then(_SearchRequest(
      apiKey: freezed == apiKey
          ? _self.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchDepth: null == searchDepth
          ? _self.searchDepth
          : searchDepth // ignore: cast_nullable_to_non_nullable
              as SearchRequestSearchDepth,
      includeImages: null == includeImages
          ? _self.includeImages
          : includeImages // ignore: cast_nullable_to_non_nullable
              as bool,
      includeAnswer: null == includeAnswer
          ? _self.includeAnswer
          : includeAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      includeRawContent: null == includeRawContent
          ? _self.includeRawContent
          : includeRawContent // ignore: cast_nullable_to_non_nullable
              as bool,
      maxResults: null == maxResults
          ? _self.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      includeDomains: freezed == includeDomains
          ? _self._includeDomains
          : includeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      excludeDomains: freezed == excludeDomains
          ? _self._excludeDomains
          : excludeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$SearchResponse {
  /// The answer to your search query.
  @JsonKey(includeIfNull: false)
  String? get answer;

  /// Your search query.
  String get query;

  /// Your search result response time.
  @JsonKey(name: 'response_time')
  double get responseTime;

  /// A list of query related image urls.
  @JsonKey(includeIfNull: false)
  List<String>? get images;

  /// A list of suggested research follow up questions related to original query.
  @JsonKey(name: 'follow_up_questions', includeIfNull: false)
  List<String>? get followUpQuestions;

  /// A list of search results.
  List<SearchResult> get results;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchResponseCopyWith<SearchResponse> get copyWith =>
      _$SearchResponseCopyWithImpl<SearchResponse>(
          this as SearchResponse, _$identity);

  /// Serializes this SearchResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchResponse &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality()
                .equals(other.followUpQuestions, followUpQuestions) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      answer,
      query,
      responseTime,
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(followUpQuestions),
      const DeepCollectionEquality().hash(results));

  @override
  String toString() {
    return 'SearchResponse(answer: $answer, query: $query, responseTime: $responseTime, images: $images, followUpQuestions: $followUpQuestions, results: $results)';
  }
}

/// @nodoc
abstract mixin class $SearchResponseCopyWith<$Res> {
  factory $SearchResponseCopyWith(
          SearchResponse value, $Res Function(SearchResponse) _then) =
      _$SearchResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? answer,
      String query,
      @JsonKey(name: 'response_time') double responseTime,
      @JsonKey(includeIfNull: false) List<String>? images,
      @JsonKey(name: 'follow_up_questions', includeIfNull: false)
      List<String>? followUpQuestions,
      List<SearchResult> results});
}

/// @nodoc
class _$SearchResponseCopyWithImpl<$Res>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._self, this._then);

  final SearchResponse _self;
  final $Res Function(SearchResponse) _then;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = freezed,
    Object? query = null,
    Object? responseTime = null,
    Object? images = freezed,
    Object? followUpQuestions = freezed,
    Object? results = null,
  }) {
    return _then(_self.copyWith(
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _self.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followUpQuestions: freezed == followUpQuestions
          ? _self.followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchResponse extends SearchResponse {
  const _SearchResponse(
      {@JsonKey(includeIfNull: false) this.answer,
      required this.query,
      @JsonKey(name: 'response_time') required this.responseTime,
      @JsonKey(includeIfNull: false) final List<String>? images,
      @JsonKey(name: 'follow_up_questions', includeIfNull: false)
      final List<String>? followUpQuestions,
      required final List<SearchResult> results})
      : _images = images,
        _followUpQuestions = followUpQuestions,
        _results = results,
        super._();
  factory _SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  /// The answer to your search query.
  @override
  @JsonKey(includeIfNull: false)
  final String? answer;

  /// Your search query.
  @override
  final String query;

  /// Your search result response time.
  @override
  @JsonKey(name: 'response_time')
  final double responseTime;

  /// A list of query related image urls.
  final List<String>? _images;

  /// A list of query related image urls.
  @override
  @JsonKey(includeIfNull: false)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A list of suggested research follow up questions related to original query.
  final List<String>? _followUpQuestions;

  /// A list of suggested research follow up questions related to original query.
  @override
  @JsonKey(name: 'follow_up_questions', includeIfNull: false)
  List<String>? get followUpQuestions {
    final value = _followUpQuestions;
    if (value == null) return null;
    if (_followUpQuestions is EqualUnmodifiableListView)
      return _followUpQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// A list of search results.
  final List<SearchResult> _results;

  /// A list of search results.
  @override
  List<SearchResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchResponseCopyWith<_SearchResponse> get copyWith =>
      __$SearchResponseCopyWithImpl<_SearchResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResponse &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._followUpQuestions, _followUpQuestions) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      answer,
      query,
      responseTime,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_followUpQuestions),
      const DeepCollectionEquality().hash(_results));

  @override
  String toString() {
    return 'SearchResponse(answer: $answer, query: $query, responseTime: $responseTime, images: $images, followUpQuestions: $followUpQuestions, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$SearchResponseCopyWith<$Res>
    implements $SearchResponseCopyWith<$Res> {
  factory _$SearchResponseCopyWith(
          _SearchResponse value, $Res Function(_SearchResponse) _then) =
      __$SearchResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? answer,
      String query,
      @JsonKey(name: 'response_time') double responseTime,
      @JsonKey(includeIfNull: false) List<String>? images,
      @JsonKey(name: 'follow_up_questions', includeIfNull: false)
      List<String>? followUpQuestions,
      List<SearchResult> results});
}

/// @nodoc
class __$SearchResponseCopyWithImpl<$Res>
    implements _$SearchResponseCopyWith<$Res> {
  __$SearchResponseCopyWithImpl(this._self, this._then);

  final _SearchResponse _self;
  final $Res Function(_SearchResponse) _then;

  /// Create a copy of SearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answer = freezed,
    Object? query = null,
    Object? responseTime = null,
    Object? images = freezed,
    Object? followUpQuestions = freezed,
    Object? results = null,
  }) {
    return _then(_SearchResponse(
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _self.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followUpQuestions: freezed == followUpQuestions
          ? _self._followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc
mixin _$SearchResult {
  /// The title of the search result url.
  String get title;

  /// The url of the search result.
  String get url;

  /// The most query related content from the scraped url.
  String get content;

  /// The parsed and cleaned HTML of the site. For now includes parsed text only.
  @JsonKey(name: 'raw_content', includeIfNull: false)
  String? get rawContent;

  /// The relevance score of the search result.
  double get score;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchResultCopyWith<SearchResult> get copyWith =>
      _$SearchResultCopyWithImpl<SearchResult>(
          this as SearchResult, _$identity);

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchResult &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rawContent, rawContent) ||
                other.rawContent == rawContent) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, content, rawContent, score);

  @override
  String toString() {
    return 'SearchResult(title: $title, url: $url, content: $content, rawContent: $rawContent, score: $score)';
  }
}

/// @nodoc
abstract mixin class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) _then) =
      _$SearchResultCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String url,
      String content,
      @JsonKey(name: 'raw_content', includeIfNull: false) String? rawContent,
      double score});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res> implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._self, this._then);

  final SearchResult _self;
  final $Res Function(SearchResult) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? content = null,
    Object? rawContent = freezed,
    Object? score = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: freezed == rawContent
          ? _self.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchResult extends SearchResult {
  const _SearchResult(
      {required this.title,
      required this.url,
      required this.content,
      @JsonKey(name: 'raw_content', includeIfNull: false) this.rawContent,
      required this.score})
      : super._();
  factory _SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  /// The title of the search result url.
  @override
  final String title;

  /// The url of the search result.
  @override
  final String url;

  /// The most query related content from the scraped url.
  @override
  final String content;

  /// The parsed and cleaned HTML of the site. For now includes parsed text only.
  @override
  @JsonKey(name: 'raw_content', includeIfNull: false)
  final String? rawContent;

  /// The relevance score of the search result.
  @override
  final double score;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchResultCopyWith<_SearchResult> get copyWith =>
      __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResult &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rawContent, rawContent) ||
                other.rawContent == rawContent) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, content, rawContent, score);

  @override
  String toString() {
    return 'SearchResult(title: $title, url: $url, content: $content, rawContent: $rawContent, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$SearchResultCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(
          _SearchResult value, $Res Function(_SearchResult) _then) =
      __$SearchResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String url,
      String content,
      @JsonKey(name: 'raw_content', includeIfNull: false) String? rawContent,
      double score});
}

/// @nodoc
class __$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(this._self, this._then);

  final _SearchResult _self;
  final $Res Function(_SearchResult) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? content = null,
    Object? rawContent = freezed,
    Object? score = null,
  }) {
    return _then(_SearchResult(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: freezed == rawContent
          ? _self.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
