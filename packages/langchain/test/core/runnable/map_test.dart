// ignore_for_file: unused_element
import 'package:collection/collection.dart';
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMap tests', () {
    test('RunnableMap with multiple branches', () async {
      final prompt1 = PromptTemplate.fromTemplate('Hello {input}!');
      final prompt2 = PromptTemplate.fromTemplate('Bye {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
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

    test('Streaming RunnableMap', () async {
      final prompt1 = PromptTemplate.fromTemplate('Hello {input}!');
      final prompt2 = PromptTemplate.fromTemplate('Bye {input}!');
      const model = FakeEchoLLM();
      const outputParser = StringOutputParser<String>();
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
          .whereNotNull()
          .join();
      final right = streamList
          .map((final it) => it['right']) //
          .whereNotNull()
          .join();

      expect(left, 'Hello world!');
      expect(right, 'Bye world!');
    });
  });
}
