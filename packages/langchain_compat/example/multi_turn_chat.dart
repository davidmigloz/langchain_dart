// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_chat_history.dart';

Future<void> main() async {
  for (final provider in ChatProvider.all) {
    await multiTurnChat(provider);
  }
  exit(0);
}

Future<void> multiTurnChat(ChatProvider provider) async {
  final model = provider.createModel();
  print('multiTurnChat: ${provider.name}:${model.name}');

  final userMessages = [
    "Hi, I'm planning a trip to Paris. Can you help?",
    'What are some must-see attractions?',
  ];

  final messages = [ChatMessage.system('Be concise in your responses.')];

  for (final userMsg in userMessages) {
    messages.add(ChatMessage.humanText(userMsg));
    print('\nUser: $userMsg');

    final stream = model.sendStream(messages);
    final fullResponse = StringBuffer();
    await for (final chunk in stream) {
      stdout.write(chunk.output.content);
      fullResponse.write(chunk.output.content);
    }
    messages.add(ChatMessage.ai(fullResponse.toString()));
    print('');
  }

  dumpChatHistory(messages);
}
