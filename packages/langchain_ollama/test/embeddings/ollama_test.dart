import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group('OllamaEmbeddings tests', skip: Platform.environment.containsKey('CI'),
      () {
    late OllamaEmbeddings embeddings;
    const defaultModel = 'llama2:latest';

    setUp(() async {
      embeddings = OllamaEmbeddings(
        model: defaultModel,
      );
    });

    tearDown(() {
      embeddings.close();
    });

    test('Test OllamaEmbeddings.embedQuery', () async {
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 4096);
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
      expect(res[0].length, 4096);
      expect(res[1].length, 4096);
    });
  });
}
