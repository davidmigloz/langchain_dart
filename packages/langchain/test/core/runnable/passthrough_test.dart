// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnablePassthrough tests', () {
    test('RunnablePassthrough from Runnable.passthrough', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = Runnable.fromMap({
        'in': Runnable.passthrough(),
        'out': Runnable.getMapFromInput() | prompt | model | outputParser,
      });

      final res = await chain.invoke('world');
      expect(
        res,
        {
          'in': 'world',
          'out': 'Hello world!',
        },
      );
    });

    test('Streaming RunnablePassthrough', () async {
      final passthrough = Runnable.passthrough();
      final stream = passthrough.stream('world');

      final streamList = await stream.toList();
      expect(streamList.length, 1);
      expect(streamList.first, isA<String>());

      final item = streamList.first;
      expect(item, 'world');
    });
  });
}
