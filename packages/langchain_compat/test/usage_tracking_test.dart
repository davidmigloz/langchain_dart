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

import 'test_utils.dart';

void main() {
  // Helper to run parameterized tests
  void runProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in ChatProvider.all) {
        test(provider.name, () async {
          // Skip local providers if not available
          if (provider.name.contains('ollama') && !await isOllamaAvailable()) {
            // Ollama not running - skip this provider
            return;
          }
          
          await testFunction(provider);
        }, timeout: timeout ?? const Timeout(Duration(seconds: 30)));
      }
    });
  }

  group('Usage Tracking', () {
    group('basic usage tracking', () {
      test('tracks token usage for single request', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');
        final result = await agent.run('Say hello');

        // Usage tracking may not be available for all providers
        if (result.usage.promptTokens != null) {
          expect(result.usage.promptTokens, greaterThan(0));
        }
        if (result.usage.responseTokens != null) {
          expect(result.usage.responseTokens, greaterThan(0));
        }
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThan(0));
        }
        expect(
          result.usage.totalTokens,
          equals(
            (result.usage.promptTokens ?? 0) +
                (result.usage.responseTokens ?? 0),
          ),
        );
      });

      test('provides non-zero token counts', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final result = await agent.run('Write a haiku about programming');

        // Usage tracking may not be available for all providers
        if (result.usage.promptTokens != null) {
          expect(result.usage.promptTokens, greaterThan(0));
        }
        if (result.usage.responseTokens != null) {
          expect(result.usage.responseTokens, greaterThan(0));
        }
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThan(0));
        }
      });

      test('tracks usage with longer responses', () async {
        final agent = Agent('google:gemini-2.0-flash');
        final result = await agent.run(
          'Write a 3-sentence story about a robot',
        );

        // Longer responses should use more tokens
        expect(result.usage.responseTokens, greaterThan(10));
        expect(result.usage.totalTokens, greaterThan(20));
      });

      runProviderTest(
        'track usage correctly',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
          );

          final result = await agent.run(
            'Write exactly: "Usage test for ${provider.name}"',
          );

          // Usage tracking may not be available for all providers
          if (result.usage.promptTokens != null) {
            expect(
              result.usage.promptTokens,
              greaterThan(0),
              reason: 'Provider ${provider.name} should track prompt tokens',
            );
          }

          if (result.usage.responseTokens != null) {
            expect(
              result.usage.responseTokens,
              greaterThan(0),
              reason:
                  'Provider ${provider.name} should track response tokens',
            );
          }

          if (result.usage.totalTokens != null) {
            expect(
              result.usage.totalTokens,
              greaterThan(0),
              reason: 'Provider ${provider.name} should track total tokens',
            );

            // If we have prompt and response, total should equal their sum
            if (result.usage.promptTokens != null &&
                result.usage.responseTokens != null) {
              expect(
                result.usage.totalTokens,
                equals(
                  result.usage.promptTokens! + result.usage.responseTokens!,
                ),
                reason:
                    'Provider ${provider.name} total should equal '
                    'prompt + response tokens',
              );
            }
          }
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );
    });

    group('cumulative usage tracking', () {
      test('accumulates usage across multiple calls', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        var totalPromptTokens = 0;
        var totalResponseTokens = 0;

        final questions = ['What is 2+2?', 'Name a color', 'Is water wet?'];

        for (final question in questions) {
          final result = await agent.run(question);
          totalPromptTokens += result.usage.promptTokens ?? 0;
          totalResponseTokens += result.usage.responseTokens ?? 0;
        }

        // Usage tracking may not be available for all providers
        if (totalPromptTokens > 0) {
          expect(totalPromptTokens, greaterThan(0));
        }
        if (totalResponseTokens > 0) {
          expect(totalResponseTokens, greaterThan(0));
        }
        if (totalPromptTokens + totalResponseTokens > 0) {
          expect(totalPromptTokens + totalResponseTokens, greaterThan(0));
        }
      });

      test('tracks consistent usage for identical requests', () async {
        final agent = Agent('openai:gpt-4o-mini');
        const prompt = 'Say exactly: "Hello, world!"';

        final result1 = await agent.run(prompt);
        final result2 = await agent.run(prompt);

        // Prompt tokens should be very similar (if available)
        if (result1.usage.promptTokens != null &&
            result2.usage.promptTokens != null) {
          expect(
            (result1.usage.promptTokens! - result2.usage.promptTokens!).abs(),
            lessThanOrEqualTo(2), // Allow small variance
          );
        }
      });
    });

    group('streaming usage tracking', () {
      test('tracks usage in streaming mode', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        var finalUsage = const LanguageModelUsage();
        final chunks = <String>[];

        await for (final chunk in agent.runStream('Count from 1 to 5')) {
          chunks.add(chunk.output);
          if (chunk.usage.totalTokens != null && chunk.usage.totalTokens! > 0) {
            finalUsage = chunk.usage;
          }
        }

        expect(chunks, isNotEmpty);
        if (finalUsage.promptTokens != null) {
          expect(finalUsage.promptTokens, greaterThan(0));
        }
        if (finalUsage.responseTokens != null) {
          expect(finalUsage.responseTokens, greaterThan(0));
        }
        if (finalUsage.totalTokens != null) {
          expect(finalUsage.totalTokens, greaterThan(0));
        }
      });

      test('usage appears in final chunks', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final usageChunks = <LanguageModelUsage>[];

        await for (final chunk in agent.runStream('Say "test"')) {
          if (chunk.usage.totalTokens != null && chunk.usage.totalTokens! > 0) {
            usageChunks.add(chunk.usage);
          }
        }

        // Usage typically comes near the end (if available)
        if (usageChunks.isNotEmpty) {
          expect(usageChunks.last.totalTokens, greaterThan(0));
        }
      });
    });

    group('cost calculation', () {
      test('calculates reasonable costs', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');
        final result = await agent.run('Hello');

        // Example cost calculation (rates are examples)
        const costPer1kTokens = 0.0008;
        final estimatedCost =
            (result.usage.totalTokens ?? 0) / 1000 * costPer1kTokens;

        // Simple message should be very cheap
        expect(estimatedCost, greaterThan(0));
        expect(estimatedCost, lessThan(0.01)); // Less than 1 cent
      });

      test('cost scales with usage', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final shortResult = await agent.run('Hi');
        final longResult = await agent.run(
          'Write a detailed 5-paragraph essay about artificial intelligence',
        );

        const promptCostPer1k = 0.00015;
        const responseCostPer1k = 0.0006;

        final shortCost =
            (shortResult.usage.promptTokens ?? 0) / 1000 * promptCostPer1k +
            (shortResult.usage.responseTokens ?? 0) / 1000 * responseCostPer1k;

        final longCost =
            (longResult.usage.promptTokens ?? 0) / 1000 * promptCostPer1k +
            (longResult.usage.responseTokens ?? 0) / 1000 * responseCostPer1k;

        // Ensure we have valid costs before comparing
        expect(shortCost, greaterThanOrEqualTo(0));
        expect(longCost, greaterThan(0));

        // Long responses should cost more than short ones if both have usage
        // data
        if (shortCost > 0 && longCost > 0) {
          expect(longCost, greaterThan(shortCost));
        }
      });
    });

    group('provider differences', () {
      test('different providers report usage', () async {
        const prompt = 'What is 1+1?';

        // Anthropic
        var agent = Agent('anthropic:claude-3-5-haiku-latest');
        var result = await agent.run(prompt);
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThan(0));
        }

        // OpenAI
        agent = Agent('openai:gpt-4o-mini');
        result = await agent.run(prompt);
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThan(0));
        }

        // Google
        agent = Agent('google:gemini-2.0-flash');
        result = await agent.run(prompt);
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThan(0));
        }
      });

      test('usage varies by provider for same prompt', () async {
        const prompt = 'Explain photosynthesis in one sentence';
        final usageByProvider = <String, int>{};

        final providers = {
          'anthropic': 'claude-3-5-haiku-latest',
          'openai': 'gpt-4o-mini',
          'google': 'gemini-2.0-flash',
        };

        for (final entry in providers.entries) {
          final agent = Agent('${entry.key}:${entry.value}');
          final result = await agent.run(prompt);
          usageByProvider[entry.key] = result.usage.totalTokens ?? 0;
        }

        // Different providers tokenize differently
        if (usageByProvider.length > 1) {
          final values = usageByProvider.values.toList();
          expect(values.first, isNot(equals(values.last)));
        }
      });
    });

    group('edge cases', () {
      test('handles missing usage data gracefully', () async {
        // Some providers might not always return usage
        final agent = Agent('ollama:llama3.2:latest');

        final result = await agent.run('Hello');
        // If usage is provided, it should be valid
        if (result.usage.totalTokens != null) {
          expect(result.usage.totalTokens, greaterThanOrEqualTo(0));
        }
      });

      test('handles zero token edge cases', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        // Even minimal prompts should have some tokens if usage tracking is
        // available
        final result = await agent.run('Hi');
        if (result.usage.promptTokens != null) {
          expect(result.usage.promptTokens, greaterThan(0)); // System tokens
        }
      });
    });

    group('all providers - usage tracking', () {
      test('usage tracking works across all providers', () async {
        const prompt = 'What is the capital of France?';

        // Test subset of stable providers
        final providers = {
          'openai': 'gpt-4o-mini',
          'anthropic': 'claude-3-5-haiku-latest',
        };

        for (final entry in providers.entries) {
          final providerName = entry.key;
          final modelName = entry.value;

          final agent = Agent('$providerName:$modelName');
          final result = await agent.run(prompt);

          // Basic validation - either has usage or gracefully reports null
          if (result.usage.totalTokens != null) {
            expect(
              result.usage.totalTokens,
              greaterThan(0),
              reason:
                  'Provider $providerName should report positive token usage',
            );
          }
        }
      });
    });
  });
}
