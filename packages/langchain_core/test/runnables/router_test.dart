import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:langchain_core/src/output_parsers/output_parsers.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableRouter tests', () {
    test('RunnableRouter invoke', () async {
      final add = Runnable.mapInput((int x) => x + 1);
      final subtract = Runnable.mapInput((int x) => x - 1);

      final router = Runnable.fromRouter(
        (int x, options) => switch (x) {
          > 0 => add,
          _ => subtract,
        },
      );

      final result = await router.invoke(1);
      expect(result, equals(2));
      final result2 = await router.invoke(-1);
      expect(result2, equals(-2));
    });

    test('RunnableRouter batch', () async {
      final add = Runnable.mapInput((int x) => x + 1);
      final multiply = Runnable.mapInput((int x) => x * 10);
      final subtract = Runnable.mapInput((int x) => x - 1);

      final router = Runnable.fromRouter(
        (int x, options) => switch (x) {
          > 0 && < 5 => add,
          > 5 => multiply,
          _ => subtract,
        },
      );

      final batchResult = await router.batch([1, 10, 0]);
      expect(batchResult, equals([2, 100, -1]));
    });

    test('RunnableRouter stream', () async {
      final promptTemplate = ChatPromptTemplate.fromTemplate('{question}');
      const model = FakeEchoChatModel();

      final classificationChain = promptTemplate
          .pipe(model)
          .pipe(const StringOutputParser());
      final generalChain = ChatPromptTemplate.fromTemplate(
        'GENERAL CHAIN',
      ).pipe(model).pipe(const StringOutputParser());
      final langChainChain = ChatPromptTemplate.fromTemplate(
        'LANGCHAIN CHAIN',
      ).pipe(model).pipe(const StringOutputParser());

      final router = Runnable.fromRouter((Map<String, dynamic> input, _) {
        final topic = (input['topic'] as String).toLowerCase();
        return switch (topic.contains('langchain')) {
          true => langChainChain,
          false => generalChain,
        };
      });

      final fullChain = Runnable.fromMap({
        'topic': classificationChain,
        'question': Runnable.getItemFromMap('question'),
      }).pipe(router).pipe(const StringOutputParser());

      final stream1 = fullChain.stream({
        'question': 'How do I use langchain? Explain in one sentence',
      });
      var output1 = '';
      await for (final chunk in stream1) {
        output1 += chunk;
      }
      expect(output1.length, greaterThan(1));
      expect(output1, contains('LANGCHAIN'));

      final stream2 = fullChain.stream({
        'question': 'What is up? Explain in one sentence',
      });
      var output2 = '';
      await for (final chunk in stream2) {
        output2 += chunk;
      }
      expect(output2.length, greaterThan(1));
      expect(output2, contains('GENERAL CHAIN'));
    });
  });
}
