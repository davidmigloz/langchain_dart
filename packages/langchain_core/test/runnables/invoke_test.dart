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
  group('Runnable invoke tests', () {
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

    test('LLM as Runnable', () async {
      const run = FakeEchoLLM();
      final res = await run.invoke(PromptValue.string('Hello world!'));
      expect(res.output, 'Hello world!');
    });

    test('ChatModel as Runnable', () async {
      const run = FakeEchoChatModel();
      final res = await run.invoke(PromptValue.string('Hello world!'));
      expect(res.output.content, 'Hello world!');
    });

    test('OutputParser as Runnable', () async {
      const run = StringOutputParser();
      final res = await run.invoke(
        const LLMResult(
          id: 'id',
          output: 'Hello world!',
          finishReason: FinishReason.stop,
          metadata: {},
          usage: LanguageModelUsage(),
        ),
      );
      expect(res, 'Hello world!');
    });

    test('Tool as Runnable', () async {
      final run = FakeTool();
      final res = await run.invoke('hello');
      expect(res, 'hello');
    });
  });
}
