import 'package:langchain/langchain.dart';

import '../chat_models/chat_models.dart';

/// {@template openai_qa_with_structure_chain}
/// A chain that answers questions returning the answers with the specified
/// structure ([ChatFunction]).
///
/// OpenAI functions allows for structuring of response output. This is often
/// useful in question answering when you want the answer to be returned with
/// a specific structure (e.g. the answer and the sources used to answer the
/// question).
/// {@endtemplate}
class OpenAIQAWithStructureChain<CallOptions extends BaseLangChainOptions,
        S extends Object>
    extends LLMChain<ChatOpenAI, ChatOpenAIOptions,
        BaseOutputFunctionsParser<CallOptions, S>, BaseChatMemory> {
  /// {@macro openai_qa_with_structure_chain}
  OpenAIQAWithStructureChain({
    required super.llm,
    required final ChatFunction function,
    required BaseOutputFunctionsParser<CallOptions, S> super.outputParser,
    final BasePromptTemplate? prompt,
  }) : super(
          prompt: prompt ?? _getPrompt(),
          llmOptions: ChatOpenAIOptions(
            model: llm.defaultOptions.model,
            functions: [function],
          ),
        );

  static BasePromptTemplate _getPrompt() {
    return ChatPromptTemplate.fromPromptMessages([
      SystemChatMessagePromptTemplate.fromTemplate(
        'You are a world class algorithm to answer questions in a specific format.',
      ),
      HumanChatMessagePromptTemplate.fromTemplate(
        'Answer question using the following context',
      ),
      HumanChatMessagePromptTemplate.fromTemplate('{context}'),
      HumanChatMessagePromptTemplate.fromTemplate('Question: {question}'),
      HumanChatMessagePromptTemplate.fromTemplate(
        'Tips: Make sure to answer in the correct format',
      ),
    ]);
  }
}
