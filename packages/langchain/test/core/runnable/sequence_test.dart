// ignore_for_file: unused_element
import 'package:langchain/langchain.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableSequence tests', () {
    test('RunnableSequence from Runnable.pipe', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = prompt.pipe(model).pipe(outputParser);

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });

    test('RunnableSequence from | operator', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = prompt | model | outputParser;

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });

    test('RunnableSequence from Runnable.fromList', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<ChatMessage, ChatModelOptions>();
      final chain = Runnable.fromList([prompt, model, outputParser]);

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });
  });
}
