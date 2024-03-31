// ignore_for_file: unused_element
import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/llms.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableSequence tests', () {
    test('RunnableSequence from Runnable.pipe', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = prompt.pipe(model).pipe(outputParser);

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });

    test('RunnableSequence from | operator', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = prompt | model | outputParser;

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });

    test('RunnableSequence from Runnable.fromList', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoChatModel();
      const outputParser = StringOutputParser<AIChatMessage>();
      final chain = Runnable.fromList([prompt, model, outputParser]);

      final res = await chain.invoke({'input': 'world'});
      expect(res, 'Hello world!');
    });

    test('Streaming RunnableSequence', () async {
      final prompt = PromptTemplate.fromTemplate('Hello {input}!');
      const model = FakeEchoLLM();
      const outputParser = StringOutputParser<String>();
      final chain = prompt.pipe(model).pipe(outputParser);
      final stream = chain.stream({'input': 'world'});

      final streamList = await stream.toList();
      expect(streamList.length, 12);
      expect(streamList, isA<List<String>>());

      final res = streamList.join();
      expect(res, 'Hello world!');
    });
  });
}
