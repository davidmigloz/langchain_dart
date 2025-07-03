// ignore_for_file: avoid_print

import 'dart:io';

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
  final models = [
    ChatProvider.google.createModel(tools: tools),
    ChatProvider.openai.createModel(tools: tools),
    ChatProvider.anthropic.createModel(tools: tools),
    ChatProvider.cohere.createModel(tools: tools),
    ChatProvider.ollama.createModel(tools: tools),
    // ChatProvider.mistral.createModel(tools: tools), // No tool support yet
  ];

  for (final model in models) {
    await singleToolCallExample(model, tools);
  }

  exit(0);
}

Future<void> singleToolCallExample(
  ChatModel<ChatModelOptions> model,
  List<Tool> tools,
) async {
  print('=== ${model.runtimeType} Single-Tool Call ===');

  const userMessage = 'What is the current date and time?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
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
    stdout.write(chunk.output);

    // Add new messages to the conversation
    messages.addAll(chunk.messages);
  }
  stdout.writeln();

  dumpChatHistory(messages);
}
