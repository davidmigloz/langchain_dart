// ignore_for_file: avoid_print

import 'dart:io';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';

void main() async {
  // Create an agent with tools
  final agent = Agent('gemini', tools: [weatherTool, temperatureConverterTool]);

  await singleToolCall(agent);
  await multipleToolCalls(agent);
  await multiTurnConversation(agent);
  await streamingComparison(agent);

  agent.dispose();
  exit(0);
}

Future<void> singleToolCall(Agent agent) async {
  print('═══ Single Tool Call ═══');

  final history = <ChatMessage>[];
  const prompt = "What's the weather like in Boston?";
  print('User: $prompt');
  stdout.write('Agent: ');

  final result = await agent.run(prompt, history: history);
  history.addAll(result.messages);
  print(result.output);
  dumpMessageHistory(history);
}

Future<void> multipleToolCalls(Agent agent) async {
  print('═══ Multiple Tool Calls ═══');

  final history = <ChatMessage>[];
  const prompt =
      "What's the weather in New York and what's that temperature in Celsius?";
  print('User: $prompt');
  stdout.write('Agent: ');

  final result = await agent.run(prompt, history: history);
  print(result.output);
  history.addAll(result.messages);
  dumpMessageHistory(history);
}

Future<void> multiTurnConversation(Agent agent) async {
  print('═══ Multi-turn Conversation ═══');

  final history = <ChatMessage>[];

  // Turn 1: Ask about weather
  const prompt1 = "What's the weather in Seattle?";
  print('User: $prompt1');
  stdout.write('Agent: ');

  var result = await agent.run(prompt1, history: history);
  print(result.output);
  history.addAll(result.messages);

  // Turn 2: Follow up with temperature conversion
  const prompt2 = 'Thanks! Can you convert that temperature to Celsius?';
  print('\nUser: $prompt2');
  stdout.write('Agent: ');

  result = await agent.run(prompt2, history: history);
  print(result.output);
  history.addAll(result.messages);

  // Turn 3: Continue conversation
  const prompt3 = 'Perfect! What would 100°F be in Celsius?';
  print('\nUser: $prompt3');
  stdout.write('Agent: ');

  result = await agent.run(prompt3, history: history);
  print(result.output);
  history.addAll(result.messages);

  dumpMessageHistory(history);
}

Future<void> streamingComparison(Agent agent) async {
  print('═══ Streaming vs Non-Streaming ═══');

  const prompt =
      'Check the weather in Miami and convert that temperature to Celsius.';
  print('User: $prompt');

  // Non-streaming
  print('\n--- Non-streaming response ---');
  final result = await agent.run(prompt);
  print('Agent: ${result.output}');

  // Streaming
  print('\n--- Streaming response ---');
  stdout.write('Agent: ');
  await for (final chunk in agent.runStream(prompt)) {
    stdout.write(chunk.output);
    if (chunk.messages.isNotEmpty) dumpMessageHistory(chunk.messages);
  }
  print('\n');
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

    // Simulate weather API call with realistic variation
    final temps = {
      'Boston': '68°F',
      'New York': '71°F',
      'Seattle': '63°F',
      'Miami': '82°F',
    };
    final conditions = {
      'Boston': 'partly cloudy',
      'New York': 'sunny',
      'Seattle': 'overcast',
      'Miami': 'hot and humid',
    };

    final temp = temps[location] ?? '72°F';
    final condition = conditions[location] ?? 'partly cloudy';

    return 'The weather in $location is $temp and $condition.';
  },
);

// Create temperature converter tool
final temperatureConverterTool = Tool<Map<String, dynamic>>(
  name: 'convert_f_to_c',
  description: 'Convert temperature from Fahrenheit to Celsius',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'fahrenheit': {
        'type': 'number',
        'description': 'Temperature in Fahrenheit to convert to Celsius',
      },
    },
    'required': ['fahrenheit'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final fahrenheit = input['fahrenheit'] as num? ?? 70;

    // Convert Fahrenheit to Celsius using formula: (F - 32) * 5/9
    final celsius = (fahrenheit - 32) * 5 / 9;
    final roundedCelsius = celsius.round();

    return '$fahrenheit°F = $roundedCelsius°C';
  },
);
