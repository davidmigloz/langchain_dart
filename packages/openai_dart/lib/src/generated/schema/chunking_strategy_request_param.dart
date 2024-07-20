// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChunkingStrategyRequestParam
// ==========================================

/// The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ChunkingStrategyRequestParam with _$ChunkingStrategyRequestParam {
  const ChunkingStrategyRequestParam._();

  // ------------------------------------------
  // UNION: AutoChunkingStrategyRequestParam
  // ------------------------------------------

  /// Auto Chunking Strategy, the default strategy. This strategy currently uses a `max_chunk_size_tokens` of `800`
  /// and `chunk_overlap_tokens` of `400`.
  const factory ChunkingStrategyRequestParam.auto({
    /// Always `auto`.
    required String type,
  }) = AutoChunkingStrategyRequestParam;

  // ------------------------------------------
  // UNION: StaticChunkingStrategyRequestParam
  // ------------------------------------------

  /// Static chunking strategy
  const factory ChunkingStrategyRequestParam.static({
    /// Always `static`.
    required String type,

    /// Static chunking strategy
    required StaticChunkingStrategy static,
  }) = StaticChunkingStrategyRequestParam;

  /// Object construction from a JSON representation
  factory ChunkingStrategyRequestParam.fromJson(Map<String, dynamic> json) =>
      _$ChunkingStrategyRequestParamFromJson(json);
}

// ==========================================
// ENUM: ChunkingStrategyRequestParamEnumType
// ==========================================

enum ChunkingStrategyRequestParamEnumType {
  @JsonValue('auto')
  auto,
  @JsonValue('static')
  static,
}
