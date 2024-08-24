import 'types.dart';

/// Extensions on `List<ChatMessage>`.
extension ChatMessagesX on List<ChatMessage> {
  /// This function is to get a string representation of the chat messages
  /// based on the message content and role.
  String toBufferString({
    final String systemPrefix = SystemChatMessage.defaultPrefix,
    final String humanPrefix = HumanChatMessage.defaultPrefix,
    final String aiPrefix = AIChatMessage.defaultPrefix,
    final String toolPrefix = ToolChatMessage.defaultPrefix,
  }) {
    return map(
      (final m) {
        return switch (m) {
          SystemChatMessage _ => '$systemPrefix: ${m.contentAsString}',
          HumanChatMessage _ => '$humanPrefix: ${m.contentAsString}',
          AIChatMessage _ => m.toolCalls.isEmpty
              ? '$aiPrefix: ${m.contentAsString}'
              : m.toolCalls
                  .map((c) => '$aiPrefix: ${c.id} ${c.name}(${c.arguments})')
                  .join('\n'),
          ToolChatMessage(toolCallId: final id, content: final c) =>
            '$toolPrefix: $id=$c',
          final CustomChatMessage m => '${m.role}: ${m.contentAsString}',
        };
      },
    ).join('\n');
  }
}
