import 'package:langchain_core/chat_models.dart';
import 'package:langchain_core/prompts.dart';
import 'package:langchain_core/src/utils/retry_client.dart';
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
      final modelWithRetry = model.withRetry(RetryOptions(maxRetries: 2));
      final res = await modelWithRetry.invoke(input);
      expect(res.output.content, 'why is the sky blue');
    });
    test('Runnable retry should return output for batch', () async {
      final chain = promptTemplate.pipe(model);
      final chainWithRetry = chain.withRetry(RetryOptions());
      final res = await chainWithRetry.batch(
        [
          {'topic': 'bears'},
          {'topic': 'cats'},
        ],
      );
      expect(res[0].output.content, 'tell me a joke about bears');
      expect(res[1].output.content, 'tell me a joke about cats');
    });
    test('Should retry based RetryOptions, maxReries = 2', () async {
      final modelWithRetry = model.withRetry(RetryOptions(maxRetries: 2));
      expect(
        () async => modelWithRetry.invoke(
          input,
          options: const FakeEchoChatModelOptions(throwRandomError: true),
        ),
        throwsException,
      );
    });
    test('should not retry if retryIf returned false', () async {
      late String error;
      final retryOptions = RetryOptions(
        maxRetries: 3,
        retryIf: (e) {
          if (e.toString() == 'Exception: Random error') {
            return false;
          } else {
            return true;
          }
        },
      );
      final modelWithRetry = model.withRetry(retryOptions);
      try {
        await modelWithRetry.invoke(
          input,
          options: const FakeEchoChatModelOptions(throwRandomError: true),
        );
      } catch (e) {
        error = e.toString();
      }
      expect(
        error,
        'Exception: Function did not retry, retryIf returned false. Error: Exception: Random error',
      );
    });
    test('test default retry options', () {
      final retryOptions = RetryOptions();
      expect(retryOptions.maxRetries, 3);
      expect(retryOptions.addJitter, false);
    });
  });
}
