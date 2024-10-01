import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/tools.dart';

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
          tool: const ToolSpec(
            name: 'answer_with_sources',
            description:
                'Answers a question with the sources used to answer it',
            inputJsonSchema: {
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
class QAWithSourcesOutputParser
    extends BaseOutputParser<ChatResult, OutputParserOptions, QAWithSources> {
  /// {@macro qa_with_sources_output_parser}
  QAWithSourcesOutputParser()
      : _toolsOutputParser = ToolsOutputParser(),
        super(
          defaultOptions: const OutputParserOptions(),
        );

  final ToolsOutputParser _toolsOutputParser;

  @override
  Future<QAWithSources> invoke(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) async {
    return _toolsOutputParser.invoke(input, options: options).then(_parse);
  }

  @override
  Stream<QAWithSources> stream(
    final ChatResult input, {
    final OutputParserOptions? options,
  }) {
    return _toolsOutputParser.stream(input, options: options).map(_parse);
  }

  @override
  Stream<QAWithSources> streamFromInputStream(
    final Stream<ChatResult> inputStream, {
    final OutputParserOptions? options,
  }) {
    return _toolsOutputParser
        .streamFromInputStream(inputStream, options: options)
        .map(_parse);
  }

  QAWithSources _parse(final List<ParsedToolCall> input) {
    final arguments = input.firstOrNull?.arguments ?? const {};
    return QAWithSources.fromMap(arguments);
  }
}
