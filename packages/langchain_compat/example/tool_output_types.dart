// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/example_tools.dart';

void main() async {
  final tools = [stringTool, intTool, arrayTool, mapTool, nullTool, boolTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda' || p.name == 'groq',
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
