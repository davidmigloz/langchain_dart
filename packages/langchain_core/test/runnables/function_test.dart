// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableFunction tests', () {
    test('Invoke RunnableFunction', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatResult>();
      final chain = prompt |
          model |
          outputParser |
          Runnable.fromFunction<String, int>(
            invoke: (final input, final options) => input.length,
          );

      final res = await chain.invoke({'input': 'world'});
      expect(res, 12);
    });

    test('Streaming RunnableFunction', () async {
      final function = Runnable.fromFunction<String, int>(
        invoke: (final input, final options) => input.length,
      );
      final stream = function.stream('world');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<int>());

      final item = streamList.first;
      expect(item, 5);
    });

    test('Streaming input RunnableFunction', () async {
      final function = Runnable.fromFunction<String, int>(
        invoke: (final input, final options) => input.length,
      );
      final stream = function.streamFromInputStream(
        Stream.fromIterable(['w', 'o', 'r', 'l', 'd']),
      );

      final streamList = await stream.toList();
      expect(streamList.length, 5);
      expect(streamList, [1, 1, 1, 1, 1]);
    });

    test('Separate logic for invoke and stream', () async {
      final function = Runnable.fromFunction<String, int>(
        invoke: (final input, final options) => input.length,
        stream: (final inputStream, final options) async* {
          final input = (await inputStream.toList()).reduce((a, b) => a + b);
          yield input.length;
        },
      );

      final invokeRes = await function.invoke('world');
      expect(invokeRes, 5);
      final streamRes = await function
          .streamFromInputStream(Stream.fromIterable(['w', 'o', 'r', 'l', 'd']))
          .toList();
      expect(streamRes, [5]);
    });
  });
}
