// ignore_for_file: avoid_print, unused_local_variable, avoid_dynamic_calls
/// Demonstrates Retrieval Augmented Generation (RAG) with semantic search.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'),
    ),
  );

  try {
    print('=== RAG (Retrieval Augmented Generation) Example ===\n');

    // 1. Create a knowledge base (corpus)
    print('1. Creating knowledge base corpus...');
    final corpus = await client.corpora.create(
      corpus: const Corpus(
        displayName: 'Company Knowledge Base',
      ),
    );
    print('   ✓ Created corpus: ${corpus.name}\n');

    // 2. Create a document
    print('2. Creating document...');
    final document = await client.corpora
        .documents(corpus: corpus.name!)
        .create(
          document: const Document(
            displayName: 'Product Features',
            customMetadata: [
              CustomMetadata(key: 'category', stringValue: 'documentation'),
              CustomMetadata(key: 'year', numericValue: 2024.0),
            ],
          ),
        );
    print('   ✓ Created document: ${document.name}\n');

    // 3. Populate with knowledge chunks
    print('3. Populating knowledge base with content...');
    await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .batchCreate(
          request: BatchCreateChunksRequest(
            requests: [
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Our platform provides real-time analytics and reporting. '
                        'Users can create custom dashboards with drag-and-drop widgets.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'topic', stringValue: 'analytics'),
                    CustomMetadata(key: 'importance', numericValue: 9.0),
                  ],
                ),
              ),
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Security features include end-to-end encryption, '
                        'two-factor authentication, and role-based access control.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'topic', stringValue: 'security'),
                    CustomMetadata(key: 'importance', numericValue: 10.0),
                  ],
                ),
              ),
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Integration options include REST API, webhooks, '
                        'and native SDKs for Python, JavaScript, and Dart.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'topic', stringValue: 'integration'),
                    CustomMetadata(key: 'importance', numericValue: 8.0),
                  ],
                ),
              ),
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Performance optimization includes automatic caching, '
                        'CDN integration, and lazy loading for faster page loads.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'topic', stringValue: 'performance'),
                    CustomMetadata(key: 'importance', numericValue: 7.0),
                  ],
                ),
              ),
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Customer support is available 24/7 via chat, email, and phone. '
                        'Premium plans include dedicated account managers.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'topic', stringValue: 'support'),
                    CustomMetadata(key: 'importance', numericValue: 8.0),
                  ],
                ),
              ),
            ],
          ),
        );
    print('   ✓ Created 5 knowledge chunks\n');

    // Wait for chunks to be processed and indexed
    print('4. Waiting for indexing (3 seconds)...');
    await Future<void>.delayed(const Duration(seconds: 3));
    print('   ✓ Ready for queries\n');

    // 5. Perform semantic search query
    print('5. Querying knowledge base...');
    const userQuery = 'How secure is the platform?';
    print('   User question: "$userQuery"\n');

    final queryResponse = await client.corpora.query(
      name: corpus.name!,
      request: const QueryCorpusRequest(
        query: userQuery,
        resultsCount: 3,
      ),
    );

    print(
      '   Found ${queryResponse.relevantChunks?.length ?? 0} relevant chunks:',
    );
    for (final relevantChunk
        in queryResponse.relevantChunks ?? const <RelevantChunk>[]) {
      print(
        '   - Score: ${relevantChunk.chunkRelevanceScore?.toStringAsFixed(4) ?? 'N/A'}',
      );
      print('     Content: "${relevantChunk.chunk?.data.stringValue}"');
      final topic = relevantChunk.chunk?.customMetadata
          ?.firstWhere(
            (m) => m.key == 'topic',
            orElse: () => const CustomMetadata(key: ''),
          )
          .stringValue;
      if (topic != null) {
        print('     Topic: $topic');
      }
      print('');
    }

    // 6. Query with metadata filters
    print('6. Querying with metadata filters...');
    const filteredQuery = 'What integration options exist?';
    print('   Query: "$filteredQuery"');
    print('   Filter: importance >= 8.0\n');

    final filteredResponse = await client.corpora.query(
      name: corpus.name!,
      request: const QueryCorpusRequest(
        query: filteredQuery,
        resultsCount: 5,
        metadataFilters: [
          MetadataFilter(
            key: 'chunk.custom_metadata.importance',
            conditions: [
              Condition(
                operation: ConditionOperator.greaterEqual,
                numericValue: 8.0,
              ),
            ],
          ),
        ],
      ),
    );

    print(
      '   Found ${filteredResponse.relevantChunks?.length ?? 0} high-importance results:',
    );
    for (final relevantChunk
        in filteredResponse.relevantChunks ?? const <RelevantChunk>[]) {
      final importance = relevantChunk.chunk?.customMetadata
          ?.firstWhere(
            (m) => m.key == 'importance',
            orElse: () => const CustomMetadata(key: ''),
          )
          .numericValue;
      print(
        '   - Importance: $importance | Score: ${relevantChunk.chunkRelevanceScore?.toStringAsFixed(4)}',
      );
      print('     "${relevantChunk.chunk?.data.stringValue}"\n');
    }

    // 7. Query a specific document
    print('7. Querying specific document...');
    const docQuery = 'Tell me about analytics';
    print('   Query: "$docQuery"\n');

    final docResponse = await client.corpora
        .documents(corpus: corpus.name!)
        .query(
          name: document.name!,
          request: const QueryDocumentRequest(
            query: docQuery,
            resultsCount: 2,
          ),
        );

    print(
      '   Document-specific results (${docResponse.relevantChunks?.length ?? 0}):',
    );
    for (final relevantChunk in docResponse.relevantChunks ?? []) {
      print('   - "${relevantChunk.chunk?.data.stringValue}"');
      print(
        '     Score: ${relevantChunk.chunkRelevanceScore?.toStringAsFixed(4)}\n',
      );
    }

    // 8. Use retrieved context with generation (RAG pattern)
    print('8. RAG Pattern - Generating answer with retrieved context...');
    if (queryResponse.relevantChunks != null &&
        queryResponse.relevantChunks!.isNotEmpty) {
      // Build context from retrieved chunks
      final contextChunks = queryResponse.relevantChunks!
          .take(2)
          .map((rc) => rc.chunk?.data.stringValue ?? '')
          .join('\n\n');

      final augmentedPrompt =
          '''
Context from knowledge base:
$contextChunks

User question: $userQuery

Please answer the user's question based on the context provided above.
''';

      print(
        '   Augmented prompt created with ${queryResponse.relevantChunks!.take(2).length} context chunks',
      );
      print(
        '   (In production, send this to generateContent for final answer)\n',
      );
    }

    // 9. Clean up
    print('9. Cleaning up resources...');
    await client.corpora.delete(name: corpus.name!);
    print('   ✓ Deleted corpus and all contents\n');

    print('RAG Example completed successfully!');
    print('\nKey Takeaways:');
    print('• Corpora store domain-specific knowledge');
    print('• Chunks are automatically embedded for semantic search');
    print('• Query returns relevance scores for ranking');
    print('• Metadata filters enable targeted retrieval');
    print('• Retrieved context enhances generation quality (RAG)');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
