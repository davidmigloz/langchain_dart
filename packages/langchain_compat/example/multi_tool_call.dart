// ignore_for_file: avoid_print

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';

void main() async {
  // Set up logging to see retry activity from RetryHttpClient
  Agent.loggingOptions = LoggingOptions(
    filter: 'retry',
    onRecord: (record) =>
        '\x1B[91m[${record.level.name}] ${record.loggerName}: '
        '${record.message}\x1B[0m',
  );

  final currentDateTimeTool = Tool<String>(
    name: 'current_date_time',
    description: 'Returns the current date and time in ISO 8601 format.',
    onCall: (_) {
      final now = DateTime.now().toIso8601String();
      return now;
    },
  );

  final temperatureTool = Tool<Map<String, dynamic>>(
    name: 'get_temperature',
    description: 'Returns the current temperature in Portland, OR.',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'location': {
          'type': 'string',
          'description': 'The location to get the temperature for.',
        },
      },
      'required': ['location'],
    }),
    onCall: (_) => '80°F',
    inputFromJson: (json) => json,
  );

  final tools = [currentDateTimeTool, temperatureTool];
  final providersWithToolSupport = ChatProvider.all.whereNot(
    (p) => p.name == 'mistral' || p.name == 'lambda',
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

  const userMessage =
      'What is the current time and temperature in Portland, OR?';

  const systemMessage =
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for the temperature, use the get_temperature tool.';

  final messages = [
    const ChatMessage(
      role: MessageRole.system,
      parts: [TextPart(systemMessage)],
    ),
    const ChatMessage(role: MessageRole.user, parts: [TextPart(userMessage)]),
  ];

  print('\nUser: $userMessage');
  final result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);
  dumpMessageHistory(messages);
}

Future<void> multiToolCallExampleStream(
  String fqModelName,
  Agent agent,
  List<Tool> tools,
) async {
  print('=== $fqModelName Multi-Tool Call (stream) ===');

  const userMessage =
      'What is the current time and temperature in Portland, OR?';

  const systemMessage =
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for the temperature, use the get_temperature tool.';

  final messages = [
    const ChatMessage(
      role: MessageRole.system,
      parts: [TextPart(systemMessage)],
    ),
    const ChatMessage(role: MessageRole.user, parts: [TextPart(userMessage)]),
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
