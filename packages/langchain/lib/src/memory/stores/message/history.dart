import '../../../model_io/chat_models/models/models.dart';

/// {@template base_chat_message_history}
/// Base interface for chat message history.
///
/// See [ChatMessageHistory] for an in-memory implementation.
/// {@endtemplate}
abstract base class BaseChatMessageHistory {
  /// {@macro base_chat_message_history}
  const BaseChatMessageHistory();

  /// Return a list of messages.
  Future<List<ChatMessage>> getChatMessages();

  /// Add [ChatMessage] to the history.
  Future<void> addChatMessage(final ChatMessage message);

  /// Add a user message to the history.
  Future<void> addUserChatMessage(final String message) {
    return addChatMessage(ChatMessage.human(message));
  }

  /// Add an AI message to the history.
  Future<void> addAIChatMessage(final String message) {
    return addChatMessage(ChatMessage.ai(message));
  }

  /// Add a Function response message to the history.
  Future<void> addFunctionChatMessage({
    required final String name,
    required final String content,
  }) {
    return addChatMessage(
      ChatMessage.function(
        name: name,
        content: content,
      ),
    );
  }

  /// Clear the history.
  Future<void> clear();
}
