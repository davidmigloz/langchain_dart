// ignore_for_file: avoid_print, unreachable_from_main

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

import 'lib/dump_message_history.dart';

void main() async {
  final providersWithOutputSchema = ChatProvider.all.whereNot(
    (p) => p.name == 'groq' || p.name == 'nvidia' || p.name == 'mistral',
  );

  for (final provider in providersWithOutputSchema) {
    final agent = Agent.fromProvider(provider);
    // await jsonOutput(agent);
    // await jsonOutputStream(agent);
    // await mapOutput(agent);
    await typedOutput(agent);
    // await typedOutputWithToolCalls(agent);
    // await streamingTypedOutputWithToolCalls(agent);
  }
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
        print(r.output);
      });

  final map = jsonDecode(text.toString()) as Map<String, dynamic>;
  print('town: ${map['town']}');
  print('country: ${map['country']}');
  dumpMessageHistory(history);
}

Future<void> mapOutput(Agent agent) async {
  print('═══ ${agent.displayName} Map Output ═══');

  final result = await agent.runFor<Map<String, dynamic>>(
    'What is the Windy City in the US of A?',
    outputSchema: TownAndCountry.schema,
  );

  print('town: ${result.output['town']}');
  print('country: ${result.output['country']}');
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
}

// Future<void> streamingTypedOutputWithToolCalls(Agent agent) async {
//   print('═══ ${agent.displayName} Typed Output with Tool Calls ═══');

//   final result = await agent.runForStream<TimeAndTemperature>(
//     'What is the time and temperature in Portland, OR?',
//     outputSchema: TimeAndTemperature.schema,
//   );

//   print('time: ${result.output.time}');
//   print('temperature: ${result.output.temperature}');
// }

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
        temperature: json['temperature'],
      );

  static final schema = JsonSchema.create({
    'type': 'object',
    'properties': {
      'time': {'type': 'string'},
      'temperature': {'type': 'number'},
    },
  });

  final DateTime time;
  final double temperature;
}
