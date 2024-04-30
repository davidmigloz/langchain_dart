import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMapInputStream tests', () {
    test('Invoking RunnableMapInputStream', () async {
      final chain = Runnable.mapInputStream<String, int>((final inputStream) {
        return inputStream.map((final input) => input.length);
      });

      final res = await chain.invoke('world');

      expect(res, 5);
    });

    test('Streaming RunnableMapInputStream', () async {
      final chain = Runnable.mapInputStream<String, int>((final inputStream) {
        return inputStream.map((final input) => input.length);
      });
      final stream = chain.stream('world');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<int>());

      final item = streamList.first;
      expect(item, 5);
    });

    test('Streaming input RunnableMapInputStream', () async {
      final chain = Runnable.mapInputStream<String, int>((final inputStream) {
        return inputStream.map((final input) => input.length);
      });
      final stream = chain.streamFromInputStream(
        Stream.fromIterable(['w', 'or', 'l', 'd']),
      );

      final streamList = await stream.toList();
      expect(streamList, [1, 2, 1, 1]);
    });
  });
}
