import '../model_io/chat_models/models/models.dart';
import '../model_io/chat_models/utils.dart';
import 'base.dart';
import 'chat.dart';
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
    this.memoryKey = BaseMemory.defaultMemoryKey,
    this.systemPrefix = SystemChatMessage.defaultPrefix,
    this.humanPrefix = HumanChatMessage.defaultPrefix,
    this.aiPrefix = AIChatMessage.defaultPrefix,
    this.functionPrefix = FunctionChatMessage.defaultPrefix,
  });

  /// The memory key to use for the chat history.
  /// This will be passed as input variable to the prompt.
  final String memoryKey;

  /// The prefix to use for system messages.
  final String systemPrefix;

  /// The prefix to use for human messages.
  final String humanPrefix;

  /// The prefix to use for AI messages.
  final String aiPrefix;

  /// The prefix to use for function messages.
  final String functionPrefix;

  @override
  Set<String> get memoryKeys => {memoryKey};

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final messages = await chatHistory.getChatMessages();
    if (returnMessages) {
      return {memoryKey: messages};
    }
    return {
      memoryKey: messages.toBufferString(
        systemPrefix: systemPrefix,
        humanPrefix: humanPrefix,
        aiPrefix: aiPrefix,
        functionPrefix: functionPrefix,
      ),
    };
  }
}
