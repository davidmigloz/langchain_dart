// ignore_for_file: avoid_print, unreachable_from_main

import 'dart:convert';
import 'dart:io';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';
import 'lib/example_tools.dart';

void main() async {
  final agent = Agent.fromProvider(
    ChatProvider.openai,
    tools: [currentDateTimeTool, temperatureTool],
    systemPrompt: '''
You are a helpful assistant that provides accurate information.

When responding with structured data, ensure your JSON output strictly follows
the provided schema format. Do not include additional text or explanations
outside the JSON structure.

When you have access to tools, use them to gather real data before formatting
your response.
''',
  );

  await jsonOutput(agent);
  await jsonOutputStream(agent);
  await mapOutput(agent);
  await typedOutput(agent);
  await typedOutputWithToolCalls(agent);
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

class TownAndCountry {
  const TownAndCountry({required this.town, required this.country});

  factory TownAndCountry.fromJson(Map<String, dynamic> json) =>
      TownAndCountry(town: json['town'], country: json['country']);

  static final schema = JsonSchema.create({
    'type': 'object',
    'properties': {
      'town': {'type': 'string'},
      'country': {'type': 'string'},
    },
    'required': ['town', 'country'],
  });

  final String town;
  final String country;
}

class TimeAndTemperature {
  const TimeAndTemperature({required this.time, required this.temperature});

  factory TimeAndTemperature.fromJson(Map<String, dynamic> json) =>
      TimeAndTemperature(
        time: DateTime.parse(json['time']),
        temperature: (json['temperature'] as num).toDouble(),
      );

  static final schema = JsonSchema.create({
    'type': 'object',
    'properties': {
      'time': {'type': 'string'},
      'temperature': {'type': 'number'},
    },
    'required': ['time', 'temperature'],
  });

  final DateTime time;
  final double temperature;
}
