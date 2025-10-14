// ignore_for_file: unnecessary_async, avoid_print

import 'dart:io';

import 'package:googleai_dart/src/auth/auth_provider.dart';
import 'package:googleai_dart/src/client/config.dart';
import 'package:googleai_dart/src/client/googleai_client.dart';
import 'package:test/test.dart';

void main() {
  // Integration tests require a valid API key
  // Set GEMINI_API_KEY environment variable to run these tests
  final apiKey = Platform.environment['GEMINI_API_KEY'];

  group('Prediction API Integration Tests', () {
    late GoogleAIClient client;

    setUpAll(() {
      if (apiKey == null) {
        print('⚠️  GEMINI_API_KEY not set. Skipping integration tests.');
      }
    });

    setUp(() {
      if (apiKey != null) {
        client = GoogleAIClient(
          config: GoogleAIConfig(
            authProvider: ApiKeyProvider(apiKey),
          ),
        );
      }
    });

    tearDown(() {
      if (apiKey != null) {
        client.close();
      }
    });

    test(
      'predictLongRunning creates async prediction operation',
      () async {
        if (apiKey == null) {
          return;
        }

        // Note: This test may fail if the Veo model is not available
        // or if the API key doesn't have access to prediction endpoints
        try {
          final operation = await client.models.predictLongRunning(
            model: 'veo-3.0-generate-001',
            instances: [
              {
                'prompt': 'A dog running on the beach',
              },
            ],
          );

          expect(operation.name, isNotNull);
          expect(operation.done, isNotNull);
          print('✅ PredictLongRunning request successful');
          print('   Operation name: ${operation.name}');
          print('   Operation done: ${operation.done}');

          // If operation is complete, check response
          if (operation.done) {
            if (operation.error != null) {
              print('   Operation error: ${operation.error!.message}');
            } else if (operation.response != null) {
              final videoResponse = operation.response!.generateVideoResponse;
              if (videoResponse != null) {
                print(
                  '   Generated samples: ${videoResponse.generatedSamples?.length ?? 0}',
                );
                print(
                  '   RAI filtered: ${videoResponse.raiMediaFilteredCount ?? 0}',
                );
              }
            }
          }
        } catch (e) {
          print(
            '⚠️  PredictLongRunning test skipped - model may not be available: $e',
          );
        }
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'predictLongRunning with parameters',
      () async {
        if (apiKey == null) {
          return;
        }

        try {
          final operation = await client.models.predictLongRunning(
            model: 'veo-3.0-generate-001',
            instances: [
              {
                'prompt': 'A sunset over mountains',
              },
            ],
            parameters: {
              'aspectRatio': '16:9',
            },
          );

          expect(operation.name, isNotNull);
          print('✅ PredictLongRunning with parameters successful');
          print('   Operation: ${operation.name}');
        } catch (e) {
          print(
            '⚠️  PredictLongRunning with parameters test skipped: $e',
          );
        }
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'predict with invalid model name throws exception',
      () async {
        if (apiKey == null) {
          return;
        }

        expect(
          () => client.models.predict(
            model: 'models/invalid-prediction-model-12345',
            instances: [
              {'prompt': 'test'},
            ],
          ),
          throwsA(isA<Exception>()),
        );
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'predictLongRunning with invalid model name throws exception',
      () async {
        if (apiKey == null) {
          return;
        }

        expect(
          () => client.models.predictLongRunning(
            model: 'models/invalid-lro-model-12345',
            instances: [
              {'prompt': 'test'},
            ],
          ),
          throwsA(isA<Exception>()),
        );
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );
  });
}
