// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';
import 'lib/example_tools.dart';

void main() async {
  final tools = [currentDateTimeTool, temperatureTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda' || p.name == 'groq',
  );

  for (final provider in providersWithToolSupport) {
    final model = provider.createModel();
    final fqModelName = '${provider.name}:${model.name}';
    final agent = Agent(fqModelName, tools: tools);
    await multiToolCallExample(fqModelName, agent, tools);
    await multiToolCallExampleStream(fqModelName, agent, tools);
  }

  exit(0);
}

Future<void> multiToolCallExample(
  String fqModelName,
  Agent agent,
  List<Tool> tools,
) async {
  print('=== $fqModelName Multi-Tool Call ===');

  const systemPrompt =
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for the temperature, use the get_temperature tool.';

  final history = [ChatMessage.system(systemPrompt)];

  const userMessage =
      'What is the current time and temperature in Portland, OR?';

  print('\nUser: $userMessage');
  final result = await agent.run(userMessage, history: history);
  print(result.output);
  history.addAll(result.messages);
  dumpMessageHistory(history);
}

Future<void> multiToolCallExampleStream(
  String fqModelName,
  Agent agent,
  List<Tool> tools,
) async {
  print('=== $fqModelName Multi-Tool Call (stream) ===');

  const systemMessage =
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for the temperature, use the get_temperature tool.';

  final history = [ChatMessage.system(systemMessage)];

  const userMessage =
      'What is the current time and temperature in Portland, OR?';

  print('\nUser: $userMessage');
  final stream = agent.runStream(userMessage, history: history);
  await for (final chunk in stream) {
    stdout.write(chunk.output);
    history.addAll(chunk.messages);
  }
  stdout.writeln();
  dumpMessageHistory(history);
}
