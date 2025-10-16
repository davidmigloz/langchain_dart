// ignore_for_file: avoid_print
import 'package:ollama_dart/ollama_dart.dart';

/// Example demonstrating structured output using JSON schemas with Ollama.
///
/// This example shows how to use the `format` parameter to get structured
/// JSON responses that conform to a specific schema. This feature enables
/// reliable data extraction and API-like responses from language models.
///
/// Requirements:
/// - Ollama must be running locally (http://localhost:11434)
/// - A model must be available (e.g., llama3.2)
///
/// Run: dart run example/structured_output_example.dart
void main() async {
  // Initialize the Ollama client
  final client = OllamaClient();

  print('='.repeat(80));
  print('Ollama Structured Output Examples');
  print('='.repeat(80));

  // Example 1: Basic JSON mode (simple string enum)
  print('\n📋 Example 1: Basic JSON mode');
  print('-'.repeat(80));
  final response1 = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama3.2',
      messages: [
        Message(
          role: MessageRole.user,
          content: 'Tell me about Paris. Return the response as JSON.',
        ),
      ],
      format: GenerateChatCompletionRequestFormat.json(
        GenerateChatCompletionRequestFormatEnum.json,
      ),
    ),
  );
  print('Response: ${response1.message.content}\n');

  // Example 2: JSON Schema for structured output
  print('📋 Example 2: JSON Schema with structure');
  print('-'.repeat(80));
  final response2 = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama3.2',
      messages: [
        Message(role: MessageRole.user, content: 'Tell me about Paris.'),
      ],
      format: GenerateChatCompletionRequestFormat.schema({
        'type': 'object',
        'properties': {
          'city': {'type': 'string'},
          'country': {'type': 'string'},
          'population': {'type': 'integer'},
          'famous_landmarks': {
            'type': 'array',
            'items': {'type': 'string'},
          },
        },
        'required': ['city', 'country'],
      }),
    ),
  );
  print('Structured Response: ${response2.message.content}\n');

  // Example 3: Complex nested schema
  print('📋 Example 3: Complex nested schema');
  print('-'.repeat(80));
  final response3 = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama3.2',
      messages: [
        Message(
          role: MessageRole.user,
          content: 'Generate information about a fictional person.',
        ),
      ],
      format: GenerateChatCompletionRequestFormat.schema({
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
          'age': {'type': 'integer'},
          'address': {
            'type': 'object',
            'properties': {
              'street': {'type': 'string'},
              'city': {'type': 'string'},
              'country': {'type': 'string'},
            },
          },
          'hobbies': {
            'type': 'array',
            'items': {'type': 'string'},
          },
          'is_student': {'type': 'boolean'},
        },
        'required': ['name', 'age'],
      }),
    ),
  );
  print('Complex Response: ${response3.message.content}\n');

  // Example 4: Using with streaming
  print('📋 Example 4: Streaming with JSON schema');
  print('-'.repeat(80));
  final stream = client.generateChatCompletionStream(
    request: const GenerateChatCompletionRequest(
      model: 'llama3.2',
      messages: [
        Message(
          role: MessageRole.user,
          content: 'List 3 programming languages with their year of creation.',
        ),
      ],
      format: GenerateChatCompletionRequestFormat.schema({
        'type': 'object',
        'properties': {
          'languages': {
            'type': 'array',
            'items': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
                'year': {'type': 'integer'},
              },
            },
          },
        },
      }),
    ),
  );

  print('Streaming response:');
  await for (final chunk in stream) {
    if (chunk.message.content.isNotEmpty) {
      print(chunk.message.content);
    }
  }

  // Example 5: Data extraction use case
  print('\n📋 Example 5: Data extraction from text');
  print('-'.repeat(80));
  final response5 = await client.generateChatCompletion(
    request: const GenerateChatCompletionRequest(
      model: 'llama3.2',
      messages: [
        Message(
          role: MessageRole.user,
          content: '''
Extract the key information from this text:

"Apple Inc. was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne
in April 1976. The company is headquartered in Cupertino, California
and is known for products like the iPhone, iPad, and Mac computers."
''',
        ),
      ],
      format: GenerateChatCompletionRequestFormat.schema({
        'type': 'object',
        'properties': {
          'company_name': {'type': 'string'},
          'founders': {
            'type': 'array',
            'items': {'type': 'string'},
          },
          'founding_year': {'type': 'integer'},
          'headquarters': {'type': 'string'},
          'products': {
            'type': 'array',
            'items': {'type': 'string'},
          },
        },
        'required': ['company_name', 'founders', 'founding_year'],
      }),
    ),
  );
  print('Extracted Data: ${response5.message.content}\n');

  print('='.repeat(80));
  print('✅ All examples completed!');
  print('='.repeat(80));

  client.endSession();
}

extension on String {
  String repeat(int count) => List.filled(count, this).join();
}
