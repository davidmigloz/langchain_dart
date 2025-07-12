// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';
import 'lib/example_tools.dart';

void main() async {
  print('=== Single Tool Call Example ===\n');

  final agent = Agent('anthropic', tools: [weatherTool]);
  const prompt = 'What is the weather in Boston?';
  final response = await agent.run(prompt);
  print('User: $prompt');
  print('Assistant: ${response.output}\n');
  dumpMessageHistory(response.messages);

  exit(0);
}
