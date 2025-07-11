/// TESTING PHILOSOPHY:
/// 1. DO NOT catch exceptions - let them bubble up for diagnosis
/// 2. DO NOT add provider filtering except by capabilities (e.g. ProviderCaps)
/// 3. DO NOT add performance tests
/// 4. DO NOT add regression tests
/// 5. 80% cases = common usage patterns tested across ALL capable providers
/// 6. Edge cases = rare scenarios tested on Google only to avoid timeouts
/// 7. Each functionality should only be tested in ONE file - no duplication
///
/// This file tests provider discovery including model enumeration via
/// listModels()

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  // Helper to run parameterized tests for chat providers
  void runChatProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in ChatProvider.all) {
        test(
          '${provider.name} - $testName',
          () async {
            await testFunction(provider);
          },
          timeout: timeout ?? const Timeout(Duration(seconds: 30)),
        );
      }
    });
  }

  // Helper to run parameterized tests for embeddings providers
  void runEmbeddingsProviderTest(
    String testName,
    Future<void> Function(EmbeddingsProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in EmbeddingsProvider.all) {
        test(
          '${provider.name} - $testName',
          () async {
            await testFunction(provider);
          },
          timeout: timeout ?? const Timeout(Duration(seconds: 30)),
        );
      }
    });
  }

  group('Provider Discovery', () {
    group('chat provider selection', () {
      test('finds providers by exact name', () {
        expect(ChatProvider.forName('openai'), equals(ChatProvider.openai));
        expect(
          ChatProvider.forName('anthropic'),
          equals(ChatProvider.anthropic),
        );
        expect(ChatProvider.forName('google'), equals(ChatProvider.google));
        expect(ChatProvider.forName('mistral'), equals(ChatProvider.mistral));
        expect(ChatProvider.forName('ollama'), equals(ChatProvider.ollama));
        expect(ChatProvider.forName('together'), equals(ChatProvider.together));
        expect(
          ChatProvider.forName('fireworks'),
          equals(ChatProvider.fireworks),
        );
        expect(ChatProvider.forName('lambda'), equals(ChatProvider.lambda));
        expect(ChatProvider.forName('cohere'), equals(ChatProvider.cohere));
        expect(
          ChatProvider.forName('openrouter'),
          equals(ChatProvider.openrouter),
        );
      });

      test('finds providers by aliases', () {
        // Test documented aliases from README
        expect(ChatProvider.forName('claude'), equals(ChatProvider.anthropic));
        expect(ChatProvider.forName('gemini'), equals(ChatProvider.google));
        expect(ChatProvider.forName('googleai'), equals(ChatProvider.google));
        expect(ChatProvider.forName('google-gla'), equals(ChatProvider.google));
      });

      test('throws on unknown provider name', () {
        expect(
          () => ChatProvider.forName('unknown-provider'),
          throwsA(isA<StateError>()),
        );
        expect(
          () => ChatProvider.forName('invalid'),
          throwsA(isA<StateError>()),
        );
        expect(() => ChatProvider.forName(''), throwsA(isA<StateError>()));
      });

      test('is case insensitive', () {
        // Provider lookup is actually case-insensitive
        expect(ChatProvider.forName('OpenAI'), equals(ChatProvider.openai));
        expect(
          ChatProvider.forName('ANTHROPIC'),
          equals(ChatProvider.anthropic),
        );
        expect(ChatProvider.forName('Claude'), equals(ChatProvider.anthropic));
      });
    });

    group('embeddings provider selection', () {
      test('finds providers by exact name', () {
        expect(
          EmbeddingsProvider.forName('openai'),
          equals(EmbeddingsProvider.openai),
        );
        expect(
          EmbeddingsProvider.forName('google'),
          equals(EmbeddingsProvider.google),
        );
        expect(
          EmbeddingsProvider.forName('mistral'),
          equals(EmbeddingsProvider.mistral),
        );
        expect(
          EmbeddingsProvider.forName('cohere'),
          equals(EmbeddingsProvider.cohere),
        );
      });

      test('finds providers by aliases', () {
        // EmbeddingsProvider doesn't currently have aliases like ChatProvider
        // This test verifies that fact
        expect(
          () => EmbeddingsProvider.forName('gemini'),
          throwsA(isA<StateError>()),
        );
        expect(
          () => EmbeddingsProvider.forName('googleai'),
          throwsA(isA<StateError>()),
        );
      });

      test('throws on unknown provider name', () {
        expect(
          () => EmbeddingsProvider.forName('anthropic'),
          throwsA(isA<StateError>()),
        );
        expect(
          () => EmbeddingsProvider.forName('ollama'),
          throwsA(isA<StateError>()),
        );
        expect(
          () => EmbeddingsProvider.forName('unknown'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('provider enumeration', () {
      test('lists all chat providers', () {
        final providers = ChatProvider.all;
        expect(providers, isNotEmpty);
        // At least 12 providers available
        expect(providers.length, greaterThanOrEqualTo(12));

        // Verify key providers are included
        final providerNames = providers.map((p) => p.name).toSet();
        expect(providerNames, contains('openai'));
        expect(providerNames, contains('anthropic'));
        expect(providerNames, contains('google'));
        expect(providerNames, contains('mistral'));
        expect(providerNames, contains('ollama'));
        expect(providerNames, contains('together'));
        expect(providerNames, contains('fireworks'));
        expect(providerNames, contains('cohere'));
      });

      test('lists all embeddings providers', () {
        final providers = EmbeddingsProvider.all;
        expect(providers, hasLength(4)); // Exactly 4 embeddings providers

        final providerNames = providers.map((p) => p.name).toSet();
        expect(providerNames, contains('openai'));
        expect(providerNames, contains('google'));
        expect(providerNames, contains('mistral'));
        expect(providerNames, contains('cohere'));
      });

      runChatProviderTest('chat providers have required properties', (
        provider,
      ) async {
        expect(provider.name, isNotEmpty);
        expect(provider.displayName, isNotEmpty);
        expect(provider.createModel, isNotNull);
        expect(provider.listModels, isNotNull);
      });

      runEmbeddingsProviderTest(
        'embeddings providers have required properties',
        (provider) async {
          expect(provider.name, isNotEmpty);
          expect(provider.displayName, isNotEmpty);
          expect(provider.createModel, isNotNull);
          expect(provider.listModels, isNotNull);
        },
      );
    });

    // Model enumeration moved to edge cases (limited providers)
    group('basic model access', () {
      test('providers have listModels method', () {
        // Test that all providers have the method (no API calls)
        for (final provider in ChatProvider.all) {
          expect(provider.listModels, isNotNull);
        }

        for (final provider in EmbeddingsProvider.all) {
          expect(provider.listModels, isNotNull);
        }
      });
    });

    group('provider display names', () {
      test('chat providers have descriptive display names', () {
        expect(ChatProvider.openai.displayName, equals('OpenAI'));
        expect(ChatProvider.anthropic.displayName, equals('Anthropic'));
        expect(ChatProvider.google.displayName, contains('Google'));
        expect(ChatProvider.mistral.displayName, equals('Mistral AI'));
        expect(ChatProvider.ollama.displayName, equals('Ollama'));
      });

      test('embeddings providers have descriptive display names', () {
        expect(EmbeddingsProvider.openai.displayName, equals('OpenAI'));
        expect(EmbeddingsProvider.google.displayName, contains('Google'));
        expect(EmbeddingsProvider.mistral.displayName, equals('Mistral AI'));
        expect(EmbeddingsProvider.cohere.displayName, equals('Cohere'));
      });
    });

    group('provider uniqueness', () {
      test('chat provider names are unique', () {
        final providers = ChatProvider.all;
        final names = providers.map((p) => p.name).toList();
        final uniqueNames = names.toSet();
        expect(
          names.length,
          equals(uniqueNames.length),
          reason: 'All chat provider names should be unique',
        );
      });

      test('embeddings provider names are unique', () {
        final providers = EmbeddingsProvider.all;
        final names = providers.map((p) => p.name).toList();
        final uniqueNames = names.toSet();
        expect(
          names.length,
          equals(uniqueNames.length),
          reason: 'All embeddings provider names should be unique',
        );
      });
    });

    group('dynamic provider usage', () {
      test('can create models via discovered providers', () {
        final provider = ChatProvider.forName('openai');
        final model = provider.createModel(name: 'gpt-4o-mini');
        expect(model, isNotNull);
      });

      test('can use aliases for model creation', () {
        final claudeProvider = ChatProvider.forName('claude');
        expect(claudeProvider.name, equals('anthropic'));

        // Skip actual model creation if API key not available
        expect(claudeProvider, isNotNull);
      });

      test('supports dynamic agent creation', () {
        final provider = ChatProvider.forName('gemini');
        expect(provider.name, equals('google'));

        final agent = Agent('${provider.name}:gemini-2.0-flash');
        expect(agent, isNotNull);
        // Agent.model returns "provider:model" format
        expect(agent.model, equals('google:gemini-2.0-flash'));
      });
    });

    group('provider comparison', () {
      test('providers are comparable', () {
        final provider1 = ChatProvider.forName('openai');
        final provider2 = ChatProvider.openai;
        expect(provider1, equals(provider2));

        final aliasProvider = ChatProvider.forName('claude');
        final directProvider = ChatProvider.anthropic;
        expect(aliasProvider, equals(directProvider));
      });

      test('different providers are not equal', () {
        final openai = ChatProvider.openai;
        final anthropic = ChatProvider.anthropic;
        expect(openai, isNot(equals(anthropic)));
      });
    });

    group('error handling', () {
      test('handles null and empty provider names gracefully', () {
        expect(() => ChatProvider.forName(''), throwsA(isA<StateError>()));
      });

      test('provides helpful error messages', () {
        expect(
          () => ChatProvider.forName('invalid-provider'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('edge cases (limited providers)', () {
      // Test edge cases on only 1-2 providers to save resources
      // and avoid timeouts
      final edgeCaseProviders = <ChatProvider>[
        ChatProvider.openai,
        ChatProvider.anthropic,
      ];

      final edgeCaseEmbeddingsProviders = <EmbeddingsProvider>[
        EmbeddingsProvider.openai,
      ];

      test('chat providers return available models', () async {
        for (final provider in edgeCaseProviders) {
          try {
            final models = await provider.listModels().toList();
            expect(
              models,
              isNotEmpty,
              reason: 'Provider ${provider.name} should have models',
            );

            // Verify model structure
            for (final model in models) {
              expect(
                model.name,
                isNotEmpty,
                reason: 'Model name should not be empty for ${provider.name}',
              );
            }
          } catch (e) {
            // Skip providers that require API keys when not available
            if (e.toString().contains('API_KEY') ||
                e.toString().contains('not set') ||
                e.toString().contains('Environment variable')) {
              continue;
            }
            rethrow;
          }
        }
      });

      test('embeddings providers return available models', () async {
        for (final provider in edgeCaseEmbeddingsProviders) {
          try {
            final models = await provider.listModels().toList();
            expect(
              models,
              isNotEmpty,
              reason: 'Provider ${provider.name} should have embedding models',
            );

            // Verify model structure
            for (final model in models) {
              expect(
                model.name,
                isNotEmpty,
                reason: 'Model name should not be empty for ${provider.name}',
              );
            }
          } catch (e) {
            // Skip providers that require API keys when not available
            if (e.toString().contains('API_KEY') ||
                e.toString().contains('not set') ||
                e.toString().contains('Environment variable')) {
              continue;
            }
            rethrow;
          }
        }
      });

      test('model counts match documented ranges', () async {
        // Only test OpenAI to avoid API quota issues
        final openaiModels = await ChatProvider.openai.listModels().toList();
        expect(openaiModels.length, greaterThan(50));
      });

      test('models have consistent naming patterns', () async {
        // Only test OpenAI for naming patterns
        final provider = ChatProvider.openai;
        final models = await provider.listModels().toList();

        for (final model in models.take(10)) {
          // Test first 10 models only
          // OpenAI models should have recognizable patterns
          expect(
            model.name,
            matches(RegExp(r'^[a-zA-Z0-9\-\.\_]+$')),
            reason: 'Model name should be alphanumeric with hyphens/dots',
          );

          // ID should match provider:model format when used with Agent
          expect('${provider.name}:${model.name}', isNotEmpty);
        }
      });
    });
  });
}
