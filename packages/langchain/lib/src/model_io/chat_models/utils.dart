import 'models/models.dart';

/// Extensions on [List<ChatMessage>].
extension ChatMessagesX on List<ChatMessage> {
  /// This function is to get a string representation of the chat messages
  /// based on the message content and role.
  String toBufferString({
    final String systemPrefix = SystemChatMessage.defaultPrefix,
    final String humanPrefix = HumanChatMessage.defaultPrefix,
    final String aiPrefix = AIChatMessage.defaultPrefix,
    final String functionPrefix = FunctionChatMessage.defaultPrefix,
  }) {
    return map(
      (final m) {
        return switch (m) {
          SystemChatMessage _ => '$systemPrefix: ${m.content}',
          HumanChatMessage _ => '$humanPrefix: ${m.content}',
          AIChatMessage _ => m.functionCall == null
              ? '$aiPrefix: ${m.content}'
              : '$aiPrefix: ${m.functionCall!.name}(${m.functionCall!.arguments})',
          FunctionChatMessage(name: final n, content: final c) =>
            '$functionPrefix: $n=$c',
          final CustomChatMessage m => '${m.role}: ${m.content}',
        };
      },
    ).join('\n');
  }
}
