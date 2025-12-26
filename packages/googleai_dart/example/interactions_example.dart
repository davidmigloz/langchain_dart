// ignore_for_file: avoid_print
/// Demonstrates the Interactions API for server-side state management.
///
/// The Interactions API is an experimental API that provides:
/// - Server-side conversation state management
/// - Multi-turn conversations with managed context
/// - Streaming responses with SSE events
/// - Function calling with automatic result handling
/// - Agent support (e.g., Deep Research)
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    // Example 1: Simple interaction (non-streaming)
    await simpleInteraction(client);

    // Example 2: Streaming interaction
    await streamingInteraction(client);

    // Example 3: Multi-turn conversation
    await multiTurnConversation(client);

    // Example 4: Function calling with interactions
    await functionCallingInteraction(client);
  } finally {
    client.close();
  }
}

/// Simple non-streaming interaction
Future<void> simpleInteraction(GoogleAIClient client) async {
  print('=== Simple Interaction ===\n');

  final interaction = await client.interactions.create(
    model: 'gemini-3-flash-preview',
    input: 'What is the capital of France?',
  );

  print('Status: ${interaction.status}');
  print('Model: ${interaction.model}');

  // Extract text from outputs
  if (interaction.outputs != null) {
    for (final output in interaction.outputs!) {
      if (output is TextContent) {
        print('Response: ${output.text}');
      }
    }
  }

  // Check usage
  if (interaction.usage != null) {
    print('Input tokens: ${interaction.usage!.totalInputTokens}');
    print('Output tokens: ${interaction.usage!.totalOutputTokens}');
  }

  print('');
}

/// Streaming interaction with real-time events
Future<void> streamingInteraction(GoogleAIClient client) async {
  print('=== Streaming Interaction ===\n');

  await for (final event in client.interactions.createStream(
    model: 'gemini-3-flash-preview',
    input: 'Write a haiku about programming.',
  )) {
    switch (event) {
      case InteractionStartEvent():
        print('Stream started: ${event.interaction?.id}');
      case ContentDeltaEvent():
        // Handle incremental content updates
        final delta = event.delta;
        if (delta is TextDelta) {
          // Print text as it streams in
          print(delta.text);
        }
      case ContentStopEvent():
        print('\nContent block completed (index: ${event.index})');
      case InteractionCompleteEvent():
        print('Stream completed');
        print('Total tokens: ${event.interaction?.usage?.totalTokens}');
      case ErrorEvent():
        print('Error: ${event.error?.message}');
      default:
        // Handle other event types as needed
        break;
    }
  }

  print('');
}

/// Multi-turn conversation using previousInteractionId
Future<void> multiTurnConversation(GoogleAIClient client) async {
  print('=== Multi-turn Conversation ===\n');

  // First turn
  final turn1 = await client.interactions.create(
    model: 'gemini-3-flash-preview',
    input: 'My name is Alice.',
  );
  print('Turn 1 - User: My name is Alice.');
  _printTextOutputs(turn1);

  // Second turn - references the first interaction
  final turn2 = await client.interactions.create(
    model: 'gemini-3-flash-preview',
    input: 'What is my name?',
    previousInteractionId: turn1.id,
  );
  print('Turn 2 - User: What is my name?');
  _printTextOutputs(turn2);

  print('');
}

/// Function calling with the Interactions API
Future<void> functionCallingInteraction(GoogleAIClient client) async {
  print('=== Function Calling Interaction ===\n');

  // Define a function tool
  const tools = [
    FunctionTool(
      name: 'get_weather',
      description: 'Get the current weather for a location',
      parameters: {
        'type': 'object',
        'properties': {
          'location': {'type': 'string', 'description': 'The city name'},
        },
        'required': ['location'],
      },
    ),
  ];

  // Stream the interaction to see function calls in real-time
  await for (final event in client.interactions.createStream(
    model: 'gemini-3-flash-preview',
    input: 'What is the weather in Paris?',
    tools: tools,
  )) {
    switch (event) {
      case ContentStartEvent():
        // Content is starting - could be text or function call
        final content = event.content;
        if (content != null) {
          print('Content starting: ${content.type}');
        }
      case ContentDeltaEvent():
        final delta = event.delta;
        if (delta is TextDelta) {
          print('Text: ${delta.text}');
        } else if (delta is FunctionCallDelta) {
          // Function call arguments arrive incrementally
          if (delta.name != null) {
            print('Function: ${delta.name}');
          }
          if (delta.arguments != null) {
            print('Arguments: ${delta.arguments}');
          }
        }
      case InteractionCompleteEvent():
        print('Interaction complete');
        // Check if we need to handle function results
        if (event.interaction?.status == InteractionStatus.requiresAction) {
          print('Action required: execute function and continue');
        }
        // Check for function calls in the final output
        final outputs = event.interaction?.outputs;
        if (outputs != null) {
          for (final output in outputs) {
            if (output is FunctionCallContent) {
              print('Function call: ${output.name}');
              print('Arguments: ${output.arguments}');
            }
          }
        }
      default:
        break;
    }
  }

  print('');
}

/// Helper to print text outputs from an interaction
void _printTextOutputs(Interaction interaction) {
  if (interaction.outputs != null) {
    for (final output in interaction.outputs!) {
      if (output is TextContent) {
        print('Assistant: ${output.text}');
      }
    }
  }
}
