import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryStore tests', () {
    final store = InMemoryStore<String, int>();

    test('set and get', () async {
      final pairs = [('key1', 1), ('key2', 2)];
      await store.set(pairs);
      final values = await store.get(['key1', 'key2']);
      expect(values, equals([1, 2]));
    });

    test('delete', () async {
      await store.set([('key3', 3)]);
      await store.delete(['key3']);
      final values = await store.get(['key3']);
      expect(values, equals([null]));
    });

    test('yieldKeys', () async {
      await store.set([('key4', 4)]);
      await store.set([('prefixKey5', 5)]);
      final List<String> keys =
          await store.yieldKeys(prefix: 'prefix').toList();
      expect(keys, equals(['prefixKey5']));
    });
  });
}
