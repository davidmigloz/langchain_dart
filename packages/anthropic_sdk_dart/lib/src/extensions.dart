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
}
