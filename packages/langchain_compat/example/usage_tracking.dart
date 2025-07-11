// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  print('=== Usage Tracking Example ===\n');
  await claudeUsage();
  await openaiUsage();
  await googleUsage();
  await streamingUsage();
  exit(0);
}

Future<void> claudeUsage() async {
  print('--- Anthropic Usage ---');
  final agent = Agent('anthropic');
  final result = await agent.run('Write a haiku about programming');

  print('Response: ${result.output}');
  print('Usage:');
  print('  Prompt tokens: ${result.usage.promptTokens}');
  print('  Response tokens: ${result.usage.responseTokens}');
  print('  Total tokens: ${result.usage.totalTokens}');

  // Calculate approximate cost (example rates)
  const haikuCostPer1k = 0.0008;
  final cost = (result.usage.totalTokens ?? 0) / 1000 * haikuCostPer1k;
  print('  Estimated cost: \$${cost.toStringAsFixed(6)}\n');
}

Future<void> openaiUsage() async {
  print('--- OpenAI Usage ---');
  final agent = Agent('openai');
  final result = await agent.run('Explain recursion in one sentence');

  print('Response: ${result.output}');
  print('Usage:');
  print('  Prompt tokens: ${result.usage.promptTokens}');
  print('  Response tokens: ${result.usage.responseTokens}');
  print('  Total tokens: ${result.usage.totalTokens}');

  // GPT-4o-mini pricing
  const gptPromptCostPer1k = 0.00015;
  const gptResponseCostPer1k = 0.0006;
  final gptCost =
      (result.usage.promptTokens ?? 0) / 1000 * gptPromptCostPer1k +
      (result.usage.responseTokens ?? 0) / 1000 * gptResponseCostPer1k;
  print('  Estimated cost: \$${gptCost.toStringAsFixed(6)}\n');
}

Future<void> googleUsage() async {
  // Track cumulative usage across multiple calls
  print('--- Cumulative Usage (Google) ---');
  final agent = Agent('google');

  var totalPromptTokens = 0;
  var totalResponseTokens = 0;
  var totalCost = 0.0;

  // Gemini pricing (example)
  const geminiCostPer1k = 0.00035;

  final questions = [
    'What is 2+2?',
    'Name a prime number',
    'What color is the sky?',
  ];

  for (final question in questions) {
    final result = await agent.run(question);

    totalPromptTokens += result.usage.promptTokens ?? 0;
    totalResponseTokens += result.usage.responseTokens ?? 0;

    print('Q: $question');
    print('A: ${result.output}');
    print('   Tokens: ${result.usage.totalTokens}');
  }

  final totalTokens = totalPromptTokens + totalResponseTokens;
  totalCost = totalTokens / 1000 * geminiCostPer1k;

  print('\nCumulative usage:');
  print('  Total prompt tokens: $totalPromptTokens');
  print('  Total response tokens: $totalResponseTokens');
  print('  Total tokens: $totalTokens');
  print('  Total estimated cost: \$${totalCost.toStringAsFixed(6)}\n');
}

Future<void> streamingUsage() async {
  // Usage tracking with streaming
  print('--- Streaming Usage (Anthropic) ---');
  final agent = Agent('anthropic');

  print('Generating a story...');
  var streamUsage = const LanguageModelUsage();

  await for (final chunk in agent.runStream(
    'Write a 3-sentence story about a robot',
  )) {
    stdout.write(chunk.output);

    // Usage typically comes in the final chunks
    if (chunk.usage.totalTokens != null && chunk.usage.totalTokens! > 0) {
      streamUsage = chunk.usage;
    }
  }

  print('\n\nStreaming usage:');
  print('  Prompt tokens: ${streamUsage.promptTokens}');
  print('  Response tokens: ${streamUsage.responseTokens}');
  print('  Total tokens: ${streamUsage.totalTokens}');
}
