@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAIEmbeddings tests', () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    test('Test OpenAIEmbeddings.embedQuery', () async {
      final models = [
        ('text-embedding-ada-002', 1536),
        ('text-embedding-3-small', 1536),
        ('text-embedding-3-large', 3072),
      ];

      for (final (modelId, modelDim) in models) {
        final embeddings = OpenAIEmbeddings(
          apiKey: openaiApiKey,
          model: modelId,
        );
        final res = await embeddings.embedQuery('Hello world');
        expect(res.length, modelDim, reason: modelId);
      }
    });

    test('Test OpenAIEmbeddings.embedDocuments', () async {
      final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey, batchSize: 1);
      final res = await embeddings.embedDocuments([
        const Document(
          id: '1',
          pageContent: 'Hello world',
        ),
        const Document(
          id: '2',
          pageContent: 'Bye bye',
        ),
      ]);
      expect(res.length, 2);
      expect(res[0].length, 1536);
      expect(res[1].length, 1536);
    });

    test('Test shortening embeddings', () async {
      final embeddings = OpenAIEmbeddings(
        apiKey: openaiApiKey,
        model: 'text-embedding-3-large',
        dimensions: 256,
      );
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 256);
    });
  });
}
