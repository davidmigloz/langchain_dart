// ignore_for_file: avoid_print, unused_element
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';

void main() async {
  // Uncomment the example you want to run:
  await _example1();
  // await _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final llm = Ollama(defaultOptions: const OllamaOptions(model: 'llama3.2'));
  final LLMResult res = await llm.invoke(PromptValue.string('Tell me a joke'));
  print(res);
  llm.close();
}

/// The most frequent use case is to create a chat-bot.
/// This is the most basic one.
Future<void> _example2() async {
  final chatModel = ChatOllama(
    defaultOptions: const ChatOllamaOptions(model: 'llama3.2'),
  );

  try {
    while (true) {
      stdout.write('> ');
      final usrMsg = ChatMessage.humanText(stdin.readLineSync() ?? '');
      final aiMsg = await chatModel([usrMsg]);
      print(aiMsg.content);
    }
  } finally {
    chatModel.close();
  }
}
