@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_cohere/langchain_cohere.dart';
import 'package:langchain_core/documents.dart';
import 'package:test/test.dart';

void main() {
  final apiKey = Platform.environment['COHERE_API_KEY'];

  group('CohereEmbeddings tests', () {
    test('Test CohereEmbeddings parameters', () {
      final embeddings = CohereEmbeddings(
        model: 'embed-english-v3.0',
        dimensions: 512,
        truncate: 'END',
        batchSize: 42,
      );

      expect(embeddings.model, 'embed-english-v3.0');
      expect(embeddings.dimensions, 512);
      expect(embeddings.truncate, 'END');
      expect(embeddings.batchSize, 42);
      embeddings.close();
    });
  });

  group(
    'CohereEmbeddings integration tests',
    skip: apiKey == null || apiKey.isEmpty ? 'COHERE_API_KEY is not set' : null,
    () {
      late CohereEmbeddings embeddings;

      setUp(() {
        embeddings = CohereEmbeddings(apiKey: apiKey);
      });

      tearDown(() {
        embeddings.close();
      });

      test('Test CohereEmbeddings.embedQuery', () async {
        final res = await embeddings.embedQuery('Hello world');
        expect(res.length, 1536);
      });

      test('Test CohereEmbeddings.embedDocuments', () async {
        final res = await embeddings.embedDocuments([
          const Document(id: '1', pageContent: 'Hello world'),
          const Document(id: '2', pageContent: 'Bye bye'),
        ]);
        expect(res.length, 2);
        expect(res[0].length, 1536);
        expect(res[1].length, 1536);
      });
    },
  );
}
