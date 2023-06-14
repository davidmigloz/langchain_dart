import '../chat_models/utils.dart';
import '../stores/message/in_memory.dart';
import 'chat_memory.dart';
import 'models/models.dart';

/// {@template conversation_buffer_memory}
/// Buffer for storing a conversation in-memory and then retrieving the
/// messages at a later time.
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// Example:
/// ```dart
/// final memory = ConversationBufferMemory();
/// await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'Human: bar\nAI: foo'}
/// ```
/// {@endtemplate}
final class ConversationBufferMemory extends BaseChatMemory {
  /// {@macro conversation_buffer_memory}
  ConversationBufferMemory({
    super.chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    this.humanPrefix = 'Human',
    this.aiPrefix = 'AI',
    this.memoryKey = 'history',
  });

  /// The prefix to use for human messages.
  final String humanPrefix;

  /// The prefix to use for AI messages.
  final String aiPrefix;

  /// The memory key to use for the chat history.
  final String memoryKey;

  @override
  Set<String> get memoryKeys => {memoryKey};

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final messages = await chatHistory.getMessages();
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
}
