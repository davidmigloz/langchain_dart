// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/example_tools.dart';

void main() async {
  print('=== Multiple Tool Call Example ===\n');

  // Example with multiple independent tools
  print('--- Multiple Independent Tools (OpenAI) ---');
  var agent = Agent(
    'openai:gpt-4o-mini',
    tools: [currentDateTimeTool, weatherTool, stockPriceTool],
  );

  print(
    'User: Tell me the current time, the weather in NYC, '
    'and the price of GOOGL stock.',
  );
  var response = await agent.run(
    'Tell me the current time, the weather in NYC, '
    'and the price of GOOGL stock.',
  );
  print('Assistant: ${response.output}\n');

  // Example with dependent tool calls
  print('--- Dependent Tool Calls (Anthropic) ---');
  agent = Agent(
    'anthropic:claude-3-5-haiku-latest',
    tools: [weatherTool, temperatureConverterTool],
  );

  print(
    'User: What is the temperature in Miami? Then convert it to Fahrenheit.',
  );
  response = await agent.run(
    'What is the temperature in Miami? Then convert it to Fahrenheit.',
  );
  print('Assistant: ${response.output}\n');

  // Example with calculation tools
  print('--- Travel Planning Tools (Google) ---');
  agent = Agent(
    'google:gemini-2.0-flash',
    tools: [distanceCalculatorTool, weatherTool, currentDateTimeTool],
  );

  print('User: I want to travel from New York to Boston...');
  response = await agent.run(
    'I want to travel from New York to Boston. '
    'Tell me the distance, current weather in both cities, '
    'and what time it is now.',
  );
  print('Assistant: ${response.output}\n');

  // Streaming with multiple tools
  print('--- Streaming Multiple Tool Calls (Anthropic) ---');
  agent = Agent(
    'anthropic:claude-3-5-haiku-latest',
    tools: exampleTools, // All tools available
  );

  print(
    'User: Check the weather in Seattle and tell me the distance from Seattle '
    'to Portland.',
  );
  print('Assistant: ');
  await for (final chunk in agent.runStream(
    'Check the weather in Seattle and tell me the distance from Seattle '
    'to Portland.',
  )) {
    stdout.write(chunk.output);
  }
  print('\n');

  exit(0);
}
