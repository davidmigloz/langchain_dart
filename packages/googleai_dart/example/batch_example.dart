// ignore_for_file: avoid_print, avoid_dynamic_calls

/// Demonstrates batch operations for processing multiple requests efficiently.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    print('=== Batch Operations Example ===\n');

    // 1. Create a batch for content generation
    print('1. Creating batch for content generation...');
    final generateBatch = await client.models.batchGenerateContent(
      model: 'gemini-2.0-flash-exp',
      batch: const GenerateContentBatch(
        displayName: 'Math Questions Batch',
        model: 'models/gemini-2.0-flash-exp',
        inputConfig: InputConfig(
          requests: InlinedRequests(
            requests: [
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(parts: [TextPart('What is 2 + 2?')], role: 'user'),
                  ],
                ),
                metadata: {'question_id': 'q1', 'difficulty': 'easy'},
              ),
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(parts: [TextPart('What is 15 * 7?')], role: 'user'),
                  ],
                ),
                metadata: {'question_id': 'q2', 'difficulty': 'medium'},
              ),
              InlinedRequest(
                request: GenerateContentRequest(
                  contents: [
                    Content(
                      parts: [
                        TextPart(
                          'Explain the Pythagorean theorem in simple terms.',
                        ),
                      ],
                      role: 'user',
                    ),
                  ],
                ),
                metadata: {'question_id': 'q3', 'difficulty': 'medium'},
              ),
            ],
          ),
        ),
      ),
    );
    print('   ✓ Created batch: ${generateBatch.name}');
    print('   Display name: ${generateBatch.displayName}');
    print('   State: ${generateBatch.state}');
    print('   Model: ${generateBatch.model}\n');

    // 2. List all batches
    print('2. Listing all batches...');
    final listResponse = await client.batches.list(pageSize: 10);
    print(
      '   ✓ Found ${listResponse.operations?.length ?? 0} batch operations',
    );
    for (final operation in listResponse.operations ?? []) {
      final status = operation.done == true ? 'Done' : 'In progress';
      print('     - ${operation.name}: $status');
    }
    if (listResponse.nextPageToken != null) {
      print('   More results available (nextPageToken present)');
    }
    print('');

    // 3. Get specific batch status
    print('3. Checking batch status...');
    final batchStatus = await client.batches.getGenerateContentBatch(
      name: generateBatch.name!,
    );
    print('   ✓ Batch: ${batchStatus.name}');
    print('   State: ${batchStatus.state}');
    print('   Created: ${batchStatus.createTime}');
    if (batchStatus.batchStats != null) {
      print('   Stats:');
      print('     - Total requests: ${batchStatus.batchStats!.requestCount}');
      print(
        '     - Successful: ${batchStatus.batchStats!.successfulRequestCount}',
      );
      print('     - Failed: ${batchStatus.batchStats!.failedRequestCount}');
      print('     - Pending: ${batchStatus.batchStats!.pendingRequestCount}');
    }
    print('');

    // 4. Update batch metadata
    print('4. Updating batch display name...');
    final updatedBatch = await client.batches.updateGenerateContentBatch(
      name: generateBatch.name!,
      batch: const GenerateContentBatch(
        displayName: 'Math Questions Batch v2',
        model: 'models/gemini-2.0-flash-exp',
        inputConfig: InputConfig(),
      ),
    );
    print('   ✓ Updated display name: ${updatedBatch.displayName}\n');

    // 5. Create an async batch for embeddings
    print('5. Creating async batch for embeddings...');
    final embedBatch = await client.models.asyncBatchEmbedContent(
      model: 'text-embedding-004',
      batch: const EmbedContentBatch(
        displayName: 'Product Descriptions Embeddings',
        model: 'models/text-embedding-004',
        inputConfig: InputEmbedContentConfig(
          requests: InlinedEmbedContentRequests(
            requests: [
              InlinedEmbedContentRequest(
                request: EmbedContentRequest(
                  content: Content(
                    parts: [
                      TextPart(
                        'High-quality wireless headphones with noise cancellation.',
                      ),
                    ],
                  ),
                  taskType: TaskType.retrievalDocument,
                ),
                metadata: {'product_id': 'prod1'},
              ),
              InlinedEmbedContentRequest(
                request: EmbedContentRequest(
                  content: Content(
                    parts: [
                      TextPart(
                        'Ergonomic office chair with lumbar support and adjustable height.',
                      ),
                    ],
                  ),
                  taskType: TaskType.retrievalDocument,
                ),
                metadata: {'product_id': 'prod2'},
              ),
              InlinedEmbedContentRequest(
                request: EmbedContentRequest(
                  content: Content(
                    parts: [
                      TextPart(
                        'Smart watch with heart rate monitor and GPS tracking.',
                      ),
                    ],
                  ),
                  taskType: TaskType.retrievalDocument,
                ),
                metadata: {'product_id': 'prod3'},
              ),
            ],
          ),
        ),
      ),
    );
    print('   ✓ Created async embedding batch: ${embedBatch.name}');
    print('   Display name: ${embedBatch.displayName}');
    print('   State: ${embedBatch.state}\n');

    // 6. Monitor batch processing (simplified - in production, use LROPoller)
    print('6. Monitoring batch progress...');
    print('   Note: Batch processing may take several minutes.');
    print(
      '   In production, use LROPoller to automatically poll for completion.\n',
    );

    // Simulate monitoring
    for (var i = 1; i <= 3; i++) {
      await Future<void>.delayed(const Duration(seconds: 2));
      final status = await client.batches.getGenerateContentBatch(
        name: generateBatch.name!,
      );
      print('   Check $i: State = ${status.state}');

      if (status.state == BatchState.succeeded) {
        print('   ✓ Batch completed successfully!');
        if (status.output != null) {
          print(
            '   Output file: ${status.output!.responsesFile ?? "Inline responses"}',
          );
        }
        break;
      } else if (status.state == BatchState.failed) {
        print('   ✗ Batch failed');
        break;
      }
    }
    print('');

    // 7. Cancel a batch (if still running)
    final currentStatus = await client.batches.getEmbedBatch(
      name: embedBatch.name!,
    );
    if (currentStatus.state == BatchState.running ||
        currentStatus.state == BatchState.pending) {
      print('7. Canceling embedding batch...');
      await client.batches.cancel(name: embedBatch.name!);
      final canceledBatch = await client.batches.getEmbedBatch(
        name: embedBatch.name!,
      );
      print('   ✓ Batch canceled: ${canceledBatch.state}\n');
    } else {
      print('7. Embedding batch already completed or failed');
      print('');
    }

    // 8. Clean up - Delete batches
    print('8. Cleaning up batches...');
    try {
      await client.batches.delete(name: generateBatch.name!);
      print('   ✓ Deleted generation batch');
    } catch (e) {
      print('   Note: Could not delete generation batch (may be processing)');
    }

    try {
      await client.batches.delete(name: embedBatch.name!);
      print('   ✓ Deleted embedding batch');
    } catch (e) {
      print('   Note: Could not delete embedding batch (may be processing)');
    }
    print('');

    print('=== Batch Operations Summary ===');
    print('✓ Batch operations allow processing multiple requests efficiently');
    print('✓ Supports both content generation and embeddings');
    print('✓ Includes state tracking and progress monitoring');
    print('✓ Metadata support for request identification');
    print('✓ Can be canceled while running');
    print('');
    print('Example completed successfully!');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
