import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/embeddings/base.dart';
import 'package:langchain/src/llms/fake.dart';
import 'package:langchain/src/prompts/prompt.dart';
import 'package:langchain/src/retrievers/retrievers.dart';
import 'package:langchain/src/vector_stores/memory.dart';
import 'package:test/test.dart';

void main() {
  group('RetrievalQAChain tests', () {
    test('Test RetrievalQAChain', () async {
      final documents = [
        const Document(pageContent: 'hello'),
        const Document(pageContent: 'hi'),
        const Document(pageContent: 'bye'),
        const Document(pageContent: "what's this"),
      ];
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings)
        ..addDocuments(documents: documents);
      final retriever = VectorStoreRetriever(vectorStore: vectorStore);

      const model = FakeEchoLLM();
      final prompt = PromptTemplate.fromTemplate(
        '{context}\n\nQuestion: {question}',
      );
      final llmChain = LLMChain(prompt: prompt, llm: model);
      final stuffChain = StuffDocumentsChain(
        llmChain: llmChain,
        documentVariableName: 'context',
      );

      final retrievalQA = RetrievalQAChain(
        retriever: retriever,
        combineDocumentsChain: stuffChain,
      );

      const query = 'What did I say?';
      final res = await retrievalQA.call({
        'query': query,
      });
      expect(res['query'], query);
      expect(
        res['result'],
        "what's this\n\nbye\n\nhi\n\nhello\n\nQuestion: What did I say?",
      );
    });
  });
}

class _FakeEmbeddings implements Embeddings {
  _FakeEmbeddings();

  @override
  Future<List<double>> embedQuery(
    final String query,
  ) async {
    return [0, 1];
  }

  @override
  Future<List<List<double>>> embedDocuments(
    final List<String> documents,
  ) async {
    return List.generate(documents.length, (final i) => [0, 1 / i]);
  }
}
