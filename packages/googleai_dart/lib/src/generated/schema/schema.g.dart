// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_constructors, prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchEmbedContentsResponse _$BatchEmbedContentsResponseFromJson(
        Map<String, dynamic> json) =>
    _BatchEmbedContentsResponse(
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) => ContentEmbedding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchEmbedContentsResponseToJson(
        _BatchEmbedContentsResponse instance) =>
    <String, dynamic>{
      if (instance.embeddings?.map((e) => e.toJson()).toList()
          case final value?)
        'embeddings': value,
    };

_Candidate _$CandidateFromJson(Map<String, dynamic> json) => _Candidate(
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
      index: (json['index'] as num?)?.toInt(),
      tokenCount: (json['tokenCount'] as num?)?.toInt(),
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CandidateToJson(_Candidate instance) =>
    <String, dynamic>{
      if (instance.content?.toJson() case final value?) 'content': value,
      if (_$CandidateFinishReasonEnumMap[instance.finishReason]
          case final value?)
        'finishReason': value,
      if (instance.citationMetadata?.toJson() case final value?)
        'citationMetadata': value,
      if (instance.index case final value?) 'index': value,
      if (instance.tokenCount case final value?) 'tokenCount': value,
      if (instance.safetyRatings?.map((e) => e.toJson()).toList()
          case final value?)
        'safetyRatings': value,
    };

const _$CandidateFinishReasonEnumMap = {
  CandidateFinishReason.finishReasonUnspecified: 'FINISH_REASON_UNSPECIFIED',
  CandidateFinishReason.stop: 'STOP',
  CandidateFinishReason.maxTokens: 'MAX_TOKENS',
  CandidateFinishReason.safety: 'SAFETY',
  CandidateFinishReason.recitation: 'RECITATION',
  CandidateFinishReason.other: 'OTHER',
};

_CreateTunedModelMetadata _$CreateTunedModelMetadataFromJson(
        Map<String, dynamic> json) =>
    _CreateTunedModelMetadata(
      totalSteps: (json['totalSteps'] as num?)?.toInt(),
      tunedModel: json['tunedModel'] as String?,
      completedSteps: (json['completedSteps'] as num?)?.toInt(),
      snapshots: (json['snapshots'] as List<dynamic>?)
          ?.map((e) => TuningSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedPercent: (json['completedPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateTunedModelMetadataToJson(
        _CreateTunedModelMetadata instance) =>
    <String, dynamic>{
      if (instance.totalSteps case final value?) 'totalSteps': value,
      if (instance.tunedModel case final value?) 'tunedModel': value,
      if (instance.completedSteps case final value?) 'completedSteps': value,
      if (instance.snapshots?.map((e) => e.toJson()).toList() case final value?)
        'snapshots': value,
      if (instance.completedPercent case final value?)
        'completedPercent': value,
    };

_BatchEmbedContentsRequest _$BatchEmbedContentsRequestFromJson(
        Map<String, dynamic> json) =>
    _BatchEmbedContentsRequest(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => EmbedContentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchEmbedContentsRequestToJson(
        _BatchEmbedContentsRequest instance) =>
    <String, dynamic>{
      if (instance.requests?.map((e) => e.toJson()).toList() case final value?)
        'requests': value,
    };

_SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) =>
    _SafetyRating(
      category: $enumDecodeNullable(
          _$SafetyRatingCategoryEnumMap, json['category'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      probability: $enumDecodeNullable(
          _$SafetyRatingProbabilityEnumMap, json['probability'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      blocked: json['blocked'] as bool?,
    );

Map<String, dynamic> _$SafetyRatingToJson(_SafetyRating instance) =>
    <String, dynamic>{
      if (_$SafetyRatingCategoryEnumMap[instance.category] case final value?)
        'category': value,
      if (_$SafetyRatingProbabilityEnumMap[instance.probability]
          case final value?)
        'probability': value,
      if (instance.blocked case final value?) 'blocked': value,
    };

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

_Part _$PartFromJson(Map<String, dynamic> json) => _Part(
      inlineData: json['inlineData'] == null
          ? null
          : Blob.fromJson(json['inlineData'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PartToJson(_Part instance) => <String, dynamic>{
      if (instance.inlineData?.toJson() case final value?) 'inlineData': value,
      if (instance.text case final value?) 'text': value,
    };

_Operation _$OperationFromJson(Map<String, dynamic> json) => _Operation(
      name: json['name'] as String?,
      response: json['response'] as Map<String, dynamic>?,
      done: json['done'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Status.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationToJson(_Operation instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.response case final value?) 'response': value,
      if (instance.done case final value?) 'done': value,
      if (instance.metadata case final value?) 'metadata': value,
      if (instance.error?.toJson() case final value?) 'error': value,
    };

_Status _$StatusFromJson(Map<String, dynamic> json) => _Status(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$StatusToJson(_Status instance) => <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.message case final value?) 'message': value,
      if (instance.details case final value?) 'details': value,
    };

_CitationMetadata _$CitationMetadataFromJson(Map<String, dynamic> json) =>
    _CitationMetadata(
      citationSources: (json['citationSources'] as List<dynamic>?)
          ?.map((e) => CitationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitationMetadataToJson(_CitationMetadata instance) =>
    <String, dynamic>{
      if (instance.citationSources?.map((e) => e.toJson()).toList()
          case final value?)
        'citationSources': value,
    };

_SafetySetting _$SafetySettingFromJson(Map<String, dynamic> json) =>
    _SafetySetting(
      category: $enumDecodeNullable(
          _$SafetySettingCategoryEnumMap, json['category'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      threshold: $enumDecodeNullable(
          _$SafetySettingThresholdEnumMap, json['threshold'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$SafetySettingToJson(_SafetySetting instance) =>
    <String, dynamic>{
      if (_$SafetySettingCategoryEnumMap[instance.category] case final value?)
        'category': value,
      if (_$SafetySettingThresholdEnumMap[instance.threshold] case final value?)
        'threshold': value,
    };

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

_CitationSource _$CitationSourceFromJson(Map<String, dynamic> json) =>
    _CitationSource(
      license: json['license'] as String?,
      uri: json['uri'] as String?,
      endIndex: (json['endIndex'] as num?)?.toInt(),
      startIndex: (json['startIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CitationSourceToJson(_CitationSource instance) =>
    <String, dynamic>{
      if (instance.license case final value?) 'license': value,
      if (instance.uri case final value?) 'uri': value,
      if (instance.endIndex case final value?) 'endIndex': value,
      if (instance.startIndex case final value?) 'startIndex': value,
    };

_GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) =>
    _GenerationConfig(
      temperature: (json['temperature'] as num?)?.toDouble(),
      stopSequences: (json['stopSequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      topK: (json['topK'] as num?)?.toInt(),
      topP: (json['topP'] as num?)?.toDouble(),
      candidateCount: (json['candidateCount'] as num?)?.toInt(),
      maxOutputTokens: (json['maxOutputTokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GenerationConfigToJson(_GenerationConfig instance) =>
    <String, dynamic>{
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.stopSequences case final value?) 'stopSequences': value,
      if (instance.topK case final value?) 'topK': value,
      if (instance.topP case final value?) 'topP': value,
      if (instance.candidateCount case final value?) 'candidateCount': value,
      if (instance.maxOutputTokens case final value?) 'maxOutputTokens': value,
    };

_CountTokensRequest _$CountTokensRequestFromJson(Map<String, dynamic> json) =>
    _CountTokensRequest(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountTokensRequestToJson(_CountTokensRequest instance) =>
    <String, dynamic>{
      if (instance.contents?.map((e) => e.toJson()).toList() case final value?)
        'contents': value,
    };

_TuningSnapshot _$TuningSnapshotFromJson(Map<String, dynamic> json) =>
    _TuningSnapshot(
      step: (json['step'] as num?)?.toInt(),
      computeTime: json['computeTime'] as String?,
      epoch: (json['epoch'] as num?)?.toInt(),
      meanLoss: (json['meanLoss'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TuningSnapshotToJson(_TuningSnapshot instance) =>
    <String, dynamic>{
      if (instance.step case final value?) 'step': value,
      if (instance.computeTime case final value?) 'computeTime': value,
      if (instance.epoch case final value?) 'epoch': value,
      if (instance.meanLoss case final value?) 'meanLoss': value,
    };

_Blob _$BlobFromJson(Map<String, dynamic> json) => _Blob(
      mimeType: json['mimeType'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$BlobToJson(_Blob instance) => <String, dynamic>{
      if (instance.mimeType case final value?) 'mimeType': value,
      if (instance.data case final value?) 'data': value,
    };

_ListModelsResponse _$ListModelsResponseFromJson(Map<String, dynamic> json) =>
    _ListModelsResponse(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );

Map<String, dynamic> _$ListModelsResponseToJson(_ListModelsResponse instance) =>
    <String, dynamic>{
      if (instance.models?.map((e) => e.toJson()).toList() case final value?)
        'models': value,
      if (instance.nextPageToken case final value?) 'nextPageToken': value,
    };

_ContentEmbedding _$ContentEmbeddingFromJson(Map<String, dynamic> json) =>
    _ContentEmbedding(
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ContentEmbeddingToJson(_ContentEmbedding instance) =>
    <String, dynamic>{
      if (instance.values case final value?) 'values': value,
    };

_PromptFeedback _$PromptFeedbackFromJson(Map<String, dynamic> json) =>
    _PromptFeedback(
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockReason: $enumDecodeNullable(
          _$PromptFeedbackBlockReasonEnumMap, json['blockReason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
    );

Map<String, dynamic> _$PromptFeedbackToJson(_PromptFeedback instance) =>
    <String, dynamic>{
      if (instance.safetyRatings?.map((e) => e.toJson()).toList()
          case final value?)
        'safetyRatings': value,
      if (_$PromptFeedbackBlockReasonEnumMap[instance.blockReason]
          case final value?)
        'blockReason': value,
    };

const _$PromptFeedbackBlockReasonEnumMap = {
  PromptFeedbackBlockReason.blockReasonUnspecified: 'BLOCK_REASON_UNSPECIFIED',
  PromptFeedbackBlockReason.safety: 'SAFETY',
  PromptFeedbackBlockReason.other: 'OTHER',
};

_EmbedContentRequest _$EmbedContentRequestFromJson(Map<String, dynamic> json) =>
    _EmbedContentRequest(
      title: json['title'] as String?,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      taskType: $enumDecodeNullable(
          _$EmbedContentRequestTaskTypeEnumMap, json['taskType'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      model: json['model'] as String?,
      outputDimensionality: (json['outputDimensionality'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmbedContentRequestToJson(
        _EmbedContentRequest instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.content?.toJson() case final value?) 'content': value,
      if (_$EmbedContentRequestTaskTypeEnumMap[instance.taskType]
          case final value?)
        'taskType': value,
      if (instance.model case final value?) 'model': value,
      if (instance.outputDimensionality case final value?)
        'outputDimensionality': value,
    };

const _$EmbedContentRequestTaskTypeEnumMap = {
  EmbedContentRequestTaskType.taskTypeUnspecified: 'TASK_TYPE_UNSPECIFIED',
  EmbedContentRequestTaskType.retrievalQuery: 'RETRIEVAL_QUERY',
  EmbedContentRequestTaskType.retrievalDocument: 'RETRIEVAL_DOCUMENT',
  EmbedContentRequestTaskType.semanticSimilarity: 'SEMANTIC_SIMILARITY',
  EmbedContentRequestTaskType.classification: 'CLASSIFICATION',
  EmbedContentRequestTaskType.clustering: 'CLUSTERING',
  EmbedContentRequestTaskType.questionAnswering: 'QUESTION_ANSWERING',
  EmbedContentRequestTaskType.factVerification: 'FACT_VERIFICATION',
};

_ListOperationsResponse _$ListOperationsResponseFromJson(
        Map<String, dynamic> json) =>
    _ListOperationsResponse(
      operations: (json['operations'] as List<dynamic>?)
          ?.map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );

Map<String, dynamic> _$ListOperationsResponseToJson(
        _ListOperationsResponse instance) =>
    <String, dynamic>{
      if (instance.operations?.map((e) => e.toJson()).toList()
          case final value?)
        'operations': value,
      if (instance.nextPageToken case final value?) 'nextPageToken': value,
    };

_Empty _$EmptyFromJson(Map<String, dynamic> json) => _Empty();

Map<String, dynamic> _$EmptyToJson(_Empty instance) => <String, dynamic>{};

_Content _$ContentFromJson(Map<String, dynamic> json) => _Content(
      role: json['role'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(_Content instance) => <String, dynamic>{
      if (instance.role case final value?) 'role': value,
      if (instance.parts?.map((e) => e.toJson()).toList() case final value?)
        'parts': value,
    };

_CancelOperationRequest _$CancelOperationRequestFromJson(
        Map<String, dynamic> json) =>
    _CancelOperationRequest();

Map<String, dynamic> _$CancelOperationRequestToJson(
        _CancelOperationRequest instance) =>
    <String, dynamic>{};

_EmbedContentResponse _$EmbedContentResponseFromJson(
        Map<String, dynamic> json) =>
    _EmbedContentResponse(
      embedding: json['embedding'] == null
          ? null
          : ContentEmbedding.fromJson(
              json['embedding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmbedContentResponseToJson(
        _EmbedContentResponse instance) =>
    <String, dynamic>{
      if (instance.embedding?.toJson() case final value?) 'embedding': value,
    };

_CountTokensResponse _$CountTokensResponseFromJson(Map<String, dynamic> json) =>
    _CountTokensResponse(
      totalTokens: (json['totalTokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountTokensResponseToJson(
        _CountTokensResponse instance) =>
    <String, dynamic>{
      if (instance.totalTokens case final value?) 'totalTokens': value,
    };

_GenerateContentResponse _$GenerateContentResponseFromJson(
        Map<String, dynamic> json) =>
    _GenerateContentResponse(
      promptFeedback: json['promptFeedback'] == null
          ? null
          : PromptFeedback.fromJson(
              json['promptFeedback'] as Map<String, dynamic>),
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenerateContentResponseToJson(
        _GenerateContentResponse instance) =>
    <String, dynamic>{
      if (instance.promptFeedback?.toJson() case final value?)
        'promptFeedback': value,
      if (instance.candidates?.map((e) => e.toJson()).toList()
          case final value?)
        'candidates': value,
    };

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      version: json['version'] as String?,
      baseModelId: json['baseModelId'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topK: (json['topK'] as num?)?.toInt(),
      topP: (json['topP'] as num?)?.toDouble(),
      inputTokenLimit: (json['inputTokenLimit'] as num?)?.toInt(),
      outputTokenLimit: (json['outputTokenLimit'] as num?)?.toInt(),
      supportedGenerationMethods:
          (json['supportedGenerationMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.displayName case final value?) 'displayName': value,
      if (instance.description case final value?) 'description': value,
      if (instance.version case final value?) 'version': value,
      if (instance.baseModelId case final value?) 'baseModelId': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.topK case final value?) 'topK': value,
      if (instance.topP case final value?) 'topP': value,
      if (instance.inputTokenLimit case final value?) 'inputTokenLimit': value,
      if (instance.outputTokenLimit case final value?)
        'outputTokenLimit': value,
      if (instance.supportedGenerationMethods case final value?)
        'supportedGenerationMethods': value,
    };

_GenerateContentRequest _$GenerateContentRequestFromJson(
        Map<String, dynamic> json) =>
    _GenerateContentRequest(
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

Map<String, dynamic> _$GenerateContentRequestToJson(
        _GenerateContentRequest instance) =>
    <String, dynamic>{
      if (instance.generationConfig?.toJson() case final value?)
        'generationConfig': value,
      if (instance.contents?.map((e) => e.toJson()).toList() case final value?)
        'contents': value,
      if (instance.safetySettings?.map((e) => e.toJson()).toList()
          case final value?)
        'safetySettings': value,
    };
