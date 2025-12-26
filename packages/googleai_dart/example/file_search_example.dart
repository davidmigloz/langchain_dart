// ignore_for_file: avoid_print, avoid_dynamic_calls
/// Demonstrates File Search with FileSearchStores for semantic retrieval.
///
/// FileSearchStores enable you to upload documents and perform semantic
/// search over them during generation (RAG - Retrieval Augmented Generation).
///
/// Key features:
/// - Create and manage file search stores
/// - Upload files with custom chunking configuration
/// - Add custom metadata for filtering
/// - Use File Search in generation requests
/// - Access grounding metadata with citations
///
/// Note: FileSearchStores API is only available with Google AI (not Vertex AI).
///
/// See: https://ai.google.dev/gemini-api/docs/file-search
library;

import 'dart:io' as io;

import 'package:googleai_dart/googleai_dart.dart';

Future<void> main() async {
  final apiKey = io.Platform.environment['GOOGLEAI_API_KEY'];
  if (apiKey == null) {
    io.stderr.writeln('No GOOGLEAI_API_KEY environment variable');
    io.exit(1);
  }

  final client = GoogleAIClient(
    config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
  );

  try {
    print('=== Example 1: FileSearchStore Management ===\n');
    await fileSearchStoreManagement(client);

    print('\n=== Example 2: Using FileSearch with generateContent ===\n');
    await fileSearchWithGenerateContent(client);

    print('\n=== Example 3: Using FileSearchTool with Interactions API ===\n');
    await fileSearchWithInteractions(client);
  } finally {
    client.close();
  }
}

/// Demonstrates FileSearchStore creation and management.
Future<void> fileSearchStoreManagement(GoogleAIClient client) async {
  // Create a new FileSearchStore
  print('Creating FileSearchStore...');
  final store = await client.fileSearchStores.create(
    displayName: 'Example Knowledge Base',
  );
  print('Created store: ${store.name}');
  print('Display name: ${store.displayName}');

  try {
    // Upload a file with custom chunking and metadata
    print('\nUploading file with custom configuration...');

    // For this example, we'll create a sample text file
    final sampleFile = io.File('/tmp/sample_doc.txt');
    await sampleFile.writeAsString('''
# Introduction to Dart

Dart is a client-optimized language for fast apps on any platform.
It is developed by Google and is used to build mobile, desktop,
server, and web applications.

## Key Features

1. Optimized for UI: Dart is designed for building user interfaces
   with features like hot reload for instant updates.

2. Productive development: Dart offers sound null safety,
   async-await for asynchronous code, and a rich standard library.

3. Fast on all platforms: Dart compiles to ARM and x64 machine code
   for mobile, desktop, and backend. Or compile to JavaScript for web.

## Getting Started

To get started with Dart, install the Dart SDK from dart.dev.
''');

    final uploadResponse = await client.fileSearchStores.upload(
      parent: store.name!,
      filePath: sampleFile.path,
      mimeType: 'text/plain',
      request: const UploadToFileSearchStoreRequest(
        displayName: 'Dart Introduction',
        // Configure chunking for better retrieval
        chunkingConfig: ChunkingConfig(
          whiteSpaceConfig: WhiteSpaceConfig(
            maxTokensPerChunk: 200,
            maxOverlapTokens: 20,
          ),
        ),
        // Add custom metadata for filtering
        customMetadata: [
          FileSearchCustomMetadata(key: 'category', stringValue: 'programming'),
          FileSearchCustomMetadata(key: 'language', stringValue: 'dart'),
          FileSearchCustomMetadata(key: 'year', numericValue: 2024),
        ],
      ),
    );
    print('Uploaded document: ${uploadResponse.documentName}');

    // List documents in the store
    print('\nListing documents...');
    final docs = await client.fileSearchStores.listDocuments(
      parent: store.name!,
    );
    for (final doc in docs.documents ?? []) {
      print('  - ${doc.displayName} (${doc.name})');
    }

    // Use the store for generation
    print('\nQuerying the knowledge base...');
    final response = await client.models.generateContent(
      model: 'gemini-3-flash-preview',
      request: GenerateContentRequest(
        contents: const [
          Content(
            parts: [TextPart('What are the key features of Dart?')],
            role: 'user',
          ),
        ],
        tools: [
          Tool(
            fileSearch: FileSearch(
              fileSearchStoreNames: [store.name!],
              topK: 5,
            ),
          ),
        ],
      ),
    );

    print('Response: ${_extractText(response)}');

    // Access grounding metadata (citations)
    final metadata = response.candidates?.first.groundingMetadata;
    if (metadata?.groundingChunks != null) {
      print('\nSources:');
      for (final chunk in metadata!.groundingChunks!) {
        if (chunk.retrievedContext != null) {
          print('  - ${chunk.retrievedContext!.title}');
          if (chunk.retrievedContext!.uri != null) {
            print('    URI: ${chunk.retrievedContext!.uri}');
          }
        }
      }
    }
  } finally {
    // Clean up: delete the store
    print('\nCleaning up...');
    await client.fileSearchStores.delete(name: store.name!);
    print('Deleted store: ${store.name}');
  }
}

/// Using FileSearch with generateContent and metadata filtering.
Future<void> fileSearchWithGenerateContent(GoogleAIClient client) async {
  // This example shows the API structure for filtering by metadata
  // In a real scenario, you would use an existing store with documents

  print('FileSearch with metadata filter example:');
  print(r'''
// Filter documents by metadata
final response = await client.models.generateContent(
  model: 'gemini-3-flash-preview',
  request: GenerateContentRequest(
    contents: [...],
    tools: [
      Tool(
        fileSearch: FileSearch(
          fileSearchStoreNames: ['fileSearchStores/your-store-id'],
          topK: 5,
          // Filter to only search documents by a specific author
          metadataFilter: 'author = "Jane Doe"',
        ),
      ),
    ],
  ),
);

// Other filter examples:
// - metadataFilter: 'year > 2020'
// - metadataFilter: 'category = "technical"'
// - metadataFilter: 'author = "John" AND year >= 2023'
''');
}

/// Using FileSearchTool with the Interactions API.
Future<void> fileSearchWithInteractions(GoogleAIClient client) async {
  print('FileSearchTool with Interactions API example:');
  print(r'''
// Stream responses with file search
await for (final event in client.interactions.createStream(
  model: 'gemini-3-flash-preview',
  input: 'Summarize the key points from my documents',
  tools: [
    FileSearchTool(
      fileSearchStoreNames: ['fileSearchStores/your-store-id'],
      topK: 5,
    ),
  ],
)) {
  switch (event) {
    case ContentDeltaEvent():
      final delta = event.delta;
      if (delta is TextDelta) {
        print(delta.text);
      } else if (delta is FileSearchResultDelta) {
        // File search results received
        print('Retrieved ${delta.results?.length} document chunks');
      }
    default:
      break;
  }
}
''');
}

/// Helper to extract text from a GenerateContentResponse.
String _extractText(GenerateContentResponse response) {
  final buffer = StringBuffer();
  for (final candidate in response.candidates ?? []) {
    for (final part in candidate.content?.parts ?? []) {
      if (part is TextPart) {
        buffer.write(part.text);
      }
    }
  }
  return buffer.toString();
}
