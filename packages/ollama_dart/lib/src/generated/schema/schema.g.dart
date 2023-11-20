// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateRequestImpl _$$GenerateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateRequestImpl(
      model: json['model'] as String,
      prompt: json['prompt'] as String,
      system: json['system'] as String?,
      template: json['template'] as String?,
      context:
          (json['context'] as List<dynamic>?)?.map((e) => e as int).toList(),
      stream: json['stream'] as bool?,
      raw: json['raw'] as bool?,
      format: $enumDecodeNullable(
          _$GenerateRequestFormatEnumMap, json['format'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenerateRequestImplToJson(
    _$GenerateRequestImpl instance) {
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
  writeNotNull('stream', instance.stream);
  writeNotNull('raw', instance.raw);
  writeNotNull('format', _$GenerateRequestFormatEnumMap[instance.format]);
  writeNotNull('options', instance.options);
  return val;
}

const _$GenerateRequestFormatEnumMap = {
  GenerateRequestFormat.json: 'json',
};

_$GenerateResponseImpl _$$GenerateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateResponseImpl(
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

Map<String, dynamic> _$$GenerateResponseImplToJson(
    _$GenerateResponseImpl instance) {
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

_$CreateRequestImpl _$$CreateRequestImplFromJson(Map<String, dynamic> json) =>
    _$CreateRequestImpl(
      name: json['name'] as String,
      modelfile: json['modelfile'] as String,
      path: json['path'] as String?,
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$CreateRequestImplToJson(_$CreateRequestImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'modelfile': instance.modelfile,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('path', instance.path);
  writeNotNull('stream', instance.stream);
  return val;
}

_$CreateResponseImpl _$$CreateResponseImplFromJson(Map<String, dynamic> json) =>
    _$CreateResponseImpl(
      status: $enumDecodeNullable(_$CreateResponseStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$CreateResponseImplToJson(
    _$CreateResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$CreateResponseStatusEnumMap[instance.status]);
  return val;
}

const _$CreateResponseStatusEnumMap = {
  CreateResponseStatus.creatingSystemLayer: 'creating system layer',
  CreateResponseStatus.parsingModelfile: 'parsing modelfile',
  CreateResponseStatus.success: 'success',
};

_$OptionsImpl _$$OptionsImplFromJson(Map<String, dynamic> json) =>
    _$OptionsImpl(
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

Map<String, dynamic> _$$OptionsImplToJson(_$OptionsImpl instance) {
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

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      name: json['name'] as String?,
      modifiedAt: json['modified_at'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) {
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

_$TagResponseImpl _$$TagResponseImplFromJson(Map<String, dynamic> json) =>
    _$TagResponseImpl(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TagResponseImplToJson(_$TagResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('models', instance.models);
  return val;
}

_$ShowRequestImpl _$$ShowRequestImplFromJson(Map<String, dynamic> json) =>
    _$ShowRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ShowRequestImplToJson(_$ShowRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$ShowResponseImpl _$$ShowResponseImplFromJson(Map<String, dynamic> json) =>
    _$ShowResponseImpl(
      license: json['license'] as String?,
      modelfile: json['modelfile'] as String?,
      parameters: json['parameters'] as String?,
      template: json['template'] as String?,
    );

Map<String, dynamic> _$$ShowResponseImplToJson(_$ShowResponseImpl instance) {
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

_$CopyRequestImpl _$$CopyRequestImplFromJson(Map<String, dynamic> json) =>
    _$CopyRequestImpl(
      source: json['source'] as String,
      destination: json['destination'] as String,
    );

Map<String, dynamic> _$$CopyRequestImplToJson(_$CopyRequestImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

_$DeleteRequestImpl _$$DeleteRequestImplFromJson(Map<String, dynamic> json) =>
    _$DeleteRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DeleteRequestImplToJson(_$DeleteRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$PullRequestImpl _$$PullRequestImplFromJson(Map<String, dynamic> json) =>
    _$PullRequestImpl(
      name: json['name'] as String,
      insecure: json['insecure'] as bool?,
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$PullRequestImplToJson(_$PullRequestImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('insecure', instance.insecure);
  writeNotNull('stream', instance.stream);
  return val;
}

_$PullResponseImpl _$$PullResponseImplFromJson(Map<String, dynamic> json) =>
    _$PullResponseImpl(
      status: $enumDecodeNullable(_$PullResponseStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      digest: json['digest'] as String?,
      total: json['total'] as int?,
      completed: json['completed'] as int?,
    );

Map<String, dynamic> _$$PullResponseImplToJson(_$PullResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$PullResponseStatusEnumMap[instance.status]);
  writeNotNull('digest', instance.digest);
  writeNotNull('total', instance.total);
  writeNotNull('completed', instance.completed);
  return val;
}

const _$PullResponseStatusEnumMap = {
  PullResponseStatus.pullingManifest: 'pulling manifest',
  PullResponseStatus.downloadingDigestname: 'downloading digestname',
  PullResponseStatus.verifyingSha256Digest: 'verifying sha256 digest',
  PullResponseStatus.writingManifest: 'writing manifest',
  PullResponseStatus.removingAnyUnusedLayers: 'removing any unused layers',
  PullResponseStatus.success: 'success',
};

_$PushRequestImpl _$$PushRequestImplFromJson(Map<String, dynamic> json) =>
    _$PushRequestImpl(
      name: json['name'] as String,
      insecure: json['insecure'] as bool?,
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$$PushRequestImplToJson(_$PushRequestImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('insecure', instance.insecure);
  writeNotNull('stream', instance.stream);
  return val;
}

_$PushResponseImpl _$$PushResponseImplFromJson(Map<String, dynamic> json) =>
    _$PushResponseImpl(
      status: $enumDecodeNullable(_$PushResponseStatusEnumMap, json['status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      digest: json['digest'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$PushResponseImplToJson(_$PushResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$PushResponseStatusEnumMap[instance.status]);
  writeNotNull('digest', instance.digest);
  writeNotNull('total', instance.total);
  return val;
}

const _$PushResponseStatusEnumMap = {
  PushResponseStatus.retrievingManifest: 'retrieving manifest',
  PushResponseStatus.startingUpload: 'starting upload',
  PushResponseStatus.pushingManifest: 'pushing manifest',
  PushResponseStatus.success: 'success',
};

_$EmbeddingRequestImpl _$$EmbeddingRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingRequestImpl(
      model: json['model'] as String,
      prompt: json['prompt'] as String,
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmbeddingRequestImplToJson(
    _$EmbeddingRequestImpl instance) {
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

_$EmbeddingResponseImpl _$$EmbeddingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddingResponseImpl(
      embedding: (json['embedding'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$EmbeddingResponseImplToJson(
    _$EmbeddingResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embedding', instance.embedding);
  return val;
}
