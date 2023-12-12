// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';

void main(final List<String> arguments) async {
  final apiKey = Platform.environment['MISTRAL_API_KEY']!;
  await _chatMistralAI(apiKey);
  await _chatMistralAIStreaming(apiKey);
}

Future<void> _chatMistralAI(final String apiKey) async {
  final chatModel = ChatMistralAI(
    apiKey: apiKey,
    defaultOptions: const ChatMistralAIOptions(
      model: 'mistral-small',
      temperature: 0,
    ),
  );

  const template =
      'You are a helpful assistant that translates {input_language} to {output_language}.';
  final systemMessagePrompt =
      SystemChatMessagePromptTemplate.fromTemplate(template);
  const humanTemplate = '{text}';
  final humanMessagePrompt =
      HumanChatMessagePromptTemplate.fromTemplate(humanTemplate);
  final chatPrompt = ChatPromptTemplate.fromPromptMessages(
    [systemMessagePrompt, humanMessagePrompt],
  );

  final chain = chatPrompt | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'J'aime la programmation.'
}

Future<void> _chatMistralAIStreaming(final String apiKey) async {
  final promptTemplate = ChatPromptTemplate.fromPromptMessages([
    SystemChatMessagePromptTemplate.fromTemplate(
      'You are a helpful assistant that replies only with numbers '
      'in order without any spaces or commas',
    ),
    HumanChatMessagePromptTemplate.fromTemplate(
      'List the numbers from 1 to {max_num}',
    ),
  ]);
  final chat = ChatMistralAI(
    apiKey: apiKey,
    defaultOptions: const ChatMistralAIOptions(
      model: 'mistral-medium',
      temperature: 0,
    ),
  );
  const stringOutputParser = StringOutputParser<AIChatMessage>();

  final chain = promptTemplate.pipe(chat).pipe(stringOutputParser);

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 12
  // 345
  // 67
  // 89
}
