// ignore_for_file: avoid_print
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Choose your provider and model
  final agent = Agent('anthropic:claude-3-5-sonnet-20241022');

  print('Multi-media Example\n');
  print('This example demonstrates working with text, images, and links.\n');

  // Example 1: Analyze images
  print('=== Example 1: Image Analysis ===');
  await analyzeImages(agent);
  print('');

  // Example 2: Process text file with images
  print('=== Example 2: Text + Images ===');
  await processTextWithImages(agent);
  print('');

  // Example 3: Multi-modal conversation
  print('=== Example 3: Multi-modal Conversation ===');
  await multiModalConversation(agent);
  print('');

  // Example 4: Compare images
  print('=== Example 4: Image Comparison ===');
  await compareImages(agent);
}

Future<void> analyzeImages(Agent agent) async {
  print('Analyzing kitchen images...\n');

  // Load images
  final fridgeImage = await File('example/files/fridge.png').readAsBytes();
  final cupboardImage = await File('example/files/cupboard.png').readAsBytes();

  // Create message with multiple images
  final response = await agent.run(
    'Analyze my kitchen items',
    history: [
      ChatMessage.userParts([
        const TextPart('I have two images from my kitchen. Can you tell me:'),
        const TextPart('1. What items you can see in each image?'),
        const TextPart('2. What meals could I make with these ingredients?'),
        const TextPart('\nFirst image (fridge):'),
        DataPart(mimeType: 'image/png', bytes: fridgeImage),
        const TextPart('\nSecond image (cupboard):'),
        DataPart(mimeType: 'image/png', bytes: cupboardImage),
      ]),
    ],
  );

  print('Assistant: ${response.output}');
}

Future<void> processTextWithImages(Agent agent) async {
  print('Processing biography with kitchen context...\n');

  // Load text file
  final bioText = await File('example/files/bio.txt').readAsString();
  final fridgeImage = await File('example/files/fridge.png').readAsBytes();

  final response = await agent.run(
    'Analyze this person based on their bio and fridge',
    history: [
      ChatMessage.userParts([
        TextPart("Here is someone's bio:\n\n$bioText"),
        const TextPart(
          '\n\nAnd here is an image of their fridge. '
          'What can you infer about this person from both the bio '
          'and their fridge contents?',
        ),
        DataPart(mimeType: 'image/png', bytes: fridgeImage),
      ]),
    ],
  );

  print('Assistant: ${response.output}');
}

Future<void> multiModalConversation(Agent agent) async {
  print('Starting multi-modal conversation...\n');

  final fridgeImage = await File('example/files/fridge.png').readAsBytes();
  final history = <ChatMessage>[];

  // First turn: Show image
  var result = await agent.run(
    'What do you see in this fridge?',
    history: [
      ChatMessage.userParts([
        const TextPart('What do you see in this fridge?'),
        DataPart(mimeType: 'image/png', bytes: fridgeImage),
      ]),
    ],
  );
  print('User: What do you see in this fridge? [with image]');
  print('Assistant: ${result.output}\n');
  history.addAll(result.messages);

  // Second turn: Follow-up question (no image)
  result = await agent.run('Which items are the healthiest?', history: history);
  print('User: Which items are the healthiest?');
  print('Assistant: ${result.output}\n');
  history.addAll(result.messages);

  // Third turn: Another follow-up
  result = await agent.run(
    'What about the items that might expire soon?',
    history: history,
  );
  print('User: What about the items that might expire soon?');
  print('Assistant: ${result.output}');
}

Future<void> compareImages(Agent agent) async {
  print('Comparing fridge and cupboard contents...\n');

  final fridgeImage = await File('example/files/fridge.png').readAsBytes();
  final cupboardImage = await File('example/files/cupboard.png').readAsBytes();

  final response = await agent.run(
    'Compare these two kitchen storage areas',
    history: [
      ChatMessage.userParts([
        const TextPart('Please compare these two images:'),
        const TextPart(
          "1. What's the storage strategy difference between them?",
        ),
        const TextPart('2. What types of food are in each?'),
        const TextPart('3. Any organizational suggestions?'),
        const TextPart('\nFridge:'),
        DataPart(mimeType: 'image/png', bytes: fridgeImage),
        const TextPart('\nCupboard:'),
        DataPart(mimeType: 'image/png', bytes: cupboardImage),
      ]),
    ],
  );

  print('Assistant: ${response.output}');
}
