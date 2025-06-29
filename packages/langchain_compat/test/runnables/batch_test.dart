// ignore_for_file: unused_element
import 'package:langchain_compat/chat_models.dart';
import 'package:langchain_compat/documents.dart';
import 'package:langchain_compat/language_models.dart';
import 'package:langchain_compat/llms.dart';
import 'package:langchain_compat/output_parsers.dart';
import 'package:langchain_compat/prompts.dart';
import 'package:langchain_compat/retrievers.dart';
import 'package:langchain_compat/tools.dart';
import 'package:test/test.dart';

void main() {
  group('Runnable batch tests', () {
    test('PromptTemplate batch', () async {
      final run = PromptTemplate.fromTemplate('This is a {input}');
      final res = await run.batch([
        {'input': 'test1'},
        {'input': 'test2'},
        {'input': 'test3'},
      ]);
      expect(
        res.map((final e) => e.toString()).toList(),
        equals(['This is a test1', 'This is a test2', 'This is a test3']),
      );
    });

    test('ChatPromptTemplate batch', () async {
      final run = ChatPromptTemplate.fromPromptMessages([
        SystemChatMessagePromptTemplate.fromTemplate(
          'You are a helpful chatbot',
        ),
        HumanChatMessagePromptTemplate.fromTemplate('{input}'),
      ]);
      final res = await run.batch([
        {'input': 'test1'},
        {'input': 'test2'},
        {'input': 'test3'},
      ]);
      expect(
        res.map((final e) => e.toChatMessages()).toList(),
        equals([
          [
            ChatMessage.system('You are a helpful chatbot'),
            ChatMessage.humanText('test1'),
          ],
          [
            ChatMessage.system('You are a helpful chatbot'),
            ChatMessage.humanText('test2'),
          ],
          [
            ChatMessage.system('You are a helpful chatbot'),
            ChatMessage.humanText('test3'),
          ],
        ]),
      );
    });

    test('Retriever batch', () async {
      const doc = Document(id: '1', pageContent: 'This is a test');
      const run = FakeRetriever([doc]);
      final res = await run.batch(['test1', 'test2', 'test3']);
      expect(
        res.map((final e) => e).toList(),
        equals([
          [doc],
          [doc],
          [doc],
        ]),
      );
    });

    test('LLM batch', () async {
      final run = FakeLLM(responses: ['test1', 'test2', 'test3']);
      final res = await run.batch([
        PromptValue.string('test1'),
        PromptValue.string('test2'),
        PromptValue.string('test3'),
      ]);
      expect(
        res.map((final e) => e.output).toList(),
        equals(['test1', 'test2', 'test3']),
      );
    });

    test('ChatModel batch', () async {
      final run = FakeChatModel(responses: ['test1', 'test2', 'test3']);
      final res = await run.batch([
        PromptValue.string('test1'),
        PromptValue.string('test2'),
        PromptValue.string('test3'),
      ]);
      expect(
        res.map((final e) => e.output.content).toList(),
        equals(['test1', 'test2', 'test3']),
      );
    });

    test('OutputParser batch', () async {
      final results = List.generate(
        3,
        (final i) => LLMResult(
          id: 'id$i',
          output: 'Hello world! $i',
          finishReason: FinishReason.stop,
          metadata: const {},
          usage: const LanguageModelUsage(),
        ),
      );
      const run = StringOutputParser();
      final res = await run.batch(results);
      expect(
        res,
        equals(['Hello world! 0', 'Hello world! 1', 'Hello world! 2']),
      );
    });

    test('Tool batch', () async {
      final run = FakeTool();
      final res = await run.batch(['hello1', 'hello2', 'hello3']);
      expect(
        res.map((final e) => e).toList(),
        equals(['hello1', 'hello2', 'hello3']),
      );
    });
  });
}
