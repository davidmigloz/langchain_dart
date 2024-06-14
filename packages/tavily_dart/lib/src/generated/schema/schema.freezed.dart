// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) {
  return _SearchRequest.fromJson(json);
}

/// @nodoc
mixin _$SearchRequest {
  /// Your unique API key.
  @JsonKey(name: 'api_key')
  String get apiKey => throw _privateConstructorUsedError;

  /// The search query string.
  String get query => throw _privateConstructorUsedError;

  /// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
  @JsonKey(name: 'search_depth')
  SearchRequestSearchDepth get searchDepth =>
      throw _privateConstructorUsedError;

  /// Include a list of query related images in the response. Default is False.
  @JsonKey(name: 'include_images')
  bool get includeImages => throw _privateConstructorUsedError;

  /// Include answers in the search results. Default is False.
  @JsonKey(name: 'include_answer')
  bool get includeAnswer => throw _privateConstructorUsedError;

  /// Include raw content in the search results. Default is False.
  @JsonKey(name: 'include_raw_content')
  bool get includeRawContent => throw _privateConstructorUsedError;

  /// The number of maximum search results to return. Default is 5.
  @JsonKey(name: 'max_results')
  int get maxResults => throw _privateConstructorUsedError;

  /// A list of domains to specifically include in the search results. Default is None.
  @JsonKey(name: 'include_domains', includeIfNull: false)
  List<String>? get includeDomains => throw _privateConstructorUsedError;

  /// A list of domains to specifically exclude from the search results. Default is None.
  @JsonKey(name: 'exclude_domains', includeIfNull: false)
  List<String>? get excludeDomains => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchRequestCopyWith<SearchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRequestCopyWith<$Res> {
  factory $SearchRequestCopyWith(
          SearchRequest value, $Res Function(SearchRequest) then) =
      _$SearchRequestCopyWithImpl<$Res, SearchRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
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
class _$SearchRequestCopyWithImpl<$Res, $Val extends SearchRequest>
    implements $SearchRequestCopyWith<$Res> {
  _$SearchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? query = null,
    Object? searchDepth = null,
    Object? includeImages = null,
    Object? includeAnswer = null,
    Object? includeRawContent = null,
    Object? maxResults = null,
    Object? includeDomains = freezed,
    Object? excludeDomains = freezed,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchDepth: null == searchDepth
          ? _value.searchDepth
          : searchDepth // ignore: cast_nullable_to_non_nullable
              as SearchRequestSearchDepth,
      includeImages: null == includeImages
          ? _value.includeImages
          : includeImages // ignore: cast_nullable_to_non_nullable
              as bool,
      includeAnswer: null == includeAnswer
          ? _value.includeAnswer
          : includeAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      includeRawContent: null == includeRawContent
          ? _value.includeRawContent
          : includeRawContent // ignore: cast_nullable_to_non_nullable
              as bool,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      includeDomains: freezed == includeDomains
          ? _value.includeDomains
          : includeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      excludeDomains: freezed == excludeDomains
          ? _value.excludeDomains
          : excludeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRequestImplCopyWith<$Res>
    implements $SearchRequestCopyWith<$Res> {
  factory _$$SearchRequestImplCopyWith(
          _$SearchRequestImpl value, $Res Function(_$SearchRequestImpl) then) =
      __$$SearchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
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
class __$$SearchRequestImplCopyWithImpl<$Res>
    extends _$SearchRequestCopyWithImpl<$Res, _$SearchRequestImpl>
    implements _$$SearchRequestImplCopyWith<$Res> {
  __$$SearchRequestImplCopyWithImpl(
      _$SearchRequestImpl _value, $Res Function(_$SearchRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? query = null,
    Object? searchDepth = null,
    Object? includeImages = null,
    Object? includeAnswer = null,
    Object? includeRawContent = null,
    Object? maxResults = null,
    Object? includeDomains = freezed,
    Object? excludeDomains = freezed,
  }) {
    return _then(_$SearchRequestImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchDepth: null == searchDepth
          ? _value.searchDepth
          : searchDepth // ignore: cast_nullable_to_non_nullable
              as SearchRequestSearchDepth,
      includeImages: null == includeImages
          ? _value.includeImages
          : includeImages // ignore: cast_nullable_to_non_nullable
              as bool,
      includeAnswer: null == includeAnswer
          ? _value.includeAnswer
          : includeAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      includeRawContent: null == includeRawContent
          ? _value.includeRawContent
          : includeRawContent // ignore: cast_nullable_to_non_nullable
              as bool,
      maxResults: null == maxResults
          ? _value.maxResults
          : maxResults // ignore: cast_nullable_to_non_nullable
              as int,
      includeDomains: freezed == includeDomains
          ? _value._includeDomains
          : includeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      excludeDomains: freezed == excludeDomains
          ? _value._excludeDomains
          : excludeDomains // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchRequestImpl extends _SearchRequest {
  const _$SearchRequestImpl(
      {@JsonKey(name: 'api_key') required this.apiKey,
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

  factory _$SearchRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRequestImplFromJson(json);

  /// Your unique API key.
  @override
  @JsonKey(name: 'api_key')
  final String apiKey;

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

  @override
  String toString() {
    return 'SearchRequest(apiKey: $apiKey, query: $query, searchDepth: $searchDepth, includeImages: $includeImages, includeAnswer: $includeAnswer, includeRawContent: $includeRawContent, maxResults: $maxResults, includeDomains: $includeDomains, excludeDomains: $excludeDomains)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRequestImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      __$$SearchRequestImplCopyWithImpl<_$SearchRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRequestImplToJson(
      this,
    );
  }
}

abstract class _SearchRequest extends SearchRequest {
  const factory _SearchRequest(
      {@JsonKey(name: 'api_key') required final String apiKey,
      required final String query,
      @JsonKey(name: 'search_depth') final SearchRequestSearchDepth searchDepth,
      @JsonKey(name: 'include_images') final bool includeImages,
      @JsonKey(name: 'include_answer') final bool includeAnswer,
      @JsonKey(name: 'include_raw_content') final bool includeRawContent,
      @JsonKey(name: 'max_results') final int maxResults,
      @JsonKey(name: 'include_domains', includeIfNull: false)
      final List<String>? includeDomains,
      @JsonKey(name: 'exclude_domains', includeIfNull: false)
      final List<String>? excludeDomains}) = _$SearchRequestImpl;
  const _SearchRequest._() : super._();

  factory _SearchRequest.fromJson(Map<String, dynamic> json) =
      _$SearchRequestImpl.fromJson;

  @override

  /// Your unique API key.
  @JsonKey(name: 'api_key')
  String get apiKey;
  @override

  /// The search query string.
  String get query;
  @override

  /// The depth of the search. It can be 'basic' or advanced. Default is 'basic'.
  @JsonKey(name: 'search_depth')
  SearchRequestSearchDepth get searchDepth;
  @override

  /// Include a list of query related images in the response. Default is False.
  @JsonKey(name: 'include_images')
  bool get includeImages;
  @override

  /// Include answers in the search results. Default is False.
  @JsonKey(name: 'include_answer')
  bool get includeAnswer;
  @override

  /// Include raw content in the search results. Default is False.
  @JsonKey(name: 'include_raw_content')
  bool get includeRawContent;
  @override

  /// The number of maximum search results to return. Default is 5.
  @JsonKey(name: 'max_results')
  int get maxResults;
  @override

  /// A list of domains to specifically include in the search results. Default is None.
  @JsonKey(name: 'include_domains', includeIfNull: false)
  List<String>? get includeDomains;
  @override

  /// A list of domains to specifically exclude from the search results. Default is None.
  @JsonKey(name: 'exclude_domains', includeIfNull: false)
  List<String>? get excludeDomains;
  @override
  @JsonKey(ignore: true)
  _$$SearchRequestImplCopyWith<_$SearchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return _SearchResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchResponse {
  /// The answer to your search query.
  @JsonKey(includeIfNull: false)
  String? get answer => throw _privateConstructorUsedError;

  /// Your search query.
  String get query => throw _privateConstructorUsedError;

  /// Your search result response time.
  @JsonKey(name: 'response_time')
  double get responseTime => throw _privateConstructorUsedError;

  /// A list of query related image urls.
  @JsonKey(includeIfNull: false)
  List<String>? get images => throw _privateConstructorUsedError;

  /// A list of suggested research follow up questions related to original query.
  @JsonKey(name: 'follow_up_questions', includeIfNull: false)
  List<String>? get followUpQuestions => throw _privateConstructorUsedError;

  /// A list of search results.
  List<SearchResult> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResponseCopyWith<SearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseCopyWith<$Res> {
  factory $SearchResponseCopyWith(
          SearchResponse value, $Res Function(SearchResponse) then) =
      _$SearchResponseCopyWithImpl<$Res, SearchResponse>;
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
class _$SearchResponseCopyWithImpl<$Res, $Val extends SearchResponse>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followUpQuestions: freezed == followUpQuestions
          ? _value.followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResponseImplCopyWith<$Res>
    implements $SearchResponseCopyWith<$Res> {
  factory _$$SearchResponseImplCopyWith(_$SearchResponseImpl value,
          $Res Function(_$SearchResponseImpl) then) =
      __$$SearchResponseImplCopyWithImpl<$Res>;
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
class __$$SearchResponseImplCopyWithImpl<$Res>
    extends _$SearchResponseCopyWithImpl<$Res, _$SearchResponseImpl>
    implements _$$SearchResponseImplCopyWith<$Res> {
  __$$SearchResponseImplCopyWithImpl(
      _$SearchResponseImpl _value, $Res Function(_$SearchResponseImpl) _then)
      : super(_value, _then);

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
    return _then(_$SearchResponseImpl(
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as double,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followUpQuestions: freezed == followUpQuestions
          ? _value._followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResponseImpl extends _SearchResponse {
  const _$SearchResponseImpl(
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

  factory _$SearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResponseImplFromJson(json);

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

  @override
  String toString() {
    return 'SearchResponse(answer: $answer, query: $query, responseTime: $responseTime, images: $images, followUpQuestions: $followUpQuestions, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._followUpQuestions, _followUpQuestions) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      answer,
      query,
      responseTime,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_followUpQuestions),
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      __$$SearchResponseImplCopyWithImpl<_$SearchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchResponse extends SearchResponse {
  const factory _SearchResponse(
      {@JsonKey(includeIfNull: false) final String? answer,
      required final String query,
      @JsonKey(name: 'response_time') required final double responseTime,
      @JsonKey(includeIfNull: false) final List<String>? images,
      @JsonKey(name: 'follow_up_questions', includeIfNull: false)
      final List<String>? followUpQuestions,
      required final List<SearchResult> results}) = _$SearchResponseImpl;
  const _SearchResponse._() : super._();

  factory _SearchResponse.fromJson(Map<String, dynamic> json) =
      _$SearchResponseImpl.fromJson;

  @override

  /// The answer to your search query.
  @JsonKey(includeIfNull: false)
  String? get answer;
  @override

  /// Your search query.
  String get query;
  @override

  /// Your search result response time.
  @JsonKey(name: 'response_time')
  double get responseTime;
  @override

  /// A list of query related image urls.
  @JsonKey(includeIfNull: false)
  List<String>? get images;
  @override

  /// A list of suggested research follow up questions related to original query.
  @JsonKey(name: 'follow_up_questions', includeIfNull: false)
  List<String>? get followUpQuestions;
  @override

  /// A list of search results.
  List<SearchResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  /// The title of the search result url.
  String get title => throw _privateConstructorUsedError;

  /// The url of the search result.
  String get url => throw _privateConstructorUsedError;

  /// The most query related content from the scraped url.
  String get content => throw _privateConstructorUsedError;

  /// The parsed and cleaned HTML of the site. For now includes parsed text only.
  @JsonKey(name: 'raw_content', includeIfNull: false)
  String? get rawContent => throw _privateConstructorUsedError;

  /// The relevance score of the search result.
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {String title,
      String url,
      String content,
      @JsonKey(name: 'raw_content', includeIfNull: false) String? rawContent,
      double score});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? content = null,
    Object? rawContent = freezed,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: freezed == rawContent
          ? _value.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
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
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? content = null,
    Object? rawContent = freezed,
    Object? score = null,
  }) {
    return _then(_$SearchResultImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rawContent: freezed == rawContent
          ? _value.rawContent
          : rawContent // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl extends _SearchResult {
  const _$SearchResultImpl(
      {required this.title,
      required this.url,
      required this.content,
      @JsonKey(name: 'raw_content', includeIfNull: false) this.rawContent,
      required this.score})
      : super._();

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

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

  @override
  String toString() {
    return 'SearchResult(title: $title, url: $url, content: $content, rawContent: $rawContent, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rawContent, rawContent) ||
                other.rawContent == rawContent) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, content, rawContent, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(
      this,
    );
  }
}

abstract class _SearchResult extends SearchResult {
  const factory _SearchResult(
      {required final String title,
      required final String url,
      required final String content,
      @JsonKey(name: 'raw_content', includeIfNull: false)
      final String? rawContent,
      required final double score}) = _$SearchResultImpl;
  const _SearchResult._() : super._();

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override

  /// The title of the search result url.
  String get title;
  @override

  /// The url of the search result.
  String get url;
  @override

  /// The most query related content from the scraped url.
  String get content;
  @override

  /// The parsed and cleaned HTML of the site. For now includes parsed text only.
  @JsonKey(name: 'raw_content', includeIfNull: false)
  String? get rawContent;
  @override

  /// The relevance score of the search result.
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
