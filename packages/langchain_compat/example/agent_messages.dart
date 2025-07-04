import 'dart:io';
import 'dart:convert';
import 'package:langchain_compat/langchain_compat.dart';
import 'package:json_schema/json_schema.dart';

void main() async {
  print('Agent with Dartantic Message Types Example\n');

  // Check for API key
  final apiKey = Platform.environment['OPENAI_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    print('Please set the OPENAI_API_KEY environment variable');
    exit(1);
  }

  // Define a simple weather tool
  final weatherTool = Tool<Map<String, dynamic>>(
    name: 'get_weather',
    description: 'Get the weather for a location',
    inputSchema: JsonSchema.create({
      'type': 'object',
      'properties': {
        'location': {
          'type': 'string',
          'description': 'The city name',
        },
      },
      'required': ['location'],
    }),
    inputFromJson: (json) => json,
    onCall: (Map<String, dynamic> params) async {
      print('Weather tool called with params: $params');
      final location = params['location'];
      if (location == null) {
        return json.encode({'error': 'Location parameter is required'});
      }
      // Simulate weather API
      final weather = {
        'location': location,
        'temperature': 72,
        'conditions': 'Sunny',
        'humidity': 45,
      };
      return json.encode(weather);
    },
  );

  // Create an agent with tools
  final agent = Agent(
    'openai:gpt-4o-mini',
    tools: [weatherTool],
    temperature: 0.7,
  );

  print('Agent created: ${agent.model}\n');

  // Create messages using the new Dartantic Message type
  final messages = [
    Message(
      role: MessageRole.system,
      parts: [TextPart('You are a helpful weather assistant.')],
    ),
    Message(
      role: MessageRole.user,
      parts: [TextPart('What\'s the weather like in San Francisco?')],
    ),
  ];

  print('Streaming response...\n');

  // Stream the response with automatic tool execution
  try {
    await for (final result in agent.runStream(messages)) {
      // Stream text output
      if (result.output.isNotEmpty) {
        stdout.write(result.output);
      }
      
      // Show new messages (including tool calls/results)
      for (final message in result.messages) {
        if (message.role == MessageRole.model) {
          // Check for tool calls
          final toolParts = message.parts.whereType<ToolPart>();
          for (final toolPart in toolParts) {
            if (toolPart.kind == ToolPartKind.call) {
              print('\n[Tool Call: ${toolPart.name}]');
            }
          }
        } else if (message.role == MessageRole.user) {
          // Tool results
          final toolParts = message.parts.whereType<ToolPart>();
          for (final toolPart in toolParts) {
            if (toolPart.kind == ToolPartKind.result) {
              print('[Tool Result: ${toolPart.result}]');
            }
          }
        }
      }
    }
    
    print('\n\nAgent interaction complete!');
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:\n$stackTrace');
  } finally {
    agent.close();
  }
}