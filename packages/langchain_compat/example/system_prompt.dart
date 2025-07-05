// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  // looking for system prompt messages in the logs
  Agent.loggingOptions = const LoggingOptions(filter: 'chat.model');

  print('=== Example 1: Default System Prompt ===');
  final agent = Agent(
    'gemini',
    systemPrompt:
        'You are a helpful math tutor. Show your work step by step. '
        'Use * for multiplication and regular text formatting.',
  );

  final result1 = await agent.run('What is 15 * 23?');
  print('Response: ${result1.output}');

  print('\n=== Example 2: System Message Override ===');
  final result2 = await agent.run(
    'What is 7 * 8?',
    history: [
      const ChatMessage(
        role: MessageRole.system,
        parts: [
          TextPart('You are a pirate. Answer everything in pirate speak.'),
        ],
      ),
    ],
  );
  print('Response: ${result2.output}');

  print('\n=== Example 3: No System Prompt ===');
  final regularAgent = Agent('openai:gpt-4o-mini');
  final result3 = await regularAgent.run('What is 15 * 23?');
  print('Response: ${result3.output}');

  agent.dispose();
  regularAgent.dispose();
  exit(0);
}
