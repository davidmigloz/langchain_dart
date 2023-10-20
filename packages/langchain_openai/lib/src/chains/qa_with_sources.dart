import 'package:langchain/langchain.dart';

import 'qa_with_structure.dart';

/// {@template openai_qa_with_sources_chain}
/// A chain that answers questions returning a [QAWithSources] object
/// containing the answers with the sources used to answer the question.
///
/// Example:
/// ```dart
/// final llm = ChatOpenAI(
///   apiKey: openaiApiKey,
///   model: 'gpt-3.5-turbo-0613',
///   temperature: 0,
/// );
/// final qaChain = OpenAIQAWithSourcesChain(llm: llm);
/// final docPrompt = PromptTemplate.fromTemplate(
///   'Content: {page_content}\nSource: {source}',
/// );
/// final finalQAChain = StuffDocumentsChain(
///   llmChain: qaChain,
///   documentPrompt: docPrompt,
/// );
/// final retrievalQA = RetrievalQAChain(
///   retriever: vectorStore.asRetriever(),
///   combineDocumentsChain: finalQAChain,
/// );
/// const query = 'What did President Biden say about Russia?';
/// final res = await retrievalQA(query);
/// ```
/// {@endtemplate}
class OpenAIQAWithSourcesChain extends OpenAIQAWithStructureChain {
  /// {@macro openai_qa_with_sources_chain}
  OpenAIQAWithSourcesChain({
    required super.llm,
  }) : super(
          function: const ChatFunction(
            name: 'answer_with_sources',
            description:
                'Answers a question with the sources used to answer it',
            parameters: {
              'type': 'object',
              'properties': {
                'answer': {
                  'type': 'string',
                  'description': 'The answer to the question being asked',
                },
                'sources': {
                  'type': 'array',
                  'items': {'type': 'string'},
                  'description': 'The sources used to answer the question',
                },
              },
              'required': ['answer', 'sources'],
            },
          ),
          outputParser: QAWithSourcesOutputParser(),
        );
}

/// {@template qa_with_sources}
/// The answer to a question with the sources used to answer it.
/// {@endtemplate}
class QAWithSources {
  /// {@macro qa_with_sources}
  const QAWithSources({
    required this.answer,
    required this.sources,
  });

  /// The answer to the question.
  final String answer;

  /// The sources used to answer the question.
  final List<String> sources;

  /// {@macro qa_with_sources}
  factory QAWithSources.fromMap(final Map<String, dynamic> map) {
    return QAWithSources(
      answer: map['answer'] as String,
      sources: List<String>.from(map['sources']),
    );
  }

  @override
  String toString() => answer;
}

/// {@template qa_with_sources_output_parser}
/// A parser that converts the output of the OpenAI API into a [QAWithSources].
/// {@endtemplate}
class QAWithSourcesOutputParser<CallOptions extends BaseLangChainOptions>
    extends BaseOutputFunctionsParser<CallOptions, QAWithSources> {
  /// {@macro qa_with_sources_output_parser}
  QAWithSourcesOutputParser();

  @override
  Future<QAWithSources> parseFunctionCall(
    final AIChatMessageFunctionCall? functionCall,
  ) async {
    return QAWithSources.fromMap(functionCall?.arguments ?? const {});
  }
}
