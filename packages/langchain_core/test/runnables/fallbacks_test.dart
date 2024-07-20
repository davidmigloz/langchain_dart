import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableFallback tests', () {
    late FakeEchoChatModel model;
    late FakeChatModel fallbackModel;
    final promptTemplate =
        ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');
    final input = PromptValue.string('why is the sky blue');
    setUp(() {
      model = const FakeEchoChatModel();
      fallbackModel = FakeChatModel(responses: ['fallback response']);
    });
    test('RunnableFallback should return main runnable output', () async {
      const fallbackmodel = FakeEchoChatModel();
      final modelWithFallback = model.withFallbacks([fallbackmodel]);
      final res = await modelWithFallback.invoke(input);
      expect(res.output.content, 'why is the sky blue');
    });
    test('should call fallback runnable if main runnable failes', () async {
      const model = FakeEchoChatModel();
      const options = RunnableOptions(concurrencyLimit: 0);
      final modelWithFallback = model.withFallbacks([fallbackModel]);
      final res = await modelWithFallback.invoke(input, options: options);
      expect(res.output.content, 'fallback response');
    });
    test('test batch response of main runnable in RunnableFallback', () async {
      const model = FakeEchoChatModel();
      const fallbackModel = FakeEchoChatModel();
      final fallbackChain = promptTemplate.pipe(fallbackModel);
      final chainWithFallbacks =
          promptTemplate.pipe(model).withFallbacks([fallbackChain]);
      final res = await chainWithFallbacks.batch(
        [
          {'topic': 'bears'},
          {'topic': 'cats'},
        ],
      );
      expect(res[0].output.content, 'tell me a joke about bears');
      expect(res[1].output.content, 'tell me a joke about cats');
    });
    test('test fallbacks response in batch', () async {
      const options = RunnableOptions(concurrencyLimit: 0);
      final fallbackChain = promptTemplate.pipe(fallbackModel);
      final chainWithFallbacks =
          promptTemplate.pipe(model).withFallbacks([fallbackChain]);
      final res = await chainWithFallbacks.batch(
        [
          {'topic': 'bears'},
        ],
        options: [options],
      );
      expect(res.first.output.content, 'fallback response');
    });
    test('should throw error if none of runnable returned output', () async {
      const options = RunnableOptions(concurrencyLimit: 0);

      final fallbackChain = promptTemplate.pipe(fallbackModel);
      final chainWithFallbacks = promptTemplate
          .pipe(model)
          .withFallbacks([fallbackChain.bind(options)]);
      expect(
        () async => chainWithFallbacks.batch(
          [
            {'topic': 'bears'},
          ],
          options: [options],
        ),
        throwsException,
      );
    });
  });
}
