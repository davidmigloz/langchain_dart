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

    test('Test LLMChain run single input value', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.run('Hello world!');
      expect(res, 'Hello world!');
    });

    test('Test LLMChain run multiple input values', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.run({'foo': 'Hello world!, ', 'bar': 'again!'});
      expect(res, 'Hello world! again!');
    });

    test('Test LLMChain throws error with wrong input values', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar} {baz}');
      final chain = LLMChain(prompt: prompt, llm: model);
      // Expect ArgumentError
      expect(
        () async => chain.run({'foo': 'Hello world!, ', 'bar': 'again!'}),
        throwsArgumentError,
      );
    });
  });
}
