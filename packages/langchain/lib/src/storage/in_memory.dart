import 'base.dart';

/// {@template in_memory_store}
/// In-memory implementation of the BaseStore using a dictionary.
/// {@endtemplate}
class InMemoryStore<K, V> implements BaseStore<K, V> {
  /// {@macro in_memory_store}
  InMemoryStore({
    final Map<K, V>? initialData,
  }) : _store = {...?initialData};

  final Map<K, V> _store;

  @override
  Future<List<V?>> get(final List<K> keys) async {
    return keys.map((final key) => _store[key]).toList(growable: false);
  }

  @override
  Future<void> set(final List<(K, V)> keyValuePairs) async {
    for (final pair in keyValuePairs) {
      _store[pair.$1] = pair.$2;
    }
  }

  @override
  Future<void> delete(final List<K> keys) async {
    keys.forEach(_store.remove);
  }

  @override
  Stream<K> yieldKeys({final String? prefix}) async* {
    for (final key in _store.keys) {
      if (prefix == null || key.toString().startsWith(prefix)) {
        yield key;
      }
    }
  }
}
