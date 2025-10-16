// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CreateMessageBatchRequest
// ==========================================

/// The request parameters for creating a message batch.
@freezed
abstract class CreateMessageBatchRequest with _$CreateMessageBatchRequest {
  const CreateMessageBatchRequest._();

  /// Factory constructor for CreateMessageBatchRequest
  const factory CreateMessageBatchRequest({
    /// List of requests for prompt completion. Each is an individual request to create a Message.
    required List<BatchMessageRequest> requests,
  }) = _CreateMessageBatchRequest;

  /// Object construction from a JSON representation
  factory CreateMessageBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageBatchRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['requests'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'requests': requests};
  }
}
