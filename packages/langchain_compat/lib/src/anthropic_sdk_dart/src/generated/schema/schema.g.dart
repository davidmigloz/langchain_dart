// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateMessageRequestImpl _$$CreateMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateMessageRequestImpl(
  model: const _ModelConverter().fromJson(json['model']),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  maxTokens: (json['max_tokens'] as num).toInt(),
  metadata: json['metadata'] == null
      ? null
      : CreateMessageRequestMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
  stopSequences: (json['stop_sequences'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  system: const _CreateMessageRequestSystemConverter().fromJson(json['system']),
  temperature: (json['temperature'] as num?)?.toDouble(),
  toolChoice: json['tool_choice'] == null
      ? null
      : ToolChoice.fromJson(json['tool_choice'] as Map<String, dynamic>),
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
  topK: (json['top_k'] as num?)?.toInt(),
  topP: (json['top_p'] as num?)?.toDouble(),
  stream: json['stream'] as bool? ?? false,
);

Map<String, dynamic> _$$CreateMessageRequestImplToJson(
  _$CreateMessageRequestImpl instance,
) {
  final val = <String, dynamic>{
    'model': const _ModelConverter().toJson(instance.model),
    'messages': instance.messages.map((e) => e.toJson()).toList(),
    'max_tokens': instance.maxTokens,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.toJson());
  writeNotNull('stop_sequences', instance.stopSequences);
  writeNotNull(
    'system',
    const _CreateMessageRequestSystemConverter().toJson(instance.system),
  );
  writeNotNull('temperature', instance.temperature);
  writeNotNull('tool_choice', instance.toolChoice?.toJson());
  writeNotNull('tools', instance.tools?.map((e) => e.toJson()).toList());
  writeNotNull('top_k', instance.topK);
  writeNotNull('top_p', instance.topP);
  val['stream'] = instance.stream;
  return val;
}

_$ModelCatalogImpl _$$ModelCatalogImplFromJson(Map<String, dynamic> json) =>
    _$ModelCatalogImpl(
      $enumDecode(_$ModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModelCatalogImplToJson(_$ModelCatalogImpl instance) =>
    <String, dynamic>{
      'value': _$ModelsEnumMap[instance.value]!,
      'runtimeType': instance.$type,
    };

const _$ModelsEnumMap = {
  Models.claude35SonnetLatest: 'claude-3-5-sonnet-latest',
  Models.claude35Sonnet20241022: 'claude-3-5-sonnet-20241022',
  Models.claude35Sonnet20240620: 'claude-3-5-sonnet-20240620',
  Models.claude3OpusLatest: 'claude-3-opus-latest',
  Models.claude3Opus20240229: 'claude-3-opus-20240229',
  Models.claude3Sonnet20240229: 'claude-3-sonnet-20240229',
  Models.claude3Haiku20240307: 'claude-3-haiku-20240307',
  Models.claude21: 'claude-2.1',
  Models.claude20: 'claude-2.0',
};

_$ModelIdImpl _$$ModelIdImplFromJson(Map<String, dynamic> json) =>
    _$ModelIdImpl(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ModelIdImplToJson(_$ModelIdImpl instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_$SystemMessageContentBlocksImpl _$$SystemMessageContentBlocksImplFromJson(
  Map<String, dynamic> json,
) => _$SystemMessageContentBlocksImpl(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$SystemMessageContentBlocksImplToJson(
  _$SystemMessageContentBlocksImpl instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

_$SystemMessageContentTextImpl _$$SystemMessageContentTextImplFromJson(
  Map<String, dynamic> json,
) => _$SystemMessageContentTextImpl(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$SystemMessageContentTextImplToJson(
  _$SystemMessageContentTextImpl instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_$CreateMessageRequestMetadataImpl _$$CreateMessageRequestMetadataImplFromJson(
  Map<String, dynamic> json,
) => _$CreateMessageRequestMetadataImpl(userId: json['user_id'] as String?);

Map<String, dynamic> _$$CreateMessageRequestMetadataImplToJson(
  _$CreateMessageRequestMetadataImpl instance,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  return val;
}

_$ToolChoiceImpl _$$ToolChoiceImplFromJson(Map<String, dynamic> json) =>
    _$ToolChoiceImpl(
      type: $enumDecode(_$ToolChoiceTypeEnumMap, json['type']),
      name: json['name'] as String?,
      disableParallelToolUse: json['disable_parallel_tool_use'] as bool?,
    );

Map<String, dynamic> _$$ToolChoiceImplToJson(_$ToolChoiceImpl instance) {
  final val = <String, dynamic>{
    'type': _$ToolChoiceTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('disable_parallel_tool_use', instance.disableParallelToolUse);
  return val;
}

const _$ToolChoiceTypeEnumMap = {
  ToolChoiceType.auto: 'auto',
  ToolChoiceType.any: 'any',
  ToolChoiceType.tool: 'tool',
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      content: const _MessageContentConverter().fromJson(json['content']),
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      model: json['model'] as String?,
      stopReason: $enumDecodeNullable(
        _$StopReasonEnumMap,
        json['stop_reason'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      stopSequence: json['stop_sequence'] as String?,
      type: json['type'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = const _MessageContentConverter().toJson(instance.content);
  val['role'] = _$MessageRoleEnumMap[instance.role]!;
  writeNotNull('model', instance.model);
  writeNotNull('stop_reason', _$StopReasonEnumMap[instance.stopReason]);
  writeNotNull('stop_sequence', instance.stopSequence);
  writeNotNull('type', instance.type);
  writeNotNull('usage', instance.usage?.toJson());
  return val;
}

const _$MessageRoleEnumMap = {
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
};

const _$StopReasonEnumMap = {
  StopReason.endTurn: 'end_turn',
  StopReason.maxTokens: 'max_tokens',
  StopReason.stopSequence: 'stop_sequence',
  StopReason.toolUse: 'tool_use',
};

_$MessageContentBlocksImpl _$$MessageContentBlocksImplFromJson(
  Map<String, dynamic> json,
) => _$MessageContentBlocksImpl(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$MessageContentBlocksImplToJson(
  _$MessageContentBlocksImpl instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

_$MessageContentTextImpl _$$MessageContentTextImplFromJson(
  Map<String, dynamic> json,
) => _$MessageContentTextImpl(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$MessageContentTextImplToJson(
  _$MessageContentTextImpl instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_$ImageBlockSourceImpl _$$ImageBlockSourceImplFromJson(
  Map<String, dynamic> json,
) => _$ImageBlockSourceImpl(
  data: json['data'] as String,
  mediaType: $enumDecode(
    _$ImageBlockSourceMediaTypeEnumMap,
    json['media_type'],
  ),
  type: $enumDecode(_$ImageBlockSourceTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$ImageBlockSourceImplToJson(
  _$ImageBlockSourceImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'media_type': _$ImageBlockSourceMediaTypeEnumMap[instance.mediaType]!,
  'type': _$ImageBlockSourceTypeEnumMap[instance.type]!,
};

const _$ImageBlockSourceMediaTypeEnumMap = {
  ImageBlockSourceMediaType.imageJpeg: 'image/jpeg',
  ImageBlockSourceMediaType.imagePng: 'image/png',
  ImageBlockSourceMediaType.imageGif: 'image/gif',
  ImageBlockSourceMediaType.imageWebp: 'image/webp',
};

const _$ImageBlockSourceTypeEnumMap = {ImageBlockSourceType.base64: 'base64'};

_$CacheControlEphemeralImpl _$$CacheControlEphemeralImplFromJson(
  Map<String, dynamic> json,
) => _$CacheControlEphemeralImpl(
  type:
      $enumDecodeNullable(_$CacheControlEphemeralTypeEnumMap, json['type']) ??
      CacheControlEphemeralType.ephemeral,
);

Map<String, dynamic> _$$CacheControlEphemeralImplToJson(
  _$CacheControlEphemeralImpl instance,
) => <String, dynamic>{
  'type': _$CacheControlEphemeralTypeEnumMap[instance.type]!,
};

const _$CacheControlEphemeralTypeEnumMap = {
  CacheControlEphemeralType.ephemeral: 'ephemeral',
};

_$UsageImpl _$$UsageImplFromJson(Map<String, dynamic> json) => _$UsageImpl(
  inputTokens: (json['input_tokens'] as num).toInt(),
  outputTokens: (json['output_tokens'] as num).toInt(),
  cacheCreationInputTokens: (json['cache_creation_input_tokens'] as num?)
      ?.toInt(),
  cacheReadInputTokens: (json['cache_read_input_tokens'] as num?)?.toInt(),
);

Map<String, dynamic> _$$UsageImplToJson(_$UsageImpl instance) {
  final val = <String, dynamic>{
    'input_tokens': instance.inputTokens,
    'output_tokens': instance.outputTokens,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
    'cache_creation_input_tokens',
    instance.cacheCreationInputTokens,
  );
  writeNotNull('cache_read_input_tokens', instance.cacheReadInputTokens);
  return val;
}

_$CreateMessageBatchRequestImpl _$$CreateMessageBatchRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateMessageBatchRequestImpl(
  requests: (json['requests'] as List<dynamic>)
      .map((e) => BatchMessageRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CreateMessageBatchRequestImplToJson(
  _$CreateMessageBatchRequestImpl instance,
) => <String, dynamic>{
  'requests': instance.requests.map((e) => e.toJson()).toList(),
};

_$BatchMessageRequestImpl _$$BatchMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$BatchMessageRequestImpl(
  customId: json['custom_id'] as String,
  params: CreateMessageRequest.fromJson(json['params'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$BatchMessageRequestImplToJson(
  _$BatchMessageRequestImpl instance,
) => <String, dynamic>{
  'custom_id': instance.customId,
  'params': instance.params.toJson(),
};

_$MessageBatchImpl _$$MessageBatchImplFromJson(Map<String, dynamic> json) =>
    _$MessageBatchImpl(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      expiresAt: json['expires_at'] as String,
      processingStatus: $enumDecode(
        _$MessageBatchProcessingStatusEnumMap,
        json['processing_status'],
      ),
      requestCounts: MessageBatchRequestCounts.fromJson(
        json['request_counts'] as Map<String, dynamic>,
      ),
      resultsUrl: json['results_url'] as String?,
      type: $enumDecode(_$MessageBatchTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageBatchImplToJson(_$MessageBatchImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt,
    'expires_at': instance.expiresAt,
    'processing_status':
        _$MessageBatchProcessingStatusEnumMap[instance.processingStatus]!,
    'request_counts': instance.requestCounts.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('results_url', instance.resultsUrl);
  val['type'] = _$MessageBatchTypeEnumMap[instance.type]!;
  return val;
}

const _$MessageBatchProcessingStatusEnumMap = {
  MessageBatchProcessingStatus.inProgress: 'in_progress',
  MessageBatchProcessingStatus.canceling: 'canceling',
  MessageBatchProcessingStatus.ended: 'ended',
};

const _$MessageBatchTypeEnumMap = {
  MessageBatchType.messageBatch: 'message_batch',
};

_$MessageBatchRequestCountsImpl _$$MessageBatchRequestCountsImplFromJson(
  Map<String, dynamic> json,
) => _$MessageBatchRequestCountsImpl(
  processing: (json['processing'] as num).toInt(),
  succeeded: (json['succeeded'] as num).toInt(),
  errored: (json['errored'] as num).toInt(),
  canceled: (json['canceled'] as num).toInt(),
  expired: (json['expired'] as num).toInt(),
);

Map<String, dynamic> _$$MessageBatchRequestCountsImplToJson(
  _$MessageBatchRequestCountsImpl instance,
) => <String, dynamic>{
  'processing': instance.processing,
  'succeeded': instance.succeeded,
  'errored': instance.errored,
  'canceled': instance.canceled,
  'expired': instance.expired,
};

_$MessageDeltaImpl _$$MessageDeltaImplFromJson(Map<String, dynamic> json) =>
    _$MessageDeltaImpl(
      stopReason: $enumDecodeNullable(
        _$StopReasonEnumMap,
        json['stop_reason'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      stopSequence: json['stop_sequence'] as String?,
    );

Map<String, dynamic> _$$MessageDeltaImplToJson(_$MessageDeltaImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stop_reason', _$StopReasonEnumMap[instance.stopReason]);
  writeNotNull('stop_sequence', instance.stopSequence);
  return val;
}

_$MessageDeltaUsageImpl _$$MessageDeltaUsageImplFromJson(
  Map<String, dynamic> json,
) => _$MessageDeltaUsageImpl(
  outputTokens: (json['output_tokens'] as num).toInt(),
);

Map<String, dynamic> _$$MessageDeltaUsageImplToJson(
  _$MessageDeltaUsageImpl instance,
) => <String, dynamic>{'output_tokens': instance.outputTokens};

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
  type: json['type'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{'type': instance.type, 'message': instance.message};

_$ToolCustomImpl _$$ToolCustomImplFromJson(Map<String, dynamic> json) =>
    _$ToolCustomImpl(
      type: json['type'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      inputSchema: json['input_schema'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ToolCustomImplToJson(_$ToolCustomImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  val['input_schema'] = instance.inputSchema;
  return val;
}

_$ToolComputerUseImpl _$$ToolComputerUseImplFromJson(
  Map<String, dynamic> json,
) => _$ToolComputerUseImpl(
  type: json['type'] as String? ?? 'computer_20241022',
  name: json['name'] as String? ?? 'computer',
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
  displayWidthPx: (json['display_width_px'] as num).toInt(),
  displayHeightPx: (json['display_height_px'] as num).toInt(),
  displayNumber: (json['display_number'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ToolComputerUseImplToJson(
  _$ToolComputerUseImpl instance,
) {
  final val = <String, dynamic>{'type': instance.type, 'name': instance.name};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  val['display_width_px'] = instance.displayWidthPx;
  val['display_height_px'] = instance.displayHeightPx;
  writeNotNull('display_number', instance.displayNumber);
  return val;
}

_$ToolTextEditorImpl _$$ToolTextEditorImplFromJson(Map<String, dynamic> json) =>
    _$ToolTextEditorImpl(
      type: json['type'] as String? ?? 'text_editor_20241022',
      name: json['name'] as String? ?? 'str_replace_editor',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ToolTextEditorImplToJson(
  _$ToolTextEditorImpl instance,
) {
  final val = <String, dynamic>{'type': instance.type, 'name': instance.name};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$ToolBashImpl _$$ToolBashImplFromJson(Map<String, dynamic> json) =>
    _$ToolBashImpl(
      type: json['type'] as String? ?? 'bash_20241022',
      name: json['name'] as String? ?? 'bash',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ToolBashImplToJson(_$ToolBashImpl instance) {
  final val = <String, dynamic>{'type': instance.type, 'name': instance.name};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$TextBlockImpl _$$TextBlockImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockImpl(
      text: json['text'] as String,
      type: json['type'] as String? ?? 'text',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$TextBlockImplToJson(_$TextBlockImpl instance) {
  final val = <String, dynamic>{'text': instance.text, 'type': instance.type};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$ImageBlockImpl _$$ImageBlockImplFromJson(Map<String, dynamic> json) =>
    _$ImageBlockImpl(
      source: ImageBlockSource.fromJson(json['source'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'image',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ImageBlockImplToJson(_$ImageBlockImpl instance) {
  final val = <String, dynamic>{
    'source': instance.source.toJson(),
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$ToolUseBlockImpl _$$ToolUseBlockImplFromJson(Map<String, dynamic> json) =>
    _$ToolUseBlockImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      input: json['input'] as Map<String, dynamic>,
      type: json['type'] as String? ?? 'tool_use',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ToolUseBlockImplToJson(_$ToolUseBlockImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'input': instance.input,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$ToolResultBlockImpl _$$ToolResultBlockImplFromJson(
  Map<String, dynamic> json,
) => _$ToolResultBlockImpl(
  toolUseId: json['tool_use_id'] as String,
  content: const _ToolResultBlockContentConverter().fromJson(json['content']),
  isError: json['is_error'] as bool?,
  type: json['type'] as String? ?? 'tool_result',
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$ToolResultBlockImplToJson(
  _$ToolResultBlockImpl instance,
) {
  final val = <String, dynamic>{
    'tool_use_id': instance.toolUseId,
    'content': const _ToolResultBlockContentConverter().toJson(
      instance.content,
    ),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_error', instance.isError);
  val['type'] = instance.type;
  writeNotNull('cache_control', instance.cacheControl?.toJson());
  return val;
}

_$ToolResultBlockContentBlocksImpl _$$ToolResultBlockContentBlocksImplFromJson(
  Map<String, dynamic> json,
) => _$ToolResultBlockContentBlocksImpl(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ToolResultBlockContentBlocksImplToJson(
  _$ToolResultBlockContentBlocksImpl instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

_$ToolResultBlockContentTextImpl _$$ToolResultBlockContentTextImplFromJson(
  Map<String, dynamic> json,
) => _$ToolResultBlockContentTextImpl(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ToolResultBlockContentTextImplToJson(
  _$ToolResultBlockContentTextImpl instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_$MessageStartEventImpl _$$MessageStartEventImplFromJson(
  Map<String, dynamic> json,
) => _$MessageStartEventImpl(
  message: Message.fromJson(json['message'] as Map<String, dynamic>),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$MessageStartEventImplToJson(
  _$MessageStartEventImpl instance,
) => <String, dynamic>{
  'message': instance.message.toJson(),
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

const _$MessageStreamEventTypeEnumMap = {
  MessageStreamEventType.messageStart: 'message_start',
  MessageStreamEventType.messageDelta: 'message_delta',
  MessageStreamEventType.messageStop: 'message_stop',
  MessageStreamEventType.contentBlockStart: 'content_block_start',
  MessageStreamEventType.contentBlockDelta: 'content_block_delta',
  MessageStreamEventType.contentBlockStop: 'content_block_stop',
  MessageStreamEventType.ping: 'ping',
  MessageStreamEventType.error: 'error',
};

_$MessageDeltaEventImpl _$$MessageDeltaEventImplFromJson(
  Map<String, dynamic> json,
) => _$MessageDeltaEventImpl(
  delta: MessageDelta.fromJson(json['delta'] as Map<String, dynamic>),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
  usage: MessageDeltaUsage.fromJson(json['usage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$MessageDeltaEventImplToJson(
  _$MessageDeltaEventImpl instance,
) => <String, dynamic>{
  'delta': instance.delta.toJson(),
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
  'usage': instance.usage.toJson(),
};

_$MessageStopEventImpl _$$MessageStopEventImplFromJson(
  Map<String, dynamic> json,
) => _$MessageStopEventImpl(
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$MessageStopEventImplToJson(
  _$MessageStopEventImpl instance,
) => <String, dynamic>{'type': _$MessageStreamEventTypeEnumMap[instance.type]!};

_$ContentBlockStartEventImpl _$$ContentBlockStartEventImplFromJson(
  Map<String, dynamic> json,
) => _$ContentBlockStartEventImpl(
  contentBlock: Block.fromJson(json['content_block'] as Map<String, dynamic>),
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$ContentBlockStartEventImplToJson(
  _$ContentBlockStartEventImpl instance,
) => <String, dynamic>{
  'content_block': instance.contentBlock.toJson(),
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

_$ContentBlockDeltaEventImpl _$$ContentBlockDeltaEventImplFromJson(
  Map<String, dynamic> json,
) => _$ContentBlockDeltaEventImpl(
  delta: BlockDelta.fromJson(json['delta'] as Map<String, dynamic>),
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$ContentBlockDeltaEventImplToJson(
  _$ContentBlockDeltaEventImpl instance,
) => <String, dynamic>{
  'delta': instance.delta.toJson(),
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

_$ContentBlockStopEventImpl _$$ContentBlockStopEventImplFromJson(
  Map<String, dynamic> json,
) => _$ContentBlockStopEventImpl(
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$ContentBlockStopEventImplToJson(
  _$ContentBlockStopEventImpl instance,
) => <String, dynamic>{
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

_$PingEventImpl _$$PingEventImplFromJson(Map<String, dynamic> json) =>
    _$PingEventImpl(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$PingEventImplToJson(_$PingEventImpl instance) =>
    <String, dynamic>{'type': _$MessageStreamEventTypeEnumMap[instance.type]!};

_$ErrorEventImpl _$$ErrorEventImplFromJson(Map<String, dynamic> json) =>
    _$ErrorEventImpl(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ErrorEventImplToJson(_$ErrorEventImpl instance) =>
    <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
      'error': instance.error.toJson(),
    };

_$TextBlockDeltaImpl _$$TextBlockDeltaImplFromJson(Map<String, dynamic> json) =>
    _$TextBlockDeltaImpl(
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$TextBlockDeltaImplToJson(
  _$TextBlockDeltaImpl instance,
) => <String, dynamic>{'text': instance.text, 'type': instance.type};

_$InputJsonBlockDeltaImpl _$$InputJsonBlockDeltaImplFromJson(
  Map<String, dynamic> json,
) => _$InputJsonBlockDeltaImpl(
  partialJson: json['partial_json'] as String?,
  type: json['type'] as String,
);

Map<String, dynamic> _$$InputJsonBlockDeltaImplToJson(
  _$InputJsonBlockDeltaImpl instance,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('partial_json', instance.partialJson);
  val['type'] = instance.type;
  return val;
}
