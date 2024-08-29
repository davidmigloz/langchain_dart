import 'package:langchain_community/src/vector_stores/sqlite_vss/sqlite_vss.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/embeddings.dart';
import 'package:langchain_core/vector_stores.dart';
import 'package:test/test.dart';

SQLiteVSS sqliteVssFromTexts({
  List<Map<String, dynamic>>? metaData,
  bool drop = true,
}) {
  return SQLiteVSS.fromTexts(
    ['foo', 'bar', 'baz'], // Replace with actual fake_texts
    FakeEmbeddings(),
    metadatas: metaData,
    table: 'test',
    dbFile: ':memory:',
  );
}

void main() {
  group('SQLiteVSS Tests', () {
    test('Test end to end construction and search', () async {
      final docSearch = sqliteVssFromTexts();
      final output = await docSearch.similaritySearch(
        query: 'foo',
        config: const VectorStoreSimilaritySearch(k: 1),
      );
      expect(output, [const Document(pageContent: 'foo', metadata: {})]);
    });

    test('Test end to end construction and search with scores and IDs',
        () async {
      final texts = ['foo', 'bar', 'baz'];
      final metaData = [
        for (var i = 0; i < texts.length; i++) {'page': i},
      ];
      final docSearch = sqliteVssFromTexts(metaData: metaData);
      final output = await docSearch.similaritySearchWithScores(
        query: 'foo',
        config: const VectorStoreSimilaritySearch(k: 3),
      );
      final docs = output.map((o) => o.$1).toList();
      final distances = output.map((o) => o.$2).toList();

      expect(docs, [
        const Document(pageContent: 'foo', metadata: {'page': 0}),
        const Document(pageContent: 'bar', metadata: {'page': 1}),
        const Document(pageContent: 'baz', metadata: {'page': 2}),
      ]);
      expect(distances[0] < distances[1], isTrue);
      expect(distances[1] < distances[2], isTrue);
    });

    test('Test end to end construction and MRR search', () async {
      final texts = ['foo', 'bar', 'baz'];
      final metaData = [
        for (var i = 0; i < texts.length; i++) {'page': i},
      ];
      final docSearch = sqliteVssFromTexts(metaData: metaData)
        ..addTexts(texts: texts, metadatas: metaData);
      final output = await docSearch.similaritySearch(
        query: 'foo',
        config: const VectorStoreSimilaritySearch(k: 10),
      );
      expect(output.length, 6);
    });
  });
}
