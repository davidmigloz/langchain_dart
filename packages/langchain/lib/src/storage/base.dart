import 'dart:async';

/// {@template base_store}
/// Abstract interface for a key-value store.
/// {@endtemplate}
abstract interface class BaseStore<K, V> {
  /// {@macro base_store}
  const BaseStore();

  /// Returns the values associated with the given keys.
  ///
  /// If a key is not found, the corresponding value will be null`.
  Future<List<V?>> get(final List<K> keys);

  /// Sets the given key-value pairs.
  Future<void> set(final List<(K, V)> keyValuePairs);

  /// Deletes the given keys.
  Future<void> delete(final List<K> keys);

  /// Returns a stream that emits all the keys that match the given prefix.
  Stream<K> yieldKeys({final String? prefix});
}
