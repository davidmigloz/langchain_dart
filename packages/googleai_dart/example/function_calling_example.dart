// ignore_for_file: avoid_print
/// Demonstrates function calling with tools.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'),
    ),
  );

  try {
    // Define available tools (functions the model can call)
    final tools = [
      const Tool(
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
      model: 'gemini-2.5-flash',
      request: GenerateContentRequest(
        contents: [
          const Content(
            parts: [
              TextPart('What is the weather in London and what time is it?'),
            ],
            role: 'user',
          ),
        ],
        tools: tools,
      ),
    );

    // Check if model wants to call a function
    final candidate = response.candidates?.firstOrNull;
    if (candidate != null) {
      final content = candidate.content;
      if (content != null) {
        for (final part in content.parts) {
          if (part is FunctionCallPart) {
            print('Model wants to call: ${part.functionCall.name}');
            print('With arguments:');
            part.functionCall.args?.forEach((key, value) {
              print('  $key: $value');
            });
            print('');

            // In a real application, you would:
            // 1. Execute the function with the provided arguments
            // 2. Send the result back to the model
            // 3. Get the final response
          } else if (part is TextPart) {
            print('Text response: ${part.text}');
          }
        }
      }
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
