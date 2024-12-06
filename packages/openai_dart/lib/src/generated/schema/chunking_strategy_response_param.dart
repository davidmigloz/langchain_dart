// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: ChunkingStrategyResponseParam
// ==========================================

/// The chunking strategy used to chunk the file(s).
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class ChunkingStrategyResponseParam
    with _$ChunkingStrategyResponseParam {
  const ChunkingStrategyResponseParam._();

  // ------------------------------------------
  // UNION: StaticChunkingStrategyResponseParam
  // ------------------------------------------

  /// Static Chunking Strategy.

  @FreezedUnionValue('static')
  const factory ChunkingStrategyResponseParam.static({
    /// Always `static`.
    required String type,

    /// Static chunking strategy
    required StaticChunkingStrategy static,
  }) = StaticChunkingStrategyResponseParam;

  // ------------------------------------------
  // UNION: OtherChunkingStrategyResponseParam
  // ------------------------------------------

  /// Other Chunking Strategy. This is returned when the chunking strategy is unknown. Typically, this is because
  /// the file was indexed before the `chunking_strategy` concept was introduced in the API.

  @FreezedUnionValue('other')
  const factory ChunkingStrategyResponseParam.other({
    /// Always `other`.
    required String type,
  }) = OtherChunkingStrategyResponseParam;

  /// Object construction from a JSON representation
  factory ChunkingStrategyResponseParam.fromJson(Map<String, dynamic> json) =>
      _$ChunkingStrategyResponseParamFromJson(json);
}

// ==========================================
// ENUM: ChunkingStrategyResponseParamEnumType
// ==========================================

enum ChunkingStrategyResponseParamEnumType {
  @JsonValue('static')
  static,
  @JsonValue('other')
  other,
}
