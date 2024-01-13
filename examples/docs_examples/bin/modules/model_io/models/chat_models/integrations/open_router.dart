// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _openRouter();
  await _openRouterStreaming();
}

Future<void> _openRouter() async {
  final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: openRouterApiKey,
    baseUrl: 'https://openrouter.ai/api/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'mistralai/mistral-small',
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'aime la programmation.'
}

Future<void> _openRouterStreaming() async {
  final openRouterApiKey = Platform.environment['OPEN_ROUTER_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: openRouterApiKey,
    baseUrl: 'https://openrouter.ai/api/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'mistralai/mistral-small',
    ),
  );

  final chain = promptTemplate.pipe(chatModel).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 123
  // 456789
}
