import 'dart:io';

import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:objectbox/objectbox.dart';
import 'package:test/test.dart';

void main()  {
  late final OpenAIEmbeddings embeddings;
  late final ObjectBoxVectorStore vectorStore;

  setUpAll(()  {
    embeddings = OpenAIEmbeddings(
      apiKey: Platform.environment['OPENAI_API_KEY'],
    );
    vectorStore = ObjectBoxVectorStore(
      embeddings: embeddings,
      dimensions: 1536,
      directory: 'test/vector_stores/objectbox',
    );
  });

  group('ObjectBoxVectorStore tests', () {
    test('Test add new vectors', () async {
      final res = await vectorStore.addDocuments(
        documents: [
          const Document(
            id: '1',
            pageContent: 'The cat sat on the mat',
            metadata: {'cat': 'animal'},
          ),
          const Document(
            id: '2',
            pageContent: 'The dog chased the ball.',
            metadata: {'cat': 'animal'},
          ),
          const Document(
            id: '3',
            pageContent: 'The boy ate the apple.',
            metadata: {'cat': 'person'},
          ),
          const Document(
            id: '4',
            pageContent: 'The girl drank the milk.',
            metadata: {'cat': 'person'},
          ),
          const Document(
            id: '5',
            pageContent: 'The sun is shining.',
            metadata: {'cat': 'natural'},
          ),
        ],
      );

      expect(res.length, 5);
    });

    test('Test query return 1 result', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Is it raining?',
        config: ObjectBoxSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
      expect(
        res.first.id,
        '5',
      );
    });

    test('Test query with scoreThreshold', () async {
      final res = await vectorStore.similaritySearchWithScores(
        query: 'Is it raining?',
        config: ObjectBoxSimilaritySearch(scoreThreshold: 0.3),
      );
      for (final (_, score) in res) {
        expect(score, greaterThan(0.3));
      }
    });

    test('Test query with equality filter', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: ObjectBoxSimilaritySearch(
          k: 10,
          scoreThreshold: 1.3,
          filterCondition: ObjectBoxDocumentProps.metadata.contains('person'),
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], 'person');
      }
    });

    test('Test query with filter with multiple operators', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: ObjectBoxSimilaritySearch(
          k: 10,
          filterCondition: ObjectBoxDocumentProps.metadata
              .contains('animal')
              .or(ObjectBoxDocumentProps.metadata.contains('natural')),
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], isNot('person'));
      }
    });

    test('Test delete document', () async {
      await vectorStore.addDocuments(
        documents: [
          const Document(
            id: '9999',
            pageContent: 'This document will be deleted',
            metadata: {'cat': 'xxx'},
          ),
        ],
      );
      final res1 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: ObjectBoxSimilaritySearch(
          filterCondition: ObjectBoxDocumentProps.metadata.contains('xxx'),
        ),
      );
      expect(res1.length, 1);
      expect(res1.first.id, '9999');

      await vectorStore.delete(ids: ['9999']);
      final res2 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: ObjectBoxSimilaritySearch(
          filterCondition: ObjectBoxDocumentProps.metadata.contains('xxx'),
        ),
      );
      expect(res2.length, 0);
    });

    test('Test delete where', () async {
      await vectorStore.addDocuments(
        documents: [
          const Document(
            id: '9999',
            pageContent: 'This document will be deleted',
            metadata: {'cat': 'xxx'},
          ),
        ],
      );
      final res1 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: ObjectBoxSimilaritySearch(
          filterCondition: ObjectBoxDocumentProps.metadata.contains('xxx'),
        ),
      );
      expect(res1.length, 1);
      expect(res1.first.id, '9999');

      await vectorStore.deleteWhere(
        ObjectBoxDocumentProps.metadata.contains('xxx'),
      );
      final res2 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: ObjectBoxSimilaritySearch(
          filterCondition: ObjectBoxDocumentProps.metadata.contains('xxx'),
        ),
      );
      expect(res2.length, 0);
    });
  });

  group('ObjectBoxSimilaritySearch', () {
    test('ObjectBoxSimilaritySearch fields', () {
      final config = ObjectBoxSimilaritySearch(
        k: 5,
        scoreThreshold: 0.8,
        filterCondition: ObjectBoxDocumentProps.metadata.contains('style1'),
      );
      expect(config.k, 5);
      expect(config.scoreThreshold, 0.8);
      expect(config.filter?['filter'], isA<Condition<ObjectBoxDocument>>());
    });
  });

  tearDownAll(() async {
    embeddings.close();
    vectorStore.close();
    await File('test/vector_stores/objectbox/data.mdb').delete();
    await File('test/vector_stores/objectbox/lock.mdb').delete();
  });
}
