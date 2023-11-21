// ignore_for_file: avoid_print, unused_element
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  // Uncomment the example you want to run:
  await _example1();
  // await _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final openai = OpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const OpenAIOptions(temperature: 0.9),
  );
  final result = await openai('Tell me a joke');
  print(result);
}

/// The most frequent use case is to create a chat-bot.
/// This is the most basic one.
Future<void> _example2() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final chat = ChatOpenAI(
    apiKey: openaiApiKey,
    defaultOptions: const ChatOpenAIOptions(
      temperature: 0,
    ),
  );

  while (true) {
    stdout.write('> ');
    final usrMsg = ChatMessage.humanText(stdin.readLineSync() ?? '');
    final aiMsg = await chat([usrMsg]);
    print(aiMsg.content);
  }
}
