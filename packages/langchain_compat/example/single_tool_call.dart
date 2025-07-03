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

  final tools = [currentDateTimeTool];
  final models = [
    // Provider.google.createModel(tools: tools),
    // Provider.openai.createModel(tools: tools),
    // Provider.anthropic.createModel(tools: tools),
    // Provider.cohere.createModel(tools: tools),
    ChatProvider.ollama.createModel(tools: tools),
    // Provider.mistral.createModel(tools: tools),
  ];

  for (final model in models) {
    print('=== Testing [1m${model.runtimeType}[0m ===');
    await singleToolCallExample(model, tools);
  }

  exit(0);
}

Future<void> singleToolCallExample(
  ChatModel<ChatModelOptions> model,
  List<Tool<Object, Object>> tools,
) async {
  const userMessage = 'What is the current date and time?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');

  // With the new API, tool execution and message collection is automatic
  final stream = model.stream(messages);

  await for (final chunk in stream) {
    // Output text as it streams
    final outputText = chunk.output is String ? chunk.output as String : '';
    stdout.write(outputText);
  
    // Add new messages to the conversation
    messages.addAll(chunk.messages);
  }
  stdout.writeln();

  dumpChatHistory(messages);
}
