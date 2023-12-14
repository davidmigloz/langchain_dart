// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: BatchEmbedContentsRequest
// ==========================================

/// Batch request to get embeddings from the model for a list of prompts.
@freezed
class BatchEmbedContentsRequest with _$BatchEmbedContentsRequest {
  const BatchEmbedContentsRequest._();

  /// Factory constructor for BatchEmbedContentsRequest
  const factory BatchEmbedContentsRequest({
    /// Required. Embed requests for the batch. The model in each of these requests must match the model specified `BatchEmbedContentsRequest.model`.
    @JsonKey(includeIfNull: false) List<EmbedContentRequest>? requests,
  }) = _BatchEmbedContentsRequest;

  /// Object construction from a JSON representation
  factory BatchEmbedContentsRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchEmbedContentsRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['requests'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'requests': requests,
    };
  }
}
