// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/embeddings/base.dart';
import 'package:langchain_compat/src/embeddings/google_ai/google_ai_embeddings.dart';
import 'package:langchain_compat/src/embeddings/openai.dart';

void main() async {
  final sampleTexts = [
    'The weather is sunny today', // Similar to next
    'It is a beautiful day outside', // Similar to prev
    'Machine learning is fascinating', // Different topic
  ];

  await embeddingsTest(
    'OpenAI',
    OpenAIEmbeddings(apiKey: Platform.environment['OPENAI_API_KEY']),
    sampleTexts,
  );

  await embeddingsTest(
    'Google AI',
    GoogleGenerativeAIEmbeddings(
      apiKey: Platform.environment['GEMINI_API_KEY'],
    ),
    sampleTexts,
  );
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

/// Calculate cosine similarity between two embedding vectors.
/// Returns a value between -1 and 1, where 1 means identical vectors.
double cosineSimilarity(List<double> a, List<double> b) {
  if (a.length != b.length) {
    throw ArgumentError('Vectors must have the same length');
  }

  var dotProduct = 0.0;
  var normA = 0.0;
  var normB = 0.0;

  for (var i = 0; i < a.length; i++) {
    dotProduct += a[i] * b[i];
    normA += a[i] * a[i];
    normB += b[i] * b[i];
  }

  normA = sqrt(normA);
  normB = sqrt(normB);

  if (normA == 0.0 || normB == 0.0) {
    return 0;
  }

  return dotProduct / (normA * normB);
}
