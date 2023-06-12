import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('LLMChain tests', () {
    test('Test LLMChain call', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.call({'foo': 'Hello world!'});
      expect(res['text'], 'Hello world!');
    });

    test('Test LLMChain run', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.run('Hello world!');
      expect(res, 'Hello world!');
    });
  });
}
