import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMapInput tests', () {
    test('RunnableMapInput from Runnable.getItemFromMap', () async {
      final chain = Runnable.mapInput<ChainValues, ChainValues>(
        (final input) => {
          'input': '${input['foo']}${input['bar']}',
        },
      );

      final res = await chain.invoke({'foo': 'foo1', 'bar': 'bar1'});
      expect(res, {'input': 'foo1bar1'});
    });

    test('Streaming RunnableMapInput', () async {
      final chain = Runnable.mapInput<ChainValues, ChainValues>(
        (final input) => {
          'input': '${input['foo']}${input['bar']}',
        },
      );
      final stream = chain.stream({'foo': 'foo1', 'bar': 'bar1'});

      final streamList = await stream.toList();
      expect(streamList.length, 1);

      final item = streamList.first;
      expect(item, {'input': 'foo1bar1'});
    });
  });
}
