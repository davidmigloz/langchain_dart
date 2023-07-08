import 'package:langchain/src/chains/chains.dart';
import 'package:langchain/src/documents/documents.dart';
import 'package:langchain/src/model_io/llms/fake.dart';
import 'package:langchain/src/model_io/prompts/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('StuffDocumentsChain tests', () {
    test('Test LLMChain call', () async {
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
      final res = await stuffChain.call({
        'foo': foo,
        'input_documents': docs,
      });
      expect(res['foo'], foo);
      expect(res['input_documents'], docs);
      expect(
        res['output_text'],
        'Print Hello world!. Context: Hello 1!\n\nHello 2!',
      );
    });
  });
}
