// ignore_for_file: unnecessary_async

import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMapInput tests', () {
    test('Invoke RunnableMapInput', () async {
      final chain =
          Runnable.mapInput<Map<String, dynamic>, Map<String, dynamic>>(
            (final input) => {'input': '${input['foo']}${input['bar']}'},
          );

      final res = await chain.invoke({'foo': 'foo1', 'bar': 'bar1'});
      expect(res, {'input': 'foo1bar1'});
    });

    test('Invoke async RunnableMapInput', () async {
      Future<int> asyncFunc(final Map<String, dynamic> input) async {
        await Future<void>.delayed(const Duration(milliseconds: 100));
        return input.length;
      }

      final chain = Runnable.mapInput<Map<String, dynamic>, int>(
        (final input) async => asyncFunc(input),
      );

      final res = await chain.invoke({'foo': 'foo1', 'bar': 'bar1'});
      expect(res, 2);
    });

    test('Streaming RunnableMapInput', () async {
      final chain =
          Runnable.mapInput<Map<String, dynamic>, Map<String, dynamic>>(
            (final input) => {'input': '${input['foo']}${input['bar']}'},
          );
      final stream = chain.stream({'foo': 'foo1', 'bar': 'bar1'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);

      final item = streamList.first;
      expect(item, {'input': 'foo1bar1'});
    });

    test('Streaming input RunnableMapInput', () async {
      final chain = Runnable.mapInput<String, int>(
        (final input) => input.length,
      );
      final stream = chain.streamFromInputStream(
        Stream.fromIterable(['w', 'o', 'r', 'l', 'd']),
      );

      final streamList = await stream.toList();
      expect(streamList, [1, 1, 1, 1, 1]);
    });
  });
}
