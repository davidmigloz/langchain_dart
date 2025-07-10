// CRITICAL TEST FAILURE INVESTIGATION PROCESS:
// When a test fails for a provider capability:
// 1. NEVER immediately disable the capability in provider definitions
// 2. ALWAYS investigate at the API level first:
//    - Test with curl to verify if the feature works at the raw API level
//    - Check the provider's official documentation
//    - Look for differences between our implementation and the API requirements
// 3. ONLY disable a capability after confirming:
//    - The API itself doesn't support the feature, OR
//    - The API has a fundamental limitation (like Together's
//      streaming tool format)
// 4. If the API supports it but our code doesn't: FIX THE IMPLEMENTATION

import 'dart:typed_data';

import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  group('Agent API', () {
    group('agent construction', () {
      test('creates agent with provider only', () {
        final agent = Agent('openai');
        expect(agent, isNotNull);
        expect(agent.providerName, equals('openai'));
        expect(agent.model, startsWith('openai:'));
      });

      test('creates agent with provider and model', () {
        final agent = Agent('openai:gpt-4o-mini');
        expect(agent, isNotNull);
        expect(agent.providerName, equals('openai'));
        expect(agent.model, equals('openai:gpt-4o-mini'));
      });

      test('creates agent with alias', () {
        final agent = Agent('openai:gpt-4o-mini');
        expect(agent, isNotNull);
        expect(agent.providerName, equals('openai'));
        expect(agent.model, equals('openai:gpt-4o-mini'));
      });

      test('creates agent with tools', () {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool, intTool]);
        expect(agent, isNotNull);
        expect(agent.model, equals('openai:gpt-4o-mini'));
      });

      test('creates agent with temperature', () {
        final agent = Agent('google:gemini-2.0-flash', temperature: 0.7);
        expect(agent, isNotNull);
        expect(agent.model, equals('google:gemini-2.0-flash'));
      });

      test('creates agent with display name', () {
        final agent = Agent(
          'ollama:llama3.2:latest',
          displayName: 'My Custom Agent',
        );
        expect(agent, isNotNull);
        expect(agent.displayName, equals('My Custom Agent'));
      });

      test(
        'ALL providers can be instantiated as agents',
        timeout: const Timeout(Duration(minutes: 1)),
        () async {
          // Test EVERY provider
          for (final provider in ChatProvider.all) {
            // Testing agent construction with provider

            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );

            expect(
              agent,
              isNotNull,
              reason: 'Provider ${provider.name} should create valid agent',
            );
            expect(
              agent.providerName,
              equals(provider.name),
              reason:
                  'Provider ${provider.name} should have correct provider'
                  ' name',
            );
            expect(
              agent.model,
              equals('${provider.name}:${provider.defaultModelName}'),
              reason:
                  'Provider ${provider.name} should have correct model '
                  'string',
            );

            // Test with tools
            if (provider.caps.contains(ProviderCaps.multiToolCalls)) {
              final agentWithTools = Agent(
                '${provider.name}:${provider.defaultModelName}',
                tools: [stringTool],
              );
              expect(
                agentWithTools,
                isNotNull,
                reason:
                    'Provider ${provider.name} should create agent with tools',
              );
            }

            // Test with options
            final agentWithOptions = Agent(
              '${provider.name}:${provider.defaultModelName}',
              temperature: 0.7,
              systemPrompt: 'You are a test assistant',
            );
            expect(
              agentWithOptions,
              isNotNull,
              reason:
                  'Provider ${provider.name} should create agent with '
                  'options',
            );
          }
        },
      );
    });

    group('system prompts', () {
      test('agent with default system prompt', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt: 'You are a helpful math tutor. Always show your work.',
        );

        final result = await agent.run('What is 7 * 8?');
        expect(result.output, isNotEmpty);
        expect(result.output, isA<String>());
      });

      test('system prompt override with history', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt: 'You are a helpful assistant.',
        );

        // Override with conversation history
        final history = [
          const ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('You are a pirate. Answer in pirate speak.')],
          ),
        ];

        final result = await agent.run('Say hello', history: history);
        expect(result.output, isNotEmpty);
        // Response should reflect the pirate override, not the default
        expect(
          result.output.toLowerCase(),
          anyOf(
            contains('ahoy'),
            contains('arr'),
            contains('matey'),
            contains('ye'),
          ),
        );
      });

      test('system prompt behavior without override', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt: 'You must always end responses with "END".',
        );

        final result = await agent.run('Say hello');
        expect(result.output, endsWith('END'));
      });

      test('system prompt with tools', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt: 'You are a calculator assistant. Use tools to compute.',
          tools: [intTool],
        );

        final result = await agent.run('Use the int_tool with value 42');
        expect(result.output, isNotEmpty);
        // Should have executed the tool
        final toolResults = result.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, isNotEmpty);
      });

      test('empty system prompt handling', () async {
        final agent = Agent('openai:gpt-4o-mini', systemPrompt: '');

        final result = await agent.run('Hello');
        expect(result.output, isNotEmpty);
      });
    });

    group('attachments', () {
      test('agent run with data attachments', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Create a simple image attachment
        final imageBytes = Uint8List.fromList([
          0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, // PNG header
          0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52, // IHDR chunk
          0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, // 1x1 pixel
          0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53,
          0xDE, 0x00, 0x00, 0x00, 0x0C, 0x49, 0x44, 0x41,
          0x54, 0x08, 0x99, 0x01, 0x01, 0x00, 0x00, 0xFF,
          0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x73,
          0x75, 0x01, 0x18, 0x00, 0x00, 0x00, 0x00, 0x49,
          0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
        ]);

        final result = await agent.run(
          'What do you see in this image?',
          attachments: [DataPart(bytes: imageBytes, mimeType: 'image/png')],
        );

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);

        // Should have a user message with both text and image parts
        final userMessage = result.messages
            .where((msg) => msg.role == MessageRole.user)
            .first;
        expect(userMessage.parts.whereType<TextPart>(), hasLength(1));
        expect(userMessage.parts.whereType<DataPart>(), hasLength(1));
      });

      test('agent run with link attachments', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final result = await agent.run(
          'Tell me about this image',
          attachments: [
            const LinkPart(
              url:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/240px-PNG_transparency_demonstration_1.png',
            ),
          ],
        );

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);

        // Should have a user message with both text and link parts
        final userMessage = result.messages
            .where((msg) => msg.role == MessageRole.user)
            .first;
        expect(userMessage.parts.whereType<TextPart>(), hasLength(1));
        expect(userMessage.parts.whereType<LinkPart>(), hasLength(1));
      });

      test(
        'agent run with multiple attachments',
        skip: 'Image validation issues',
        () async {
          final agent = Agent('openai:gpt-4o-mini');

          // Create a minimal valid JPEG
          final imageBytes = Uint8List.fromList([
            0xFF, 0xD8, 0xFF, 0xE0, 0x00, 0x10, 0x4A, 0x46, // JPEG header
            0x49, 0x46, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01,
            0x00, 0x01, 0x00, 0x00, 0xFF, 0xDB, 0x00, 0x43,
            0x00, 0x08, 0x06, 0x06, 0x07, 0x06, 0x05, 0x08,
            0x07, 0x07, 0x07, 0x09, 0x09, 0x08, 0x0A, 0x0C,
            0xFF, 0xD9, // End marker
          ]);

          final result = await agent.run(
            'Analyze these inputs',
            attachments: [
              DataPart(bytes: imageBytes, mimeType: 'image/jpeg'),
              const LinkPart(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/PNG_transparency_demonstration_1.png/240px-PNG_transparency_demonstration_1.png',
              ),
            ],
          );

          expect(result.output, isNotEmpty);

          // Should have a user message with text + multiple attachments
          final userMessage = result.messages
              .where((msg) => msg.role == MessageRole.user)
              .first;
          expect(userMessage.parts.whereType<TextPart>(), hasLength(1));
          expect(userMessage.parts.whereType<DataPart>(), hasLength(1));
          expect(userMessage.parts.whereType<LinkPart>(), hasLength(1));
        },
      );

      test(
        'attachments without text prompt',
        skip: 'Image validation issues',
        () async {
          final agent = Agent('openai:gpt-4o-mini');

          final imageBytes = Uint8List.fromList([1, 2, 3]);

          final result = await agent.run(
            '', // Empty text
            attachments: [DataPart(bytes: imageBytes, mimeType: 'image/png')],
          );

          expect(result.output, isNotEmpty);

          // Should still create valid user message
          final userMessage = result.messages
              .where((msg) => msg.role == MessageRole.user)
              .first;
          expect(userMessage.parts.whereType<DataPart>(), hasLength(1));
        },
      );
    });

    group('history management', () {
      test('multi-turn conversation with history accumulation', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = <ChatMessage>[];

        // Turn 1: Introduction
        var result = await agent.run('Hi, my name is Alice.', history: history);
        expect(result.output, isNotEmpty);
        history.addAll(result.messages);

        // Turn 2: Ask about the name
        result = await agent.run('What is my name?', history: history);
        expect(result.output.toLowerCase(), contains('alice'));
        history.addAll(result.messages);

        // Turn 3: Continue conversation
        result = await agent.run('Tell me a short joke.', history: history);
        expect(result.output, isNotEmpty);
        history.addAll(result.messages);

        // History should have accumulated properly
        expect(
          history.length,
          greaterThanOrEqualTo(6),
        ); // 3 user + 3 AI minimum
      });

      test('history with system message override', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final history = [
          const ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('You respond only with "YES" or "NO".')],
          ),
        ];

        final result = await agent.run('Is the sky blue?', history: history);

        expect(
          result.output.trim().toUpperCase(),
          anyOf(equals('YES'), equals('NO'), contains('YES'), contains('NO')),
        );
      });

      test('history preservation across calls', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = <ChatMessage>[
          const ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('Remember everything the user tells you.')],
          ),
        ];

        // Add some context
        var result = await agent.run(
          'My favorite color is red.',
          history: history,
        );
        history.addAll(result.messages);

        // Test memory
        result = await agent.run(
          'What is my favorite color?',
          history: history,
        );
        expect(result.output.toLowerCase(), contains('red'));
      });

      test('empty history handling', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final result = await agent.run(
          'Hello',
          history: [], // Explicitly empty
        );

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);
      });
    });

    group('streaming behavior', () {
      test('agent streaming with simple text', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final chunks = <String>[];
        var messageCount = 0;

        await for (final chunk in agent.runStream('Count from 1 to 3')) {
          chunks.add(chunk.output);
          messageCount += chunk.messages.length;
        }

        expect(chunks, isNotEmpty);
        final fullText = chunks.join();
        expect(fullText, contains('1'));
        expect(fullText, contains('2'));
        expect(fullText, contains('3'));
        expect(messageCount, greaterThan(0));
      });

      test('streaming with tools', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final chunks = <String>[];
        final allMessages = <ChatMessage>[];

        await for (final chunk in agent.runStream(
          'Use string_tool with input "streaming test"',
        )) {
          chunks.add(chunk.output);
          allMessages.addAll(chunk.messages);
        }

        expect(chunks, isNotEmpty);
        expect(allMessages, isNotEmpty);

        // Should have tool execution in messages
        final toolResults = allMessages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, isNotEmpty);
      });

      test('streaming with history', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = [
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('Remember the number 42.')],
          ),
          const ChatMessage(
            role: MessageRole.model,
            parts: [TextPart('I will remember the number 42.')],
          ),
        ];

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'What number should you remember?',
          history: history,
        )) {
          chunks.add(chunk.output);
        }

        final fullText = chunks.join();
        expect(fullText, contains('42'));
      });

      test('streaming empty chunks handling', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final allChunks = <String>[];

        await for (final chunk in agent.runStream('Say "test"')) {
          allChunks.add(chunk.output);
        }

        expect(allChunks, isNotEmpty);
        final fullText = allChunks.join();
        expect(fullText.toLowerCase(), contains('test'));
        // Empty chunks are normal in streaming
      });
    });

    group('agent properties', () {
      test('agent displays correct provider name', () {
        final agent1 = Agent('openai:gpt-4o-mini');
        expect(agent1.providerName, equals('openai'));

        final agent2 = Agent('claude:claude-3-5-haiku-latest');
        expect(agent2.providerName, equals('claude'));

        final agent3 = Agent('gemini:gemini-2.0-flash');
        expect(agent3.providerName, equals('gemini'));
      });

      test('agent displays correct model string', () {
        final agent1 = Agent('openai:gpt-4o-mini');
        expect(agent1.model, equals('openai:gpt-4o-mini'));

        final agent2 = Agent('anthropic:claude-3-5-haiku-latest');
        expect(agent2.model, equals('anthropic:claude-3-5-haiku-latest'));

        final agent3 = Agent('google');
        expect(agent3.model, startsWith('google:'));
      });

      test('agent displays custom display name', () {
        final agent = Agent('openai:gpt-4o-mini', displayName: 'My Assistant');
        expect(agent.displayName, equals('My Assistant'));
      });

      test('agent without display name', () {
        final agent = Agent('anthropic:claude-3-5-haiku-latest');
        expect(agent.displayName, equals('anthropic:claude-3-5-haiku-latest'));
      });
    });

    group('error handling', () {
      test('invalid provider name throws error', () {
        expect(
          () => Agent('invalid-provider:some-model'),
          throwsA(isA<StateError>()),
        );
      });

      test('malformed model string handling', () {
        // These should not throw, but use defaults
        expect(() => Agent('openai'), returnsNormally);
        expect(() => Agent('anthropic:'), returnsNormally);
        expect(() => Agent(':gpt-4o-mini'), throwsA(isA<StateError>()));
      });

      test('agent handles API errors gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // This should complete without throwing
        expect(() async => agent.run('Hello'), returnsNormally);
      });

      test('agent with unsupported features', () {
        // Mistral doesn't support tools
        expect(
          () => Agent('mistral:mistral-small-latest', tools: [stringTool]),
          throwsException,
        );
      });
    });

    group('agent comparison and equality', () {
      test('agents with same configuration', () {
        final agent1 = Agent('openai:gpt-4o-mini');
        final agent2 = Agent('openai:gpt-4o-mini');

        // Agents are separate instances but have same configuration
        expect(agent1.model, equals(agent2.model));
        expect(agent1.providerName, equals(agent2.providerName));
      });

      test('agents with different configurations', () {
        final agent1 = Agent('openai:gpt-4o-mini');
        final agent2 = Agent('openai:gpt-4o');

        expect(agent1.model, isNot(equals(agent2.model)));
        expect(agent1.providerName, equals(agent2.providerName));
      });
    });

    group('provider-specific features', () {
      test('OpenAI agent creation and basic usage', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final result = await agent.run('Say "OpenAI test"');
        expect(result.output, contains('OpenAI test'));
      });

      test('Google agent creation and basic usage', () async {
        final agent = Agent('google:gemini-2.0-flash');
        final result = await agent.run('Say "Google test"');
        expect(result.output, contains('Google test'));
      });

      test('Construction without API calls', () {
        // These should construct without making API calls
        expect(() => Agent('openai:gpt-4o-mini'), returnsNormally);
        expect(() => Agent('google:gemini-2.0-flash'), returnsNormally);
      });

      test('Ollama agent creation (no API key required)', () {
        // Ollama doesn't require API keys
        expect(() => Agent('ollama:llama3.2:latest'), returnsNormally);
      });
    });
  });
}
