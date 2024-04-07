// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _openAIStreaming();
}

Future<void> _openAIStreaming() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final promptTemplate = PromptTemplate.fromTemplate(
    'List the numbers from 1 to {max_num} in order without any spaces or commas',
  );
  final llm = OpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser<LLMResult>();
  final chain = promptTemplate | llm | stringOutputParser;

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 45
  // 67
  // 89
}
