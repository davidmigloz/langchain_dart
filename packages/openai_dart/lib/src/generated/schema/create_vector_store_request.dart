// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateVectorStoreRequest
// ==========================================

/// Request object for the Create assistant file endpoint.
@freezed
class CreateVectorStoreRequest with _$CreateVectorStoreRequest {
  const CreateVectorStoreRequest._();

  /// Factory constructor for CreateVectorStoreRequest
  const factory CreateVectorStoreRequest({
    /// The name of the vector store.
    @JsonKey(includeIfNull: false) String? name,

    /// A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file_search` that can access files.
    @JsonKey(name: 'file_ids', includeIfNull: false) List<String>? fileIds,

    /// The expiration policy for a vector store.
    @JsonKey(name: 'expires_after', includeIfNull: false)
    VectorStoreExpirationAfter? expiresAfter,

    /// The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
    /// Any of: [AutoChunkingStrategyRequestParam], [StaticChunkingStrategyRequestParam]
    @JsonKey(name: 'chunking_strategy', includeIfNull: false)
    ChunkingStrategyRequestParam? chunkingStrategy,

    /// Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional
    /// information about the object in a structured format. Keys can be a maximum of 64 characters long and values
    /// can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) dynamic metadata,
  }) = _CreateVectorStoreRequest;

  /// Object construction from a JSON representation
  factory CreateVectorStoreRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVectorStoreRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'name',
    'file_ids',
    'expires_after',
    'chunking_strategy',
    'metadata'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'file_ids': fileIds,
      'expires_after': expiresAfter,
      'chunking_strategy': chunkingStrategy,
      'metadata': metadata,
    };
  }
}
