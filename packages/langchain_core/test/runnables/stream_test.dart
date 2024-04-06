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
}
