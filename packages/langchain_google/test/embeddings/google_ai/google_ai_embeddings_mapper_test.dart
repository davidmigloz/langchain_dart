import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

void main() {
  test('uses typed embedding config for queries and documents', () async {
    final requests = <http.Request>[];
    final client = MockClient((request) async {
      requests.add(request);
      if (request.url.path.endsWith(':batchEmbedContents')) {
        return http.Response(
          jsonEncode({
            'embeddings': [
              {
                'values': [0.1, 0.2],
              },
            ],
          }),
          200,
        );
      }
      return http.Response(
        jsonEncode({
          'embedding': {
            'values': [0.3, 0.4],
          },
        }),
        200,
      );
    });
    final embeddings = GoogleGenerativeAIEmbeddings(
      apiKey: 'test-key',
      client: client,
      dimensions: 64,
    );

    final queryEmbedding = await embeddings.embedQuery('query');
    final documentEmbeddings = await embeddings.embedDocuments([
      const Document(
        pageContent: 'document',
        metadata: {'title': 'Document title'},
      ),
    ]);

    expect(queryEmbedding, [0.3, 0.4]);
    expect(documentEmbeddings, [
      [0.1, 0.2],
    ]);
    final queryBody = jsonDecode(requests.first.body) as Map<String, dynamic>;
    expect(queryBody['embedContentConfig'], {
      'taskType': 'RETRIEVAL_QUERY',
      'outputDimensionality': 64,
    });
    final batchBody = jsonDecode(requests.last.body) as Map<String, dynamic>;
    final documentRequest =
        (batchBody['requests'] as List<dynamic>).single as Map<String, dynamic>;
    expect(documentRequest['embedContentConfig'], {
      'taskType': 'RETRIEVAL_DOCUMENT',
      'title': 'Document title',
      'outputDimensionality': 64,
    });

    embeddings.close();
  });
}
