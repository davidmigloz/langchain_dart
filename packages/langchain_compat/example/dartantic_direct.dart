import 'dart:io';
import 'package:langchain_compat/src/chat/chat_providers/chat_providers.dart';
import 'package:langchain_compat/src/chat/chat_models/message.dart';

void main() async {
  print('Dartantic Message Types - Direct Usage Example\n');

  // Check for API key
  final apiKey = Platform.environment['OPENAI_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    print('Please set the OPENAI_API_KEY environment variable');
    exit(1);
  }

  // Create messages using the new Dartantic Message type
  final messages = [
    Message(
      role: MessageRole.system,
      parts: [TextPart('You are a helpful assistant.')],
    ),
    Message(
      role: MessageRole.user,
      parts: [TextPart('What is the capital of France? Answer in one sentence.')],
    ),
  ];

  // Create a model directly 
  final provider = ChatProvider.openai;
  final model = provider.createModel(name: 'gpt-4o-mini');

  print('Sending messages to model...\n');

  // Stream the response
  final messageBuffer = StringBuffer();
  await for (final chunk in model.sendStream(messages)) {
    // Extract text from the message parts
    final textParts = chunk.output.parts.whereType<TextPart>();
    for (final part in textParts) {
      messageBuffer.write(part.text);
      stdout.write(part.text); // Stream output without newline
    }
  }

  print('\n\nComplete response:');
  print(messageBuffer.toString());

  // Show the Message structure
  print('\nMessage structure of the response:');
  print('Role: ${messages.last.role}');
  print('Parts: ${messages.last.parts.length}');
  for (final part in messages.last.parts) {
    if (part is TextPart) {
      print('- TextPart: "${part.text}"');
    }
  }

  // Dispose the model
  model.dispose();
}