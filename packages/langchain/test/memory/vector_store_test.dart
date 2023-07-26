import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('VectorStoreRetrieverMemory tests', () {
    test('Test vector store memory', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreRetrieverMemory(
        retriever: vectorStore.asRetriever(),
      );

      final result1 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(result1[VectorStoreRetrieverMemory.defaultMemoryKey], '');

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
        result2[VectorStoreRetrieverMemory.defaultMemoryKey],
        'foo: bar\nbar: foo',
      );
    });

    test('Test returnDocs', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreRetrieverMemory(
        retriever: vectorStore.asRetriever(),
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
        result[VectorStoreRetrieverMemory.defaultMemoryKey],
        [expectedDoc],
      );
    });

    test('Test excludeInputKeys', () async {
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      final memory = VectorStoreRetrieverMemory(
        retriever: vectorStore.asRetriever(),
        excludeInputKeys: {'foo'},
      );

      final result1 = await memory.loadMemoryVariables({'input': 'foo'});
      expect(result1[VectorStoreRetrieverMemory.defaultMemoryKey], '');

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
        result2[VectorStoreRetrieverMemory.defaultMemoryKey],
        'bar: foo',
      );
    });
  });
}

class _FakeEmbeddings implements Embeddings {
  @override
  Future<List<List<double>>> embedDocuments(
    final List<String> documents,
  ) async {
    return documents.map(_embed).toList(growable: false);
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
