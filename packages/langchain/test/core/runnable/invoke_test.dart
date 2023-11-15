// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('Runnable tests', () {
    test('PromptTemplate as Runnable', () async {
      final run = PromptTemplate.fromTemplate('This is a {input}');
      final res = await run.invoke({'input': 'test'});
      expect(res.toString(), equals('This is a test'));
    });

    test('ChatPromptTemplate as Runnable', () async {
      final run = ChatPromptTemplate.fromPromptMessages([
        SystemChatMessagePromptTemplate.fromTemplate(
          'You are a helpful chatbot',
        ),
        HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      ]);
      final res = await run.invoke({'input': 'test'});
      expect(
        res.toChatMessages(),
        equals([
          ChatMessage.system('You are a helpful chatbot'),
          ChatMessage.humanText('test'),
        ]),
      );
    });

    test('Retriever as Runnable', () async {
      const doc = Document(
        id: '1',
        pageContent: 'This is a test',
      );
      const run = FakeRetriever([doc]);
      final res = await run.invoke('test');
      expect(
        res,
        equals([doc]),
      );
    });

    test('DocumentTransformer as Runnable', () async {
      const run = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );
      final res = await run.invoke([
        const Document(pageContent: 'foo bar baz 123'),
      ]);
      expect(
        res,
        equals([
          const Document(pageContent: 'foo bar'),
          const Document(pageContent: 'bar baz'),
          const Document(pageContent: 'baz 123'),
        ]),
      );
    });

    test('LLM as Runnable', () async {
      const run = FakeEchoLLM();
      final res = await run.invoke(PromptValue.string('Hello world!'));
      expect(res.firstOutputAsString, 'Hello world!');
    });

    test('ChatModel as Runnable', () async {
      const run = FakeEchoChatModel();
      final res = await run.invoke(PromptValue.string('Hello world!'));
      expect(res.firstOutputAsString, 'Hello world!');
    });

    test('Chain as Runnable', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final run = LLMChain(prompt: prompt, llm: model);
      final res = await run.invoke({'foo': 'Hello world!'});
      expect(res[LLMChain.defaultOutputKey], 'Hello world!');
    });

    test('OutputParser as Runnable', () async {
      const run = StringOutputParser();
      final res = await run.invoke(
        const LLMResult(
          generations: [LLMGeneration('Hello world!')],
        ),
      );
      expect(res, 'Hello world!');
    });

    test('Tool as Runnable', () async {
      final run = CalculatorTool();
      final res = await run.invoke({'input': '1+1'});
      expect(res, '2.0');
    });
  });
}
