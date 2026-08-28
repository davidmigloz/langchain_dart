@TestOn('vm')
library; // Uses dart:io

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
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

  group('CohereEmbeddings (mocked)', () {
    test('embedDocuments preserves document order across batches', () async {
      // Echo each input text's first code unit as its embedding so the order
      // of the flattened result can be checked across batch boundaries.
      final client = MockClient((final request) async {
        final decoded = jsonDecode(request.body) as Map<String, dynamic>;
        final texts = (decoded['texts'] as List).cast<String>();
        return http.Response(
          jsonEncode({
            'id': 'res_1',
            'embeddings': {
              'float': [
                for (final t in texts) [t.codeUnitAt(0).toDouble()],
              ],
            },
          }),
          200,
          headers: {'content-type': 'application/json'},
        );
      });
      final embeddings = CohereEmbeddings(
        apiKey: 'test-key',
        client: client,
        batchSize: 2,
      );

      const docs = ['a', 'b', 'c', 'd', 'e'];
      final res = await embeddings.embedDocuments([
        for (final c in docs) Document(id: c, pageContent: c),
      ]);

      expect(res.map((final e) => e.single).toList(), [
        for (final c in docs) c.codeUnitAt(0).toDouble(),
      ]);
      embeddings.close();
    });

    test('embedQuery returns the single embedding vector', () async {
      final client = MockClient(
        (final request) async => http.Response(
          jsonEncode({
            'id': 'res_1',
            'embeddings': {
              'float': [
                [0.1, 0.2, 0.3],
              ],
            },
          }),
          200,
          headers: {'content-type': 'application/json'},
        ),
      );
      final embeddings = CohereEmbeddings(apiKey: 'test-key', client: client);

      final res = await embeddings.embedQuery('hello');

      expect(res, [0.1, 0.2, 0.3]);
      embeddings.close();
    });

    test(
      'embedDocuments throws when the response misaligns with the inputs',
      () async {
        // Two inputs, but the response only carries one embedding.
        final client = MockClient(
          (final request) async => http.Response(
            jsonEncode({
              'id': 'res_1',
              'embeddings': {
                'float': [
                  [0.1],
                ],
              },
            }),
            200,
            headers: {'content-type': 'application/json'},
          ),
        );
        final embeddings = CohereEmbeddings(
          apiKey: 'test-key',
          client: client,
          batchSize: 10,
        );

        await expectLater(
          () => embeddings.embedDocuments([
            const Document(id: '1', pageContent: 'a'),
            const Document(id: '2', pageContent: 'b'),
          ]),
          throwsA(isA<CohereClientException>()),
        );
        embeddings.close();
      },
    );
  });
}
