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
abstract class EmbedContentRequest with _$EmbedContentRequest {
  const EmbedContentRequest._();

  /// Factory constructor for EmbedContentRequest
  const factory EmbedContentRequest({
    /// Optional. An optional title for the text. Only applicable when TaskType is `RETRIEVAL_DOCUMENT`. Note: Specifying a `title` for `RETRIEVAL_DOCUMENT` provides better quality embeddings for retrieval.
    @JsonKey(includeIfNull: false) String? title,

    /// Required. The content to embed. Only the `parts.text` fields will be counted.
    @JsonKey(includeIfNull: false) Content? content,

    /// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001` or newer models.
    @JsonKey(
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    EmbedContentRequestTaskType? taskType,

    /// Required. The model's resource name. This serves as an ID for the Model to use. This name should match a model name returned by the `ListModels` method. Format: `models/{model}`
    @JsonKey(includeIfNull: false) String? model,

    /// Optional. Optional reduced dimension for the output embedding. If set, excessive values in the output embedding are truncated from the end. Supported by newer models since 2024, and the earlier model (`models/embedding-001`) cannot specify this value.
    @JsonKey(includeIfNull: false) int? outputDimensionality,
  }) = _EmbedContentRequest;

  /// Object construction from a JSON representation
  factory EmbedContentRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbedContentRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'title',
    'content',
    'taskType',
    'model',
    'outputDimensionality'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'taskType': taskType,
      'model': model,
      'outputDimensionality': outputDimensionality,
    };
  }
}

// ==========================================
// ENUM: EmbedContentRequestTaskType
// ==========================================

/// Optional. Optional task type for which the embeddings will be used. Can only be set for `models/embedding-001` or newer models.
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
  @JsonValue('QUESTION_ANSWERING')
  questionAnswering,
  @JsonValue('FACT_VERIFICATION')
  factVerification,
}
