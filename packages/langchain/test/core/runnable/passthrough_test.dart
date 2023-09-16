// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnablePassthrough tests', () {
    test('RunnablePassthrough from Runnable.passthrough', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = Runnable.fromMap({
        'in': Runnable.passthrough(),
        'out': Runnable.getMapFromItem('input') | prompt | model | outputParser,
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
  });
}
