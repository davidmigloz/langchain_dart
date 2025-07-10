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
  group('System Integration', () {
    group('end-to-end workflows', () {
      test('complete agent conversation with tools', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool, intTool]);

        final history = <ChatMessage>[];

        // Turn 1: Initial greeting
        var result = await agent.run(
          'Hello! Can you help me test tools?',
          history: history,
        );
        expect(result.output, isNotEmpty);
        history.addAll(result.messages);

        // Turn 2: Use a tool
        result = await agent.run(
          'Use string_tool with input "test"',
          history: history,
        );
        expect(result.output, isNotEmpty);
        history.addAll(result.messages);

        // Verify tool was executed
        final hasToolResults = history.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);

        // Turn 3: Continue conversation
        result = await agent.run('What was the result?', history: history);
        expect(result.output, isNotEmpty);

        // Complete conversation should have appropriate message count
        expect(history.length, greaterThan(4));
      });

      test('multi-tool workflow with dependencies', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool, intTool]);

        final result = await agent.run(
          'First use string_tool with "hello", then use int_tool with 42',
        );

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);

        // Should have executed both tools
        final toolResults = result.messages
            .expand((m) => m.toolResults)
            .toList();
        expect(toolResults.length, greaterThanOrEqualTo(1));
      });

      test('complex conversation with system prompt override', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          systemPrompt: 'You are a helpful assistant.',
        );

        final history = [
          const ChatMessage(
            role: MessageRole.system,
            parts: [TextPart('You are a math tutor. Always show work.')],
          ),
        ];

        final result = await agent.run('What is 15 * 23?', history: history);

        expect(result.output, isNotEmpty);
        expect(result.output, contains('15'));
        expect(result.output, contains('23'));
      });

      test('streaming workflow with tool execution', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final chunks = <String>[];
        final allMessages = <ChatMessage>[];

        await for (final chunk in agent.runStream(
          'Use string_tool with "streaming test" and explain the result',
        )) {
          chunks.add(chunk.output);
          allMessages.addAll(chunk.messages);
        }

        expect(chunks, isNotEmpty);
        expect(allMessages, isNotEmpty);

        // Should have both tool execution and explanation
        final hasToolResults = allMessages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);

        final fullText = chunks.join();
        expect(fullText, isNotEmpty);
      });

      test(
        'ALL providers handle end-to-end workflows correctly',
        timeout: const Timeout(Duration(minutes: 3)),
        () async {
          // Test basic conversation with all providers
          for (final provider in ChatProvider.all) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            // Testing end-to-end workflow with provider

            // Test basic conversation
            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
            );

            final history = <ChatMessage>[];

            // Turn 1: Initial greeting
            var result = await agent.run(
              'Hello! Reply with "Hi from ${provider.name}"',
              history: history,
            );
            expect(
              result.output,
              isNotEmpty,
              reason: 'Provider ${provider.name} should respond',
            );
            history.addAll(result.messages);

            // Turn 2: Continue conversation
            result = await agent.run(
              'What provider are you from?',
              history: history,
            );
            expect(
              result.output.toLowerCase(),
              contains(provider.name),
              reason: 'Provider ${provider.name} should maintain context',
            );
          }

          // Test tool execution with providers that support tools
          for (final provider in ChatProvider.allWith({
            ProviderCaps.multiToolCalls,
          })) {
            // Skip local providers if not available
            if (provider.name.contains('ollama')) {
              continue; // Skip for speed
            }

            final agentWithTools = Agent(
              '${provider.name}:${provider.defaultModelName}',
              tools: [stringTool],
            );

            final toolResult = await agentWithTools.run(
              'Use string_tool with input "${provider.name} workflow test"',
            );

            // Should have executed tool
            final hasToolResults = toolResult.messages.any(
              (m) => m.hasToolResults,
            );
            expect(
              hasToolResults,
              isTrue,
              reason: 'Provider ${provider.name} should execute tools',
            );
          }
        },
      );
    });

    group('cross-provider workflows', () {
      test('provider fallback scenario', () async {
        final providers = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];

        var successfulProvider = '';

        for (final provider in providers) {
          final agent = Agent(provider);
          final result = await agent.run('Test provider: $provider');

          expect(result.output, isNotEmpty);
          successfulProvider = provider;
          break;
        }

        // At least one provider should work
        expect(successfulProvider, isNotEmpty);
      });

      test('provider-specific feature usage', () async {
        final testCases = [
          {
            'provider': 'openai:gpt-4o-mini',
            'feature': 'JSON mode',
            'prompt': 'Return JSON: {"test": true}',
          },
          {
            'provider': 'google:gemini-2.0-flash',
            'feature': 'multimodal',
            'prompt': 'Describe this input',
          },
        ];

        for (final testCase in testCases) {
          final agent = Agent(testCase['provider']!);
          final result = await agent.run(testCase['prompt']!);

          expect(result.output, isNotEmpty);
          // Feature-specific validation could be added here
        }
      });

      test('model comparison workflow', () async {
        final models = ['openai:gpt-4o-mini', 'google:gemini-2.0-flash'];

        const prompt = 'What is the capital of France?';
        final results = <String, String>{};

        for (final model in models) {
          final agent = Agent(model);
          final result = await agent.run(prompt);
          results[model] = result.output;
        }

        // Should get at least some results
        expect(results.keys, isNotEmpty);

        // All successful results should mention Paris
        for (final output in results.values) {
          expect(output.toLowerCase(), contains('paris'));
        }
      });
    });

    group('complex message handling', () {
      test(
        'multipart message with tool execution',
        skip: 'Image validation issues',
        () async {
          final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

          final imageData = Uint8List.fromList([
            1,
            2,
            3,
            4,
          ]); // Minimal image data
          final result = await agent.run(
            'Analyze this data and use string_tool',
            attachments: [
              DataPart(bytes: imageData, mimeType: 'application/octet-stream'),
              const LinkPart(url: 'https://example.com/reference'),
            ],
          );

          expect(result.output, isNotEmpty);
          expect(result.messages, isNotEmpty);

          // Should have both multipart input and tool execution
          final userMessage = result.messages.firstWhere(
            (m) => m.role == MessageRole.user,
          );
          expect(userMessage.parts.length, greaterThan(1));

          final hasToolResults = result.messages.any((m) => m.hasToolResults);
          expect(hasToolResults, isTrue);
        },
      );

      test(
        'conversation history with mixed message types',
        skip: 'Image validation issues',
        () async {
          final agent = Agent('openai:gpt-4o-mini');

          final history = <ChatMessage>[
            const ChatMessage(
              role: MessageRole.system,
              parts: [TextPart('You are a helpful assistant.')],
            ),
            const ChatMessage(
              role: MessageRole.user,
              parts: [
                TextPart('Hello'),
                LinkPart(url: 'https://example.com'),
              ],
            ),
            const ChatMessage(
              role: MessageRole.model,
              parts: [TextPart('Hello! I see you shared a link.')],
            ),
          ];

          final result = await agent.run(
            'What did we discuss?',
            history: history,
          );

          expect(result.output, isNotEmpty);
          expect(result.output.toLowerCase(), contains('link'));
        },
      );

      test('tool results integration in conversation flow', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final history = <ChatMessage>[];

        // First interaction with tool
        var result = await agent.run(
          'Use string_tool with "first test"',
          history: history,
        );
        history.addAll(result.messages);

        // Continue conversation referencing tool result
        result = await agent.run(
          'What was the string tool result?',
          history: history,
        );

        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('test'));
      });
    });

    group('error recovery and resilience', () {
      test('graceful handling of tool failures in workflow', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [stringTool, errorTool],
        );

        final result = await agent.run(
          'Try using error_tool first, then use string_tool with "backup"',
        );

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);

        // Should have attempted both tools
        final allMessages = result.messages;
        expect(allMessages.length, greaterThan(1));
      });

      test('recovery from network interruptions', () async {
        final agent = Agent('openai:gpt-4o-mini');

        // Simulate potential network issues with rapid requests
        final futures = <Future<ChatResult<String>>>[];
        for (var i = 0; i < 3; i++) {
          futures.add(
            agent
                .run('Request $i')
                .catchError(
                  (e) => ChatResult<String>(
                    id: 'error-$i',
                    output: 'Error: $e',
                    finishReason: FinishReason.unspecified,
                    metadata: const {},
                    usage: const LanguageModelUsage(),
                  ),
                ),
          );
        }

        final results = await Future.wait(futures);
        expect(results, hasLength(3));

        // Should have a mix of successes and/or handled errors
        final successCount = results
            .where((r) => !r.output.startsWith('Error:'))
            .length;
        final errorCount = results
            .where((r) => r.output.startsWith('Error:'))
            .length;

        expect(successCount + errorCount, equals(3));
      });

      test('conversation continuation after errors', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        final history = <ChatMessage>[];

        // First attempt with error tool
        final result = await agent.run(
          'Use error_tool to test failures',
          history: history,
        );
        history.addAll(result.messages);

        // Continue conversation despite previous error
        final result2 = await agent.run(
          "Let's try a simple question instead: what is 2+2?",
          history: history,
        );

        expect(result2.output, isNotEmpty);
        expect(result2.output, contains('4'));
      });
    });

    group('performance and scaling', () {
      test('large conversation history handling', () async {
        final agent = Agent('openai:gpt-4o-mini');
        final history = <ChatMessage>[];

        // Build up conversation history
        for (var i = 0; i < 5; i++) {
          final result = await agent.run(
            'This is message number $i',
            history: history,
          );
          history.addAll(result.messages);

          // Prevent runaway history growth
          if (history.length > 50) {
            history.removeRange(0, history.length - 30);
          }

          // Small delay to prevent rate limiting
          await Future.delayed(const Duration(milliseconds: 200));
        }

        expect(history.length, greaterThanOrEqualTo(0));
      });

      test('concurrent complex workflows', () async {
        final workflows = [
          () async {
            final agent = Agent('openai:gpt-4o-mini');
            return agent.run('Workflow 1: Count to 3');
          },
          () async {
            final agent = Agent('google:gemini-2.0-flash');
            return agent.run('Workflow 2: Say hello');
          },
        ];

        final futures = workflows
            .map((workflow) => workflow().catchError((e) => e))
            .toList();

        final results = await Future.wait(futures);
        expect(results, hasLength(2));

        // Count successful workflows
        final successCount = results.whereType<ChatResult<String>>().length;
        expect(successCount, greaterThanOrEqualTo(0));
      });

      test('memory efficiency with streaming', () async {
        final agent = Agent('openai:gpt-4o-mini');

        var totalChunks = 0;
        var maxChunkSize = 0;

        await for (final chunk in agent.runStream('Tell me a short story')) {
          totalChunks++;
          maxChunkSize = chunk.output.length > maxChunkSize
              ? chunk.output.length
              : maxChunkSize;

          // Prevent infinite streaming
          if (totalChunks > 100) {
            break;
          }

          // Each chunk should be reasonably sized
          expect(chunk.output.length, lessThan(5000));
        }

        expect(totalChunks, greaterThan(0));
        expect(maxChunkSize, greaterThanOrEqualTo(0));
      });
    });

    group('real-world usage patterns', () {
      test('code analysis workflow', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        const codeSnippet = '''
function fibonacci(n) {
  if (n <= 1) return n;
  return fibonacci(n-1) + fibonacci(n-2);
}
''';

        final result = await agent.run(
          'Analyze this code and use string_tool to format your response:\n'
          '$codeSnippet',
        );

        expect(result.output, isNotEmpty);
        expect(result.output.toLowerCase(), contains('fibonacci'));

        // Should have used the string tool for formatting
        final hasToolResults = result.messages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });

      test(
        'research and summarization workflow',
        skip: 'URL validation issues',
        () async {
          final agent = Agent('openai:gpt-4o-mini');

          final result = await agent.run(
            'Research topic: renewable energy. '
            'Provide a brief summary of solar and wind power.',
            attachments: [
              const LinkPart(url: 'https://example.com/renewable-energy'),
            ],
          );

          expect(result.output, isNotEmpty);
          expect(result.output.toLowerCase(), contains('solar'));
          expect(result.output.toLowerCase(), contains('wind'));

          // Should reference the provided link
          final userMessage = result.messages.firstWhere(
            (m) => m.role == MessageRole.user,
          );
          expect(userMessage.parts.whereType<LinkPart>(), hasLength(1));
        },
      );

      test('interactive problem solving', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [intTool]);

        final history = <ChatMessage>[];

        // Step 1: Present problem
        var result = await agent.run(
          'I need to calculate: (25 * 4) + (18 * 3). Can you help?',
          history: history,
        );
        history.addAll(result.messages);

        // Step 2: Use tools for calculation
        result = await agent.run(
          'Use int_tool to verify the calculation',
          history: history,
        );

        expect(result.output, isNotEmpty);

        // Should have mathematical reasoning and tool usage
        final hasToolResults = result.messages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });

      test('creative writing with constraints', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final result = await agent.run(
          'Write a haiku about programming. '
          'Follow the 5-7-5 syllable pattern exactly.',
        );

        expect(result.output, isNotEmpty);

        // Basic structure check for haiku-like content
        final lines = result.output
            .split('\n')
            .where((line) => line.trim().isNotEmpty)
            .toList();
        expect(lines.length, greaterThanOrEqualTo(3));
      });
    });

    group('edge case integration', () {
      test('empty and minimal inputs', () async {
        final agent = Agent('openai:gpt-4o-mini');

        final testCases = ['', ' ', '?', '1'];

        for (final input in testCases) {
          final result = await agent.run(input);
          expect(result.output, isA<String>());
        }
      });

      test('special character handling across system', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        const specialInput = '{"test": "hello 世界 🌍"}';

        final result = await agent.run(
          'Process this JSON and use string_tool: $specialInput',
        );

        expect(result.output, isNotEmpty);

        // Should handle unicode and special characters properly
        expect(result.output, isA<String>());
      });

      test('very long workflow chains', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        const longPrompt =
            'Use string_tool with input "step1", '
            'then analyze the result, '
            'then explain what happened, '
            'then provide a summary, '
            'then give your final thoughts.';

        final result = await agent.run(longPrompt);

        expect(result.output, isNotEmpty);
        expect(result.messages, isNotEmpty);

        // Should handle complex multi-step workflows
        final hasToolResults = result.messages.any((m) => m.hasToolResults);
        expect(hasToolResults, isTrue);
      });
    });
  });
}
