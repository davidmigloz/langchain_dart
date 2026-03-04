import 'dart:io';

import 'package:langchain_core/documents.dart';
import 'package:langchain_ollama/langchain_ollama.dart';
import 'package:test/test.dart';

void main() {
  group(
    'OllamaEmbeddings tests',
    skip: Platform.environment.containsKey('CI'),
    () {
      late OllamaEmbeddings embeddings;
      const defaultModel = 'nomic-embed-text:latest';

      setUp(() {
        embeddings = OllamaEmbeddings(model: defaultModel);
      });

      tearDown(() {
        embeddings.close();
      });

      test('Test OllamaEmbeddings.embedQuery', () async {
        final res = await embeddings.embedQuery('Hello world');
        expect(res.length, 768);
      });

      test('Test OllamaEmbeddings.embedDocuments', () async {
        final res = await embeddings.embedDocuments([
          const Document(id: '1', pageContent: 'Hello world'),
          const Document(id: '2', pageContent: 'Bye bye'),
        ]);
        expect(res.length, 2);
        expect(res[0].length, 768);
        expect(res[1].length, 768);
      });
    },
  );
}
