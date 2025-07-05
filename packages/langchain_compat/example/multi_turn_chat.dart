// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';

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

  final messages = [
    const ChatMessage(
      role: MessageRole.system,
      parts: [TextPart('Be concise in your responses.')],
    ),
  ];

  for (final userMsg in userMessages) {
    messages.add(
      ChatMessage(role: MessageRole.user, parts: [TextPart(userMsg)]),
    );
    print('\nUser: $userMsg');

    final stream = model.sendStream(messages);
    final fullResponse = StringBuffer();
    await for (final chunk in stream) {
      final text = chunk.output.parts
          .whereType<TextPart>()
          .map((p) => p.text)
          .join();
      stdout.write(text);
      fullResponse.write(text);
    }
    messages.add(
      ChatMessage(
        role: MessageRole.model,
        parts: [TextPart(fullResponse.toString())],
      ),
    );
    print('');
  }

  dumpMessageHistory(messages);
}
