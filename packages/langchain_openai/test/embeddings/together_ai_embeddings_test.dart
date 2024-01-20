@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('Together AI Embeddings tests', () {
    late OpenAIEmbeddings embeddings;

    setUp(() async {
      embeddings = OpenAIEmbeddings(
        apiKey: Platform.environment['TOGETHER_AI_API_KEY'],
        baseUrl: 'https://api.together.xyz/v1',
      );
    });

    tearDown(() {
      embeddings.close();
    });

    test('Test AI Embeddings models', () async {
      final models = [
        'togethercomputer/m2-bert-80M-2k-retrieval',
        'togethercomputer/m2-bert-80M-8k-retrieval',
        'togethercomputer/m2-bert-80M-32k-retrieval',
        'WhereIsAI/UAE-Large-V1',
        'BAAI/bge-large-en-v1.5',
        'BAAI/bge-base-en-v1.5',
        'sentence-transformers/msmarco-bert-base-dot-v5',
        'bert-base-uncased',
      ];
      for (final model in models) {
        embeddings.model = model;
        final res = await embeddings.embedQuery('Hello world');
        expect(res.length, greaterThan(0));
        await Future<void>.delayed(const Duration(seconds: 1)); // Rate limit
      }
    });
  });
}
