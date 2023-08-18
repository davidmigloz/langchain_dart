import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryDocStore tests', () {
    late InMemoryDocStore store;

    final Map<String, Document> initialDocs = {
      'doc1': const Document(
        id: 'doc1',
        pageContent: 'content',
        metadata: {'author': 'Author1'},
      ),
      'doc2': const Document(
        id: 'doc2',
        pageContent: 'content',
        metadata: {'author': 'Author2'},
      ),
    };

    setUp(() {
      store = InMemoryDocStore(initialDocuments: initialDocs);
    });

    test('search returns the correct document for an existing id', () async {
      final doc = await store.search('doc1');
      expect(doc, equals(initialDocs['doc1']));
    });

    test('search throws an exception for a non-existent id', () async {
      expect(
        () => store.search('non-existent'),
        throwsA(isA<LangChainException>()),
      );
    });

    test('add inserts new documents into the document store', () async {
      final newDocs = {
        'doc3': const Document(id: 'doc3', pageContent: 'content3'),
        'doc4': const Document(id: 'doc4', pageContent: 'content4'),
      };

      await store.add(newDocs);

      expect(await store.search('doc3'), equals(newDocs['doc3']));
      expect(await store.search('doc4'), equals(newDocs['doc4']));
    });

    test('delete removes documents from the document store', () async {
      await store.delete(['doc1']);

      expect(() => store.search('doc1'), throwsA(isA<LangChainException>()));
    });
  });
}
