// ignore_for_file: avoid_print
import 'dart:io';

import 'package:googleai_dart/googleai_dart.dart';

/// This example demonstrates how to use different API versions (v1 vs v1beta).
///
/// ## API Versions
///
/// - **v1**: Stable, production-ready. Breaking changes trigger new major version.
/// - **v1beta**: Beta with early-access features. Subject to rapid/breaking changes.
///
/// ## When to Use Each Version
///
/// - Use **v1** for production applications where stability is critical
/// - Use **v1beta** for testing new features or development
///
/// ## Setup
///
/// Set your API key as an environment variable:
/// ```bash
/// export GOOGLE_API_KEY=your_api_key_here
/// ```
///
/// ## Run
///
/// ```bash
/// dart run example/api_versions_example.dart
/// ```
Future<void> main() async {
  final apiKey = Platform.environment['GOOGLE_API_KEY'];
  if (apiKey == null) {
    stderr.writeln('Please set the GOOGLE_API_KEY environment variable.');
    exit(1);
  }

  print('=== API Versions Example ===\n');

  // Example 1: Using v1 (Stable)
  await usingV1(apiKey);

  print('\n${'=' * 50}\n');

  // Example 2: Using v1beta (Beta with early-access features)
  await usingV1Beta(apiKey);

  print('\n${'=' * 50}\n');

  // Example 3: Default behavior (v1beta for backward compatibility)
  await usingDefault(apiKey);
}

/// Example using v1 (stable version).
///
/// **Recommended for production applications.**
Future<void> usingV1(String apiKey) async {
  print('## Example 1: Using v1 (Stable)');
  print('Recommended for production applications.\n');

  final client = GoogleAIClient(
    config: GoogleAIConfig.googleAI(
      apiVersion: ApiVersion.v1,
      authProvider: ApiKeyProvider(apiKey),
    ),
  );

  try {
    print('Generating content with v1 API...');

    final response = await client.models.generateContent(
      model: 'gemini-2.5-flash',
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [TextPart('What is the meaning of life?')],
            role: 'user',
          ),
        ],
      ),
    );

    final text = response.candidates?.first.content?.parts.first;
    if (text is TextPart) {
      print('Response: ${text.text.substring(0, 100)}...\n');
    }

    print('✅ Success with v1 (stable)');
  } catch (e) {
    print('❌ Error with v1: $e');
  } finally {
    client.close();
  }
}

/// Example using v1beta (beta version with early-access features).
///
/// **Use for testing and development.**
Future<void> usingV1Beta(String apiKey) async {
  print('## Example 2: Using v1beta (Beta)');
  print('Access to early-access features, but subject to breaking changes.\n');

  final client = GoogleAIClient(
    config: GoogleAIConfig.googleAI(
      apiVersion: ApiVersion.v1beta,
      authProvider: ApiKeyProvider(apiKey),
    ),
  );

  try {
    print('Generating content with v1beta API...');

    final response = await client.models.generateContent(
      model: 'gemini-2.5-flash',
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [TextPart('Explain quantum entanglement.')],
            role: 'user',
          ),
        ],
      ),
    );

    final text = response.candidates?.first.content?.parts.first;
    if (text is TextPart) {
      print('Response: ${text.text.substring(0, 100)}...\n');
    }

    print('✅ Success with v1beta (beta)');
  } catch (e) {
    print('❌ Error with v1beta: $e');
  } finally {
    client.close();
  }
}

/// Example using the default configuration (v1beta for backward compatibility).
///
/// **Not explicitly specifying the version defaults to v1beta.**
Future<void> usingDefault(String apiKey) async {
  print('## Example 3: Default Behavior');
  print('Defaults to v1beta for backward compatibility.\n');

  // Using the default GoogleAIConfig constructor (no explicit version)
  final client = GoogleAIClient(
    config: GoogleAIConfig(
      authProvider: ApiKeyProvider(apiKey),
    ),
  );

  try {
    print('Generating content with default config (v1beta)...');

    final response = await client.models.generateContent(
      model: 'gemini-2.5-flash',
      request: const GenerateContentRequest(
        contents: [
          Content(
            parts: [TextPart('What is machine learning?')],
            role: 'user',
          ),
        ],
      ),
    );

    final text = response.candidates?.first.content?.parts.first;
    if (text is TextPart) {
      print('Response: ${text.text.substring(0, 100)}...\n');
    }

    print('✅ Success with default config (v1beta)');
  } catch (e) {
    print('❌ Error with default: $e');
  } finally {
    client.close();
  }
}
