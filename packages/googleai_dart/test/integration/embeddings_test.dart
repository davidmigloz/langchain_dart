// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Integration tests for content embeddings.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('embedContent - Integration', () {
    test('generates embedding for text content', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('Hello, world!')],
          ),
        ),
      );

      expect(response, isNotNull);
      expect(response.embedding, isNotNull);
      expect(response.embedding.values, isNotEmpty);
      expect(response.embedding.values.first, isA<double>());

      // Embedding should be a vector of reasonable size (typically 768 or more)
      expect(response.embedding.values.length, greaterThan(100));
    });

    test('generates embedding with task type hint', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [
              TextPart(
                'Machine learning is a subset of artificial intelligence',
              ),
            ],
          ),
          taskType: TaskType.retrievalDocument,
        ),
      );

      expect(response, isNotNull);
      expect(response.embedding.values, isNotEmpty);
    });

    test('generates different embeddings for different texts', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response1 = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('I love programming')],
          ),
        ),
      );

      final response2 = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('The weather is nice today')],
          ),
        ),
      );

      expect(response1.embedding.values, isNotEmpty);
      expect(response2.embedding.values, isNotEmpty);

      // Embeddings should have the same dimension
      expect(
        response1.embedding.values.length,
        equals(response2.embedding.values.length),
      );

      // But different values (very unlikely to be identical)
      expect(
        response1.embedding.values,
        isNot(equals(response2.embedding.values)),
      );
    });

    test('generates similar embeddings for similar texts', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response1 = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('The cat is sleeping')],
          ),
        ),
      );

      final response2 = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('A cat is taking a nap')],
          ),
        ),
      );

      final response3 = await client!.models.embedContent(
        model: defaultEmbeddingModel,
        request: const EmbedContentRequest(
          content: Content(
            parts: [TextPart('Programming languages and compilers')],
          ),
        ),
      );

      // Calculate cosine similarity
      double cosineSimilarity(List<double> a, List<double> b) {
        double dotProduct = 0;
        double normA = 0;
        double normB = 0;

        for (var i = 0; i < a.length; i++) {
          dotProduct += a[i] * b[i];
          normA += a[i] * a[i];
          normB += b[i] * b[i];
        }

        return dotProduct / (normA.sqrt() * normB.sqrt());
      }

      final similarity12 = cosineSimilarity(
        response1.embedding.values,
        response2.embedding.values,
      );
      final similarity13 = cosineSimilarity(
        response1.embedding.values,
        response3.embedding.values,
      );

      // Similar texts (1 and 2) should have higher similarity than dissimilar (1 and 3)
      expect(similarity12, greaterThan(similarity13));
      expect(
        similarity12,
        greaterThan(0.5),
      ); // Similar texts should be fairly similar
    });

    test('handles different task types', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final taskTypes = [
        TaskType.retrievalQuery,
        TaskType.retrievalDocument,
        TaskType.semanticSimilarity,
        TaskType.classification,
      ];

      for (final taskType in taskTypes) {
        final response = await client!.models.embedContent(
          model: defaultEmbeddingModel,
          request: EmbedContentRequest(
            content: const Content(
              parts: [TextPart('Sample text for embedding')],
            ),
            taskType: taskType,
          ),
        );

        expect(response.embedding.values, isNotEmpty);
      }
    });

    test('handles API errors gracefully', () {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Try with invalid model
      expect(
        () => client!.models.embedContent(
          model: 'invalid-embedding-model-xyz',
          request: const EmbedContentRequest(
            content: Content(
              parts: [TextPart('Hello')],
            ),
          ),
        ),
        throwsA(isA<ApiException>()),
      );
    });

    test('handles empty content', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Empty text should either fail or return embedding
      // (API behavior may vary)
      try {
        final response = await client!.models.embedContent(
          model: defaultEmbeddingModel,
          request: const EmbedContentRequest(
            content: Content(
              parts: [TextPart('')],
            ),
          ),
        );
        // If it succeeds, embedding should still be valid
        expect(response.embedding.values, isNotEmpty);
      } on ApiException {
        // If it fails, that's also acceptable
      }
    });
  });
}

extension on double {
  double sqrt() {
    return this < 0 ? double.nan : squareRoot();
  }

  double squareRoot() {
    if (this < 0) return double.nan;
    if (this == 0) return 0;

    var x = this;
    var y = 1.0;
    const epsilon = 0.000001;

    while ((x - y).abs() > epsilon) {
      x = (x + y) / 2;
      y = this / x;
    }
    return x;
  }
}
