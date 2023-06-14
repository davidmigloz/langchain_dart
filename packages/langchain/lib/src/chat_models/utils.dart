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
        final role = switch (m) {
          SystemChatMessage _ => 'System',
          HumanChatMessage _ => humanPrefix,
          AIChatMessage _ => aiPrefix,
          final CustomChatMessage m => m.role,
        };
        return '$role: ${m.content}';
      },
    ).join('\n');
  }
}
