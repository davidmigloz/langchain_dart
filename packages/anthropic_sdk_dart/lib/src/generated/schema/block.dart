// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Block
// ==========================================

/// A block of content in a message.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class Block with _$Block {
  const Block._();

  // ------------------------------------------
  // UNION: TextBlock
  // ------------------------------------------

  /// A block of text content.
  const factory Block.text({
    /// The text content.
    required String text,

    /// The type of content block.
    @Default('text') String type,
  }) = TextBlock;

  // ------------------------------------------
  // UNION: ImageBlock
  // ------------------------------------------

  /// A block of image content.
  const factory Block.image({
    /// The source of an image block.
    required ImageBlockSource source,

    /// The type of content block.
    @Default('image') String type,
  }) = ImageBlock;

  /// Object construction from a JSON representation
  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}

// ==========================================
// ENUM: BlockEnumType
// ==========================================

enum BlockEnumType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
}
