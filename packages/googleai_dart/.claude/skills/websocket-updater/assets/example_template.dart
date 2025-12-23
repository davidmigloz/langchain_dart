// ignore_for_file: avoid_print
/// Demonstrates the {ResourceName} for {brief description}.
///
/// The {ResourceName} provides:
/// - Feature 1 description
/// - Feature 2 description
/// - Feature 3 description
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    // Example 1: Basic usage
    await basicExample(client);

    // Example 2: Streaming (if applicable)
    await streamingExample(client);

    // Example 3: Multi-turn or advanced feature
    await advancedExample(client);

    // Example 4: Tool/function calling (if applicable)
    await toolExample(client);
  } finally {
    client.close();
  }
}

/// Basic non-streaming example.
Future<void> basicExample(GoogleAIClient client) async {
  print('=== Basic Example ===\n');

  // Replace with actual API call
  // final result = await client.{resourceName}.create(
  //   param: 'value',
  // );

  // print('Result: $result');
  print('');
}

/// Streaming example with real-time events.
Future<void> streamingExample(GoogleAIClient client) async {
  print('=== Streaming Example ===\n');

  // Replace with actual streaming API call
  // await for (final event in client.{resourceName}.createStream(
  //   param: 'value',
  // )) {
  //   switch (event) {
  //     case StartEvent():
  //       print('Stream started: ${event.id}');
  //     case DeltaEvent():
  //       // Handle incremental updates
  //       final delta = event.delta;
  //       if (delta is TextDelta) {
  //         print(delta.text);
  //       }
  //     case CompleteEvent():
  //       print('Stream completed');
  //     case ErrorEvent():
  //       print('Error: ${event.error?.message}');
  //     default:
  //       break;
  //   }
  // }

  print('');
}

/// Multi-turn or advanced feature example.
Future<void> advancedExample(GoogleAIClient client) async {
  print('=== Advanced Example ===\n');

  // Example: Multi-turn conversation with context
  // final turn1 = await client.{resourceName}.create(
  //   input: 'First message',
  // );
  //
  // final turn2 = await client.{resourceName}.create(
  //   input: 'Follow-up message',
  //   previousId: turn1.id,
  // );

  print('');
}

/// Function/tool calling example.
Future<void> toolExample(GoogleAIClient client) async {
  print('=== Tool Example ===\n');

  // Define tools
  // const tools = [
  //   FunctionTool(
  //     name: 'get_weather',
  //     description: 'Get the current weather for a location',
  //     parameters: {
  //       'type': 'object',
  //       'properties': {
  //         'location': {
  //           'type': 'string',
  //           'description': 'The city name',
  //         },
  //       },
  //       'required': ['location'],
  //     },
  //   ),
  // ];
  //
  // final result = await client.{resourceName}.create(
  //   input: 'What is the weather in Paris?',
  //   tools: tools,
  // );
  //
  // // Handle function calls in response
  // for (final output in result.outputs ?? []) {
  //   if (output is FunctionCallContent) {
  //     print('Function: ${output.name}');
  //     print('Arguments: ${output.arguments}');
  //   }
  // }

  print('');
}
