// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: BatchMessageRequest
// ==========================================

/// An individual message request within a batch.
@freezed
class BatchMessageRequest with _$BatchMessageRequest {
  const BatchMessageRequest._();

  /// Factory constructor for BatchMessageRequest
  const factory BatchMessageRequest({
    /// Developer-provided ID created for each request in a Message Batch. Useful for
    /// matching results to requests, as results may be given out of request order.
    ///
    /// Must be unique for each request within the Message Batch.
    @JsonKey(name: 'custom_id') required String customId,

    /// The request parameters for creating a message.
    required CreateMessageRequest params,
  }) = _BatchMessageRequest;

  /// Object construction from a JSON representation
  factory BatchMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchMessageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['custom_id', 'params'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'custom_id': customId,
      'params': params,
    };
  }
}
