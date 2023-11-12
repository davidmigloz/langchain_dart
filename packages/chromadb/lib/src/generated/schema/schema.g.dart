// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddEmbeddingImpl _$$AddEmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$AddEmbeddingImpl(
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      uris: (json['uris'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$AddEmbeddingImplToJson(_$AddEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embeddings', instance.embeddings);
  writeNotNull('metadatas', instance.metadatas);
  writeNotNull('documents', instance.documents);
  writeNotNull('uris', instance.uris);
  val['ids'] = instance.ids;
  return val;
}

_$CollectionTypeImpl _$$CollectionTypeImplFromJson(Map<String, dynamic> json) =>
    _$CollectionTypeImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CollectionTypeImplToJson(
    _$CollectionTypeImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}

_$CreateCollectionImpl _$$CreateCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCollectionImpl(
      name: json['name'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      getOrCreate: json['get_or_create'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateCollectionImplToJson(
    _$CreateCollectionImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  val['get_or_create'] = instance.getOrCreate;
  return val;
}

_$DatabaseTypeImpl _$$DatabaseTypeImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      tenant: json['tenant'] as String?,
    );

Map<String, dynamic> _$$DatabaseTypeImplToJson(_$DatabaseTypeImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tenant', instance.tenant);
  return val;
}

_$CreateDatabaseImpl _$$CreateDatabaseImplFromJson(Map<String, dynamic> json) =>
    _$CreateDatabaseImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CreateDatabaseImplToJson(
        _$CreateDatabaseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$TenantTypeImpl _$$TenantTypeImplFromJson(Map<String, dynamic> json) =>
    _$TenantTypeImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TenantTypeImplToJson(_$TenantTypeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$CreateTenantImpl _$$CreateTenantImplFromJson(Map<String, dynamic> json) =>
    _$CreateTenantImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CreateTenantImplToJson(_$CreateTenantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$DeleteEmbeddingImpl _$$DeleteEmbeddingImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteEmbeddingImpl(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      where: json['where'] as Map<String, dynamic>?,
      whereDocument: json['where_document'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DeleteEmbeddingImplToJson(
    _$DeleteEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ids', instance.ids);
  writeNotNull('where', instance.where);
  writeNotNull('where_document', instance.whereDocument);
  return val;
}

_$GetEmbeddingImpl _$$GetEmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$GetEmbeddingImpl(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      where: json['where'] as Map<String, dynamic>?,
      whereDocument: json['where_document'] as Map<String, dynamic>?,
      sort: json['sort'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      include:
          (json['include'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$GetEmbeddingImplToJson(_$GetEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ids', instance.ids);
  writeNotNull('where', instance.where);
  writeNotNull('where_document', instance.whereDocument);
  writeNotNull('sort', instance.sort);
  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  writeNotNull('include', instance.include);
  return val;
}

_$GetResponseImpl _$$GetResponseImplFromJson(Map<String, dynamic> json) =>
    _$GetResponseImpl(
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

Map<String, dynamic> _$$GetResponseImplToJson(_$GetResponseImpl instance) {
  final val = <String, dynamic>{
    'ids': instance.ids,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embeddings', instance.embeddings);
  writeNotNull('metadatas', instance.metadatas);
  writeNotNull('documents', instance.documents);
  return val;
}

_$HTTPValidationErrorImpl _$$HTTPValidationErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$HTTPValidationErrorImpl(
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HTTPValidationErrorImplToJson(
    _$HTTPValidationErrorImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detail', instance.detail?.map((e) => e.toJson()).toList());
  return val;
}

_$QueryEmbeddingImpl _$$QueryEmbeddingImplFromJson(Map<String, dynamic> json) =>
    _$QueryEmbeddingImpl(
      where: json['where'] as Map<String, dynamic>?,
      whereDocument: json['where_document'] as Map<String, dynamic>?,
      queryEmbeddings: (json['query_embeddings'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      nResults: json['n_results'] as int? ?? 10,
      include:
          (json['include'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QueryEmbeddingImplToJson(
    _$QueryEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where);
  writeNotNull('where_document', instance.whereDocument);
  val['query_embeddings'] = instance.queryEmbeddings;
  val['n_results'] = instance.nResults;
  writeNotNull('include', instance.include);
  return val;
}

_$QueryResponseImpl _$$QueryResponseImplFromJson(Map<String, dynamic> json) =>
    _$QueryResponseImpl(
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
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String?).toList())
          .toList(),
      uris: (json['uris'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String?).toList())
          .toList(),
      ids: (json['ids'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      distances: (json['distances'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$QueryResponseImplToJson(_$QueryResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embeddings', instance.embeddings);
  writeNotNull('metadatas', instance.metadatas);
  writeNotNull('documents', instance.documents);
  writeNotNull('data', instance.data);
  writeNotNull('uris', instance.uris);
  val['ids'] = instance.ids;
  writeNotNull('distances', instance.distances);
  return val;
}

_$UpdateCollectionImpl _$$UpdateCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCollectionImpl(
      newName: json['new_name'] as String?,
      newMetadata: json['new_metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UpdateCollectionImplToJson(
    _$UpdateCollectionImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('new_name', instance.newName);
  writeNotNull('new_metadata', instance.newMetadata);
  return val;
}

_$UpdateEmbeddingImpl _$$UpdateEmbeddingImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEmbeddingImpl(
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList())
          .toList(),
      metadatas: (json['metadatas'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>?)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      uris: (json['uris'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UpdateEmbeddingImplToJson(
    _$UpdateEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embeddings', instance.embeddings);
  writeNotNull('metadatas', instance.metadatas);
  writeNotNull('documents', instance.documents);
  writeNotNull('uris', instance.uris);
  val['ids'] = instance.ids;
  return val;
}

_$ValidationErrorImpl _$$ValidationErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidationErrorImpl(
      loc: json['loc'] as List<dynamic>,
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ValidationErrorImplToJson(
        _$ValidationErrorImpl instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
