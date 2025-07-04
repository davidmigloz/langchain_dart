// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:logging/logging.dart';

import 'lib/dump_chat_history.dart';

Future<void> main() async {
  // Set up logging to see retry activity from RetryHttpClient
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final time = record.time.toIso8601String().split('T')[1].split('.')[0];
    final level = record.level.name.padRight(7);
    final logger = record.loggerName.padRight(15);
    print('[$time] $level [$logger] ${record.message}');
  });
  
  print("🔧 Logging enabled - you'll see retry logs from RetryHttpClient");
  print('');
  final chatModel = ChatProvider.google.createModel();

  final userMessages = [
    "Hi, I'm planning a trip to Paris. Can you help?",
    'What are some must-see attractions?',
  ];

  final messages = [ChatMessage.system('Be concise in your responses.')];

  for (final userMsg in userMessages) {
    messages.add(ChatMessage.humanText(userMsg));
    print('\nUser: $userMsg');

    final stream = chatModel.sendStream(messages);
    final fullResponse = StringBuffer();
    await for (final chunk in stream) {
      stdout.write(chunk.output.content);
      fullResponse.write(chunk.output.content);
    }
    messages.add(ChatMessage.ai(fullResponse.toString()));
    print('');
  }

  dumpChatHistory(messages);
  exit(0);
}
