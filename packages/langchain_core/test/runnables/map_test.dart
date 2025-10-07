// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMap tests', () {
    test('RunnableMap with multiple branches', () async {
      final prompt1 = PromptTemplate.fromTemplate('Hello {input}!');
      final prompt2 = PromptTemplate.fromTemplate('Bye {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatResult>();
      final chain = Runnable.fromMap({
        'left': prompt1 | model | outputParser,
        'right': prompt2 | model | outputParser,
      });

      final res = await chain.invoke({'input': 'world'});
      expect(
        res,
        {'left': 'Hello world!', 'right': 'Bye world!'},
      );
    });

    test('RunnableMap runs tasks in parallel', () async {
      final longTask = Runnable.fromFunction(
        invoke: (_, __) async {
          await Future<void>.delayed(const Duration(seconds: 2));
          return 'long';
        },
      );
      final shortTask = Runnable.fromFunction(
        invoke: (_, __) async {
          await Future<void>.delayed(const Duration(seconds: 1));
          return 'short';
        },
      );

      final chain = Runnable.fromMap({
        'long': longTask,
        'short': shortTask,
      });

      final stopwatch = Stopwatch()..start();
      final result = await chain.invoke({});
      stopwatch.stop();

      expect(stopwatch.elapsed, lessThan(const Duration(seconds: 3)));
      expect(result['long'], 'long');
      expect(result['short'], 'short');
    });

    test('Streaming RunnableMap', () async {
      final prompt1 = PromptTemplate.fromTemplate('Hello {input}!');
      final prompt2 = PromptTemplate.fromTemplate('Bye {input}!');
      const model = FakeEchoLLM();
      const outputParser = StringOutputParser<LLMResult>();
      final chain = Runnable.fromMap({
        'left': prompt1 | model | outputParser,
        'right': prompt2 | model | outputParser,
      });
      final stream = chain.stream({'input': 'world'});

      final streamList = await stream.toList();
      expect(streamList.length, 22);
      expect(streamList, isA<List<Map<String, dynamic>>>());

      final left = streamList
          .map((final it) => it['left']) //
          .nonNulls
          .join();
      final right = streamList
          .map((final it) => it['right']) //
          .nonNulls
          .join();

      expect(left, 'Hello world!');
      expect(right, 'Bye world!');
    });
  });
}
