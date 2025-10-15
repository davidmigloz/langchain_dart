// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

/// Integration tests for Corpus & RAG operations.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('Corpus Operations - Integration', () {
    String? createdCorpusName;

    tearDown(() async {
      // Clean up created corpus
      if (createdCorpusName != null && client != null) {
        try {
          await client!.corpora.delete(name: createdCorpusName!);
        } catch (e) {
          // Ignore cleanup errors
        }
        createdCorpusName = null;
      }
    });

    test('creates and retrieves a corpus', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create corpus
      final corpus = await client!.corpora.create(
        corpus: const Corpus(
          displayName: 'Test Corpus for Integration',
        ),
      );

      expect(corpus, isNotNull);
      expect(corpus.name, isNotNull);
      expect(corpus.displayName, 'Test Corpus for Integration');
      expect(corpus.createTime, isNotNull);

      createdCorpusName = corpus.name;

      // Retrieve corpus
      final retrieved = await client!.corpora.get(name: corpus.name!);

      expect(retrieved.name, corpus.name);
      expect(retrieved.displayName, corpus.displayName);
    });

    test('updates a corpus', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create corpus
      final corpus = await client!.corpora.create(
        corpus: const Corpus(
          displayName: 'Original Name',
        ),
      );
      createdCorpusName = corpus.name;

      // Update corpus
      final updated = await client!.corpora.update(
        name: corpus.name!,
        corpus: const Corpus(
          displayName: 'Updated Name',
        ),
        updateMask: 'displayName',
      );

      expect(updated.name, corpus.name);
      expect(updated.displayName, 'Updated Name');
    });

    test('lists corpora', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a corpus to ensure list is not empty
      final corpus = await client!.corpora.create(
        corpus: const Corpus(
          displayName: 'List Test Corpus',
        ),
      );
      createdCorpusName = corpus.name;

      // List corpora
      final response = await client!.corpora.list(pageSize: 10);

      expect(response, isNotNull);
      expect(response.corpora, isNotNull);
      expect(response.corpora, isNotEmpty);
    });

    test('deletes a corpus', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create corpus
      final corpus = await client!.corpora.create(
        corpus: const Corpus(
          displayName: 'Delete Test Corpus',
        ),
      );

      // Delete corpus
      await client!.corpora.delete(name: corpus.name!);

      // Verify deletion - should throw error when trying to get
      expect(
        () => client!.corpora.get(name: corpus.name!),
        throwsA(isA<GoogleAIException>()),
      );

      createdCorpusName = null; // Already deleted
    });
  });

  group('Document Operations - Integration', () {
    test(
      'Document operations are not available',
      () {},
      skip:
          'Document operations require Vertex AI. '
          'Google AI only supports corpus CRUD operations. '
          'See: https://cloud.google.com/vertex-ai/docs/vector-search',
    );
  });

  group('Chunk Operations - Integration', () {
    test(
      'Chunk operations are not available',
      () {},
      skip:
          'Chunk operations require Vertex AI. '
          'Google AI only supports corpus CRUD operations. '
          'See: https://cloud.google.com/vertex-ai/docs/vector-search',
    );
  });

  group('Query Operations - Integration', () {
    test(
      'Query operations are not available',
      () {},
      skip:
          'Query operations require Vertex AI. '
          'Google AI only supports corpus CRUD operations. '
          'See: https://cloud.google.com/vertex-ai/docs/vector-search',
    );
  });

  group('Document Query Operations - Integration', () {
    test(
      'Document query operations are not available',
      () {},
      skip:
          'Document query operations require Vertex AI. '
          'Google AI only supports corpus CRUD operations. '
          'See: https://cloud.google.com/vertex-ai/docs/vector-search',
    );
  });
}
