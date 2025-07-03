// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_chat_history.dart';

void main() async {
  final currentDateTimeTool = Tool.fromFunction<Object, String>(
    name: 'current_date_time',
    description: 'Returns the current date and time in ISO 8601 format.',
    func: (_) {
      final now = DateTime.now().toIso8601String();
      return now;
    },
  );

  final temperatureTool = Tool.fromFunction<Object, String>(
    name: 'get_temperature',
    description: 'Returns the current temperature in Portland, OR.',
    func: (_) => "It's a balmy 80°F in Portland, OR right now!",
  );

  final tools = [currentDateTimeTool, temperatureTool];
  final models = [
    // ChatProvider.openai.createModel(tools: tools),
    // ChatProvider.google.createModel(tools: tools),
    // ChatProvider.anthropic.createModel(tools: tools),
    // ChatProvider.cohere.createModel(tools: tools),
    ChatProvider.ollama.createModel(tools: tools),
    // ChatProvider.mistral.createModel(tools: tools),
  ];

  for (final model in models) {
    print('=== Testing \u001b[1m${model.runtimeType}\u001b[0m ===');
    await multiToolCallExample(model, tools);
  }

  exit(0);
}

Future<void> multiToolCallExample(
  ChatModel<ChatModelOptions> model,
  List<Tool<Object, Object>> tools,
) async {

  const userMessage =
      'What is the current date and time, and what is the temperature in '
      'Portland, OR?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool. '
      'If asked for temperature in Portland, OR, use the get_temperature tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');

  // With the new API, tool execution and message collection is automatic
  final stream = model.stream(messages);
  
  await for (final chunk in stream) {
    // Output text as it streams
    final outputText = chunk.output is String ? chunk.output as String : '';
    if (outputText.isNotEmpty) {
      stdout.write(outputText);
    }
    // Add new messages to the conversation
    messages.addAll(chunk.messages);
  }
  stdout.writeln();

  dumpChatHistory(messages);
}
