// ignore_for_file: avoid_print, unused_element
import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';

void main() async {
  // Uncomment the example you want to run:
  await _example1();
  // await _example2();
}

/// The most basic building block of LangChain is calling an LLM on some input.
Future<void> _example1() async {
  final mistralAiApiKey = Platform.environment['MISTRAL_API_KEY'];
  final chatModel = ChatMistralAI(
    apiKey: mistralAiApiKey,
    defaultOptions: const ChatMistralAIOptions(temperature: 0.9),
  );
  final ChatResult res = await chatModel.invoke(
    PromptValue.string('Tell me a joke'),
  );
  print(res);
  chatModel.close();
}

/// The most frequent use case is to create a chat-bot.
/// This is the most basic one.
Future<void> _example2() async {
  final mistralAiApiKey = Platform.environment['MISTRAL_API_KEY'];
  final chatModel = ChatMistralAI(
    apiKey: mistralAiApiKey,
    defaultOptions: const ChatMistralAIOptions(temperature: 0),
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
