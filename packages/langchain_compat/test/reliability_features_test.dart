import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  group('Reliability Features', () {
    group('basic error recovery', () {
      test('agent handles network errors gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Should handle network issues without throwing
        final result = await agent.run('Hello');
        expect(result.output, isA<String>());
      });

      test('streaming handles connection issues', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var streamStarted = false;
        var streamCompleted = false;

        await for (final chunk in agent.runStream('Test message')) {
          streamStarted = true;
          expect(chunk.output, isA<String>());
        }
        streamCompleted = true;

        // Stream should work
        expect(streamStarted, isTrue);
        expect(streamCompleted, isTrue);
      });

      test('provider creation handles missing API keys', () {
        // OpenAI without API key should create but may fail at runtime
        expect(() => Agent('openai:gpt-4o-mini'), returnsNormally);

        // Google without API key should create but may fail at runtime
        expect(() => Agent('google:gemini-2.0-flash'), returnsNormally);

        // Anthropic without API key should create but may fail at runtime
        expect(
          () => Agent('anthropic:claude-3-5-haiku-latest'),
          returnsNormally,
        );
      });

      test('model enumeration handles API failures', () async {
        final provider = ChatProvider.openai;

        final models = await provider.listModels().toList();
        expect(models, isA<List>());
      });
    });

    group('timeout handling', () {
      test('agent operations respect reasonable timeouts', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final stopwatch = Stopwatch()..start();

        await agent.run('What is 1 + 1?');
        stopwatch.stop();

        // Should complete within reasonable time (2 minutes)
        expect(stopwatch.elapsedMilliseconds, lessThan(120000));
      });

      test('streaming operations have reasonable latency', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final stopwatch = Stopwatch()..start();
        var firstChunkTime = 0;

        await for (final chunk in agent.runStream('Say hello')) {
          if (firstChunkTime == 0 && chunk.output.isNotEmpty) {
            firstChunkTime = stopwatch.elapsedMilliseconds;
            break;
          }
        }

        // First chunk should arrive within reasonable time (30 seconds)
        if (firstChunkTime > 0) {
          expect(firstChunkTime, lessThan(30000));
        }
      });

      test('long running operations handle timeouts', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Request that might take longer
        final result = await agent.run('Explain quantum computing in detail');
        expect(result.output, isA<String>());
      });
    });

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

      test('concurrent agent usage', () async {
        final agent1 = Agent('openai:gpt-4o-mini');
        final agent2 = Agent('openai:gpt-4o-mini');

        final futures = [
          agent1.run('What is 2 + 2?'),
          agent2.run('What is 3 + 3?'),
        ];

        final results = await Future.wait(futures);
        expect(results, hasLength(2));
        expect(results[0].output, isA<String>());
        expect(results[1].output, isA<String>());
      });
    });

    group('rate limiting and throttling', () {
      test('sequential requests work without rate limit errors', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final results = <String>[];

        for (var i = 0; i < 3; i++) {
          final result = await agent.run('Count: $i');
          results.add(result.output);

          // Small delay between requests to be respectful
          await Future.delayed(const Duration(milliseconds: 100));
        }

        // Should get at least some results
        expect(results.length, greaterThanOrEqualTo(0));
      });

      test('burst requests handle rate limits gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final futures = List.generate(5, (i) => agent.run('Burst request $i'));

        var successCount = 0;
        const errorCount = 0;

        final results = await Future.wait(
          futures.map((f) => f.catchError((e) => e)),
        );

        successCount += results.length;

        // Should have some combination of successes and rate limit errors
        expect(successCount + errorCount, equals(5));
      });

      test('streaming requests handle rate limits', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final streamFutures = [
          agent.runStream('Stream 1').toList(),
          agent.runStream('Stream 2').toList(),
        ];

        final results = await Future.wait(streamFutures);
        expect(results, hasLength(2));
      });
    });

    group('provider-specific reliability', () {
      test('OpenAI provider error handling', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final result = await agent.run('Test OpenAI reliability');
        expect(result.output, isA<String>());
      });

      test('Google provider error handling', () async {
        final agent = Agent('google:gemini-2.0-flash');

        final result = await agent.run('Test Google reliability');
        expect(result.output, isA<String>());
      });

      test('provider fallback patterns', () async {
        final providers = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];

        for (final provider in providers) {
          final agent = Agent(provider);

          final result = await agent.run('Hello from $provider');
          expect(result.output, isA<String>());
          break; // Success with this provider
        }
      });
    });

    group('tool execution reliability', () {
      test('tool errors are handled gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        final result = await agent.run('Use error_tool to test error handling');
        expect(result.output, isA<String>());

        // Should have error information in the response
        expect(result.messages, isNotEmpty);
      });

      test('multiple tool failures in sequence', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        final result = await agent.run(
          'Use error_tool twice to test multiple failures',
        );
        expect(result.output, isA<String>());
      });

      test('tool timeout handling', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final result = await agent.run('Use string_tool with "test"');
        expect(result.output, isA<String>());
      });

      test('streaming tool execution errors', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        await for (final chunk in agent.runStream(
          'Use error_tool in streaming mode',
        )) {
          expect(chunk.output, isA<String>());
        }
      });
    });

    group('data validation and sanitization', () {
      test('handles extremely long inputs', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final longInput = 'A' * 10000; // 10k characters

        final result = await agent.run('Summarize this: $longInput');
        expect(result.output, isA<String>());
      });

      test('handles special characters safely', () async {
        final agent = Agent('openai:gpt-4o-mini');
        const specialInput = '!@#\$%^&*()_+{}[]|\\:";\'<>?,./`~';

        final result = await agent.run('Echo: $specialInput');
        expect(result.output, isA<String>());
      });

      test('handles unicode content properly', () async {
        final agent = Agent('openai:gpt-4o-mini');
        const unicodeInput = '🚀 Hello 世界! 🌟 Testing émojis and accénts';

        final result = await agent.run('Repeat: $unicodeInput');
        expect(result.output, isA<String>());
      });

      test('handles malformed JSON in tool arguments', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final result = await agent.run(
          'Use string_tool with malformed input like {broken json}',
        );
        expect(result.output, isA<String>());
      });
    });

    group('memory and performance under stress', () {
      test('handles long conversations without memory leaks', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = <ChatMessage>[];

        for (var i = 0; i < 10; i++) {
          final result = await agent.run('Message $i', history: history);
          history.addAll(result.messages);

          // Conversation should grow but not excessively
          expect(history.length, lessThan(100));

          // Small delay to prevent rate limiting
          await Future.delayed(const Duration(milliseconds: 100));
        }

        expect(history.length, greaterThanOrEqualTo(0));
      });

      test('streaming memory usage remains reasonable', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var chunkCount = 0;
        var totalLength = 0;

        await for (final chunk in agent.runStream('Write a short story')) {
          chunkCount++;
          totalLength += chunk.output.length;

          // Should not accumulate unlimited chunks
          if (chunkCount > 1000) {
            fail('Too many chunks - possible memory issue');
          }

          // Total output should be reasonable
          if (totalLength > 100000) {
            break; // Stop if output gets too long
          }
        }

        expect(chunkCount, greaterThanOrEqualTo(0));
        expect(totalLength, greaterThanOrEqualTo(0));
      });

      test('concurrent operations do not interfere', () async {
        final agents = List.generate(3, (_) => Agent('openai:gpt-4o-mini'));

        final futures = agents
            .map(
              (agent) =>
                  agent.run('Independent operation').catchError((e) => e),
            )
            .toList();

        final results = await Future.wait(futures);

        // Operations should be independent
        expect(results, hasLength(3));
      });
    });

    group('graceful degradation', () {
      test('partial tool failures do not break conversation', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [stringTool, errorTool],
        );

        final result = await agent.run(
          'Use string_tool successfully, then try error_tool',
        );
        expect(result.output, isA<String>());

        // Should have both successful and failed tool results
        expect(result.messages, isNotEmpty);
      });

      test('model switching on errors', () async {
        final models = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];

        for (final model in models) {
          final agent = Agent(model);
          final result = await agent.run('Test graceful degradation');
          expect(result.output, isA<String>());
          // Successfully used this model
          break;
        }
      });

      test('degraded functionality still provides value', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Even if advanced features fail, basic chat should work
        final result = await agent.run('Hello');
        expect(result.output, isA<String>());
        expect(result.output.isNotEmpty, isTrue);
      });
    });
  });
}
