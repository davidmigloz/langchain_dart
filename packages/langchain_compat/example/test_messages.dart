import 'dart:io';

// Import only what we need, avoiding Agent
import 'package:langchain_compat/src/chat/chat_providers/chat_providers.dart';
import 'package:langchain_compat/src/chat/chat_models/message.dart';

void main() async {
  print('Testing Dartantic Message Types\n');

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
      parts: [TextPart('What is 2+2? Answer with just the number.')],
    ),
  ];

  print('Messages created successfully!');
  print('System message: ${(messages[0].parts[0] as TextPart).text}');
  print('User message: ${(messages[1].parts[0] as TextPart).text}');

  // Create a model
  final provider = ChatProvider.openai;
  final model = provider.createModel(name: 'gpt-4o-mini');

  print('\nSending messages to model...\n');

  // Stream the response
  try {
    await for (final chunk in model.sendStream(messages)) {
      // Extract text from the message parts
      final textParts = chunk.output.parts.whereType<TextPart>();
      for (final part in textParts) {
        stdout.write(part.text);
      }
    }
    print('\n\nSuccess! The new Message API is working.');
  } catch (e) {
    print('Error: $e');
  } finally {
    model.dispose();
  }
}