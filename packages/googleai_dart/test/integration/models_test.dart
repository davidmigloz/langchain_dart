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

  group('Models API Integration Tests', () {
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
      'listModels returns available models',
      () async {
        if (apiKey == null) {
          return;
        }

        final response = await client.models.list();

        expect(response.models, isNotEmpty);

        // Verify the first model has expected fields
        final firstModel = response.models.first;
        expect(firstModel.name, startsWith('models/'));

        print('✅ Found ${response.models.length} models');
        print('   First model: ${firstModel.name}');
        print('   Display name: ${firstModel.displayName}');
        print('   Base model ID: ${firstModel.baseModelId}');
        print('   Version: ${firstModel.version}');
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'listModels supports pagination',
      () async {
        if (apiKey == null) {
          return;
        }

        // Request just 2 models to test pagination
        final response = await client.models.list(pageSize: 2);

        expect(response.models.length, lessThanOrEqualTo(2));

        // If there are more models, nextPageToken should be present
        if (response.nextPageToken != null) {
          print(
            '✅ Pagination working - nextPageToken: ${response.nextPageToken}',
          );

          // Fetch next page
          final nextPage = await client.models.list(
            pageSize: 2,
            pageToken: response.nextPageToken,
          );

          expect(nextPage.models, isNotEmpty);
          print('   Next page has ${nextPage.models.length} models');
        }
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'getModel retrieves specific model details',
      () async {
        if (apiKey == null) {
          return;
        }

        // First, list models to get a valid model name
        final listResponse = await client.models.list(pageSize: 1);

        if (listResponse.models.isEmpty) {
          print('⚠️  No models available to test getModel');
          return;
        }

        final fullModelName = listResponse.models.first.name;
        // Remove 'models/' prefix to get just the model ID
        final modelId = fullModelName.replaceFirst('models/', '');

        // Get the specific model
        final model = await client.models.get(model: modelId);

        expect(model.name, fullModelName);

        print('✅ Retrieved model: ${model.name}');
        print('   Display name: ${model.displayName}');
        print('   Base model ID: ${model.baseModelId}');
        print('   Version: ${model.version}');
        print('   Input token limit: ${model.inputTokenLimit}');
        print('   Output token limit: ${model.outputTokenLimit}');
        print('   Max temperature: ${model.maxTemperature}');
        print('   Thinking: ${model.thinking}');
        print('   Supported methods: ${model.supportedGenerationMethods}');
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );

    test(
      'getModel with invalid name throws exception',
      () async {
        if (apiKey == null) {
          return;
        }

        expect(
          () => client.models.get(model: 'models/invalid-model-name-12345'),
          throwsA(isA<Exception>()),
        );
      },
      tags: ['integration'],
      timeout: const Timeout(Duration(seconds: 30)),
    );
  });
}
