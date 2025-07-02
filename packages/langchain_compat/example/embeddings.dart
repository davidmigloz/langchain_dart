// ignore_for_file: avoid_print

import 'dart:io';

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  final sampleTexts = [
    'The weather is sunny today', // Similar to next
    'It is a beautiful day outside', // Similar to prev
    'Machine learning is fascinating', // Different topic
  ];

  await embeddingsTest(
    'OpenAI',
    OpenAIEmbeddingsProvider(apiKey: Platform.environment['OPENAI_API_KEY']),
    sampleTexts,
  );

  await embeddingsTest(
    'Google AI',
    GoogleEmbeddingsProvider(apiKey: Platform.environment['GEMINI_API_KEY']),
    sampleTexts,
  );

  exit(0);
}

Future<void> embeddingsTest(
  String providerName,
  EmbeddingsProvider provider,
  List<String> sampleTexts,
) async {
  print('\n=== Testing $providerName ===');

  final singleText = sampleTexts.first;
  print('Text: "$singleText"');

  final singleEmbedding = await provider.embedQuery(singleText);
  print('Dimensions: ${singleEmbedding.length}');
  print('First 5 values: ${singleEmbedding.take(5).toList()}');

  print('\n--- Batch Text Embeddings ---');
  print('Embedding ${sampleTexts.length} texts...');

  final batchEmbeddings = await provider.embedDocuments(sampleTexts);
  print('Generated ${batchEmbeddings.length} embeddings');
  print('Each embedding has ${batchEmbeddings.first.length} dimensions');

  // Calculate similarities between texts
  print('\n--- Similarity Analysis ---');
  for (var i = 0; i < sampleTexts.length; i++) {
    for (var j = i + 1; j < sampleTexts.length; j++) {
      final similarity = cosineSimilarity(
        batchEmbeddings[i],
        batchEmbeddings[j],
      );
      print(
        'Similarity between texts $i and $j: ${similarity.toStringAsFixed(4)}',
      );
      print('  Text $i: "${sampleTexts[i]}"');
      print('  Text $j: "${sampleTexts[j]}"');
    }
  }
}
