import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('LLMChain tests', () {
    test('Test LLMChain call', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.call({'foo': 'Hello world!'});
      expect(res[LLMChain.defaultOutputKey], 'Hello world!');
      expect(res['foo'], 'Hello world!');
    });

    test('Test LLMChain call single value', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.call('Hello world!');
      expect(res[LLMChain.defaultOutputKey], 'Hello world!');
      expect(res['foo'], 'Hello world!');
    });

    test('Test LLMChain call returnOnlyOutputs true', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.call(
        {'foo': 'Hello world!, ', 'bar': 'again!'},
        returnOnlyOutputs: true,
      );
      expect(res.length, 1);
      expect(res[LLMChain.defaultOutputKey], 'Hello world! again!');
    });

    test('Test LLMChain outputKey', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar}');
      final chain = LLMChain(prompt: prompt, llm: model, outputKey: 'xxx');
      final res = await chain.call(
        {'foo': 'Hello world!, ', 'bar': 'again!'},
        returnOnlyOutputs: true,
      );
      expect(res.length, 1);
      expect(res['xxx'], 'Hello world! again!');
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

    test('Test LLMChain throws error with less input values', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar} {baz}');
      final chain = LLMChain(prompt: prompt, llm: model);
      expect(
        () async => chain.run({'foo': 'Hello world!, ', 'bar': 'again!'}),
        throwsArgumentError,
      );
    });

    test('Test LLMChain throws error with wrong input values', () async {
      final model = FakeListLLM(responses: ['Hello world! again!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo} {bar}');
      final chain = LLMChain(prompt: prompt, llm: model);
      expect(
        () async => chain.run({'foo': 'Hello world!, ', 'sun': 'again!'}),
        throwsArgumentError,
      );
    });

    test('Test LLMChain with chat model', () async {
      final model = FakeChatModel(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final chain = LLMChain(prompt: prompt, llm: model);
      final res = await chain.call({'foo': 'Hello world!'});
      expect(res[LLMChain.defaultOutputKey], ChatMessage.ai('Hello world!'));
      expect(res['foo'], 'Hello world!');
    });
  });
}
