// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: MessageBatchIndividualResponse
// ==========================================

/// An individual result from a Message Batch.
@freezed
abstract class MessageBatchIndividualResponse
    with _$MessageBatchIndividualResponse {
  const MessageBatchIndividualResponse._();

  /// Factory constructor for MessageBatchIndividualResponse
  const factory MessageBatchIndividualResponse({
    /// Developer-provided ID created for each request in a Message Batch.
    /// Useful for matching results to requests.
    @JsonKey(name: 'custom_id') required String customId,

    /// The result of processing a request in a Message Batch.
    /// Can be succeeded, errored, canceled, or expired.
    /// Any of: [MessageBatchSucceededResult], [MessageBatchErroredResult], [MessageBatchCanceledResult], [MessageBatchExpiredResult]
    required MessageBatchResult result,
  }) = _MessageBatchIndividualResponse;

  /// Object construction from a JSON representation
  factory MessageBatchIndividualResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageBatchIndividualResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['custom_id', 'result'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'custom_id': customId, 'result': result};
  }
}
