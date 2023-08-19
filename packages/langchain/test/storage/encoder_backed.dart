import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('EncoderBackedStore tests', () {
    test(
        'EncoderBackedStore should encode and decode key-value pairs using InMemoryStore',
        () async {
      final encoderBackedStore = EncoderBackedStore(
        store: InMemoryStore<String, String>(),
        encoder: SampleEncoder(),
      );

      final keyValuePairs = [(1, 'One'), (2, 'Two'), (3, 'Three')];

      await encoderBackedStore.set(keyValuePairs);

      // Verify if the key-value pairs are properly encoded and stored
      final keys = keyValuePairs.map((final pair) => pair.$1).toList();
      final values = await encoderBackedStore.get(keys);

      for (int i = 0; i < keyValuePairs.length; i++) {
        expect(values[i], equals(keyValuePairs[i].$2));
      }

      // Test for delete function
      await encoderBackedStore.delete([keyValuePairs[0].$1]);

      // Check if the first key is deleted
      final deletedValues = await encoderBackedStore.get(keys);
      expect(deletedValues[0], equals(null));

      // Test yieldKeys
      final stream = encoderBackedStore.yieldKeys();
      await for (final key in stream) {
        expect(key, isNot(equals(keyValuePairs[0].$1)));
      }
    });
  });
}

class SampleEncoder implements StoreEncoder<int, String, String, String> {
  @override
  String encodeKey(final int key) => '$key';

  @override
  String encodeValue(final String value) => "'$value'";

  @override
  int decodeKey(final String encodedKey) => int.parse(encodedKey);

  @override
  String decodeValue(final String encodedValue) => encodedValue.substring(
        1,
        encodedValue.length - 1,
      );
}
