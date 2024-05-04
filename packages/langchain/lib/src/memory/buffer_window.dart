import 'package:langchain_core/chat_history.dart';
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/memory.dart';

import '../chat_history/in_memory.dart';

/// {@template conversation_buffer_window_memory}
/// [ConversationBufferWindowMemory] is a type of memory that stores a
/// conversation in [chatHistory] and then retrieves the last [k] interactions
/// with the model (i.e. the last [k] input messages and the last [k] output
/// messages).
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// Example:
/// ```dart
/// final memory = ConversationBufferWindowMemory(k: 10);
/// await memory.saveContext({'input': 'bar'}, {'output': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'Human: bar\nAI: foo'}
/// ```
/// {@endtemplate}
final class ConversationBufferWindowMemory extends BaseChatMemory {
  /// {@macro conversation_buffer_window_memory}
  ConversationBufferWindowMemory({
    final BaseChatMessageHistory? chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    this.k = 5,
    this.memoryKey = BaseMemory.defaultMemoryKey,
    this.systemPrefix = SystemChatMessage.defaultPrefix,
    this.humanPrefix = HumanChatMessage.defaultPrefix,
    this.aiPrefix = AIChatMessage.defaultPrefix,
    this.toolPrefix = ToolChatMessage.defaultPrefix,
  }) : super(chatHistory: chatHistory ?? ChatMessageHistory());

  /// Number of interactions to store in the buffer.
  final int k;

  /// The memory key to use for the chat history.
  /// This will be passed as input variable to the prompt.
  final String memoryKey;

  /// The prefix to use for system messages if [returnMessages] is false.
  final String systemPrefix;

  /// The prefix to use for human messages if [returnMessages] is false.
  final String humanPrefix;

  /// The prefix to use for AI messages if [returnMessages] is false.
  final String aiPrefix;

  /// The prefix to use for tool messages if [returnMessages] is false.
  final String toolPrefix;

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
        systemPrefix: systemPrefix,
        humanPrefix: humanPrefix,
        aiPrefix: aiPrefix,
        toolPrefix: toolPrefix,
      ),
    };
  }

  Future<List<ChatMessage>> _getChatMessages() async {
    final historyMessages = await chatHistory.getChatMessages();
    return historyMessages.length > k * 2
        ? historyMessages.sublist(historyMessages.length - k * 2)
        : historyMessages;
  }
}
