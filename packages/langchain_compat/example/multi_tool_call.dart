// ignore_for_file: avoid_print

import 'dart:io';

import 'package:json_schema/json_schema.dart';
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
  final models = [
    ChatProvider.google.createModel(tools: tools),
    ChatProvider.openai.createModel(tools: tools),
    ChatProvider.anthropic.createModel(tools: tools),
    ChatProvider.cohere.createModel(tools: tools),
    ChatProvider.ollama.createModel(tools: tools),
    // ChatProvider.mistral.createModel(tools: tools), // No tool support yet
  ];

  for (final model in models) {
    await multiToolCallExample(model, tools);
  }

  exit(0);
}

Future<void> multiToolCallExample(
  ChatModel<ChatModelOptions> model,
  List<Tool> tools,
) async {
  print('=== ${model.runtimeType} Multi-Tool Call ===');

  const userMessage =
      'What is the current time and temperature in Portland, OR?';

  const systemMessage =
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for the temperature, use the get_temperature tool.';

  final messages = [
    ChatMessage.system(systemMessage),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');

  // invoke
  // final result = await model.invoke(messages);
  // print(result.output);
  // messages.addAll(result.messages);

  // stream
  final stream = model.stream(messages);
  await for (final chunk in stream) {
    // Output text as it streams
    final outputText = chunk.output is String ? chunk.output as String : '';
    stdout.write(outputText);

    // Add new messages to the conversation
    messages.addAll(chunk.messages);
    // if (chunk.messages.isNotEmpty) dumpChatHistory(chunk.messages);
  }
  stdout.writeln();

  dumpChatHistory(messages);
}
