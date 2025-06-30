// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/providers.dart';

Future<void> main() async {
  final chatModel = Provider.google.createModel();

  final userMessages = [
    "Hi, I'm planning a trip to Paris. Can you help?",
    'What are some must-see attractions?',
  ];

  final history = [ChatMessage.system('Be concise in your responses.')];

  for (final userMsg in userMessages) {
    history.add(ChatMessage.humanText(userMsg));
    print('\nUser: $userMsg');

    final stream = chatModel.stream(PromptValue.chat(history));
    final fullResponse = StringBuffer();
    await for (final chunk in stream) {
      final content = chunk.output.content;
      stdout.write(content);
      fullResponse.write(content);
    }
    history.add(ChatMessage.ai(fullResponse.toString()));
    print('');
  }

  _dumpHistory(history);
}

void _dumpHistory(List<ChatMessage> history) {
  print('--------------------------------');
  print('\n\nHistory:');
  for (final message in history) {
    print('${message.runtimeType}: ${message.contentAsString}');
  }
  print('--------------------------------');
}
