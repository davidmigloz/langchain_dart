@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_mistralai/langchain_mistralai.dart';
import 'package:test/test.dart';

void main() {
  group('MistralAIEmbeddings tests', () {
    late MistralAIEmbeddings embeddings;

    setUp(() async {
      embeddings = MistralAIEmbeddings(
        apiKey: Platform.environment['MISTRAL_API_KEY'],
      );
    });

    tearDown(() {
      embeddings.close();
    });

    test('Test MistralAIEmbeddings.embedQuery', () async {
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 1024);
    });

    test('Test OllamaEmbeddings.embedDocuments', () async {
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
      expect(res[0].length, 1024);
      expect(res[1].length, 1024);
    });
  });
}
