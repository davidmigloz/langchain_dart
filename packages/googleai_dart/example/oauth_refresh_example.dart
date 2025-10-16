// ignore_for_file: avoid_print, unreachable_from_main
/// Demonstrates OAuth token refresh during retry attempts.
///
/// This example shows how to implement a custom AuthProvider that
/// automatically refreshes expired OAuth tokens during retry attempts,
/// solving the limitation documented in earlier versions of this library.
library;

import 'package:googleai_dart/googleai_dart.dart';

/// Custom OAuth provider that handles token refresh.
///
/// This provider demonstrates the key benefit of the AuthProvider pattern:
/// tokens can be refreshed automatically during retry attempts because
/// [getCredentials] is called on each request attempt.
class OAuthProvider implements AuthProvider {
  /// Cached access token.
  String? _cachedToken;

  /// Token expiration time.
  DateTime? _expiresAt;

  /// OAuth refresh token (would come from OAuth flow in production).
  final String refreshToken;

  /// Creates an [OAuthProvider].
  OAuthProvider({
    required this.refreshToken,
    String? initialAccessToken,
    DateTime? initialExpiresAt,
  }) : _cachedToken = initialAccessToken,
       _expiresAt = initialExpiresAt;

  @override
  Future<AuthCredentials> getCredentials() async {
    // Return cached token if still valid (with 5-minute buffer)
    if (_cachedToken != null &&
        _expiresAt != null &&
        DateTime.now().isBefore(
          _expiresAt!.subtract(const Duration(minutes: 5)),
        )) {
      print('   [Auth] Using cached token (expires: $_expiresAt)');
      return BearerTokenCredentials(_cachedToken!);
    }

    // Token expired or not present - refresh it
    print('   [Auth] Token expired or missing, refreshing...');
    final newToken = await _refreshToken();

    print('   [Auth] Token refreshed successfully (expires: $_expiresAt)');
    return BearerTokenCredentials(newToken);
  }

  /// Refreshes the OAuth token.
  ///
  /// In production, this would make an HTTP request to your OAuth provider:
  /// ```dart
  /// final response = await http.post(
  ///   Uri.parse('https://oauth2.googleapis.com/token'),
  ///   body: {
  ///     'client_id': clientId,
  ///     'client_secret': clientSecret,
  ///     'refresh_token': refreshToken,
  ///     'grant_type': 'refresh_token',
  ///   },
  /// );
  /// final data = json.decode(response.body);
  /// _cachedToken = data['access_token'];
  /// _expiresAt = DateTime.now().add(Duration(seconds: data['expires_in']));
  /// return _cachedToken!;
  /// ```
  Future<String> _refreshToken() async {
    // Simulate OAuth token refresh request
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Generate a mock token (in production, this comes from OAuth server)
    _cachedToken = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    _expiresAt = DateTime.now().add(const Duration(hours: 1));

    return _cachedToken!;
  }

  /// Simulates token expiration for demonstration purposes.
  void expireToken() {
    _expiresAt = DateTime.now().subtract(const Duration(minutes: 1));
    print('   [Test] Expired token (will refresh on next request)');
  }
}

void main() async {
  print('=== OAuth Token Refresh Example ===\n');
  print('This example demonstrates how the AuthProvider pattern enables');
  print('automatic OAuth token refresh during retry attempts.\n');

  // Create OAuth provider with an initial token
  final authProvider = OAuthProvider(
    refreshToken: 'mock_refresh_token',
    initialAccessToken: 'initial_token',
    initialExpiresAt: DateTime.now().add(const Duration(hours: 1)),
  );

  final client = GoogleAIClient(
    config: GoogleAIConfig(authProvider: authProvider),
  );

  try {
    // Scenario 1: Normal request with valid token
    print('Scenario 1: Request with valid token');
    print('─' * 50);
    print('Making request...');

    // NOTE: This will fail with a real API call since we're using mock tokens.
    // In production with real OAuth tokens, this would succeed.
    try {
      await client.models.generateContent(
        model: 'gemini-2.5-flash',
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Say hello')], role: 'user'),
          ],
        ),
      );
    } catch (e) {
      print('   (Expected failure with mock token: $e)\n');
    }

    // Scenario 2: Token refresh during retry
    print('Scenario 2: Token expires, automatic refresh during retry');
    print('─' * 50);

    // Expire the token to simulate expiration
    authProvider.expireToken();

    print('Making request with expired token...');
    print('If a retryable error occurs, the token will refresh automatically.');
    print(
      'Note: This demonstrates the concept - real OAuth would be needed.\n',
    );

    try {
      await client.models.generateContent(
        model: 'gemini-2.5-flash',
        request: const GenerateContentRequest(
          contents: [
            Content(parts: [TextPart('Say hello again')], role: 'user'),
          ],
        ),
      );
    } catch (e) {
      print('   (Expected failure with mock token: $e)\n');
    }

    print('Key Benefits:');
    print('─' * 50);
    print('✓ AuthProvider.getCredentials() is called on EACH request attempt');
    print('✓ This includes all retry attempts after failures');
    print('✓ OAuth providers can refresh expired tokens automatically');
    print('✓ No manual intervention needed for token refresh');
    print('✓ Maintains spec compliance (retry wraps transport layer)');
    print('');

    print('Architecture:');
    print('─' * 50);
    print('Request → Auth → Logging → Error → Retry(Transport)');
    print('          ↑');
    print('          └─ Called fresh on each retry attempt');
    print('');

    print('Real-world Usage:');
    print('─' * 50);
    print('1. Implement OAuthProvider with your OAuth flow');
    print('2. Store refresh_token securely');
    print('3. Provider handles all token refresh automatically');
    print('4. Works seamlessly with retry logic');
    print('');

    print('Example OAuth Provider:');
    print('─' * 50);
    print('''
class GoogleOAuthProvider implements AuthProvider {
  final String clientId;
  final String clientSecret;
  final String refreshToken;

  String? _accessToken;
  DateTime? _expiresAt;

  @override
  Future<AuthCredentials> getCredentials() async {
    // Check if token is still valid
    if (_accessToken != null &&
        _expiresAt != null &&
        DateTime.now().isBefore(_expiresAt!)) {
      return BearerTokenCredentials(_accessToken!);
    }

    // Refresh token via OAuth
    final response = await http.post(
      Uri.parse('https://oauth2.googleapis.com/token'),
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'refresh_token': refreshToken,
        'grant_type': 'refresh_token',
      },
    );

    final data = json.decode(response.body);
    _accessToken = data['access_token'];
    _expiresAt = DateTime.now()
        .add(Duration(seconds: data['expires_in']));

    return BearerTokenCredentials(_accessToken!);
  }
}

// Usage:
final client = GoogleAIClient(
  config: GoogleAIConfig(
    authProvider: GoogleOAuthProvider(
      clientId: 'YOUR_CLIENT_ID',
      clientSecret: 'YOUR_CLIENT_SECRET',
      refreshToken: 'YOUR_REFRESH_TOKEN',
    ),
  ),
);
''');
  } finally {
    client.close();
  }

  print('\n✅ Example completed!');
  print('This pattern eliminates the auth token refresh limitation');
  print('that existed in earlier versions of this library.');
}
