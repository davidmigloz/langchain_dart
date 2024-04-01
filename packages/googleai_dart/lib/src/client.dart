// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'generated/client.dart' as g;
import 'generated/schema/schema.dart';
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

  /// Set or replace the API key.
  set apiKey(final String value) => queryParams['key'] = value;

  /// Get the API key.
  String get apiKey => queryParams['key'];

  // ------------------------------------------
  // METHOD: streamGenerateContent
  // ------------------------------------------

  /// Generates a streamed response from the model given an input `GenerateContentRequest`.
  ///
  /// `modelId`: The id of the model to use.
  ///
  /// `request`: Request to generate a completion from the model.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/models/{modelId}:streamGenerateContent`
  Stream<GenerateContentResponse> streamGenerateContent({
    final String modelId = 'gemini-pro',
    final GenerateContentRequest? request,
  }) async* {
    final streamedResponse = await makeRequestStream(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      queryParams: {
        'alt': 'sse',
      },
      path: '/models/$modelId:streamGenerateContent',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );

    yield* streamedResponse.stream
        .transform(const _GoogleAIStreamTransformer())
        .map((final d) => GenerateContentResponse.fromJson(json.decode(d)));
  }

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}

class _GoogleAIStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _GoogleAIStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where((final s) => s.isNotEmpty)
        .map((final s) => s.substring(6));
  }
}
