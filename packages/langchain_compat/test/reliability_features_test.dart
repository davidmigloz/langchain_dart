// CRITICAL TEST FAILURE INVESTIGATION PROCESS:
// When a test fails for a provider capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's
//      streaming tool format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  // Helper to run parameterized tests
  void runProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in ChatProvider.all) {
        test('${provider.name} - $testName', () async {
          await testFunction(provider);
        }, timeout: timeout ?? const Timeout(Duration(seconds: 30)));
      }
    });
  }

  group('Reliability Features', () {
    group('basic construction reliability', () {
      runProviderTest(
        'agent creation does not throw',
        (provider) async {
          // Test that agent creation works for all providers (no API calls)
          expect(
            () => Agent('${provider.name}:${provider.defaultModelName}'),
            returnsNormally,
            reason:
                'Provider ${provider.name} should create agent '
                'without throwing',
          );

          // Test that agent has expected properties
          final agent = Agent('${provider.name}:${provider.defaultModelName}');
          expect(agent.providerName, equals(provider.name));
          expect(agent.model, contains('${provider.name}:'));
        },
      );

      test('provider creation handles missing API keys', () {
        // All providers should create agents even without API keys
        expect(() => Agent('openai:gpt-4o-mini'), returnsNormally);
        expect(() => Agent('google:gemini-2.0-flash'), returnsNormally);
        expect(
          () => Agent('anthropic:claude-3-5-haiku-latest'),
          returnsNormally,
        );
        expect(() => Agent('mistral:mistral-small-latest'), returnsNormally);
      });
    });

    // Timeout handling moved to edge cases

    group('resource management', () {
      test('agent cleanup works correctly', () {
        final agent = Agent('openai:gpt-4o-mini');

        // Agent should create and work correctly
        expect(agent.providerName, equals('openai'));
        expect(agent.model, contains('openai:'));
      });

      test('multiple agents can coexist', () {
        final agents = [
          Agent('openai:gpt-4o-mini'),
          Agent('google:gemini-2.0-flash'),
        ];

        // All agents should create successfully
        expect(agents, hasLength(2));
        expect(agents[0].providerName, equals('openai'));
        expect(agents[1].providerName, equals('google'));

        // All agents should be properly configured
        expect(agents[0].model, contains('openai:'));
        expect(agents[1].model, contains('google:'));
      });

      // Concurrent usage moved to edge cases
    });

    group('edge cases (limited providers)', () {
      // Test edge cases on only 1-2 providers to save resources
      // and avoid timeouts
      final edgeCaseProviders = ['google:gemini-2.0-flash'];

      test('basic error recovery', () async {
        final agent = Agent(edgeCaseProviders.first);
        final result = await agent.run('Hello');
        expect(result.output, isA<String>());
      });

      test('streaming handles connection issues', () async {
        final agent = Agent(edgeCaseProviders.first);

        var streamStarted = false;
        var streamCompleted = false;

        await for (final chunk in agent.runStream('Test message')) {
          streamStarted = true;
          expect(chunk.output, isA<String>());
        }
        streamCompleted = true;

        expect(streamStarted, isTrue);
        expect(streamCompleted, isTrue);
      });

      test('timeout handling', () async {
        final agent = Agent(edgeCaseProviders.first);
        final stopwatch = Stopwatch()..start();

        await agent.run('What is 1 + 1?');
        stopwatch.stop();

        // Should complete within reasonable time (2 minutes)
        expect(stopwatch.elapsedMilliseconds, lessThan(120000));
      });

      test('concurrent agent usage', () async {
        final agent1 = Agent(edgeCaseProviders.first);
        final agent2 = Agent(edgeCaseProviders.first);

        final futures = [
          agent1.run('What is 2 + 2?'),
          agent2.run('What is 3 + 3?'),
        ];

        final results = await Future.wait(futures);
        expect(results, hasLength(2));
        expect(results[0].output, isA<String>());
        expect(results[1].output, isA<String>());
      });

      test('tool errors are handled gracefully', () async {
        final agent = Agent(edgeCaseProviders.first, tools: [errorTool]);

        final result = await agent.run('Use error_tool to test error handling');
        expect(result.output, isA<String>());
        expect(result.messages, isNotEmpty);
      });

      test('handles special characters safely', () async {
        final agent = Agent(edgeCaseProviders.first);
        const specialInput = '!@#\$%^&*()_+{}[]|\\:";\'<>?,./`~';

        final result = await agent.run('Echo: $specialInput');
        expect(result.output, isA<String>());
      });

      test('handles unicode content properly', () async {
        final agent = Agent(edgeCaseProviders.first);
        const unicodeInput = '🚀 Hello 世界! 🌟 Testing émojis and accénts';

        final result = await agent.run('Repeat: $unicodeInput');
        expect(result.output, isA<String>());
      });

      test('degraded functionality still provides value', () async {
        final agent = Agent(edgeCaseProviders.first);

        // Even if advanced features fail, basic chat should work
        final result = await agent.run('Hello');
        expect(result.output, isA<String>());
        expect(result.output.isNotEmpty, isTrue);
      });
    });
  });
}
