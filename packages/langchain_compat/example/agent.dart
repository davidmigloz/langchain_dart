// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

import 'lib/example_tools.dart';

void main() async {
  print('=== Agent Example ===\n');
  print('This example demonstrates an AI agent that can use multiple tools');
  print('to help answer questions and perform tasks.\n');

  // Create an agent with multiple tools
  final agent = Agent('anthropic:claude-3-5-haiku-latest', tools: exampleTools);

  // Example 1: Weather and temperature conversion
  print('--- Example 1: Weather Query ---');
  print(
    "User: What's the weather in Boston? "
    "If it's in Celsius, convert to Fahrenheit.",
  );

  final response1 = await agent.run(
    "What's the weather in Boston? If it's in Celsius, convert to Fahrenheit.",
  );

  print('Agent: ${response1.output}\n');

  // Example 2: Travel planning
  print('--- Example 2: Travel Planning ---');
  print(
    "User: I'm planning a trip from New York to San Francisco. "
    'Can you tell me the distance and check the weather in both cities?',
  );

  final response2 = await agent.run(
    "I'm planning a trip from New York to San Francisco. "
    'Can you tell me the distance and check the weather in both cities?',
  );

  print('Agent: ${response2.output}\n');

  // Example 3: Multi-step task with streaming
  print('--- Example 3: Investment Research (Streaming) ---');
  print(
    'User: Check the stock prices for AAPL and MSFT, then tell me which one '
    'is performing better today.',
  );
  print('Agent: ');

  await for (final chunk in agent.runStream(
    'Check the stock prices for AAPL and MSFT, then tell me which one '
    'is performing better today.',
  )) {
    stdout.write(chunk.output);
  }
  print('\n');

  // Example 4: Agent with different providers
  print('--- Example 4: Cross-Provider Comparison ---');

  // OpenAI agent
  final openAIAgent = Agent(
    'openai:gpt-4o-mini',
    tools: [currentDateTimeTool, weatherTool],
  );

  print('OpenAI Agent:');
  final openAIResponse = await openAIAgent.run(
    "What time is it and how's the weather in London?",
  );
  print(openAIResponse.output);

  // Google agent
  print('\nGoogle Agent:');
  final googleAgent = Agent(
    'google:gemini-2.0-flash',
    tools: [currentDateTimeTool, weatherTool],
  );

  final googleResponse = await googleAgent.run(
    "What time is it and how's the weather in London?",
  );
  print(googleResponse.output);

  exit(0);
}
