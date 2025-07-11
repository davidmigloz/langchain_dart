// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Multi-modal models that support images
  // Options: anthropic:claude-3-5-sonnet-20241022, openai:gpt-4o,
  //          google:gemini-2.0-flash, together:meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo
  final agent = Agent('anthropic:claude-3-5-sonnet-20241022');

  print('=== Multi-Media Example ===\n');

  // Example 1: Single image analysis
  print('1. Analyzing a single image:');
  await analyzeSingleImage(agent);
  print('');

  // Example 2: Multiple images
  print('2. Analyzing multiple images:');
  await analyzeMultipleImages(agent);
  print('');

  // Example 3: Text file + image
  print('3. Combining text and image:');
  await combineTextAndImage(agent);
  print('');

  // Example 4: Link attachment (if supported)
  print('4. Using link attachments:');
  await useLinkAttachment(agent);
}

Future<void> analyzeSingleImage(Agent agent) async {
  final imageBytes = await File('example/files/fridge.png').readAsBytes();

  // Send to agent with image
  final response = await agent.run(
    'What items can you see in this fridge? List them by category.',
    history: [
      ChatMessage.userParts([
        const TextPart(
          'What items can you see in this fridge? List them by category.',
        ),
        DataPart(mimeType: 'image/png', bytes: imageBytes),
      ]),
    ],
  );

  print(response.output);
}

Future<void> analyzeMultipleImages(Agent agent) async {
  final fridge = await File('example/files/fridge.png').readAsBytes();
  final cupboard = await File('example/files/cupboard.png').readAsBytes();

  // Send to agent with multiple images
  final response = await agent.run(
    'What meal could I make using items from both?',
    history: [
      ChatMessage.userParts([
        const TextPart('I have two images from my kitchen.'),
        const TextPart('\nImage 1 - Fridge:'),
        DataPart(mimeType: 'image/png', bytes: fridge),
        const TextPart('\nImage 2 - Cupboard:'),
        DataPart(mimeType: 'image/png', bytes: cupboard),
        const TextPart('\nWhat meal could I make using items from both?'),
      ]),
    ],
  );

  print(response.output);
}

Future<void> combineTextAndImage(Agent agent) async {
  final bio = await File('example/files/bio.txt').readAsString();
  final fridge = await File('example/files/fridge.png').readAsBytes();

  // Combine text content and image
  final response = await agent.run(
    'What can you tell me about their lifestyle and dietary habits?',
    history: [
      ChatMessage.userParts([
        TextPart("Based on this person's bio:\n\n$bio\n"),
        const TextPart('And looking at their fridge contents:'),
        DataPart(mimeType: 'image/png', bytes: fridge),
        const TextPart(
          '\nWhat can you tell me about their lifestyle and dietary habits?',
        ),
      ]),
    ],
  );

  print(response.output);
}

Future<void> useLinkAttachment(Agent agent) async {
  // Note: Link attachments require real, accessible URLs
  // This is just an example - replace with actual URLs
  try {
    final response = await agent.run(
      'Analyze the article and relate it to the fridge contents',
      history: [
        ChatMessage.userParts([
          const TextPart('Can you analyze this article about healthy eating?'),
          const LinkPart(
            url: 'https://www.example.com/healthy-eating-guide.html',
            mimeType: 'text/html',
          ),
          const TextPart('\nHow does it relate to the items in this fridge?'),
          DataPart(
            mimeType: 'image/png',
            bytes: await File('example/files/fridge.png').readAsBytes(),
          ),
        ]),
      ],
    );
    print(response.output);
  } on Exception catch (e) {
    print('Note: Link attachments require real, accessible URLs.');
    print('Error: $e');
  }
}
