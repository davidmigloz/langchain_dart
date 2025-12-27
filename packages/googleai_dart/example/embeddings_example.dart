// ignore_for_file: avoid_print
/// Demonstrates text embeddings generation.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    // Generate embedding for a single piece of text
    print('Generating embedding for: "Hello, world!"\n');

    final response = await client.models.embedContent(
      model: 'gemini-embedding-001',
      request: EmbedContentRequest(
        content: Content.text('Hello, world!'),
        taskType: TaskType.retrievalDocument,
      ),
    );

    print('Embedding dimension: ${response.embedding.values.length}');
    print('First 5 values: ${response.embedding.values.take(5).toList()}');
    print(
      'Last 5 values: ${response.embedding.values.skip(response.embedding.values.length - 5).toList()}',
    );

    // Generate embeddings for multiple texts (synchronous batch)
    print('\nGenerating embeddings for multiple texts (sync batch)...\n');

    final texts = [
      'The cat sat on the mat',
      'Dogs are loyal companions',
      'Machine learning is fascinating',
    ];

    final batchResponse = await client.models.batchEmbedContents(
      model: 'gemini-embedding-001',
      request: BatchEmbedContentsRequest(
        requests: texts
            .map(
              (text) => EmbedContentRequest(
                content: Content.text(text),
                taskType: TaskType.retrievalDocument,
              ),
            )
            .toList(),
      ),
    );

    print('Generated ${batchResponse.embeddings.length} embeddings:');
    for (var i = 0; i < texts.length; i++) {
      print(
        '  - "${texts[i]}" (${batchResponse.embeddings[i].values.length} dims)',
      );
    }

    // Example: Calculate simple cosine similarity
    print('\nNote: You can use these embeddings for:');
    print('  - Semantic search');
    print('  - Clustering similar content');
    print('  - Recommendation systems');
    print('  - Anomaly detection');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
