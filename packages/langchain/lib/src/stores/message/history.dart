import '../../chat_models/models/models.dart';
import 'in_memory.dart';

/// {@template base_chat_message_history}
/// Base interface for chat message history.
///
/// See [ChatMessageHistory] for an in-memory implementation.
/// {@endtemplate}
abstract base class BaseChatMessageHistory {
  /// {@macro base_chat_message_history}
  const BaseChatMessageHistory();

  /// Return a list of messages.
  Future<List<ChatMessage>> getMessages();

  /// Add [ChatMessage] to the history.
  Future<void> addMessage(final ChatMessage message);

  /// Add a user message to the history.
  Future<void> addUserMessage(final String message) {
    return addMessage(ChatMessage.human(message));
  }

  /// Add an AI message to the history.
  Future<void> addAIChatMessage(final String message) {
    return addMessage(ChatMessage.ai(message));
  }

  /// Clear the history.
  Future<void> clear();
}
