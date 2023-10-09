// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, invalid_annotation_target

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddEmbedding _$$_AddEmbeddingFromJson(Map<String, dynamic> json) =>
    _$_AddEmbedding(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AddEmbeddingToJson(_$_AddEmbedding instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'embeddings': instance.embeddings,
      'metadatas': instance.metadatas,
      'documents': instance.documents,
    };

_$_CollectionType _$$_CollectionTypeFromJson(Map<String, dynamic> json) =>
    _$_CollectionType(
      name: json['name'] as String,
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_CollectionTypeToJson(_$_CollectionType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'metadata': instance.metadata,
    };

_$_CreateCollection _$$_CreateCollectionFromJson(Map<String, dynamic> json) =>
    _$_CreateCollection(
      name: json['name'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      getOrCreate: json['get_or_create'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CreateCollectionToJson(_$_CreateCollection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'metadata': instance.metadata,
      'get_or_create': instance.getOrCreate,
    };

_$_DeleteEmbedding _$$_DeleteEmbeddingFromJson(Map<String, dynamic> json) =>
    _$_DeleteEmbedding(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      where: json['where'] as Map<String, dynamic>?,
      whereDocument: json['where_document'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_DeleteEmbeddingToJson(_$_DeleteEmbedding instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'where': instance.where,
      'where_document': instance.whereDocument,
    };

_$_GetEmbedding _$$_GetEmbeddingFromJson(Map<String, dynamic> json) =>
    _$_GetEmbedding(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      where: json['where'],
      whereDocument: json['where_document'],
      sort: json['sort'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      include:
          (json['include'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_GetEmbeddingToJson(_$_GetEmbedding instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'where': instance.where,
      'where_document': instance.whereDocument,
      'sort': instance.sort,
      'limit': instance.limit,
      'offset': instance.offset,
      'include': instance.include,
    };

_$_GetResponse _$$_GetResponseFromJson(Map<String, dynamic> json) =>
    _$_GetResponse(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$$_GetResponseToJson(_$_GetResponse instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'embeddings': instance.embeddings,
      'metadatas': instance.metadatas,
      'documents': instance.documents,
    };

_$_QueryEmbedding _$$_QueryEmbeddingFromJson(Map<String, dynamic> json) =>
    _$_QueryEmbedding(
      queryEmbeddings: (json['query_embeddings'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      nResults: json['n_results'] as int? ?? 10,
      where: json['where'] as Map<String, dynamic>?,
      whereDocument: json['where_document'] as Map<String, dynamic>?,
      include:
          (json['include'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_QueryEmbeddingToJson(_$_QueryEmbedding instance) =>
    <String, dynamic>{
      'query_embeddings': instance.queryEmbeddings,
      'n_results': instance.nResults,
      'where': instance.where,
      'where_document': instance.whereDocument,
      'include': instance.include,
    };

_$_QueryResponse _$$_QueryResponseFromJson(Map<String, dynamic> json) =>
    _$_QueryResponse(
      ids: (json['ids'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => e as Map<String, dynamic>?)
              .toList())
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String?).toList())
          .toList(),
      distances: (json['distances'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$_QueryResponseToJson(_$_QueryResponse instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'embeddings': instance.embeddings,
      'metadatas': instance.metadatas,
      'documents': instance.documents,
      'distances': instance.distances,
    };

_$_UpdateCollection _$$_UpdateCollectionFromJson(Map<String, dynamic> json) =>
    _$_UpdateCollection(
      newName: json['new_name'] as String?,
      newMetadata: json['new_metadata'],
    );

Map<String, dynamic> _$$_UpdateCollectionToJson(_$_UpdateCollection instance) =>
    <String, dynamic>{
      'new_name': instance.newName,
      'new_metadata': instance.newMetadata,
    };

_$_UpdateEmbedding _$$_UpdateEmbeddingFromJson(Map<String, dynamic> json) =>
    _$_UpdateEmbedding(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UpdateEmbeddingToJson(_$_UpdateEmbedding instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'embeddings': instance.embeddings,
      'metadatas': instance.metadatas,
      'documents': instance.documents,
    };

_$_HTTPValidationError _$$_HTTPValidationErrorFromJson(
        Map<String, dynamic> json) =>
    _$_HTTPValidationError(
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HTTPValidationErrorToJson(
        _$_HTTPValidationError instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };

_$_ValidationError _$$_ValidationErrorFromJson(Map<String, dynamic> json) =>
    _$_ValidationError(
      loc: json['loc'],
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_ValidationErrorToJson(_$_ValidationError instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
