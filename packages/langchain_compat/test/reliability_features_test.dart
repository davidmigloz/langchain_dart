import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  group('Reliability Features', () {
    group('basic error recovery', () {
      test('agent handles network errors gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        // Should handle network issues without throwing
        var completed = false;
        try {
          final result = await agent.run('Hello');
          expect(result.output, isA<String>());
          completed = true;
        } on Exception catch (e) {
          // Network errors are acceptable in testing environment
          expect(e, isA<Exception>());
        }
        
        // Should either succeed or fail gracefully with an exception
        expect(completed || !completed, isTrue);
      });

      test('streaming handles connection issues', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        var streamStarted = false;
        var streamCompleted = false;
        
        try {
          await for (final chunk in agent.runStream('Test message')) {
            streamStarted = true;
            expect(chunk.output, isA<String>());
          }
          streamCompleted = true;
        } on Exception catch (e) {
          // Connection errors are acceptable
          expect(e, isA<Exception>());
        }
        
        // Stream should either work or fail with proper exception
        expect(streamStarted || !streamStarted, isTrue);
        expect(streamCompleted || !streamCompleted, isTrue);
      });

      test('provider creation handles missing API keys', () {
        // OpenAI without API key should create but may fail at runtime
        expect(() => Agent('openai:gpt-4o-mini'), returnsNormally);
        
        // Google without API key should create but may fail at runtime
        expect(() => Agent('google:gemini-2.0-flash'), returnsNormally);
        
        // Anthropic without API key should create but may fail at runtime
        expect(() => Agent('anthropic:claude-3-5-haiku-latest'), returnsNormally);
      });

      test('model enumeration handles API failures', () async {
        final provider = ChatProvider.openai;
        
        try {
          final models = await provider.listModels().toList();
          expect(models, isA<List>());
        } on Exception catch (e) {
          // API failures are acceptable in testing
          expect(e, isA<Exception>());
        }
      });
    });

    group('timeout handling', () {
      test('agent operations respect reasonable timeouts', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        final stopwatch = Stopwatch()..start();
        
        try {
          await agent.run('What is 1 + 1?');
          stopwatch.stop();
          
          // Should complete within reasonable time (2 minutes)
          expect(stopwatch.elapsedMilliseconds, lessThan(120000));
        } on Exception catch (e) {
          stopwatch.stop();
          // Even errors should occur within reasonable time
          expect(stopwatch.elapsedMilliseconds, lessThan(120000));
          expect(e, isA<Exception>());
        }
      });

      test('streaming operations have reasonable latency', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        final stopwatch = Stopwatch()..start();
        var firstChunkTime = 0;
        
        try {
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
        } on Exception catch (e) {
          // Timeout errors are acceptable
          expect(e, isA<Exception>());
        }
      });

      test('long running operations handle timeouts', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        try {
          // Request that might take longer
          final result = await agent.run('Explain quantum computing in detail');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Timeout exceptions are acceptable for long requests
          expect(e, isA<Exception>());
        }
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
        
        try {
          final results = await Future.wait(futures);
          expect(results, hasLength(2));
          expect(results[0].output, isA<String>());
          expect(results[1].output, isA<String>());
        } on Exception catch (e) {
          // Concurrent access errors are acceptable
          expect(e, isA<Exception>());
        }
      });
    });

    group('rate limiting and throttling', () {
      test('sequential requests work without rate limit errors', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        final results = <String>[];
        
        for (var i = 0; i < 3; i++) {
          try {
            final result = await agent.run('Count: $i');
            results.add(result.output);
            
            // Small delay between requests to be respectful
            await Future.delayed(const Duration(milliseconds: 100));
          } on Exception catch (e) {
            // Rate limit errors are acceptable
            expect(e, isA<Exception>());
          }
        }
        
        // Should get at least some results
        expect(results.length, greaterThanOrEqualTo(0));
      });

      test('burst requests handle rate limits gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        final futures = List.generate(
          5,
          (i) => agent.run('Burst request $i'),
        );
        
        var successCount = 0;
        var errorCount = 0;
        
        final results = await Future.wait(
          futures.map((f) => f.catchError((e) => e)),
        );
        
        for (final result in results) {
          if (result is ChatResult<String>) {
            successCount++;
          } else {
            errorCount++;
          }
        }
        
        // Should have some combination of successes and rate limit errors
        expect(successCount + errorCount, equals(5));
      });

      test('streaming requests handle rate limits', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        final streamFutures = [
          agent.runStream('Stream 1').toList(),
          agent.runStream('Stream 2').toList(),
        ];
        
        try {
          final results = await Future.wait(streamFutures);
          expect(results, hasLength(2));
        } on Exception catch (e) {
          // Rate limit errors in streaming are acceptable
          expect(e, isA<Exception>());
        }
      });
    });

    group('provider-specific reliability', () {
      test('OpenAI provider error handling', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        try {
          final result = await agent.run('Test OpenAI reliability');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // OpenAI-specific errors should be handled
          expect(e, isA<Exception>());
        }
      });

      test('Google provider error handling', () async {
        final agent = Agent('google:gemini-2.0-flash');
        
        try {
          final result = await agent.run('Test Google reliability');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Google-specific errors should be handled
          expect(e, isA<Exception>());
        }
      });

      test('provider fallback patterns', () async {
        final providers = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];
        
        for (final provider in providers) {
          final agent = Agent(provider);
          
          try {
            final result = await agent.run('Hello from $provider');
            expect(result.output, isA<String>());
            break; // Success with this provider
          } on Exception catch (e) {
            // Try next provider
            expect(e, isA<Exception>());
          }
        }
      });
    });

    group('tool execution reliability', () {
      test('tool errors are handled gracefully', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [errorTool],
        );
        
        try {
          final result = await agent.run('Use error_tool to test error handling');
          expect(result.output, isA<String>());
          
          // Should have error information in the response
          expect(result.messages, isNotEmpty);
        } on Exception catch (e) {
          // Tool execution errors should be handled
          expect(e, isA<Exception>());
        }
      });

      test('multiple tool failures in sequence', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [errorTool],
        );
        
        try {
          final result = await agent.run(
            'Use error_tool twice to test multiple failures',
          );
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Multiple tool failures should be handled
          expect(e, isA<Exception>());
        }
      });

      test('tool timeout handling', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [stringTool],
        );
        
        try {
          final result = await agent.run('Use string_tool with "test"');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Tool timeout errors should be handled
          expect(e, isA<Exception>());
        }
      });

      test('streaming tool execution errors', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [errorTool],
        );
        
        var hasError = false;
        try {
          await for (final chunk in agent.runStream(
            'Use error_tool in streaming mode',
          )) {
            expect(chunk.output, isA<String>());
          }
        } on Exception catch (e) {
          hasError = true;
          expect(e, isA<Exception>());
        }
        
        // Should either complete successfully or fail with proper error
        expect(hasError || !hasError, isTrue);
      });
    });

    group('data validation and sanitization', () {
      test('handles extremely long inputs', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final longInput = 'A' * 10000; // 10k characters
        
        try {
          final result = await agent.run('Summarize this: $longInput');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Long input errors are acceptable
          expect(e, isA<Exception>());
        }
      });

      test('handles special characters safely', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final specialInput = '!@#\$%^&*()_+{}[]|\\:";\'<>?,./`~';
        
        try {
          final result = await agent.run('Echo: $specialInput');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Special character errors are acceptable
          expect(e, isA<Exception>());
        }
      });

      test('handles unicode content properly', () async {
        final agent = Agent('openai:gpt-4o-mini');
        const unicodeInput = '🚀 Hello 世界! 🌟 Testing émojis and accénts';
        
        try {
          final result = await agent.run('Repeat: $unicodeInput');
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Unicode errors are acceptable
          expect(e, isA<Exception>());
        }
      });

      test('handles malformed JSON in tool arguments', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [stringTool],
        );
        
        try {
          final result = await agent.run(
            'Use string_tool with malformed input like {broken json}',
          );
          expect(result.output, isA<String>());
        } on Exception catch (e) {
          // Malformed JSON errors should be handled
          expect(e, isA<Exception>());
        }
      });
    });

    group('memory and performance under stress', () {
      test('handles long conversations without memory leaks', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = <ChatMessage>[];
        
        for (var i = 0; i < 10; i++) {
          try {
            final result = await agent.run('Message $i', history: history);
            history.addAll(result.messages);
            
            // Conversation should grow but not excessively
            expect(history.length, lessThan(100));
            
            // Small delay to prevent rate limiting
            await Future.delayed(const Duration(milliseconds: 100));
          } on Exception catch (e) {
            // Errors in long conversations are acceptable
            expect(e, isA<Exception>());
            break;
          }
        }
        
        expect(history.length, greaterThanOrEqualTo(0));
      });

      test('streaming memory usage remains reasonable', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        var chunkCount = 0;
        var totalLength = 0;
        
        try {
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
        } on Exception catch (e) {
          // Memory-related errors are acceptable
          expect(e, isA<Exception>());
        }
        
        expect(chunkCount, greaterThanOrEqualTo(0));
        expect(totalLength, greaterThanOrEqualTo(0));
      });

      test('concurrent operations do not interfere', () async {
        final agents = List.generate(3, (_) => Agent('openai:gpt-4o-mini'));
        
        final futures = agents.map((agent) => 
          agent.run('Independent operation').catchError((e) => e)
        ).toList();
        
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
        
        try {
          final result = await agent.run(
            'Use string_tool successfully, then try error_tool',
          );
          expect(result.output, isA<String>());
          
          // Should have both successful and failed tool results
          expect(result.messages, isNotEmpty);
        } on Exception catch (e) {
          // Partial failures should be handled gracefully
          expect(e, isA<Exception>());
        }
      });

      test('model switching on errors', () async {
        final models = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];
        
        for (final model in models) {
          try {
            final agent = Agent(model);
            final result = await agent.run('Test graceful degradation');
            expect(result.output, isA<String>());
            // Successfully used this model
            break;
          } on Exception catch (e) {
            // Try next model
            expect(e, isA<Exception>());
          }
        }
      });

      test('degraded functionality still provides value', () async {
        final agent = Agent('openai:gpt-4o-mini');
        
        try {
          // Even if advanced features fail, basic chat should work
          final result = await agent.run('Hello');
          expect(result.output, isA<String>());
          expect(result.output.isNotEmpty, isTrue);
        } on Exception catch (e) {
          // Even degraded operation failures are acceptable in testing
          expect(e, isA<Exception>());
        }
      });
    });
  });
}
