// ignore_for_file: avoid_print, avoid_dynamic_calls
/// Demonstrates corpus and document management.
library;

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(authProvider: ApiKeyProvider('YOUR_API_KEY')),
  );

  try {
    print('=== Corpus Management Example ===\n');

    // 1. Create a corpus
    print('1. Creating a corpus...');
    final corpus = await client.corpora.create(
      corpus: const Corpus(displayName: 'Product Documentation'),
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

    // 3. Get corpus details
    print('3. Getting corpus details...');
    final corpusDetails = await client.corpora.get(name: corpus.name!);
    print('   ✓ Retrieved: ${corpusDetails.displayName}');
    print('   Created: ${corpusDetails.createTime}\n');

    // 4. Create a document in the corpus
    print('4. Creating a document...');
    final document = await client.corpora
        .documents(corpus: corpus.name!)
        .create(document: const Document(displayName: 'Getting Started Guide'));
    print('   ✓ Created document: ${document.name}');
    print('   Display name: ${document.displayName}\n');

    // 5. List documents in corpus
    print('5. Listing documents in corpus...');
    final docsResponse = await client.corpora
        .documents(corpus: corpus.name!)
        .list(pageSize: 10);
    print('   ✓ Found ${docsResponse.documents?.length ?? 0} documents\n');

    // 6. Update document
    print('6. Updating document...');
    final updatedDocument = await client.corpora
        .documents(corpus: corpus.name!)
        .update(
          name: document.name!,
          document: const Document(displayName: 'Getting Started Guide v2'),
          updateMask: 'displayName',
        );
    print('   ✓ Updated document: ${updatedDocument.displayName}\n');

    // 7. Clean up - Delete resources
    print('7. Cleaning up resources...');
    await client.corpora
        .documents(corpus: corpus.name!)
        .delete(name: document.name!);
    print('   ✓ Deleted document');

    await client.corpora.delete(name: corpus.name!);
    print('   ✓ Deleted corpus\n');

    print('Example completed successfully!');
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
  }
}
