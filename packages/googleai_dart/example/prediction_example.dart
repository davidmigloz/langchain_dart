// ignore_for_file: avoid_print
/// Demonstrates video generation using the Veo model with predict and predictLongRunning.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'), // Replace with your API key
    ),
  );

  try {
    // Example 1: Synchronous prediction
    print('=== Synchronous Prediction ===\n');

    final predictResponse = await client.models.predict(
      model: 'veo-3.0-generate-001',
      instances: [
        {'prompt': 'A cat playing piano in a jazz club'},
      ],
    );

    print('Predictions received: ${predictResponse.predictions.length}');
    for (var i = 0; i < predictResponse.predictions.length; i++) {
      print('Prediction $i: ${predictResponse.predictions[i]}');
    }

    // Example 2: Long-running prediction for video generation
    print('\n=== Long-Running Prediction (Video Generation) ===\n');

    final operation = await client.models.predictLongRunning(
      model: 'veo-3.0-generate-001',
      instances: [
        {'prompt': 'A golden retriever running on a beach at sunset'},
      ],
      parameters: {'aspectRatio': '16:9'},
    );

    print('Operation created: ${operation.name}');
    print('Operation done: ${operation.done}');

    // Check if operation is complete
    if (operation.done) {
      if (operation.error != null) {
        // Handle error
        print('Error: ${operation.error!.message}');
        print('Code: ${operation.error!.code}');
      } else if (operation.response != null) {
        // Process successful response
        final videoResponse = operation.response!.generateVideoResponse;
        if (videoResponse != null) {
          print('\nVideo generation complete!');
          print(
            'Generated samples: ${videoResponse.generatedSamples?.length ?? 0}',
          );

          // Access generated videos
          if (videoResponse.generatedSamples != null) {
            for (var i = 0; i < videoResponse.generatedSamples!.length; i++) {
              final media = videoResponse.generatedSamples![i];
              if (media.video != null) {
                if (media.video!.uri != null) {
                  print('Video $i URI: ${media.video!.uri}');
                } else if (media.video!.video != null) {
                  print('Video $i: Base64 encoded data available');
                }
              }
            }
          }

          // Check for RAI filtering
          if (videoResponse.raiMediaFilteredCount != null &&
              videoResponse.raiMediaFilteredCount! > 0) {
            print(
              '\nRAI filtered ${videoResponse.raiMediaFilteredCount} videos',
            );
            if (videoResponse.raiMediaFilteredReasons != null) {
              print('Reasons: ${videoResponse.raiMediaFilteredReasons}');
            }
          }
        }
      }
    } else {
      print('\nOperation is still in progress.');
      print('Poll the operation using its name to check status.');
    }

    // Example 3: Multiple video generation requests
    print('\n=== Batch Video Generation ===\n');

    final batchOperation = await client.models.predictLongRunning(
      model: 'veo-3.0-generate-001',
      instances: [
        {'prompt': 'A bird flying through clouds'},
        {'prompt': 'Ocean waves crashing on rocks'},
        {'prompt': 'Time-lapse of city traffic at night'},
      ],
    );

    print('Batch operation: ${batchOperation.name}');
    print('Processing ${3} video generation requests...');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
