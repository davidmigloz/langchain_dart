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
  final toolMap = <String, Tool<Object, Object>>{};
  for (final tool in tools) {
    toolMap[tool.name] = tool;
  }

  const userMessage = 'What is the current date and time?';
  final messages = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
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
