import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/model_io/chat_models/fake.dart';
import 'package:langchain/src/model_io/language_models/language_models.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('StuffDocumentsChain tests', () {
    Future<void> testStuffDocumentsChain(final BaseLanguageModel model) async {
      final prompt = PromptTemplate.fromTemplate(
        'Print {foo}. Context: {context}',
      );
      final llmChain = LLMChain(prompt: prompt, llm: model);
      final stuffChain = StuffDocumentsChain(llmChain: llmChain);

      const foo = 'Hello world!';
      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
      ];
      final res = await stuffChain.call({
        'foo': foo,
        'input_documents': docs,
      });
      expect(res['foo'], foo);
      expect(res[StuffDocumentsChain.defaultInputKey], docs);
      expect(
        res[StuffDocumentsChain.defaultOutputKey],
        'Print Hello world!. Context: Hello 1!\n\nHello 2!',
      );
    }

    test('Test StuffDocumentsChain with LLM', () async {
      const model = FakeEchoLLM();
      await testStuffDocumentsChain(model);
    });

    test('Test StuffDocumentsChain with Chat model', () async {
      const model = FakeEchoChatModel();
      await testStuffDocumentsChain(model);
    });

    test('Test promptLength', () async {
      const model = FakeEchoLLM();
      final prompt = PromptTemplate.fromTemplate(
        'Print {foo}. Context: {context}',
      );
      final llmChain = LLMChain(prompt: prompt, llm: model);
      final stuffChain = StuffDocumentsChain(llmChain: llmChain);

      const foo = 'Hello world!';
      const docs = [
        Document(pageContent: 'Hello 1!'),
        Document(pageContent: 'Hello 2!'),
      ];

      final tokens = await stuffChain.promptLength(docs, inputs: {'foo': foo});
      expect(tokens, 7);
    });
  });
}
