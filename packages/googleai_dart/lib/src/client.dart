// ignore_for_file: use_super_parameters
import 'package:http/http.dart' as http;

import 'generated/client.dart' as g;
import 'http_client/http_client.dart';

/// Client for Google AI API (Gemini API).
///
/// Please see https://ai.google.dev/tutorials/rest_quickstart for more details.
class GoogleAIClient extends g.GoogleAIClient {
  /// Create a new Google AI API client.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Google AI API key. You can find your API key in the
  ///   [Google AI Studio dashboard](https://makersuite.google.com/app/apikey).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use.You can override this to use a different
  ///    API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  GoogleAIClient({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : super(
          baseUrl: baseUrl,
          headers: headers ?? const {},
          queryParams: {
            'key': apiKey,
            ...?queryParams,
          },
          client: client ?? createDefaultHttpClient(),
        );

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}
