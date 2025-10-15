// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;

import '../mistralai_dart.dart';
import 'generated/client.dart' as g;

/// Client for Mistral AI API.
///
/// Please see https://docs.mistral.ai/api for more details.
class MistralAIClient extends g.MistralAIClient {
  /// Create a new Mistral AI API client.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Mistral AI API key. You can find your API key in the
  ///   [Mistral AI dashboard](https://console.mistral.ai/users/).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to `https://api.mistral.ai/v1`.
  ///   You can override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `retries`: the number of retries to attempt if a request fails.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  MistralAIClient({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final int retries = 3,
    final http.Client? client,
  }) : super(
         bearerToken: apiKey ?? '',
         baseUrl: baseUrl,
         headers: headers ?? const {},
         queryParams: queryParams ?? const {},
         client: client ?? RetryClient(http.Client(), retries: retries),
       );

  // ------------------------------------------
  // METHOD: createChatCompletionStream
  // ------------------------------------------

  /// Create Chat Completions streaming the response.
  ///
  /// `request`: Request class for the chat completion endpoint.
  ///
  /// `POST` `https://api.mistral.ai/v1/chat/completions`
  Stream<ChatCompletionStreamResponse> createChatCompletionStream({
    required final ChatCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.mistral.ai/v1',
      path: '/chat/completions',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream
        .transform(const _MistralAIStreamTransformer()) //
        .map(
          (final d) => ChatCompletionStreamResponse.fromJson(json.decode(d)),
        );
  }
}

/// Transforms SSE (Server-Sent Events) byte streams into data strings.
///
/// Implements parsing according to the WHATWG SSE specification:
/// https://html.spec.whatwg.org/multipage/server-sent-events.html
///
/// SSE Format: Each line can be one of:
/// - `data: value` (standard format with space after colon)
/// - `data:value` (format without space, used by some providers)
/// - `data:[DONE]` (termination signal, filtered out)
///
/// Per the WHATWG spec, the space after the colon is optional. When present,
/// exactly one leading space should be removed from the value. We use `.trim()`
/// to handle both formats and any additional whitespace variations robustly.
///
/// This transformer:
/// 1. Decodes UTF-8 bytes to strings
/// 2. Splits on line boundaries
/// 3. Filters for lines starting with 'data:' (excluding '[DONE]' markers)
/// 4. Extracts the value after 'data:' and trims whitespace
class _MistralAIStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _MistralAIStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter()) //
        .where((final i) => i.startsWith('data:') && !i.endsWith('[DONE]'))
        .map((final item) => item.substring(5).trim());
  }
}
