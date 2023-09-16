// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _callLLM();
  await _chains();
}

Future<void> _callLLM() async {
  final openAiApiKey = Platform.environment['OPENAI_API_KEY'];
  final llm = OpenAI(apiKey: openAiApiKey);
  final result = await llm('Hello world!');
  print(result);
  // Hello everyone! I'm new here and excited to be part of this community.
}

Future<void> _chains() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate1 = ChatPromptTemplate.fromTemplate(
    'What is the city {person} is from? Only respond with the name of the city.',
  );
  final promptTemplate2 = ChatPromptTemplate.fromTemplate(
    'What country is the city {city} in? Respond in {language}.',
  );

  final model = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser();

  final chain = Runnable.fromMap({
        'city': promptTemplate1 | model | stringOutputParser,
        'language': Runnable.getItemFromMap('language'),
      }) |
      promptTemplate2 |
      model |
      stringOutputParser;

  final res = await chain.invoke({
    'person': 'Rafael Nadal',
    'language': 'Spanish',
  });
  print(res);
  // La ciudad de Manacor se encuentra en España.
}
