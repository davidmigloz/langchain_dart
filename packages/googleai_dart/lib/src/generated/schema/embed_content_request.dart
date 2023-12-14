// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of google_a_i_schema;

// ==========================================
// CLASS: EmbedContentRequest
// ==========================================

/// Request containing the `Content` for the model to embed.
@freezed
class EmbedContentRequest with _$EmbedContentRequest {
  const EmbedContentRequest._();

  /// Factory constructor for EmbedContentRequest
  const factory EmbedContentRequest({
    /// Required. The content to embed. Only the `parts.text` fields will be counted.
    @JsonKey(includeIfNull: false) Content? content,

    /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001`.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    EmbedContentRequestTaskType? taskType,

    /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
    @JsonKey(includeIfNull: false) String? model,

    /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`.
    @JsonKey(includeIfNull: false) String? title,
  }) = _EmbedContentRequest;

  /// Object construction from a JSON representation
  factory EmbedContentRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbedContentRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'content',
    'taskType',
    'model',
    'title'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'taskType': taskType,
      'model': model,
      'title': title,
    };
  }
}

// ==========================================
// ENUM: EmbedContentRequestTaskType
// ==========================================

/// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001`.
enum EmbedContentRequestTaskType {
  @JsonValue('TASK_TYPE_UNSPECIFIED')
  taskTypeUnspecified,
  @JsonValue('RETRIEVAL_QUERY')
  retrievalQuery,
  @JsonValue('RETRIEVAL_DOCUMENT')
  retrievalDocument,
  @JsonValue('SEMANTIC_SIMILARITY')
  semanticSimilarity,
  @JsonValue('CLASSIFICATION')
  classification,
  @JsonValue('CLUSTERING')
  clustering,
}
