// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableFunction tests', () {
    test('RunnableFunction from Runnable.fromFunction', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = prompt |
          model |
          outputParser |
          Runnable.fromFunction<String, int>(
            (final input, final options) => input.length,
          );

      final res = await chain.invoke({'input': 'world'});
      expect(res, 12);
    });

    test('Streaming RunnableFunction', () async {
      final function = Runnable.fromFunction<String, int>(
        (final input, final options) => input.length,
      );
      final stream = function.stream('world');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<int>());

      final item = streamList.first;
      expect(item, 5);
    });
  });
}
