// ignore_for_file: avoid_unused_constructor_parameters

import 'package:googleai_dart/googleai_dart.dart' as g;
import 'package:http/http.dart' as http;

/// Stub credentials class for unsupported platforms.
///
/// This mimics the googleapis_auth ServiceAccountCredentials API to allow
/// the code to compile on web/WASM platforms where dart:io is not available.
class ServiceAccountCredentials {
  /// Creates credentials from JSON.
  ///
  /// On unsupported platforms, this will throw [UnsupportedError] when
  /// used with [HttpClientAuthProvider].
  ServiceAccountCredentials.fromJson(Map<String, dynamic> json);
}

/// {@template http_client_auth_provider}
/// Authentication provider that bridges googleapis_auth with googleai_dart.
///
/// **Note:** This class is not supported on web/WASM platforms because it
/// requires dart:io for service account authentication. For web apps, use
/// [ChatGoogleGenerativeAI] with an API key instead.
/// {@endtemplate}
class HttpClientAuthProvider implements g.AuthProvider {
  /// {@macro http_client_auth_provider}
  ///
  /// Throws [UnsupportedError] on web/WASM platforms.
  HttpClientAuthProvider({
    required ServiceAccountCredentials credentials,
    required List<String> scopes,
    http.Client? httpClient,
  }) {
    throw UnsupportedError(
      'HttpClientAuthProvider is not supported on this platform. '
      'Service account authentication requires dart:io. '
      'For web apps, use ChatGoogleGenerativeAI with an API key instead.',
    );
  }

  /// Creates an auth provider from a JSON service account key.
  ///
  /// Throws [UnsupportedError] on web/WASM platforms.
  factory HttpClientAuthProvider.fromJson({
    required Map<String, dynamic> serviceAccountJson,
    required List<String> scopes,
    http.Client? httpClient,
  }) {
    throw UnsupportedError(
      'HttpClientAuthProvider is not supported on this platform. '
      'Service account authentication requires dart:io. '
      'For web apps, use ChatGoogleGenerativeAI with an API key instead.',
    );
  }

  @override
  Future<g.AuthCredentials> getCredentials() {
    throw UnsupportedError(
      'HttpClientAuthProvider is not supported on this platform.',
    );
  }

  /// Closes the HTTP client and cleans up resources.
  ///
  /// Throws [UnsupportedError] on web/WASM platforms.
  void close() {
    throw UnsupportedError(
      'HttpClientAuthProvider is not supported on this platform.',
    );
  }
}
