// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_chat_history.dart';

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

  for (final provider in providersWithToolSupport.where(
    (p) => p.name == 'ollama',
  )) {
    final fqModelName = '${provider.name}:${provider.defaultModelName}';
    final agent = Agent(fqModelName, tools: tools);
    await singleToolCallExample(fqModelName, agent, tools);
    await singleToolCallExampleStream(fqModelName, agent, tools);
  }

  exit(0);
}

Future<void> singleToolCallExample(
  String fqModelName,
  Agent agent,
  List<Tool> tools,
) async {
  print('=== $fqModelName Single-Tool Call ===');

  const userMessage = 'What is the current date and time?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');
  final result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);
  dumpChatHistory(messages);
}

Future<void> singleToolCallExampleStream(
  String fqModelName,
  Agent agent,
  List<Tool> tools,
) async {
  print('=== $fqModelName Single-Tool Call (stream) ===');

  const userMessage = 'What is the current date and time?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');
  final stream = agent.runStream(messages);
  await for (final chunk in stream) {
    stdout.write(chunk.output);
    messages.addAll(chunk.messages);
  }
  stdout.writeln();
  dumpChatHistory(messages);
}
