// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMessageRequest _$CreateMessageRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateMessageRequest(
      model: const _ModelConverter().fromJson(json['model']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxTokens: (json['max_tokens'] as num).toInt(),
      metadata: json['metadata'] == null
          ? null
          : CreateMessageRequestMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
      stopSequences: (json['stop_sequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      system:
          const _CreateMessageRequestSystemConverter().fromJson(json['system']),
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

Map<String, dynamic> _$CreateMessageRequestToJson(
        _CreateMessageRequest instance) =>
    <String, dynamic>{
      'model': const _ModelConverter().toJson(instance.model),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'max_tokens': instance.maxTokens,
      if (instance.metadata?.toJson() case final value?) 'metadata': value,
      if (instance.stopSequences case final value?) 'stop_sequences': value,
      if (const _CreateMessageRequestSystemConverter().toJson(instance.system)
          case final value?)
        'system': value,
      if (instance.temperature case final value?) 'temperature': value,
      if (instance.toolChoice?.toJson() case final value?) 'tool_choice': value,
      if (instance.tools?.map((e) => e.toJson()).toList() case final value?)
        'tools': value,
      if (instance.topK case final value?) 'top_k': value,
      if (instance.topP case final value?) 'top_p': value,
      'stream': instance.stream,
    };

ModelCatalog _$ModelCatalogFromJson(Map<String, dynamic> json) => ModelCatalog(
      $enumDecode(_$ModelsEnumMap, json['value']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModelCatalogToJson(ModelCatalog instance) =>
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

ModelId _$ModelIdFromJson(Map<String, dynamic> json) => ModelId(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ModelIdToJson(ModelId instance) => <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

SystemMessageContentBlocks _$SystemMessageContentBlocksFromJson(
        Map<String, dynamic> json) =>
    SystemMessageContentBlocks(
      (json['value'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SystemMessageContentBlocksToJson(
        SystemMessageContentBlocks instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

SystemMessageContentText _$SystemMessageContentTextFromJson(
        Map<String, dynamic> json) =>
    SystemMessageContentText(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SystemMessageContentTextToJson(
        SystemMessageContentText instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_CreateMessageRequestMetadata _$CreateMessageRequestMetadataFromJson(
        Map<String, dynamic> json) =>
    _CreateMessageRequestMetadata(
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$CreateMessageRequestMetadataToJson(
        _CreateMessageRequestMetadata instance) =>
    <String, dynamic>{
      if (instance.userId case final value?) 'user_id': value,
    };

_ToolChoice _$ToolChoiceFromJson(Map<String, dynamic> json) => _ToolChoice(
      type: $enumDecode(_$ToolChoiceTypeEnumMap, json['type']),
      name: json['name'] as String?,
      disableParallelToolUse: json['disable_parallel_tool_use'] as bool?,
    );

Map<String, dynamic> _$ToolChoiceToJson(_ToolChoice instance) =>
    <String, dynamic>{
      'type': _$ToolChoiceTypeEnumMap[instance.type]!,
      if (instance.name case final value?) 'name': value,
      if (instance.disableParallelToolUse case final value?)
        'disable_parallel_tool_use': value,
    };

const _$ToolChoiceTypeEnumMap = {
  ToolChoiceType.auto: 'auto',
  ToolChoiceType.any: 'any',
  ToolChoiceType.tool: 'tool',
};

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
      id: json['id'] as String?,
      content: const _MessageContentConverter().fromJson(json['content']),
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      model: json['model'] as String?,
      stopReason: $enumDecodeNullable(_$StopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
      type: json['type'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'content': const _MessageContentConverter().toJson(instance.content),
      'role': _$MessageRoleEnumMap[instance.role]!,
      if (instance.model case final value?) 'model': value,
      if (_$StopReasonEnumMap[instance.stopReason] case final value?)
        'stop_reason': value,
      if (instance.stopSequence case final value?) 'stop_sequence': value,
      if (instance.type case final value?) 'type': value,
      if (instance.usage?.toJson() case final value?) 'usage': value,
    };

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

MessageContentBlocks _$MessageContentBlocksFromJson(
        Map<String, dynamic> json) =>
    MessageContentBlocks(
      (json['value'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MessageContentBlocksToJson(
        MessageContentBlocks instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

MessageContentText _$MessageContentTextFromJson(Map<String, dynamic> json) =>
    MessageContentText(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MessageContentTextToJson(MessageContentText instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_ImageBlockSource _$ImageBlockSourceFromJson(Map<String, dynamic> json) =>
    _ImageBlockSource(
      data: json['data'] as String,
      mediaType:
          $enumDecode(_$ImageBlockSourceMediaTypeEnumMap, json['media_type']),
      type: $enumDecode(_$ImageBlockSourceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ImageBlockSourceToJson(_ImageBlockSource instance) =>
    <String, dynamic>{
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

const _$ImageBlockSourceTypeEnumMap = {
  ImageBlockSourceType.base64: 'base64',
};

_CacheControlEphemeral _$CacheControlEphemeralFromJson(
        Map<String, dynamic> json) =>
    _CacheControlEphemeral(
      type: $enumDecodeNullable(
              _$CacheControlEphemeralTypeEnumMap, json['type']) ??
          CacheControlEphemeralType.ephemeral,
    );

Map<String, dynamic> _$CacheControlEphemeralToJson(
        _CacheControlEphemeral instance) =>
    <String, dynamic>{
      'type': _$CacheControlEphemeralTypeEnumMap[instance.type]!,
    };

const _$CacheControlEphemeralTypeEnumMap = {
  CacheControlEphemeralType.ephemeral: 'ephemeral',
};

_Usage _$UsageFromJson(Map<String, dynamic> json) => _Usage(
      inputTokens: (json['input_tokens'] as num).toInt(),
      outputTokens: (json['output_tokens'] as num).toInt(),
      cacheCreationInputTokens:
          (json['cache_creation_input_tokens'] as num?)?.toInt(),
      cacheReadInputTokens: (json['cache_read_input_tokens'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageToJson(_Usage instance) => <String, dynamic>{
      'input_tokens': instance.inputTokens,
      'output_tokens': instance.outputTokens,
      if (instance.cacheCreationInputTokens case final value?)
        'cache_creation_input_tokens': value,
      if (instance.cacheReadInputTokens case final value?)
        'cache_read_input_tokens': value,
    };

_CreateMessageBatchRequest _$CreateMessageBatchRequestFromJson(
        Map<String, dynamic> json) =>
    _CreateMessageBatchRequest(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => BatchMessageRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateMessageBatchRequestToJson(
        _CreateMessageBatchRequest instance) =>
    <String, dynamic>{
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };

_BatchMessageRequest _$BatchMessageRequestFromJson(Map<String, dynamic> json) =>
    _BatchMessageRequest(
      customId: json['custom_id'] as String,
      params:
          CreateMessageRequest.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BatchMessageRequestToJson(
        _BatchMessageRequest instance) =>
    <String, dynamic>{
      'custom_id': instance.customId,
      'params': instance.params.toJson(),
    };

_MessageBatch _$MessageBatchFromJson(Map<String, dynamic> json) =>
    _MessageBatch(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      expiresAt: json['expires_at'] as String,
      processingStatus: $enumDecode(
          _$MessageBatchProcessingStatusEnumMap, json['processing_status']),
      requestCounts: MessageBatchRequestCounts.fromJson(
          json['request_counts'] as Map<String, dynamic>),
      resultsUrl: json['results_url'] as String?,
      type: $enumDecode(_$MessageBatchTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MessageBatchToJson(_MessageBatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'expires_at': instance.expiresAt,
      'processing_status':
          _$MessageBatchProcessingStatusEnumMap[instance.processingStatus]!,
      'request_counts': instance.requestCounts.toJson(),
      if (instance.resultsUrl case final value?) 'results_url': value,
      'type': _$MessageBatchTypeEnumMap[instance.type]!,
    };

const _$MessageBatchProcessingStatusEnumMap = {
  MessageBatchProcessingStatus.inProgress: 'in_progress',
  MessageBatchProcessingStatus.canceling: 'canceling',
  MessageBatchProcessingStatus.ended: 'ended',
};

const _$MessageBatchTypeEnumMap = {
  MessageBatchType.messageBatch: 'message_batch',
};

_MessageBatchRequestCounts _$MessageBatchRequestCountsFromJson(
        Map<String, dynamic> json) =>
    _MessageBatchRequestCounts(
      processing: (json['processing'] as num).toInt(),
      succeeded: (json['succeeded'] as num).toInt(),
      errored: (json['errored'] as num).toInt(),
      canceled: (json['canceled'] as num).toInt(),
      expired: (json['expired'] as num).toInt(),
    );

Map<String, dynamic> _$MessageBatchRequestCountsToJson(
        _MessageBatchRequestCounts instance) =>
    <String, dynamic>{
      'processing': instance.processing,
      'succeeded': instance.succeeded,
      'errored': instance.errored,
      'canceled': instance.canceled,
      'expired': instance.expired,
    };

_MessageDelta _$MessageDeltaFromJson(Map<String, dynamic> json) =>
    _MessageDelta(
      stopReason: $enumDecodeNullable(_$StopReasonEnumMap, json['stop_reason'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      stopSequence: json['stop_sequence'] as String?,
    );

Map<String, dynamic> _$MessageDeltaToJson(_MessageDelta instance) =>
    <String, dynamic>{
      if (_$StopReasonEnumMap[instance.stopReason] case final value?)
        'stop_reason': value,
      if (instance.stopSequence case final value?) 'stop_sequence': value,
    };

_MessageDeltaUsage _$MessageDeltaUsageFromJson(Map<String, dynamic> json) =>
    _MessageDeltaUsage(
      outputTokens: (json['output_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$MessageDeltaUsageToJson(_MessageDeltaUsage instance) =>
    <String, dynamic>{
      'output_tokens': instance.outputTokens,
    };

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
      type: json['type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
      'type': instance.type,
      'message': instance.message,
    };

ToolCustom _$ToolCustomFromJson(Map<String, dynamic> json) => ToolCustom(
      type: json['type'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      inputSchema: json['input_schema'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ToolCustomToJson(ToolCustom instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      'name': instance.name,
      if (instance.description case final value?) 'description': value,
      'input_schema': instance.inputSchema,
    };

ToolComputerUse _$ToolComputerUseFromJson(Map<String, dynamic> json) =>
    ToolComputerUse(
      type: json['type'] as String? ?? 'computer_20241022',
      name: json['name'] as String? ?? 'computer',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
      displayWidthPx: (json['display_width_px'] as num).toInt(),
      displayHeightPx: (json['display_height_px'] as num).toInt(),
      displayNumber: (json['display_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ToolComputerUseToJson(ToolComputerUse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
      'display_width_px': instance.displayWidthPx,
      'display_height_px': instance.displayHeightPx,
      if (instance.displayNumber case final value?) 'display_number': value,
    };

ToolTextEditor _$ToolTextEditorFromJson(Map<String, dynamic> json) =>
    ToolTextEditor(
      type: json['type'] as String? ?? 'text_editor_20241022',
      name: json['name'] as String? ?? 'str_replace_editor',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolTextEditorToJson(ToolTextEditor instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

ToolBash _$ToolBashFromJson(Map<String, dynamic> json) => ToolBash(
      type: json['type'] as String? ?? 'bash_20241022',
      name: json['name'] as String? ?? 'bash',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolBashToJson(ToolBash instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

TextBlock _$TextBlockFromJson(Map<String, dynamic> json) => TextBlock(
      text: json['text'] as String,
      type: json['type'] as String? ?? 'text',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextBlockToJson(TextBlock instance) => <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

ImageBlock _$ImageBlockFromJson(Map<String, dynamic> json) => ImageBlock(
      source: ImageBlockSource.fromJson(json['source'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'image',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageBlockToJson(ImageBlock instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'type': instance.type,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

ToolUseBlock _$ToolUseBlockFromJson(Map<String, dynamic> json) => ToolUseBlock(
      id: json['id'] as String,
      name: json['name'] as String,
      input: json['input'] as Map<String, dynamic>,
      type: json['type'] as String? ?? 'tool_use',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolUseBlockToJson(ToolUseBlock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'input': instance.input,
      'type': instance.type,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

ToolResultBlock _$ToolResultBlockFromJson(Map<String, dynamic> json) =>
    ToolResultBlock(
      toolUseId: json['tool_use_id'] as String,
      content:
          const _ToolResultBlockContentConverter().fromJson(json['content']),
      isError: json['is_error'] as bool?,
      type: json['type'] as String? ?? 'tool_result',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToolResultBlockToJson(ToolResultBlock instance) =>
    <String, dynamic>{
      'tool_use_id': instance.toolUseId,
      'content':
          const _ToolResultBlockContentConverter().toJson(instance.content),
      if (instance.isError case final value?) 'is_error': value,
      'type': instance.type,
      if (instance.cacheControl?.toJson() case final value?)
        'cache_control': value,
    };

ToolResultBlockContentBlocks _$ToolResultBlockContentBlocksFromJson(
        Map<String, dynamic> json) =>
    ToolResultBlockContentBlocks(
      (json['value'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ToolResultBlockContentBlocksToJson(
        ToolResultBlockContentBlocks instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

ToolResultBlockContentText _$ToolResultBlockContentTextFromJson(
        Map<String, dynamic> json) =>
    ToolResultBlockContentText(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ToolResultBlockContentTextToJson(
        ToolResultBlockContentText instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

MessageStartEvent _$MessageStartEventFromJson(Map<String, dynamic> json) =>
    MessageStartEvent(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MessageStartEventToJson(MessageStartEvent instance) =>
    <String, dynamic>{
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

MessageDeltaEvent _$MessageDeltaEventFromJson(Map<String, dynamic> json) =>
    MessageDeltaEvent(
      delta: MessageDelta.fromJson(json['delta'] as Map<String, dynamic>),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
      usage: MessageDeltaUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageDeltaEventToJson(MessageDeltaEvent instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
      'usage': instance.usage.toJson(),
    };

MessageStopEvent _$MessageStopEventFromJson(Map<String, dynamic> json) =>
    MessageStopEvent(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MessageStopEventToJson(MessageStopEvent instance) =>
    <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

ContentBlockStartEvent _$ContentBlockStartEventFromJson(
        Map<String, dynamic> json) =>
    ContentBlockStartEvent(
      contentBlock:
          Block.fromJson(json['content_block'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ContentBlockStartEventToJson(
        ContentBlockStartEvent instance) =>
    <String, dynamic>{
      'content_block': instance.contentBlock.toJson(),
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

ContentBlockDeltaEvent _$ContentBlockDeltaEventFromJson(
        Map<String, dynamic> json) =>
    ContentBlockDeltaEvent(
      delta: BlockDelta.fromJson(json['delta'] as Map<String, dynamic>),
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ContentBlockDeltaEventToJson(
        ContentBlockDeltaEvent instance) =>
    <String, dynamic>{
      'delta': instance.delta.toJson(),
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

ContentBlockStopEvent _$ContentBlockStopEventFromJson(
        Map<String, dynamic> json) =>
    ContentBlockStopEvent(
      index: (json['index'] as num).toInt(),
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ContentBlockStopEventToJson(
        ContentBlockStopEvent instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

PingEvent _$PingEventFromJson(Map<String, dynamic> json) => PingEvent(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$PingEventToJson(PingEvent instance) => <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
    };

ErrorEvent _$ErrorEventFromJson(Map<String, dynamic> json) => ErrorEvent(
      type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorEventToJson(ErrorEvent instance) =>
    <String, dynamic>{
      'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
      'error': instance.error.toJson(),
    };

TextBlockDelta _$TextBlockDeltaFromJson(Map<String, dynamic> json) =>
    TextBlockDelta(
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TextBlockDeltaToJson(TextBlockDelta instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

InputJsonBlockDelta _$InputJsonBlockDeltaFromJson(Map<String, dynamic> json) =>
    InputJsonBlockDelta(
      partialJson: json['partial_json'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$InputJsonBlockDeltaToJson(
        InputJsonBlockDelta instance) =>
    <String, dynamic>{
      if (instance.partialJson case final value?) 'partial_json': value,
      'type': instance.type,
    };
