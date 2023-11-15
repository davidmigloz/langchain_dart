// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('Runnable stream tests', () {
    test('Test streaming PromptTemplate', () async {
      final run = PromptTemplate.fromTemplate('This is a {input}');
      final stream = run.stream({'input': 'test'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<StringPromptValue>());

      final item = streamList.first;
      expect(item.toString(), 'This is a test');
    });

    test('Test streaming ChatPromptTemplate', () async {
      final run = ChatPromptTemplate.fromPromptMessages([
        SystemChatMessagePromptTemplate.fromTemplate(
          'You are a helpful chatbot',
        ),
        HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      ]);
      final stream = run.stream({'input': 'test'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<ChatPromptValue>());

      final item = streamList.first;
      expect(
        item.toChatMessages(),
        equals([
          ChatMessage.system('You are a helpful chatbot'),
          ChatMessage.humanText('test'),
        ]),
      );
    });

    test('Test streaming', () async {
      const doc = Document(
        id: '1',
        pageContent: 'This is a test',
      );
      const run = FakeRetriever([doc]);
      final stream = run.stream('test');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<List<Document>>());

      final item = streamList.first;
      expect(item, [doc]);
    });

    test('Streaming DocumentTransformer', () async {
      const run = CharacterTextSplitter(
        separator: ' ',
        chunkSize: 7,
        chunkOverlap: 3,
      );
      final stream = run.stream([
        const Document(pageContent: 'foo bar baz 123'),
      ]);

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<List<Document>>());

      final item = streamList.first;
      expect(
        item,
        [
          const Document(pageContent: 'foo bar'),
          const Document(pageContent: 'bar baz'),
          const Document(pageContent: 'baz 123'),
        ],
      );
    });

    test('Streaming LLM', () async {
      const run = FakeEchoLLM();
      final stream = run.stream(PromptValue.string('Hello world!'));

      final streamList = await stream.toList();
      expect(streamList.length, 12);
      expect(streamList, isA<List<LLMResult>>());

      final res = streamList.map((final i) => i.firstOutputAsString).join();

      expect(res, 'Hello world!');
    });

    test('Streaming ChatModel', () async {
      const run = FakeEchoChatModel();
      final stream = run.stream(PromptValue.string('Hello world!'));

      final streamList = await stream.toList();
      expect(streamList.length, 12);
      expect(streamList, isA<List<ChatResult>>());

      final res = streamList.map((final i) => i.firstOutputAsString).join();
      expect(res, 'Hello world!');
    });

    test('Streaming Chain', () async {
      final model = FakeListLLM(responses: ['Hello world!']);
      final prompt = PromptTemplate.fromTemplate('Print {foo}');
      final run = LLMChain(prompt: prompt, llm: model);
      final stream = run.stream({'foo': 'Hello world!'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<Map<String, dynamic>>());

      final res = streamList.first;
      expect(res[LLMChain.defaultOutputKey], 'Hello world!');
    });

    test('Streaming OutputParser', () async {
      const run = StringOutputParser();
      final stream = run.stream(
        const LLMResult(
          generations: [LLMGeneration('Hello world!')],
        ),
      );

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final res = streamList.first;
      expect(res, 'Hello world!');
    });

    test('Streaming Tool', () async {
      final run = CalculatorTool();
      final stream = run.stream({'input': '1+1'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final res = streamList.first;
      expect(res, '2.0');
    });
  });
}
