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
  format: $enumDecodeNullable(
    _$ResponseFormatEnumMap,
    json['format'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
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
  if (instance.suffix case final value?) 'suffix': value,
  if (instance.system case final value?) 'system': value,
  if (instance.template case final value?) 'template': value,
  if (instance.context case final value?) 'context': value,
  'stream': instance.stream,
  if (instance.raw case final value?) 'raw': value,
  if (_$ResponseFormatEnumMap[instance.format] case final value?)
    'format': value,
  if (instance.keepAlive case final value?) 'keep_alive': value,
  if (instance.images case final value?) 'images': value,
  if (instance.options?.toJson() case final value?) 'options': value,
  if (instance.think case final value?) 'think': value,
};

const _$ResponseFormatEnumMap = {
  ResponseFormat.json: 'json',
};

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

Map<String, dynamic> _$RequestOptionsToJson(
  _RequestOptions instance,
) => <String, dynamic>{
  if (instance.numKeep case final value?) 'num_keep': value,
  if (instance.seed case final value?) 'seed': value,
  if (instance.numPredict case final value?) 'num_predict': value,
  if (instance.topK case final value?) 'top_k': value,
  if (instance.topP case final value?) 'top_p': value,
  if (instance.minP case final value?) 'min_p': value,
  if (instance.tfsZ case final value?) 'tfs_z': value,
  if (instance.typicalP case final value?) 'typical_p': value,
  if (instance.repeatLastN case final value?) 'repeat_last_n': value,
  if (instance.temperature case final value?) 'temperature': value,
  if (instance.repeatPenalty case final value?) 'repeat_penalty': value,
  if (instance.presencePenalty case final value?) 'presence_penalty': value,
  if (instance.frequencyPenalty case final value?) 'frequency_penalty': value,
  if (instance.mirostat case final value?) 'mirostat': value,
  if (instance.mirostatTau case final value?) 'mirostat_tau': value,
  if (instance.mirostatEta case final value?) 'mirostat_eta': value,
  if (instance.penalizeNewline case final value?) 'penalize_newline': value,
  if (instance.stop case final value?) 'stop': value,
  if (instance.numa case final value?) 'numa': value,
  if (instance.numCtx case final value?) 'num_ctx': value,
  if (instance.numBatch case final value?) 'num_batch': value,
  if (instance.numGpu case final value?) 'num_gpu': value,
  if (instance.mainGpu case final value?) 'main_gpu': value,
  if (instance.lowVram case final value?) 'low_vram': value,
  if (instance.f16Kv case final value?) 'f16_kv': value,
  if (instance.logitsAll case final value?) 'logits_all': value,
  if (instance.vocabOnly case final value?) 'vocab_only': value,
  if (instance.useMmap case final value?) 'use_mmap': value,
  if (instance.useMlock case final value?) 'use_mlock': value,
  if (instance.numThread case final value?) 'num_thread': value,
};

_VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    _VersionResponse(
      version: json['version'] as String?,
    );

Map<String, dynamic> _$VersionResponseToJson(_VersionResponse instance) =>
    <String, dynamic>{
      if (instance.version case final value?) 'version': value,
    };

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
  if (instance.model case final value?) 'model': value,
  if (instance.createdAt case final value?) 'created_at': value,
  if (instance.response case final value?) 'response': value,
  if (instance.thinking case final value?) 'thinking': value,
  if (instance.done case final value?) 'done': value,
  if (instance.context case final value?) 'context': value,
  if (instance.totalDuration case final value?) 'total_duration': value,
  if (instance.loadDuration case final value?) 'load_duration': value,
  if (instance.promptEvalCount case final value?) 'prompt_eval_count': value,
  if (instance.promptEvalDuration case final value?)
    'prompt_eval_duration': value,
  if (instance.evalCount case final value?) 'eval_count': value,
  if (instance.evalDuration case final value?) 'eval_duration': value,
};

_GenerateChatCompletionRequest _$GenerateChatCompletionRequestFromJson(
  Map<String, dynamic> json,
) => _GenerateChatCompletionRequest(
  model: json['model'] as String,
  messages: (json['messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  stream: json['stream'] as bool? ?? false,
  format: $enumDecodeNullable(
    _$ResponseFormatEnumMap,
    json['format'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
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
  if (_$ResponseFormatEnumMap[instance.format] case final value?)
    'format': value,
  if (instance.keepAlive case final value?) 'keep_alive': value,
  if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
    'tools': value,
  if (instance.options?.toJson() case final value?) 'options': value,
  if (instance.think case final value?) 'think': value,
};

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
  if (_$DoneReasonEnumMap[instance.doneReason] case final value?)
    'done_reason': value,
  if (instance.totalDuration case final value?) 'total_duration': value,
  if (instance.loadDuration case final value?) 'load_duration': value,
  if (instance.promptEvalCount case final value?) 'prompt_eval_count': value,
  if (instance.promptEvalDuration case final value?)
    'prompt_eval_duration': value,
  if (instance.evalCount case final value?) 'eval_count': value,
  if (instance.evalDuration case final value?) 'eval_duration': value,
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
  if (instance.thinking case final value?) 'thinking': value,
  if (instance.images case final value?) 'images': value,
  if (instance.toolCalls?.map((e) => e.toJson()).toList() case final value?)
    'tool_calls': value,
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
  if (instance.function?.toJson() case final value?) 'function': value,
};

const _$ToolTypeEnumMap = {
  ToolType.function: 'function',
};

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
  if (instance.function?.toJson() case final value?) 'function': value,
};

_ToolCallFunction _$ToolCallFunctionFromJson(Map<String, dynamic> json) =>
    _ToolCallFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ToolCallFunctionToJson(_ToolCallFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

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
  if (instance.options?.toJson() case final value?) 'options': value,
  if (instance.keepAlive case final value?) 'keep_alive': value,
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
) => <String, dynamic>{
  if (instance.embedding case final value?) 'embedding': value,
};

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
      if (instance.path case final value?) 'path': value,
      if (instance.quantize case final value?) 'quantize': value,
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
) => <String, dynamic>{
  if (_$CreateModelStatusEnumMap[instance.status] case final value?)
    'status': value,
};

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
      if (instance.models?.map((e) => e.toJson()).toList() case final value?)
        'models': value,
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
  if (instance.model case final value?) 'model': value,
  if (instance.modifiedAt case final value?) 'modified_at': value,
  if (instance.size case final value?) 'size': value,
  if (instance.digest case final value?) 'digest': value,
  if (instance.details?.toJson() case final value?) 'details': value,
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

Map<String, dynamic> _$ModelDetailsToJson(
  _ModelDetails instance,
) => <String, dynamic>{
  if (instance.parentModel case final value?) 'parent_model': value,
  if (instance.format case final value?) 'format': value,
  if (instance.family case final value?) 'family': value,
  if (instance.families case final value?) 'families': value,
  if (instance.parameterSize case final value?) 'parameter_size': value,
  if (instance.quantizationLevel case final value?) 'quantization_level': value,
};

_ModelInformation _$ModelInformationFromJson(Map<String, dynamic> json) =>
    _ModelInformation(
      generalArchitecture: json['general.architecture'] as String?,
      generalFileType: (json['general.file_type'] as num?)?.toInt(),
      generalParameterCount: (json['general.parameter_count'] as num?)?.toInt(),
      generalQuantizationVersion: (json['general.quantization_version'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$ModelInformationToJson(
  _ModelInformation instance,
) => <String, dynamic>{
  if (instance.generalArchitecture case final value?)
    'general.architecture': value,
  if (instance.generalFileType case final value?) 'general.file_type': value,
  if (instance.generalParameterCount case final value?)
    'general.parameter_count': value,
  if (instance.generalQuantizationVersion case final value?)
    'general.quantization_version': value,
};

_Tensor _$TensorFromJson(Map<String, dynamic> json) => _Tensor(
  name: json['name'] as String?,
  type: json['type'] as String?,
  shape: (json['shape'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$TensorToJson(_Tensor instance) => <String, dynamic>{
  if (instance.name case final value?) 'name': value,
  if (instance.type case final value?) 'type': value,
  if (instance.shape case final value?) 'shape': value,
};

_ProcessResponse _$ProcessResponseFromJson(Map<String, dynamic> json) =>
    _ProcessResponse(
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => ProcessModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessResponseToJson(_ProcessResponse instance) =>
    <String, dynamic>{
      if (instance.models?.map((e) => e.toJson()).toList() case final value?)
        'models': value,
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
      if (instance.model case final value?) 'model': value,
      if (instance.size case final value?) 'size': value,
      if (instance.digest case final value?) 'digest': value,
      if (instance.details?.toJson() case final value?) 'details': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
      if (instance.sizeVram case final value?) 'size_vram': value,
    };

_ModelInfoRequest _$ModelInfoRequestFromJson(Map<String, dynamic> json) =>
    _ModelInfoRequest(
      model: json['model'] as String,
    );

Map<String, dynamic> _$ModelInfoRequestToJson(_ModelInfoRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
    };

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
      if (instance.license case final value?) 'license': value,
      if (instance.modelfile case final value?) 'modelfile': value,
      if (instance.parameters case final value?) 'parameters': value,
      if (instance.template case final value?) 'template': value,
      if (instance.system case final value?) 'system': value,
      if (instance.details?.toJson() case final value?) 'details': value,
      if (instance.messages?.map((e) => e.toJson()).toList() case final value?)
        'messages': value,
      if (instance.modelInfo?.toJson() case final value?) 'model_info': value,
      if (instance.projectorInfo case final value?) 'projector_info': value,
      if (instance.tensors?.map((e) => e.toJson()).toList() case final value?)
        'tensors': value,
      if (instance.capabilities?.map((e) => _$CapabilityEnumMap[e]!).toList()
          case final value?)
        'capabilities': value,
      if (instance.modifiedAt case final value?) 'modified_at': value,
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
    _DeleteModelRequest(
      model: json['model'] as String,
    );

Map<String, dynamic> _$DeleteModelRequestToJson(_DeleteModelRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
    };

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
      if (instance.username case final value?) 'username': value,
      if (instance.password case final value?) 'password': value,
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
      if (_$PullModelStatusEnumMap[instance.status] case final value?)
        'status': value,
      if (instance.digest case final value?) 'digest': value,
      if (instance.total case final value?) 'total': value,
      if (instance.completed case final value?) 'completed': value,
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
      if (instance.username case final value?) 'username': value,
      if (instance.password case final value?) 'password': value,
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
      if (instance.status case final value?) 'status': value,
      if (instance.digest case final value?) 'digest': value,
      if (instance.total case final value?) 'total': value,
      if (instance.completed case final value?) 'completed': value,
    };
