// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';
import 'lib/example_tools.dart';

void main() async {
  final tools = [currentDateTimeTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda' || p.name == 'groq',
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
  final history = [
    const ChatMessage(
      role: MessageRole.system,
      parts: [
        TextPart(
          'If asked for the current date and time, '
          'use the current_date_time tool.',
        ),
      ],
    ),
  ];

  print('\nUser: $userMessage');
  final result = await agent.run(userMessage, history: history);
  print(result.output);
  final allMessages = [...history, ...result.messages];
  dumpMessageHistory(allMessages);
}

Future<void> singleToolCallExampleStream(Agent agent, List<Tool> tools) async {
  print('=== ${agent.model} Single-Tool Call (stream) ===');

  const userMessage = 'What is the current date and time?';
  final history = [
    const ChatMessage(
      role: MessageRole.system,
      parts: [
        TextPart(
          'If asked for the current date and time, '
          'use the current_date_time tool.',
        ),
      ],
    ),
  ];

  print('\nUser: $userMessage');
  final allMessages = <ChatMessage>[...history];
  final stream = agent.runStream(userMessage, history: history);
  await for (final chunk in stream) {
    stdout.write(chunk.output);
    allMessages.addAll(chunk.messages);
  }
  stdout.writeln();
  dumpMessageHistory(allMessages);
}
