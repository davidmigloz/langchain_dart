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
    print('🔍 Listing available models...\n');

    // List all available models
    final response = await client.models.list(pageSize: 5);

    print('Found ${response.models.length} models:\n');

    for (final model in response.models) {
      print('📦 ${model.displayName}');
      print('   Name: ${model.name}');
      print('   Input token limit: ${model.inputTokenLimit}');
      print('   Output token limit: ${model.outputTokenLimit}');
      print('   Supported methods: ${model.supportedGenerationMethods}');
      print('');
    }

    if (response.nextPageToken != null) {
      print('💡 More models available. Use pageToken to fetch next page.\n');
    }

    // Get details for a specific model
    if (response.models.isNotEmpty) {
      final modelName = response.models.first.name;
      print('📖 Getting details for $modelName...\n');

      final model = await client.models.get(model: modelName);

      print('Model Details:');
      print('   Display Name: ${model.displayName}');
      print('   Description: ${model.description}');
      print('   Version: ${model.version}');
      print('   Temperature: ${model.temperature}');
      print('   Top-P: ${model.topP}');
      print('   Top-K: ${model.topK}');
    }
  } catch (e) {
    print('❌ Error: $e');
  } finally {
    client.close();
  }
}
