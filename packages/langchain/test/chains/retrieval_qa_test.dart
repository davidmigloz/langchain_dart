import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
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
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      await vectorStore.addDocuments(documents: documents);
      final retriever = VectorStoreRetriever(vectorStore: vectorStore);

      const model = FakeEchoLLM();
      final prompt = PromptTemplate.fromTemplate(
        '{context}\n\nQuestion: {question}',
      );
      final llmChain = LLMChain(prompt: prompt, llm: model);
      final stuffChain = StuffDocumentsChain(llmChain: llmChain);

      final retrievalQA = RetrievalQAChain(
        retriever: retriever,
        combineDocumentsChain: stuffChain,
      );

      const query = 'What did I say?';
      final res = await retrievalQA({'query': query});
      expect(res['query'], query);
      expect(
        res['result'],
        "what's this\n\nbye\n\nhi\n\nhello\n\nQuestion: What did I say?",
      );
    });

    test('Test RetrievalQAChain.fromLlm', () async {
      final documents = [
        const Document(pageContent: 'hello'),
        const Document(pageContent: 'hi'),
        const Document(pageContent: 'bye'),
        const Document(pageContent: "what's this"),
      ];
      final embeddings = _FakeEmbeddings();
      final vectorStore = MemoryVectorStore(embeddings: embeddings);
      await vectorStore.addDocuments(documents: documents);
      final retriever = VectorStoreRetriever(vectorStore: vectorStore);

      const llm = FakeEchoLLM();
      final retrievalQA = RetrievalQAChain.fromLlm(
        llm: llm,
        retriever: retriever,
      );

      const query = 'What did I say?';
      final res = await retrievalQA({'query': query});

      const expectedRes = '''
Use the following pieces of context to answer the question at the end. If you don't know the answer, just say that you don't know, don't try to make up an answer.

what's this

bye

hi

hello

Question: What did I say?
Helpful Answer:''';

      expect(res['query'], query);
      expect(res['result'], expectedRes);
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
    final List<Document> documents,
  ) async {
    return List.generate(documents.length, (final i) => [0, 1 / i]);
  }
}
