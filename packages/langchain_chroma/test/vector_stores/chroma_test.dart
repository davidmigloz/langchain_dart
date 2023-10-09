@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_chroma/langchain_chroma.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:test/test.dart';

void main() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY']!;
  final embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
  final vectorStore = Chroma(embeddings: embeddings);

  group('Chroma tests', skip: true, () {
    test('Test Chroma add new vectors', () async {
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

    test('Test Chroma add new vectors from file', () async {
      const filePath = './test/vector_stores/assets/example.txt';
      const loader = TextLoader(filePath);
      final pages = await loader.load();

      const splitter = RecursiveCharacterTextSplitter(
        chunkOverlap: 150,
        chunkSize: 1500,
      );
      final docs = splitter.splitDocuments(pages);

      await vectorStore.addDocuments(documents: docs);

      final res = await vectorStore.similaritySearch(
        query: 'Who are we?',
        config: const ChromaSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
    });

    test('Test Chroma query return 1 result', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Is it raining?',
        config: const ChromaSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
      expect(
        res.first.id,
        '5',
      );
    });

    test('Test Chroma query with scoreThreshold', () async {
      final res = await vectorStore.similaritySearchWithScores(
        query: 'Is it raining?',
        config: const ChromaSimilaritySearch(scoreThreshold: 0.6),
      );
      for (final (_, score) in res) {
        expect(score, greaterThan(0.6));
      }
    });

    test('Test Chroma query with where filter', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: const ChromaSimilaritySearch(
          k: 10,
          where: {'cat': 'person'},
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], 'person');
      }
    });

    test('Test Chroma query with whereDocument filter', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: const ChromaSimilaritySearch(
          whereDocument: {r'$contains': 'milk'},
        ),
      );
      expect(res.length, 1);
      expect(res.first.id, '4');
    });

    test('Test Chroma delete document', () async {
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
        config: const ChromaSimilaritySearch(
          where: {'cat': 'xxx'},
        ),
      );
      expect(res1.length, 1);
      expect(res1.first.id, 'delete');

      await vectorStore.delete(ids: ['delete']);
      final res2 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: const ChromaSimilaritySearch(
          where: {'cat': 'xxx'},
        ),
      );
      expect(res2.length, 0);
    });
  });

  group('ChromaSimilaritySearch', () {
    test('ChromaSimilaritySearch fields', () {
      const config = ChromaSimilaritySearch(
        k: 5,
        where: {'style': 'style1'},
        whereDocument: {r'$contains': 'milk'},
        scoreThreshold: 0.8,
      );
      expect(config.k, 5);
      expect(config.filter, {'style': 'style1'});
      expect(config.whereDocument, {r'$contains': 'milk'});
      expect(config.scoreThreshold, 0.8);
    });
  });
}
