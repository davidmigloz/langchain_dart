// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRequestImpl _$$SearchRequestImplFromJson(Map<String, dynamic> json) =>
    _$SearchRequestImpl(
      apiKey: json['api_key'] as String,
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

Map<String, dynamic> _$$SearchRequestImplToJson(_$SearchRequestImpl instance) {
  final val = <String, dynamic>{
    'api_key': instance.apiKey,
    'query': instance.query,
    'search_depth': _$SearchRequestSearchDepthEnumMap[instance.searchDepth]!,
    'include_images': instance.includeImages,
    'include_answer': instance.includeAnswer,
    'include_raw_content': instance.includeRawContent,
    'max_results': instance.maxResults,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('include_domains', instance.includeDomains);
  writeNotNull('exclude_domains', instance.excludeDomains);
  return val;
}

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
    _$SearchResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('answer', instance.answer);
  val['query'] = instance.query;
  val['response_time'] = instance.responseTime;
  writeNotNull('images', instance.images);
  writeNotNull('follow_up_questions', instance.followUpQuestions);
  val['results'] = instance.results.map((e) => e.toJson()).toList();
  return val;
}

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      title: json['title'] as String,
      url: json['url'] as String,
      content: json['content'] as String,
      rawContent: json['raw_content'] as String?,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'url': instance.url,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('raw_content', instance.rawContent);
  val['score'] = instance.score;
  return val;
}
