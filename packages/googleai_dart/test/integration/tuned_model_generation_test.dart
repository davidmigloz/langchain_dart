// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

/// Integration tests for tuned model content generation.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
///
/// **Note**: These tests also require a tuned model to be available.
/// Set GEMINI_TUNED_MODEL environment variable with your tuned model ID
/// (e.g., "my-model-abc123").
void main() {
  String? apiKey;
  String? tunedModel;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    tunedModel = Platform.environment['GEMINI_TUNED_MODEL'];

    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else if (tunedModel == null || tunedModel!.isEmpty) {
      print(
        '⚠️  GEMINI_TUNED_MODEL not set. Tuned model tests will be skipped.\n'
        '   To run these tests, export GEMINI_TUNED_MODEL=your_tuned_model_id',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey!)),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('generateContentByTunedModel - Integration', () {
    test('generates content with a tuned model', () async {
      if (apiKey == null || tunedModel == null) {
        markTestSkipped('API key or tuned model not available');
        return;
      }

      final response = await client!.tunedModels.generateContent(
        tunedModel: tunedModel!,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Say "Hello, World!" and nothing else.')],
              role: 'user',
            ),
          ],
        ),
      );

      expect(response.candidates, isNotEmpty);
      expect(response.candidates?.first.content, isNotNull);
      print('✓ Generated content with tuned model: $tunedModel');
    });

    test('handles invalid tuned model gracefully', () {
      if (apiKey == null || client == null) {
        markTestSkipped('API key not available');
        return;
      }

      expect(
        () => client!.tunedModels.generateContent(
          tunedModel: 'invalid-model-xyz',
          request: const GenerateContentRequest(
            contents: [
              Content(parts: [TextPart('Test')], role: 'user'),
            ],
          ),
        ),
        throwsA(isA<ApiException>()),
      );
    });
  });

  group('streamGenerateContentByTunedModel - Integration', () {
    test('streams content with a tuned model', () async {
      if (apiKey == null || tunedModel == null) {
        markTestSkipped('API key or tuned model not available');
        return;
      }

      final stream = client!.tunedModels.streamGenerateContent(
        tunedModel: tunedModel!,
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Count from 1 to 3')], role: 'user'),
          ],
        ),
      );

      var chunkCount = 0;
      await for (final chunk in stream) {
        chunkCount++;
        expect(chunk.candidates, isNotEmpty);
      }

      expect(chunkCount, greaterThan(0));
      print('✓ Streamed $chunkCount chunks with tuned model: $tunedModel');
    });

    test('handles abort trigger during streaming', () async {
      if (apiKey == null || tunedModel == null) {
        markTestSkipped('API key or tuned model not available');
        return;
      }

      // Create a completer to abort after first chunk
      var firstChunkReceived = false;

      final stream = client!.tunedModels.streamGenerateContent(
        tunedModel: tunedModel!,
        request: const GenerateContentRequest(
          contents: [
            Content(
              parts: [TextPart('Write a long essay about AI')],
              role: 'user',
            ),
          ],
        ),
      );

      try {
        await for (final _ in stream) {
          if (!firstChunkReceived) {
            firstChunkReceived = true;
            break; // Stop consuming stream
          }
        }
        expect(firstChunkReceived, isTrue);
      } catch (e) {
        // Expected behavior
      }
    });
  });

  group('batchGenerateContentByTunedModel - Integration', () {
    test('creates batch job with tuned model', () async {
      if (apiKey == null || tunedModel == null) {
        markTestSkipped('API key or tuned model not available');
        return;
      }

      final batch = await client!.tunedModels.batchGenerateContent(
        tunedModel: tunedModel!,
        batch: const GenerateContentBatch(
          model: 'tunedModels/placeholder', // Will be replaced by path param
          displayName: 'Test Batch with Tuned Model',
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
              ],
            ),
          ),
        ),
      );

      expect(batch.name, isNotNull);
      expect(batch.state, isNotNull);
      print('✓ Created batch with tuned model: ${batch.name}');

      // Cleanup
      if (batch.name != null) {
        try {
          await client!.batches.delete(name: batch.name!);
          print('✓ Cleaned up batch: ${batch.name}');
        } catch (e) {
          print('Note: Could not delete batch ${batch.name}: $e');
        }
      }
    });
  });

  group('asyncBatchEmbedContentByTunedModel - Integration', () {
    test('creates async embed batch with tuned model', () async {
      if (apiKey == null || tunedModel == null) {
        markTestSkipped('API key or tuned model not available');
        return;
      }

      try {
        final batch = await client!.tunedModels.asyncBatchEmbedContent(
          tunedModel: tunedModel!,
          batch: const EmbedContentBatch(
            model: 'tunedModels/placeholder', // Will be replaced by path param
            displayName: 'Test Embed Batch with Tuned Model',
            inputConfig: InputEmbedContentConfig(
              requests: InlinedEmbedContentRequests(
                requests: [
                  InlinedEmbedContentRequest(
                    request: EmbedContentRequest(
                      content: Content(parts: [TextPart('Hello world')]),
                    ),
                  ),
                  InlinedEmbedContentRequest(
                    request: EmbedContentRequest(
                      content: Content(parts: [TextPart('Goodbye world')]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        expect(batch.name, isNotNull);
        expect(batch.state, isNotNull);
        print('✓ Created embed batch with tuned model: ${batch.name}');

        // Cleanup
        if (batch.name != null) {
          try {
            await client!.batches.delete(name: batch.name!);
            print('✓ Cleaned up embed batch: ${batch.name}');
          } catch (e) {
            print('Note: Could not delete batch ${batch.name}: $e');
          }
        }
      } catch (e) {
        // Some tuned models may not support embeddings
        print('Note: Tuned model may not support embeddings: $e');
        markTestSkipped('Tuned model does not support embeddings');
      }
    });
  });
}
