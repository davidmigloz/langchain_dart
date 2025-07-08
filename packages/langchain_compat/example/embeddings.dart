// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math' as math;

import 'package:langchain_compat/langchain_compat.dart';

void main() async {
  print('=== Embeddings Example ===\n');

  // Generate embeddings with OpenAI
  print('--- OpenAI Embeddings ---');
  final model = EmbeddingsProvider.openai.createModel(
    name: 'text-embedding-3-small',
  );

  const text1 = 'The cat sat on the mat';
  const text2 = 'The kitten rested on the rug';
  const text3 = 'I love programming in Dart';

  print('Generating embeddings for:');
  print('1. "$text1"');
  print('2. "$text2"');
  print('3. "$text3"\n');

  final result1 = await model.embedQuery(text1);
  final result2 = await model.embedQuery(text2);
  final result3 = await model.embedQuery(text3);

  final embedding1 = result1.embeddings;
  final embedding2 = result2.embeddings;
  final embedding3 = result3.embeddings;

  print('Embedding dimensions: ${embedding1.length}');
  print('First 5 values of embedding 1: ${embedding1.take(5).toList()}\n');

  // Calculate similarities
  final sim12 = _cosineSimilarity(embedding1, embedding2);
  final sim13 = _cosineSimilarity(embedding1, embedding3);
  final sim23 = _cosineSimilarity(embedding2, embedding3);

  print('Cosine similarities:');
  print('  Text 1 vs Text 2: ${sim12.toStringAsFixed(4)} (similar sentences)');
  print('  Text 1 vs Text 3: ${sim13.toStringAsFixed(4)} (different topics)');
  print('  Text 2 vs Text 3: ${sim23.toStringAsFixed(4)} (different topics)\n');

  // Batch embeddings with Google
  print('--- Google Batch Embeddings ---');
  final googleBatchModel = EmbeddingsProvider.google.createModel(
    name: 'text-embedding-004',
  );

  final documents = [
    'Python is a programming language',
    'JavaScript is used for web development',
    'The weather is nice today',
    'I enjoy coding in TypeScript',
    'Pizza is my favorite food',
  ];

  print('Embedding ${documents.length} documents...');
  final batchResult = await googleBatchModel.embedDocuments(documents);
  final embeddings = batchResult.embeddings;

  // Find most similar to a query
  const query = 'programming languages';
  print('\nSearching for documents similar to: "$query"');
  final queryResult = await googleBatchModel.embedQuery(query);
  final queryEmbedding = queryResult.embeddings;

  // Calculate similarities
  final similarities = <int, double>{};
  for (var i = 0; i < embeddings.length; i++) {
    similarities[i] = _cosineSimilarity(queryEmbedding, embeddings[i]);
  }

  // Sort by similarity
  final sorted = similarities.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  print('\nResults (sorted by similarity):');
  for (final entry in sorted) {
    print(
      '  ${(entry.value * 100).toStringAsFixed(1)}% - '
      '"${documents[entry.key]}"',
    );
  }

  // Compare embedding providers
  print('\n--- Provider Comparison ---');
  const testText = 'Artificial intelligence is fascinating';

  print('Generating embeddings for: "$testText"\n');

  // OpenAI
  final openaiModel = EmbeddingsProvider.openai.createModel(
    name: 'text-embedding-3-small',
  );
  final openaiResult = await openaiModel.embedQuery(testText);
  final openaiEmb = openaiResult.embeddings;
  print('OpenAI dimensions: ${openaiEmb.length}');

  // Google
  final googleModel = EmbeddingsProvider.google.createModel(
    name: 'text-embedding-004',
  );
  final googleResult = await googleModel.embedQuery(testText);
  final googleEmb = googleResult.embeddings;
  print('Google dimensions: ${googleEmb.length}');

  // Mistral
  final mistralModel = EmbeddingsProvider.mistral.createModel(
    name: 'mistral-embed',
  );
  final mistralResult = await mistralModel.embedQuery(testText);
  final mistralEmb = mistralResult.embeddings;
  print('Mistral dimensions: ${mistralEmb.length}');

  // Custom dimensions example (OpenAI)
  print('\n--- Custom Dimensions (OpenAI) ---');
  final customModel = EmbeddingsProvider.openai.createModel(
    name: 'text-embedding-3-small',
    dimensions: 256, // Reduced dimensions
  );

  final customResult = await customModel.embedQuery(testText);
  final customEmb = customResult.embeddings;
  print('Custom embedding dimensions: ${customEmb.length}');
  print(
    'Standard vs Custom dimension reduction: ${openaiEmb.length} → '
    '${customEmb.length}',
  );

  exit(0);
}

/// Calculates cosine similarity between two vectors
double _cosineSimilarity(List<double> a, List<double> b) {
  if (a.length != b.length) {
    throw ArgumentError('Vectors must have same length');
  }

  var dotProduct = 0.0;
  var normA = 0.0;
  var normB = 0.0;

  for (var i = 0; i < a.length; i++) {
    dotProduct += a[i] * b[i];
    normA += a[i] * a[i];
    normB += b[i] * b[i];
  }

  normA = math.sqrt(normA);
  normB = math.sqrt(normB);

  if (normA == 0.0 || normB == 0.0) {
    return 0;
  }

  return dotProduct / (normA * normB);
}
