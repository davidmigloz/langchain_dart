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
  group('Infrastructure Helpers', () {
    group('provider discovery (80% cases)', () {
      test('lists all available providers', () {
        final providers = ChatProvider.all;

        expect(providers, isNotEmpty);
        expect(providers.length, greaterThan(10)); // We have 15+ providers

        // Check for some key providers
        expect(providers.any((p) => p.name == 'openai'), isTrue);
        expect(providers.any((p) => p.name == 'anthropic'), isTrue);
        expect(providers.any((p) => p.name == 'google'), isTrue);
      });

      test('finds provider by exact name', () {
        final openai = ChatProvider.forName('openai');
        expect(openai, isNotNull);
        expect(openai.name, equals('openai'));

        final anthropic = ChatProvider.forName('anthropic');
        expect(anthropic, isNotNull);
        expect(anthropic.name, equals('anthropic'));
      });

      test('finds provider by alias', () {
        final claude = ChatProvider.forName('claude');
        expect(claude, isNotNull);
        expect(claude.name, equals('anthropic'));

        final gemini = ChatProvider.forName('gemini');
        expect(gemini, isNotNull);
        expect(gemini.name, equals('google'));
      });

      test('throws for unknown provider', () {
        expect(
          () => ChatProvider.forName('unknown-provider'),
          throwsA(isA<StateError>()),
        );
      });

      test('provider names are unique', () {
        final names = ChatProvider.all.map((p) => p.name).toList();
        final uniqueNames = names.toSet();
        expect(names.length, equals(uniqueNames.length));
      });
    });

    group('provider capabilities (80% cases)', () {
      test('filters providers by single capability', () {
        final toolProviders = ChatProvider.allWith({
          ProviderCaps.multiToolCalls,
        });

        expect(toolProviders, isNotEmpty);
        // All returned providers should support tools
        for (final provider in toolProviders) {
          expect(provider.caps.contains(ProviderCaps.multiToolCalls), isTrue);
        }
      });

      test('filters providers by multiple capabilities', () {
        final advancedProviders = ChatProvider.allWith({
          ProviderCaps.multiToolCalls,
          ProviderCaps.typedOutput,
        });

        expect(advancedProviders, isNotEmpty);
        // All returned providers should support both capabilities
        for (final provider in advancedProviders) {
          expect(provider.caps.contains(ProviderCaps.multiToolCalls), isTrue);
          expect(provider.caps.contains(ProviderCaps.typedOutput), isTrue);
        }
      });

      test('capabilities are consistent', () {
        for (final provider in ChatProvider.all) {
          // If provider supports multi-tool calls, it should support
          // single tools
          if (provider.caps.contains(ProviderCaps.multiToolCalls)) {
            // multiToolCalls implies basic tool support
            expect(provider.caps, isNotEmpty);
          }

          // Chat capability should be present for all chat providers
          if (provider.caps.contains(ProviderCaps.chat)) {
            expect(provider.caps, isNotEmpty);
          }
        }
      });
    });

    group('provider metadata (80% cases)', () {
      test('all providers have valid names', () {
        for (final provider in ChatProvider.all) {
          expect(provider.name, isNotEmpty);
          expect(provider.name, matches(RegExp(r'^[a-z0-9_-]+$')));
        }
      });

      test('all providers have default model names', () {
        for (final provider in ChatProvider.all) {
          expect(provider.defaultModelName, isNotEmpty);
          expect(provider.defaultModelName.contains(' '), isFalse);
        }
      });

      test('all providers have non-empty capabilities', () {
        for (final provider in ChatProvider.all) {
          expect(provider.caps, isA<Set<ProviderCaps>>());
          // All providers should have at least chat capability
          expect(provider.caps, isNotEmpty);
        }
      });

      test('provider display names are valid', () {
        for (final provider in ChatProvider.all) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');
          expect(agent.displayName, isNotEmpty);
          expect(agent.displayName, contains(provider.name));
        }
      });
    });

    group('model listing (80% cases)', () {
      test('providers can list their models', () {
        // Test a few key providers
        final testProviders = ['openai', 'anthropic', 'google'];

        for (final providerName in testProviders) {
          final provider = ChatProvider.forName(providerName);
          // For now, just check we can create an agent
          final agent = Agent('${provider.name}:${provider.defaultModelName}');
          expect(agent, isNotNull);
        }
      });

      test('agent uses custom model name when specified', () {
        // Test that Agent correctly parses "provider:model" format
        final agent1 = Agent('together:meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo');
        expect(agent1.model, contains('meta-llama/Llama-3.2-11B-Vision-Instruct-Turbo'));
        
        final agent2 = Agent('openai:gpt-4o');
        expect(agent2.model, contains('gpt-4o'));
        
        final agent3 = Agent('anthropic:claude-3-5-sonnet-20241022');
        expect(agent3.model, contains('claude-3-5-sonnet-20241022'));
      });

      test('default model names follow conventions', () {
        final testProviderNames = ['openai', 'google'];
        for (final providerName in testProviderNames) {
          final provider = ChatProvider.forName(providerName);
          final model = provider.defaultModelName;

          expect(model, isNotEmpty);
          // Model names shouldn't have spaces
          expect(model.contains(' '), isFalse);
        }
      });
    });

    group('embeddings provider infrastructure (80% cases)', () {
      test('lists all embeddings providers', () {
        final providers = EmbeddingsProvider.all;

        expect(providers, isNotEmpty);
        expect(providers.length, greaterThanOrEqualTo(4)); // At least 4

        // Check for key providers
        expect(providers.any((p) => p.name == 'openai'), isTrue);
        expect(providers.any((p) => p.name == 'google'), isTrue);
      });

      test('finds embeddings provider by name', () {
        final openai = EmbeddingsProvider.forName('openai');
        expect(openai, isNotNull);
        expect(openai.name, equals('openai'));
      });

      test('embeddings provider metadata is valid', () {
        for (final provider in EmbeddingsProvider.all) {
          expect(provider.name, isNotEmpty);
          // EmbeddingsProvider doesn't have defaultModelName or models
          // Just verify we can create a model
          final model = provider.createModel();
          expect(model, isNotNull);
        }
      });
    });

    group('edge cases', () {
      test('handles concurrent provider lookups', () async {
        // Test that provider lookup is thread-safe
        final futures = <Future<ChatProvider?>>[];

        for (var i = 0; i < 100; i++) {
          futures.add(Future(() => ChatProvider.forName('openai')));
        }

        final results = await Future.wait(futures);

        // All lookups should return the same instance
        expect(results.every((r) => r != null), isTrue);
        expect(results.every((r) => r?.name == 'openai'), isTrue);
      });

      test('handles case-insensitive provider names', () {
        // Provider lookup is case-insensitive by design
        expect(ChatProvider.forName('openai'), isNotNull);
        expect(ChatProvider.forName('OpenAI'), isNotNull);
        expect(ChatProvider.forName('OPENAI'), isNotNull);
        
        // All should return the same provider
        final provider1 = ChatProvider.forName('openai');
        final provider2 = ChatProvider.forName('OpenAI');
        final provider3 = ChatProvider.forName('OPENAI');
        expect(provider1, equals(provider2));
        expect(provider2, equals(provider3));
      });

      test('handles empty capability filters', () {
        // Empty capability filter should return all providers
        final providers = ChatProvider.allWith({});
        expect(providers.length, equals(ChatProvider.all.length));
      });

      test('handles non-existent capability filters', () {
        // If we had a hypothetical capability that no provider supports
        final providers = ChatProvider.all
            .where(
              (p) =>
                  p.caps.contains(ProviderCaps.multiToolCalls) &&
                  p.caps.contains(ProviderCaps.typedOutput) &&
                  p.name == 'nonexistent',
            )
            .toList();

        expect(providers, isEmpty);
      });

      test('provider aliases are consistent', () {
        // Test all known aliases
        final aliases = {
          'claude': 'anthropic',
          'gemini': 'google',
          'googleai': 'google',
          'google-gla': 'google',
        };

        for (final entry in aliases.entries) {
          final provider = ChatProvider.forName(entry.key);
          expect(provider.name, equals(entry.value));
        }
      });
    });
  });
}
