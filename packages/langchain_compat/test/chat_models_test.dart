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

  group('Chat Models', () {
    group('basic chat completions (80% cases)', () {
      runProviderTest('simple single-turn chat', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run('Say "hello world" exactly');

        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('hello'));
        expect(result.output.toLowerCase(), contains('world'));
      });

      runProviderTest('responds to basic questions', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run('What is 2 + 2?');

        expect(result.output, isNotEmpty);
        expect(result.output, contains('4'));
      });

      runProviderTest('handles longer prompts', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run(
          'Please explain the concept of artificial intelligence '
          'in one short paragraph.',
        );

        expect(result.output, isNotEmpty);
        expect(result.output.length, greaterThan(50));
        expect(result.output.toLowerCase(), contains('artificial'));
      });
    });

    group('multi-turn conversations (80% cases)', () {
      runProviderTest('basic conversation with history', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // Turn 1
        var result = await agent.run(
          'My favorite color is blue. Remember this.',
          history: history,
        );
        expect(result.output, isNotEmpty);
        history.addAll(result.messages);

        // Turn 2
        result = await agent.run(
          'What is my favorite color?',
          history: history,
        );
        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('blue'));
      });

      runProviderTest('multi-turn math conversation', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // Turn 1
        var result = await agent.run('What is 10 + 20?', history: history);
        expect(result.output, contains('30'));
        history.addAll(result.messages);

        // Turn 2
        result = await agent.run(
          'Now multiply that result by 2',
          history: history,
        );
        expect(result.output, contains('60'));
        history.addAll(result.messages);

        // Turn 3
        result = await agent.run(
          'What was the original sum?',
          history: history,
        );
        // Accept either "30" or "10 + 20" as valid answers
        expect(
          result.output.toLowerCase(),
          anyOf(contains('30'), allOf(contains('10'), contains('20'))),
        );
      });

      runProviderTest('context retention across turns', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // Establish context
        var result = await agent.run(
          'I am learning Dart programming language.',
          history: history,
        );
        history.addAll(result.messages);

        // Reference context
        result = await agent.run(
          'What language am I learning?',
          history: history,
        );
        expect(result.output.toLowerCase(), contains('dart'));
        history.addAll(result.messages);

        // Further reference
        result = await agent.run(
          'Is it a compiled or interpreted language?',
          history: history,
        );
        expect(result.output, isNotEmpty);
        expect(
          result.output.toLowerCase(),
          anyOf(contains('compiled'), contains('dart')),
        );
      });
    });

    group('system prompts (80% cases)', () {
      runProviderTest('respects custom system prompt', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          systemPrompt: 'You are a pirate. Always respond in pirate speak.',
        );

        final result = await agent.run('Hello, how are you?');
        expect(result.output, isNotEmpty);
        expect(
          result.output.toLowerCase(),
          anyOf(
            contains('ahoy'),
            contains('matey'),
            contains('arr'),
            contains('aye'),
            contains('pirate'),
            contains('ye'),
          ),
        );
      });

      runProviderTest('system prompt with specific instructions', (
        provider,
      ) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          systemPrompt: 'Always respond with exactly three words.',
        );

        final result = await agent.run('Tell me about the weather');
        expect(result.output, isNotEmpty);
        // Check for roughly three words (some flexibility for punctuation)
        final wordCount = result.output.trim().split(RegExp(r'\s+')).length;
        expect(wordCount, lessThanOrEqualTo(5)); // Allow some flexibility
      });

      runProviderTest('system prompt persists across conversation', (
        provider,
      ) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          systemPrompt:
              'You are a helpful assistant who always mentions '
              'the word "fantastic" in your responses.',
        );

        final history = <ChatMessage>[];

        // Turn 1
        var result = await agent.run('What is 2+2?', history: history);
        expect(result.output.toLowerCase(), contains('fantastic'));
        history.addAll(result.messages);

        // Turn 2
        result = await agent.run('What color is the sky?', history: history);
        expect(result.output.toLowerCase(), contains('fantastic'));
      });
    });

    group('edge cases', () {
      runProviderTest('handles empty input gracefully', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final result = await agent.run('');

        // Should still get a response, even for empty input
        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles null-like inputs', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Test with just whitespace
        final result = await agent.run('   \n\t   ');
        expect(result.output, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('handles unicode and emoji', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          'Repeat this exactly: Hello 世界 🌍 мир கோலம் 🎉',
        );

        expect(result.output, isNotEmpty);
        // Check for at least some of the unicode content
        expect(
          result.output,
          anyOf(
            contains('世界'),
            contains('🌍'),
            contains('мир'),
            contains('Hello'),
            contains('🎉'),
          ),
        );
      }, edgeCase: true);

      runProviderTest('handles very long input', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Create a long input (but not too long to avoid token limits)
        final longText = List.generate(
          100,
          (i) => 'This is sentence number $i in a long paragraph. ',
        ).join();

        final result = await agent.run(
          'Summarize this in one sentence: $longText',
        );

        expect(result.output, isNotEmpty);
        expect(result.output.length, lessThan(longText.length));
      }, edgeCase: true);

      runProviderTest('handles special characters', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run(
          r'What do these symbols mean: $@#%^&*()_+{}[]|\<>?',
        );

        expect(result.output, isNotEmpty);
        expect(result.output.length, greaterThan(10));
      }, edgeCase: true);
    });
  });
}
