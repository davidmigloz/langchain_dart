// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateCompletionRequestImpl _$$GenerateCompletionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateCompletionRequestImpl(
      model: json['model'] as String,
      prompt: json['prompt'] as String,
      system: json['system'] as String?,
      template: json['template'] as String?,
      context:
          (json['context'] as List<dynamic>?)?.map((e) => e as int).toList(),
      options: json['options'] == null
          ? null
          : RequestOptions.fromJson(json['options'] as Map<String, dynamic>),
      format: $enumDecodeNullable(_$ResponseFormatEnumMap, json['format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      raw: json['raw'] as bool?,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$$GenerateCompletionRequestImplToJson(
    _$GenerateCompletionRequestImpl instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('system', instance.system);
  writeNotNull('template', instance.template);
  writeNotNull('context', instance.context);
  writeNotNull('options', instance.options);
  writeNotNull('format', _$ResponseFormatEnumMap[instance.format]);
  writeNotNull('raw', instance.raw);
  val['stream'] = instance.stream;
  return val;
}

const _$ResponseFormatEnumMap = {
  ResponseFormat.json: 'json',
};

_$RequestOptionsImpl _$$RequestOptionsImplFromJson(Map<String, dynamic> json) =>
    _$RequestOptionsImpl(
      numKeep: json['num_keep'] as int?,
      seed: json['seed'] as int?,
      numPredict: json['num_predict'] as int?,
      topK: json['top_k'] as int?,
      topP: (json['top_p'] as num?)?.toDouble(),
      tfsZ: (json['tfs_z'] as num?)?.toDouble(),
      typicalP: (json['typical_p'] as num?)?.toDouble(),
      repeatLastN: json['repeat_last_n'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      repeatPenalty: (json['repeat_penalty'] as num?)?.toDouble(),
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble(),
      mirostat: json['mirostat'] as int?,
      mirostatTau: (json['mirostat_tau'] as num?)?.toDouble(),
      mirostatEta: (json['mirostat_eta'] as num?)?.toDouble(),
      penalizeNewline: json['penalize_newline'] as bool?,
      stop: (json['stop'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numa: json['numa'] as bool?,
      numCtx: json['num_ctx'] as int?,
      numBatch: json['num_batch'] as int?,
      numGqa: json['num_gqa'] as int?,
      numGpu: json['num_gpu'] as int?,
      mainGpu: json['main_gpu'] as int?,
      lowVram: json['low_vram'] as bool?,
      f16Kv: json['f16_kv'] as bool?,
      logitsAll: json['logits_all'] as bool?,
      vocabOnly: json['vocab_only'] as bool?,
      useMmap: json['use_mmap'] as bool?,
      useMlock: json['use_mlock'] as bool?,
      embeddingOnly: json['embedding_only'] as bool?,
      ropeFrequencyBase: (json['rope_frequency_base'] as num?)?.toDouble(),
      ropeFrequencyScale: (json['rope_frequency_scale'] as num?)?.toDouble(),
      numThread: json['num_thread'] as int?,
    );

Map<String, dynamic> _$$RequestOptionsImplToJson(
    _$RequestOptionsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('num_keep', instance.numKeep);
  writeNotNull('seed', instance.seed);
  writeNotNull('num_predict', instance.numPredict);
  writeNotNull('top_k', instance.topK);
  writeNotNull('top_p', instance.topP);
  writeNotNull('tfs_z', instance.tfsZ);
  writeNotNull('typical_p', instance.typicalP);
  writeNotNull('repeat_last_n', instance.repeatLastN);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('repeat_penalty', instance.repeatPenalty);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('mirostat', instance.mirostat);
  writeNotNull('mirostat_tau', instance.mirostatTau);
  writeNotNull('mirostat_eta', instance.mirostatEta);
  writeNotNull('penalize_newline', instance.penalizeNewline);
  writeNotNull('stop', instance.stop);
  writeNotNull('numa', instance.numa);
  writeNotNull('num_ctx', instance.numCtx);
  writeNotNull('num_batch', instance.numBatch);
  writeNotNull('num_gqa', instance.numGqa);
  writeNotNull('num_gpu', instance.numGpu);
  writeNotNull('main_gpu', instance.mainGpu);
  writeNotNull('low_vram', instance.lowVram);
  writeNotNull('f16_kv', instance.f16Kv);
  writeNotNull('logits_all', instance.logitsAll);
  writeNotNull('vocab_only', instance.vocabOnly);
  writeNotNull('use_mmap', instance.useMmap);
  writeNotNull('use_mlock', instance.useMlock);
  writeNotNull('embedding_only', instance.embeddingOnly);
  writeNotNull('rope_frequency_base', instance.ropeFrequencyBase);
  writeNotNull('rope_frequency_scale', instance.ropeFrequencyScale);
  writeNotNull('num_thread', instance.numThread);
  return val;
}

_$GenerateCompletionResponseImpl _$$GenerateCompletionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateCompletionResponseImpl(
      model: json['model'] as String?,
      createdAt: json['created_at'] as String?,
      response: json['response'] as String?,
      done: json['done'] as bool?,
      context:
          (json['context'] as List<dynamic>?)?.map((e) => e as int).toList(),
      sampleCount: json['sample_count'] as int?,
      sampleDuration: json['sample_duration'] as int?,
      totalDuration: json['total_duration'] as int?,
      loadDuration: json['load_duration'] as int?,
      promptEvalCount: json['prompt_eval_count'] as int?,
      promptEvalDuration: json['prompt_eval_duration'] as int?,
      evalCount: json['eval_count'] as int?,
      evalDuration: json['eval_duration'] as int?,
    );

Map<String, dynamic> _$$GenerateCompletionResponseImplToJson(
    _$GenerateCompletionResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model', instance.model);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('response', instance.response);
  writeNotNull('done', instance.done);
  writeNotNull('context', instance.context);
  writeNotNull('sample_count', instance.sampleCount);
  writeNotNull('sample_duration', instance.sampleDuration);
  writeNotNull('total_duration', instance.totalDuration);
  writeNotNull('load_duration', instance.loadDuration);
  writeNotNull('prompt_eval_count', instance.promptEvalCount);
  writeNotNull('prompt_eval_duration', instance.promptEvalDuration);
  writeNotNull('eval_count', instance.evalCount);
  writeNotNull('eval_duration', instance.evalDuration);
  return val;
}

_$GenerateEmbeddingRequestImpl _$$GenerateEmbeddingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateEmbeddingRequestImpl(
      model: json['model'] as String,
      prompt: json['prompt'] as String,
      options: json['options'] == null
          ? null
          : RequestOptions.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerateEmbeddingRequestImplToJson(
    _$GenerateEmbeddingRequestImpl instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('options', instance.options);
  return val;
}

_$GenerateEmbeddingResponseImpl _$$GenerateEmbeddingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateEmbeddingResponseImpl(
      embedding: (json['embedding'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GenerateEmbeddingResponseImplToJson(
    _$GenerateEmbeddingResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embedding', instance.embedding);
  return val;
}

_$CreateModelRequestImpl _$$CreateModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateModelRequestImpl(
      name: json['name'] as String,
      modelfile: json['modelfile'] as String,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateModelRequestImplToJson(
        _$CreateModelRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'modelfile': instance.modelfile,
      'stream': instance.stream,
    };

_$CreateModelResponseImpl _$$CreateModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateModelResponseImpl(
      status: $enumDecodeNullable(_$CreateModelStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$CreateModelResponseImplToJson(
    _$CreateModelResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$CreateModelStatusEnumMap[instance.status]);
  return val;
}

const _$CreateModelStatusEnumMap = {
  CreateModelStatus.creatingSystemLayer: 'creating system layer',
  CreateModelStatus.parsingModelfile: 'parsing modelfile',
  CreateModelStatus.success: 'success',
};

_$ModelsResponseImpl _$$ModelsResponseImplFromJson(Map<String, dynamic> json) =>
    _$ModelsResponseImpl(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ModelsResponseImplToJson(
    _$ModelsResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('models', instance.models);
  return val;
}

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      name: json['name'] as String?,
      modifiedAt: json['modified_at'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('modified_at', instance.modifiedAt);
  writeNotNull('size', instance.size);
  return val;
}

_$ModelInfoRequestImpl _$$ModelInfoRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModelInfoRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ModelInfoRequestImplToJson(
        _$ModelInfoRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$ModelInfoImpl _$$ModelInfoImplFromJson(Map<String, dynamic> json) =>
    _$ModelInfoImpl(
      license: json['license'] as String?,
      modelfile: json['modelfile'] as String?,
      parameters: json['parameters'] as String?,
      template: json['template'] as String?,
    );

Map<String, dynamic> _$$ModelInfoImplToJson(_$ModelInfoImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('license', instance.license);
  writeNotNull('modelfile', instance.modelfile);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('template', instance.template);
  return val;
}

_$CopyModelRequestImpl _$$CopyModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CopyModelRequestImpl(
      source: json['source'] as String,
      destination: json['destination'] as String,
    );

Map<String, dynamic> _$$CopyModelRequestImplToJson(
        _$CopyModelRequestImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

_$DeleteModelRequestImpl _$$DeleteModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteModelRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DeleteModelRequestImplToJson(
        _$DeleteModelRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$PullModelRequestImpl _$$PullModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PullModelRequestImpl(
      name: json['name'] as String,
      insecure: json['insecure'] as bool? ?? false,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$$PullModelRequestImplToJson(
        _$PullModelRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'insecure': instance.insecure,
      'stream': instance.stream,
    };

_$PullModelResponseImpl _$$PullModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PullModelResponseImpl(
      status: $enumDecodeNullable(_$PullModelStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      digest: json['digest'] as String?,
      total: json['total'] as int?,
      completed: json['completed'] as int?,
    );

Map<String, dynamic> _$$PullModelResponseImplToJson(
    _$PullModelResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$PullModelStatusEnumMap[instance.status]);
  writeNotNull('digest', instance.digest);
  writeNotNull('total', instance.total);
  writeNotNull('completed', instance.completed);
  return val;
}

const _$PullModelStatusEnumMap = {
  PullModelStatus.pullingManifest: 'pulling manifest',
  PullModelStatus.downloadingDigestname: 'downloading digestname',
  PullModelStatus.verifyingSha256Digest: 'verifying sha256 digest',
  PullModelStatus.writingManifest: 'writing manifest',
  PullModelStatus.removingAnyUnusedLayers: 'removing any unused layers',
  PullModelStatus.success: 'success',
};

_$PushModelRequestImpl _$$PushModelRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PushModelRequestImpl(
      name: json['name'] as String,
      insecure: json['insecure'] as bool? ?? false,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$$PushModelRequestImplToJson(
        _$PushModelRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'insecure': instance.insecure,
      'stream': instance.stream,
    };

_$PushModelResponseImpl _$$PushModelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PushModelResponseImpl(
      status: $enumDecodeNullable(_$PushModelStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      digest: json['digest'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$PushModelResponseImplToJson(
    _$PushModelResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$PushModelStatusEnumMap[instance.status]);
  writeNotNull('digest', instance.digest);
  writeNotNull('total', instance.total);
  return val;
}

const _$PushModelStatusEnumMap = {
  PushModelStatus.retrievingManifest: 'retrieving manifest',
  PushModelStatus.startingUpload: 'starting upload',
  PushModelStatus.pushingManifest: 'pushing manifest',
  PushModelStatus.success: 'success',
};
