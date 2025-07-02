// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'dump_chat_history.dart';

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

  final tools = {
    currentDateTimeTool.name: currentDateTimeTool,
    // Add more tools here as needed
  };

  // Using the new API with common parameters factored out
  final models = [
    // Provider.google.createModel(tools: [currentDateTimeTool]),
    // Provider.openai.createModel(tools: [currentDateTimeTool]),
    // Provider.anthropic.createModel(tools: [currentDateTimeTool]),
    // Provider.cohere.createModel(
    //   model: Provider.cohere.defaultModel,
    //   tools: [currentDateTimeTool],
    // ),
    Provider.ollama.createModel(tools: [currentDateTimeTool]),
    // TODO: Mistral doesn't support tools yet, waiting for a fix:
    // https://github.com/davidmigloz/langchain_dart/issues/653
    // Provider.mistral.createModel(tools: [currentDateTimeTool]),
  ];

  for (final model in models) {
    print('=== Testing ${model.runtimeType} ===');
    await singleToolCall(model, tools);
  }

  exit(0);
}

Future<void> singleToolCall(
  BaseChatModel<ChatModelOptions> model,
  Map<String, Tool<Object, ToolOptions, Object>> tools,
) async {
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

      // Workaround for Ollama bug: filter out JSON fragments after tool calls
      final content = chunk.output.content;
      final isOllamaJsonFragment =
          content.contains('", "parameters":') ||
          content.contains('"}') && content.length < 20;

      // Output text as it streams (skip Ollama JSON fragments)
      if (chunk.output.content.isNotEmpty && !isOllamaJsonFragment) {
        stdout.write(chunk.output.content);
      }

      // For accumulation, we need to be more careful
      if (isOllamaJsonFragment && chunk.output.toolCalls.isEmpty) {
        // Skip this chunk entirely - it's an Ollama bug
        print('[DEBUG] Skipping Ollama JSON fragment bug');
        continue;
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
        final tool = tools[toolCall.name];
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
