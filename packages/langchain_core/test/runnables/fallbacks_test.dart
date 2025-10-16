// ignore_for_file: unnecessary_async

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/output_parsers.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

void main() {
  group('RunnableFallback tests', () {
    late FakeEchoChatModel model;
    late FakeChatModel fallbackModel;
    final promptTemplate = ChatPromptTemplate.fromTemplate(
      'tell me a joke about {topic}',
    );
    final input = PromptValue.string('why is the sky blue');

    setUp(() {
      model = const FakeEchoChatModel();
      fallbackModel = FakeChatModel(responses: ['fallback response']);
    });

    test('RunnableFallback should return main runnable output', () async {
      final modelWithFallback = model.withFallbacks([fallbackModel]);
      final res = await modelWithFallback.invoke(input);
      expect(res.output.content, 'why is the sky blue');
    });

    test('Should call fallback runnable if main runnable fails', () async {
      final brokenModel = model.bind(
        const FakeEchoChatModelOptions(throwRandomError: true),
      );
      final modelWithFallback = brokenModel.withFallbacks([fallbackModel]);
      final res = await modelWithFallback.invoke(input);
      expect(res.output.content, 'fallback response');
    });

    test('Test batch response of main runnable in RunnableFallback', () async {
      const model = FakeEchoChatModel();
      const fallbackModel = FakeEchoChatModel();
      final fallbackChain = promptTemplate.pipe(fallbackModel);
      final chainWithFallbacks = promptTemplate.pipe(model).withFallbacks([
        fallbackChain,
      ]);
      final res = await chainWithFallbacks.batch([
        {'topic': 'bears'},
        {'topic': 'cats'},
      ]);
      expect(res[0].output.content, 'tell me a joke about bears');
      expect(res[1].output.content, 'tell me a joke about cats');
    });

    test('Test fallbacks response in batch', () async {
      final brokenModel = model.bind(
        const FakeEchoChatModelOptions(throwRandomError: true),
      );
      final fallbackChain = promptTemplate.pipe(fallbackModel);
      final chainWithFallbacks = promptTemplate.pipe(brokenModel).withFallbacks(
        [fallbackChain],
      );
      final res = await chainWithFallbacks.batch([
        {'topic': 'bears'},
      ]);
      expect(res.first.output.content, 'fallback response');
    });

    test('Should throw error if none of runnable returned output', () {
      final brokenModel1 = model.bind(
        const FakeEchoChatModelOptions(throwRandomError: true),
      );
      final brokenModel2 = model.bind(
        const FakeEchoChatModelOptions(throwRandomError: true),
      );
      final fallbackChain = promptTemplate.pipe(brokenModel2);
      final chainWithFallbacks = promptTemplate
          .pipe(brokenModel1)
          .withFallbacks([fallbackChain]);
      expect(
        () async => chainWithFallbacks.batch([
          {'topic': 'bears'},
        ]),
        throwsException,
      );
    });

    test('Test stream response of main runnable in RunnableFallback', () async {
      final modelWithFallback = model.withFallbacks([fallbackModel]);
      final chain = modelWithFallback.pipe(const StringOutputParser());
      final res = await chain.stream(input).toList();
      expect(res.join('|'), 'w|h|y| |i|s| |t|h|e| |s|k|y| |b|l|u|e');
    });

    test('Test fallbacks response in stream', () async {
      final brokenModel = model.bind(
        const FakeEchoChatModelOptions(throwRandomError: true),
      );
      final modelWithFallback = brokenModel.withFallbacks([fallbackModel]);
      final chain = modelWithFallback.pipe(const StringOutputParser());
      final res = await chain.stream(input).toList();
      expect(res.join('|'), endsWith('f|a|l|l|b|a|c|k| |r|e|s|p|o|n|s|e'));
    });
  });
}
