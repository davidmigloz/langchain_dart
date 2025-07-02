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
      print('[Tool] Called current_date_time, returning: $now');
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
    print('=== Testing ${model.runtimeType} ===');
    await singleToolCall(model, tools);
  }

  exit(0);
}

Future<void> singleToolCall(
  ChatModel<ChatModelOptions> model,
  List<Tool<Object, ToolOptions, Object>> tools,
) async {
  final toolMap = <String, Tool<Object, ToolOptions, Object>>{};
  for (final tool in tools) {
    toolMap[tool.name] = tool;
  }

  const userMessage = 'What is the current date and time?';
  final history = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');

  var done = false;
  var chunkNumber = 0;
  while (!done) {
    final stream = model.stream(PromptValue.chat(history));
    var accumulatedMessage = const AIChatMessage(content: '');

    await for (final chunk in stream) {
      chunkNumber++;
      // DEBUG: Print out what we're getting from the stream
      print('\n[DEBUG] Chunk #$chunkNumber:');
      print('  - content: "${chunk.output.content}"');
      print('  - content.length: ${chunk.output.content.length}');
      print('  - toolCalls: ${chunk.output.toolCalls}');

      // Let's also look at the raw chunk to understand better
      print('  - raw output type: ${chunk.output.runtimeType}');
      print('  - raw output: $chunk');

      // Output text as it streams
      if (chunk.output.content.isNotEmpty) {
        stdout.write(chunk.output.content);
      }

      // Accumulate the message chunks (this will merge tool calls by ID)
      accumulatedMessage = accumulatedMessage.concat(chunk.output);
    }
    stdout.writeln();

    // Add the accumulated AI message to the history
    history.add(accumulatedMessage);

    if (accumulatedMessage.toolCalls.isEmpty) {
      done = true;
    } else {
      // Call all tools and add results to history
      for (final toolCall in accumulatedMessage.toolCalls) {
        final tool = toolMap[toolCall.name];
        if (tool == null) {
          print('[Tool Error] No tool found for name: ${toolCall.name}');
          continue;
        }
        final args = toolCall.arguments;
        print('\n[Tool Call] ${toolCall.name} with args: $args');
        final toolResult = await tool.invoke(args);
        final toolResultString = toolResult is String
            ? toolResult
            : json.encode(toolResult);
        print('[Tool Result] $toolResultString');
        history.add(
          ChatMessage.tool(toolCallId: toolCall.id, content: toolResultString),
        );
      }
    }
  }

  dumpChatHistory(history);
}
