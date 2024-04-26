// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/documents.dart';
import 'package:langchain_core/language_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/retrievers.dart';
import 'package:langchain_core/tools.dart';
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

    test('Streaming LLM', () async {
      const run = FakeEchoLLM();
      final stream = run.stream(PromptValue.string('Hello world!'));

      final streamList = await stream.toList();
      expect(streamList.length, 12);
      expect(streamList, isA<List<LLMResult>>());

      final res = streamList.map((final i) => i.output).join();

      expect(res, 'Hello world!');
    });

    test('Streaming ChatModel', () async {
      const run = FakeEchoChatModel();
      final stream = run.stream(PromptValue.string('Hello world!'));

      final streamList = await stream.toList();
      expect(streamList.length, 12);
      expect(streamList, isA<List<ChatResult>>());

      final res = streamList.map((final i) => i.output.content).join();
      expect(res, 'Hello world!');
    });

    test('Streaming OutputParser', () async {
      const run = StringOutputParser();
      final stream = run.stream(
        const LLMResult(
          id: 'id',
          output: 'Hello world!',
          finishReason: FinishReason.stop,
          metadata: {},
          usage: LanguageModelUsage(),
        ),
      );

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final res = streamList.first;
      expect(res, 'Hello world!');
    });

    test('Streaming Tool', () async {
      final run = FakeTool();
      final stream = run.stream({'input': 'hello'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final res = streamList.first;
      expect(res, 'hello');
    });
  });

  test('Test call to PromptTemplate from streaming input', () async {
    final inputStream = Stream.fromIterable([
      {'input': 'H'},
      {'input': 'e'},
      {'input': 'l'},
      {'input': 'l'},
      {'input': 'o'},
      {'input': ' '},
      {'input': 'W'},
      {'input': 'o'},
      {'input': 'r'},
      {'input': 'l'},
      {'input': 'd'},
    ]);

    final promptTemplate = PromptTemplate.fromTemplate(
      'Spell the following text {input}',
    );

    final stream = promptTemplate.streamFromInputStream(inputStream);
    int count = 0;
    PromptValue output = PromptValue.string('');
    await stream.forEach((final i) {
      count++;
      output = output.concat(i);
    });
    expect(count, 1);
    expect(output, PromptValue.string('Spell the following text Hello World'));
  });

  test('Test call to ChatPromptTemplate from streaming input', () async {
    final inputStream = Stream.fromIterable([
      {'input': 'H'},
      {'input': 'e'},
      {'input': 'l'},
      {'input': 'l'},
      {'input': 'o'},
      {'input': ' '},
      {'input': 'W'},
      {'input': 'o'},
      {'input': 'r'},
      {'input': 'l'},
      {'input': 'd'},
    ]);

    final promptTemplate = ChatPromptTemplate.fromTemplate(
      'Spell the following text {input}',
    );

    final stream = promptTemplate.streamFromInputStream(inputStream);
    int count = 0;
    PromptValue output = PromptValue.chat([ChatMessage.humanText('')]);
    await stream.forEach((final i) {
      count++;
      output = output.concat(i);
    });
    expect(count, 1);
    expect(
      output,
      PromptValue.chat(
        [ChatMessage.humanText('Spell the following text Hello World')],
      ),
    );
  });

  test('Test call to LLM from streaming input', () async {
    final inputStream = Stream.fromIterable([
      PromptValue.string('H'),
      PromptValue.string('e'),
      PromptValue.string('l'),
      PromptValue.string('l'),
      PromptValue.string('o'),
      PromptValue.string(' '),
      PromptValue.string('W'),
      PromptValue.string('o'),
      PromptValue.string('r'),
      PromptValue.string('l'),
      PromptValue.string('d'),
    ]);

    const llm = FakeEchoLLM();
    final stream = llm.streamFromInputStream(inputStream);
    int count = 0;
    LLMResult? output;
    await stream.forEach((final LLMResult i) {
      count++;
      output = output?.concat(i) ?? i;
    });
    expect(count, 11);
    expect(output?.output, 'Hello World');
  });

  test('Test call to ChatModel from streaming input', () async {
    final inputStream = Stream.fromIterable([
      PromptValue.chat([ChatMessage.humanText('H')]),
      PromptValue.chat([ChatMessage.humanText('e')]),
      PromptValue.chat([ChatMessage.humanText('l')]),
      PromptValue.chat([ChatMessage.humanText('l')]),
      PromptValue.chat([ChatMessage.humanText('o')]),
      PromptValue.chat([ChatMessage.humanText(' ')]),
      PromptValue.chat([ChatMessage.humanText('W')]),
      PromptValue.chat([ChatMessage.humanText('o')]),
      PromptValue.chat([ChatMessage.humanText('r')]),
      PromptValue.chat([ChatMessage.humanText('l')]),
      PromptValue.chat([ChatMessage.humanText('d')]),
    ]);

    const chatModel = FakeEchoChatModel();
    final stream = chatModel.streamFromInputStream(inputStream);
    int count = 0;
    ChatResult? output;
    await stream.forEach((final ChatResult i) {
      count++;
      output = output?.concat(i) ?? i;
    });
    expect(count, 11);
    expect(output?.output.content, 'Hello World');
  });

  test('Test call to Tool from streaming input', () async {
    final inputStream = Stream.fromIterable([
      {'input': 'H'},
      {'input': 'e'},
      {'input': 'l'},
      {'input': 'l'},
      {'input': 'o'},
      {'input': ' '},
      {'input': 'W'},
      {'input': 'o'},
      {'input': 'r'},
      {'input': 'l'},
      {'input': 'd'},
    ]);

    final tool = FakeTool();
    final stream = tool.streamFromInputStream(inputStream);
    int count = 0;
    String? output;
    await stream.forEach((final String i) {
      count++;
      output = i;
    });
    expect(count, 1);
    expect(output, 'Hello World');
  });

  test('Test call to Retriever from streaming input', () async {
    final inputStream = Stream.fromIterable([
      'H',
      'e',
      'l',
      'l',
      'o',
      ' ',
      'W',
      'o',
      'r',
      'l',
      'd',
    ]);

    const doc = Document(
      id: '1',
      pageContent: 'Hello World',
    );
    const retriever = FakeRetriever([doc]);
    final stream = retriever.streamFromInputStream(inputStream);
    int count = 0;
    List<Document>? output;
    await stream.forEach((final List<Document> i) {
      count++;
      output = i;
    });
    expect(count, 1);
    expect(output, [doc]);
  });
}
