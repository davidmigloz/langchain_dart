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
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call embeddings API', () async {
      final models = [
        (EmbeddingModels.textEmbeddingAda002, 1536),
        (EmbeddingModels.textEmbedding3Small, 1536),
        (EmbeddingModels.textEmbedding3Large, 3072),
      ];

      for (final (model, modelDim) in models) {
        final request = CreateEmbeddingRequest(
          model: EmbeddingModel.model(model),
          input: const EmbeddingInput.string(
            'The food was delicious and the waiter...',
          ),
        );
        final res = await client.createEmbedding(request: request);
        expect(res.data, hasLength(1));
        expect(res.data.first.index, 0);
        expect(res.data.first.embeddingVector, hasLength(modelDim));
        expect(res.data.first.object, EmbeddingObject.embedding);
        expect(res.model.replaceAll('-', ''), model.name.toLowerCase());
        expect(res.object, CreateEmbeddingResponseObject.list);
        expect(res.usage?.promptTokens, greaterThan(0));
        expect(res.usage?.totalTokens, greaterThan(0));
      }
    });

    test('Test call embeddings API with encoding base64', () async {
      const request = CreateEmbeddingRequest(
        model: EmbeddingModel.model(EmbeddingModels.textEmbedding3Small),
        input: EmbeddingInput.string(
          'The food was delicious and the waiter...',
        ),
        encodingFormat: EmbeddingEncodingFormat.base64,
      );
      final res = await client.createEmbedding(request: request);
      expect(res.data, hasLength(1));
      expect(res.data.first.index, 0);
      expect(res.data.first.embeddingVectorBase64, isNotEmpty);
    });

    test('Test shortening embeddings', () async {
      const request = CreateEmbeddingRequest(
        model: EmbeddingModel.model(EmbeddingModels.textEmbedding3Large),
        input: EmbeddingInput.string(
          'The food was delicious and the waiter...',
        ),
        dimensions: 256,
      );
      final res = await client.createEmbedding(request: request);
      expect(res.data, hasLength(1));
      expect(res.data.first.index, 0);
      expect(res.data.first.embeddingVector, hasLength(256));
    });
  });
}
