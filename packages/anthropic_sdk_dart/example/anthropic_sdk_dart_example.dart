// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:anthropic_sdk_dart/anthropic_sdk_dart.dart';

Future<void> main() async {
  final client = AnthropicClient(
    apiKey: Platform.environment['ANTHROPIC_API_KEY'],
  );

  await _createMessage(client);
  await _createMessageStream(client);
  await _toolUse(client);
  await _toolUseStreaming(client);

  client.endSession();
}

Future<void> _createMessage(final AnthropicClient client) async {
  final res = await client.createMessage(
    request: const CreateMessageRequest(
      model: Model.model(Models.claude35Sonnet20240620),
      maxTokens: 1024,
      messages: [
        Message(
          role: MessageRole.user,
          content: MessageContent.text('Hello, Claude'),
        ),
      ],
    ),
  );
  print(res.content.text);
  // Hello! It's nice to meet you. How are you doing today?
}

Future<void> _createMessageStream(final AnthropicClient client) async {
  final stream = client.createMessageStream(
    request: const CreateMessageRequest(
      model: Model.model(Models.claude35Sonnet20240620),
      maxTokens: 1024,
      messages: [
        Message(
          role: MessageRole.user,
          content: MessageContent.text('Hello, Claude'),
        ),
      ],
    ),
  );
  await for (final res in stream) {
    res.map(
      messageStart: (MessageStartEvent e) {},
      messageDelta: (MessageDeltaEvent e) {},
      messageStop: (MessageStopEvent e) {},
      contentBlockStart: (ContentBlockStartEvent e) {},
      contentBlockDelta: (ContentBlockDeltaEvent e) {
        stdout.write(e.delta.text);
      },
      contentBlockStop: (ContentBlockStopEvent e) {},
      ping: (PingEvent e) {},
      error: (ErrorEvent e) {},
    );
  }
  // Hello! It's nice to meet you. How are you doing today?
}

Future<void> _toolUse(final AnthropicClient client) async {
  final request1 = CreateMessageRequest(
    model: const Model.model(Models.claude35Sonnet20240620),
    messages: [
      const Message(
        role: MessageRole.user,
        content: MessageContent.text(
          'What’s the weather like in Boston right now?',
        ),
      ),
    ],
    tools: [tool],
    toolChoice: ToolChoice(type: ToolChoiceType.tool, name: tool.name),
    maxTokens: 1024,
  );

  final aiMessage1 = await client.createMessage(request: request1);

  final toolUse = aiMessage1.content.blocks.firstOrNull;
  if (toolUse == null || toolUse is! ToolUseBlock) {
    return;
  }

  // Call your tool here with the given input
  final toolResult = _getCurrentWeather(
    toolUse.input['location'],
    toolUse.input['unit'],
  );

  final request2 = CreateMessageRequest(
    model: const Model.model(Models.claude35Sonnet20240620),
    messages: [
      const Message(
        role: MessageRole.user,
        content: MessageContent.text(
          'What’s the weather like in Boston right now in Fahrenheit?',
        ),
      ),
      Message(role: MessageRole.assistant, content: aiMessage1.content),
      Message(
        role: MessageRole.user,
        content: MessageContent.blocks([
          Block.toolResult(
            toolUseId: toolUse.id,
            content: ToolResultBlockContent.text(json.encode(toolResult)),
          ),
        ]),
      ),
    ],
    tools: [tool],
    maxTokens: 1024,
  );
  final aiMessage2 = await client.createMessage(request: request2);
  print(aiMessage2.content.text);
  // Based on the current weather information for Boston, here's what it's like right now:
  //
  // The temperature in Boston is 71.6°F (Fahrenheit).
  // The weather conditions are described as sunny.
}

Future<void> _toolUseStreaming(final AnthropicClient client) async {
  final request = CreateMessageRequest(
    model: const Model.model(Models.claude35Sonnet20240620),
    messages: [
      const Message(
        role: MessageRole.user,
        content: MessageContent.text(
          'What’s the weather like in Boston right now in Fahrenheit?',
        ),
      ),
    ],
    tools: [tool],
    toolChoice: ToolChoice(type: ToolChoiceType.tool, name: tool.name),
    maxTokens: 1024,
  );

  final stream = client.createMessageStream(request: request);
  await for (final res in stream) {
    res.map(
      messageStart: (MessageStartEvent v) {},
      messageDelta: (MessageDeltaEvent v) {},
      messageStop: (MessageStopEvent v) {},
      contentBlockStart: (ContentBlockStartEvent v) {},
      contentBlockDelta: (ContentBlockDeltaEvent v) {
        stdout.write(v.delta.inputJson);
      },
      contentBlockStop: (ContentBlockStopEvent v) {},
      ping: (PingEvent v) {},
      error: (ErrorEvent v) {},
    );
  }
  // {"location": "Boston, MA", "unit": "fahrenheit"}
}

Map<String, dynamic> _getCurrentWeather(
  final String location,
  final String unit,
) {
  const temperature = 22;
  const weather = 'Sunny';
  return {
    'temperature': unit == 'celsius' ? temperature : (temperature * 9 / 5) + 32,
    'unit': unit,
    'description': weather,
  };
}

const tool = Tool.custom(
  name: 'get_current_weather',
  description: 'Get the current weather in a given location',
  inputSchema: {
    'type': 'object',
    'properties': {
      'location': {
        'type': 'string',
        'description': 'The city and state, e.g. San Francisco, CA',
      },
      'unit': {
        'type': 'string',
        'description': 'The unit of temperature to return',
        'enum': ['celsius', 'fahrenheit'],
      },
    },
    'required': ['location'],
  },
);
