@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain_core/documents.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../../utils/auth.dart';

void main() {
  final authProvider = getAuthProvider();
  group('VertexAIEmbeddings tests', () {
    test('Test VertexAIEmbeddings.embedQuery', () async {
      final embeddings = VertexAIEmbeddings(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
      );
      final res = await embeddings.embedQuery('Hello world');
      expect(res.length, 768);
    });

    test('Test VertexAIEmbeddings.embedDocuments', () async {
      final embeddings = VertexAIEmbeddings(
        authProvider: authProvider,
        project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
        batchSize: 1,
      );
      final res = await embeddings.embedDocuments([
        const Document(
          id: '1',
          pageContent: 'Hello world',
          metadata: {'title': 'Hello!'},
        ),
        const Document(
          id: '2',
          pageContent: 'Bye bye',
          metadata: {'title': 'Bye!'},
        ),
      ]);
      expect(res.length, 2);
      expect(res[0].length, 768);
      expect(res[1].length, 768);
    });
  });
}
