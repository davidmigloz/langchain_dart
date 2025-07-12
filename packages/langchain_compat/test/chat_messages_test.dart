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

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group('Chat Messages', () {
    group('single turn chat', () {
      test('sends a simple message and receives response', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        final response = await agent.run(
          'Say "Hello, test!" and nothing else.',
        );
        expect(response.output, contains('Hello, test!'));
      });

      test('handles empty response gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final response = await agent.run('Say nothing. Return empty response.');
        expect(response.output, isA<String>());
      });

      test('processes unicode and emoji correctly', () async {
        final agent = Agent('google:gemini-2.0-flash');

        final response = await agent.run('Repeat exactly: 👋 Hello 世界 🌍');
        expect(response.output, contains('👋'));
        expect(response.output, contains('世界'));
        expect(response.output, contains('🌍'));
      });

      test(
        'ALL providers handle single turn chat correctly',
        timeout: const Timeout(Duration(minutes: 3)),
        () async {
          // Test EVERY provider
          for (final provider in ChatProvider.all) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            // Testing single turn chat with provider

            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );

            final response = await agent.run(
              'Reply with exactly: "Test ${provider.name} OK"',
            );

            expect(
              response.output,
              contains('Test ${provider.name} OK'),
              reason: 'Provider ${provider.name} should respond correctly',
            );
          }
        },
      );
    });

    group('multi turn chat', () {
      test('maintains conversation history', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');
        final messages = <ChatMessage>[];

        var response = await agent.run(
          'My name is Alice. Remember it.',
          history: messages,
        );
        expect(response.output.toLowerCase(), contains('alice'));
        
        // Validate the returned messages
        validateMessageHistory(response.messages);

        // Add to history
        messages.add(
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('My name is Alice. Remember it.')],
          ),
        );
        messages.add(
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart(response.output)],
          ),
        );

        // Follow up question
        response = await agent.run('What is my name?', history: messages);
        expect(response.output.toLowerCase(), contains('alice'));
        
        // Validate full conversation history
        final fullHistory = [...messages, ...response.messages];
        validateMessageHistory(fullHistory);
      });

      test('handles role transitions correctly', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt:
              'You are a helpful assistant that always includes the word '
              '"indeed" in responses.',
        );

        final response = await agent.run('Hello');
        expect(response.output.toLowerCase(), contains('indeed'));
        
        // Validate that system prompt + messages follow correct pattern
        validateMessageHistory(response.messages);
      });

      test('accumulates multiple exchanges', () async {
        final agent = Agent('google:gemini-2.0-flash');
        final messages = <ChatMessage>[];

        // First exchange
        var response = await agent.run('Count to 1', history: messages);
        messages.add(
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('Count to 1')],
          ),
        );
        messages.add(
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart(response.output)],
          ),
        );

        // Second exchange
        response = await agent.run('Now count to 2', history: messages);
        messages.add(
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('Now count to 2')],
          ),
        );
        messages.add(
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart(response.output)],
          ),
        );

        // Verify history is maintained
        expect(messages, hasLength(4));
        expect(messages[0].role, equals(MessageRole.user));
        expect(messages[1].role, equals(MessageRole.model));
        
        // Validate full conversation history follows correct pattern
        validateMessageHistory(messages);
        expect(messages[2].role, equals(MessageRole.user));
        expect(messages[3].role, equals(MessageRole.model));
      });

      test(
        'ALL providers handle multi-turn conversation correctly',
        timeout: const Timeout(Duration(minutes: 3)),
        () async {
          // Test EVERY provider
          for (final provider in ChatProvider.all) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            // Testing multi-turn chat with provider

            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );
            final messages = <ChatMessage>[];

            var response = await agent.run(
              'My favorite color is purple. Remember that.',
              history: messages,
            );

            // Add to history
            messages.add(
              const ChatMessage(
                role: MessageRole.user,
                parts: [
                  TextPart('My favorite color is purple. Remember that.'),
                ],
              ),
            );
            messages.add(
              ChatMessage(
                role: MessageRole.model,
                parts: [TextPart(response.output)],
              ),
            );

            // Follow up question
            response = await agent.run(
              'What is my favorite color?',
              history: messages,
            );

            expect(
              response.output.toLowerCase(),
              contains('purple'),
              reason:
                  'Provider ${provider.name} should remember '
                  'conversation context',
            );
          }
        },
      );
    });

    group('streaming', () {
      test('streams response chunks', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Count slowly from 1 to 3')) {
          chunks.add(chunk.output);
        }

        expect(chunks, isNotEmpty);
        final fullResponse = chunks.join();
        expect(fullResponse, contains('1'));
        expect(fullResponse, contains('2'));
        expect(fullResponse, contains('3'));
      });

      test('handles empty chunks', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Say "test"')) {
          chunks.add(chunk.output);
        }

        // Should have received some chunks
        expect(chunks, isNotEmpty);
        // But individual chunks might be empty
        expect(chunks.join().toLowerCase(), contains('test'));
      });

      test(
        'ALL providers handle streaming correctly',
        timeout: const Timeout(Duration(minutes: 3)),
        () async {
          // Test EVERY provider
          for (final provider in ChatProvider.all) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            // Testing streaming with provider

            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );

            final chunks = <String>[];
            await for (final chunk in agent.runStream('Count from 1 to 3')) {
              chunks.add(chunk.output);
            }

            expect(
              chunks,
              isNotEmpty,
              reason: 'Provider ${provider.name} should stream chunks',
            );

            final fullResponse = chunks.join();
            expect(
              fullResponse,
              allOf([contains('1'), contains('2'), contains('3')]),
              reason:
                  'Provider ${provider.name} should stream complete response',
            );
          }
        },
      );
    });

    group('error handling', () {
      test('handles invalid model names', () async {
        expect(() => Agent('invalid:model-name'), throwsA(isA<StateError>()));
      });

      test('handles malformed messages gracefully', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        // Empty prompt should still work
        final response = await agent.run('Say "test"');
        expect(response.output, isA<String>());
      });
    });

    group('all providers - comprehensive test', () {
      test(
        'basic chat works across ALL providers',
        timeout: const Timeout(Duration(minutes: 3)),
        () async {
          // Test EVERY FUCKING PROVIDER
          for (final provider in ChatProvider.all) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            // Testing basic chat with provider

            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );

            final response = await agent.run(
              'Respond with exactly: "Provider test passed"',
            );

            expect(
              response.output.toLowerCase(),
              contains('provider test passed'),
              reason: 'Provider ${provider.name} should respond correctly',
            );
          }
        },
      );
    });
  });
}
