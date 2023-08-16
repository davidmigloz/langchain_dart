@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:test/test.dart';

import '../utils/auth.dart';

void main() async {
  final authHttpClient = await getAuthHttpClient();
  final embeddings = VertexAIEmbeddings(
    authHttpClient: authHttpClient,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
  );
  final vectorStore = VertexAIMatchingEngine(
    authHttpClient: authHttpClient,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
    location: 'europe-west1',
    queryRootUrl:
        'https://1451028425.europe-west1-706285145183.vdb.vertexai.goog/',
    indexId: '5086059315115065344',
    gcsBucketName: 'vertex-ai',
    gcsIndexesFolder: 'index',
    embeddings: embeddings,
  );

  group('VertexAIMatchingEngine tests', skip: true, () {
    test('Test VertexAIMatchingEngine add new vectors', () async {
      final res = await vectorStore.addDocuments(
        documents: const [
          Document(
            pageContent: 'Updating your indexes is important to always having '
                'the most accurate information',
            metadata: {'test': '1'},
          ),
          Document(
            pageContent: 'You can also add optional tags to your index to help '
                'with diversifying results or filtering pre index query',
            metadata: {'test': '2'},
          ),
        ],
      );

      expect(res.length, 2);
    });

    test('Test VertexAIMatchingEngine query', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Can I add tags to my index?',
        k: 1,
      );
      expect(res.length, 1);
      expect(
        res.first.pageContent,
        'You can also add optional tags to your index to help '
        'with diversifying results or filtering pre index query',
      );
    });
  });
}
