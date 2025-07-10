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

// ignore_for_file: avoid_dynamic_calls

import 'package:langchain_compat/langchain_compat.dart';
import 'package:langchain_compat/src/chat/chat_models/helpers/tool_id_helpers.dart';
import 'package:test/test.dart';

import 'test_tools.dart';
import 'test_utils.dart';

void main() {
  // Get all providers that support tools
  final toolProviders = ChatProvider.allWith({ProviderCaps.multiToolCalls});

  // Helper to run parameterized tests
  void runProviderTest(
    String testName,
    Future<void> Function(ChatProvider provider) testFunction, {
    Timeout? timeout,
  }) {
    group(testName, () {
      for (final provider in toolProviders) {
        test(provider.name, () async {
          // Skip local providers if not available
          if (provider.name.contains('ollama') && !await isOllamaAvailable()) {
            // Ollama not running - skip this provider
            return;
          }
          
          await testFunction(provider);
        }, timeout: timeout ?? const Timeout(Duration(seconds: 30)));
      }
    });
  }

  group('Tool ID Coordination', () {
    group('ToolIdHelpers', () {
      test('generates unique tool call IDs', () {
        final id1 = ToolIdHelpers.generateToolCallId(
          toolName: 'weather_tool',
          providerHint: 'openai',
        );
        final id2 = ToolIdHelpers.generateToolCallId(
          toolName: 'weather_tool',
          providerHint: 'openai',
        );

        expect(id1, startsWith('tool_openai_weather_tool_'));
        expect(id2, startsWith('tool_openai_weather_tool_'));
        expect(id1, isNot(equals(id2))); // Should be unique
      });

      test('generates deterministic IDs with same arguments', () {
        final args = {'city': 'Boston', 'units': 'fahrenheit'};

        final id1 = ToolIdHelpers.generateToolCallId(
          toolName: 'weather_tool',
          providerHint: 'google',
          arguments: args,
          index: 0,
        );
        final id2 = ToolIdHelpers.generateToolCallId(
          toolName: 'weather_tool',
          providerHint: 'google',
          arguments: args,
          index: 0,
        );

        // Should have same prefix and argument hash
        final id1Parts = id1.split('_');
        final id2Parts = id2.split('_');
        expect(id1Parts.take(4).join('_'), equals(id2Parts.take(4).join('_')));
      });

      test('handles empty and null arguments', () {
        final idEmpty = ToolIdHelpers.generateToolCallId(
          toolName: 'no_params_tool',
          arguments: {},
        );
        final idNull = ToolIdHelpers.generateToolCallId(
          toolName: 'no_params_tool',
        );

        expect(idEmpty, contains('noargs'));
        expect(idNull, contains('noargs'));
      });

      test('validates tool call IDs', () {
        expect(ToolIdHelpers.isValidToolCallId('tool_openai_test_123'), isTrue);
        expect(ToolIdHelpers.isValidToolCallId(''), isFalse);
        expect(ToolIdHelpers.isValidToolCallId('invalid_id'), isFalse);
      });

      test('extracts tool name from ID', () {
        expect(
          ToolIdHelpers.extractToolNameFromId(
            'tool_openai_weather_tool_abc123',
          ),
          equals('weather_tool'),
        );
        expect(
          ToolIdHelpers.extractToolNameFromId(
            'tool_google_complex_name_with_underscores_xyz',
          ),
          equals('complex_name_with_underscores'),
        );
        expect(ToolIdHelpers.extractToolNameFromId('invalid_id'), isNull);
      });

      test('assigns IDs to tool calls without them', () {
        final parts = [
          const TextPart('Hello'),
          const ToolPart.call(id: '', name: 'tool1', arguments: {}),
          const ToolPart.call(id: 'existing_id', name: 'tool2', arguments: {}),
          const ToolPart.call(id: '', name: 'tool3', arguments: {}),
        ];

        final updated = ToolIdHelpers.assignToolCallIds(
          parts,
          providerHint: 'test',
        );

        expect(updated[0], isA<TextPart>());
        expect((updated[1] as ToolPart).id, startsWith('tool_test_tool1_'));
        expect((updated[2] as ToolPart).id, equals('existing_id'));
        expect((updated[3] as ToolPart).id, startsWith('tool_test_tool3_'));
      });
    });

    group('ToolIdCoordinator', () {
      test('registers and validates tool calls', () {
        final coordinator = ToolIdCoordinator();

        coordinator.registerToolCall(
          id: 'tool_1',
          name: 'weather_tool',
          arguments: {'city': 'Boston'},
        );
        coordinator.registerToolCall(
          id: 'tool_2',
          name: 'calculator_tool',
          arguments: {'operation': 'add'},
        );

        expect(coordinator.validateToolResultId('tool_1'), isTrue);
        expect(coordinator.validateToolResultId('tool_2'), isTrue);
        expect(coordinator.validateToolResultId('tool_3'), isFalse);
      });

      test('tracks tool names for IDs', () {
        final coordinator = ToolIdCoordinator();

        coordinator.registerToolCall(id: 'tool_abc', name: 'weather_tool');

        expect(
          coordinator.getToolNameForId('tool_abc'),
          equals('weather_tool'),
        );
        expect(coordinator.getToolNameForId('unknown_id'), isNull);
      });

      test('finds unmatched tool calls', () {
        final coordinator = ToolIdCoordinator();

        coordinator.registerToolCall(id: 'call_1', name: 'tool1');
        coordinator.registerToolCall(id: 'call_2', name: 'tool2');
        coordinator.registerToolCall(id: 'call_3', name: 'tool3');

        final resultIds = ['call_1', 'call_3'];
        final unmatched = coordinator.findUnmatchedToolCalls(resultIds);

        expect(unmatched, equals(['call_2']));
      });

      test('clears state', () {
        final coordinator = ToolIdCoordinator();

        coordinator.registerToolCall(id: 'tool_1', name: 'test');
        expect(coordinator.registeredIds, hasLength(1));

        coordinator.clear();
        expect(coordinator.registeredIds, isEmpty);
      });
    });

    group('Message extensions', () {
      test('validates tool IDs in messages', () {
        const messageWithEmptyIds = ChatMessage(
          role: MessageRole.model,
          parts: [
            ToolPart.call(id: '', name: 'tool1', arguments: {}),
            ToolPart.call(id: 'valid_id', name: 'tool2', arguments: {}),
          ],
        );

        final errors = messageWithEmptyIds.validateToolIds();
        expect(errors, hasLength(1));
        expect(errors.first, contains('tool1'));
        expect(errors.first, contains('empty ID'));
      });

      test('ensures tool call IDs', () {
        const message = ChatMessage(
          role: MessageRole.model,
          parts: [
            TextPart('Response'),
            ToolPart.call(id: '', name: 'weather', arguments: {}),
            ToolPart.call(id: 'existing_id', name: 'calculator', arguments: {}),
          ],
        );

        final updated = message.ensureToolCallIds(providerHint: 'test');

        expect(updated.parts[0], isA<TextPart>());
        expect(
          (updated.parts[1] as ToolPart).id,
          startsWith('tool_test_weather_'),
        );
        expect((updated.parts[2] as ToolPart).id, equals('existing_id'));
      });
    });

    group('Conversation validation', () {
      test('validates tool ID consistency across conversation', () {
        final messages = [
          const ChatMessage(
            role: MessageRole.model,
            parts: [
              ToolPart.call(id: 'call_1', name: 'tool1', arguments: {}),
              ToolPart.call(id: 'call_2', name: 'tool2', arguments: {}),
            ],
          ),
          const ChatMessage(
            role: MessageRole.user,
            parts: [
              ToolPart.result(id: 'call_1', name: 'tool1', result: 'result1'),
              ToolPart.result(id: 'call_3', name: 'unknown', result: 'result3'),
            ],
          ),
        ];

        final errors = messages.validateConversationToolIds();
        expect(errors, hasLength(1));
        expect(errors.first, contains('call_3'));
        expect(errors.first, contains('no matching tool call'));
      });
    });

    group('ALL providers generate unique tool IDs', () {
      runProviderTest(
        'tool IDs are unique and properly matched',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool, intTool],
          );

          final response = await agent.run(
            'Call string_tool with "test" and int_tool with 42',
          );

          // Extract all tool calls and results
          final toolCalls = <ToolPart>[];
          final toolResults = <ToolPart>[];

          for (final message in response.messages) {
            for (final part in message.parts) {
              if (part is ToolPart) {
                if (part.kind == ToolPartKind.call) {
                  toolCalls.add(part);
                } else if (part.kind == ToolPartKind.result) {
                  toolResults.add(part);
                }
              }
            }
          }

          // Verify we have tool calls and results
          expect(
            toolCalls,
            isNotEmpty,
            reason: 'Provider ${provider.name} should generate tool calls',
          );
          expect(
            toolResults,
            isNotEmpty,
            reason: 'Provider ${provider.name} should generate tool results',
          );

          // Verify all tool calls have unique IDs
          final callIds = toolCalls.map((tc) => tc.id).toList();
          expect(
            callIds.toSet().length,
            equals(callIds.length),
            reason: 'Provider ${provider.name} should generate unique IDs',
          );

          // Verify no empty IDs
          for (final call in toolCalls) {
            expect(
              call.id,
              isNotEmpty,
              reason:
                  'Provider ${provider.name} tool call "${call.name}" '
                  'should have non-empty ID',
            );
          }

          // Verify all tool results have matching calls
          final callIdSet = callIds.toSet();
          for (final result in toolResults) {
            expect(
              result.id,
              isNotEmpty,
              reason: 'Provider ${provider.name} tool result should have ID',
            );
            expect(
              callIdSet.contains(result.id),
              isTrue,
              reason:
                  'Provider ${provider.name} tool result ID "${result.id}" '
                  'should match a tool call',
            );
          }
        },
        timeout: const Timeout(Duration(minutes: 3)),
      );

      runProviderTest(
        'multiple calls to same tool have unique IDs',
        (provider) async {
          final agent = Agent(
            '${provider.name}:${provider.defaultModelName}',
            tools: [stringTool],
          );

          // Ask to call the same tool multiple times
          final response = await agent.run(
            'Call string_tool three times with inputs '
            '"first", "second", and "third"',
          );

          // Extract all tool calls
          final toolCalls = response.messages
              .expand((msg) => msg.parts)
              .whereType<ToolPart>()
              .where((p) => p.kind == ToolPartKind.call)
              .toList();

          // May not get exactly 3 calls, but should get at least 1
          expect(
            toolCalls,
            isNotEmpty,
            reason: 'Provider ${provider.name} should call the tool',
          );

          // All calls should have unique IDs
          final ids = toolCalls.map((tc) => tc.id).toList();
          expect(
            ids.toSet().length,
            equals(ids.length),
            reason:
                'Provider ${provider.name} should generate unique IDs '
                'for multiple calls to same tool',
          );

          // All IDs should be non-empty
          for (final id in ids) {
            expect(
              id,
              isNotEmpty,
              reason:
                  'Provider ${provider.name} should generate non-empty IDs',
            );
          }
        },
        timeout: const Timeout(Duration(minutes: 2)),
      );
    });
  });
}
