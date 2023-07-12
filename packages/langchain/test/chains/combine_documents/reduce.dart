import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('ReduceDocumentsChain tests', () {
    test('Test reduce', () async {
      final llm = FakeListLLM(
        responses: [
          // Summarize this content: Hello 1!\n\nHello 2!\n\nHello 3!\n\nHello 4!
          'Hello 1234!',
        ],
      );

      final finalPrompt = PromptTemplate.fromTemplate(
        'Summarize this content: {context}',
      );
      final finalLlmChain = LLMChain(prompt: finalPrompt, llm: llm);
      final combineDocsChain = StuffDocumentsChain(llmChain: finalLlmChain);

      final reduceChain = ReduceDocumentsChain(
        combineDocumentsChain: combineDocsChain,
      );

      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
        Document(pageContent: 'Hello 3!'),
        Document(pageContent: 'Hello 4!'),
      ];
      final res = await reduceChain.run(docs);
      expect(res, 'Hello 1234!');
    });

    test('Test reduce and collapse', () async {
      final llm = FakeListLLM(
        responses: [
          // Collapse this content: Hello 1!\n\nHello 2!\n\nHello 3!
          'Hello 123!',
          // Collapse this content: Hello 4!
          'Hello 4!',
          // Summarize this content: Hello 123!\n\nHello 4!
          'Hello 1234!',
        ],
      );

      final finalPrompt = PromptTemplate.fromTemplate(
        'Summarize this content: {context}',
      );
      final finalLlmChain = LLMChain(prompt: finalPrompt, llm: llm);
      final combineDocsChain = StuffDocumentsChain(llmChain: finalLlmChain);

      final collapsePrompt = PromptTemplate.fromTemplate(
        'Collapse this content: {context}',
      );
      final collapseLlmChain = LLMChain(prompt: collapsePrompt, llm: llm);
      final collapseDocsChain = StuffDocumentsChain(llmChain: collapseLlmChain);

      final reduceChain = ReduceDocumentsChain(
        combineDocumentsChain: combineDocsChain,
        collapseDocumentsChain: collapseDocsChain,
        tokenMax: 7,
      );

      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
        Document(pageContent: 'Hello 3!'),
        Document(pageContent: 'Hello 4!'),
      ];
      final res = await reduceChain.run(docs);
      expect(res, 'Hello 1234!');
    });
  });
}
