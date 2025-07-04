import 'dart:io';
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  print('Debug Tool Calling with Messages\n');

  // Simple direct model test
  final provider = ChatProvider.openai;
  final model = provider.createModel(name: 'gpt-4o-mini');

  final messages = [
    Message(
      role: MessageRole.user,
      parts: [TextPart('What is 2+2? Just the number.')],
    ),
  ];

  print('Sending simple message...');
  await for (final chunk in model.sendStream(messages)) {
    final textParts = chunk.output.parts.whereType<TextPart>();
    for (final part in textParts) {
      stdout.write(part.text);
    }
  }
  
  print('\n\nDone!');
  model.dispose();
}