// ignore_for_file: avoid_print

import 'dart:io';
import 'package:googleai_dart/googleai_dart.dart';

/// Example demonstrating the Context Caching API.
///
/// Context caching allows you to save frequently used content (like system
/// instructions or large context) and reuse it across multiple requests,
/// reducing latency and costs.
///
/// Before running, set your API key:
/// export GEMINI_API_KEY=your_api_key_here
Future<void> main() async {
  final apiKey = Platform.environment['GEMINI_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln(
      'Error: GEMINI_API_KEY environment variable not set.\n'
      'Please export your API key: export GEMINI_API_KEY=your_api_key',
    );
    exit(1);
  }

  final client = GoogleAIClient(
    config: GoogleAIConfig(authProvider: ApiKeyProvider(apiKey)),
  );

  try {
    await demonstrateCaching(client);
  } finally {
    client.close();
  }
}

Future<void> demonstrateCaching(GoogleAIClient client) async {
  print('=== Context Caching Example ===\n');

  // 1. Create cached content with system instructions
  print('1. Creating cached content with system instructions...');
  final cachedContent = await client.cachedContents.create(
    cachedContent: const CachedContent(
      model: 'models/gemini-3-flash-preview',
      displayName: 'Math Expert Cache',
      systemInstruction: Content(
        parts: [
          TextPart(
            'You are an expert mathematician and educator. '
            'When answering questions:\n'
            '1. Provide step-by-step explanations\n'
            '2. Use clear mathematical notation\n'
            '3. Include examples when helpful\n'
            '4. Explain the reasoning behind each step',
          ),
        ],
      ),
      ttl: '3600s', // Cache for 1 hour
    ),
  );

  print('✓ Cached content created:');
  print('  Name: ${cachedContent.name}');
  print('  Model: ${cachedContent.model}');
  print('  Expires: ${cachedContent.expireTime}');
  if (cachedContent.usageMetadata != null) {
    print('  Cached tokens: ${cachedContent.usageMetadata!.totalTokenCount}');
  }
  print('');

  // 2. Use cached content in a request
  print('2. Using cached content in generation...');
  final response = await client.models.generateContent(
    model: 'gemini-3-flash-preview',
    request: GenerateContentRequest(
      cachedContent: cachedContent.name,
      contents: [
        Content.text('Explain the Pythagorean theorem and provide an example.'),
      ],
    ),
  );

  print('✓ Generated response:');
  final text = response.text;
  if (text != null) {
    print('  ${text.substring(0, text.length > 200 ? 200 : text.length)}...');
  }
  if (response.usageMetadata != null) {
    print('  Input tokens: ${response.usageMetadata!.promptTokenCount}');
    print(
      '  Cached tokens: ${response.usageMetadata!.cachedContentTokenCount}',
    );
    print('  Output tokens: ${response.usageMetadata!.candidatesTokenCount}');
  }
  print('');

  // 3. List cached contents
  print('3. Listing cached contents...');
  final listResponse = await client.cachedContents.list(pageSize: 5);
  final cacheCount = listResponse.cachedContents.length;
  print('✓ Found $cacheCount cached contents:');
  for (final cache in listResponse.cachedContents) {
    print('  - ${cache.displayName ?? cache.name}');
  }
  print('');

  // 4. Update TTL
  print('4. Updating cache TTL...');
  final updated = await client.cachedContents.update(
    name: cachedContent.name!,
    cachedContent: const CachedContent(
      model: 'models/gemini-3-flash-preview',
      ttl: '7200s', // Extend to 2 hours
    ),
    updateMask: 'ttl',
  );
  print('✓ Cache TTL updated:');
  print('  New expiration: ${updated.expireTime}');
  print('');

  // Alternative: You can also set an absolute expiration time
  // final absoluteExpiry = DateTime.now().add(Duration(hours: 3));
  // final updatedWithExpireTime = await client.cachedContents.update(
  //   name: cachedContent.name!,
  //   cachedContent: CachedContent(
  //     model: 'models/gemini-3-flash-preview',
  //     expireTime: absoluteExpiry,
  //   ),
  //   updateMask: 'expireTime',
  // );

  // 5. Get cached content details
  print('5. Retrieving cached content details...');
  final retrieved = await client.cachedContents.get(name: cachedContent.name!);
  print('✓ Retrieved cache:');
  print('  Display name: ${retrieved.displayName}');
  print('  Model: ${retrieved.model}');
  print('  Created: ${retrieved.createTime}');
  print('  Updated: ${retrieved.updateTime}');
  print('  Expires: ${retrieved.expireTime}');
  print('');

  // 6. Clean up - delete cached content
  print('6. Deleting cached content...');
  await client.cachedContents.delete(name: cachedContent.name!);
  print('✓ Cache deleted successfully');
  print('');

  print('=== Example Complete ===');
  print('\nKey Benefits of Context Caching:');
  print('• Reduced latency for requests with large contexts');
  print('• Lower costs by reusing cached content');
  print('• Consistent system instructions across requests');
  print('• Efficient handling of large documents or knowledge bases');
}
