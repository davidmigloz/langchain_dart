// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: DeleteMessageBatchResponse
// ==========================================

/// Response returned when a message batch is deleted.
@freezed
abstract class DeleteMessageBatchResponse with _$DeleteMessageBatchResponse {
  const DeleteMessageBatchResponse._();

  /// Factory constructor for DeleteMessageBatchResponse
  const factory DeleteMessageBatchResponse({
    /// ID of the deleted Message Batch.
    required String id,

    /// Deleted object type. Always `"message_batch_deleted"`.
    required DeleteMessageBatchResponseType type,
  }) = _DeleteMessageBatchResponse;

  /// Object construction from a JSON representation
  factory DeleteMessageBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMessageBatchResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['id', 'type'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type};
  }
}

// ==========================================
// ENUM: DeleteMessageBatchResponseType
// ==========================================

/// Deleted object type. Always `"message_batch_deleted"`.
enum DeleteMessageBatchResponseType {
  @JsonValue('message_batch_deleted')
  messageBatchDeleted,
}
