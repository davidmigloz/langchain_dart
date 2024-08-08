// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ToolResourcesFileSearchVectorStore
// ==========================================

/// A helper to create a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) with file_ids and attach it to this thread.
@freezed
class ToolResourcesFileSearchVectorStore
    with _$ToolResourcesFileSearchVectorStore {
  const ToolResourcesFileSearchVectorStore._();

  /// Factory constructor for ToolResourcesFileSearchVectorStore
  const factory ToolResourcesFileSearchVectorStore({
    /// A list of [file](https://platform.openai.com/docs/api-reference/files) IDs to add to the vector store. There can be a maximum of 10000 files in a vector store.
    @JsonKey(name: 'file_ids', includeIfNull: false) List<String>? fileIds,

    /// The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
    /// Any of: [AutoChunkingStrategyRequestParam], [StaticChunkingStrategyRequestParam]
    @JsonKey(name: 'chunking_strategy', includeIfNull: false)
    ChunkingStrategyRequestParam? chunkingStrategy,

    /// Set of 16 key-value pairs that can be attached to a vector store. This can be useful for storing additional information about the vector store in a structured format. Keys can be a maximum of 64 characters long and values can be a maxium of 512 characters long.
    @JsonKey(includeIfNull: false) dynamic metadata,
  }) = _ToolResourcesFileSearchVectorStore;

  /// Object construction from a JSON representation
  factory ToolResourcesFileSearchVectorStore.fromJson(
          Map<String, dynamic> json) =>
      _$ToolResourcesFileSearchVectorStoreFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'file_ids',
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
      'file_ids': fileIds,
      'chunking_strategy': chunkingStrategy,
      'metadata': metadata,
    };
  }
}
