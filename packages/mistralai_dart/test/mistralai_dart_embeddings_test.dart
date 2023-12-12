@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:mistralai_dart/mistralai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('Mistral AI Embeddings API tests', () {
    late MistralAIClient client;

    setUp(() async {
      client = MistralAIClient(
        apiKey: Platform.environment['MISTRAL_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call embeddings API', () async {
      const testPrompt = 'Here is an article about llamas...';

      final res = await client.createEmbedding(
        request: const EmbeddingRequest(
          model: EmbeddingModel.model(EmbeddingModels.mistralEmbed),
          input: [testPrompt],
        ),
      );
      expect(res.id, isNotEmpty);
      expect(res.object, 'list');
      expect(res.model, 'mistral-embed');
      expect(res.usage.promptTokens, greaterThan(0));
      expect(res.usage.totalTokens, greaterThan(0));
      expect(res.data, hasLength(1));
      final embedding = res.data.first;
      expect(embedding.object, 'embedding');
      expect(embedding.embedding, hasLength(1024));
      expect(embedding.index, 0);
    });
  });
}
