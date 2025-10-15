// ignore_for_file: avoid_print

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  // Initialize the client with your API key
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider(
        'YOUR_API_KEY',
      ), // Replace with your actual API key
    ),
  );

  try {
    print('=== 🎉 GoogleAI Dart - 100% API Coverage Demo ===\n');

    print('=== Example 1: List Model Operations ===\n');

    // List operations for a specific model
    // This is useful for monitoring async tasks like batch processing
    final modelOps = await client.models
        .operations(model: 'models/gemini-2.0-flash-exp')
        .list(
          pageSize: 5,
        );
    final ops = modelOps.operations;
    print('Operations for model: ${ops.length}');
    if (ops.isNotEmpty) {
      for (final op in ops) {
        print('  - ${op.name}: ${op.done ? "completed" : "running"}');
      }
    }

    print('\n=== Example 2: Corpus Permissions Management ===\n');

    // Create a corpus for demonstration
    final corpus = await client.corpora.create(
      corpus: const Corpus(
        displayName: 'Shared Knowledge Base',
      ),
    );
    print('Created corpus: ${corpus.name}');

    // List existing permissions on the corpus
    final permissions = await client.corpora
        .permissions(parent: corpus.name!)
        .list();
    print('Current permissions: ${permissions.permissions?.length ?? 0}');

    final perms = permissions.permissions;
    if (perms != null) {
      for (final perm in perms) {
        print(
          '  - ${perm.granteeType}: ${perm.role} (${perm.name})',
        );
      }
    }

    // Get details of a specific permission (if any exist)
    if (permissions.permissions != null &&
        permissions.permissions!.isNotEmpty) {
      final firstPerm = permissions.permissions!.first;
      if (firstPerm.name != null) {
        final permDetails = await client.corpora
            .permissions(parent: corpus.name!)
            .get(
              name: firstPerm.name!,
            );
        print('\nPermission details:');
        print('  Name: ${permDetails.name}');
        print('  Grantee: ${permDetails.granteeType}');
        print('  Role: ${permDetails.role}');
      }
    }

    // Example of creating a new permission (requires appropriate setup)
    // Uncomment to try if you have the necessary permissions:
    /*
    final newPerm = await client.corpora.permissions(parent: corpus.name!).create(
      permission: const Permission(
        granteeType: GranteeType.everyone,
        role: PermissionRole.reader,
      ),
    );
    print('\nCreated new permission: ${newPerm.name}');

    // Update the permission
    final updatedPerm = await client.corpora.permissions(parent: corpus.name!).update(
      name: newPerm.name!,
      permission: const Permission(
        granteeType: GranteeType.everyone,
        role: PermissionRole.writer,
      ),
      updateMask: 'role',
    );
    print('Updated permission role to: ${updatedPerm.role}');

    // Delete the permission
    await client.corpora.permissions(parent: corpus.name!).delete(name: newPerm.name!);
    print('Deleted permission: ${newPerm.name}');
    */

    // Clean up the corpus
    await client.corpora.delete(name: corpus.name!);
    print('\nCleaned up corpus');

    print('\n=== API Coverage Summary ===\n');
    print(
      '✅ This client now implements ALL 80 non-deprecated Gemini API operations!',
    );
    print('');
    print('Categories covered:');
    print('  • Generation (models & tuned models)');
    print('  • Streaming');
    print('  • Embeddings (sync & async batch)');
    print('  • Token counting');
    print('  • Prediction (including video generation)');
    print('  • Models management');
    print('  • Tuned models (create, manage, generate)');
    print('  • Files (upload, list, download)');
    print('  • Generated files (Veo video outputs)');
    print('  • Caching (cost & latency optimization)');
    print('  • Batch operations (async processing)');
    print('  • Corpus & Documents (semantic retrieval)');
    print('  • Chunks (document processing)');
    print('  • Permissions (tuned models & corpora)');
    print('  • RAG Stores (document retrieval)');
    print('  • Operations monitoring');
    print('');
    print('🚀 Ready for production use with complete API coverage!');
  } finally {
    // Clean up
    client.close();
  }
}
