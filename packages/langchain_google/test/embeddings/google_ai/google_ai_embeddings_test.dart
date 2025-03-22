@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/documents.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  group('GoogleGenerativeAIEmbeddings tests', () {
    late GoogleGenerativeAIEmbeddings embeddings;

    setUp(()  {
      embeddings = GoogleGenerativeAIEmbeddings(
        apiKey: Platform.environment['GOOGLEAI_API_KEY'],
      );
    });

    tearDown(() {
      embeddings.close();
    });

    test('Test GoogleGenerativeAIEmbeddings.embedQuery', () async {
      const models = ['text-embedding-004', 'embedding-001'];
      for (final model in models) {
        embeddings.model = model;
        final res = await embeddings.embedQuery(
          'Hello world',
        );
        expect(res.length, 768);
        embeddings.close();
      }
    });

    test('Test GoogleGenerativeAIEmbeddings.embedDocuments', () async {
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
      expect(res[0].length, 768);
      expect(res[1].length, 768);
    });

    test('Test shortening embeddings', () async {
      embeddings.dimensions = 256;
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 256);
    });
  });
}
