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
  });

  group('RunnableMapFromItem tests', () {
    test('RunnableMapFromItem from Runnable.getMapFromItem', () async {
      final chain = Runnable.getMapFromItem('foo');

      final res = await chain.invoke('foo1');
      expect(res, {'foo': 'foo1'});
    });
  });
}
