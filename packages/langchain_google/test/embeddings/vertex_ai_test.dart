@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

void main() async {
  final authHttpClient = await getAuthHttpClient();
  group('VertexAIEmbeddings tests', () {
    test('Test VertexAIEmbeddings.embedQuery', () async {
      final embeddings = VertexAIEmbeddings(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 768);
    });

    test('Test VertexAIEmbeddings.embedDocuments', () async {
      final embeddings = VertexAIEmbeddings(
        authHttpClient: authHttpClient,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        batchSize: 1,
      );
      final res = await embeddings.embedDocuments(['Hello world', 'Bye bye']);
      expect(res.length, 2);
      expect(res[0].length, 768);
      expect(res[1].length, 768);
    });
  });
}
