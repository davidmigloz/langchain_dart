import 'models/models.dart';

/// Extensions on [List<ChatMessage>].
extension ChatMessagesX on List<ChatMessage> {
  /// This function is to get a string representation of the chat messages
  /// based on the message content and role.
  String toBufferString({
    final String humanPrefix = 'Human',
    final String aiPrefix = 'AI',
  }) {
    return map(
      (final m) {
        return switch (m) {
          SystemChatMessage _ => 'System: ${m.content}',
          HumanChatMessage _ => '$humanPrefix: ${m.content}',
          AIChatMessage _ => m.functionCall == null
              ? '$aiPrefix: ${m.content}'
              : '$aiPrefix: ${m.functionCall!.name}(${m.functionCall!.arguments})',
          FunctionChatMessage(name: final n, content: final c) =>
            'Function: $n=$c',
          final CustomChatMessage m => '${m.role}: ${m.content}',
        };
      },
    ).join('\n');
  }
}
