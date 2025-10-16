import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

class SonnetsService {
  SonnetsService() {
    final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
    if (openAiApiKey == null) {
      stderr.writeln(
        'You need to set your OpenAI key in the '
        'OPENAI_API_KEY environment variable.',
      );
      exit(64);
    }
    _llm = ChatOpenAI(
      apiKey: openAiApiKey,
      defaultOptions: const ChatOpenAIOptions(temperature: 0.9),
    );
  }

  late final ChatOpenAI _llm;
  final _chatPromptTemplate = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'I would like you to assume the role of a poet from the Shakespeare school.',
    ),
    HumanChatMessagePromptTemplate.fromTemplate(
      'Create a sonnet using vivid imagery and rhyme about the following topics: {topics}',
    ),
  ]);

  Future<String> generateSonnet(final List<String> topics) async {
    final prompt = _chatPromptTemplate.formatMessages({'topics': topics});
    final response = await _llm.call(prompt);
    return response.content;
  }
}
