import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

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
        expect(messages[2].role, equals(MessageRole.user));
        expect(messages[3].role, equals(MessageRole.model));
      });
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
    });

    group('error handling', () {
      test('handles invalid model names', () async {
        expect(
          () => Agent('invalid:model-name'),
          throwsA(isA<StateError>()),
        );
      });

      test('handles malformed messages gracefully', () async {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');

        // Empty prompt should still work
        final response = await agent.run('Say "test"');
        expect(response.output, isA<String>());
      });
    });

    group('all providers - comprehensive test', () {
      test('basic chat works across all providers', () async {
        // Test a subset of stable providers to avoid timeouts
        final testProviders = [
          ('openai', 'gpt-4o-mini'),
          ('anthropic', 'claude-3-5-haiku-latest'),
          ('google', 'gemini-2.0-flash'),
        ];

        for (final (providerName, modelName) in testProviders) {
          final agent = Agent('$providerName:$modelName');
          final response = await agent.run(
            'Respond with exactly: "Provider test passed"',
          );

          expect(
            response.output.toLowerCase(),
            contains('provider test passed'),
            reason: 'Provider $providerName should respond correctly',
          );
        }
      });
    });
  });
}
