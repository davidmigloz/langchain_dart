// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateVectorStoreFileBatchRequest
// ==========================================

/// Request object for the Create vector store file batch endpoint.
@freezed
abstract class CreateVectorStoreFileBatchRequest
    with _$CreateVectorStoreFileBatchRequest {
  const CreateVectorStoreFileBatchRequest._();

  /// Factory constructor for CreateVectorStoreFileBatchRequest
  const factory CreateVectorStoreFileBatchRequest({
    /// A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.
    @JsonKey(name: 'file_ids') required List<String> fileIds,

    /// The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
    /// Any of: [AutoChunkingStrategyRequestParam], [StaticChunkingStrategyRequestParam]
    @JsonKey(name: 'chunking_strategy', includeIfNull: false)
    ChunkingStrategyRequestParam? chunkingStrategy,
  }) = _CreateVectorStoreFileBatchRequest;

  /// Object construction from a JSON representation
  factory CreateVectorStoreFileBatchRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateVectorStoreFileBatchRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['file_ids', 'chunking_strategy'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {'file_ids': fileIds, 'chunking_strategy': chunkingStrategy};
  }
}
