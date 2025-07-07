// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Tool that returns a string
  final stringTool = Tool<Map<String, dynamic>>(
    name: 'get_greeting',
    description: 'Returns a greeting message',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'name': {'type': 'string'},
      },
      'required': ['name'],
    }),
    onCall: (input) => 'Hello, ${input['name']}!',
    inputFromJson: (json) => json,
  );

  // Tool that returns an int
  final intTool = Tool<Map<String, dynamic>>(
    name: 'calculate_age',
    description: 'Calculates age from birth year',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'birth_year': {'type': 'integer'},
      },
      'required': ['birth_year'],
    }),
    onCall: (input) => 2025 - (input['birth_year'] as int),
    inputFromJson: (json) => json,
  );

  // Tool that returns an array
  final arrayTool = Tool<Map<String, dynamic>>(
    name: 'list_colors',
    description: 'Returns a list of favorite colors',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'count': {'type': 'integer'},
      },
      'required': ['count'],
    }),
    onCall: (input) {
      final count = input['count'] as int;
      return List.generate(
        count,
        (i) => ['red', 'blue', 'green', 'yellow'][i % 4],
      );
    },
    inputFromJson: (json) => json,
  );

  // Tool that returns a map
  final mapTool = Tool<Map<String, dynamic>>(
    name: 'get_weather',
    description: 'Returns weather information',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'city': {'type': 'string'},
      },
      'required': ['city'],
    }),
    onCall: (input) => {
      'city': input['city'],
      'temperature': 72,
      'conditions': 'sunny',
      'humidity': 45,
      'forecast': ['sunny', 'partly cloudy', 'rain'],
    },
    inputFromJson: (json) => json,
  );

  // Tool that returns null (edge case)
  final nullTool = Tool<Map<String, dynamic>>(
    name: 'check_availability',
    description: 'Checks if something is available',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'item': {'type': 'string'},
      },
      'required': ['item'],
    }),
    onCall: (input) => input['item'] == 'unicorn' ? null : 'available',
    inputFromJson: (json) => json,
  );

  // Tool that returns a boolean
  final boolTool = Tool<Map<String, dynamic>>(
    name: 'is_prime',
    description: 'Checks if a number is prime',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'number': {'type': 'integer'},
      },
      'required': ['number'],
    }),
    onCall: (input) {
      final n = input['number'] as int;
      if (n <= 1) return false;
      for (var i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
      }
      return true;
    },
    inputFromJson: (json) => json,
  );

  final tools = [stringTool, intTool, arrayTool, mapTool, nullTool, boolTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda',
  );

  for (final provider in providersWithToolSupport) {
    final agent = Agent.fromProvider(provider, tools: tools);
    await testToolOutputTypes(agent);
    await testToolOutputTypesStream(agent);
  }

  exit(0);
}

Future<void> testToolOutputTypes(Agent agent) async {
  print('=== ${agent.model} Tool Output Types Test ===');

  // Test prompt that will trigger all tools
  const userMessage = '''
Please help me test all the tools:
1. Greet someone named Alice
2. Calculate the age of someone born in 1990
3. List 3 favorite colors
4. Get the weather in Portland
5. Check if a unicorn is available
6. Check if 17 is a prime number
''';

  print('\nUser: $userMessage');
  final result = await agent.run(userMessage);
  print(result.output);

  // Display tool results
  print('\nTool Results:');
  for (final message in result.messages) {
    if (message.role == MessageRole.user) {
      for (final part in message.parts) {
        if (part is ToolPart && part.kind == ToolPartKind.result) {
          print(
            '  ${part.name} (${part.id}): ${json.encode(part.result)} '
            '[${part.result.runtimeType}]',
          );
        }
      }
    }
  }
  print('');
}

Future<void> testToolOutputTypesStream(Agent agent) async {
  print('=== ${agent.model} Tool Output Types Test (stream) ===');

  // Test with individual tool calls for streaming
  const testCases = [
    ('String return', 'Greet Bob'),
    ('Int return', 'Calculate the age of someone born in 2000'),
    ('Array return', 'List 2 favorite colors'),
    ('Map return', 'Get the weather in Seattle'),
    ('Null return', 'Check if a unicorn is available'),
    ('Bool return', 'Check if 7 is prime'),
  ];

  for (final (testName, userMessage) in testCases) {
    print('\nTest: $testName');
    print('User: $userMessage');

    final stream = agent.runStream(userMessage);
    final messages = <ChatMessage>[];
    await for (final chunk in stream) {
      stdout.write(chunk.output);
      messages.addAll(chunk.messages);
    }
    stdout.writeln();

    // Display tool result
    for (final message in messages) {
      if (message.role == MessageRole.user) {
        for (final part in message.parts) {
          if (part is ToolPart && part.kind == ToolPartKind.result) {
            print(
              'Tool result: ${json.encode(part.result)} '
              '[${part.result.runtimeType}]',
            );
          }
        }
      }
    }
  }
  print('');
}
