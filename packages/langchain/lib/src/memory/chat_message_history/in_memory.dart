import 'dart:collection';

import '../../model_io/chat_models/chat_models.dart';
import 'base.dart';

/// {@template chat_message_history}
/// A simple in-memory implementation of a chat message history.
/// Stores messages in an in memory list.
/// {@endtemplate}
final class ChatMessageHistory extends BaseChatMessageHistory {
  /// {@macro chat_message_history}
  ChatMessageHistory({final List<ChatMessage>? messages})
      : _messages = Queue.from(messages ?? <ChatMessage>[]);

  final Queue<ChatMessage> _messages;

  @override
  Future<List<ChatMessage>> getChatMessages() {
    return Future.value(_messages.toList(growable: false));
  }

  @override
  Future<void> addChatMessage(final ChatMessage message) async {
    _messages.add(message);
  }

  @override
  Future<ChatMessage> removeFirst() {
    return Future.value(_messages.removeFirst());
  }

  @override
  Future<ChatMessage> removeLast() {
    return Future.value(_messages.removeLast());
  }

  @override
  Future<void> clear() async {
    _messages.clear();
  }
}
