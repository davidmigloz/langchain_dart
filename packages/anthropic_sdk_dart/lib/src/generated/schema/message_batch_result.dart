// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageBatchResult
// ==========================================

/// The result of processing a request in a Message Batch.
/// Can be succeeded, errored, canceled, or expired.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class MessageBatchResult with _$MessageBatchResult {
  const MessageBatchResult._();

  // ------------------------------------------
  // UNION: MessageBatchSucceededResult
  // ------------------------------------------

  /// Result of a successfully completed request.

  @FreezedUnionValue('succeeded')
  const factory MessageBatchResult.messageBatchSucceededResult({
    /// The result type.
    required String type,

    /// A message in a chat conversation.
    required Message message,
  }) = MessageBatchSucceededResult;

  // ------------------------------------------
  // UNION: MessageBatchErroredResult
  // ------------------------------------------

  /// Result of a request that encountered an error.

  @FreezedUnionValue('errored')
  const factory MessageBatchResult.messageBatchErroredResult({
    /// The result type.
    required String type,

    /// An error object.
    required Error error,
  }) = MessageBatchErroredResult;

  // ------------------------------------------
  // UNION: MessageBatchCanceledResult
  // ------------------------------------------

  /// Result of a request that was canceled.

  @FreezedUnionValue('canceled')
  const factory MessageBatchResult.messageBatchCanceledResult({
    /// The result type.
    required String type,
  }) = MessageBatchCanceledResult;

  // ------------------------------------------
  // UNION: MessageBatchExpiredResult
  // ------------------------------------------

  /// Result of a request that expired.

  @FreezedUnionValue('expired')
  const factory MessageBatchResult.messageBatchExpiredResult({
    /// The result type.
    required String type,
  }) = MessageBatchExpiredResult;

  /// Object construction from a JSON representation
  factory MessageBatchResult.fromJson(Map<String, dynamic> json) =>
      _$MessageBatchResultFromJson(json);
}

// ==========================================
// ENUM: MessageBatchResultEnumType
// ==========================================

enum MessageBatchResultEnumType {
  @JsonValue('succeeded')
  succeeded,
  @JsonValue('errored')
  errored,
  @JsonValue('canceled')
  canceled,
  @JsonValue('expired')
  expired,
}
