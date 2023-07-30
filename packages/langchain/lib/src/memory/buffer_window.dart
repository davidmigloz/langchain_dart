import '../model_io/chat_models/models/models.dart';
import '../model_io/chat_models/utils.dart';
import 'chat.dart';
import 'models/models.dart';

/// {@template conversation_buffer_window_memory}
/// Buffer for storing a conversation in-memory inside a limited size window
/// and then retrieving the messages at a later time.
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// Example:
/// ```dart
/// final memory = ConversationBufferWindowMemory();
/// await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'Human: bar\nAI: foo'}
/// ```
/// {@endtemplate}
final class ConversationBufferWindowMemory extends BaseChatMemory {
  /// {@macro conversation_buffer_window_memory}
  ConversationBufferWindowMemory({
    super.chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    this.humanPrefix = 'Human',
    this.aiPrefix = 'AI',
    this.memoryKey = 'history',
    this.k = 5,
  });

  /// The prefix to use for human messages.
  final String humanPrefix;

  /// The prefix to use for AI messages.
  final String aiPrefix;

  /// The memory key to use for the chat history.
  final String memoryKey;

  /// Number of messages to keep in the buffer.
  final int k;

  @override
  Set<String> get memoryKeys => {memoryKey};

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final messages = k > 0 ? await _getChatMessages() : <ChatMessage>[];
    if (returnMessages) {
      return {memoryKey: messages};
    }
    return {
      memoryKey: messages.toBufferString(
        humanPrefix: humanPrefix,
        aiPrefix: aiPrefix,
      ),
    };
  }

  Future<List<ChatMessage>> _getChatMessages() async {
    final historyMessages = await chatHistory.getChatMessages();
    return historyMessages.length > k
        ? historyMessages.sublist(historyMessages.length - k * 2)
        : historyMessages;
  }
}
