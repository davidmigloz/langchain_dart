import 'base.dart';

/// {@template encoder_backed_store}
/// Wraps a store with key and value encoders/decoders.
///
/// This is useful for stores that only support certain types of keys and
/// values. You can wrap the store with an encoder that converts the keys and
/// values to the supported types.
/// {@endtemplate}
class EncoderBackedStore<K, V, EK, EV> implements BaseStore<K, V> {
  /// {@macro encoder_backed_store}
  EncoderBackedStore({
    required this.store,
    required this.encoder,
  });

  /// The underlying store.
  final BaseStore<EK, EV> store;

  /// The encoder/decoder for keys and values.
  final StoreEncoder<K, V, EK, EV> encoder;

  @override
  Future<List<V?>> get(final List<K> keys) async {
    final encodedKeys = keys.map(encoder.encodeKey).toList(growable: false);
    final encodedValues = await store.get(encodedKeys);
    return encodedValues
        .map((final value) => value == null ? null : encoder.decodeValue(value))
        .toList(growable: false);
  }

  @override
  Future<void> set(final List<(K, V)> keyValuePairs) async {
    final encodedKeyValuePairs = keyValuePairs
        .map(
          (final pair) => (
            encoder.encodeKey(pair.$1),
            encoder.encodeValue(pair.$2),
          ),
        )
        .toList(growable: false);
    await store.set(encodedKeyValuePairs);
  }

  @override
  Future<void> delete(final List<K> keys) async {
    final encodedKeys = keys.map(encoder.encodeKey).toList(growable: false);
    await store.delete(encodedKeys);
  }

  @override
  Stream<K> yieldKeys({final String? prefix}) async* {
    final encodedKeys = store.yieldKeys(prefix: prefix);
    await for (final encodedKey in encodedKeys) {
      yield encoder.decodeKey(encodedKey);
    }
  }
}

/// {@template encoder}
/// Encoder/decoder for keys and values.
/// {@endtemplate}
abstract interface class StoreEncoder<K, V, EK, EV> {
  /// {@macro encoder}
  const StoreEncoder();

  /// Encodes a key.
  EK encodeKey(final K key);

  /// Encodes a value.
  EV encodeValue(final V value);

  /// Decodes a key.
  K decodeKey(final EK key);

  /// Decodes a value.
  V decodeValue(final EV value);
}
