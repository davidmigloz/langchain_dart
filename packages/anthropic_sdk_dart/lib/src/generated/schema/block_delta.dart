// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: BlockDelta
// ==========================================

/// A delta in a streaming message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class BlockDelta with _$BlockDelta {
  const BlockDelta._();

  // ------------------------------------------
  // UNION: TextBlockDelta
  // ------------------------------------------

  /// A delta in a streaming text block.

  @FreezedUnionValue('text_delta')
  const factory BlockDelta.textDelta({
    /// The text delta.
    required String text,

    /// The type of content block.
    required String type,
  }) = TextBlockDelta;

  // ------------------------------------------
  // UNION: InputJsonBlockDelta
  // ------------------------------------------

  /// A delta in a streaming input JSON.

  @FreezedUnionValue('input_json_delta')
  const factory BlockDelta.inputJsonDelta({
    /// The partial JSON delta.
    @JsonKey(name: 'partial_json', includeIfNull: false) String? partialJson,

    /// The type of content block.
    required String type,
  }) = InputJsonBlockDelta;

  // ------------------------------------------
  // UNION: ThinkingBlockDelta
  // ------------------------------------------

  /// A delta in a streaming thinking block. This represents incremental updates to
  /// Claude's internal thinking process as it is being generated.

  @FreezedUnionValue('thinking_delta')
  const factory BlockDelta.thinking({
    /// The thinking text delta.
    required String thinking,

    /// The type of content block delta.
    required ThinkingBlockDeltaType type,
  }) = ThinkingBlockDelta;

  // ------------------------------------------
  // UNION: SignatureBlockDelta
  // ------------------------------------------

  /// A delta in a streaming signature block. This contains the cryptographic signature
  /// for a thinking block, used to verify the integrity of thinking content.

  @FreezedUnionValue('signature_delta')
  const factory BlockDelta.signature({
    /// The signature delta.
    required String signature,

    /// The type of content block delta.
    required SignatureBlockDeltaType type,
  }) = SignatureBlockDelta;

  /// Object construction from a JSON representation
  factory BlockDelta.fromJson(Map<String, dynamic> json) =>
      _$BlockDeltaFromJson(json);
}

// ==========================================
// ENUM: BlockDeltaEnumType
// ==========================================

enum BlockDeltaEnumType {
  @JsonValue('text_delta')
  textDelta,
  @JsonValue('input_json_delta')
  inputJsonDelta,
  @JsonValue('thinking_delta')
  thinkingDelta,
  @JsonValue('signature_delta')
  signatureDelta,
}

// ==========================================
// ENUM: ThinkingBlockDeltaType
// ==========================================

/// The type of content block delta.
enum ThinkingBlockDeltaType {
  @JsonValue('thinking_delta')
  thinkingDelta,
}

// ==========================================
// ENUM: SignatureBlockDeltaType
// ==========================================

/// The type of content block delta.
enum SignatureBlockDeltaType {
  @JsonValue('signature_delta')
  signatureDelta,
}
