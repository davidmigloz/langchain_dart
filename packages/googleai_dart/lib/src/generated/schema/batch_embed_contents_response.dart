// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: BatchEmbedContentsResponse
// ==========================================

/// The response to a `BatchEmbedContentsRequest`.
@freezed
class BatchEmbedContentsResponse with _$BatchEmbedContentsResponse {
  const BatchEmbedContentsResponse._();

  /// Factory constructor for BatchEmbedContentsResponse
  const factory BatchEmbedContentsResponse({
    /// Output only. The embeddings for each request, in the same order as provided in the batch request.
    @JsonKey(includeIfNull: false) List<ContentEmbedding>? embeddings,
  }) = _BatchEmbedContentsResponse;

  /// Object construction from a JSON representation
  factory BatchEmbedContentsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchEmbedContentsResponseFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['embeddings'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'embeddings': embeddings,
    };
  }
}
