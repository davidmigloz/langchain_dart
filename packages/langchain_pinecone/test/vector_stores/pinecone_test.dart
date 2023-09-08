@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_pinecone/langchain_pinecone.dart';
import 'package:test/test.dart';

void main() async {
  group('Pinecone tests', timeout: const Timeout(Duration(minutes: 1)), () {
    final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
    final pineconeApiKey = Platform.environment['PINECONE_API_KEY']!;
    final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
    final vectorStore = Pinecone(
      apiKey: pineconeApiKey,
      indexName: 'langchain-dart',
      embeddings: embeddings,
    );

    test('Test Pinecone add new vectors', () async {
      final res = await vectorStore.addDocuments(
        documents: const [
          Document(
            id: '1',
            pageContent: 'The cat sat on the mat',
            metadata: {'cat': 'animal'},
          ),
          Document(
            id: '2',
            pageContent: 'The dog chased the ball.',
            metadata: {'cat': 'animal'},
          ),
          Document(
            id: '3',
            pageContent: 'The boy ate the apple.',
            metadata: {'cat': 'person'},
          ),
          Document(
            id: '4',
            pageContent: 'The girl drank the milk.',
            metadata: {'cat': 'person'},
          ),
          Document(
            id: '5',
            pageContent: 'The sun is shining.',
            metadata: {'cat': 'natural'},
          ),
        ],
      );

      expect(res.length, 5);
    });

    test('Test Pinecone query return 1 result', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Is it raining?',
        config: const PineconeSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
      expect(
        res.first.id,
        '5',
      );
    });

    test('Test Pinecone query with scoreThreshold', () async {
      final res = await vectorStore.similaritySearchWithScores(
        query: 'Is it raining?',
        config: const PineconeSimilaritySearch(scoreThreshold: 0.6),
      );
      for (final (_, score) in res) {
        expect(score, greaterThan(0.6));
      }
    });

    test('Test Pinecone query with filter', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: const PineconeSimilaritySearch(
          k: 10,
          filter: {'cat': 'person'},
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], 'person');
      }
    });

    test('Test Pinecone delete document', skip: true, () async {
      await vectorStore.addDocuments(
        documents: [
          const Document(
            id: 'delete',
            pageContent: 'This document will be deleted',
            metadata: {'cat': 'xxx'},
          ),
        ],
      );
      final res1 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: const PineconeSimilaritySearch(
          filter: {'cat': 'xxx'},
        ),
      );
      expect(res1.length, 1);
      expect(res1.first.id, 'delete');

      await vectorStore.delete(ids: ['delete']);
      final res2 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: const PineconeSimilaritySearch(
          filter: {'cat': 'xxx'},
        ),
      );
      expect(res2.length, 0);
    });
  });
}
