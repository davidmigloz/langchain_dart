import '../chains/chains.dart';
import '../model_io/chat_models/models/models.dart';
import '../model_io/chat_models/utils.dart';
import '../model_io/language_models/language_models.dart';
import '../model_io/prompts/prompts.dart';
import 'base.dart';
import 'chat.dart';
import 'chat_message_history/chat_message_history.dart';
import 'models/models.dart';

const _template = '''
Progressively summarize the lines of conversation provided, adding onto the previous summary returning a new summary.

EXAMPLE
Current summary:
The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good.

New lines of conversation:
Human: Why do you think artificial intelligence is a force for good?
AI: Because artificial intelligence will help humans reach their full potential.

New summary:
The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good because it will help humans reach their full potential.
END OF EXAMPLE

Current summary:
{summary}

New lines of conversation:
{new_lines}

New summary:''';

const _promptTemplate = PromptTemplate(
  template: _template,
  inputVariables: {'summary', 'new_lines'},
);

/// {@template conversation_summary_memory}
/// Memory that summarizes a conversation over time. This is useful for longer
/// conversations where keeping the full message history would take up too many
/// tokens.
///
/// It requires an [llm] to summarize the conversation. You can customize the
/// summarization prompt using [summaryPromptTemplate].
///
/// Every time [saveContext] is called, it will generate a new summary of the
/// conversation using the previous summary and the new messages.
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// You can provide an initial summary using [initialSummary]. If you have a
/// [chatHistory] with previous messages, you can use the factory constructor
/// [ConversationSummaryMemory.fromChatHistory] to generate an initial summary.
///
/// Example:
/// ```dart
/// final memory = ConversationSummaryMemory(llm: OpenAI(apiKey: '...'));
/// await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'System: Human said bar'}
/// ```
/// {@endtemplate}
final class ConversationSummaryMemory<LLMType extends BaseLanguageModel>
    extends BaseChatMemory {
  /// {@macro conversation_summary_memory}
  ConversationSummaryMemory({
    super.chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    required this.llm,
    final String initialSummary = '',
    this.summaryPromptTemplate = _promptTemplate,
    this.summaryMessageBuilder,
    this.memoryKey = BaseMemory.defaultMemoryKey,
    this.systemPrefix = SystemChatMessage.defaultPrefix,
    this.humanPrefix = HumanChatMessage.defaultPrefix,
    this.aiPrefix = AIChatMessage.defaultPrefix,
    this.functionPrefix = FunctionChatMessage.defaultPrefix,
  }) : _buffer = initialSummary;

  /// Language model to use for summarizing the conversation.
  final LLMType llm;

  /// [PromptTemplate] to use for summarizing previous conversations.
  /// This currently expect two input variables: `summary` and `new_lines`.
  /// summary is the previous summary and new_lines are the new messages
  /// formatted to add.
  final BasePromptTemplate summaryPromptTemplate;

  /// A builder to construct the chat message that contains the summary.
  /// If null, it will use [ChatMessage.system].
  final ChatMessage Function(String summary)? summaryMessageBuilder;

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

  /// Store the summarized chat history in memory.
  /// This does not concatenate, changes every new [ChatMessage] are added.
  String _buffer;

  @override
  Set<String> get memoryKeys => {memoryKey};

  /// Instantiate a [ConversationSummaryMemory] from a list of [ChatMessage]s.
  /// Use this factory method if you want to generate a [ConversationSummaryMemory]
  /// with pre-loaded history and don't have the summary of the messages.
  /// Required a [BaseLanguageModel] to use for summarizing.
  static Future<ConversationSummaryMemory> fromMessages({
    required final BaseLanguageModel llm,
    required final BaseChatMessageHistory chatHistory,
    final String? inputKey,
    final String? outputKey,
    final bool returnMessages = false,
    final String initialSummary = '',
    final PromptTemplate summaryPromptTemplate = _promptTemplate,
    final ChatMessage Function(String summary)? summaryMessageBuilder,
    final String memoryKey = BaseMemory.defaultMemoryKey,
    final String systemPrefix = SystemChatMessage.defaultPrefix,
    final String humanPrefix = HumanChatMessage.defaultPrefix,
    final String aiPrefix = AIChatMessage.defaultPrefix,
    final String functionPrefix = FunctionChatMessage.defaultPrefix,
    final int summaryStep = 2,
  }) async {
    final memory = ConversationSummaryMemory(
      chatHistory: chatHistory,
      llm: llm,
      inputKey: inputKey,
      outputKey: outputKey,
      returnMessages: returnMessages,
      initialSummary: initialSummary,
      summaryPromptTemplate: summaryPromptTemplate,
      summaryMessageBuilder: summaryMessageBuilder,
      memoryKey: memoryKey,
      systemPrefix: systemPrefix,
      humanPrefix: humanPrefix,
      aiPrefix: aiPrefix,
      functionPrefix: functionPrefix,
    );
    final messages = await chatHistory.getChatMessages();
    for (var i = 0; i < messages.length; i += summaryStep) {
      final summary = await memory._summarize(
        messages.sublist(i, i + summaryStep),
        memory._buffer,
      );
      memory._buffer = summary;
    }
    return memory;
  }

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final messages = <ChatMessage>[];
    if (_buffer.isNotEmpty) {
      final msg =
          summaryMessageBuilder?.call(_buffer) ?? ChatMessage.system(_buffer);
      messages.add(msg);
    }

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

  @override
  Future<void> saveContext({
    required final MemoryInputValues inputValues,
    required final MemoryOutputValues outputValues,
  }) async {
    await super.saveContext(
      inputValues: inputValues,
      outputValues: outputValues,
    );
    final messages = await chatHistory.getChatMessages();
    _buffer = await _summarize(
      messages.sublist(messages.length - 2),
      _buffer,
    );
  }

  Future<String> _summarize(
    final List<ChatMessage> messages,
    final String currentSummary,
  ) async {
    final input = messages.toBufferString(
      systemPrefix: systemPrefix,
      humanPrefix: humanPrefix,
      aiPrefix: aiPrefix,
      functionPrefix: functionPrefix,
    );
    return LLMChain(llm: llm, prompt: summaryPromptTemplate).run({
      'new_lines': input,
      'summary': currentSummary,
    });
  }

  @override
  Future<void> clear() async {
    await super.clear();
    _buffer = '';
  }
}
