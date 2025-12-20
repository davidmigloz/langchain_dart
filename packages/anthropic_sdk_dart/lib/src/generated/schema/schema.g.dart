// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_final_parameters, require_trailing_commas, non_constant_identifier_names, unnecessary_null_checks

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMessageRequest _$CreateMessageRequestFromJson(
  Map<String, dynamic> json,
) => _CreateMessageRequest(
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
  thinking: json['thinking'] == null
      ? null
      : ThinkingConfig.fromJson(json['thinking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateMessageRequestToJson(
  _CreateMessageRequest instance,
) => <String, dynamic>{
  'model': const _ModelConverter().toJson(instance.model),
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  'max_tokens': instance.maxTokens,
  'metadata': ?instance.metadata?.toJson(),
  'stop_sequences': ?instance.stopSequences,
  'system': ?const _CreateMessageRequestSystemConverter().toJson(
    instance.system,
  ),
  'temperature': ?instance.temperature,
  'tool_choice': ?instance.toolChoice?.toJson(),
  'tools': ?instance.tools?.map((e) => e.toJson()).toList(),
  'top_k': ?instance.topK,
  'top_p': ?instance.topP,
  'stream': instance.stream,
  'thinking': ?instance.thinking?.toJson(),
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
  Models.claudeOpus420250514: 'claude-opus-4-20250514',
  Models.claudeSonnet420250514: 'claude-sonnet-4-20250514',
  Models.claude37SonnetLatest: 'claude-3-7-sonnet-latest',
  Models.claude37Sonnet20250219: 'claude-3-7-sonnet-20250219',
  Models.claude35SonnetLatest: 'claude-3-5-sonnet-latest',
  Models.claude35Sonnet20241022: 'claude-3-5-sonnet-20241022',
  Models.claude35Sonnet20240620: 'claude-3-5-sonnet-20240620',
  Models.claude35HaikuLatest: 'claude-3-5-haiku-latest',
  Models.claude35Haiku20241022: 'claude-3-5-haiku-20241022',
  Models.claude3OpusLatest: 'claude-3-opus-latest',
  Models.claude3Opus20240229: 'claude-3-opus-20240229',
  Models.claude3Sonnet20240229: 'claude-3-sonnet-20240229',
  Models.claude3Haiku20240307: 'claude-3-haiku-20240307',
  Models.claude21: 'claude-2.1',
  Models.claude20: 'claude-2.0',
};

ModelId _$ModelIdFromJson(Map<String, dynamic> json) =>
    ModelId(json['value'] as String, $type: json['runtimeType'] as String?);

Map<String, dynamic> _$ModelIdToJson(ModelId instance) => <String, dynamic>{
  'value': instance.value,
  'runtimeType': instance.$type,
};

SystemMessageContentBlocks _$SystemMessageContentBlocksFromJson(
  Map<String, dynamic> json,
) => SystemMessageContentBlocks(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SystemMessageContentBlocksToJson(
  SystemMessageContentBlocks instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

SystemMessageContentText _$SystemMessageContentTextFromJson(
  Map<String, dynamic> json,
) => SystemMessageContentText(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SystemMessageContentTextToJson(
  SystemMessageContentText instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_CountMessageTokensRequest _$CountMessageTokensRequestFromJson(
  Map<String, dynamic> json,
) => _CountMessageTokensRequest(
  model: const _CountMessageTokensRequestModelConverter().fromJson(
    json['model'],
  ),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
  system: const _CountMessageTokensRequestSystemConverter().fromJson(
    json['system'],
  ),
  toolChoice: json['tool_choice'] == null
      ? null
      : ToolChoice.fromJson(json['tool_choice'] as Map<String, dynamic>),
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
  thinking: json['thinking'] == null
      ? null
      : ThinkingConfig.fromJson(json['thinking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CountMessageTokensRequestToJson(
  _CountMessageTokensRequest instance,
) => <String, dynamic>{
  'model': const _CountMessageTokensRequestModelConverter().toJson(
    instance.model,
  ),
  'messages': instance.messages.map((e) => e.toJson()).toList(),
  'system': ?const _CountMessageTokensRequestSystemConverter().toJson(
    instance.system,
  ),
  'tool_choice': ?instance.toolChoice?.toJson(),
  'tools': ?instance.tools?.map((e) => e.toJson()).toList(),
  'thinking': ?instance.thinking?.toJson(),
};

CountMessageTokensRequestModelEnumeration
_$CountMessageTokensRequestModelEnumerationFromJson(
  Map<String, dynamic> json,
) => CountMessageTokensRequestModelEnumeration(
  $enumDecode(_$ModelsEnumMap, json['value']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CountMessageTokensRequestModelEnumerationToJson(
  CountMessageTokensRequestModelEnumeration instance,
) => <String, dynamic>{
  'value': _$ModelsEnumMap[instance.value]!,
  'runtimeType': instance.$type,
};

CountMessageTokensRequestModelString
_$CountMessageTokensRequestModelStringFromJson(Map<String, dynamic> json) =>
    CountMessageTokensRequestModelString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CountMessageTokensRequestModelStringToJson(
  CountMessageTokensRequestModelString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CountMessageTokensRequestSystemListBlock
_$CountMessageTokensRequestSystemListBlockFromJson(Map<String, dynamic> json) =>
    CountMessageTokensRequestSystemListBlock(
      (json['value'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CountMessageTokensRequestSystemListBlockToJson(
  CountMessageTokensRequestSystemListBlock instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

CountMessageTokensRequestSystemString
_$CountMessageTokensRequestSystemStringFromJson(Map<String, dynamic> json) =>
    CountMessageTokensRequestSystemString(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CountMessageTokensRequestSystemStringToJson(
  CountMessageTokensRequestSystemString instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_CountMessageTokensResponse _$CountMessageTokensResponseFromJson(
  Map<String, dynamic> json,
) => _CountMessageTokensResponse(
  inputTokens: (json['input_tokens'] as num).toInt(),
);

Map<String, dynamic> _$CountMessageTokensResponseToJson(
  _CountMessageTokensResponse instance,
) => <String, dynamic>{'input_tokens': instance.inputTokens};

_CreateMessageRequestMetadata _$CreateMessageRequestMetadataFromJson(
  Map<String, dynamic> json,
) => _CreateMessageRequestMetadata(userId: json['user_id'] as String?);

Map<String, dynamic> _$CreateMessageRequestMetadataToJson(
  _CreateMessageRequestMetadata instance,
) => <String, dynamic>{'user_id': ?instance.userId};

_ToolChoice _$ToolChoiceFromJson(Map<String, dynamic> json) => _ToolChoice(
  type: $enumDecode(_$ToolChoiceTypeEnumMap, json['type']),
  name: json['name'] as String?,
  disableParallelToolUse: json['disable_parallel_tool_use'] as bool?,
);

Map<String, dynamic> _$ToolChoiceToJson(_ToolChoice instance) =>
    <String, dynamic>{
      'type': _$ToolChoiceTypeEnumMap[instance.type]!,
      'name': ?instance.name,
      'disable_parallel_tool_use': ?instance.disableParallelToolUse,
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

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': ?instance.id,
  'content': const _MessageContentConverter().toJson(instance.content),
  'role': _$MessageRoleEnumMap[instance.role]!,
  'model': ?instance.model,
  'stop_reason': ?_$StopReasonEnumMap[instance.stopReason],
  'stop_sequence': ?instance.stopSequence,
  'type': ?instance.type,
  'usage': ?instance.usage?.toJson(),
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
  StopReason.pauseTurn: 'pause_turn',
  StopReason.refusal: 'refusal',
};

MessageContentBlocks _$MessageContentBlocksFromJson(
  Map<String, dynamic> json,
) => MessageContentBlocks(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MessageContentBlocksToJson(
  MessageContentBlocks instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

MessageContentText _$MessageContentTextFromJson(Map<String, dynamic> json) =>
    MessageContentText(
      json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MessageContentTextToJson(MessageContentText instance) =>
    <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_WebSearchUserLocation _$WebSearchUserLocationFromJson(
  Map<String, dynamic> json,
) => _WebSearchUserLocation(
  type: json['type'] as String? ?? 'approximate',
  city: json['city'] as String?,
  region: json['region'] as String?,
  country: json['country'] as String?,
  timezone: json['timezone'] as String?,
);

Map<String, dynamic> _$WebSearchUserLocationToJson(
  _WebSearchUserLocation instance,
) => <String, dynamic>{
  'type': instance.type,
  'city': ?instance.city,
  'region': ?instance.region,
  'country': ?instance.country,
  'timezone': ?instance.timezone,
};

_CitationsConfig _$CitationsConfigFromJson(Map<String, dynamic> json) =>
    _CitationsConfig(enabled: json['enabled'] as bool?);

Map<String, dynamic> _$CitationsConfigToJson(_CitationsConfig instance) =>
    <String, dynamic>{'enabled': ?instance.enabled};

_WebSearchToolResultError _$WebSearchToolResultErrorFromJson(
  Map<String, dynamic> json,
) => _WebSearchToolResultError(
  type: json['type'] as String,
  errorCode: $enumDecode(
    _$WebSearchToolResultErrorCodeEnumMap,
    json['error_code'],
  ),
);

Map<String, dynamic> _$WebSearchToolResultErrorToJson(
  _WebSearchToolResultError instance,
) => <String, dynamic>{
  'type': instance.type,
  'error_code': _$WebSearchToolResultErrorCodeEnumMap[instance.errorCode]!,
};

const _$WebSearchToolResultErrorCodeEnumMap = {
  WebSearchToolResultErrorCode.invalidRequest: 'invalid_request',
  WebSearchToolResultErrorCode.unavailable: 'unavailable',
  WebSearchToolResultErrorCode.maxUsesExceeded: 'max_uses_exceeded',
  WebSearchToolResultErrorCode.tooManyRequests: 'too_many_requests',
  WebSearchToolResultErrorCode.queryTooLong: 'query_too_long',
  WebSearchToolResultErrorCode.filtered: 'filtered',
  WebSearchToolResultErrorCode.internalError: 'internal_error',
};

_WebSearchResultBlock _$WebSearchResultBlockFromJson(
  Map<String, dynamic> json,
) => _WebSearchResultBlock(
  type: json['type'] as String,
  title: json['title'] as String,
  url: json['url'] as String,
  encryptedContent: json['encrypted_content'] as String,
  pageAge: json['page_age'] as String?,
);

Map<String, dynamic> _$WebSearchResultBlockToJson(
  _WebSearchResultBlock instance,
) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'url': instance.url,
  'encrypted_content': instance.encryptedContent,
  'page_age': ?instance.pageAge,
};

_MCPToolResultContent _$MCPToolResultContentFromJson(
  Map<String, dynamic> json,
) => _MCPToolResultContent(
  type: json['type'] as String,
  text: json['text'] as String?,
);

Map<String, dynamic> _$MCPToolResultContentToJson(
  _MCPToolResultContent instance,
) => <String, dynamic>{'type': instance.type, 'text': ?instance.text};

_CodeExecutionOutputBlock _$CodeExecutionOutputBlockFromJson(
  Map<String, dynamic> json,
) => _CodeExecutionOutputBlock(
  type: json['type'] as String,
  fileId: json['file_id'] as String,
);

Map<String, dynamic> _$CodeExecutionOutputBlockToJson(
  _CodeExecutionOutputBlock instance,
) => <String, dynamic>{'type': instance.type, 'file_id': instance.fileId};

_CacheControlEphemeral _$CacheControlEphemeralFromJson(
  Map<String, dynamic> json,
) => _CacheControlEphemeral(
  type:
      $enumDecodeNullable(_$CacheControlEphemeralTypeEnumMap, json['type']) ??
      CacheControlEphemeralType.ephemeral,
  ttl: (json['ttl'] as num?)?.toInt(),
);

Map<String, dynamic> _$CacheControlEphemeralToJson(
  _CacheControlEphemeral instance,
) => <String, dynamic>{
  'type': _$CacheControlEphemeralTypeEnumMap[instance.type]!,
  'ttl': ?instance.ttl,
};

const _$CacheControlEphemeralTypeEnumMap = {
  CacheControlEphemeralType.ephemeral: 'ephemeral',
};

_Usage _$UsageFromJson(Map<String, dynamic> json) => _Usage(
  inputTokens: (json['input_tokens'] as num).toInt(),
  outputTokens: (json['output_tokens'] as num).toInt(),
  cacheCreationInputTokens: (json['cache_creation_input_tokens'] as num?)
      ?.toInt(),
  cacheReadInputTokens: (json['cache_read_input_tokens'] as num?)?.toInt(),
  serverToolUse: json['server_tool_use'] == null
      ? null
      : ServerToolUsage.fromJson(
          json['server_tool_use'] as Map<String, dynamic>,
        ),
  serviceTier: $enumDecodeNullable(
    _$ServiceTierEnumMap,
    json['service_tier'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
);

Map<String, dynamic> _$UsageToJson(_Usage instance) => <String, dynamic>{
  'input_tokens': instance.inputTokens,
  'output_tokens': instance.outputTokens,
  'cache_creation_input_tokens': ?instance.cacheCreationInputTokens,
  'cache_read_input_tokens': ?instance.cacheReadInputTokens,
  'server_tool_use': ?instance.serverToolUse?.toJson(),
  'service_tier': ?_$ServiceTierEnumMap[instance.serviceTier],
};

const _$ServiceTierEnumMap = {
  ServiceTier.standard: 'standard',
  ServiceTier.priority: 'priority',
};

_ServerToolUsage _$ServerToolUsageFromJson(Map<String, dynamic> json) =>
    _ServerToolUsage(
      webSearchRequests: (json['web_search_requests'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServerToolUsageToJson(_ServerToolUsage instance) =>
    <String, dynamic>{'web_search_requests': ?instance.webSearchRequests};

_CreateMessageBatchRequest _$CreateMessageBatchRequestFromJson(
  Map<String, dynamic> json,
) => _CreateMessageBatchRequest(
  requests: (json['requests'] as List<dynamic>)
      .map((e) => BatchMessageRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateMessageBatchRequestToJson(
  _CreateMessageBatchRequest instance,
) => <String, dynamic>{
  'requests': instance.requests.map((e) => e.toJson()).toList(),
};

_BatchMessageRequest _$BatchMessageRequestFromJson(Map<String, dynamic> json) =>
    _BatchMessageRequest(
      customId: json['custom_id'] as String,
      params: CreateMessageRequest.fromJson(
        json['params'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$BatchMessageRequestToJson(
  _BatchMessageRequest instance,
) => <String, dynamic>{
  'custom_id': instance.customId,
  'params': instance.params.toJson(),
};

_MessageBatch _$MessageBatchFromJson(Map<String, dynamic> json) =>
    _MessageBatch(
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
      endedAt: json['ended_at'] as String?,
      archivedAt: json['archived_at'] as String?,
      cancelInitiatedAt: json['cancel_initiated_at'] as String?,
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
      'results_url': ?instance.resultsUrl,
      'ended_at': ?instance.endedAt,
      'archived_at': ?instance.archivedAt,
      'cancel_initiated_at': ?instance.cancelInitiatedAt,
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

_DeleteMessageBatchResponse _$DeleteMessageBatchResponseFromJson(
  Map<String, dynamic> json,
) => _DeleteMessageBatchResponse(
  id: json['id'] as String,
  type: $enumDecode(_$DeleteMessageBatchResponseTypeEnumMap, json['type']),
);

Map<String, dynamic> _$DeleteMessageBatchResponseToJson(
  _DeleteMessageBatchResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$DeleteMessageBatchResponseTypeEnumMap[instance.type]!,
};

const _$DeleteMessageBatchResponseTypeEnumMap = {
  DeleteMessageBatchResponseType.messageBatchDeleted: 'message_batch_deleted',
};

_MessageBatchIndividualResponse _$MessageBatchIndividualResponseFromJson(
  Map<String, dynamic> json,
) => _MessageBatchIndividualResponse(
  customId: json['custom_id'] as String,
  result: MessageBatchResult.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageBatchIndividualResponseToJson(
  _MessageBatchIndividualResponse instance,
) => <String, dynamic>{
  'custom_id': instance.customId,
  'result': instance.result.toJson(),
};

_ListMessageBatchesResponse _$ListMessageBatchesResponseFromJson(
  Map<String, dynamic> json,
) => _ListMessageBatchesResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => MessageBatch.fromJson(e as Map<String, dynamic>))
      .toList(),
  hasMore: json['has_more'] as bool,
  firstId: json['first_id'] as String?,
  lastId: json['last_id'] as String?,
);

Map<String, dynamic> _$ListMessageBatchesResponseToJson(
  _ListMessageBatchesResponse instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'has_more': instance.hasMore,
  'first_id': ?instance.firstId,
  'last_id': ?instance.lastId,
};

_ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) => _ModelInfo(
  id: json['id'] as String,
  type: $enumDecode(_$ModelInfoTypeEnumMap, json['type']),
  displayName: json['display_name'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ModelInfoToJson(_ModelInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ModelInfoTypeEnumMap[instance.type]!,
      'display_name': instance.displayName,
      'created_at': instance.createdAt,
    };

const _$ModelInfoTypeEnumMap = {ModelInfoType.model: 'model'};

_ListModelsResponse _$ListModelsResponseFromJson(Map<String, dynamic> json) =>
    _ListModelsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ModelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool,
      firstId: json['first_id'] as String?,
      lastId: json['last_id'] as String?,
    );

Map<String, dynamic> _$ListModelsResponseToJson(_ListModelsResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
      'first_id': ?instance.firstId,
      'last_id': ?instance.lastId,
    };

_MessageBatchRequestCounts _$MessageBatchRequestCountsFromJson(
  Map<String, dynamic> json,
) => _MessageBatchRequestCounts(
  processing: (json['processing'] as num).toInt(),
  succeeded: (json['succeeded'] as num).toInt(),
  errored: (json['errored'] as num).toInt(),
  canceled: (json['canceled'] as num).toInt(),
  expired: (json['expired'] as num).toInt(),
);

Map<String, dynamic> _$MessageBatchRequestCountsToJson(
  _MessageBatchRequestCounts instance,
) => <String, dynamic>{
  'processing': instance.processing,
  'succeeded': instance.succeeded,
  'errored': instance.errored,
  'canceled': instance.canceled,
  'expired': instance.expired,
};

_MessageDelta _$MessageDeltaFromJson(Map<String, dynamic> json) =>
    _MessageDelta(
      stopReason: $enumDecodeNullable(
        _$StopReasonEnumMap,
        json['stop_reason'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      stopSequence: json['stop_sequence'] as String?,
    );

Map<String, dynamic> _$MessageDeltaToJson(_MessageDelta instance) =>
    <String, dynamic>{
      'stop_reason': ?_$StopReasonEnumMap[instance.stopReason],
      'stop_sequence': ?instance.stopSequence,
    };

_MessageDeltaUsage _$MessageDeltaUsageFromJson(Map<String, dynamic> json) =>
    _MessageDeltaUsage(outputTokens: (json['output_tokens'] as num).toInt());

Map<String, dynamic> _$MessageDeltaUsageToJson(_MessageDeltaUsage instance) =>
    <String, dynamic>{'output_tokens': instance.outputTokens};

_Error _$ErrorFromJson(Map<String, dynamic> json) =>
    _Error(type: json['type'] as String, message: json['message'] as String);

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
  'type': instance.type,
  'message': instance.message,
};

ThinkingConfigEnabled _$ThinkingConfigEnabledFromJson(
  Map<String, dynamic> json,
) => ThinkingConfigEnabled(
  type: $enumDecode(_$ThinkingConfigEnabledTypeEnumMap, json['type']),
  budgetTokens: (json['budget_tokens'] as num).toInt(),
);

Map<String, dynamic> _$ThinkingConfigEnabledToJson(
  ThinkingConfigEnabled instance,
) => <String, dynamic>{
  'type': _$ThinkingConfigEnabledTypeEnumMap[instance.type]!,
  'budget_tokens': instance.budgetTokens,
};

const _$ThinkingConfigEnabledTypeEnumMap = {
  ThinkingConfigEnabledType.enabled: 'enabled',
};

ThinkingConfigDisabled _$ThinkingConfigDisabledFromJson(
  Map<String, dynamic> json,
) => ThinkingConfigDisabled(
  type: $enumDecode(_$ThinkingConfigDisabledTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ThinkingConfigDisabledToJson(
  ThinkingConfigDisabled instance,
) => <String, dynamic>{
  'type': _$ThinkingConfigDisabledTypeEnumMap[instance.type]!,
};

const _$ThinkingConfigDisabledTypeEnumMap = {
  ThinkingConfigDisabledType.disabled: 'disabled',
};

ToolCustom _$ToolCustomFromJson(Map<String, dynamic> json) => ToolCustom(
  type: json['type'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  inputSchema: json['input_schema'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ToolCustomToJson(ToolCustom instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'name': instance.name,
      'description': ?instance.description,
      'input_schema': instance.inputSchema,
    };

ToolComputerUse _$ToolComputerUseFromJson(Map<String, dynamic> json) =>
    ToolComputerUse(
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

Map<String, dynamic> _$ToolComputerUseToJson(ToolComputerUse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'cache_control': ?instance.cacheControl?.toJson(),
      'display_width_px': instance.displayWidthPx,
      'display_height_px': instance.displayHeightPx,
      'display_number': ?instance.displayNumber,
    };

ToolTextEditor _$ToolTextEditorFromJson(Map<String, dynamic> json) =>
    ToolTextEditor(
      type: json['type'] as String? ?? 'text_editor_20241022',
      name: json['name'] as String? ?? 'str_replace_editor',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ToolTextEditorToJson(ToolTextEditor instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'cache_control': ?instance.cacheControl?.toJson(),
    };

ToolBash _$ToolBashFromJson(Map<String, dynamic> json) => ToolBash(
  type: json['type'] as String? ?? 'bash_20241022',
  name: json['name'] as String? ?? 'bash',
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ToolBashToJson(ToolBash instance) => <String, dynamic>{
  'type': instance.type,
  'name': instance.name,
  'cache_control': ?instance.cacheControl?.toJson(),
};

ToolWebSearch _$ToolWebSearchFromJson(Map<String, dynamic> json) =>
    ToolWebSearch(
      type: json['type'] as String,
      name: json['name'] as String,
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
      maxUses: (json['max_uses'] as num?)?.toInt(),
      allowedDomains: (json['allowed_domains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      blockedDomains: (json['blocked_domains'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userLocation: json['user_location'] == null
          ? null
          : WebSearchUserLocation.fromJson(
              json['user_location'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ToolWebSearchToJson(ToolWebSearch instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'cache_control': ?instance.cacheControl?.toJson(),
      'max_uses': ?instance.maxUses,
      'allowed_domains': ?instance.allowedDomains,
      'blocked_domains': ?instance.blockedDomains,
      'user_location': ?instance.userLocation?.toJson(),
    };

ToolCodeExecution _$ToolCodeExecutionFromJson(Map<String, dynamic> json) =>
    ToolCodeExecution(
      type: json['type'] as String,
      name: json['name'] as String,
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ToolCodeExecutionToJson(ToolCodeExecution instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'cache_control': ?instance.cacheControl?.toJson(),
    };

ToolMcp _$ToolMcpFromJson(Map<String, dynamic> json) => ToolMcp(
  type: json['type'] as String,
  name: json['name'] as String,
  serverLabel: json['server_label'] as String,
  serverUrl: json['server_url'] as String,
  allowedTools: (json['allowed_tools'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ToolMcpToJson(ToolMcp instance) => <String, dynamic>{
  'type': instance.type,
  'name': instance.name,
  'server_label': instance.serverLabel,
  'server_url': instance.serverUrl,
  'allowed_tools': ?instance.allowedTools,
  'cache_control': ?instance.cacheControl?.toJson(),
};

TextBlock _$TextBlockFromJson(Map<String, dynamic> json) => TextBlock(
  text: json['text'] as String,
  type: json['type'] as String? ?? 'text',
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TextBlockToJson(TextBlock instance) => <String, dynamic>{
  'text': instance.text,
  'type': instance.type,
  'cache_control': ?instance.cacheControl?.toJson(),
};

ImageBlock _$ImageBlockFromJson(Map<String, dynamic> json) => ImageBlock(
  source: ImageBlockSource.fromJson(json['source'] as Map<String, dynamic>),
  type: json['type'] as String? ?? 'image',
  cacheControl: json['cache_control'] == null
      ? null
      : CacheControlEphemeral.fromJson(
          json['cache_control'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImageBlockToJson(ImageBlock instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'type': instance.type,
      'cache_control': ?instance.cacheControl?.toJson(),
    };

DocumentBlock _$DocumentBlockFromJson(Map<String, dynamic> json) =>
    DocumentBlock(
      type: json['type'] as String,
      source: DocumentBlockSource.fromJson(
        json['source'] as Map<String, dynamic>,
      ),
      title: json['title'] as String?,
      context: json['context'] as String?,
      citations: json['citations'] == null
          ? null
          : CitationsConfig.fromJson(json['citations'] as Map<String, dynamic>),
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DocumentBlockToJson(DocumentBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'source': instance.source.toJson(),
      'title': ?instance.title,
      'context': ?instance.context,
      'citations': ?instance.citations?.toJson(),
      'cache_control': ?instance.cacheControl?.toJson(),
    };

ToolUseBlock _$ToolUseBlockFromJson(Map<String, dynamic> json) => ToolUseBlock(
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

Map<String, dynamic> _$ToolUseBlockToJson(ToolUseBlock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'input': instance.input,
      'type': instance.type,
      'cache_control': ?instance.cacheControl?.toJson(),
    };

ToolResultBlock _$ToolResultBlockFromJson(Map<String, dynamic> json) =>
    ToolResultBlock(
      toolUseId: json['tool_use_id'] as String,
      content: const _ToolResultBlockContentConverter().fromJson(
        json['content'],
      ),
      isError: json['is_error'] as bool?,
      type: json['type'] as String? ?? 'tool_result',
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ToolResultBlockToJson(
  ToolResultBlock instance,
) => <String, dynamic>{
  'tool_use_id': instance.toolUseId,
  'content': const _ToolResultBlockContentConverter().toJson(instance.content),
  'is_error': ?instance.isError,
  'type': instance.type,
  'cache_control': ?instance.cacheControl?.toJson(),
};

ThinkingBlock _$ThinkingBlockFromJson(Map<String, dynamic> json) =>
    ThinkingBlock(
      type: $enumDecode(_$ThinkingBlockTypeEnumMap, json['type']),
      thinking: json['thinking'] as String,
      signature: json['signature'] as String?,
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ThinkingBlockToJson(ThinkingBlock instance) =>
    <String, dynamic>{
      'type': _$ThinkingBlockTypeEnumMap[instance.type]!,
      'thinking': instance.thinking,
      'signature': ?instance.signature,
      'cache_control': ?instance.cacheControl?.toJson(),
    };

const _$ThinkingBlockTypeEnumMap = {ThinkingBlockType.thinking: 'thinking'};

RedactedThinkingBlock _$RedactedThinkingBlockFromJson(
  Map<String, dynamic> json,
) => RedactedThinkingBlock(
  type: $enumDecode(_$RedactedThinkingBlockTypeEnumMap, json['type']),
  data: json['data'] as String,
);

Map<String, dynamic> _$RedactedThinkingBlockToJson(
  RedactedThinkingBlock instance,
) => <String, dynamic>{
  'type': _$RedactedThinkingBlockTypeEnumMap[instance.type]!,
  'data': instance.data,
};

const _$RedactedThinkingBlockTypeEnumMap = {
  RedactedThinkingBlockType.redactedThinking: 'redacted_thinking',
};

ServerToolUseBlock _$ServerToolUseBlockFromJson(Map<String, dynamic> json) =>
    ServerToolUseBlock(
      type: json['type'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      input: json['input'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ServerToolUseBlockToJson(ServerToolUseBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'name': instance.name,
      'input': instance.input,
    };

WebSearchToolResultBlock _$WebSearchToolResultBlockFromJson(
  Map<String, dynamic> json,
) => WebSearchToolResultBlock(
  type: json['type'] as String,
  toolUseId: json['tool_use_id'] as String,
  content: const _WebSearchToolResultBlockContentConverter().fromJson(
    json['content'],
  ),
);

Map<String, dynamic> _$WebSearchToolResultBlockToJson(
  WebSearchToolResultBlock instance,
) => <String, dynamic>{
  'type': instance.type,
  'tool_use_id': instance.toolUseId,
  'content': const _WebSearchToolResultBlockContentConverter().toJson(
    instance.content,
  ),
};

MCPToolUseBlock _$MCPToolUseBlockFromJson(Map<String, dynamic> json) =>
    MCPToolUseBlock(
      type: json['type'] as String,
      id: json['id'] as String,
      serverName: json['server_name'] as String,
      name: json['name'] as String,
      input: json['input'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MCPToolUseBlockToJson(MCPToolUseBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'server_name': instance.serverName,
      'name': instance.name,
      'input': instance.input,
    };

MCPToolResultBlock _$MCPToolResultBlockFromJson(Map<String, dynamic> json) =>
    MCPToolResultBlock(
      type: json['type'] as String,
      toolUseId: json['tool_use_id'] as String,
      isError: json['is_error'] as bool?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => MCPToolResultContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MCPToolResultBlockToJson(MCPToolResultBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tool_use_id': instance.toolUseId,
      'is_error': ?instance.isError,
      'content': ?instance.content?.map((e) => e.toJson()).toList(),
    };

SearchResultBlock _$SearchResultBlockFromJson(Map<String, dynamic> json) =>
    SearchResultBlock(
      type: json['type'] as String,
      source: json['source'] as String,
      title: json['title'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => TextBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      citations: json['citations'] == null
          ? null
          : CitationsConfig.fromJson(json['citations'] as Map<String, dynamic>),
      cacheControl: json['cache_control'] == null
          ? null
          : CacheControlEphemeral.fromJson(
              json['cache_control'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchResultBlockToJson(SearchResultBlock instance) =>
    <String, dynamic>{
      'type': instance.type,
      'source': instance.source,
      'title': instance.title,
      'content': instance.content.map((e) => e.toJson()).toList(),
      'citations': ?instance.citations?.toJson(),
      'cache_control': ?instance.cacheControl?.toJson(),
    };

CodeExecutionToolResultBlock _$CodeExecutionToolResultBlockFromJson(
  Map<String, dynamic> json,
) => CodeExecutionToolResultBlock(
  type: json['type'] as String,
  toolUseId: json['tool_use_id'] as String,
  content: UnionSchema.fromJson(json['content'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CodeExecutionToolResultBlockToJson(
  CodeExecutionToolResultBlock instance,
) => <String, dynamic>{
  'type': instance.type,
  'tool_use_id': instance.toolUseId,
  'content': instance.content.toJson(),
};

ContainerUploadBlock _$ContainerUploadBlockFromJson(
  Map<String, dynamic> json,
) => ContainerUploadBlock(
  type: json['type'] as String,
  fileId: json['file_id'] as String,
  filename: json['filename'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  content: json['content'] as String?,
);

Map<String, dynamic> _$ContainerUploadBlockToJson(
  ContainerUploadBlock instance,
) => <String, dynamic>{
  'type': instance.type,
  'file_id': instance.fileId,
  'filename': instance.filename,
  'file_size': instance.fileSize,
  'content': ?instance.content,
};

ToolResultBlockContentBlocks _$ToolResultBlockContentBlocksFromJson(
  Map<String, dynamic> json,
) => ToolResultBlockContentBlocks(
  (json['value'] as List<dynamic>)
      .map((e) => Block.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToolResultBlockContentBlocksToJson(
  ToolResultBlockContentBlocks instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

ToolResultBlockContentText _$ToolResultBlockContentTextFromJson(
  Map<String, dynamic> json,
) => ToolResultBlockContentText(
  json['value'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ToolResultBlockContentTextToJson(
  ToolResultBlockContentText instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

WebSearchToolResultBlockContentWebSearchToolResultError
_$WebSearchToolResultBlockContentWebSearchToolResultErrorFromJson(
  Map<String, dynamic> json,
) => WebSearchToolResultBlockContentWebSearchToolResultError(
  WebSearchToolResultError.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$WebSearchToolResultBlockContentWebSearchToolResultErrorToJson(
  WebSearchToolResultBlockContentWebSearchToolResultError instance,
) => <String, dynamic>{
  'value': instance.value.toJson(),
  'runtimeType': instance.$type,
};

WebSearchToolResultBlockContentListWebSearchResultBlock
_$WebSearchToolResultBlockContentListWebSearchResultBlockFromJson(
  Map<String, dynamic> json,
) => WebSearchToolResultBlockContentListWebSearchResultBlock(
  (json['value'] as List<dynamic>)
      .map((e) => WebSearchResultBlock.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$WebSearchToolResultBlockContentListWebSearchResultBlockToJson(
  WebSearchToolResultBlockContentListWebSearchResultBlock instance,
) => <String, dynamic>{
  'value': instance.value.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

Base64ImageSource _$Base64ImageSourceFromJson(Map<String, dynamic> json) =>
    Base64ImageSource(
      type: json['type'] as String,
      mediaType: $enumDecode(
        _$Base64ImageSourceMediaTypeEnumMap,
        json['media_type'],
      ),
      data: json['data'] as String,
    );

Map<String, dynamic> _$Base64ImageSourceToJson(Base64ImageSource instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media_type': _$Base64ImageSourceMediaTypeEnumMap[instance.mediaType]!,
      'data': instance.data,
    };

const _$Base64ImageSourceMediaTypeEnumMap = {
  Base64ImageSourceMediaType.imageJpeg: 'image/jpeg',
  Base64ImageSourceMediaType.imagePng: 'image/png',
  Base64ImageSourceMediaType.imageGif: 'image/gif',
  Base64ImageSourceMediaType.imageWebp: 'image/webp',
};

UrlImageSource _$UrlImageSourceFromJson(Map<String, dynamic> json) =>
    UrlImageSource(type: json['type'] as String, url: json['url'] as String);

Map<String, dynamic> _$UrlImageSourceToJson(UrlImageSource instance) =>
    <String, dynamic>{'type': instance.type, 'url': instance.url};

Base64PdfSource _$Base64PdfSourceFromJson(Map<String, dynamic> json) =>
    Base64PdfSource(
      type: json['type'] as String,
      mediaType: $enumDecode(
        _$Base64PdfSourceMediaTypeEnumMap,
        json['media_type'],
      ),
      data: json['data'] as String,
    );

Map<String, dynamic> _$Base64PdfSourceToJson(Base64PdfSource instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media_type': _$Base64PdfSourceMediaTypeEnumMap[instance.mediaType]!,
      'data': instance.data,
    };

const _$Base64PdfSourceMediaTypeEnumMap = {
  Base64PdfSourceMediaType.applicationPdf: 'application/pdf',
};

PlainTextSource _$PlainTextSourceFromJson(Map<String, dynamic> json) =>
    PlainTextSource(
      type: json['type'] as String,
      mediaType: $enumDecode(
        _$PlainTextSourceMediaTypeEnumMap,
        json['media_type'],
      ),
      data: json['data'] as String,
    );

Map<String, dynamic> _$PlainTextSourceToJson(PlainTextSource instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media_type': _$PlainTextSourceMediaTypeEnumMap[instance.mediaType]!,
      'data': instance.data,
    };

const _$PlainTextSourceMediaTypeEnumMap = {
  PlainTextSourceMediaType.textPlain: 'text/plain',
};

ContentBlockSource _$ContentBlockSourceFromJson(Map<String, dynamic> json) =>
    ContentBlockSource(
      type: json['type'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ContentBlockSourceToJson(ContentBlockSource instance) =>
    <String, dynamic>{'type': instance.type, 'content': instance.content};

UrlPdfSource _$UrlPdfSourceFromJson(Map<String, dynamic> json) =>
    UrlPdfSource(type: json['type'] as String, url: json['url'] as String);

Map<String, dynamic> _$UrlPdfSourceToJson(UrlPdfSource instance) =>
    <String, dynamic>{'type': instance.type, 'url': instance.url};

CodeExecutionResultBlock _$CodeExecutionResultBlockFromJson(
  Map<String, dynamic> json,
) => CodeExecutionResultBlock(
  type: json['type'] as String,
  returnCode: (json['return_code'] as num).toInt(),
  stdout: json['stdout'] as String,
  stderr: json['stderr'] as String,
  content: (json['content'] as List<dynamic>?)
      ?.map((e) => CodeExecutionOutputBlock.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CodeExecutionResultBlockToJson(
  CodeExecutionResultBlock instance,
) => <String, dynamic>{
  'type': instance.type,
  'return_code': instance.returnCode,
  'stdout': instance.stdout,
  'stderr': instance.stderr,
  'content': ?instance.content?.map((e) => e.toJson()).toList(),
};

CodeExecutionToolResultError _$CodeExecutionToolResultErrorFromJson(
  Map<String, dynamic> json,
) => CodeExecutionToolResultError(
  type: json['type'] as String,
  errorCode: $enumDecode(
    _$CodeExecutionToolResultErrorCodeEnumMap,
    json['error_code'],
  ),
);

Map<String, dynamic> _$CodeExecutionToolResultErrorToJson(
  CodeExecutionToolResultError instance,
) => <String, dynamic>{
  'type': instance.type,
  'error_code': _$CodeExecutionToolResultErrorCodeEnumMap[instance.errorCode]!,
};

const _$CodeExecutionToolResultErrorCodeEnumMap = {
  CodeExecutionToolResultErrorCode.invalidRequest: 'invalid_request',
  CodeExecutionToolResultErrorCode.unavailable: 'unavailable',
  CodeExecutionToolResultErrorCode.maxDurationExceeded: 'max_duration_exceeded',
  CodeExecutionToolResultErrorCode.internalError: 'internal_error',
};

MessageBatchSucceededResult _$MessageBatchSucceededResultFromJson(
  Map<String, dynamic> json,
) => MessageBatchSucceededResult(
  type: json['type'] as String,
  message: Message.fromJson(json['message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageBatchSucceededResultToJson(
  MessageBatchSucceededResult instance,
) => <String, dynamic>{
  'type': instance.type,
  'message': instance.message.toJson(),
};

MessageBatchErroredResult _$MessageBatchErroredResultFromJson(
  Map<String, dynamic> json,
) => MessageBatchErroredResult(
  type: json['type'] as String,
  error: Error.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageBatchErroredResultToJson(
  MessageBatchErroredResult instance,
) => <String, dynamic>{'type': instance.type, 'error': instance.error.toJson()};

MessageBatchCanceledResult _$MessageBatchCanceledResultFromJson(
  Map<String, dynamic> json,
) => MessageBatchCanceledResult(type: json['type'] as String);

Map<String, dynamic> _$MessageBatchCanceledResultToJson(
  MessageBatchCanceledResult instance,
) => <String, dynamic>{'type': instance.type};

MessageBatchExpiredResult _$MessageBatchExpiredResultFromJson(
  Map<String, dynamic> json,
) => MessageBatchExpiredResult(type: json['type'] as String);

Map<String, dynamic> _$MessageBatchExpiredResultToJson(
  MessageBatchExpiredResult instance,
) => <String, dynamic>{'type': instance.type};

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
    <String, dynamic>{'type': _$MessageStreamEventTypeEnumMap[instance.type]!};

ContentBlockStartEvent _$ContentBlockStartEventFromJson(
  Map<String, dynamic> json,
) => ContentBlockStartEvent(
  contentBlock: Block.fromJson(json['content_block'] as Map<String, dynamic>),
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ContentBlockStartEventToJson(
  ContentBlockStartEvent instance,
) => <String, dynamic>{
  'content_block': instance.contentBlock.toJson(),
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

ContentBlockDeltaEvent _$ContentBlockDeltaEventFromJson(
  Map<String, dynamic> json,
) => ContentBlockDeltaEvent(
  delta: BlockDelta.fromJson(json['delta'] as Map<String, dynamic>),
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ContentBlockDeltaEventToJson(
  ContentBlockDeltaEvent instance,
) => <String, dynamic>{
  'delta': instance.delta.toJson(),
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

ContentBlockStopEvent _$ContentBlockStopEventFromJson(
  Map<String, dynamic> json,
) => ContentBlockStopEvent(
  index: (json['index'] as num).toInt(),
  type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ContentBlockStopEventToJson(
  ContentBlockStopEvent instance,
) => <String, dynamic>{
  'index': instance.index,
  'type': _$MessageStreamEventTypeEnumMap[instance.type]!,
};

PingEvent _$PingEventFromJson(Map<String, dynamic> json) =>
    PingEvent(type: $enumDecode(_$MessageStreamEventTypeEnumMap, json['type']));

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
    TextBlockDelta(text: json['text'] as String, type: json['type'] as String);

Map<String, dynamic> _$TextBlockDeltaToJson(TextBlockDelta instance) =>
    <String, dynamic>{'text': instance.text, 'type': instance.type};

InputJsonBlockDelta _$InputJsonBlockDeltaFromJson(Map<String, dynamic> json) =>
    InputJsonBlockDelta(
      partialJson: json['partial_json'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$InputJsonBlockDeltaToJson(
  InputJsonBlockDelta instance,
) => <String, dynamic>{
  'partial_json': ?instance.partialJson,
  'type': instance.type,
};

ThinkingBlockDelta _$ThinkingBlockDeltaFromJson(Map<String, dynamic> json) =>
    ThinkingBlockDelta(
      thinking: json['thinking'] as String,
      type: $enumDecode(_$ThinkingBlockDeltaTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ThinkingBlockDeltaToJson(ThinkingBlockDelta instance) =>
    <String, dynamic>{
      'thinking': instance.thinking,
      'type': _$ThinkingBlockDeltaTypeEnumMap[instance.type]!,
    };

const _$ThinkingBlockDeltaTypeEnumMap = {
  ThinkingBlockDeltaType.thinkingDelta: 'thinking_delta',
};
