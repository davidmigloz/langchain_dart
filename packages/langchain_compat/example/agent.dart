// ignore_for_file: avoid_print

import 'dart:io';

import 'package:json_schema/json_schema.dart';
import 'package:langchain_compat/langchain_compat.dart';

// Helper functions for creating messages
Message systemMessage(String text) =>
    Message(role: MessageRole.system, parts: [TextPart(text)]);

Message userMessage(String text) =>
    Message(role: MessageRole.user, parts: [TextPart(text)]);

String getMessageText(Message message) =>
    message.parts.whereType<TextPart>().map((p) => p.text).join();

void main() async {
  // Create tools for the agent
  final tools = [weatherTool, temperatureConverterTool];

  // Create an agent with tools
  final agent = Agent(
    'google:gemini-2.0-flash-001', // Specify provider:model
    tools: tools,
  );

  print('Agent: ${agent.displayName}');
  print('Available tools: ${tools.map((t) => t.name).join(", ")}\n');

  await singleToolCall(agent);
  await multipleToolCalls(agent);
  await multiTurnConversation(agent);
  await weatherAndCalculation(agent);
  await streamingComparison(agent);

  agent.close();
  exit(0);
}

Future<void> singleToolCall(Agent agent) async {
  print('═══ Scenario 1: Single Tool Call ═══');

  final messages = [
    systemMessage('You are a helpful assistant.'),
    userMessage("What's the weather like in Boston?"),
  ];

  print('User: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  final result = await agent.run(messages);
  print(result.output);

  print('\nTool calls made: ${_countToolCalls(result.messages)}');
  print('Final message count: ${messages.length + result.messages.length}\n');
}

Future<void> multipleToolCalls(Agent agent) async {
  print('═══ Scenario 2: Multiple Tool Calls ═══');

  final messages = [
    systemMessage('You are a helpful assistant.'),
    userMessage(
      "What's the weather in New York and what's that temperature in Celsius?",
    ),
  ];

  print('User: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  final result = await agent.run(messages);
  print(result.output);

  print('\nTool calls made: ${_countToolCalls(result.messages)}');
  print('Final message count: ${messages.length + result.messages.length}\n');
}

Future<void> multiTurnConversation(Agent agent) async {
  print('═══ Scenario 3: Multi-turn Conversation ═══');

  final messages = <Message>[systemMessage('You are a helpful assistant.')];

  // Turn 1: Ask about weather
  messages.add(userMessage("What's the weather in Seattle?"));
  print('User: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  var result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);

  // Turn 2: Follow up with temperature conversion
  messages.add(
    userMessage('Thanks! Can you convert that temperature to Celsius?'),
  );
  print('\nUser: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);

  // Turn 3: Continue conversation
  messages.add(userMessage('Perfect! What would 100°F be in Celsius?'));
  print('\nUser: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  result = await agent.run(messages);
  print(result.output);
  messages.addAll(result.messages);

  print('\nTotal conversation turns: 3');
  print('Total tool calls made: ${_countToolCalls(messages)}');
  print('Final message count: ${messages.length}\n');
}

Future<void> weatherAndCalculation(Agent agent) async {
  print('═══ Scenario 4: Weather + Temperature Conversion ═══');

  final messages = [
    systemMessage(
      'You are a helpful assistant that can get weather and do calculations.',
    ),
    userMessage(
      "What's the weather in Boston and "
      'can you convert that temperature to Celsius?',
    ),
  ];

  print('User: ${getMessageText(messages.last)}');
  stdout.write('Agent: ');

  final result = await agent.run(messages);
  print(result.output);

  print('\nTool calls made: ${_countToolCalls(result.messages)}');
  print('Final message count: ${messages.length + result.messages.length}\n');
}

Future<void> streamingComparison(Agent agent) async {
  print('═══ Scenario 5: Streaming vs Non-Streaming ═══');

  final messages = [
    systemMessage('You are a helpful assistant.'),
    userMessage(
      'Check the weather in Miami and convert that temperature to Celsius.',
    ),
  ];

  print('User: ${getMessageText(messages.last)}');

  // Non-streaming
  print('\n--- Non-streaming response ---');
  final result = await agent.run(messages);
  print('Agent: ${result.output}');

  // Streaming
  print('\n--- Streaming response ---');
  stdout.write('Agent: ');
  await for (final chunk in agent.runStream(messages)) {
    if (chunk.output.isNotEmpty) {
      stdout.write(chunk.output);
    }
  }
  print('\n');

  print('Both approaches produce the same result with tool execution.');
  print('Streaming provides real-time feedback during processing.\n');
}

int _countToolCalls(List<Message> messages) => messages
    .where((msg) => msg.role == MessageRole.model)
    .expand(
      (msg) => msg.parts.whereType<ToolPart>().where(
        (p) => p.kind == ToolPartKind.call,
      ),
    )
    .length;

// Create weather tool
final weatherTool = Tool<Map<String, dynamic>>(
  name: 'get_weather',
  description: 'Get the current weather for a given location',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The location to get weather for',
      },
    },
    'required': ['location'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final location = input['location'] as String;

    // Simulate weather API call with realistic variation
    final temps = {
      'Boston': '68°F',
      'New York': '71°F',
      'Seattle': '63°F',
      'Miami': '82°F',
    };
    final conditions = {
      'Boston': 'partly cloudy',
      'New York': 'sunny',
      'Seattle': 'overcast',
      'Miami': 'hot and humid',
    };

    final temp = temps[location] ?? '72°F';
    final condition = conditions[location] ?? 'partly cloudy';

    return 'The weather in $location is $temp and $condition.';
  },
);

// Create temperature converter tool
final temperatureConverterTool = Tool<Map<String, dynamic>>(
  name: 'convert_f_to_c',
  description: 'Convert temperature from Fahrenheit to Celsius',
  inputSchema: JsonSchema.create({
    'type': 'object',
    'properties': {
      'fahrenheit': {
        'type': 'number',
        'description': 'Temperature in Fahrenheit to convert to Celsius',
      },
    },
    'required': ['fahrenheit'],
  }),
  inputFromJson: (json) => json,
  onCall: (input) async {
    final fahrenheit = input['fahrenheit'] as num? ?? 70;

    // Convert Fahrenheit to Celsius using formula: (F - 32) * 5/9
    final celsius = (fahrenheit - 32) * 5 / 9;
    final roundedCelsius = celsius.round();

    return '$fahrenheit°F = $roundedCelsius°C';
  },
);
