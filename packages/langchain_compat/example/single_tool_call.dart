// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/providers.dart';
import 'package:langchain_compat/src/tools/base.dart';

Future<void> main() async {
  final currentDateTimeTool = Tool.fromFunction<Object, Object>(
    name: 'current_date_time',
    description: 'Returns the current date and time in ISO 8601 format.',
    inputJsonSchema: {'type': 'object', 'properties': {}, 'required': []},
    func: (_) {
      final now = DateTime.now().toIso8601String();
      print('[Tool] Called current_date_time, returning: $now');
      return now;
    },
    getInputFromJson: (_) => '',
  );

  final tools = {
    currentDateTimeTool.name: currentDateTimeTool,
    // Add more tools here as needed
  };

  // TODO: pull out common options and leave the rest to type-specific options
  final chatModel = Provider.openai.createModel(
    options: ChatOpenAIOptions(
      tools: [currentDateTimeTool],
      parallelToolCalls: true,
    ),
  );

  const userMessage = 'What is the current date and time?';
  final history = [
    ChatMessage.system(
      'If asked for the current date and time, use the current_date_time tool.',
    ),
    ChatMessage.humanText(userMessage),
  ];

  print('\nUser: $userMessage');

  var done = false;
  while (!done) {
    final stream = chatModel.stream(PromptValue.chat(history));
    final fullResponse = StringBuffer();
    final toolCalls = <AIChatMessageToolCall>[];
    await for (final chunk in stream) {
      // Output text as it streams
      if (chunk.output.content.isNotEmpty) {
        stdout.write(chunk.output.content);
        fullResponse.write(chunk.output.content);
      }
      // Collect tool calls
      chunk.output.toolCalls.forEach(toolCalls.add);
    }

    // Add the AI message with toolCalls to the history
    history.add(
      ChatMessage.ai(fullResponse.toString(), toolCalls: List.of(toolCalls)),
    );

    if (toolCalls.isEmpty) {
      done = true;
    } else {
      // Call all tools and add results to history
      for (final toolCall in toolCalls) {
        final tool = tools[toolCall.name];
        if (tool == null) {
          print(r'[Tool Error] No tool found for name: ${toolCall.name}');
          continue;
        }
        print(
          '\n[Tool Call] \${toolCall.name} with args: \${toolCall.arguments}',
        );
        final toolResult = await tool.invoke(toolCall.arguments);
        final toolResultString = toolResult is String
            ? toolResult
            : json.encode(toolResult);
        print(r'[Tool Result] $toolResultString');
        history.add(
          ChatMessage.tool(toolCallId: toolCall.id, content: toolResultString),
        );
      }
    }
  }

  _dumpHistory(history);
  exit(0);
}

void _dumpHistory(List<ChatMessage> history) {
  print('--------------------------------');
  print('\n\nHistory:');
  for (final message in history) {
    print('${message.runtimeType}: ${message.contentAsString}');
  }
  print('--------------------------------');
}
