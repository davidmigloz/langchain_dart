// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/providers.dart';
import 'package:langchain_compat/src/tools/base.dart';

Future<void> main() async {
  // Helper method to decode JSON arguments after accumulation
  Map<String, dynamic> decodeArguments(String argumentsRaw) {
    final trimmed = argumentsRaw.trim();
    if (trimmed.isEmpty) {
      return <String, dynamic>{};
    }
    try {
      return json.decode(trimmed) as Map<String, dynamic>;
    } catch (e) {
      print(
        '[Warning] Failed to decode tool arguments: "$argumentsRaw", error: $e',
      );
      return <String, dynamic>{};
    }
  }

  final currentDateTimeTool = Tool.fromFunction<Object, String>(
    name: 'current_date_time',
    description: 'Returns the current date and time in ISO 8601 format.',
    inputJsonSchema: <String, dynamic>{
      'type': 'object',
      'properties': <String, dynamic>{},
      'required': <String>[],
    },
    func: (_) {
      final now = DateTime.now().toIso8601String();
      print('[Tool] Called current_date_time, returning: $now');
      return now;
    },
    getInputFromJson: (_) => <String, dynamic>{},
  );

  final tools = {
    currentDateTimeTool.name: currentDateTimeTool,
    // Add more tools here as needed
  };

  // TODO: pull out common options and leave the rest to type-specific options
  // final chatModel = Provider.google.createModel(
  //   options: ChatGoogleGenerativeAIOptions(tools: [currentDateTimeTool]),
  // );
  final chatModel = Provider.openai.createModel(
    options: ChatOpenAIOptions(
      model: 'gpt-4o',
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
    var accumulatedMessage = const AIChatMessage(content: '');

    await for (final chunk in stream) {
      // Output text as it streams
      if (chunk.output.content.isNotEmpty) {
        stdout.write(chunk.output.content);
      }
      // Accumulate the message chunks (this will merge tool calls by ID)
      accumulatedMessage = accumulatedMessage.concat(chunk.output);
    }

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
        // Decode the final accumulated arguments
        final args = decodeArguments(toolCall.argumentsRaw);
        print('\n[Tool Call] \\${toolCall.name} with args: \\$args');
        final toolResult = await tool.invoke(args);
        final toolResultString = toolResult is String
            ? toolResult
            : json.encode(toolResult);
        print('[Tool Result] \\$toolResultString');
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
