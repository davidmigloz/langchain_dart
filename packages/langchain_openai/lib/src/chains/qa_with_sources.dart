import 'package:langchain/langchain.dart';

import 'qa_with_structure.dart';

/// {@template openai_qa_with_sources_chain}
/// A chain that answers questions returning a [QAWithSources] object
/// containing the answers with the sources used to answer the question.
/// {@endtemplate}
class OpenAIQAWithSourcesChain extends OpenAIQAWithStructureChain {
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
                }
              },
              'required': ['answer', 'sources']
            },
          ),
          outputParser: const QAWithSourcesOutputParser(),
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

  final String answer;
  final List<String> sources;

  /// {@macro qa_with_sources}
  factory QAWithSources.fromMap(final Map<String, dynamic> map) {
    return QAWithSources(
      answer: map['answer'] as String,
      sources: List<String>.from(map['sources']),
    );
  }
}

/// {@template qa_with_sources_output_parser}
/// A parser that converts the output of the OpenAI API into a [QAWithSources].
/// {@endtemplate}
class QAWithSourcesOutputParser
    extends BaseOutputFunctionsParser<QAWithSources> {
  const QAWithSourcesOutputParser();

  @override
  Future<QAWithSources> parseFunctionArguments(
    final Map<String, dynamic> arguments,
  ) async {
    return QAWithSources.fromMap(arguments);
  }
}
