// ignore_for_file: avoid_print, unused_element, unused_import
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

void main() async {
  // Uncomment the example you want to run:
  _example1();
  // _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final openai = OpenAI(apiKey: openaiApiKey, temperature: 0.9);
  const prompt = 'What would be a good company name '
      'for a company that makes colorful socks?';
  final result = await openai(prompt: prompt);
  print(result);
}

/// The most frequent use case is to create a chat-bot. This is the most
/// basic one.
Future<void> _example2() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final chat = OpenAIChat(apiKey: openaiApiKey, temperature: 0);

  while (true) {
    stdout.write('> ');
    final usrMsg = stdin.readLineSync() ?? '';
    final aiMsg = await chat(prompt: usrMsg);
    print(aiMsg);
  }
}
