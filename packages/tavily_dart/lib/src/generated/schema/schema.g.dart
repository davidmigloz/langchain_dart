// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRequestImpl _$$SearchRequestImplFromJson(Map<String, dynamic> json) =>
    _$SearchRequestImpl(
      apiKey: json['api_key'] as String?,
      query: json['query'] as String,
      searchDepth: $enumDecodeNullable(
              _$SearchRequestSearchDepthEnumMap, json['search_depth']) ??
          SearchRequestSearchDepth.basic,
      includeImages: json['include_images'] as bool? ?? false,
      includeAnswer: json['include_answer'] as bool? ?? false,
      includeRawContent: json['include_raw_content'] as bool? ?? false,
      maxResults: (json['max_results'] as num?)?.toInt() ?? 5,
      includeDomains: (json['include_domains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      excludeDomains: (json['exclude_domains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SearchRequestImplToJson(_$SearchRequestImpl instance) =>
    <String, dynamic>{
      if (instance.apiKey case final value?) 'api_key': value,
      'query': instance.query,
      'search_depth': _$SearchRequestSearchDepthEnumMap[instance.searchDepth]!,
      'include_images': instance.includeImages,
      'include_answer': instance.includeAnswer,
      'include_raw_content': instance.includeRawContent,
      'max_results': instance.maxResults,
      if (instance.includeDomains case final value?) 'include_domains': value,
      if (instance.excludeDomains case final value?) 'exclude_domains': value,
    };

const _$SearchRequestSearchDepthEnumMap = {
  SearchRequestSearchDepth.basic: 'basic',
  SearchRequestSearchDepth.advanced: 'advanced',
};

_$SearchResponseImpl _$$SearchResponseImplFromJson(Map<String, dynamic> json) =>
    _$SearchResponseImpl(
      answer: json['answer'] as String?,
      query: json['query'] as String,
      responseTime: (json['response_time'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      followUpQuestions: (json['follow_up_questions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchResponseImplToJson(
        _$SearchResponseImpl instance) =>
    <String, dynamic>{
      if (instance.answer case final value?) 'answer': value,
      'query': instance.query,
      'response_time': instance.responseTime,
      if (instance.images case final value?) 'images': value,
      if (instance.followUpQuestions case final value?)
        'follow_up_questions': value,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      title: json['title'] as String,
      url: json['url'] as String,
      content: json['content'] as String,
      rawContent: json['raw_content'] as String?,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'content': instance.content,
      if (instance.rawContent case final value?) 'raw_content': value,
      'score': instance.score,
    };
