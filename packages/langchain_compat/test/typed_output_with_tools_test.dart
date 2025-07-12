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

// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  // Recipe lookup tool for chef scenario
  final recipeLookupTool = Tool<Map<String, dynamic>>(
    name: 'lookup_recipe',
    description: 'Look up a recipe by name',
    inputSchema: js.JsonSchema.create({
      'type': 'object',
      'properties': {
        'recipe_name': {
          'type': 'string',
          'description': 'The name of the recipe to look up',
        },
      },
      'required': ['recipe_name'],
    }),
    inputFromJson: (json) => json,
    onCall: (input) {
      final recipeName = input['recipe_name'] as String;
      // Mock recipe database
      if (recipeName.toLowerCase().contains('mushroom') &&
          recipeName.toLowerCase().contains('omelette')) {
        return {
          'name': "Grandma's Mushroom Omelette",
          'ingredients': [
            '3 large eggs',
            '1/4 cup sliced mushrooms',
            '2 tablespoons butter',
            '1/4 cup shredded cheddar cheese',
            'Salt and pepper to taste',
            '1 tablespoon fresh chives',
          ],
          'instructions': [
            'Beat eggs in a bowl with salt and pepper',
            'Heat butter in a non-stick pan over medium heat',
            'Sauté mushrooms until golden, about 3 minutes',
            'Pour beaten eggs over mushrooms',
            'When eggs begin to set, sprinkle cheese on one half',
            'Fold omelette in half and cook until cheese melts',
            'Garnish with fresh chives and serve',
          ],
          'prep_time': '5 minutes',
          'cook_time': '10 minutes',
          'servings': 1,
        };
      }
      return {
        'error': 'Recipe not found',
        'suggestion': 'Try searching for "mushroom omelette"',
      };
    },
  );

  // Recipe schema for chef scenario
  final recipeSchema = js.JsonSchema.create({
    'type': 'object',
    'properties': {
      'name': {'type': 'string'},
      'ingredients': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'instructions': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'prep_time': {'type': 'string'},
      'cook_time': {'type': 'string'},
      'servings': {'type': 'integer'},
    },
    'required': [
      'name',
      'ingredients',
      'instructions',
      'prep_time',
      'cook_time',
      'servings',
    ],
  });

  group('typed output with tools', () {
    group('multi-turn chat with typed output and tools (streaming)', () {
      final typedOutputWithToolProviders = ChatProvider.allWith({
        ProviderCaps.typedOutputWithTools,
      });

      for (final provider in typedOutputWithToolProviders) {
        test(
          '${provider.name} - chef conversation with streaming',
          () async {
            final agent = Agent(
              '${provider.name}:${provider.defaultModelName}',
              tools: [recipeLookupTool],
              systemPrompt:
                  'You are an expert chef with years of experience '
                  'in French cuisine.',
            );

            // First turn: Look up the recipe using streaming
            final firstChunks = <String>[];
            final firstMessages = <ChatMessage>[];

            await for (final chunk in agent.runStream(
              "Can you show me grandma's mushroom omelette recipe?",
              outputSchema: recipeSchema,
            )) {
              if (chunk.output.isNotEmpty) {
                firstChunks.add(chunk.output);
              }
              firstMessages.addAll(chunk.messages);
            }

            // Verify first response
            final firstOutput = firstChunks.join();
            final firstJson = jsonDecode(firstOutput) as Map<String, dynamic>;
            expect(firstJson['name'], contains('Mushroom Omelette'));
            expect(firstJson['ingredients'], isA<List>());
            expect(firstJson['ingredients'], isNotEmpty);
            expect(
              (firstJson['ingredients'] as List).join(' ').toLowerCase(),
              contains('mushroom'),
            );

            // Verify tool was called
            final toolCalls = firstMessages
                .where((m) => m.role == MessageRole.model)
                .expand((m) => m.parts)
                .whereType<ToolPart>()
                .where((p) => p.kind == ToolPartKind.call)
                .toList();
            expect(toolCalls, hasLength(1));
            expect(toolCalls.first.name, equals('lookup_recipe'));
            
            // Validate message history follows correct pattern
            validateMessageHistory(firstMessages);

            // Second turn: Modify the recipe using streaming
            final secondChunks = <String>[];
            final secondMessages = <ChatMessage>[];

            await for (final chunk in agent.runStream(
              'Can you update it to replace the mushrooms with ham?',
              history: firstMessages,
              outputSchema: recipeSchema,
            )) {
              if (chunk.output.isNotEmpty) {
                secondChunks.add(chunk.output);
              }
              secondMessages.addAll(chunk.messages);
            }

            // Verify second response
            final secondOutput = secondChunks.join();
            final secondJson = jsonDecode(secondOutput) as Map<String, dynamic>;
            expect(secondJson['name'], contains('Ham'));
            expect(
              (secondJson['ingredients'] as List).join(' ').toLowerCase(),
              isNot(contains('mushroom')),
            );
            expect(secondJson['ingredients'], anyElement(contains('ham')));
            // Instructions should be updated too
            expect(
              (secondJson['instructions'] as List).join(' ').toLowerCase(),
              isNot(contains('mushroom')),
            );
            expect(
              (secondJson['instructions'] as List).join(' ').toLowerCase(),
              contains('ham'),
            );
            
            // Validate full conversation history follows correct pattern
            final fullHistory = [...firstMessages, ...secondMessages];
            validateMessageHistory(fullHistory);
          },
          timeout: const Timeout(Duration(seconds: 60)),
          // No skip needed - we're only testing on providers that work
        );
      }
    });
  });
}
