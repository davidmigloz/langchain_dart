import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/model_io/chat_models/fake.dart';
import 'package:langchain/src/model_io/language_models/language_models.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('MapReduceDocumentsChain tests', () {
    Future<void> testMapReduceDocumentsChain(
      final BaseLanguageModel model,
    ) async {
      final mapPrompt = PromptTemplate.fromTemplate(
        'Summarize this content: {context}',
      );
      final mapLlmChain = LLMChain(prompt: mapPrompt, llm: model);

      final reducePrompt = PromptTemplate.fromTemplate(
        'Combine these summaries: {context}',
      );
      final reduceLlmChain = LLMChain(prompt: reducePrompt, llm: model);
      final reduceDocsChain = StuffDocumentsChain(llmChain: reduceLlmChain);

      final reduceChain = MapReduceDocumentsChain(
        mapLlmChain: mapLlmChain,
        reduceDocumentsChain: reduceDocsChain,
        returnIntermediateSteps: true,
      );

      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
        Document(pageContent: 'Hello 3!'),
      ];
      final res = await reduceChain(docs);
      expect(res[MapReduceDocumentsChain.defaultOutputKey], 'Hello 123!');
      expect(
        res[MapReduceDocumentsChain.intermediateStepsOutputKey],
        ['1', '2', '3'],
      );
    }

    test('Test MapReduceDocumentsChain with LLM', () async {
      final model = FakeListLLM(
        responses: [
          // Summarize this content: Hello 1!
          '1',
          // Summarize this content: Hello 2!
          '2',
          // Summarize this content: Hello 3!
          '3',
          // Combine these summaries: 123
          'Hello 123!',
        ],
      );
      await testMapReduceDocumentsChain(model);
    });

    test('Test MapReduceDocumentsChain with Chat model', () async {
      final model = FakeChatModel(
        responses: [
          // Summarize this content: Hello 1!
          '1',
          // Summarize this content: Hello 2!
          '2',
          // Summarize this content: Hello 3!
          '3',
          // Combine these summaries: 123
          'Hello 123!',
        ],
      );
      await testMapReduceDocumentsChain(model);
    });
  });
}
