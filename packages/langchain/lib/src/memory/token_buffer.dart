import '../model_io/chat_models/models/models.dart';
import '../model_io/chat_models/utils.dart';
import '../model_io/language_models/language_models.dart';
import '../model_io/prompts/prompts.dart';
import 'buffer_window.dart';
import 'chat.dart';
import 'models/models.dart';
import 'stores/message/in_memory.dart';

/// {@template conversation_token_buffer_memory}
/// Rolling buffer for storing a conversation and then retrieving the messages
/// at a later time.
///
/// It uses token length (rather than number of interactions like
/// [ConversationBufferWindowMemory]) to determine when to flush old
/// interactions from the buffer. This allows it to keep more context while
/// staying under a max token limit.
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// Example:
/// ```dart
/// final memory = ConversationTokenBufferMemory(llm: OpenAI(apiKey: '...'));
/// await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'Human: bar\nAI: foo'}
/// ```
/// {@endtemplate}
final class ConversationTokenBufferMemory<
    LLMInput extends Object,
    LLMOptions extends LanguageModelOptions,
    LLMOutput extends Object> extends BaseChatMemory {
  /// {@macro conversation_token_buffer_memory}
  ConversationTokenBufferMemory({
    super.chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    required this.llm,
    this.humanPrefix = 'Human',
    this.aiPrefix = 'AI',
    this.memoryKey = 'history',
    this.maxTokenLimit = 2000,
  });

  /// Language model to use for counting tokens.
  final BaseLanguageModel<LLMInput, LLMOptions, LLMOutput> llm;

  /// The prefix to use for human messages.
  final String humanPrefix;

  /// The prefix to use for AI messages.
  final String aiPrefix;

  /// The memory key to use for the chat history.
  final String memoryKey;

  /// Max number of tokens to use.
  final int maxTokenLimit;

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
        humanPrefix: humanPrefix,
        aiPrefix: aiPrefix,
      ),
    };
  }

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    await super.saveContext(
      inputValues: inputValues,
      outputValues: outputValues,
    );
    List<ChatMessage> buffer = await chatHistory.getChatMessages();
    int currentBufferLength = await llm.countTokens(PromptValue.chat(buffer));
    // Prune buffer if it exceeds max token limit
    if (currentBufferLength > maxTokenLimit) {
      while (currentBufferLength > maxTokenLimit) {
        await chatHistory.removeFirst();
        buffer = await chatHistory.getChatMessages();
        currentBufferLength = await llm.countTokens(PromptValue.chat(buffer));
      }
    }
  }
}
