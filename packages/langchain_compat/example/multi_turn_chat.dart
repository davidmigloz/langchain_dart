// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_chat_history.dart';

Future<void> main() async {
  final chatModel = ChatProvider.google.createModel();

  final userMessages = [
    "Hi, I'm planning a trip to Paris. Can you help?",
    'What are some must-see attractions?',
  ];

  final messages = [ChatMessage.system('Be concise in your responses.')];

  for (final userMsg in userMessages) {
    messages.add(ChatMessage.humanText(userMsg));
    print('\nUser: $userMsg');

    final stream = chatModel.stream(messages);
    final fullResponse = StringBuffer();
    await for (final chunk in stream) {
      stdout.write(chunk.output);
      fullResponse.write(chunk.output);
    }
    messages.add(ChatMessage.ai(fullResponse.toString()));
    print('');
  }

  dumpChatHistory(messages);
  exit(0);
}
