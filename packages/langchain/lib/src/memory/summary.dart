import '../chains/chains.dart';
import '../model_io/chat_models/models/models.dart';
import '../model_io/chat_models/utils.dart';
import '../model_io/language_models/language_models.dart';
import '../model_io/prompts/prompts.dart';
import 'base.dart';
import 'chat.dart';
import 'models/models.dart';
import 'stores/message/history.dart';
import 'stores/message/in_memory.dart';

/// {@template conversation_summary_memory}
/// Summarizer memory to store a conversation and then retrieving the messages
/// the summary of the conversation at a later time.
///
/// It requires a language model to summarize the conversation.
///
/// It uses [ChatMessageHistory] as in-memory storage by default.
///
/// Example:
/// ```dart
/// final memory = ConversationSummaryMemory(llm: OpenAI(apiKey: '...'));
/// await memory.saveContext({'foo': 'bar'}, {'bar': 'foo'});
/// final res = await memory.loadMemoryVariables();
/// // {'history': 'System: Human said bar'}
/// ```
/// {@endtemplate}
final class ConversationSummaryMemory<
    LLMInput extends Object,
    LLMOptions extends LanguageModelOptions,
    LLMOutput extends Object> extends BaseChatMemory {
  /// {@macro conversation_summary_memory}
  ConversationSummaryMemory({
    super.chatHistory,
    super.inputKey,
    super.outputKey,
    super.returnMessages = false,
    required this.llm,
    this.prompt = summaryPrompt,
    this.memoryKey = BaseMemory.defaultMemoryKey,
    this.systemPrefix = SystemChatMessage.defaultPrefix,
    this.humanPrefix = HumanChatMessage.defaultPrefix,
    this.aiPrefix = AIChatMessage.defaultPrefix,
    this.functionPrefix = FunctionChatMessage.defaultPrefix,
  });

  /// Language model to use for counting tokens.
  final BaseLanguageModel<LLMInput, LLMOptions, LLMOutput> llm;

  /// [PromptTemplate] to use for summarizing previous conversations.
  /// This currently expect two input variables: `summary` and `new_lines`.
  /// summary is the previous summary and new_lines are the new messages
  /// formated to add.
  final BasePromptTemplate prompt;

  /// Store the summarized chat history in memory.
  /// This does not concatenate, changes every new [ChatMessage] are added.
  String buffer = '';

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

  /// Default summarizer template to use for [ConversationSummaryMemory].
  static const defaultSummarizerTemplate = '''
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

  /// Default summarizer prompt to use for [ConversationSummaryMemory].
  static const summaryPrompt = PromptTemplate(
    inputVariables: {'summary', 'new_lines'},
    template: defaultSummarizerTemplate,
  );

  @override
  Set<String> get memoryKeys => {memoryKey};

  /// Instantiate a [ConversationSummaryMemory] from a list of [ChatMessage]s.
  /// Use this factory method if you want to generate a [ConversationSummaryMemory]
  /// with pre-loaded history and don't have the summari of the messages.
  /// Required a [BaseLanguageModel] to use for summarizing.
  static Future<ConversationSummaryMemory> fromMessages({
    required final BaseLanguageModel llm,
    required final BaseChatMessageHistory chatHistory,
    final String? inputKey,
    final String? outputKey,
    final bool returnMessages = false,
    final PromptTemplate prompt = summaryPrompt,
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
      prompt: prompt,
      memoryKey: memoryKey,
      systemPrefix: systemPrefix,
      humanPrefix: humanPrefix,
      aiPrefix: aiPrefix,
      functionPrefix: functionPrefix,
    );
    final messages = await chatHistory.getChatMessages();
    for (var i = 0; i < messages.length; i += summaryStep) {
      final summary = await memory.summarize(
        messages.sublist(i, i + summaryStep),
        memory.buffer,
      );
      memory.buffer = summary;
    }
    return memory;
  }

  Future<String> summarize(
    final List<ChatMessage> messages,
    final String currentSummary,
  ) async {
    final input = messages.toBufferString(
      systemPrefix: systemPrefix,
      humanPrefix: humanPrefix,
      aiPrefix: aiPrefix,
      functionPrefix: functionPrefix,
    );
    return LLMChain(llm: llm, prompt: prompt).run({
      'new_lines': input,
      'summary': currentSummary,
    });
  }

  @override
  Future<MemoryVariables> loadMemoryVariables([
    final MemoryInputValues values = const {},
  ]) async {
    final messages = <ChatMessage>[];
    if (buffer.isNotEmpty) {
      messages.add(SystemChatMessage(content: buffer));
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
    await super
        .saveContext(inputValues: inputValues, outputValues: outputValues);
    final messages = await chatHistory.getChatMessages();
    buffer = await summarize(
      messages.sublist(messages.length - 2),
      buffer,
    );
  }

  @override
  Future<void> clear() async {
    await super.clear();
    buffer = '';
  }
}
