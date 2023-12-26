// ignore_for_file: avoid_print, avoid_redundant_argument_values
import 'dart:convert';
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main(final List<String> arguments) async {
  await _chatOllama();
  await _chatOllamaStreaming();
  await _chatOllamaJsonMode();
  await _chatOllamaMultimodal();
}

Future<void> _chatOllama() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that translates {input_language} to {output_language}.',
    ),
    (ChatMessageType.human, '{text}'),
  ]);

  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama2',
      temperature: 0,
    ),
  );

  final chain = promptTemplate | chatModel | const StringOutputParser();

  final res = await chain.invoke({
    'input_language': 'English',
    'output_language': 'French',
    'text': 'I love programming.',
  });
  print(res);
  // -> 'La traduction est : "J'aime le programming.'
}

Future<void> _chatOllamaStreaming() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (
      ChatMessageType.system,
      'You are a helpful assistant that replies only with numbers '
          'in order without any spaces or commas',
    ),
    (ChatMessageType.human, 'List the numbers from 1 to {max_num}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama2',
      temperature: 0,
    ),
  );
  final chain = promptTemplate.pipe(chat).pipe(const StringOutputParser());

  final stream = chain.stream({'max_num': '9'});
  await stream.forEach(print);
  // 1
  // 2
  // 3
  // ..
  // 9
}

Future<void> _chatOllamaJsonMode() async {
  final promptTemplate = ChatPromptTemplate.fromTemplates(const [
    (ChatMessageType.system, 'Respond using JSON'),
    (ChatMessageType.human, '{question}'),
  ]);
  final chat = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llama2',
      temperature: 0,
      format: OllamaResponseFormat.json,
    ),
  );

  final chain = promptTemplate.pipe(chat);

  final res = await chain.invoke(
    {'question': 'What color is the sky at different times of the day?'},
  );
  print(res.firstOutputAsString);
  // {"morning": {"sky": "pink", "sun": "rise"}, "daytime": {"sky": "blue", "sun": "high"}, "afternoon": ...}
}

Future<void> _chatOllamaMultimodal() async {
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(
      model: 'llava',
      temperature: 0,
    ),
  );
  final prompt = ChatMessage.human(
    ChatMessageContent.multiModal([
      ChatMessageContent.text('What fruit is this?'),
      ChatMessageContent.image(
        data: base64.encode(
          await File('./bin/assets/apple.jpeg').readAsBytes(),
        ),
      ),
    ]),
  );
  final res = await chatModel.invoke(PromptValue.chat([prompt]));
  print(res.firstOutputAsString);
  // -> 'An Apple'
}
