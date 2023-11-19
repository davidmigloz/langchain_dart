// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableItemFromMap tests', () {
    test('RunnableItemFromMap from Runnable.getItemFromMap', () async {
      final chain = Runnable.getItemFromMap('foo');

      final res = await chain.invoke({'foo': 'foo1', 'bar': 'bar1'});
      expect(res, 'foo1');
    });

    test('RunnableMapFromInput from Runnable.getMapFromInput', () async {
      final chain = Runnable.getMapFromInput('foo');

      final res = await chain.invoke('foo1');
      expect(res, {'foo': 'foo1'});
    });

    test('Streaming RunnableItemFromMap', () async {
      final chain = Runnable.getItemFromMap('foo');
      final stream = chain.stream({'foo': 'foo1', 'bar': 'bar1'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final item = streamList.first;
      expect(item, 'foo1');
    });

    test('Streaming RunnableMapFromInput', () async {
      final chain = Runnable.getMapFromInput('foo');
      final stream = chain.stream('foo1');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<Map<String, dynamic>>());

      final item = streamList.first;
      expect(item, {'foo': 'foo1'});
    });
  });
}
