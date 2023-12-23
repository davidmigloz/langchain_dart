// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_constructors, prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TuningSnapshotImpl _$$TuningSnapshotImplFromJson(Map<String, dynamic> json) =>
    _$TuningSnapshotImpl(
      step: json['step'] as int?,
      computeTime: json['computeTime'] as String?,
      epoch: json['epoch'] as int?,
      meanLoss: (json['meanLoss'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TuningSnapshotImplToJson(
    _$TuningSnapshotImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('step', instance.step);
  writeNotNull('computeTime', instance.computeTime);
  writeNotNull('epoch', instance.epoch);
  writeNotNull('meanLoss', instance.meanLoss);
  return val;
}

_$CreateTunedModelMetadataImpl _$$CreateTunedModelMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTunedModelMetadataImpl(
      totalSteps: json['totalSteps'] as int?,
      tunedModel: json['tunedModel'] as String?,
      completedSteps: json['completedSteps'] as int?,
      snapshots: (json['snapshots'] as List<dynamic>?)
          ?.map((e) => TuningSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedPercent: (json['completedPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CreateTunedModelMetadataImplToJson(
    _$CreateTunedModelMetadataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalSteps', instance.totalSteps);
  writeNotNull('tunedModel', instance.tunedModel);
  writeNotNull('completedSteps', instance.completedSteps);
  writeNotNull(
      'snapshots', instance.snapshots?.map((e) => e.toJson()).toList());
  writeNotNull('completedPercent', instance.completedPercent);
  return val;
}

_$GenerationConfigImpl _$$GenerationConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerationConfigImpl(
      topP: (json['topP'] as num?)?.toDouble(),
      topK: json['topK'] as int?,
      candidateCount: json['candidateCount'] as int?,
      maxOutputTokens: json['maxOutputTokens'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      stopSequences: (json['stopSequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$GenerationConfigImplToJson(
    _$GenerationConfigImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topP', instance.topP);
  writeNotNull('topK', instance.topK);
  writeNotNull('candidateCount', instance.candidateCount);
  writeNotNull('maxOutputTokens', instance.maxOutputTokens);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('stopSequences', instance.stopSequences);
  return val;
}

_$ListOperationsResponseImpl _$$ListOperationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListOperationsResponseImpl(
      nextPageToken: json['nextPageToken'] as String?,
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListOperationsResponseImplToJson(
    _$ListOperationsResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageToken', instance.nextPageToken);
  writeNotNull(
      'operations', instance.operations?.map((e) => e.toJson()).toList());
  return val;
}

_$ModelImpl _$$ModelImplFromJson(Map<String, dynamic> json) => _$ModelImpl(
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      topK: json['topK'] as int?,
      version: json['version'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      baseModelId: json['baseModelId'] as String?,
      inputTokenLimit: json['inputTokenLimit'] as int?,
      outputTokenLimit: json['outputTokenLimit'] as int?,
      supportedGenerationMethods:
          (json['supportedGenerationMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$ModelImplToJson(_$ModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('description', instance.description);
  writeNotNull('topK', instance.topK);
  writeNotNull('version', instance.version);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('topP', instance.topP);
  writeNotNull('baseModelId', instance.baseModelId);
  writeNotNull('inputTokenLimit', instance.inputTokenLimit);
  writeNotNull('outputTokenLimit', instance.outputTokenLimit);
  writeNotNull(
      'supportedGenerationMethods', instance.supportedGenerationMethods);
  return val;
}

_$SafetyRatingImpl _$$SafetyRatingImplFromJson(Map<String, dynamic> json) =>
    _$SafetyRatingImpl(
      category: $enumDecodeNullable(
          _$SafetyRatingCategoryEnumMap, json['category'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      probability: $enumDecodeNullable(
          _$SafetyRatingProbabilityEnumMap, json['probability'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      blocked: json['blocked'] as bool?,
    );

Map<String, dynamic> _$$SafetyRatingImplToJson(_$SafetyRatingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', _$SafetyRatingCategoryEnumMap[instance.category]);
  writeNotNull(
      'probability', _$SafetyRatingProbabilityEnumMap[instance.probability]);
  writeNotNull('blocked', instance.blocked);
  return val;
}

const _$SafetyRatingCategoryEnumMap = {
  SafetyRatingCategory.harmCategoryUnspecified: 'HARM_CATEGORY_UNSPECIFIED',
  SafetyRatingCategory.harmCategoryDerogatory: 'HARM_CATEGORY_DEROGATORY',
  SafetyRatingCategory.harmCategoryToxicity: 'HARM_CATEGORY_TOXICITY',
  SafetyRatingCategory.harmCategoryViolence: 'HARM_CATEGORY_VIOLENCE',
  SafetyRatingCategory.harmCategorySexual: 'HARM_CATEGORY_SEXUAL',
  SafetyRatingCategory.harmCategoryMedical: 'HARM_CATEGORY_MEDICAL',
  SafetyRatingCategory.harmCategoryDangerous: 'HARM_CATEGORY_DANGEROUS',
  SafetyRatingCategory.harmCategoryHarassment: 'HARM_CATEGORY_HARASSMENT',
  SafetyRatingCategory.harmCategoryHateSpeech: 'HARM_CATEGORY_HATE_SPEECH',
  SafetyRatingCategory.harmCategorySexuallyExplicit:
      'HARM_CATEGORY_SEXUALLY_EXPLICIT',
  SafetyRatingCategory.harmCategoryDangerousContent:
      'HARM_CATEGORY_DANGEROUS_CONTENT',
};

const _$SafetyRatingProbabilityEnumMap = {
  SafetyRatingProbability.harmProbabilityUnspecified:
      'HARM_PROBABILITY_UNSPECIFIED',
  SafetyRatingProbability.negligible: 'NEGLIGIBLE',
  SafetyRatingProbability.low: 'LOW',
  SafetyRatingProbability.medium: 'MEDIUM',
  SafetyRatingProbability.high: 'HIGH',
};

_$PartImpl _$$PartImplFromJson(Map<String, dynamic> json) => _$PartImpl(
      inlineData: json['inlineData'] == null
          ? null
          : Blob.fromJson(json['inlineData'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$PartImplToJson(_$PartImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inlineData', instance.inlineData?.toJson());
  writeNotNull('text', instance.text);
  return val;
}

_$EmptyImpl _$$EmptyImplFromJson(Map<String, dynamic> json) => _$EmptyImpl();

Map<String, dynamic> _$$EmptyImplToJson(_$EmptyImpl instance) =>
    <String, dynamic>{};

_$GenerateContentRequestImpl _$$GenerateContentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateContentRequestImpl(
      generationConfig: json['generationConfig'] == null
          ? null
          : GenerationConfig.fromJson(
              json['generationConfig'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      safetySettings: (json['safetySettings'] as List<dynamic>?)
          ?.map((e) => SafetySetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenerateContentRequestImplToJson(
    _$GenerateContentRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('generationConfig', instance.generationConfig?.toJson());
  writeNotNull('contents', instance.contents?.map((e) => e.toJson()).toList());
  writeNotNull('safetySettings',
      instance.safetySettings?.map((e) => e.toJson()).toList());
  return val;
}

_$EmbedContentResponseImpl _$$EmbedContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbedContentResponseImpl(
      embedding: json['embedding'] == null
          ? null
          : ContentEmbedding.fromJson(
              json['embedding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmbedContentResponseImplToJson(
    _$EmbedContentResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('embedding', instance.embedding?.toJson());
  return val;
}

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      role: json['role'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  writeNotNull('parts', instance.parts?.map((e) => e.toJson()).toList());
  return val;
}

_$CancelOperationRequestImpl _$$CancelOperationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CancelOperationRequestImpl();

Map<String, dynamic> _$$CancelOperationRequestImplToJson(
        _$CancelOperationRequestImpl instance) =>
    <String, dynamic>{};

_$EmbedContentRequestImpl _$$EmbedContentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbedContentRequestImpl(
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      taskType: $enumDecodeNullable(
          _$EmbedContentRequestTaskTypeEnumMap, json['taskType'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      model: json['model'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$EmbedContentRequestImplToJson(
    _$EmbedContentRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull(
      'taskType', _$EmbedContentRequestTaskTypeEnumMap[instance.taskType]);
  writeNotNull('model', instance.model);
  writeNotNull('title', instance.title);
  return val;
}

const _$EmbedContentRequestTaskTypeEnumMap = {
  EmbedContentRequestTaskType.taskTypeUnspecified: 'TASK_TYPE_UNSPECIFIED',
  EmbedContentRequestTaskType.retrievalQuery: 'RETRIEVAL_QUERY',
  EmbedContentRequestTaskType.retrievalDocument: 'RETRIEVAL_DOCUMENT',
  EmbedContentRequestTaskType.semanticSimilarity: 'SEMANTIC_SIMILARITY',
  EmbedContentRequestTaskType.classification: 'CLASSIFICATION',
  EmbedContentRequestTaskType.clustering: 'CLUSTERING',
};

_$ListModelsResponseImpl _$$ListModelsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListModelsResponseImpl(
      nextPageToken: json['nextPageToken'] as String?,
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListModelsResponseImplToJson(
    _$ListModelsResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPageToken', instance.nextPageToken);
  writeNotNull('models', instance.models?.map((e) => e.toJson()).toList());
  return val;
}

_$BatchEmbedContentsRequestImpl _$$BatchEmbedContentsRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchEmbedContentsRequestImpl(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => EmbedContentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BatchEmbedContentsRequestImplToJson(
    _$BatchEmbedContentsRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requests', instance.requests?.map((e) => e.toJson()).toList());
  return val;
}

_$ContentEmbeddingImpl _$$ContentEmbeddingImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentEmbeddingImpl(
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$ContentEmbeddingImplToJson(
    _$ContentEmbeddingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('values', instance.values);
  return val;
}

_$PromptFeedbackImpl _$$PromptFeedbackImplFromJson(Map<String, dynamic> json) =>
    _$PromptFeedbackImpl(
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockReason: $enumDecodeNullable(
          _$PromptFeedbackBlockReasonEnumMap, json['blockReason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$PromptFeedbackImplToJson(
    _$PromptFeedbackImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'safetyRatings', instance.safetyRatings?.map((e) => e.toJson()).toList());
  writeNotNull(
      'blockReason', _$PromptFeedbackBlockReasonEnumMap[instance.blockReason]);
  return val;
}

const _$PromptFeedbackBlockReasonEnumMap = {
  PromptFeedbackBlockReason.blockReasonUnspecified: 'BLOCK_REASON_UNSPECIFIED',
  PromptFeedbackBlockReason.safety: 'SAFETY',
  PromptFeedbackBlockReason.other: 'OTHER',
};

_$OperationImpl _$$OperationImplFromJson(Map<String, dynamic> json) =>
    _$OperationImpl(
      name: json['name'] as String?,
      response: json['response'] as Map<String, dynamic>?,
      done: json['done'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Status.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OperationImplToJson(_$OperationImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('response', instance.response);
  writeNotNull('done', instance.done);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('error', instance.error?.toJson());
  return val;
}

_$GenerateContentResponseImpl _$$GenerateContentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateContentResponseImpl(
      promptFeedback: json['promptFeedback'] == null
          ? null
          : PromptFeedback.fromJson(
              json['promptFeedback'] as Map<String, dynamic>),
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenerateContentResponseImplToJson(
    _$GenerateContentResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('promptFeedback', instance.promptFeedback?.toJson());
  writeNotNull(
      'candidates', instance.candidates?.map((e) => e.toJson()).toList());
  return val;
}

_$SafetySettingImpl _$$SafetySettingImplFromJson(Map<String, dynamic> json) =>
    _$SafetySettingImpl(
      category: $enumDecodeNullable(
          _$SafetySettingCategoryEnumMap, json['category'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      threshold: $enumDecodeNullable(
          _$SafetySettingThresholdEnumMap, json['threshold'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$$SafetySettingImplToJson(_$SafetySettingImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', _$SafetySettingCategoryEnumMap[instance.category]);
  writeNotNull(
      'threshold', _$SafetySettingThresholdEnumMap[instance.threshold]);
  return val;
}

const _$SafetySettingCategoryEnumMap = {
  SafetySettingCategory.harmCategoryUnspecified: 'HARM_CATEGORY_UNSPECIFIED',
  SafetySettingCategory.harmCategoryDerogatory: 'HARM_CATEGORY_DEROGATORY',
  SafetySettingCategory.harmCategoryToxicity: 'HARM_CATEGORY_TOXICITY',
  SafetySettingCategory.harmCategoryViolence: 'HARM_CATEGORY_VIOLENCE',
  SafetySettingCategory.harmCategorySexual: 'HARM_CATEGORY_SEXUAL',
  SafetySettingCategory.harmCategoryMedical: 'HARM_CATEGORY_MEDICAL',
  SafetySettingCategory.harmCategoryDangerous: 'HARM_CATEGORY_DANGEROUS',
  SafetySettingCategory.harmCategoryHarassment: 'HARM_CATEGORY_HARASSMENT',
  SafetySettingCategory.harmCategoryHateSpeech: 'HARM_CATEGORY_HATE_SPEECH',
  SafetySettingCategory.harmCategorySexuallyExplicit:
      'HARM_CATEGORY_SEXUALLY_EXPLICIT',
  SafetySettingCategory.harmCategoryDangerousContent:
      'HARM_CATEGORY_DANGEROUS_CONTENT',
};

const _$SafetySettingThresholdEnumMap = {
  SafetySettingThreshold.harmBlockThresholdUnspecified:
      'HARM_BLOCK_THRESHOLD_UNSPECIFIED',
  SafetySettingThreshold.blockLowAndAbove: 'BLOCK_LOW_AND_ABOVE',
  SafetySettingThreshold.blockMediumAndAbove: 'BLOCK_MEDIUM_AND_ABOVE',
  SafetySettingThreshold.blockOnlyHigh: 'BLOCK_ONLY_HIGH',
  SafetySettingThreshold.blockNone: 'BLOCK_NONE',
};

_$CandidateImpl _$$CandidateImplFromJson(Map<String, dynamic> json) =>
    _$CandidateImpl(
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      finishReason: $enumDecodeNullable(
          _$CandidateFinishReasonEnumMap, json['finishReason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      citationMetadata: json['citationMetadata'] == null
          ? null
          : CitationMetadata.fromJson(
              json['citationMetadata'] as Map<String, dynamic>),
      index: json['index'] as int?,
      tokenCount: json['tokenCount'] as int?,
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CandidateImplToJson(_$CandidateImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull(
      'finishReason', _$CandidateFinishReasonEnumMap[instance.finishReason]);
  writeNotNull('citationMetadata', instance.citationMetadata?.toJson());
  writeNotNull('index', instance.index);
  writeNotNull('tokenCount', instance.tokenCount);
  writeNotNull(
      'safetyRatings', instance.safetyRatings?.map((e) => e.toJson()).toList());
  return val;
}

const _$CandidateFinishReasonEnumMap = {
  CandidateFinishReason.finishReasonUnspecified: 'FINISH_REASON_UNSPECIFIED',
  CandidateFinishReason.stop: 'STOP',
  CandidateFinishReason.maxTokens: 'MAX_TOKENS',
  CandidateFinishReason.safety: 'SAFETY',
  CandidateFinishReason.recitation: 'RECITATION',
  CandidateFinishReason.other: 'OTHER',
};

_$CountTokensResponseImpl _$$CountTokensResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CountTokensResponseImpl(
      totalTokens: json['totalTokens'] as int?,
    );

Map<String, dynamic> _$$CountTokensResponseImplToJson(
    _$CountTokensResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalTokens', instance.totalTokens);
  return val;
}

_$CountTokensRequestImpl _$$CountTokensRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CountTokensRequestImpl(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountTokensRequestImplToJson(
    _$CountTokensRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contents', instance.contents?.map((e) => e.toJson()).toList());
  return val;
}

_$BatchEmbedContentsResponseImpl _$$BatchEmbedContentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchEmbedContentsResponseImpl(
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) => ContentEmbedding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BatchEmbedContentsResponseImplToJson(
    _$BatchEmbedContentsResponseImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'embeddings', instance.embeddings?.map((e) => e.toJson()).toList());
  return val;
}

_$CitationMetadataImpl _$$CitationMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CitationMetadataImpl(
      citationSources: (json['citationSources'] as List<dynamic>?)
          ?.map((e) => CitationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CitationMetadataImplToJson(
    _$CitationMetadataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('citationSources',
      instance.citationSources?.map((e) => e.toJson()).toList());
  return val;
}

_$BlobImpl _$$BlobImplFromJson(Map<String, dynamic> json) => _$BlobImpl(
      mimeType: json['mimeType'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$BlobImplToJson(_$BlobImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mimeType', instance.mimeType);
  writeNotNull('data', instance.data);
  return val;
}

_$CitationSourceImpl _$$CitationSourceImplFromJson(Map<String, dynamic> json) =>
    _$CitationSourceImpl(
      endIndex: json['endIndex'] as int?,
      license: json['license'] as String?,
      uri: json['uri'] as String?,
      startIndex: json['startIndex'] as int?,
    );

Map<String, dynamic> _$$CitationSourceImplToJson(
    _$CitationSourceImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endIndex', instance.endIndex);
  writeNotNull('license', instance.license);
  writeNotNull('uri', instance.uri);
  writeNotNull('startIndex', instance.startIndex);
  return val;
}

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('details', instance.details);
  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  return val;
}
