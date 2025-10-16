// ignore_for_file: avoid_print

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize the client with your API key
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider(
        'YOUR_API_KEY',
      ), // Replace with your actual API key
    ),
  );

  // Replace with your actual tuned model ID
  // You can create a tuned model through the Google AI Studio or API
  const tunedModelId = 'my-model-abc123';

  try {
    print('=== Example 1: Generate Content with Tuned Model ===\n');

    // Create a simple text request
    const request = GenerateContentRequest(
      contents: [
        Content(
          parts: [TextPart('Explain quantum computing in simple terms')],
          role: 'user',
        ),
      ],
    );

    // Generate content using your tuned model
    final response = await client.tunedModels.generateContent(
      tunedModel: tunedModelId,
      request: request,
    );

    // Print the response
    if (response.candidates != null && response.candidates!.isNotEmpty) {
      final candidate = response.candidates!.first;
      if (candidate.content != null) {
        for (final part in candidate.content!.parts) {
          if (part is TextPart) {
            print(part.text);
          }
        }
      }
    }

    // Print usage metadata
    if (response.usageMetadata != null) {
      print('\nTokens used: ${response.usageMetadata!.totalTokenCount}');
    }

    print('\n=== Example 2: Stream Content with Tuned Model ===\n');

    // Stream content using your tuned model
    final stream = client.tunedModels.streamGenerateContent(
      tunedModel: tunedModelId,
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [TextPart('Write a haiku about programming')],
            role: 'user',
          ),
        ],
      ),
    );

    // Process each chunk as it arrives
    await for (final chunk in stream) {
      if (chunk.candidates != null && chunk.candidates!.isNotEmpty) {
        final candidate = chunk.candidates!.first;
        if (candidate.content != null) {
          for (final part in candidate.content!.parts) {
            if (part is TextPart) {
              print(part.text);
            }
          }
        }
      }
    }

    print('\n\n=== Example 3: Batch Generate with Tuned Model ===\n');

    // Create a batch job with multiple requests
    final batch = await client.tunedModels.batchGenerateContent(
      tunedModel: tunedModelId,
      batch: const GenerateContentBatch(
        model: 'tunedModels/placeholder', // Will be replaced by path param
        displayName: 'My Batch Job',
        inputConfig: InputConfig(
          requests: InlinedRequests(
            requests: [
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(parts: [TextPart('What is 2+2?')], role: 'user'),
                  ],
                ),
              ),
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(parts: [TextPart('What is 3+3?')], role: 'user'),
                  ],
                ),
              ),
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(parts: [TextPart('What is 5+5?')], role: 'user'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    print('Batch job created: ${batch.name}');
    print('State: ${batch.state}');

    if (batch.name != null) {
      print('\nYou can monitor the batch status using:');
      print(
        '  await client.batches.getGenerateContentBatch(name: "${batch.name}");',
      );
      print('\nOr use the LROPoller utility to wait for completion:');
      print('  final poller = LROPoller(');
      print('    client: client,');
      print('    operationName: "${batch.name}",');
      print('    operationGetter: client.batches.getGenerateContentBatch,');
      print('  );');
      print('  final completed = await poller.waitForCompletion();');
    }

    print('\n=== Example 4: Error Handling ===\n');

    // Example of handling errors with invalid tuned model
    try {
      await client.tunedModels.generateContent(
        tunedModel: 'invalid-model-id',
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Test')], role: 'user'),
          ],
        ),
      );
    } on ApiException catch (e) {
      print('Caught expected error:');
      print('  Code: ${e.code}');
      print('  Message: ${e.message}');
    }

    print('\n=== Benefits of Using Tuned Models ===\n');
    print('''
Tuned models allow you to:
- Customize model behavior for your specific domain
- Improve accuracy for specialized tasks
- Reduce the need for extensive prompting
- Maintain consistent output style and format
- Optimize for your specific use case

To create a tuned model:
1. Visit Google AI Studio (https://aistudio.google.com)
2. Prepare your training data
3. Create and train a tuned model
4. Use the tuned model ID in your API calls
''');
  } finally {
    // Clean up
    client.close();
  }
}
