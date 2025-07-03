// ignore_for_file: avoid_print

import 'dart:convert';
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
  final toolMap = <String, Tool<Object, Object>>{};
  for (final tool in tools) {
    toolMap[tool.name] = tool;
  }

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

  var done = false;
  while (!done) {
    final stream = model.stream(messages);
    var accumulatedMessage = const AIChatMessage(content: '');

    await for (final chunk in stream) {
      // Output text as it streams
      if (chunk.output.content.isNotEmpty) {
        stdout.write(chunk.output.content);
      }
      // Accumulate the message chunks (this will merge tool calls by ID)
      accumulatedMessage = accumulatedMessage.concat(chunk.output);
    }
    stdout.writeln();

    // Add the accumulated AI message to the history
    messages.add(accumulatedMessage);

    if (accumulatedMessage.toolCalls.isEmpty) {
      done = true;
    } else {
      // Call all tools and add results to history
      for (final toolCall in accumulatedMessage.toolCalls) {
        final tool = toolMap[toolCall.name];
        if (tool == null) {
          continue;
        }
        final args = toolCall.arguments;
        final toolResult = await tool.invoke(args);
        final toolResultString = toolResult is String
            ? toolResult
            : json.encode(toolResult);
        messages.add(
          ChatMessage.tool(toolCallId: toolCall.id, content: toolResultString),
        );
      }
    }
  }

  dumpChatHistory(messages);
}
