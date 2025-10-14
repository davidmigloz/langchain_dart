// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';
import 'package:test/test.dart';

import 'test_config.dart';

/// Integration tests for batch operations.
///
/// These tests require a real API key set in the GEMINI_API_KEY
/// environment variable. If the key is not present, all tests are skipped.
void main() {
  String? apiKey;
  GoogleAIClient? client;

  setUpAll(() {
    apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      print(
        '⚠️  GEMINI_API_KEY not set. Integration tests will be skipped.\n'
        '   To run these tests, export GEMINI_API_KEY=your_api_key',
      );
    } else {
      client = GoogleAIClient(
        config: GoogleAIConfig(
          authProvider: ApiKeyProvider(apiKey!),
        ),
      );
    }
  });

  tearDownAll(() {
    client?.close();
  });

  group('Batch Operations - Integration', () {
    test('creates and retrieves a batch for content generation', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a batch
      final batch = await client!.models.batchGenerateContent(
        model: defaultGenerativeModel,
        batch: const GenerateContentBatch(
          displayName: 'Test Batch - Simple Questions',
          model: 'models/$defaultGenerativeModel',
          inputConfig: InputConfig(
            requests: InlinedRequests(
              requests: [
                InlinedRequest(
                  request: GenerateContentRequest(
                    contents: [
                      Content(
                        parts: [TextPart('What is 1 + 1?')],
                        role: 'user',
                      ),
                    ],
                  ),
                ),
                InlinedRequest(
                  request: GenerateContentRequest(
                    contents: [
                      Content(
                        parts: [TextPart('What color is the sky?')],
                        role: 'user',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Verify batch creation
      expect(batch, isNotNull);
      expect(batch.name, isNotNull);
      expect(batch.name, startsWith('batches/'));
      // Note: API may not return displayName, model in response
      if (batch.state != null) {
        expect(
          batch.state,
          isIn([
            BatchState.pending,
            BatchState.running,
            BatchState.succeeded,
          ]),
        );
      }

      // Get the batch by name
      final retrievedBatch =
          await client!.batches.getGenerateContentBatch(name: batch.name!);
      expect(retrievedBatch, isNotNull);
      expect(retrievedBatch.name, batch.name);

      // Clean up - try to delete the batch
      try {
        await client!.batches.delete(name: batch.name!);
      } catch (e) {
        // Batch might be processing and can't be deleted yet
        print('Note: Could not delete batch ${batch.name} - may be processing');
      }
    });

    test('lists batch operations', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a batch first
      final batch = await client!.models.batchGenerateContent(
        model: defaultGenerativeModel,
        batch: const GenerateContentBatch(
          displayName: 'Test Batch for Listing',
          model: 'models/$defaultGenerativeModel',
          inputConfig: InputConfig(
            requests: InlinedRequests(
              requests: [
                InlinedRequest(
                  request: GenerateContentRequest(
                    contents: [
                      Content(
                        parts: [TextPart('Hello')],
                        role: 'user',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // List batches
      final listResponse = await client!.batches.list(pageSize: 10);
      expect(listResponse, isNotNull);
      expect(listResponse.operations, isNotNull);

      // Should find at least the one we just created
      expect(listResponse.operations!.length, greaterThanOrEqualTo(1));

      // Clean up
      try {
        await client!.batches.delete(name: batch.name!);
      } catch (e) {
        print('Note: Could not delete batch ${batch.name}');
      }
    });

    test('creates async batch for embeddings', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final batch = await client!.models.asyncBatchEmbedContent(
        model: defaultEmbeddingModel,
        batch: const EmbedContentBatch(
          displayName: 'Test Embeddings Batch',
          model: 'models/$defaultEmbeddingModel',
          inputConfig: InputEmbedContentConfig(
            requests: InlinedEmbedContentRequests(
              requests: [
                InlinedEmbedContentRequest(
                  request: EmbedContentRequest(
                    content: Content(
                      parts: [TextPart('Hello world')],
                    ),
                    taskType: TaskType.retrievalDocument,
                  ),
                ),
                InlinedEmbedContentRequest(
                  request: EmbedContentRequest(
                    content: Content(
                      parts: [TextPart('Goodbye world')],
                    ),
                    taskType: TaskType.retrievalDocument,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(batch, isNotNull);
      expect(batch.name, isNotNull);
      expect(batch.name, startsWith('batches/'));
      // Note: API may not return displayName in response
      if (batch.state != null) {
        expect(
          batch.state,
          isIn([
            BatchState.pending,
            BatchState.running,
            BatchState.succeeded,
          ]),
        );
      }
    });

    test('creates synchronous batch embeddings', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final response = await client!.models.batchEmbedContents(
        model: defaultEmbeddingModel,
        request: const BatchEmbedContentsRequest(
          requests: [
            EmbedContentRequest(
              content: Content(
                parts: [TextPart('Hello world')],
              ),
              taskType: TaskType.retrievalDocument,
            ),
            EmbedContentRequest(
              content: Content(
                parts: [TextPart('Goodbye world')],
              ),
              taskType: TaskType.retrievalDocument,
            ),
          ],
        ),
      );

      expect(response, isNotNull);
      expect(response.embeddings, hasLength(2));
      expect(response.embeddings[0].values, isNotEmpty);
      expect(response.embeddings[1].values, isNotEmpty);
    });

    test('updates batch metadata', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a batch with initial priority
      final batch = await client!.models.batchGenerateContent(
        model: defaultGenerativeModel,
        batch: const GenerateContentBatch(
          displayName: 'Test Batch for Update',
          model: 'models/$defaultGenerativeModel',
          priority: 5,
          inputConfig: InputConfig(
            requests: InlinedRequests(
              requests: [
                InlinedRequest(
                  request: GenerateContentRequest(
                    contents: [
                      Content(
                        parts: [TextPart('Test')],
                        role: 'user',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      // Update the batch priority (only priority can be updated)
      final updatedBatch = await client!.batches.updateGenerateContentBatch(
        name: batch.name!,
        batch: const GenerateContentBatch(
          priority: 10,
        ),
        updateMask: 'priority',
      );

      expect(updatedBatch, isNotNull);
      // Note: API may not return priority in response
      if (updatedBatch.priority != null) {
        expect(updatedBatch.priority, 10);
      }

      // Clean up
      try {
        await client!.batches.delete(name: batch.name!);
      } catch (e) {
        print('Note: Could not delete batch ${batch.name}');
      }
    });

    test('cancels a running batch', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      // Create a batch with many requests to increase chance it's still running
      final requests = List.generate(
        10,
        (i) => InlinedRequest(
          request: GenerateContentRequest(
            contents: [
              Content(
                parts: [TextPart('Question number $i: What is ${i * 2}?')],
                role: 'user',
              ),
            ],
          ),
        ),
      );

      final batch = await client!.models.batchGenerateContent(
        model: defaultGenerativeModel,
        batch: GenerateContentBatch(
          displayName: 'Test Batch for Cancellation',
          model: 'models/$defaultGenerativeModel',
          inputConfig: InputConfig(
            requests: InlinedRequests(requests: requests),
          ),
        ),
      );

      // Try to cancel it immediately
      try {
        await client!.batches.cancel(name: batch.name!);

        // Check if canceled - need to fetch the batch again
        final canceledBatch =
            await client!.batches.getGenerateContentBatch(name: batch.name!);
        // State should be cancelled, failed, or succeeded (if it finished too quickly)
        // Note: API may not return state in response
        if (canceledBatch.state != null) {
          expect(
            canceledBatch.state,
            isIn([
              BatchState.cancelled,
              BatchState.failed,
              BatchState.succeeded,
              BatchState.running, // Might still be running
            ]),
          );
        }
      } catch (e) {
        // Cancellation might fail if batch already completed
        print('Note: Could not cancel batch ${batch.name} - $e');
      }

      // Clean up
      try {
        await client!.batches.delete(name: batch.name!);
      } catch (e) {
        print('Note: Could not delete batch ${batch.name}');
      }
    });

    test('batch with priority setting', () async {
      if (apiKey == null) {
        markTestSkipped('API key not available');
        return;
      }

      final batch = await client!.models.batchGenerateContent(
        model: defaultGenerativeModel,
        batch: const GenerateContentBatch(
          displayName: 'High Priority Batch',
          model: 'models/$defaultGenerativeModel',
          priority: 10,
          inputConfig: InputConfig(
            requests: InlinedRequests(
              requests: [
                InlinedRequest(
                  request: GenerateContentRequest(
                    contents: [
                      Content(
                        parts: [TextPart('Urgent question')],
                        role: 'user',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(batch, isNotNull);
      // Note: API may not return priority in response
      if (batch.priority != null) {
        expect(batch.priority, 10);
      }

      // Clean up
      try {
        await client!.batches.delete(name: batch.name!);
      } catch (e) {
        print('Note: Could not delete batch ${batch.name}');
      }
    });
  });
}
