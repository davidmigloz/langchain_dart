// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateBatchRequest
// ==========================================

/// Represents a request to create a new batch.
@freezed
abstract class CreateBatchRequest with _$CreateBatchRequest {
  const CreateBatchRequest._();

  /// Factory constructor for CreateBatchRequest
  const factory CreateBatchRequest({
    /// The ID of an uploaded file that contains requests for the new batch.
    ///
    /// See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.
    ///
    /// Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input),
    /// and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.
    @JsonKey(name: 'input_file_id') required String inputFileId,

    /// The endpoint to be used for all requests in the batch. Currently `/v1/chat/completions`, `/v1/embeddings`, and `/v1/completions` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
    required BatchEndpoint endpoint,

    /// The time frame within which the batch should be processed. Currently only `24h` is supported.
    @JsonKey(name: 'completion_window')
    required BatchCompletionWindow completionWindow,

    /// Optional custom metadata for the batch.
    @JsonKey(includeIfNull: false) Map<String, String>? metadata,
  }) = _CreateBatchRequest;

  /// Object construction from a JSON representation
  factory CreateBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBatchRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'input_file_id',
    'endpoint',
    'completion_window',
    'metadata',
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'input_file_id': inputFileId,
      'endpoint': endpoint,
      'completion_window': completionWindow,
      'metadata': metadata,
    };
  }
}
