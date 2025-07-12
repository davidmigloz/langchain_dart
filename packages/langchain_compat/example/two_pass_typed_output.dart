/// Example demonstrating a two-pass approach for providers that don't support
/// tools and typed output simultaneously (like Google Gemini and Anthropic).
///
/// Pass 1: Call with tools to gather information
/// Pass 2: Call with typed output (no tools) to format the response
// ignore_for_file: avoid_print, avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:json_schema/json_schema.dart' as js;
import 'package:langchain_compat/langchain_compat.dart';
import 'package:logging/logging.dart';

import 'lib/dump_message_history.dart';

bool providerSupportsToolsAndTypedOutput(ChatProvider provider) =>
    provider.name == 'openai';

void main() async {
  final providers = [
    // ChatProvider.openai,
    // ChatProvider.google,
    ChatProvider.anthropic,
  ];

  // Set up logging to see what's happening
  Logger.root.level = Level.WARNING; // Only show warnings and errors
  Logger.root.onRecord.listen((record) {
    print('[${record.level.name}] ${record.loggerName}: ${record.message}');
  });

  // Recipe lookup tool
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
    onCall: (input) => {
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
    },
  );

  // Recipe schema for typed output
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
    },
    'required': ['name', 'ingredients', 'instructions'],
  });

  for (final provider in providers) {
    final result = await runFor<Map<String, dynamic>>(
      provider,
      "Can you look up grandma's mushroom omelette recipe?",
      recipeSchema,
      [recipeLookupTool],
    );
    print(result);
  }

  exit(0);
}

Future<T> runFor<T extends Object>(
  ChatProvider provider,
  String prompt,
  js.JsonSchema schema,
  List<Tool> tools,
) => providerSupportsToolsAndTypedOutput(provider)
    ? runForOnePass<T>(
        provider: provider,
        tools: tools,
        schema: schema,
        userPrompt: prompt,
      )
    : runForTwoPass<T>(
        provider: provider,
        tools: tools,
        schema: schema,
        userPrompt: prompt,
      );

Future<T> runForOnePass<T extends Object>({
  required ChatProvider provider,
  required List<Tool> tools,
  required js.JsonSchema schema,
  required String userPrompt,
}) async {
  print('# ${provider.displayName}: single-pass approach');

  final agent = Agent(
    '${provider.name}:${provider.defaultModelName}',
    tools: tools,
  );

  final result = await agent.runFor<T>(userPrompt, outputSchema: schema);

  // Count tool calls
  final toolCallCount = result.messages
      .where((m) => m.role == MessageRole.model)
      .map(
        (m) => m.parts
            .whereType<ToolPart>()
            .where((p) => p.kind == ToolPartKind.call)
            .length,
      )
      .reduce((a, b) => a + b);

  print('\n✅ Single pass complete:');
  print('   - Tool calls made: $toolCallCount');
  print('   - Messages generated: ${result.messages.length}');
  dumpMessageHistory(result.messages);

  print('\n📊 Final formatted output:');
  print(const JsonEncoder.withIndent('  ').convert(result.output));

  return result.output;
}

Future<T> runForTwoPass<T extends Object>({
  required ChatProvider provider,
  required List<Tool> tools,
  required js.JsonSchema schema,
  required String userPrompt,
}) async {
  print('# ${provider.displayName}: two-pass approach');

  // Pass 1: Call with tools (no typed output)
  print('\n📤 PASS 1: Calling with tools to gather information...');

  final agent1 = Agent.forProvider(provider, tools: tools);
  final pass1Result = await agent1.run(userPrompt);

  // Count tool calls
  final toolCallCount = pass1Result.messages
      .where((m) => m.role == MessageRole.model)
      .map(
        (m) => m.parts
            .whereType<ToolPart>()
            .where((p) => p.kind == ToolPartKind.call)
            .length,
      )
      .reduce((a, b) => a + b);

  print('✅ Pass 1 complete:');
  print('   - Tool calls made: $toolCallCount');
  print('   - Messages generated: ${pass1Result.messages.length}');
  dumpMessageHistory(pass1Result.messages);

  // Pass 2: Call with typed output (no tools) using history from Pass 1
  print('\n📤 PASS 2: Formatting response with typed output...');

  final formattingPrompt =
      'Provide your response as JSON using the following schema:\n$schema';

  // Use the message history from Pass 1
  final agent2 = Agent.forProvider(provider);
  final pass2Result = await agent2.runFor<T>(
    formattingPrompt,
    history: pass1Result.messages,
    outputSchema: schema,
  );

  print('\n✅ Pass 2 complete:');
  print('   - Messages generated: ${pass2Result.messages.length}');
  dumpMessageHistory(pass2Result.messages);

  print('\n📊 Final formatted output:');
  print(const JsonEncoder.withIndent('  ').convert(pass2Result.output));

  return pass2Result.output;
}
