// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _chatOpenAIStreaming();
}

Future<void> _chatOpenAIStreaming() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers in order without any spaces or commas'
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);
  final chat = ChatOpenAI(apiKey: openaiApiKey);
  const stringOutputParser = StringOutputParser<ChatResult>();

  final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 456
  // 789
}
