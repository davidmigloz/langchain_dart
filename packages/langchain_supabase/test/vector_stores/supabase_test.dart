@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:langchain_supabase/langchain_supabase.dart';
import 'package:supabase/supabase.dart' as sp;
import 'package:test/test.dart';

void main() async {
  final openaiApiKey = Platform.environment['OPENAI_API_KEY'];
  final supabaseUrl = Platform.environment['SUPABASE_URL'];
  final supabaseApiKey = Platform.environment['SUPABASE_API_KEY'];
  late final Embeddings embeddings;
  late final VectorStore vectorStore;
  late final sp.SupabaseClient supabaseClient;

  setUpAll(() async {
    expect(openaiApiKey, isNotNull);
    expect(supabaseUrl, isNotNull);
    expect(supabaseApiKey, isNotNull);

    try {
      supabaseClient = sp.SupabaseClient(
        supabaseUrl!,
        supabaseApiKey!,
      );
    } catch (e) {
      fail('Expected SupabaseClient to be initialized');
    }

    // sanity check for documents table
    try {
      final result = await supabaseClient
          .from('documents')
          .select('id,content,metadata,embedding');
      expect(result, isNotNull);
      expect(result.length, 0);
    } catch (e) {
      fail('Expected documents table to exist and be empty: $e');
    }

    // sanity check for match_documents function
    try {
      final result = await supabaseClient.rpc<List<dynamic>>(
        'match_documents',
        params: {
          'filter': '', // no filter
          'match_count': 2147483647, // maximum integer value
          'query_embedding': '[${'0,' * 1535}0]', // origin in 1536 dims space
          'match_threshold': 0.0, // minimum similarity score
        },
      );
      expect(result, isNotNull);
      expect(result.length, 0);
    } catch (e) {
      fail('Expected match_documents function to exist: $e');
    }

    embeddings = OpenAIEmbeddings(apiKey: openaiApiKey);
    vectorStore = Supabase(
      tableName: 'documents',
      embeddings: embeddings,
      supabaseUrl: supabaseUrl,
      supabaseKey: supabaseApiKey,
    );
  });

  group('Supabase tests', () {
    test('Test Supabase add new vectors', () async {
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

    test('Test Supabase add new vectors from file', () async {
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
        config: const SupabaseSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
    });

    test('Test Supabase query return 1 result', () async {
      final res = await vectorStore.similaritySearch(
        query: 'Is it raining?',
        config: const SupabaseSimilaritySearch(k: 1),
      );
      expect(res.length, 1);
      expect(
        res.first.id,
        '5',
      );
    });

    test('Test Supabase query with scoreThreshold', () async {
      final res = await vectorStore.similaritySearchWithScores(
        query: 'Is it raining?',
        config: const SupabaseSimilaritySearch(scoreThreshold: 0.3),
      );
      for (final (_, score) in res) {
        expect(score, greaterThan(0.3));
      }
    });

    test('Test Supabase query with equality filter', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: const SupabaseSimilaritySearch(
          k: 10,
          filter: {'cat': 'person'},
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], 'person');
      }
    });

    test('Test Supabase query with filter with operators', () async {
      final res = await vectorStore.similaritySearch(
        query: 'What are they eating?',
        config: const SupabaseSimilaritySearch(
          k: 10,
          filter: {
            'cat': {r'ne': 'person'},
          },
        ),
      );
      for (final doc in res) {
        expect(doc.metadata['cat'], isNot('person'));
      }
    });

    test('Test Supabase delete document', () async {
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
        config: const SupabaseSimilaritySearch(
          filter: {'cat': 'xxx'},
        ),
      );
      expect(res1.length, 1);
      expect(res1.first.id, '9999');

      await vectorStore.delete(ids: ['9999']);
      final res2 = await vectorStore.similaritySearch(
        query: 'Deleted doc',
        config: const SupabaseSimilaritySearch(
          filter: {'cat': 'xxx'},
        ),
      );
      expect(res2.length, 0);
    });
  });

  group('SupabaseSimilaritySearch', () {
    test('SupabaseSimilaritySearch fields', () {
      const config = SupabaseSimilaritySearch(
        k: 5,
        filter: {'style': 'style1'},
        scoreThreshold: 0.8,
      );
      expect(config.k, 5);
      expect(config.filter, {'style': 'style1'});
      expect(config.scoreThreshold, 0.8);
    });
  });

  tearDownAll(() async {
    late final List<Map<String, dynamic>> result;
    try {
      result = await supabaseClient
          .from('documents')
          .delete()
          .neq('id', '0')
          .select();
    } catch (e) {
      fail('Error deleting documents: $e');
    }
    expect(result, isNotNull);
    expect(result.length, 6);
    await supabaseClient.dispose();
  });
}
