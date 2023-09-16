// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableMap tests', () {
    test('RunnableMap with multiple branches', () async {
      final prompt1 = PromptTemplate.fromTemplate('Hello {input}!');
      final prompt2 = PromptTemplate.fromTemplate('Bye {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = Runnable.fromMap({
        'left': prompt1 | model | outputParser,
        'right': prompt2 | model | outputParser,
      });

      final res = await chain.invoke({'input': 'world'});
      expect(
        res,
        {'left': 'Hello world!', 'right': 'Bye world!'},
      );
    });
  });
}
