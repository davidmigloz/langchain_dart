// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _anyscaleInvoke();
  await _anyscaleStreaming();
}

Future<void> _anyscaleInvoke() async {
  final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: anyscaleApiKey,
    baseUrl: 'https://api.endpoints.anyscale.com/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'meta-llama/Llama-2-70b-chat-hf',
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> "I love programming" se traduit en français sous la forme "J'aime passionnément la programmation"
}

Future<void> _anyscaleStreaming() async {
  final anyscaleApiKey = Platform.environment['ANYSCALE_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: anyscaleApiKey,
    baseUrl: 'https://api.endpoints.anyscale.com/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'mistralai/Mixtral-8x7B-Instruct-v0.1',
    ),
  );

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ...
  // 9
}
