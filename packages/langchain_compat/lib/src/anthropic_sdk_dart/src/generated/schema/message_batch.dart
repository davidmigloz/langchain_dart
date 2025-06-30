// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageBatch
// ==========================================

/// A batch of message requests.
@freezed
class MessageBatch with _$MessageBatch {
  const MessageBatch._();

  /// Factory constructor for MessageBatch
  const factory MessageBatch({
    /// Unique object identifier for the message batch.
    required String id,

    /// RFC 3339 datetime string representing the time at which the Message Batch was created.
    @JsonKey(name: 'created_at') required String createdAt,

    /// RFC 3339 datetime string representing the time at which the Message Batch will expire and end processing, which is 24 hours after creation.
    @JsonKey(name: 'expires_at') required String expiresAt,

    /// Processing status of the Message Batch.
    @JsonKey(name: 'processing_status')
    required MessageBatchProcessingStatus processingStatus,

    /// Tallies requests within the Message Batch, categorized by their status.
    @JsonKey(name: 'request_counts')
    required MessageBatchRequestCounts requestCounts,

    /// URL to a `.jsonl` file containing the results of the Message Batch requests. Specified only once processing ends.
    @JsonKey(name: 'results_url', includeIfNull: false) String? resultsUrl,

    /// Object type. For Message Batches, this is always `"message_batch"`.
    required MessageBatchType type,
  }) = _MessageBatch;

  /// Object construction from a JSON representation
  factory MessageBatch.fromJson(Map<String, dynamic> json) =>
      _$MessageBatchFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'id',
    'created_at',
    'expires_at',
    'processing_status',
    'request_counts',
    'results_url',
    'type',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt,
      'expires_at': expiresAt,
      'processing_status': processingStatus,
      'request_counts': requestCounts,
      'results_url': resultsUrl,
      'type': type,
    };
  }
}

// ==========================================
// ENUM: MessageBatchProcessingStatus
// ==========================================

/// Processing status of the Message Batch.
enum MessageBatchProcessingStatus {
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('canceling')
  canceling,
  @JsonValue('ended')
  ended,
}

// ==========================================
// ENUM: MessageBatchType
// ==========================================

/// Object type. For Message Batches, this is always `"message_batch"`.
enum MessageBatchType {
  @JsonValue('message_batch')
  messageBatch,
}
