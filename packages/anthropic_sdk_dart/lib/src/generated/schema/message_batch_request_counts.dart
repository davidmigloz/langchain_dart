// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageBatchRequestCounts
// ==========================================

/// Tallies requests within the Message Batch, categorized by their status.
@freezed
abstract class MessageBatchRequestCounts with _$MessageBatchRequestCounts {
  const MessageBatchRequestCounts._();

  /// Factory constructor for MessageBatchRequestCounts
  const factory MessageBatchRequestCounts({
    /// Number of requests in the Message Batch that are processing.
    required int processing,

    /// Number of requests in the Message Batch that have completed successfully.
    required int succeeded,

    /// Number of requests in the Message Batch that encountered an error.
    required int errored,

    /// Number of requests in the Message Batch that have been canceled.
    required int canceled,

    /// Number of requests in the Message Batch that have expired.
    required int expired,
  }) = _MessageBatchRequestCounts;

  /// Object construction from a JSON representation
  factory MessageBatchRequestCounts.fromJson(Map<String, dynamic> json) =>
      _$MessageBatchRequestCountsFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'processing',
    'succeeded',
    'errored',
    'canceled',
    'expired',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'processing': processing,
      'succeeded': succeeded,
      'errored': errored,
      'canceled': canceled,
      'expired': expired,
    };
  }
}
