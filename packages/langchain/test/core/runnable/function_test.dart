// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableFunction tests', () {
    test('RunnableFunction from Runnable.fromFunction', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = prompt |
          model |
          outputParser |
          Runnable.fromFunction<String, int>(
            (final input, final options) => input.length,
          );

      final res = await chain.invoke({'input': 'world'});
      expect(res, 12);
    });
  });
}
