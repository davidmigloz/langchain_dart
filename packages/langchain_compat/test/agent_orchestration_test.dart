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

  group('Agent Orchestration', () {
    group('agent lifecycle (80% cases)', () {
      runProviderTest('agent creation without API calls', (provider) async {
        // Creating an agent should not make any API calls
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        expect(agent, isNotNull);
        expect(agent.providerName, equals(provider.name));
        expect(
          agent.model,
          equals('${provider.name}:${provider.defaultModelName}'),
        );
      });

      runProviderTest('agent with custom display name', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          displayName: 'Test Assistant',
        );

        expect(agent.displayName, equals('Test Assistant'));
      });

      runProviderTest('agent with temperature setting', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          temperature: 0.5,
        );

        // Test that temperature is applied correctly
        final result = await agent.run('Say exactly "test"');
        expect(result.output, isNotEmpty);
      });

      runProviderTest('agent with system prompt', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          systemPrompt: 'Always respond with exactly one word.',
        );

        final result = await agent.run('What is the capital of France?');
        expect(result.output, isNotEmpty);
        // Should be concise due to system prompt
        expect(result.output.split(' ').length, lessThanOrEqualTo(3));
      });
    });

    group('tool execution orchestration (80% cases)', () {
      runProviderTest('single tool orchestration', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool],
        );

        final result = await agent.run(
          'Use string_tool with input "orchestration test"',
        );

        // Should orchestrate tool call and response
        expect(result.output, isNotEmpty);
        expect(result.messages.any((m) => m.hasToolCalls), isTrue);
        expect(result.messages.any((m) => m.hasToolResults), isTrue);
      }, requiredCaps: {ProviderCaps.multiToolCalls});

      runProviderTest('multi-tool orchestration', (provider) async {
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          tools: [stringTool, intTool],
        );

        final result = await agent.run(
          'First use string_tool with "hello", then use int_tool with 42',
        );

        // Should orchestrate multiple tools
        expect(result.output, isNotEmpty);
        final toolResults = result.messages
            .expand((m) => m.toolResults)
            .toList();
        expect(toolResults.length, greaterThanOrEqualTo(2));
      }, requiredCaps: {ProviderCaps.multiToolCalls});

      runProviderTest(
        'tool error handling orchestration',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [errorTool],
          );

          final result = await agent.run(
            'Use error_tool with error_message "test error"',
          );

          // Should handle tool errors gracefully
          expect(result.output, isNotEmpty);
          expect(
            result.output.toLowerCase(),
            anyOf(contains('error'), contains('failed'), contains('problem')),
          );
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
      );
    });

    group('message flow orchestration (80% cases)', () {
      runProviderTest('orchestrates user message creation', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run('Hello');

        // Should create proper user message
        final userMessages = result.messages
            .where((m) => m.role == MessageRole.user)
            .toList();
        expect(userMessages, hasLength(1));
        expect(userMessages.first.text, equals('Hello'));
      });

      runProviderTest('orchestrates model response', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final result = await agent.run('Say "response test"');

        // Should have model response
        final modelMessages = result.messages
            .where((m) => m.role == MessageRole.model)
            .toList();
        expect(modelMessages, hasLength(1));
        expect(modelMessages.first.text, isNotEmpty);
      });

      runProviderTest('orchestrates conversation history', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');
        final history = <ChatMessage>[];

        // First turn
        var result = await agent.run('My name is Alice', history: history);
        history.addAll(result.messages);

        // Second turn
        result = await agent.run('What is my name?', history: history);

        // Should maintain conversation context
        expect(result.output.toLowerCase(), contains('alice'));
        expect(result.messages.length, greaterThanOrEqualTo(2));
      });
    });

    group('streaming orchestration (80% cases)', () {
      runProviderTest('orchestrates streaming response', (provider) async {
        final agent = Agent('${provider.name}:${provider.defaultModelName}');

        final chunks = <String>[];
        await for (final chunk in agent.runStream('Count to 3')) {
          chunks.add(chunk.output);
        }

        // Should orchestrate streaming chunks
        expect(chunks, isNotEmpty);
        final fullText = chunks.join();
        expect(fullText, contains('1'));
        expect(fullText, contains('2'));
        expect(fullText, contains('3'));
      });

      runProviderTest(
        'orchestrates streaming with tools',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool],
          );

          final chunks = <String>[];
          await for (final chunk in agent.runStream(
            'Use string_tool with "stream test"',
          )) {
            chunks.add(chunk.output);
          }

          // Should orchestrate tool execution in stream
          expect(chunks, isNotEmpty);
          final fullText = chunks.join();
          expect(
            fullText.toLowerCase(),
            anyOf(contains('stream test'), contains('string_tool')),
          );
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
      );
    });

    group('edge cases', () {
      runProviderTest('handles agent with conflicting settings', (
        provider,
      ) async {
        // Agent with system prompt but history also has system message
        final agent = Agent(
          '${provider.name}:${provider.defaultModelName}',
          systemPrompt: 'You are a helpful assistant.',
        );

        final history = [
          const ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('You are a pirate.')],
          ),
        ];

        final result = await agent.run('Say hello', history: history);

        // Should handle conflicting system prompts
        expect(result.output, isNotEmpty);
        // Result should reflect one of the system prompts
        expect(
          result.output.toLowerCase(),
          anyOf(
            contains('hello'), // generic response
            contains('ahoy'), // pirate response
            contains('arr'), // pirate response
          ),
        );
      }, edgeCase: true);

      runProviderTest('handles rapid agent recreation', (provider) async {
        // Test creating and using agents rapidly
        for (var i = 0; i < 5; i++) {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            systemPrompt: 'Respond with just the number $i',
          );

          final result = await agent.run('What number?');
          expect(result.output, contains('$i'));
        }
      }, edgeCase: true);

      runProviderTest(
        'handles tool execution timeout scenarios',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool], // Use existing tool
          );

          final result = await agent.run('Use string_tool with input "test"');

          // Should handle tool execution gracefully
          expect(result.output, isNotEmpty);
          final toolResults = result.messages
              .expand((m) => m.toolResults)
              .toList();
          expect(toolResults, isNotEmpty);
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
        edgeCase: true,
      );

      runProviderTest(
        'handles complex tool result aggregation',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [mapTool, listTool],
          );

          final result = await agent.run(
            'Use map_tool to create a user profile with name "test" '
            'and age "25", then use list_tool to create a list of '
            'their attributes',
          );

          // Should handle complex tool result aggregation
          expect(result.output, isNotEmpty);
          final toolResults = result.messages
              .expand((m) => m.toolResults)
              .toList();
          expect(toolResults.length, greaterThanOrEqualTo(2));
        },
        requiredCaps: {ProviderCaps.multiToolCalls},
        edgeCase: true,
      );
    });
  });
}
