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

import 'test_tools.dart';

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

  group('Streaming', () {
    group('basic streaming responses (80% cases)', () {
      runProviderTest('simple streaming works', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];

        await for (final chunk in agent.runStream('Say "hello world"')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join();
        expect(fullText.toLowerCase(), contains('hello'));
        expect(fullText.toLowerCase(), contains('world'));
      });

      runProviderTest('streaming preserves message order', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];

        await for (final chunk in agent.runStream('Count from 1 to 3')) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText, contains('1'));
        expect(fullText, contains('2'));
        expect(fullText, contains('3'));

        // Check that numbers appear in order
        final index1 = fullText.indexOf('1');
        final index2 = fullText.indexOf('2');
        final index3 = fullText.indexOf('3');

        expect(index1, greaterThanOrEqualTo(0));
        expect(index2, greaterThan(index1));
        expect(index3, greaterThan(index2));
      });

      runProviderTest('streaming accumulates correctly', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];
        final accumulated = StringBuffer();

        await for (final chunk in agent.runStream(
          'Write a short sentence about cats.',
        )) {
          chunks.add(chunk.output);
          accumulated.write(chunk.output);
        }

        // Each chunk should be non-empty
        for (final chunk in chunks) {
          expect(chunk, isNotEmpty);
        }

        // Accumulated should contain expected content
        final accumulatedText = accumulated.toString();
        expect(accumulatedText.toLowerCase(), contains('cat'));
        expect(accumulatedText.length, greaterThan(10));
      });
    });

    group('tool call streaming (80% cases)', () {
      runProviderTest(
        'streams tool calls and results',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool],
          );

          final chunks = <String>[];
          await for (final chunk in agent.runStream(
            'Use string_tool with input "test"',
          )) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);
          final fullText = chunks.join();
          expect(fullText, isNotEmpty);

          // Result should contain the streamed output
          expect(
            fullText.toLowerCase(),
            anyOf(
              contains('processed'),
              contains('string'),
              contains('test'),
              contains('result'),
            ),
          );
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
      );

      runProviderTest('streams multiple tool calls', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool, intTool],
        );

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'First use string_tool with "hello", then use int_tool with 42',
        )) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join();

        // Should see evidence of both tools being used
        expect(
          fullText.toLowerCase(),
          anyOf(contains('hello'), contains('processed'), contains('string')),
        );
        expect(fullText, contains('42'));
      }, requiredCaps: {ProviderCaps.multiToolCalls});

      runProviderTest(
        'tool streaming preserves order',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [intTool],
          );

          final chunks = <String>[];
          await for (final chunk in agent.runStream(
            'Use int_tool three times: first with 1, then 2, then 3',
          )) {
            chunks.add(chunk.output);
          }

          final fullText = chunks.join();
          expect(fullText, isNotEmpty);

          // Should see all three numbers in the result
          expect(fullText, contains('1'));
          expect(fullText, contains('2'));
          expect(fullText, contains('3'));
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
      );
    });

    group('multi-turn streaming (80% cases)', () {
      runProviderTest('streaming with conversation history', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // First turn - establish context
        final result = await agent.run(
          'My favorite number is 42.',
          history: history,
        );
        history.addAll(result.messages);

        // Second turn - stream with history
        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'What is my favorite number?',
          history: history,
        )) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText, contains('42'));
      });

      runProviderTest('multi-turn streaming maintains context', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // Turn 1: Establish topic
        final result = await agent.run(
          'I want to learn about penguins.',
          history: history,
        );
        history.addAll(result.messages);

        // Turn 2: Stream follow-up
        final chunks1 = <String>[];
        ChatResult<String>? streamResult;
        await for (final chunk in agent.runStream(
          'Tell me one interesting fact.',
          history: history,
        )) {
          chunks1.add(chunk.output);
          streamResult = chunk;
        }
        if (streamResult != null) {
          history.addAll(streamResult.messages);
        }

        // Turn 3: Stream another follow-up
        final chunks2 = <String>[];
        await for (final chunk in agent.runStream(
          'What do they eat?',
          history: history,
        )) {
          chunks2.add(chunk.output);
        }

        // Both streamed responses should be about penguins
        expect(
          chunks1.join().toLowerCase(),
          anyOf(
            contains('penguin'),
            contains('bird'),
            contains('antarctic'),
            contains('swim'),
          ),
        );
        expect(
          chunks2.join().toLowerCase(),
          anyOf(
            contains('fish'),
            contains('krill'),
            contains('squid'),
            contains('eat'),
            contains('food'),
          ),
        );
      });

      runProviderTest('streaming with tool history', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [intTool],
        );
        final history = <ChatMessage>[];

        // First turn - use tool
        final result = await agent.run(
          'Use int_tool with 100',
          history: history,
        );
        history.addAll(result.messages);

        // Second turn - stream reference to previous tool use
        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'What was the result of the calculation?',
          history: history,
        )) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText, contains('100'));
      }, requiredCaps: {ProviderCaps.multiToolCalls});
    });

    group('edge cases', () {
      runProviderTest('handles stream interruption gracefully', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];

        // Start streaming but break early
        await for (final chunk in agent.runStream(
          'Count from 1 to 100 slowly',
        )) {
          chunks.add(chunk.output);
          if (chunks.length >= 5) {
            break; // Interrupt the stream
          }
        }

        // Should have collected some chunks before interruption
        expect(chunks, isNotEmpty);
        expect(chunks.length, greaterThanOrEqualTo(5));
      }, edgeCase: true);

      runProviderTest('handles empty streaming responses', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];

        // Request that might result in minimal streaming
        await for (final chunk in agent.runStream('')) {
          chunks.add(chunk.output);
        }

        // Even empty input should produce some response
        expect(chunks, isNotEmpty);
      }, edgeCase: true);

      runProviderTest('accumulates very long streams', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final chunks = <String>[];
        var totalLength = 0;

        await for (final chunk in agent.runStream(
          'Write a detailed 5-paragraph essay about the importance of '
          'artificial intelligence in modern society.',
        )) {
          chunks.add(chunk.output);
          totalLength += chunk.output.length;
        }

        // Should produce a substantial response
        expect(chunks.length, greaterThan(10)); // Many chunks
        expect(totalLength, greaterThan(500)); // Long total output

        // Content should be coherent when joined
        final fullText = chunks.join();
        expect(fullText.toLowerCase(), contains('artificial'));
        expect(fullText.toLowerCase(), contains('intelligence'));
      }, edgeCase: true);
    });
  });
}
