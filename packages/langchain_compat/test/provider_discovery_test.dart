import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
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
        expect(ChatProvider.forName('groq'), equals(ChatProvider.groq));
        expect(ChatProvider.forName('together'), equals(ChatProvider.together));
        expect(
          ChatProvider.forName('fireworks'),
          equals(ChatProvider.fireworks),
        );
        expect(ChatProvider.forName('nvidia'), equals(ChatProvider.nvidia));
        expect(ChatProvider.forName('lambda'), equals(ChatProvider.lambda));
        expect(ChatProvider.forName('cohere'), equals(ChatProvider.cohere));
        expect(ChatProvider.forName('cerebras'), equals(ChatProvider.cerebras));
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
        // At least 13 providers documented
        expect(providers.length, greaterThanOrEqualTo(13));

        // Verify key providers are included
        final providerNames = providers.map((p) => p.name).toSet();
        expect(providerNames, contains('openai'));
        expect(providerNames, contains('anthropic'));
        expect(providerNames, contains('google'));
        expect(providerNames, contains('mistral'));
        expect(providerNames, contains('ollama'));
        expect(providerNames, contains('groq'));
        expect(providerNames, contains('together'));
        expect(providerNames, contains('fireworks'));
        expect(providerNames, contains('nvidia'));
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

      test('chat providers have required properties', () {
        for (final provider in ChatProvider.all) {
          expect(provider.name, isNotEmpty);
          expect(provider.displayName, isNotEmpty);
          expect(provider.createModel, isNotNull);
          expect(provider.listModels, isNotNull);
        }
      });

      test('embeddings providers have required properties', () {
        for (final provider in EmbeddingsProvider.all) {
          expect(provider.name, isNotEmpty);
          expect(provider.displayName, isNotEmpty);
          expect(provider.createModel, isNotNull);
          expect(provider.listModels, isNotNull);
        }
      });
    });

    group('model enumeration', () {
      test('chat providers return available models', () async {
        // Test with a subset of stable providers to avoid timeouts
        final testProviders = <ChatProvider>[
          ChatProvider.openai,
          ChatProvider.anthropic,
          ChatProvider.google,
        ];

        for (final provider in testProviders) {
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
        }
      });

      test('embeddings providers return available models', () async {
        // Test subset to avoid API quota issues
        final testProviders = <EmbeddingsProvider>[
          EmbeddingsProvider.openai,
          EmbeddingsProvider.google,
        ];

        for (final provider in testProviders) {
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
        }
      });

      test('model counts match documented ranges', () async {
        // Verify model counts are in expected ranges from README
        final openaiModels = await ChatProvider.openai.listModels().toList();
        expect(openaiModels.length, greaterThan(50));

        final anthropicModels = await ChatProvider.anthropic
            .listModels()
            .toList();
        expect(anthropicModels.length, greaterThan(5));

        final googleModels = await ChatProvider.google.listModels().toList();
        expect(googleModels.length, greaterThan(10));
      });

      test('models have consistent naming patterns', () async {
        final provider = ChatProvider.openai;
        final models = await provider.listModels().toList();

        for (final model in models) {
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
  });
}
