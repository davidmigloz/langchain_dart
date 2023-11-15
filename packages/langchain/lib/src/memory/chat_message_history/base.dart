import '../../model_io/chat_models/models/models.dart';

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

  /// Add a human message to the history.
  Future<void> addHumanChatMessage(final String message) {
    return addChatMessage(ChatMessage.humanText(message));
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

  /// Removes and returns the first (oldest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  Future<ChatMessage> removeFirst();

  /// Removes and returns the last (newest) element of the history.
  ///
  /// The history must not be empty when this method is called.
  Future<ChatMessage> removeLast();

  /// Clear the history.
  Future<void> clear();
}
