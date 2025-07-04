import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  print('Dartantic Message Types Example\n');

  // Create messages using the new Dartantic Message type
  final messages = [
    Message(
      role: MessageRole.system,
      parts: [TextPart('You are a helpful assistant.')],
    ),
    Message(
      role: MessageRole.user,
      parts: [TextPart('What is the capital of France?')],
    ),
  ];

  // Create a model (OpenAI in this case)
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
      print(part.text);
    }
  }

  print('\n\nComplete response:');
  print(messageBuffer.toString());

  // Dispose the model
  model.dispose();
}