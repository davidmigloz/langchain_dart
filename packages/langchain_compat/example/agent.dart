// ignore_for_file: avoid_print

import 'dart:io';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Create an agent with tools
  final agent = Agent(
    'openai:gpt-4o-mini', // Specify provider:model
    tools: [weatherTool, calculatorTool],
    temperature: 0.7,
  );

  print('🤖 Agent Demo: Multi-turn Chat with Tool Calling');
  print('Available tools: get_weather, calculate');
  print('Type your messages or "quit" to exit\n');

  // Keep track of conversation history
  final conversationHistory = <ChatMessage>[];

  while (true) {
    // Get user input
    stdout.write('You: ');
    final userInput = stdin.readLineSync()?.trim();

    if (userInput == null || userInput.isEmpty) {
      continue;
    }

    if (userInput.toLowerCase() == 'quit') {
      break;
    }

    // Add user message to history
    conversationHistory.add(
      HumanChatMessage(content: ChatMessageContent.text(userInput)),
    );

    try {
      print('🤖 Agent: ');

      // Stream the agent's response
      await for (final result in agent.runStream(conversationHistory)) {
        if (result.output.isNotEmpty) {
          stdout.write(result.output);
        }
      }
      print('\n');

      // Get the final response and add it to history
      final finalResult = await agent.run(conversationHistory);
      conversationHistory.add(AIChatMessage(content: finalResult.output));
    } on Exception catch (e) {
      print('❌ Error: $e\n');
    }
  }

  print('👋 Goodbye!');
}

// Create weather tool
final weatherTool = Tool<Map<String, dynamic>>(
  name: 'get_weather',
  description: 'Get the current weather for a given location',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get weather for',
      },
    },
    'required': ['location'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final location = input['location'] as String;

    // Simulate weather API call
    return {
      'location': location,
      'temperature': '72°F',
      'conditions': 'Partly cloudy',
      'humidity': '65%',
      'wind': '8 mph SW',
    };
  },
);

// Create calculator tool
final calculatorTool = Tool<Map<String, dynamic>>(
  name: 'calculate',
  description: 'Perform basic arithmetic calculations',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'expression': {
        'type': 'string',
        'description':
            'The mathematical expression to evaluate (e.g., "2 + 3 * 4")',
      },
    },
    'required': ['expression'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final expression = input['expression'] as String;

    // Simple calculator - in real app you'd use a proper expression parser
    // Replace common operations for simple eval
    final sanitized = expression
        .replaceAll(RegExp(r'[^0-9+\-*/().\s]'), '')
        .trim();

    if (sanitized.isEmpty) {
      return 'Error: Invalid expression';
    }

    // For demo purposes, handle a few simple cases
    if (sanitized.contains('+')) {
      final parts = sanitized.split('+');
      if (parts.length == 2) {
        final a = double.tryParse(parts[0].trim());
        final b = double.tryParse(parts[1].trim());
        if (a != null && b != null) {
          return (a + b).toString();
        }
      }
    }

    if (sanitized.contains('*')) {
      final parts = sanitized.split('*');
      if (parts.length == 2) {
        final a = double.tryParse(parts[0].trim());
        final b = double.tryParse(parts[1].trim());
        if (a != null && b != null) {
          return (a * b).toString();
        }
      }
    }

    return {'result': sanitized};
  },
);
