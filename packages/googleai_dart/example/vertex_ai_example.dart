// ignore_for_file: avoid_print
import 'dart:io';

/// This example demonstrates how to use the Vertex AI Gemini API.
///
/// ## Vertex AI vs Google AI
///
/// | Feature | Google AI | Vertex AI |
/// |---------|-----------|-----------|
/// | Authentication | API Key | OAuth 2.0 with service accounts |
/// | Endpoint | generativelanguage.googleapis.com | {location}-aiplatform.googleapis.com |
/// | Use Case | Quick prototyping | Enterprise apps with advanced controls |
/// | Enterprise Features | None | VPC controls, CMEK, data residency, HIPAA |
///
/// ## Setup
///
/// 1. Create a Google Cloud Platform (GCP) project
/// 2. Enable the Vertex AI API
/// 3. Create a service account with `roles/aiplatform.user` role
/// 4. Download the service account JSON key
/// 5. Set environment variables:
///
/// ```bash
/// export GOOGLE_CLOUD_PROJECT=your-project-id
/// export GOOGLE_CLOUD_LOCATION=us-central1
/// export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account-key.json
/// ```
///
/// ## Authentication
///
/// This example demonstrates a simple OAuth provider. For production use,
/// consider using the `googleapis_auth` package for more robust OAuth handling.
///
/// ## Run
///
/// ```bash
/// dart run example/vertex_ai_example.dart
/// ```
Future<void> main() async {
  final projectId = Platform.environment['GOOGLE_CLOUD_PROJECT'];
  final location =
      Platform.environment['GOOGLE_CLOUD_LOCATION'] ?? 'us-central1';
  final credentialsPath =
      Platform.environment['GOOGLE_APPLICATION_CREDENTIALS'];

  if (projectId == null) {
    stderr.writeln('Please set the GOOGLE_CLOUD_PROJECT environment variable.');
    exit(1);
  }

  if (credentialsPath == null) {
    stderr.writeln(
      'Please set the GOOGLE_APPLICATION_CREDENTIALS environment variable.',
    );
    exit(1);
  }

  print('=== Vertex AI Example ===\n');

  // Note: This is a simplified example. In production, you should use
  // a proper OAuth library like googleapis_auth to handle token refresh.
  //
  // For a complete OAuth implementation, see:
  // https://pub.dev/packages/googleapis_auth
  //
  // Example OAuth provider implementation:
  //
  // ```dart
  // import 'package:googleapis_auth/auth_io.dart' as auth;
  //
  // class VertexAIOAuthProvider implements AuthProvider {
  //   final auth.ServiceAccountCredentials _credentials;
  //   auth.AccessCredentials? _cachedCredentials;
  //
  //   VertexAIOAuthProvider(this._credentials);
  //
  //   @override
  //   Future<AuthCredentials> getCredentials() async {
  //     // Refresh if expired or not yet obtained
  //     if (_cachedCredentials == null ||
  //         _cachedCredentials!.accessToken.expiry.isBefore(DateTime.now())) {
  //       final client = await auth.clientViaServiceAccount(
  //         _credentials,
  //         ['https://www.googleapis.com/auth/cloud-platform'],
  //       );
  //       _cachedCredentials = await auth.obtainAccessCredentialsViaServiceAccount(
  //         _credentials,
  //         ['https://www.googleapis.com/auth/cloud-platform'],
  //         client,
  //       );
  //       client.close();
  //     }
  //
  //     return BearerTokenCredentials(_cachedCredentials!.accessToken.data);
  //   }
  // }
  //
  // // Load service account JSON
  // final serviceAccountJson = jsonDecode(File(credentialsPath).readAsStringSync());
  // final credentials = auth.ServiceAccountCredentials.fromJson(serviceAccountJson);
  // final authProvider = VertexAIOAuthProvider(credentials);
  // ```

  print('⚠️  This example requires googleapis_auth package for OAuth.');
  print('Add it to your pubspec.yaml:');
  print('  dependencies:');
  print('    googleapis_auth: ^1.6.0  # Check pub.dev for latest version\n');
  print('For now, this example shows the configuration structure.\n');

  // Example configuration (auth provider not implemented in this demo)
  print('## Vertex AI Configuration\n');
  print('Project ID: $projectId');
  print('Location: $location');
  print('Credentials: $credentialsPath\n');

  print('## Configuration Example:\n');
  print('''
final client = GoogleAIClient(
  config: GoogleAIConfig.vertexAI(
    projectId: '$projectId',
    location: '$location',
    apiVersion: ApiVersion.v1, // Stable version
    authProvider: VertexAIOAuthProvider(credentials),
  ),
);

// Use the same API as Google AI!
final response = await client.models.generateContent(
  model: 'gemini-2.5-flash',
  request: GenerateContentRequest(
    contents: [
      Content(
        parts: [TextPart('Explain quantum computing')],
        role: 'user',
      ),
    ],
  ),
);
''');

  print('\n## Key Benefits of Vertex AI:\n');
  print('✅ Enterprise-grade security controls');
  print('✅ VPC Service Controls for data protection');
  print('✅ Customer-managed encryption keys (CMEK)');
  print('✅ Data residency compliance');
  print('✅ HIPAA workload support');
  print('✅ Integration with Google Cloud services');
  print('✅ Grounding with Vertex AI Search');
  print('✅ Supervised fine-tuning support');
  print('✅ Batch predictions with 50% discount\n');

  print('## API Compatibility:\n');
  print('All 78 endpoints work identically on both Google AI and Vertex AI:');
  print('• Generation & streaming');
  print('• Embeddings');
  print('• Function calling');
  print('• File management');
  print('• Context caching');
  print('• Batch operations');
  print('• Corpus & RAG');
  print('• Tuned models');
  print('• And more!\n');

  print('## Complete OAuth Implementation:\n');
  print(
    'See oauth_refresh_example.dart for a working OAuth provider implementation.',
  );
}
