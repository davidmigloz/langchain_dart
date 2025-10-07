// ignore_for_file: unnecessary_async

import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/runnables.dart';
import 'package:test/test.dart';

void main() {
  group('Runnable Retry Test', () {
    late FakeEchoChatModel model;
    final input = PromptValue.string('why is the sky blue');
    final promptTemplate =
        ChatPromptTemplate.fromTemplate('tell me a joke about {topic}');

    setUp(() {
      model = const FakeEchoChatModel();
    });

    test('Runnable retry should return output for invoke', () async {
      final modelWithRetry = model.withRetry(maxRetries: 2);
      final res = await modelWithRetry.invoke(input);
      expect(res.output.content, 'why is the sky blue');
    });

    test('Runnable retry should return output for batch', () async {
      final chain = promptTemplate.pipe(model);
      final chainWithRetry = chain.withRetry();
      final res = await chainWithRetry.batch(
        [
          {'topic': 'bears'},
          {'topic': 'cats'},
        ],
      );
      expect(res[0].output.content, 'tell me a joke about bears');
      expect(res[1].output.content, 'tell me a joke about cats');
    });

    test('Should retry based RetryOptions, maxRetries = 2', () {
      final modelWithRetry = model.withRetry(maxRetries: 2);
      expect(
        () async => modelWithRetry.invoke(
          input,
          options: const FakeEchoChatModelOptions(throwRandomError: true),
        ),
        throwsException,
      );
    });

    test('Should return the output after successful retry', () async {
      var count = 0;
      final modelWithRetry = model.pipe(
        Runnable.fromFunction(
          invoke: (input, opt) {
            if (count++ < 1) {
              throw Exception('Random error');
            }
            return input;
          },
        ),
      ).withRetry(maxRetries: 2);
      final res = await modelWithRetry.invoke(input);
      expect(res.outputAsString, input.toString());
      expect(count, 2);
    });

    test('Should not retry if retryIf returned false', () async {
      late String error;
      final modelWithRetry = model.withRetry(
        maxRetries: 3,
        retryIf: (e) {
          if (e.toString() == 'Exception: Random error') {
            return false;
          } else {
            return true;
          }
        },
      );
      try {
        await modelWithRetry.invoke(
          input,
          options: const FakeEchoChatModelOptions(throwRandomError: true),
        );
      } catch (e) {
        error = e.toString();
      }
      expect(error, 'Exception: Random error');
    });
  });
}
