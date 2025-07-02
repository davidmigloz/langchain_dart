// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  final sampleTexts = [
    'The weather is sunny today', // Similar to next
    'It is a beautiful day outside', // Similar to prev
    'Machine learning is fascinating', // Different topic
  ];

  await embeddingsExample(
    'OpenAI',
    OpenAIEmbeddingsProvider(apiKey: Platform.environment['OPENAI_API_KEY']),
    sampleTexts,
  );

  await embeddingsExample(
    'Google AI',
    GoogleEmbeddingsProvider(apiKey: Platform.environment['GEMINI_API_KEY']),
    sampleTexts,
  );

  exit(0);
}

Future<void> embeddingsExample(
  String providerName,
  EmbeddingsProvider provider,
  List<String> sampleTexts,
) async {
  print('\n=== Testing $providerName ===');

  final singleText = sampleTexts.first;
  print('Text: "$singleText"');

  // Track timing for single embedding
  final singleStart = DateTime.now();
  final singleResult = await provider.embedQuery(singleText);
  final singleDuration = DateTime.now().difference(singleStart);

  print('Dimensions: ${singleResult.embeddings.length}');
  print('First 5 values: ${singleResult.embeddings.take(5).toList()}');
  print('Single embedding time: ${singleDuration.inMilliseconds}ms');
  
  // Show usage data for single embedding
  print('\nSingle Embedding Usage:');
  print('- Result ID: ${singleResult.id}');
  print('- Prompt tokens: ${singleResult.usage.promptTokens ?? 'N/A'}');
  print('- Total tokens: ${singleResult.usage.totalTokens ?? 'N/A'}');
  if (singleResult.usage.promptBillableCharacters != null) {
    print(
      '- Billable characters: ${singleResult.usage.promptBillableCharacters}',
    );
  }
  if (singleResult.metadata.isNotEmpty) {
    print('- Metadata: ${singleResult.metadata}');
  }

  print('\n--- Batch Text Embeddings ---');
  print('Embedding ${sampleTexts.length} texts...');

  // Track timing for batch embeddings
  final batchStart = DateTime.now();
  final batchResult = await provider.embedDocuments(sampleTexts);
  final batchDuration = DateTime.now().difference(batchStart);

  print('Generated ${batchResult.count} embeddings');
  print('Each embedding has ${batchResult.dimensions} dimensions');
  print('Batch embedding time: ${batchDuration.inMilliseconds}ms');
  print(
    'Average time per text: '
    '${(batchDuration.inMilliseconds / sampleTexts.length).toStringAsFixed(1)}'
    'ms',
  );

  // Show batch usage data
  print('\nBatch Embedding Usage:');
  print('- Result ID: ${batchResult.id}');
  print('- Prompt tokens: ${batchResult.usage.promptTokens ?? 'N/A'}');
  print('- Total tokens: ${batchResult.usage.totalTokens ?? 'N/A'}');
  if (batchResult.usage.promptBillableCharacters != null) {
    print(
      '- Billable characters: ${batchResult.usage.promptBillableCharacters}',
    );
  }
  if (batchResult.metadata.isNotEmpty) {
    print('- Metadata: ${batchResult.metadata}');
  }

  // Calculate similarities between texts
  print('\n--- Similarity Analysis ---');
  for (var i = 0; i < sampleTexts.length; i++) {
    for (var j = i + 1; j < sampleTexts.length; j++) {
      final similarity = cosineSimilarity(
        batchResult.embeddings[i],
        batchResult.embeddings[j],
      );
      print(
        'Similarity between texts $i and $j: ${similarity.toStringAsFixed(4)}',
      );
      print('  Text $i: "${sampleTexts[i]}"');
      print('  Text $j: "${sampleTexts[j]}"');
    }
  }

  // Performance metrics summary
  print('\n--- Performance Summary ---');
  print('- Provider: $providerName');
  print('- Vector dimensions: ${batchResult.dimensions}');
  print('- Total texts processed: ${batchResult.count}');
  print('- Total processing time: ${batchDuration.inMilliseconds}ms');
  print(
    '- Throughput: '
    '${(sampleTexts.length / batchDuration.inSeconds).toStringAsFixed(2)} '
    'texts/second',
  );
  print('- Finish reason: ${batchResult.finishReason}');
}
