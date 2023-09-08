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
    httpClient: authHttpClient,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
    model: 'textembedding-gecko-multilingual',
  );
  final vectorStore = VertexAIMatchingEngine(
    httpClient: authHttpClient,
    project: Platform.environment['VERTEX_AI_PROJECT_ID']!,
    location: 'europe-west1',
    indexId: '6394355006866194432',
    gcsBucketName: 'public_knowledge_base_index',
    embeddings: embeddings,
  );

  group('VertexAIMatchingEngine tests', () {
    test('Test VertexAIMatchingEngine add new vectors', skip: true, () async {
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

    test('Test VertexAIMatchingEngine query return 1 result', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What payment methods do you offer?',
        config: const VectorStoreSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
      expect(
        res.first.id,
        'faq_621656c96b5ff317d867d019',
      );
    });

    test('Test VertexAIMatchingEngine query with scoreThreshold', () async {
      final res = await vectorStore.similaritySearchWithScores(
        query: 'Can I pay by credit card?',
        config: VertexAIMatchingEngineSimilaritySearch(scoreThreshold: 0.6),
      );
      for (final (_, score) in res) {
        expect(score, greaterThan(0.6));
      }
    });

    test('Test VertexAIMatchingEngine query with filters', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Can I pay by credit card?',
        config: VertexAIMatchingEngineSimilaritySearch(
          k: 10,
          filters: [
            const VertexAIMatchingEngineFilter(
              namespace: 'type',
              allowList: ['faq'],
            ),
          ],
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['type'], 'faq');
      }
    });
  });
}
