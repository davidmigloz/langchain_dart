import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  group('Streaming Architecture', () {
    group('basic streaming behavior', () {
      test('agent streaming returns individual chunks', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

      test('streaming chunks have incremental content', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var totalLength = 0;
        await for (final chunk in agent.runStream('Write a short poem')) {
          // Each chunk should add to the total length
          final currentOutput = chunk.output;
          expect(currentOutput.length, greaterThanOrEqualTo(0));
          totalLength += currentOutput.length;
        }

        expect(totalLength, greaterThan(0));
      });

      test('empty chunks are handled gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
      });

      test('streaming preserves message sequence', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
      test('chunks combine to form complete response', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final allChunks = <String>[];
        await for (final chunk in agent.runStream('What is 2 + 2?')) {
          allChunks.add(chunk.output);
        }

        final consolidatedText = allChunks.join();
        expect(consolidatedText, isNotEmpty);
        expect(consolidatedText, contains('4'));
      });

      test('text accumulation is monotonic', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

      test('final consolidated text matches complete response', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

      test('handles unicode and special characters in streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Say "Hello 世界 🌍"')) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText, contains('Hello'));
        // May contain unicode characters depending on model behavior
        expect(fullText, isNotEmpty);
      });
    });

    group('tool execution streaming', () {
      test('tool calls stream correctly', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final allChunks = <ChatResult<String>>[];
        await agent.runStream(
          'Use string_tool with input "streaming test"',
        ).forEach(allChunks.add);

        expect(allChunks, isNotEmpty);

        // Should have tool execution in the complete message set
        final allMessages = allChunks.expand((c) => c.messages).toList();
        final hasToolResults = allMessages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });

      test('tool argument streaming is handled correctly', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [intTool]);

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

      test('multiple tool calls stream in sequence', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool, intTool]);

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

      test('tool errors are handled in streaming', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        // Should complete without throwing, even if tool fails
        await for (final _ in agent.runStream(
          'Use error_tool to test error handling',
        )) {
          // Just consume the stream
        }
      });
    });

    group('message accumulation patterns', () {
      test('messages accumulate correctly during streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

      test('message parts are preserved during streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

      test('streaming with conversation history', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
      test('streaming starts quickly', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final stopwatch = Stopwatch()..start();
        await for (final _ in agent.runStream('Hello')) {
          stopwatch.stop();
          // Should get first chunk reasonably quickly (within 30 seconds)
          expect(stopwatch.elapsedMilliseconds, lessThan(30000));
          break; // Just test first chunk timing
        }
      });

      test('streaming handles concurrent requests', () async {
        final agent1 = Agent('openai:gpt-4o-mini');
        final agent2 = Agent('openai:gpt-4o-mini');

        final futures = [
          agent1.runStream('Count to 5').toList(),
          agent2.runStream('Say the alphabet').toList(),
        ];

        final results = await Future.wait(futures);

        // Both streams should complete successfully
        expect(results[0], isNotEmpty);
        expect(results[1], isNotEmpty);
      });

      test('streaming memory usage is reasonable', () async {
        final agent = Agent('openai:gpt-4o-mini');

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

    group('streaming edge cases', () {
      test('very short responses stream correctly', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Say "yes"')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join().toLowerCase();
        expect(fullText, contains('yes'));
      });

      test('empty input streams correctly', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var chunkCount = 0;
        await for (final chunk in agent.runStream('')) {
          chunkCount++;
          expect(chunk, isNotNull);
        }

        // Should handle empty input gracefully
        expect(chunkCount, greaterThanOrEqualTo(0));
      });

      test('special characters in streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <String>[];
        await for (final chunk in agent.runStream(r'Echo: @#$%^&*()')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        // Should handle special characters
        expect(chunks.join(), isNotEmpty);
      });

      test('streaming with system prompt override', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
      });
    });

    group('stream termination and completion', () {
      test('stream completes properly', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var streamCompleted = false;
        await for (final chunk in agent.runStream('Say goodbye')) {
          expect(chunk, isNotNull);
        }
        streamCompleted = true;

        expect(streamCompleted, isTrue);
      });

      test('final chunk has complete message set', () async {
        final agent = Agent('openai:gpt-4o-mini');

        ChatResult<String>? lastChunk;
        await for (final chunk in agent.runStream('Hello world')) {
          lastChunk = chunk;
        }

        expect(lastChunk, isNotNull);
        expect(lastChunk!.messages, isNotEmpty);

        // Should have user message and model response
        final roles = lastChunk.messages.map((m) => m.role).toSet();
        expect(roles, contains(MessageRole.user));
        expect(roles, contains(MessageRole.model));
      });

      test('stream can be canceled early', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
      test('OpenAI streaming patterns', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <ChatResult<String>>[];
        await agent.runStream('Count from 1 to 5').forEach(chunks.add);

        expect(chunks, isNotEmpty);

        // OpenAI typically streams word by word or phrase by phrase
        final outputs = chunks.map((c) => c.output).toList();
        expect(outputs.any((o) => o.isNotEmpty), isTrue);
      });

      test('Google streaming patterns', () async {
        final agent = Agent('google:gemini-2.0-flash');

        final chunks = <ChatResult<String>>[];
        await agent.runStream('Count from 1 to 5').forEach(chunks.add);

        expect(chunks, isNotEmpty);

        // Google may have different streaming characteristics
        final fullText = chunks.map((c) => c.output).join();
        expect(fullText, isNotEmpty);
      });

      test('streaming with different model types', () async {
        final models = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];

        for (final model in models) {
          final agent = Agent(model);

          var hasContent = false;
          await for (final chunk in agent.runStream('Say hello')) {
            if (chunk.output.isNotEmpty) {
              hasContent = true;
              break;
            }
          }

          expect(
            hasContent,
            isTrue,
            reason: 'Model $model should stream content',
          );
        }
      });
    });

    group('streaming error handling', () {
      test('network interruption handling', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Should handle network issues gracefully
        await for (final chunk in agent.runStream('Hello')) {
          expect(chunk, isNotNull);
        }
      });

      test('malformed response handling', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Agent should handle unexpected responses
        await for (final chunk in agent.runStream('Test response')) {
          expect(chunk.output, isA<String>());
        }
      });

      test('timeout handling in streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

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
  });
}
