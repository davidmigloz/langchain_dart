// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  // Simple chat with Anthropic
  print('=== Anthropic (Claude) ===');
  var agent = Agent('anthropic:claude-3-5-haiku-latest');
  var response = await agent.run('What is the capital of France?');
  print(response.output);

  print('\n=== OpenAI (GPT) ===');
  agent = Agent('openai:gpt-4o-mini');
  response = await agent.run('What is the capital of Japan?');
  print(response.output);

  print('\n=== Google (Gemini) ===');
  agent = Agent('google:gemini-2.0-flash');
  response = await agent.run('What is the capital of Germany?');
  print(response.output);

  // Streaming example
  print('\n=== Streaming Example (Anthropic) ===');
  agent = Agent('anthropic:claude-3-5-haiku-latest');
  print('Counting to 5:');
  await for (final chunk in agent.runStream(
    'Count from 1 to 5, one number at a time',
  )) {
    stdout.write(chunk.output);
  }
  print('\n');

  exit(0);
}
