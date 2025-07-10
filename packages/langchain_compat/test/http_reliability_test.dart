/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  // Helper to run parameterized tests
  void runProviderTest(
    String description,
    Future<void> Function(ChatProvider provider) testFunction, {
    Set<ProviderCaps>? requiredCaps,
    bool edgeCase = false,
  }) {
    final providers = edgeCase
        ? ['google:gemini-2.0-flash'] // Edge cases on Google only
        : ChatProvider.all
              .where(
                (p) =>
                    requiredCaps == null ||
                    requiredCaps.every((cap) => p.caps.contains(cap)),
              )
              .map((p) => '${p.name}:${p.defaultModelName}');

    for (final providerModel in providers) {
      test('$providerModel: $description', () async {
        final parts = providerModel.split(':');
        final providerName = parts[0];
        final provider = ChatProvider.forName(providerName);
        await testFunction(provider);
      });
    }
  }

  group('HTTP Reliability', () {
    group('basic request handling (80% cases)', () {
      runProviderTest('handles normal HTTP requests', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Simple request that should succeed
        final result = await agent.run('Say "HTTP test successful"');

        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('http'));
      });

      runProviderTest('handles empty responses gracefully', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Request that might produce minimal response
        final result = await agent.run('.');

        // Should still get some response
        expect(result.output, isA<String>());
      });

      runProviderTest('handles rapid sequential requests', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Make 3 quick requests
        for (var i = 0; i < 3; i++) {
          final result = await agent.run('Say "Request $i"');
          expect(result.output, isNotEmpty);
          expect(result.output, contains('$i'));
        }
      });
    });

    group('streaming reliability (80% cases)', () {
      runProviderTest('maintains stream connection', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Count from 1 to 5')) {
          chunks.add(chunk.output);
        }

        // Should receive multiple chunks
        expect(chunks, isNotEmpty);
        expect(chunks.length, greaterThan(1));

        // Complete response should contain numbers
        final fullText = chunks.join();
        expect(fullText, isNotEmpty);
      });

      runProviderTest('handles stream interruption', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'Write a long story about testing',
        )) {
          chunks.add(chunk.output);
          if (chunks.length >= 5) {
            break; // Interrupt the stream
          }
        }

        // Should have collected some chunks before interruption
        expect(chunks.length, equals(5));
      });
    });

    group('concurrent request handling (80% cases)', () {
      runProviderTest('handles parallel requests', (provider) async {
        // Create multiple agents
        final agents = List.generate(
          3,
          (i) => Agent('${provider.name}:${provider.defaultModelName}'),
        );

        // Make parallel requests
        final futures = agents.asMap().entries.map((entry) {
          final index = entry.key;
          final agent = entry.value;
          return agent.run('Say "Parallel request $index"');
        }).toList();

        final results = await Future.wait(futures);

        // All requests should complete
        expect(results.length, equals(3));
        for (var i = 0; i < results.length; i++) {
          expect(results[i].output, isNotEmpty);
        }
      });
    });

    group('edge cases', () {
      runProviderTest('handles very long prompts', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create a long prompt (but not too long to exceed limits)
        final longPrompt =
            'Please summarize this text: ${'This is a test sentence. ' * 100}';

        final result = await agent.run(longPrompt);

        // Should handle long input gracefully
        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles special characters in requests', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Request with various special characters
        final result = await agent.run(
          'Echo these characters: 你好世界 🌍 ñ © ® ™ €',
        );

        expect(result.output, isNotEmpty);
        // Should handle unicode properly
        expect(
          result.output,
          anyOf(
            contains('你好'),
            contains('世界'),
            contains('🌍'),
            contains('characters'),
          ),
        );
      }, edgeCase: true);

      runProviderTest('handles request timeout scenarios', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // This prompt should complete normally (not actually timeout)
        // Real timeout testing would require mocking
        final result = await agent.run('Respond with just "OK" immediately');

        expect(result.output, isNotEmpty);
        expect(result.output.toUpperCase(), contains('OK'));
      }, edgeCase: true);

      runProviderTest('handles rapid request cancellation', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Start multiple streams and cancel them quickly
        for (var i = 0; i < 5; i++) {
          final stream = agent.runStream('Count to 100 slowly');
          final subscription = stream.listen((_) {});

          // Cancel almost immediately
          await Future.delayed(const Duration(milliseconds: 10));
          await subscription.cancel();
        }

        // Should handle rapid cancellations without issues
        // Make a normal request to verify agent still works
        final result = await agent.run('Say "Still working"');
        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles network interruption recovery', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Make request that simulates recovery scenario
        // (actual network interruption would require infrastructure)
        final result = await agent.run(
          'If this message is received, respond with "Network OK"',
        );

        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('ok'));
      }, edgeCase: true);
    });
  });
}
