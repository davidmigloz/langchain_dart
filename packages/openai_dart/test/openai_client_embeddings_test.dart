@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Embeddings API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY']!,
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call embeddings API', () async {
      const request = CreateEmbeddingRequest(
        model: EmbeddingModel.enumeration(EmbeddingModels.textEmbeddingAda002),
        input: EmbeddingInput.string(
          'The food was delicious and the waiter...',
        ),
      );
      final res = await client.createEmbedding(request: request);
      expect(res.data, hasLength(1));
      expect(res.data.first.index, 0);
      expect(res.data.first.embedding, hasLength(1536));
      expect(res.data.first.object, 'embedding');
      expect(res.model, startsWith('text-embedding-ada-002'));
      expect(res.object, 'list');
      expect(res.usage.promptTokens, greaterThan(0));
      expect(res.usage.totalTokens, greaterThan(0));
    });
  });
}
