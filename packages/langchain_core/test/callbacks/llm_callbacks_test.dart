import 'package:langchain_core/llms.dart';
import 'package:langchain_core/prompts.dart';
import 'package:test/test.dart';

import 'fake_callback_handler.dart';

void main() {
  group('LLM callback integration', () {
    test('FakeEchoLLM invoke fires onLlmStart and onLlmEnd', () async {
      final handler = FakeCallbackHandler();
      const llm = FakeEchoLLM();

      final result = await llm.invoke(
        PromptValue.string('hello'),
        options: FakeLLMOptions(callbacks: [handler]),
      );

      expect(result.output, contains('hello'));
      expect(handler.llmStarts, 1);
      expect(handler.llmEnds, 1);
      expect(handler.llmErrors, 0);
    });

    test(
      'FakeEchoLLM stream fires onLlmStart, onLlmNewToken per chunk, '
      'and onLlmEnd',
      () async {
        final handler = FakeCallbackHandler();
        const llm = FakeEchoLLM();

        final chunks = await llm
            .stream(
              PromptValue.string('hi'),
              options: FakeLLMOptions(callbacks: [handler]),
            )
            .toList();

        expect(chunks, isNotEmpty);
        expect(handler.llmStarts, 1);
        expect(handler.newTokens, chunks.length);
        expect(handler.llmEnds, 1);
      },
    );

    test(
      'FakeLLM invoke fires onLlmStart and onLlmEnd with correct response',
      () async {
        final handler = FakeCallbackHandler();
        final llm = FakeLLM(responses: ['world']);

        final result = await llm.invoke(
          PromptValue.string('hello'),
          options: FakeLLMOptions(callbacks: [handler]),
        );

        expect(result.output, 'world');
        expect(handler.llmStarts, 1);
        expect(handler.llmEnds, 1);
        expect(handler.llmErrors, 0);
      },
    );
  });
}
