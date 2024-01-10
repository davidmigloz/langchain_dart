@TestOn('vm')
library; // Uses dart:io

import 'dart:io';

import 'package:openai_dart/openai_dart.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAI Completions API tests', () {
    late OpenAIClient client;

    setUp(() {
      client = OpenAIClient(
        apiKey: Platform.environment['OPENAI_API_KEY'],
      );
    });

    tearDown(() {
      client.endSession();
    });

    test('Test call completions API', () async {
      final models = [
        CompletionModels.gpt35TurboInstruct,
      ];

      for (final model in models) {
        final request = CreateCompletionRequest(
          model: CompletionModel.model(model),
          prompt: const CompletionPrompt.string(
            'List the numbers from 1 to 9 in order without any spaces or commas.',
          ),
          maxTokens: 10,
          temperature: 0,
        );
        final res = await client.createCompletion(request: request);
        expect(res.choices, hasLength(1));
        expect(res.choices.first.text.trim(), contains('123456789'));
        expect(
          res.choices.first.finishReason,
          CompletionFinishReason.stop,
        );
        expect(res.id, isNotEmpty);
        expect(
          res.model.replaceAll(RegExp('[-.]'), '').toLowerCase(),
          model.name.toLowerCase(),
        );
        expect(res.object, CreateCompletionResponseObject.textCompletion);
        expect(res.usage?.promptTokens, greaterThan(0));
        expect(res.usage?.completionTokens, greaterThan(0));
        expect(res.usage?.totalTokens, greaterThan(0));
      }
    });

    test('Test call completions API with stop sequence', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string(
          'List the numbers from 1 to 9 in order without any spaces or commas.',
        ),
        maxTokens: 10,
        temperature: 0,
        stop: CompletionStop.string('4'),
      );
      final res = await client.createCompletion(request: request);
      expect(res.choices, hasLength(1));
      expect(res.choices.first.text.trim(), contains('123'));
      expect(res.choices.first.text.trim(), isNot(contains('456789')));
      expect(
        res.choices.first.finishReason,
        CompletionFinishReason.stop,
      );
    });

    test('Test call completions API with max tokens', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string('Tell me a joke'),
        maxTokens: 2,
      );
      final res = await client.createCompletion(request: request);
      expect(res.choices, isNotEmpty);
      expect(
        res.choices.first.finishReason,
        CompletionFinishReason.length,
      );
    });

    test('Test call completions API with echo', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string('Say this is a test'),
        echo: true,
        maxTokens: 20,
      );
      final res = await client.createCompletion(request: request);
      expect(res.choices.first.text.trim(), startsWith('Say this is a test'));
    });

    test('Test call completions API with suffix', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string(
          'List the numbers from 1 to 9 in order without any spaces or commas.',
        ),
        suffix: '789',
      );
      final res = await client.createCompletion(request: request);
      final completion = res.choices.first.text.trim();
      expect(completion, contains('123456'));
      expect(completion, isNot(contains('789')));
    });

    test('Test call completions API with other parameters', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string('Say this is a test'),
        bestOf: 5,
        frequencyPenalty: 0.5,
        logitBias: {'50256': -100},
        logprobs: 2,
        maxTokens: 20,
        n: 2,
        presencePenalty: 0.5,
        temperature: 0,
        topP: 0.2,
        user: 'user_123',
      );
      final res = await client.createCompletion(request: request);
      expect(res.choices, hasLength(2));
      expect(res.choices.first.logprobs, isNotNull);
      expect(res.choices.first.logprobs?.tokens, isNotEmpty);
      expect(res.choices.first.logprobs?.tokenLogprobs, isNotEmpty);
      expect(res.choices.first.logprobs?.textOffset, isNotEmpty);
      expect(res.choices.first.logprobs?.topLogprobs, isNotEmpty);
    });

    test('Test call completions streaming API', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string(
          'List the numbers from 1 to 9 in order without any spaces or commas.',
        ),
        maxTokens: 10,
        temperature: 0,
      );
      final stream = client.createCompletionStream(request: request);
      String text = '';
      await for (final res in stream) {
        expect(res.choices, isNotEmpty);
        text += res.choices.first.text.trim();
      }
      expect(text, contains('123456789'));
    });

    test('Test response seed', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string('How are you?'),
        temperature: 0,
        seed: 9999,
      );

      final res1 = await client.createCompletion(request: request);
      expect(res1.choices, hasLength(1));
      final choice1 = res1.choices.first;

      final res2 = await client.createCompletion(request: request);
      expect(res2.choices, hasLength(1));
      final choice2 = res2.choices.first;

      expect(res1.systemFingerprint, res2.systemFingerprint);
      expect(choice1.text, choice2.text);
    });

    test('Test UTF-8 response', () async {
      const request = CreateCompletionRequest(
        model: CompletionModel.model(CompletionModels.gpt35TurboInstruct),
        prompt: CompletionPrompt.string('How do you write Spain in Spanish?'),
        temperature: 0,
      );
      final res = await client.createCompletion(request: request);
      expect(res.choices, hasLength(1));
      expect(res.choices.first.text.trim(), contains('España'));
    });
  });
}
