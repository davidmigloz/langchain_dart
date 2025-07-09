import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_tools.dart';

void main() {
  group('Tool Calling', () {
    group('single tool calls', () {
      test('calls a simple string tool', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final response = await agent.run(
          'Use the string_tool with input "hello"',
        );

        // Check that tool was executed and result is in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(1));
        expect(toolResults.first.result, equals('String result: hello'));
      });

      test('calls a tool with numeric return', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [intTool]);

        final response = await agent.run('Use the int_tool with value 42');

        // Check that tool was executed and result is in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(1));
        final result = toolResults.first.result;
        // Tool result may be serialized as string or kept as int
        expect(
          result == 42 || result == '42',
          isTrue,
          reason: 'Expected 42 or "42", got $result (${result.runtimeType})',
        );
      });

      test('calls a tool returning a map', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [mapTool]);
        final response = await agent.run(
          'Use the map_tool with key "name" and value "test"',
        );

        // Check that tool was executed and result is in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(1));
        final result = toolResults.first.result;
        // Result might be serialized as string or kept as map
        if (result is String) {
          // If serialized as string, parse as JSON
          expect(result, contains('test'));
          expect(result, contains('map_result'));
        } else {
          final resultMap = result as Map<String, dynamic>;
          expect(resultMap['name'], equals('test'));
          expect(resultMap['type'], equals('map_result'));
        }
      });

      test('handles tool with no parameters', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [noParamsTool]);

        final response = await agent.run('Call the no_params_tool');

        // Check that tool was executed and result is in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(1));
        expect(toolResults.first.result, equals('Called with no parameters'));
      });
    });

    group('multiple tool calls', () {
      test('calls multiple tools in sequence', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [multiStepTool1, multiStepTool2],
        );

        final response = await agent.run(
          'First call step1 with input "hello", '
          'then call step2 with the result',
        );

        // Check that both tools were executed and results are in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(2));
        expect(toolResults[0].result, equals('Step 1 processed: hello'));
        expect(toolResults[1].result, contains('Step 2 processed:'));
      });

      test('calls multiple independent tools', () async {
        final agent = Agent(
          'openai:gpt-4o-mini',
          tools: [stringTool, intTool, boolTool],
        );

        final response = await agent.run(
          'Call string_tool with "test", int_tool with 100, '
          'and bool_tool with true',
        );

        // Check that all three tools were executed and results are in messages
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(3));

        // Check for specific results (order may vary)
        final results = toolResults.map((tr) => tr.result).toList();
        expect(results, contains('String result: test'));
        // Tool results may be serialized as strings
        expect(results.any((r) => r == 100 || r == '100'), isTrue);
        expect(results.any((r) => r == true || r == 'true'), isTrue);
      });
    });

    group('edge cases', () {
      test('handles null return values', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [nullTool]);

        final response = await agent.run('Call the null_tool');
        // Should handle null gracefully
        expect(response.output, isA<String>());
      });

      test('handles empty string returns', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [emptyStringTool]);

        final response = await agent.run('Call the empty_string_tool');
        // Should complete without error
        expect(response.output, isA<String>());
      });

      test('handles very long string returns', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [veryLongStringTool]);

        final response = await agent.run(
          'Call very_long_string_tool with repeat_count 10',
        );
        expect(response.output, contains('Lorem ipsum'));
      });

      test('handles unicode in tool results', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [unicodeTool]);

        final response = await agent.run('Call the unicode_tool');
        expect(response.output, isNotEmpty);
        
        // Check that the tool was actually called and returned unicode
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, isNotEmpty);
        expect(toolResults.first.result, contains('👋'));
        expect(toolResults.first.result, contains('世界'));
      });

      test('handles special characters in tool results', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [specialCharsTool]);

        final response = await agent.run('Call the special_chars_tool');
        expect(response.output, contains('Line 1'));
        expect(response.output, contains('Quoted'));
      });
    });

    group('error handling', () {
      test('handles tool execution errors gracefully', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [errorTool]);

        // Agent should handle the error and report it
        final response = await agent.run(
          'Call error_tool with error_message "Test error"',
        );
        expect(
          response.output.toLowerCase(),
          anyOf(contains('error'), contains('failed'), contains('exception')),
        );
      });

      test('handles missing required parameters', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [strictTypeTool]);

        // Model should either request missing params or handle gracefully
        final response = await agent.run(
          'Call strict_type_tool but only provide string_param "test"',
        );
        expect(response.output, isA<String>());
      });

      test('rejects tools on unsupported providers', () async {
        // Mistral doesn't support tools
        expect(
          () => Agent(
            'mistral:mistral-small-latest',
            tools: [stringTool],
          ),
          throwsException,
        );
      });
    });

    group('streaming with tools', () {
      test('streams tool call results', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'Use string_tool with input "streaming test"',
        )) {
          chunks.add(chunk.output);
        }

        final fullResponse = chunks.join();
        // Response should mention the tool result or input
        expect(
          fullResponse.toLowerCase(),
          anyOf(contains('streaming test'), contains('string_tool')),
        );
      });

      test('streams multiple tool calls', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool, intTool]);

        final chunks = <String>[];
        await for (final chunk in agent.runStream(
          'Call string_tool with "test" and int_tool with 99',
        )) {
          chunks.add(chunk.output);
        }

        final fullResponse = chunks.join();
        // Response should mention the tool results or inputs
        expect(
          fullResponse.toLowerCase(),
          anyOf(contains('test'), contains('string_tool')),
        );
        expect(
          fullResponse.toLowerCase(),
          anyOf(contains('99'), contains('int_tool')),
        );
      });
    });

    group('tool result integration', () {
      test('integrates tool results into message history', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [stringTool]);

        final response = await agent.run(
          'Call string_tool with "hello" and tell me what it returned',
        );

        // Check that the tool was called
        final toolResults = response.messages
            .expand((msg) => msg.toolResults)
            .toList();
        expect(toolResults, hasLength(1));
        expect(toolResults.first.result, equals('String result: hello'));
        
        // Response should mention the result
        expect(
          response.output.toLowerCase(),
          anyOf(contains('returned'), contains('result'), contains('output')),
        );
      });

      test('handles tool results in conversation context', () async {
        final agent = Agent('openai:gpt-4o-mini', tools: [mapTool]);
        final messages = [
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('Use map_tool with key "color" and value "blue"')],
          ),
        ];

        var response = await agent.run(
          'Use map_tool with key "color" and value "blue"',
        );

        // Add response to history
        messages.add(
          ChatMessage(
            role: MessageRole.model,
            parts: [TextPart(response.output)],
          ),
        );

        // Follow up about the tool result
        messages.add(
          const ChatMessage(
            role: MessageRole.user,
            parts: [TextPart('What was the value for the color key?')],
          ),
        );

        response = await agent.run(
          'What was the value for the color key?',
          history: messages,
        );
        expect(response.output.toLowerCase(), contains('blue'));
      });
    });

    group('all providers - tool support', () {
      test('tool calling works across supporting providers',
          timeout: const Timeout(Duration(minutes: 2)), () async {
        final testTool = stringTool;

        // Test subset of stable tool-supporting providers
        final toolProviders = {
          'openai': 'gpt-4o-mini',
          'anthropic': 'claude-3-5-haiku-latest',
        };

        for (final entry in toolProviders.entries) {
          final providerName = entry.key;
          final modelName = entry.value;

          final agent = Agent('$providerName:$modelName', tools: [testTool]);
          final response = await agent.run(
            'Use string_tool with input "provider test"',
          );

          // Response should mention the tool result or input
          expect(
            response.output.toLowerCase(),
            anyOf(contains('provider test'), contains('string_tool')),
            reason: 'Provider $providerName should execute tool correctly',
          );
        }
      });
    });
  });
}
