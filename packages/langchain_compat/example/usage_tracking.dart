// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

Future<void> main() async {
  final chatProviders = <ChatProvider>[
    ChatProvider.openai,
    ChatProvider.anthropic,
    ChatProvider.google,
  ];

  for (final provider in chatProviders) {
    await usageExample(provider);
    await streamingUsageExample(provider);
  }

  final embeddingsModels = <EmbeddingsModel>[
    EmbeddingsProvider.openai.createModel(),
    EmbeddingsProvider.google.createModel(),
  ];

  for (final model in embeddingsModels) {
    await embeddingsUsageExample(model);
  }

  exit(0);
}

Future<void> usageExample(ChatProvider provider) async {
  print('\n=== ${provider.displayName} Usage Tracking ===');

  const testPrompt = 'Explain what machine learning is in 2 sentences.';
  final model = provider.createModel();
  print('Model: ${model.name}');

  // Use sendStream() and collect the final result to get complete usage data
  ChatResult<Message>? finalResult;
  await for (final chunk in model.sendStream([
    Message(role: MessageRole.user, parts: [TextPart(testPrompt)]),
  ])) {
    finalResult = chunk;
  }
  final result = finalResult!;

  print('\nResponse: ${result.outputAsString}');
  print('\nUsage Information:');
  print('- Result ID: ${result.id}');
  print('- Finish Reason: ${result.finishReason}');

  // Access usage data
  final usage = result.usage;
  print('\nToken Usage:');
  print('- Prompt tokens: ${usage.promptTokens ?? 'N/A'}');
  print('- Response tokens: ${usage.responseTokens ?? 'N/A'}');
  print('- Total tokens: ${usage.totalTokens ?? 'N/A'}');

  // Some providers may use character-based billing
  if (usage.promptBillableCharacters != null ||
      usage.responseBillableCharacters != null) {
    print('\nBillable Characters:');
    print('- Prompt chars: ${usage.promptBillableCharacters ?? 'N/A'}');
    print('- Response chars: ${usage.responseBillableCharacters ?? 'N/A'}');
  }

  // Show metadata (provider-specific info)
  if (result.metadata.isNotEmpty) {
    print('\nMetadata:');
    result.metadata.forEach((key, value) {
      print('- $key: $value');
    });
  }

  // Calculate estimated cost (example for OpenAI pricing)
  if (provider == ChatProvider.openai && usage.totalTokens != null) {
    final estimatedCost = _calculateOpenAICost(usage.totalTokens!);
    print('\nEstimated Cost: \$${estimatedCost.toStringAsFixed(6)}');
  }
}

Future<void> streamingUsageExample(ChatProvider provider) async {
  final model = provider.createModel();
  final messages = [Message(role: MessageRole.user, parts: [TextPart('Count from 1 to 10 slowly.')])];

  print('\n=== ${provider.displayName} Streaming Usage Tracking ===');
  print('Streaming response with usage tracking...');

  ChatResult? finalResult;
  var totalTokens = 0;
  var chunkCount = 0;

  await for (final chunk in model.sendStream(messages)) {
    chunkCount++;
    stdout.write(chunk.output.parts.whereType<TextPart>().map((p) => p.text).join());

    // Track usage as we stream
    if (chunk.usage.totalTokens != null) {
      totalTokens = chunk.usage.totalTokens!;
    }

    // Keep the final result for complete usage info
    finalResult = chunk;
  }

  print('\n\nStreaming Summary:');
  print('- Chunks received: $chunkCount');
  print('- Final total tokens: $totalTokens');
  print('- Final finish reason: ${finalResult?.finishReason}');
  print('- Final usage: ${finalResult?.usage}');
}

Future<void> embeddingsUsageExample(EmbeddingsModel model) async {
  print('\n=== ${model.name} Embeddings Usage Tracking ===');

  final sampleTexts = [
    'Machine learning enables computers to learn automatically.',
    'Natural language processing helps computers understand human language.',
    'Computer vision allows machines to interpret visual information.',
  ];

  // Single embedding usage
  final singleResult = await model.embedQuery(sampleTexts.first);
  print('Single Embedding:');
  print('- Result ID: ${singleResult.id}');
  print('- Dimensions: ${singleResult.embeddings.length}');
  print('- Prompt tokens: ${singleResult.usage.promptTokens ?? 'N/A'}');
  print('- Total tokens: ${singleResult.usage.totalTokens ?? 'N/A'}');
  if (singleResult.usage.promptBillableCharacters != null) {
    print(
      '- Billable characters: '
      '${singleResult.usage.promptBillableCharacters}',
    );
  }
  print('- Finish reason: ${singleResult.finishReason}');

  // Batch embeddings usage
  final batchResult = await model.embedDocuments(sampleTexts);
  print('\nBatch Embeddings:');
  print('- Result ID: ${batchResult.id}');
  print('- Embedding count: ${batchResult.count}');
  print('- Dimensions: ${batchResult.dimensions}');
  print('- Prompt tokens: ${batchResult.usage.promptTokens ?? 'N/A'}');
  print('- Total tokens: ${batchResult.usage.totalTokens ?? 'N/A'}');
  if (batchResult.usage.promptBillableCharacters != null) {
    print(
      '- Billable characters: '
      '${batchResult.usage.promptBillableCharacters}',
    );
  }
  print('- Finish reason: ${batchResult.finishReason}');

  // Show metadata
  if (batchResult.metadata.isNotEmpty) {
    print('- Metadata: ${batchResult.metadata}');
  }

  // Calculate estimated cost for OpenAI
  if (model.name.contains('text-embedding-3') &&
      batchResult.usage.totalTokens != null) {
    final embeddingsCost = _calculateOpenAIEmbeddingsCost(
      batchResult.usage.totalTokens!,
    );
    print('- Estimated cost: \$${embeddingsCost.toStringAsFixed(6)}');
  }
}

/// Example cost calculation for OpenAI chat (rates as of 2024)
/// Note: This is just an example - actual rates may vary
double _calculateOpenAICost(int totalTokens) {
  // Simplified calculation assuming GPT-4o-mini pricing
  const pricePerThousandTokens = 0.00015; // $0.15 per 1K tokens
  return (totalTokens / 1000) * pricePerThousandTokens;
}

/// Example cost calculation for OpenAI embeddings (rates as of 2024)
/// Note: This is just an example - actual rates may vary
double _calculateOpenAIEmbeddingsCost(int totalTokens) {
  // Simplified calculation assuming text-embedding-3-small pricing
  const pricePerThousandTokens = 0.00002; // $0.02 per 1K tokens
  return (totalTokens / 1000) * pricePerThousandTokens;
}
