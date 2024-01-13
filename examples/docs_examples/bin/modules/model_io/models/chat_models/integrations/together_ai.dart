// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main(final List<String> arguments) async {
  await _togetherAiInvoke();
  await _togetherAiStreaming();
}

Future<void> _togetherAiInvoke() async {
  final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: togetherAiApiKey,
    baseUrl: 'https://api.together.xyz/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'mistralai/Mistral-7B-Instruct-v0.2',
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'aime programmer'
}

Future<void> _togetherAiStreaming() async {
  final togetherAiApiKey = Platform.environment['TOGETHER_AI_API_KEY'];

  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);

  final chatModel = ChatOpenAI(
    apiKey: togetherAiApiKey,
    baseUrl: 'https://api.together.xyz/v1',
    defaultOptions: const ChatOpenAIOptions(
      model: 'mistralai/Mistral-7B-Instruct-v0.2',
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
