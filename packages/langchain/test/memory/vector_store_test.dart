import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('VectorStoreMemory tests', () {
    test('Test vector store memory', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreMemory(
        vectorStore: vectorStore,
      );

      final result1 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(result1[VectorStoreMemory.defaultMemoryKey], '');

      await memory.saveContext(
        inputValues: {
          'foo': 'bar',
        },
        outputValues: {
          'bar': 'foo',
        },
      );
      final result2 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(
        result2[VectorStoreMemory.defaultMemoryKey],
        'foo: bar\nbar: foo',
      );
    });

    test('Test returnDocs', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreMemory(
        vectorStore: vectorStore,
        returnDocs: true,
      );

      await memory.saveContext(
        inputValues: {
          'foo': 'bar',
        },
        outputValues: {
          'bar': 'foo',
        },
      );
      final result = await memory.loadMemoryVariables({'input': 'foo'});
      const expectedDoc = Document(pageContent: 'foo: bar\nbar: foo');
      expect(
        result[VectorStoreMemory.defaultMemoryKey],
        [expectedDoc],
      );
    });

    test('Test excludeInputKeys', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreMemory(
        vectorStore: vectorStore,
        excludeInputKeys: {'foo'},
      );

      final result1 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(result1[VectorStoreMemory.defaultMemoryKey], '');

      await memory.saveContext(
        inputValues: {
          'foo': 'bar',
        },
        outputValues: {
          'bar': 'foo',
        },
      );
      final result2 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(
        result2[VectorStoreMemory.defaultMemoryKey],
        'bar: foo',
      );
    });
  });
}

class _FakeEmbeddings implements Embeddings {
  @override
  Future<List<List<double>>> embedDocuments(
    final List<Document> documents,
  ) async {
    return documents
        .map((final doc) => _embed(doc.pageContent))
        .toList(growable: false);
  }

  @override
  Future<List<double>> embedQuery(
    final String query,
  ) async {
    return _embed(query);
  }

  List<double> _embed(final String text) {
    return switch (text) {
      'foo' => [1.0, 1.0],
      'bar' => [-1.0, -1.0],
      'foo: bar\nbar: foo' => [1.0, -1.0],
      'bar: foo' => [-1.0, 1.0],
      _ => throw Exception('Unknown text: $text'),
    };
  }
}
