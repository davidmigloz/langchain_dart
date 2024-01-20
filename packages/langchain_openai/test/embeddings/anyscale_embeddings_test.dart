@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() {
  group('Anyscale AI Embeddings tests', () {
    late OpenAIEmbeddings embeddings;

    setUp(() async {
      embeddings = OpenAIEmbeddings(
        apiKey: Platform.environment['ANYSCALE_API_KEY'],
        baseUrl: 'https://api.endpoints.anyscale.com/v1',
      );
    });

    tearDown(() {
      embeddings.close();
    });

    test('Test Anyscale Embeddings models', () async {
      final models = [
        'thenlper/gte-large',
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
