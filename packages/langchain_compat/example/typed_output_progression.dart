// ignore_for_file: avoid_print, unreachable_from_main, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';
import 'lib/example_tools.dart';
import 'lib/example_types.dart';

void main() async {
  final provider = ChatProvider.anthropic;
  final agent = Agent.forProvider(
    provider,
    tools: [currentDateTimeTool, temperatureTool, recipeLookupTool],
    systemPrompt: '''
You are a helpful assistant that provides accurate information.

When responding with structured data, ensure your JSON output strictly follows
the provided schema format. Do not include additional text or explanations
outside the JSON structure.

When you have access to tools, use them to gather real data before formatting
your response.
''',
  );

  // await jsonOutput(agent);
  // await jsonOutputStream(agent);
  // await mapOutput(agent);
  // await typedOutput(agent);
  // await typedOutputWithToolCalls(agent);
  await typedOutputWithToolCallsAndMultipleTurns(provider);
  exit(0);
}

Future<void> jsonOutput(Agent agent) async {
  print('═══ ${agent.displayName} JSON Output ═══');

  final result = await agent.run(
    'What is the Windy City in the US of A?',
    outputSchema: TownAndCountry.schema,
  );

  final map = jsonDecode(result.output) as Map<String, dynamic>;
  print('town: ${map['town']}');
  print('country: ${map['country']}');
  dumpMessageHistory(result.messages);
  print('--------------------------------');
  print('');
}

Future<void> jsonOutputStream(Agent agent) async {
  print('═══ ${agent.displayName} JSON Output Stream ═══');

  final text = StringBuffer();
  final history = <ChatMessage>[];
  await agent
      .runStream(
        'What is the Windy City in the US of A?',
        outputSchema: TownAndCountry.schema,
      )
      .forEach((r) {
        text.write(r.output);
        history.addAll(r.messages);
        stdout.write(r.output);
      });
  stdout.writeln();

  final map = jsonDecode(text.toString()) as Map<String, dynamic>;
  print('town: ${map['town']}');
  print('country: ${map['country']}');
  dumpMessageHistory(history);
  print('--------------------------------');
  print('');
}

Future<void> mapOutput(Agent agent) async {
  print('═══ ${agent.displayName} Map Output ═══');

  final result = await agent.runFor<Map<String, dynamic>>(
    'What is the Windy City in the US of A?',
    outputSchema: TownAndCountry.schema,
  );

  print('town: ${result.output['town']}');
  print('country: ${result.output['country']}');
  dumpMessageHistory(result.messages);
  print('--------------------------------');
  print('');
}

Future<void> typedOutput(Agent agent) async {
  print('═══ ${agent.displayName} Typed Output ═══');

  final result = await agent.runFor<TownAndCountry>(
    'What is the Windy City in the US of A?',
    outputSchema: TownAndCountry.schema,
    outputFromJson: TownAndCountry.fromJson,
  );

  print('town: ${result.output.town}');
  print('country: ${result.output.country}');
  dumpMessageHistory(result.messages);
  print('--------------------------------');
  print('');
}

Future<void> typedOutputWithToolCalls(Agent agent) async {
  print('═══ ${agent.displayName} Typed Output with Tool Calls ═══');

  final result = await agent.runFor<TimeAndTemperature>(
    'What is the time and temperature in Portland, OR?',
    outputSchema: TimeAndTemperature.schema,
    outputFromJson: TimeAndTemperature.fromJson,
  );

  print('time: ${result.output.time}');
  print('temperature: ${result.output.temperature}');
  dumpMessageHistory(result.messages);
  print('--------------------------------');
  print('');
}

Future<void> typedOutputWithToolCallsAndMultipleTurns(
  ChatProvider provider,
) async {
  final agent = Agent(
    '${provider.name}:${provider.defaultModelName}',
    tools: [recipeLookupTool],
    systemPrompt: 'You are an expert chef.',
  );

  print(
    '═══ '
    '${agent.displayName} Typed Output with Tool Calls and Multiple Turns '
    '═══',
  );

  final recipeSchema = JsonSchema.create({
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

  // First turn: Look up the recipe
  final history = <ChatMessage>[];
  final result = await agent.runFor<Map<String, dynamic>>(
    "Can you show me grandma's mushroom omelette recipe?",
    outputSchema: recipeSchema,
  );
  history.addAll(result.messages);
  dumpMessageHistory(history);

  final json = result.output;
  dumpRecipe(json);

  // Second turn: Modify the recipe
  final secondResult = await agent.runFor<Map<String, dynamic>>(
    'Can you update it to replace the mushrooms with ham?',
    history: history,
    outputSchema: recipeSchema,
  );
  history.addAll(secondResult.messages);
  dumpRecipe(secondResult.output);
  dumpMessageHistory(history);
}

void dumpRecipe(Map<String, dynamic> json) {
  print('--------------------------------');
  print('name: ${json['name']}');
  print('ingredients: ${json['ingredients']}');
  print('instructions: ${json['instructions']}');
  print('prep_time: ${json['prep_time']}');
  print('cook_time: ${json['cook_time']}');
  print('servings: ${json['servings']}');
  print('--------------------------------');
}
