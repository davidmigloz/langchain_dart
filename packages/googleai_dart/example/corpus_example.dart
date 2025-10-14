// ignore_for_file: avoid_print, avoid_dynamic_calls
/// Demonstrates corpus, document, and chunk management.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider('YOUR_API_KEY'),
    ),
  );

  try {
    print('=== Corpus Management Example ===\n');

    // 1. Create a corpus
    print('1. Creating a corpus...');
    final corpus = await client.corpora.create(
      corpus: const Corpus(
        displayName: 'Product Documentation',
      ),
    );
    print('   ✓ Created corpus: ${corpus.name}');
    print('   Display name: ${corpus.displayName}\n');

    // 2. List corpora
    print('2. Listing corpora...');
    final listResponse = await client.corpora.list(pageSize: 10);
    print('   ✓ Found ${listResponse.corpora?.length ?? 0} corpora');
    if (listResponse.nextPageToken != null) {
      print('   More results available (nextPageToken present)\n');
    }

    // 3. Update corpus
    print('3. Updating corpus display name...');
    final updatedCorpus = await client.corpora.update(
      name: corpus.name!,
      corpus: const Corpus(
        displayName: 'Product Documentation v2',
      ),
      updateMask: 'displayName',
    );
    print('   ✓ Updated display name: ${updatedCorpus.displayName}\n');

    // 4. Create a document in the corpus
    print('4. Creating a document...');
    final document =
        await client.corpora.documents(corpus: corpus.name!).create(
              document: const Document(
                displayName: 'Getting Started Guide',
                customMetadata: [
                  CustomMetadata(key: 'category', stringValue: 'tutorial'),
                  CustomMetadata(key: 'version', numericValue: 1.0),
                ],
              ),
            );
    print('   ✓ Created document: ${document.name}');
    print('   Display name: ${document.displayName}');
    print('   Metadata: ${document.customMetadata?.length ?? 0} entries\n');

    // 5. List documents in corpus
    print('5. Listing documents in corpus...');
    final docsResponse =
        await client.corpora.documents(corpus: corpus.name!).list(
              pageSize: 10,
            );
    print('   ✓ Found ${docsResponse.documents?.length ?? 0} documents\n');

    // 6. Update document metadata
    print('6. Updating document...');
    final updatedDocument =
        await client.corpora.documents(corpus: corpus.name!).update(
              name: document.name!,
              document: const Document(
                displayName: 'Getting Started Guide v2',
                customMetadata: [
                  CustomMetadata(key: 'version', numericValue: 2.0),
                  CustomMetadata(key: 'status', stringValue: 'reviewed'),
                ],
              ),
              updateMask: 'displayName,customMetadata',
            );
    print('   ✓ Updated document: ${updatedDocument.displayName}');
    final version = updatedDocument.customMetadata
        ?.firstWhere((m) => m.key == 'version')
        .numericValue;
    print('   Version: $version\n');

    // 7. Create chunks in the document
    print('7. Creating chunks...');
    final chunk1 = await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .create(
          chunk: const Chunk(
            data: ChunkData(
              stringValue:
                  'Welcome to our product! This guide will help you get started in just a few minutes.',
            ),
            customMetadata: [
              CustomMetadata(key: 'section', stringValue: 'introduction'),
              CustomMetadata(key: 'page', numericValue: 1.0),
            ],
          ),
        );
    print('   ✓ Created chunk 1: ${chunk1.name}');

    final chunk2 = await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .create(
          chunk: const Chunk(
            data: ChunkData(
              stringValue:
                  'Installation is simple. Download the package and run the installer. The process takes about 2 minutes.',
            ),
            customMetadata: [
              CustomMetadata(key: 'section', stringValue: 'installation'),
              CustomMetadata(key: 'page', numericValue: 2.0),
            ],
          ),
        );
    print('   ✓ Created chunk 2: ${chunk2.name}\n');

    // 8. Batch create chunks
    print('8. Batch creating multiple chunks...');
    final batchResponse = await client.corpora
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
                        'Configuration is done through a simple YAML file. All options are well documented.',
                  ),
                  customMetadata: [
                    CustomMetadata(
                      key: 'section',
                      stringValue: 'configuration',
                    ),
                  ],
                ),
              ),
              CreateChunkRequest(
                parent: document.name!,
                chunk: const Chunk(
                  data: ChunkData(
                    stringValue:
                        'Advanced features include custom plugins, theming, and API integrations.',
                  ),
                  customMetadata: [
                    CustomMetadata(key: 'section', stringValue: 'advanced'),
                  ],
                ),
              ),
            ],
          ),
        );
    print('   ✓ Batch created ${batchResponse.chunks?.length ?? 0} chunks\n');

    // 9. List chunks in document
    print('9. Listing chunks in document...');
    final chunksResponse = await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .list(
          pageSize: 10,
        );
    print('   ✓ Found ${chunksResponse.chunks?.length ?? 0} chunks');
    for (final chunk in chunksResponse.chunks ?? []) {
      print(
        '     - ${chunk.name}: "${chunk.data.stringValue?.substring(0, 50)}..."',
      );
    }
    print('');

    // 10. Retrieve a specific chunk
    print('10. Retrieving specific chunk...');
    final retrievedChunk = await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .get(name: chunk1.name!);
    print('   ✓ Retrieved: ${retrievedChunk.name}');
    print('   Content: ${retrievedChunk.data.stringValue}\n');

    // 11. Update a chunk
    print('11. Updating chunk metadata...');
    final updatedChunk = await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .update(
          name: chunk1.name!,
          chunk: Chunk(
            data: chunk1.data,
            customMetadata: const [
              CustomMetadata(key: 'section', stringValue: 'introduction'),
              CustomMetadata(key: 'page', numericValue: 1.0),
              CustomMetadata(key: 'reviewed', stringValue: 'yes'),
            ],
          ),
        );
    print(
      '   ✓ Updated chunk metadata (${updatedChunk.customMetadata?.length ?? 0} entries)\n',
    );

    // 12. Clean up - Delete resources
    print('12. Cleaning up resources...');
    await client.corpora
        .documents(corpus: corpus.name!)
        .chunks(document: document.name!)
        .delete(name: chunk1.name!);
    print('   ✓ Deleted chunk 1');

    await client.corpora
        .documents(corpus: corpus.name!)
        .delete(name: document.name!);
    print('   ✓ Deleted document (cascades to remaining chunks)');

    await client.corpora.delete(name: corpus.name!);
    print('   ✓ Deleted corpus (cascades to all contents)\n');

    print('Example completed successfully!');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
