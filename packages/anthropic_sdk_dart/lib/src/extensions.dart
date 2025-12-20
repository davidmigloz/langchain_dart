import 'generated/schema/schema.dart';

/// Extension methods for [MessageContent].
extension MessageContentX on MessageContent {
  /// Returns the text content of the message.
  String get text {
    return map(
      text: (text) => text.value,
      blocks: (blocks) =>
          blocks.value.whereType<TextBlock>().map((t) => t.text).join('\n'),
    );
  }

  /// Returns the blocks of the message.
  List<Block> get blocks {
    return map(
      text: (text) => [Block.text(text: text.value)],
      blocks: (blocks) => blocks.value,
    );
  }
}

/// Extension methods for [ToolResultBlockContent].
extension ToolResultBlockContentX on ToolResultBlockContent {
  /// Returns the text content of the tool result block content.
  String get text {
    return map(
      text: (ToolResultBlockContentText t) => t.value,
      blocks: (b) =>
          b.value.whereType<TextBlock>().map((t) => t.text).join('\n'),
    );
  }

  /// Returns the blocks of the tool result block content.
  List<Block> get blocks {
    return map(
      text: (t) => [Block.text(text: t.value)],
      blocks: (b) => b.value,
    );
  }
}

/// Extension methods for [Block].
extension BlockX on Block {
  /// Returns the text content of the block.
  String get text {
    return mapOrNull(text: (text) => text.text) ?? '';
  }

  /// Returns the image source of the block.
  ImageBlock? get image {
    return mapOrNull(image: (image) => image);
  }

  /// Returns the tool use block.
  ToolUseBlock? get toolUse {
    return mapOrNull(toolUse: (toolUse) => toolUse);
  }

  /// Returns the tool result block.
  ToolResultBlock? get toolResult {
    return mapOrNull(toolResult: (toolResult) => toolResult);
  }
}

/// Extension methods for [BlockDelta].
extension BlockDeltaX on BlockDelta {
  /// Returns the text content of the block delta.
  String get text {
    return map(
      textDelta: (text) => text.text,
      inputJsonDelta: (inputJson) => '',
      thinking: (thinking) => thinking.thinking,
      signature: (signature) => '',
      citations: (citations) => '',
    );
  }

  /// Returns the type of the block delta.
  String get inputJson {
    return map(
      textDelta: (text) => '',
      inputJsonDelta: (inputJson) => inputJson.partialJson ?? '',
      thinking: (thinking) => '',
      signature: (signature) => '',
      citations: (citations) => '',
    );
  }
}
