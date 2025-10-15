// ignore_for_file: avoid_print

import 'package:googleai_dart/googleai_dart.dart';

void main() async {
  final client = GoogleAIClient(
    config: const GoogleAIConfig(
      authProvider: ApiKeyProvider(
        'YOUR_API_KEY',
      ), // Replace with your actual API key
    ),
  );

  try {
    print('📚 Demonstrating pagination helper...\n');

    // Create a paginator for models
    final paginator = Paginator<Model>(
      fetcher: (pageToken) async {
        final response = await client.models.list(
          pageSize: 2, // Small page size for demonstration
          pageToken: pageToken,
        );
        return PaginatedResponse(
          items: response.models,
          nextPageToken: response.nextPageToken,
        );
      },
    );

    print('🔄 Fetching all models using paginator...\n');

    var count = 0;

    // Iterate through all items across all pages automatically
    await for (final model in paginator.items()) {
      count++;
      print('$count. ${model.displayName} (${model.name})');

      // Limit to first 10 for demo purposes
      if (count >= 10) {
        print('\n... (stopping at 10 items for demo)');
        break;
      }
    }

    print('\n✅ Pagination complete! Fetched $count models.');
  } catch (e) {
    print('❌ Error: $e');
  } finally {
    client.close();
  }
}
