// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';

void main() async {
  final currentDateTimeTool = Tool<String>(
    name: 'current_date_time',
    description: 'Returns the current date and time in ISO 8601 format.',
    onCall: (_) {
      final now = DateTime.now().toIso8601String();
      return now;
    },
  );

  final tools = [currentDateTimeTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda',
  );

  for (final provider in providersWithToolSupport) {
    final agent = Agent.fromProvider(provider, tools: tools);
    await singleToolCallExample(agent, tools);
    await singleToolCallExampleStream(agent, tools);
  }

  exit(0);
}

Future<void> singleToolCallExample(Agent agent, List<Tool> tools) async {
  print('=== ${agent.model} Single-Tool Call ===');

  const userMessage = 'What is the current date and time?';
  final messages = [
    Message(role: MessageRole.system, parts: [
      TextPart('If asked for the current date and time, use the current_date_time tool.'),
    ]),
    Message(role: MessageRole.user, parts: [TextPart(userMessage)]),
  ];

  print('\nUser: $userMessage');
  final result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);
  dumpMessageHistory(messages);
}

Future<void> singleToolCallExampleStream(Agent agent, List<Tool> tools) async {
  print('=== ${agent.model} Single-Tool Call (stream) ===');

  const userMessage = 'What is the current date and time?';
  final messages = [
    Message(role: MessageRole.system, parts: [
      TextPart('If asked for the current date and time, use the current_date_time tool.'),
    ]),
    Message(role: MessageRole.user, parts: [TextPart(userMessage)]),
  ];

  print('\nUser: $userMessage');
  final stream = agent.runStream(messages);
  await for (final chunk in stream) {
    stdout.write(chunk.output);
    messages.addAll(chunk.messages);
  }
  stdout.writeln();
  dumpMessageHistory(messages);
}
