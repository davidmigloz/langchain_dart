// ignore_for_file: avoid_redundant_argument_values
import '../memory/base.dart';
import '../memory/buffer.dart';
import '../model_io/prompts/prompts.dart';
import 'llm_chain.dart';

const _defaultTemplate = '''
The following is a friendly conversation between a human and an AI. The AI is 
talkative and provides lots of specific details from its context. If the AI 
does not know the answer to a question, it truthfully says it does not know.

Current conversation:
{history}
Human: {input}
AI:''';

const _memoryKey = 'history';

/// {@template conversation_chain}
/// Chain that carries on a conversation, loading context from memory
/// and calling an LLM with it.
///
/// By default, the [ConversationChain] has a simple type of memory that
/// remembers all previous inputs/outputs and adds them to the context that
/// is passed to the LLM (see [ConversationBufferMemory]).
///
/// Example:
/// ```dart
/// final chain = ConversationChain(llm: OpenAI(apiKey: '...'));
/// final res = await chain.run('Hello world!');
/// ```
///
/// - [prompt] is the prompt that will be used to call the LLM.
/// - [llm] is the LLM that will be called.
/// - [outputParser] is the parser that will be used to parse the output.
/// - [memory] is the memory that will be used to store and load context.
/// - [inputKey] is the key of the value that needs to be passed to the chain.
///   (e.g. if the prompt template has two input variables ('foo' and 'bar') and
///   'foo' is loaded from memory, then 'bar' is the input key).
/// - [outputKey] is the key in the returned map that contains the output of the
///   chain execution.
/// {@endtemplate}
class ConversationChain extends LLMChain {
  /// {@macro conversation_chain}
  ConversationChain({
    super.prompt = const PromptTemplate(
      template: _defaultTemplate,
      inputVariables: {_memoryKey, 'input'},
    ),
    required super.llm,
    super.outputParser,
    final BaseMemory? memory,
    this.inputKey = 'input',
    super.outputKey = 'response',
  }) : super(memory: memory ?? ConversationBufferMemory(memoryKey: _memoryKey));

  /// The key of the input value.
  final String inputKey;

  @override
  Set<String> get inputKeys => {inputKey};
}
