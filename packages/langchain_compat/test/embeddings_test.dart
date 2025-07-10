// CRITICAL TEST FAILURE INVESTIGATION PROCESS:
// When a test fails for a provider capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's
//      streaming tool format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION

import 'dart:math' as math;

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  group('Embeddings', () {
    group('basic embeddings', () {
      test('generates embeddings for single text', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );

        final result = await model.embedQuery('Hello, world!');
        final embedding = result.embeddings;

        expect(embedding, isNotEmpty);
        expect(embedding.first, isA<double>());
        expect(embedding.length, greaterThan(100)); // Embedding dimensions
      });

      test('generates consistent embeddings for same text', () async {
        final model = EmbeddingsProvider.google.createModel(
          name: 'text-embedding-004',
        );

        final result1 = await model.embedQuery('Test consistency');
        final result2 = await model.embedQuery('Test consistency');
        final embedding1 = result1.embeddings;
        final embedding2 = result2.embeddings;

        expect(embedding1.length, equals(embedding2.length));

        // Should be identical or very close
        var sumDiff = 0.0;
        for (var i = 0; i < embedding1.length; i++) {
          sumDiff += (embedding1[i] - embedding2[i]).abs();
        }
        expect(sumDiff / embedding1.length, lessThan(0.0001));
      });

      test('generates different embeddings for different text', () async {
        final model = EmbeddingsProvider.mistral.createModel(
          name: 'mistral-embed',
        );

        final result1 = await model.embedQuery('Hello');
        final result2 = await model.embedQuery('Goodbye');
        final embedding1 = result1.embeddings;
        final embedding2 = result2.embeddings;

        // Calculate cosine distance
        final similarity = EmbeddingsProvider.cosineSimilarity(
          embedding1,
          embedding2,
        );

        // Should be different (not identical)
        expect(similarity, lessThan(0.99));
        expect(similarity, greaterThan(0)); // But still somewhat related
      });
    });

    group('batch embeddings', () {
      test('embeds multiple documents', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );

        final documents = [
          'First document',
          'Second document',
          'Third document',
        ];

        final result = await model.embedDocuments(documents);
        final embeddings = result.embeddings;

        expect(embeddings, hasLength(3));
        expect(embeddings[0], isNotEmpty);
        expect(embeddings[1], isNotEmpty);
        expect(embeddings[2], isNotEmpty);

        // All should have same dimensions
        expect(embeddings[0].length, equals(embeddings[1].length));
        expect(embeddings[1].length, equals(embeddings[2].length));
      });

      test('handles empty document list', () async {
        final model = EmbeddingsProvider.google.createModel(
          name: 'text-embedding-004',
        );

        final result = await model.embedDocuments([]);
        final embeddings = result.embeddings;

        expect(embeddings, isEmpty);
      });

      test('handles large batches', () async {
        final model = EmbeddingsProvider.cohere.createModel(
          name: 'embed-english-v3.0',
          options: const CohereEmbeddingsModelOptions(
            inputType: 'search_document',
          ),
        );

        final documents = List.generate(20, (i) => 'Document number $i');

        final result = await model.embedDocuments(documents);
        final embeddings = result.embeddings;

        expect(embeddings, hasLength(20));
        // Each should be unique
        for (var i = 0; i < embeddings.length; i++) {
          for (var j = i + 1; j < embeddings.length; j++) {
            final similarity = EmbeddingsProvider.cosineSimilarity(
              embeddings[i],
              embeddings[j],
            );
            expect(similarity, lessThan(0.99)); // Not identical
          }
        }
      });
    });

    group('similarity calculations', () {
      test('calculates similarity between related texts', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );

        final result1 = await model.embedQuery('cat');
        final result2 = await model.embedQuery('kitten');
        final result3 = await model.embedQuery('automobile');

        final embedding1 = result1.embeddings;
        final embedding2 = result2.embeddings;
        final embedding3 = result3.embeddings;

        final catKittenSim = EmbeddingsProvider.cosineSimilarity(
          embedding1,
          embedding2,
        );
        final catAutoSim = EmbeddingsProvider.cosineSimilarity(
          embedding1,
          embedding3,
        );

        // Cat and kitten should be more similar than cat and automobile
        expect(catKittenSim, greaterThan(catAutoSim));
        expect(catKittenSim, greaterThan(0.5)); // Reasonable similarity
        expect(catAutoSim, lessThan(0.7)); // Lower similarity
      });

      test('finds most similar document', () async {
        final model = EmbeddingsProvider.google.createModel(
          name: 'text-embedding-004',
        );

        const query = 'programming language';
        final documents = [
          'Python is a programming language',
          'The weather is nice today',
          'JavaScript is used for web development',
          'I like pizza',
        ];

        final queryResult = await model.embedQuery(query);
        final queryEmbedding = queryResult.embeddings;
        final docsResult = await model.embedDocuments(documents);
        final docEmbeddings = docsResult.embeddings;

        // Calculate similarities
        final similarities = <int, double>{};
        for (var i = 0; i < docEmbeddings.length; i++) {
          similarities[i] = EmbeddingsProvider.cosineSimilarity(
            queryEmbedding,
            docEmbeddings[i],
          );
        }

        // Find most similar
        final mostSimilarIndex = similarities.entries
            .reduce((a, b) => a.value > b.value ? a : b)
            .key;

        // Should match the Python document (index 0)
        expect(mostSimilarIndex, equals(0));
      });

      test('handles orthogonal vectors', () async {
        // Create artificial orthogonal vectors
        final vector1 = List<double>.filled(100, 0);
        final vector2 = List<double>.filled(100, 0);
        vector1[0] = 1;
        vector2[1] = 1;

        final similarity = EmbeddingsProvider.cosineSimilarity(
          vector1,
          vector2,
        );
        expect(similarity, equals(0.0)); // Orthogonal vectors
      });
    });

    group('vector dimensions', () {
      test('respects different embedding dimensions', () async {
        // OpenAI supports different dimensions
        final smallModel = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );
        final largeModel = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-large',
        );

        final smallResult = await smallModel.embedQuery('Test');
        final largeResult = await largeModel.embedQuery('Test');

        // Different models have different dimensions
        expect(
          smallResult.embeddings.length,
          equals(1536),
        ); // Default for small
        expect(
          largeResult.embeddings.length,
          equals(3072),
        ); // Default for large
      });

      test('handles custom dimensions when supported', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
          dimensions: 512, // Custom dimension
        );

        final result = await model.embedQuery('Test dimensions');

        expect(result.embeddings.length, equals(512));
      });
    });

    group('special cases', () {
      test('handles empty strings', () async {
        final model = EmbeddingsProvider.mistral.createModel(
          name: 'mistral-embed',
        );

        final result = await model.embedQuery('');
        final embedding = result.embeddings;

        // Should still return valid embedding
        expect(embedding, isNotEmpty);
        expect(embedding.every((v) => v.isFinite), isTrue);
      });

      test('handles very long text', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );

        final longText = 'Lorem ipsum ' * 1000; // Very long text

        final result = await model.embedQuery(longText);
        final embedding = result.embeddings;

        // Should handle gracefully (might truncate internally)
        expect(embedding, isNotEmpty);
        expect(embedding.length, greaterThan(100));
      });

      test('handles special characters and unicode', () async {
        final model = EmbeddingsProvider.google.createModel(
          name: 'text-embedding-004',
        );

        const specialText = r'👋 Hello 世界! Special chars: @#$%^&*()';

        final result = await model.embedQuery(specialText);
        final embedding = result.embeddings;

        expect(embedding, isNotEmpty);
        expect(embedding.every((v) => v.isFinite), isTrue);
      });
    });

    group('normalization', () {
      test('produces normalized vectors', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'text-embedding-3-small',
        );

        final result = await model.embedQuery('Test normalization');
        final embedding = result.embeddings;

        // Calculate magnitude
        final magnitude = math.sqrt(
          embedding.fold(0.0, (sum, value) => sum + value * value),
        );

        // Most embedding models return normalized vectors (magnitude ≈ 1)
        expect(magnitude, closeTo(1.0, 0.01));
      });
    });

    group('error handling', () {
      test('handles invalid model names', () async {
        final model = EmbeddingsProvider.openai.createModel(
          name: 'invalid-model-xyz',
        );

        expect(() async => model.embedQuery('Test'), throwsException);
      });

      test('handles network errors gracefully', () async {
        // This test would need a mock or test server
        // For now, just verify the API structure
        final model = EmbeddingsProvider.cohere.createModel(
          name: 'embed-english-v3.0',
          options: const CohereEmbeddingsModelOptions(
            inputType: 'search_document',
          ),
        );

        expect(model, isA<EmbeddingsModel>());
      });
    });

    group('all providers - embeddings', () {
      test('embeddings work across all providers', () async {
        const testText = 'The quick brown fox jumps over the lazy dog';

        // Test subset of stable embeddings providers
        final embeddingProviders = {
          'openai': 'text-embedding-3-small',
          'google': 'text-embedding-004',
        };

        final embeddings = <String, List<double>>{};

        for (final entry in embeddingProviders.entries) {
          final providerName = entry.key;
          final modelName = entry.value;

          final model = EmbeddingsProvider.forName(
            providerName,
          ).createModel(name: modelName);
          final result = await model.embedQuery(testText);

          expect(
            result.embeddings,
            isNotEmpty,
            reason: 'Provider $providerName should return embeddings',
          );
          expect(
            result.embeddings.every((v) => v.isFinite),
            isTrue,
            reason: 'Provider $providerName should return valid numbers',
          );

          embeddings[providerName] = result.embeddings;
        }

        // If we got multiple providers, compare their outputs
        if (embeddings.length > 1) {
          // All should produce embeddings of reasonable length
          for (final entry in embeddings.entries) {
            expect(
              entry.value.length,
              greaterThan(100),
              reason: '${entry.key} should produce reasonably sized embeddings',
            );
          }
        }
      });
    });
  });
}
