// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/example_tools.dart';

void main() async {
  print('=== Single Tool Call Example ===\n');

  // Start with OpenAI to test if tools work
  print('--- Weather Tool (OpenAI) ---');
  var agent = Agent('openai:gpt-4o-mini', tools: [weatherTool]);

  print('User: What is the weather in Boston?');
  var response = await agent.run('What is the weather in Boston?');
  print('Assistant: ${response.output}\n');

  // Example with Anthropic
  print('--- Weather Tool (Anthropic) ---');
  agent = Agent('anthropic:claude-3-5-haiku-latest', tools: [weatherTool]);

  print('User: What is the weather in Boston?');
  response = await agent.run('What is the weather in Boston?');
  print('Assistant: ${response.output}\n');

  // Example with OpenAI
  print('--- Temperature Converter Tool (OpenAI) ---');
  agent = Agent('openai:gpt-4o-mini', tools: [fahrenheitToCelsiusTool]);

  print('User: Convert 68 degrees Fahrenheit to Celsius');
  response = await agent.run('Convert 68 degrees Fahrenheit to Celsius');
  print('Assistant: ${response.output}\n');

  // Example with Google
  print('--- Current Date/Time Tool (Google) ---');
  agent = Agent('google:gemini-2.0-flash', tools: [currentDateTimeTool]);

  print('User: What is the current date and time?');
  response = await agent.run('What is the current date and time?');
  print('Assistant: ${response.output}\n');

  // Streaming with tools
  print('--- Streaming Tool Call (Anthropic) ---');
  agent = Agent('anthropic:claude-3-5-haiku-latest', tools: [stockPriceTool]);

  print('User: What is the current price of AAPL stock?');
  print('Assistant: ');
  await for (final chunk in agent.runStream(
    'What is the current price of AAPL stock?',
  )) {
    stdout.write(chunk.output);
  }
  print('\n');

  exit(0);
}
