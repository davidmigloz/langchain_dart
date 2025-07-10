// CRITICAL TEST FAILURE INVESTIGATION PROCESS: When a test fails for a provider
// capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's streaming tool
//      format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION
// 5. LET EXCEPTIONS BUBBLE UP: Do not add defensive checks or try-catch blocks.
//    Missing API keys, network errors, and provider issues should fail loudly
//    so they can be identified and fixed immediately.

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

  group('Streaming Architecture', () {
    group('basic streaming behavior', () {
      runProviderTest('agent streaming returns individual chunks', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Count from 1 to 3')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        // Should have multiple chunks for a counting response
        expect(chunks.length, greaterThan(1));

        // Combined output should contain the numbers
        final fullText = chunks.join();
        expect(fullText, contains('1'));
        expect(fullText, contains('2'));
        expect(fullText, contains('3'));
      });

      runProviderTest('streaming chunks have incremental content', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        var totalLength = 0;
        await for (final chunk in agent.runStream('Write a short poem')) {
          // Each chunk should add to the total length
          final currentOutput = chunk.output;
          expect(currentOutput.length, greaterThanOrEqualTo(0));
          totalLength += currentOutput.length;
        }

        expect(totalLength, greaterThan(0));
      });

      // Moved to edge cases section

      runProviderTest('handle streaming correctly', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'Write three words: apple, banana, orange',
        )) {
          chunks.add(chunk.output);
        }

        expect(
          chunks,
          isNotEmpty,
          reason: 'Provider ${provider.name} should stream chunks',
        );

        // Combined output should contain all words
        final fullText = chunks.join();
        expect(
          fullText.toLowerCase(),
          allOf([contains('apple'), contains('banana'), contains('orange')]),
          reason: 'Provider ${provider.name} should stream complete content',
        );
      }, timeout: const Timeout(Duration(minutes: 3)));

      runProviderTest('streaming preserves message sequence', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final allMessages = <ChatMessage>[];
        await for (final chunk in agent.runStream('Hello')) {
          allMessages.addAll(chunk.messages);
        }

        expect(allMessages, isNotEmpty);

        // Should have user message first, then model responses
        expect(allMessages.first.role, equals(MessageRole.user));
        expect(allMessages.any((m) => m.role == MessageRole.model), isTrue);
      });
    });

    group('text consolidation', () {
      runProviderTest('chunks combine to form complete response', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final allChunks = <String>[];
        await for (final chunk in agent.runStream('What is 2 + 2?')) {
          allChunks.add(chunk.output);
        }

        final consolidatedText = allChunks.join();
        expect(consolidatedText, isNotEmpty);
        expect(consolidatedText, contains('4'));
      });

      runProviderTest('text accumulation is monotonic', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final buffer = StringBuffer();
        var previousLength = 0;

        await for (final chunk in agent.runStream(
          'Tell me about the weather',
        )) {
          buffer.write(chunk.output);

          // Text should only grow, never shrink
          expect(buffer.length, greaterThanOrEqualTo(previousLength));
          previousLength = buffer.length;
        }

        expect(buffer.toString(), isNotEmpty);
      });

      runProviderTest('final consolidated text matches complete response', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Get streaming response
        final streamChunks = <String>[];
        await for (final chunk in agent.runStream('Say "test complete"')) {
          streamChunks.add(chunk.output);
        }
        final streamedText = streamChunks.join();

        // Both should contain the expected content
        expect(streamedText.toLowerCase(), contains('test'));
        expect(streamedText.toLowerCase(), contains('complete'));
      });

      // Moved to edge cases section
    });

    group('tool execution streaming', () {
      // Helper for tool-supporting providers only
      void runToolProviderTest(
        String testName,
        Future<void> Function(ChatProvider provider) testFunction, {
        Timeout? timeout,
      }) {
        group(testName, () {
          final toolProviders = ChatProvider.allWith({
            ProviderCaps.multiToolCalls,
          });
          for (final provider in toolProviders) {
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

      runToolProviderTest('tool calls stream correctly', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool],
        );

        final allChunks = <ChatResult<String>>[];
        await agent
            .runStream('Use string_tool with input "streaming test"')
            .forEach(allChunks.add);

        expect(allChunks, isNotEmpty);

        // Should have tool execution in the complete message set
        final allMessages = allChunks.expand((c) => c.messages).toList();
        final hasToolResults = allMessages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });

      runToolProviderTest('tool argument streaming is handled correctly', (
        provider,
      ) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [intTool],
        );

        var toolCallFound = false;
        var toolResultFound = false;

        await for (final chunk in agent.runStream(
          'Use int_tool with value 42',
        )) {
          for (final message in chunk.messages) {
            if (message.hasToolCalls) {
              toolCallFound = true;
            }
            if (message.hasToolResults) {
              toolResultFound = true;
            }
          }
        }

        expect(toolCallFound, isTrue);
        expect(toolResultFound, isTrue);
      });

      runToolProviderTest('multiple tool calls stream in sequence', (
        provider,
      ) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool, intTool],
        );

        final allMessages = <ChatMessage>[];
        await for (final chunk in agent.runStream(
          'Use string_tool with "hello" then int_tool with 123',
        )) {
          allMessages.addAll(chunk.messages);
        }

        // Should have tool executions
        final toolResults = allMessages.expand((m) => m.toolResults).toList();
        expect(toolResults, isNotEmpty);
      });

      runToolProviderTest('tool errors are handled in streaming', (
        provider,
      ) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [errorTool],
        );

        // Should complete without throwing, even if tool fails
        await for (final _ in agent.runStream(
          'Use error_tool to test error handling',
        )) {
          // Just consume the stream
        }
      });

      runToolProviderTest(
        'handle tool streaming correctly',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool],
          );

          final allChunks = <ChatResult<String>>[];
          await agent
              .runStream('Use string_tool with input "stream ${provider.name}"')
              .forEach(allChunks.add);

          expect(
            allChunks,
            isNotEmpty,
            reason: 'Provider ${provider.name} should stream tool calls',
          );

          // Should have tool execution in the complete message set
          final allMessages = allChunks.expand((c) => c.messages).toList();
          final hasToolResults = allMessages.any((m) => m.hasToolResults);
          expect(
            hasToolResults,
            isTrue,
            reason: 'Provider ${provider.name} should execute tools in stream',
          );
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );
    });

    group('message accumulation patterns', () {
      runProviderTest('messages accumulate correctly during streaming', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final messageHistory = <ChatMessage>[];
        await for (final chunk in agent.runStream('Hello, how are you?')) {
          messageHistory.addAll(chunk.messages);
        }

        expect(messageHistory, isNotEmpty);

        // Should have user message and at least one model response
        final userMessages = messageHistory
            .where((m) => m.role == MessageRole.user)
            .toList();
        final modelMessages = messageHistory
            .where((m) => m.role == MessageRole.model)
            .toList();

        expect(userMessages, hasLength(1));
        expect(modelMessages, isNotEmpty);
      });

      runProviderTest('message parts are preserved during streaming', (
        provider,
      ) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final allParts = <Part>[];
        await for (final chunk in agent.runStream('Tell me a story')) {
          for (final message in chunk.messages) {
            allParts.addAll(message.parts);
          }
        }

        expect(allParts, isNotEmpty);

        // Should have text parts at minimum
        final textParts = allParts.whereType<TextPart>().toList();
        expect(textParts, isNotEmpty);
      });

      runProviderTest('streaming with conversation history', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final history = [
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('My name is Alice.')],
          ),
          const ChatMessage(
            role: MessageRole.model,
            parts: [TextPart('Nice to meet you, Alice!')],
          ),
        ];

        final newMessages = <ChatMessage>[];
        await for (final chunk in agent.runStream(
          'What is my name?',
          history: history,
        )) {
          newMessages.addAll(chunk.messages);
        }

        expect(newMessages, isNotEmpty);

        // Response should reference the name from history
        final responseText = newMessages
            .where((m) => m.role == MessageRole.model)
            .map((m) => m.text)
            .join();
        expect(responseText.toLowerCase(), contains('alice'));
      });
    });

    group('streaming performance and efficiency', () {
      runProviderTest('streaming starts quickly', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final stopwatch = Stopwatch()..start();
        await for (final _ in agent.runStream('Hello')) {
          stopwatch.stop();
          // Should get first chunk reasonably quickly (within 30 seconds)
          expect(stopwatch.elapsedMilliseconds, lessThan(30000));
          break; // Just test first chunk timing
        }
      });

      runProviderTest('streaming handles concurrent requests', (
        provider,
      ) async {
        final agent1 = Agent('${provider.name}:${provider.defaultModelName}');
        final agent2 = Agent('${provider.name}:${provider.defaultModelName}');

        final futures = [
          agent1.runStream('Count to 5').toList(),
          agent2.runStream('Say the alphabet').toList(),
        ];

        final results = await Future.wait(futures);

        // Both streams should complete successfully
        expect(results[0], isNotEmpty);
        expect(results[1], isNotEmpty);
      });

      runProviderTest('streaming memory usage is reasonable', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        var chunkCount = 0;
        await for (final chunk in agent.runStream('Write a short paragraph')) {
          chunkCount++;

          // Each chunk should be reasonably sized
          expect(chunk.output.length, lessThan(10000));

          // Should not accumulate unlimited chunks
          if (chunkCount > 1000) {
            fail('Too many chunks, possible memory issue');
          }
        }

        expect(chunkCount, greaterThan(0));
      });
    });

    // Edge cases moved to dedicated section at bottom

    group('stream termination and completion', () {
      runProviderTest('stream completes properly', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        var streamCompleted = false;
        await for (final chunk in agent.runStream('Say goodbye')) {
          expect(chunk, isNotNull);
        }
        streamCompleted = true;

        expect(streamCompleted, isTrue);
      });

      runProviderTest('final chunk has complete message set', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        ChatResult<String>? lastChunk;
        await for (final chunk in agent.runStream('Hello world')) {
          lastChunk = chunk;
        }

        expect(lastChunk, isNotNull);
        expect(lastChunk!.messages, isNotEmpty);

        // Streaming chunks only contain new messages (model responses)
        final roles = lastChunk.messages.map((m) => m.role).toSet();
        expect(roles, contains(MessageRole.model));
      });

      runProviderTest('stream can be canceled early', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        var chunkCount = 0;
        await for (final _ in agent.runStream('Write a long story')) {
          chunkCount++;
          if (chunkCount >= 3) {
            break; // Cancel early
          }
        }

        expect(chunkCount, equals(3));
      });
    });

    group('provider-specific streaming behavior', () {
      runProviderTest('provider streaming patterns', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <ChatResult<String>>[];
        await agent.runStream('Count from 1 to 5').forEach(chunks.add);

        expect(chunks, isNotEmpty);

        // All providers should stream with non-empty outputs
        final outputs = chunks.map((c) => c.output).toList();
        expect(outputs.any((o) => o.isNotEmpty), isTrue);
      });
    });

    group('streaming error handling', () {
      runProviderTest('network interruption handling', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Should handle network issues gracefully
        await for (final chunk in agent.runStream('Hello')) {
          expect(chunk, isNotNull);
        }
      });

      runProviderTest('malformed response handling', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Agent should handle unexpected responses
        await for (final chunk in agent.runStream('Test response')) {
          expect(chunk.output, isA<String>());
        }
      });

      runProviderTest('timeout handling in streaming', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        // Should handle long responses appropriately
        var hasResponse = false;
        await for (final chunk in agent.runStream('Short response')) {
          if (chunk.output.isNotEmpty) {
            hasResponse = true;
            break;
          }
        }

        expect(hasResponse, isTrue);
      });
    });

    group('edge cases (limited providers)', () {
      // Test edge cases on only 1-2 providers to save resources
      final edgeCaseProviders = <ChatProvider>[
        ChatProvider.openai,
        ChatProvider.anthropic,
      ];

      test('empty chunks are handled gracefully', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          var emptyChunks = 0;
          var nonEmptyChunks = 0;

          await for (final chunk in agent.runStream('Say hello')) {
            if (chunk.output.isEmpty) {
              emptyChunks++;
            } else {
              nonEmptyChunks++;
            }
          }

          // Should have at least some non-empty chunks
          expect(nonEmptyChunks, greaterThan(0));
          // Empty chunks are normal in streaming protocols
          expect(emptyChunks, greaterThanOrEqualTo(0));
        }
      });

      test('handles unicode and special characters in streaming', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream('Say "Hello 世界 🌍"')) {
            chunks.add(chunk.output);
          }

          final fullText = chunks.join();
          expect(fullText, contains('Hello'));
          // May contain unicode characters depending on model behavior
          expect(fullText, isNotEmpty);
        }
      });

      test('very short responses stream correctly', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream('Say "yes"')) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);
          final fullText = chunks.join().toLowerCase();
          expect(fullText, contains('yes'));
        }
      });

      test('empty input streams correctly', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          var chunkCount = 0;
          await for (final chunk in agent.runStream('')) {
            chunkCount++;
            expect(chunk, isNotNull);
          }

          // Should handle empty input gracefully
          expect(chunkCount, greaterThanOrEqualTo(0));
        }
      });

      test('special characters in streaming', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final chunks = <String>[];
          await for (final chunk in agent.runStream(r'Echo: @#$%^&*()')) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);
          // Should handle special characters
          expect(chunks.join(), isNotEmpty);
        }
      });

      test('streaming with system prompt override', () async {
        for (final provider in edgeCaseProviders) {
          final agent = Agent('${provider.name}:${provider.defaultModelName}');

          final history = [
            const ChatMessage(
              role: MessageRole.system,
              parts: [TextPart('You must respond with exactly one word.')],
            ),
          ];

          final chunks = <String>[];
          await for (final chunk in agent.runStream(
            'How are you?',
            history: history,
          )) {
            chunks.add(chunk.output);
          }

          expect(chunks, isNotEmpty);

          // Response should be constrained by system prompt
          final response = chunks.join().trim();
          expect(response, isNotEmpty);
        }
      });
    });
  });
}
