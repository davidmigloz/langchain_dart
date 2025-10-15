// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateCompletionRequest _$GenerateCompletionRequestFromJson(
  Map<String, dynamic> json,
) => _GenerateCompletionRequest(
  model: json['model'] as String,
  prompt: json['prompt'] as String,
  suffix: json['suffix'] as String?,
  system: json['system'] as String?,
  template: json['template'] as String?,
  context: (json['context'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  stream: json['stream'] as bool? ?? false,
  raw: json['raw'] as bool?,
  format: const _GenerateCompletionRequestFormatConverter().fromJson(
    json['format'],
  ),
  keepAlive: (json['keep_alive'] as num?)?.toInt(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  options: json['options'] == null
      ? null
      : RequestOptions.fromJson(json['options'] as Map<String, dynamic>),
  think: json['think'] as bool?,
);

Map<String, dynamic> _$GenerateCompletionRequestToJson(
  _GenerateCompletionRequest instance,
) => <String, dynamic>{
  'model': instance.model,
  'prompt': instance.prompt,
  'suffix': ?instance.suffix,
  'system': ?instance.system,
  'template': ?instance.template,
  'context': ?instance.context,
  'stream': instance.stream,
  'raw': ?instance.raw,
  'format': ?const _GenerateCompletionRequestFormatConverter().toJson(
    instance.format,
  ),
  'keep_alive': ?instance.keepAlive,
  'images': ?instance.images,
  'options': ?instance.options?.toJson(),
  'think': ?instance.think,
};

GenerateCompletionRequestFormatEnumeration
_$GenerateCompletionRequestFormatEnumerationFromJson(
  Map<String, dynamic> json,
) => GenerateCompletionRequestFormatEnumeration(
  $enumDecode(_$GenerateCompletionRequestFormatEnumEnumMap, json['value']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GenerateCompletionRequestFormatEnumerationToJson(
  GenerateCompletionRequestFormatEnumeration instance,
) => <String, dynamic>{
  'value': _$GenerateCompletionRequestFormatEnumEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$GenerateCompletionRequestFormatEnumEnumMap = {
  GenerateCompletionRequestFormatEnum.json: 'json',
};

GenerateCompletionRequestFormatMapStringDynamic
_$GenerateCompletionRequestFormatMapStringDynamicFromJson(
  Map<String, dynamic> json,
) => GenerateCompletionRequestFormatMapStringDynamic(
  json['value'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GenerateCompletionRequestFormatMapStringDynamicToJson(
  GenerateCompletionRequestFormatMapStringDynamic instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_RequestOptions _$RequestOptionsFromJson(Map<String, dynamic> json) =>
    _RequestOptions(
      numKeep: (json['num_keep'] as num?)?.toInt(),
      seed: (json['seed'] as num?)?.toInt(),
      numPredict: (json['num_predict'] as num?)?.toInt(),
      topK: (json['top_k'] as num?)?.toInt(),
      topP: (json['top_p'] as num?)?.toDouble(),
      minP: (json['min_p'] as num?)?.toDouble(),
      tfsZ: (json['tfs_z'] as num?)?.toDouble(),
      typicalP: (json['typical_p'] as num?)?.toDouble(),
      repeatLastN: (json['repeat_last_n'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      repeatPenalty: (json['repeat_penalty'] as num?)?.toDouble(),
      presencePenalty: (json['presence_penalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequency_penalty'] as num?)?.toDouble(),
      mirostat: (json['mirostat'] as num?)?.toInt(),
      mirostatTau: (json['mirostat_tau'] as num?)?.toDouble(),
      mirostatEta: (json['mirostat_eta'] as num?)?.toDouble(),
      penalizeNewline: json['penalize_newline'] as bool?,
      stop: (json['stop'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numa: json['numa'] as bool?,
      numCtx: (json['num_ctx'] as num?)?.toInt(),
      numBatch: (json['num_batch'] as num?)?.toInt(),
      numGpu: (json['num_gpu'] as num?)?.toInt(),
      mainGpu: (json['main_gpu'] as num?)?.toInt(),
      lowVram: json['low_vram'] as bool?,
      f16Kv: json['f16_kv'] as bool?,
      logitsAll: json['logits_all'] as bool?,
      vocabOnly: json['vocab_only'] as bool?,
      useMmap: json['use_mmap'] as bool?,
      useMlock: json['use_mlock'] as bool?,
      numThread: (json['num_thread'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RequestOptionsToJson(_RequestOptions instance) =>
    <String, dynamic>{
      'num_keep': ?instance.numKeep,
      'seed': ?instance.seed,
      'num_predict': ?instance.numPredict,
      'top_k': ?instance.topK,
      'top_p': ?instance.topP,
      'min_p': ?instance.minP,
      'tfs_z': ?instance.tfsZ,
      'typical_p': ?instance.typicalP,
      'repeat_last_n': ?instance.repeatLastN,
      'temperature': ?instance.temperature,
      'repeat_penalty': ?instance.repeatPenalty,
      'presence_penalty': ?instance.presencePenalty,
      'frequency_penalty': ?instance.frequencyPenalty,
      'mirostat': ?instance.mirostat,
      'mirostat_tau': ?instance.mirostatTau,
      'mirostat_eta': ?instance.mirostatEta,
      'penalize_newline': ?instance.penalizeNewline,
      'stop': ?instance.stop,
      'numa': ?instance.numa,
      'num_ctx': ?instance.numCtx,
      'num_batch': ?instance.numBatch,
      'num_gpu': ?instance.numGpu,
      'main_gpu': ?instance.mainGpu,
      'low_vram': ?instance.lowVram,
      'f16_kv': ?instance.f16Kv,
      'logits_all': ?instance.logitsAll,
      'vocab_only': ?instance.vocabOnly,
      'use_mmap': ?instance.useMmap,
      'use_mlock': ?instance.useMlock,
      'num_thread': ?instance.numThread,
    };

_VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    _VersionResponse(version: json['version'] as String?);

Map<String, dynamic> _$VersionResponseToJson(_VersionResponse instance) =>
    <String, dynamic>{'version': ?instance.version};

_GenerateCompletionResponse _$GenerateCompletionResponseFromJson(
  Map<String, dynamic> json,
) => _GenerateCompletionResponse(
  model: json['model'] as String?,
  createdAt: json['created_at'] as String?,
  response: json['response'] as String?,
  thinking: json['thinking'] as String?,
  done: json['done'] as bool?,
  context: (json['context'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  totalDuration: (json['total_duration'] as num?)?.toInt(),
  loadDuration: (json['load_duration'] as num?)?.toInt(),
  promptEvalCount: (json['prompt_eval_count'] as num?)?.toInt(),
  promptEvalDuration: (json['prompt_eval_duration'] as num?)?.toInt(),
  evalCount: (json['eval_count'] as num?)?.toInt(),
  evalDuration: (json['eval_duration'] as num?)?.toInt(),
);

Map<String, dynamic> _$GenerateCompletionResponseToJson(
  _GenerateCompletionResponse instance,
) => <String, dynamic>{
  'model': ?instance.model,
  'created_at': ?instance.createdAt,
  'response': ?instance.response,
  'thinking': ?instance.thinking,
  'done': ?instance.done,
  'context': ?instance.context,
  'total_duration': ?instance.totalDuration,
  'load_duration': ?instance.loadDuration,
  'prompt_eval_count': ?instance.promptEvalCount,
  'prompt_eval_duration': ?instance.promptEvalDuration,
  'eval_count': ?instance.evalCount,
  'eval_duration': ?instance.evalDuration,
};

_GenerateChatCompletionRequest _$GenerateChatCompletionRequestFromJson(
  Map<String, dynamic> json,
) => _GenerateChatCompletionRequest(
  model: json['model'] as String,
  messages: (json['messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  stream: json['stream'] as bool? ?? false,
  format: const _GenerateChatCompletionRequestFormatConverter().fromJson(
    json['format'],
  ),
  keepAlive: (json['keep_alive'] as num?)?.toInt(),
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
  options: json['options'] == null
      ? null
      : RequestOptions.fromJson(json['options'] as Map<String, dynamic>),
  think: json['think'] as bool?,
);

Map<String, dynamic> _$GenerateChatCompletionRequestToJson(
  _GenerateChatCompletionRequest instance,
) => <String, dynamic>{
  'model': instance.model,
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  'stream': instance.stream,
  'format': ?const _GenerateChatCompletionRequestFormatConverter().toJson(
    instance.format,
  ),
  'keep_alive': ?instance.keepAlive,
  'tools': ?instance.tools?.map((e) => e.toJson()).toList(),
  'options': ?instance.options?.toJson(),
  'think': ?instance.think,
};

GenerateChatCompletionRequestFormatEnumeration
_$GenerateChatCompletionRequestFormatEnumerationFromJson(
  Map<String, dynamic> json,
) => GenerateChatCompletionRequestFormatEnumeration(
  $enumDecode(_$GenerateChatCompletionRequestFormatEnumEnumMap, json['value']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GenerateChatCompletionRequestFormatEnumerationToJson(
  GenerateChatCompletionRequestFormatEnumeration instance,
) => <String, dynamic>{
  'value': _$GenerateChatCompletionRequestFormatEnumEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

const _$GenerateChatCompletionRequestFormatEnumEnumMap = {
  GenerateChatCompletionRequestFormatEnum.json: 'json',
};

GenerateChatCompletionRequestFormatMapStringDynamic
_$GenerateChatCompletionRequestFormatMapStringDynamicFromJson(
  Map<String, dynamic> json,
) => GenerateChatCompletionRequestFormatMapStringDynamic(
  json['value'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$GenerateChatCompletionRequestFormatMapStringDynamicToJson(
  GenerateChatCompletionRequestFormatMapStringDynamic instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_GenerateChatCompletionResponse _$GenerateChatCompletionResponseFromJson(
  Map<String, dynamic> json,
) => _GenerateChatCompletionResponse(
  message: Message.fromJson(json['message'] as Map<String, dynamic>),
  model: json['model'] as String,
  createdAt: json['created_at'] as String,
  done: json['done'] as bool,
  doneReason: $enumDecodeNullable(
    _$DoneReasonEnumMap,
    json['done_reason'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  totalDuration: (json['total_duration'] as num?)?.toInt(),
  loadDuration: (json['load_duration'] as num?)?.toInt(),
  promptEvalCount: (json['prompt_eval_count'] as num?)?.toInt(),
  promptEvalDuration: (json['prompt_eval_duration'] as num?)?.toInt(),
  evalCount: (json['eval_count'] as num?)?.toInt(),
  evalDuration: (json['eval_duration'] as num?)?.toInt(),
);

Map<String, dynamic> _$GenerateChatCompletionResponseToJson(
  _GenerateChatCompletionResponse instance,
) => <String, dynamic>{
  'message': instance.message.toJson(),
  'model': instance.model,
  'created_at': instance.createdAt,
  'done': instance.done,
  'done_reason': ?_$DoneReasonEnumMap[instance.doneReason],
  'total_duration': ?instance.totalDuration,
  'load_duration': ?instance.loadDuration,
  'prompt_eval_count': ?instance.promptEvalCount,
  'prompt_eval_duration': ?instance.promptEvalDuration,
  'eval_count': ?instance.evalCount,
  'eval_duration': ?instance.evalDuration,
};

const _$DoneReasonEnumMap = {
  DoneReason.stop: 'stop',
  DoneReason.length: 'length',
  DoneReason.load: 'load',
};

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  role: $enumDecode(_$MessageRoleEnumMap, json['role']),
  content: json['content'] as String,
  thinking: json['thinking'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  toolCalls: (json['tool_calls'] as List<dynamic>?)
      ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'role': _$MessageRoleEnumMap[instance.role]!,
  'content': instance.content,
  'thinking': ?instance.thinking,
  'images': ?instance.images,
  'tool_calls': ?instance.toolCalls?.map((e) => e.toJson()).toList(),
};

const _$MessageRoleEnumMap = {
  MessageRole.system: 'system',
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
  MessageRole.tool: 'tool',
};

_Tool _$ToolFromJson(Map<String, dynamic> json) => _Tool(
  type:
      $enumDecodeNullable(_$ToolTypeEnumMap, json['type']) ?? ToolType.function,
  function: json['function'] == null
      ? null
      : ToolFunction.fromJson(json['function'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ToolToJson(_Tool instance) => <String, dynamic>{
  'type': _$ToolTypeEnumMap[instance.type]!,
  'function': ?instance.function?.toJson(),
};

const _$ToolTypeEnumMap = {ToolType.function: 'function'};

_ToolFunction _$ToolFunctionFromJson(Map<String, dynamic> json) =>
    _ToolFunction(
      name: json['name'] as String,
      description: json['description'] as String,
      parameters: json['parameters'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ToolFunctionToJson(_ToolFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'parameters': instance.parameters,
    };

_ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => _ToolCall(
  function: json['function'] == null
      ? null
      : ToolCallFunction.fromJson(json['function'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ToolCallToJson(_ToolCall instance) => <String, dynamic>{
  'function': ?instance.function?.toJson(),
};

_ToolCallFunction _$ToolCallFunctionFromJson(Map<String, dynamic> json) =>
    _ToolCallFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ToolCallFunctionToJson(_ToolCallFunction instance) =>
    <String, dynamic>{'name': instance.name, 'arguments': instance.arguments};

_GenerateEmbeddingRequest _$GenerateEmbeddingRequestFromJson(
  Map<String, dynamic> json,
) => _GenerateEmbeddingRequest(
  model: json['model'] as String,
  prompt: json['prompt'] as String,
  options: json['options'] == null
      ? null
      : RequestOptions.fromJson(json['options'] as Map<String, dynamic>),
  keepAlive: (json['keep_alive'] as num?)?.toInt(),
);

Map<String, dynamic> _$GenerateEmbeddingRequestToJson(
  _GenerateEmbeddingRequest instance,
) => <String, dynamic>{
  'model': instance.model,
  'prompt': instance.prompt,
  'options': ?instance.options?.toJson(),
  'keep_alive': ?instance.keepAlive,
};

_GenerateEmbeddingResponse _$GenerateEmbeddingResponseFromJson(
  Map<String, dynamic> json,
) => _GenerateEmbeddingResponse(
  embedding: (json['embedding'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$GenerateEmbeddingResponseToJson(
  _GenerateEmbeddingResponse instance,
) => <String, dynamic>{'embedding': ?instance.embedding};

_CreateModelRequest _$CreateModelRequestFromJson(Map<String, dynamic> json) =>
    _CreateModelRequest(
      model: json['model'] as String,
      modelfile: json['modelfile'] as String,
      path: json['path'] as String?,
      quantize: json['quantize'] as String?,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$CreateModelRequestToJson(_CreateModelRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'modelfile': instance.modelfile,
      'path': ?instance.path,
      'quantize': ?instance.quantize,
      'stream': instance.stream,
    };

_CreateModelResponse _$CreateModelResponseFromJson(Map<String, dynamic> json) =>
    _CreateModelResponse(
      status: $enumDecodeNullable(
        _$CreateModelStatusEnumMap,
        json['status'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
    );

Map<String, dynamic> _$CreateModelResponseToJson(
  _CreateModelResponse instance,
) => <String, dynamic>{'status': ?_$CreateModelStatusEnumMap[instance.status]};

const _$CreateModelStatusEnumMap = {
  CreateModelStatus.creatingSystemLayer: 'creating system layer',
  CreateModelStatus.parsingModelfile: 'parsing modelfile',
  CreateModelStatus.success: 'success',
};

_ModelsResponse _$ModelsResponseFromJson(Map<String, dynamic> json) =>
    _ModelsResponse(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelsResponseToJson(_ModelsResponse instance) =>
    <String, dynamic>{
      'models': ?instance.models?.map((e) => e.toJson()).toList(),
    };

_Model _$ModelFromJson(Map<String, dynamic> json) => _Model(
  model: json['model'] as String?,
  modifiedAt: json['modified_at'] as String?,
  size: (json['size'] as num?)?.toInt(),
  digest: json['digest'] as String?,
  details: json['details'] == null
      ? null
      : ModelDetails.fromJson(json['details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ModelToJson(_Model instance) => <String, dynamic>{
  'model': ?instance.model,
  'modified_at': ?instance.modifiedAt,
  'size': ?instance.size,
  'digest': ?instance.digest,
  'details': ?instance.details?.toJson(),
};

_ModelDetails _$ModelDetailsFromJson(Map<String, dynamic> json) =>
    _ModelDetails(
      parentModel: json['parent_model'] as String?,
      format: json['format'] as String?,
      family: json['family'] as String?,
      families: (json['families'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parameterSize: json['parameter_size'] as String?,
      quantizationLevel: json['quantization_level'] as String?,
    );

Map<String, dynamic> _$ModelDetailsToJson(_ModelDetails instance) =>
    <String, dynamic>{
      'parent_model': ?instance.parentModel,
      'format': ?instance.format,
      'family': ?instance.family,
      'families': ?instance.families,
      'parameter_size': ?instance.parameterSize,
      'quantization_level': ?instance.quantizationLevel,
    };

_ModelInformation _$ModelInformationFromJson(Map<String, dynamic> json) =>
    _ModelInformation(
      generalArchitecture: json['general.architecture'] as String?,
      generalFileType: (json['general.file_type'] as num?)?.toInt(),
      generalParameterCount: (json['general.parameter_count'] as num?)?.toInt(),
      generalQuantizationVersion: (json['general.quantization_version'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$ModelInformationToJson(_ModelInformation instance) =>
    <String, dynamic>{
      'general.architecture': ?instance.generalArchitecture,
      'general.file_type': ?instance.generalFileType,
      'general.parameter_count': ?instance.generalParameterCount,
      'general.quantization_version': ?instance.generalQuantizationVersion,
    };

_Tensor _$TensorFromJson(Map<String, dynamic> json) => _Tensor(
  name: json['name'] as String?,
  type: json['type'] as String?,
  shape: (json['shape'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$TensorToJson(_Tensor instance) => <String, dynamic>{
  'name': ?instance.name,
  'type': ?instance.type,
  'shape': ?instance.shape,
};

_ProcessResponse _$ProcessResponseFromJson(Map<String, dynamic> json) =>
    _ProcessResponse(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => ProcessModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessResponseToJson(_ProcessResponse instance) =>
    <String, dynamic>{
      'models': ?instance.models?.map((e) => e.toJson()).toList(),
    };

_ProcessModel _$ProcessModelFromJson(Map<String, dynamic> json) =>
    _ProcessModel(
      model: json['model'] as String?,
      size: (json['size'] as num?)?.toInt(),
      digest: json['digest'] as String?,
      details: json['details'] == null
          ? null
          : ModelDetails.fromJson(json['details'] as Map<String, dynamic>),
      expiresAt: json['expires_at'] as String?,
      sizeVram: (json['size_vram'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProcessModelToJson(_ProcessModel instance) =>
    <String, dynamic>{
      'model': ?instance.model,
      'size': ?instance.size,
      'digest': ?instance.digest,
      'details': ?instance.details?.toJson(),
      'expires_at': ?instance.expiresAt,
      'size_vram': ?instance.sizeVram,
    };

_ModelInfoRequest _$ModelInfoRequestFromJson(Map<String, dynamic> json) =>
    _ModelInfoRequest(model: json['model'] as String);

Map<String, dynamic> _$ModelInfoRequestToJson(_ModelInfoRequest instance) =>
    <String, dynamic>{'model': instance.model};

_ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => _ModelInfo(
  license: json['license'] as String?,
  modelfile: json['modelfile'] as String?,
  parameters: json['parameters'] as String?,
  template: json['template'] as String?,
  system: json['system'] as String?,
  details: json['details'] == null
      ? null
      : ModelDetails.fromJson(json['details'] as Map<String, dynamic>),
  messages: (json['messages'] as List<dynamic>?)
      ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  modelInfo: json['model_info'] == null
      ? null
      : ModelInformation.fromJson(json['model_info'] as Map<String, dynamic>),
  projectorInfo: json['projector_info'] as Map<String, dynamic>?,
  tensors: (json['tensors'] as List<dynamic>?)
      ?.map((e) => Tensor.fromJson(e as Map<String, dynamic>))
      .toList(),
  capabilities: (json['capabilities'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$CapabilityEnumMap, e))
      .toList(),
  modifiedAt: json['modified_at'] as String?,
);

Map<String, dynamic> _$ModelInfoToJson(_ModelInfo instance) =>
    <String, dynamic>{
      'license': ?instance.license,
      'modelfile': ?instance.modelfile,
      'parameters': ?instance.parameters,
      'template': ?instance.template,
      'system': ?instance.system,
      'details': ?instance.details?.toJson(),
      'messages': ?instance.messages?.map((e) => e.toJson()).toList(),
      'model_info': ?instance.modelInfo?.toJson(),
      'projector_info': ?instance.projectorInfo,
      'tensors': ?instance.tensors?.map((e) => e.toJson()).toList(),
      'capabilities': ?instance.capabilities
          ?.map((e) => _$CapabilityEnumMap[e]!)
          .toList(),
      'modified_at': ?instance.modifiedAt,
    };

const _$CapabilityEnumMap = {
  Capability.completion: 'completion',
  Capability.tools: 'tools',
  Capability.insert: 'insert',
  Capability.vision: 'vision',
  Capability.embedding: 'embedding',
  Capability.thinking: 'thinking',
};

_CopyModelRequest _$CopyModelRequestFromJson(Map<String, dynamic> json) =>
    _CopyModelRequest(
      source: json['source'] as String,
      destination: json['destination'] as String,
    );

Map<String, dynamic> _$CopyModelRequestToJson(_CopyModelRequest instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

_DeleteModelRequest _$DeleteModelRequestFromJson(Map<String, dynamic> json) =>
    _DeleteModelRequest(model: json['model'] as String);

Map<String, dynamic> _$DeleteModelRequestToJson(_DeleteModelRequest instance) =>
    <String, dynamic>{'model': instance.model};

_PullModelRequest _$PullModelRequestFromJson(Map<String, dynamic> json) =>
    _PullModelRequest(
      model: json['model'] as String,
      insecure: json['insecure'] as bool? ?? false,
      username: json['username'] as String?,
      password: json['password'] as String?,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$PullModelRequestToJson(_PullModelRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'insecure': instance.insecure,
      'username': ?instance.username,
      'password': ?instance.password,
      'stream': instance.stream,
    };

_PullModelResponse _$PullModelResponseFromJson(Map<String, dynamic> json) =>
    _PullModelResponse(
      status: $enumDecodeNullable(
        _$PullModelStatusEnumMap,
        json['status'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      digest: json['digest'] as String?,
      total: (json['total'] as num?)?.toInt(),
      completed: (json['completed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PullModelResponseToJson(_PullModelResponse instance) =>
    <String, dynamic>{
      'status': ?_$PullModelStatusEnumMap[instance.status],
      'digest': ?instance.digest,
      'total': ?instance.total,
      'completed': ?instance.completed,
    };

const _$PullModelStatusEnumMap = {
  PullModelStatus.pullingManifest: 'pulling manifest',
  PullModelStatus.downloadingDigestname: 'downloading digestname',
  PullModelStatus.verifyingSha256Digest: 'verifying sha256 digest',
  PullModelStatus.writingManifest: 'writing manifest',
  PullModelStatus.removingAnyUnusedLayers: 'removing any unused layers',
  PullModelStatus.success: 'success',
};

_PushModelRequest _$PushModelRequestFromJson(Map<String, dynamic> json) =>
    _PushModelRequest(
      model: json['model'] as String,
      insecure: json['insecure'] as bool? ?? false,
      username: json['username'] as String?,
      password: json['password'] as String?,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$PushModelRequestToJson(_PushModelRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'insecure': instance.insecure,
      'username': ?instance.username,
      'password': ?instance.password,
      'stream': instance.stream,
    };

_PushModelResponse _$PushModelResponseFromJson(Map<String, dynamic> json) =>
    _PushModelResponse(
      status: json['status'] as String?,
      digest: json['digest'] as String?,
      total: (json['total'] as num?)?.toInt(),
      completed: (json['completed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PushModelResponseToJson(_PushModelResponse instance) =>
    <String, dynamic>{
      'status': ?instance.status,
      'digest': ?instance.digest,
      'total': ?instance.total,
      'completed': ?instance.completed,
    };
