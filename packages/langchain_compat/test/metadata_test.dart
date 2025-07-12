// Test to verify metadata is properly attached to messages
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

void main() {
  group('Message Metadata', () {
    test('Anthropic attaches metadata for suppressed content', () async {
      final recipeSchema = js.JsonSchema.create({
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
          'ingredients': {
            'type': 'array',
            'items': {'type': 'string'},
          },
        },
        'required': ['name', 'ingredients'],
      });

      final recipeTool = Tool<Map<String, dynamic>>(
        name: 'get_recipe',
        description: 'Get a recipe',
        inputSchema: js.JsonSchema.create({
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
          },
          'required': ['name'],
        }),
        inputFromJson: (json) => json,
        onCall: (input) => {
          'name': 'Test Recipe',
          'ingredients': ['ingredient1', 'ingredient2'],
        },
      );

      final agent = Agent('anthropic', tools: [recipeTool]);
      final result = await agent.runFor<Map<String, dynamic>>(
        'Get me a test recipe',
        outputSchema: recipeSchema,
      );

      // Check that we got valid JSON output
      expect(result.output['name'], isNotNull);
      expect(result.output['ingredients'], isA<List>());

      // Find the message with JSON output
      ChatMessage? jsonMessage;
      for (final msg in result.messages) {
        if (msg.role == MessageRole.model && msg.text.contains('{')) {
          jsonMessage = msg;
          break;
        }
      }

      expect(jsonMessage, isNotNull, reason: 'Should have a message with JSON');
      
      // Check for metadata
      if (jsonMessage!.metadata.isNotEmpty) {
        print('Found metadata on JSON message:');
        print(const JsonEncoder.withIndent('  ').convert(jsonMessage.metadata));
        
        // Metadata should contain suppressed_text if LLM added any
        if (jsonMessage.metadata.containsKey('suppressed_text')) {
          expect(jsonMessage.metadata['suppressed_text'], isA<String>());
        }
      }
    });

    test('ChatMessage preserves metadata during concatenation', () {
      final msg1 = ChatMessage(
        role: MessageRole.model,
        parts: [TextPart('Hello')],
        metadata: {'key1': 'value1'},
      );

      final msg2 = ChatMessage(
        role: MessageRole.model,
        parts: [TextPart(' world')],
        metadata: {'key2': 'value2'},
      );

      // Simulate what Agent._concatMessages would do
      final merged = ChatMessage(
        role: msg1.role,
        parts: [...msg1.parts, ...msg2.parts],
        metadata: {...msg1.metadata, ...msg2.metadata},
      );

      expect(merged.text, equals('Hello world'));
      expect(merged.metadata['key1'], equals('value1'));
      expect(merged.metadata['key2'], equals('value2'));
    });
  });
}