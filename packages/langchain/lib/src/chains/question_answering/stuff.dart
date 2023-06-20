import '../../language_models/base.dart';
import '../../prompts/base_prompt.dart';
import '../../prompts/prompts.dart';
import '../combine_documents/stuff.dart';
import '../llm_chain.dart';

const _promptTemplate = '''
Use the following pieces of context to answer the question at the end. If you don't know the answer, just say that you don't know, don't try to make up an answer.

{context}

Question: {question}
Helpful Answer:
''';

const _systemTemplate = '''
Use the following pieces of context to answer the users question. 
If you don't know the answer, just say that you don't know, don't try to make up an answer.
----------------
{context}
''';

const _messages = [
  SystemChatMessagePromptTemplate(
    prompt: PromptTemplate(
      template: _systemTemplate,
      inputVariables: {'context'},
    ),
  ),
  HumanChatMessagePromptTemplate(
    prompt: PromptTemplate(
      template: '{question}',
      inputVariables: {'question'},
    ),
  ),
];

const _prompt = PromptTemplate(
  template: _promptTemplate,
  inputVariables: {'context', 'question'},
);

const _chatPrompt = ChatPromptTemplate(
  promptMessages: _messages,
  inputVariables: {'context', 'question'},
);

final _promptSelector = ConditionalPromptSelector(
  defaultPrompt: _prompt,
  conditionals: [PromptCondition.isChatModel(_chatPrompt)],
);

/// {@template stuff_documents_qa_chain}
/// Stuffs documents with a question answering prompt.
/// {@endtemplate}
class StuffDocumentsQAChain extends StuffDocumentsChain {
  /// {@macro stuff_documents_qa_chain}
  StuffDocumentsQAChain({
    required final BaseLanguageModel llm,
    final BasePromptTemplate? prompt,
  }) : super(
          llmChain: LLMChain(
            prompt: prompt ?? _promptSelector.getPrompt(llm),
            llm: llm,
          ),
        );
}
