// ignore_for_file: avoid_print
/// Demonstrates function calling with tools.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize client from environment variable (GOOGLE_GENAI_API_KEY)
  final client = GoogleAIClient.fromEnvironment();

  try {
    // Define available tools (functions the model can call)
    const tools = [
      Tool(
        functionDeclarations: [
          FunctionDeclaration(
            name: 'get_weather',
            description: 'Get the current weather for a location',
            parameters: Schema(
              type: SchemaType.object,
              properties: {
                'location': Schema(
                  type: SchemaType.string,
                  description: 'City name (e.g., "London", "San Francisco")',
                ),
                'unit': Schema(
                  type: SchemaType.string,
                  description: 'Temperature unit',
                  enumValues: ['celsius', 'fahrenheit'],
                ),
              },
              required: ['location'],
            ),
          ),
          FunctionDeclaration(
            name: 'get_time',
            description: 'Get the current time in a timezone',
            parameters: Schema(
              type: SchemaType.object,
              properties: {
                'timezone': Schema(
                  type: SchemaType.string,
                  description: 'Timezone (e.g., "America/New_York")',
                ),
              },
              required: ['timezone'],
            ),
          ),
        ],
      ),
    ];

    // Make a request with tools
    print('Asking: What is the weather in London?\n');

    final response = await client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: [
          Content.text('What is the weather in London and what time is it?'),
        ],
        tools: tools,
      ),
    );

    // Check if model wants to call functions using the extension
    final functionCalls = response.functionCalls;
    if (functionCalls.isNotEmpty) {
      for (final call in functionCalls) {
        print('Model wants to call: ${call.name}');
        print('With arguments:');
        call.args?.forEach((key, value) {
          print('  $key: $value');
        });
        print('');
      }
    }

    // Check for text response
    final text = response.text;
    if (text != null) {
      print('Text response: $text');
    }

    // Example of handling function results (mock implementation)
    print('\nNote: In a real application, you would execute the function');
    print('and send the result back to the model in a follow-up request.');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
