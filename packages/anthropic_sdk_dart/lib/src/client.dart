// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'generated/client.dart' as g;
import 'generated/schema/schema.dart';
import 'http_client/http_client.dart';

/// Client for Anthropic API.
///
/// Please see https://docs.anthropic.com/en/api for more details.
class AnthropicClient extends g.AnthropicClient {
  /// Create a new Anthropic API client.
  ///
  /// Main configuration options:
  /// - `apiKey`: your Anthropic API key. You can find your API key in the
  ///   [Anthropic console](https://console.anthropic.com/settings/keys).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to `https://api.anthropic.com/v1`.
  ///   You can override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  AnthropicClient({
    final String? apiKey,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : super(
          apiKey: apiKey ?? '',
          baseUrl: baseUrl,
          headers: {
            'anthropic-version': '2023-06-01',
            ...?headers,
          },
          queryParams: queryParams ?? const {},
          client: client ?? createDefaultHttpClient(),
        );

  // ------------------------------------------
  // METHOD: createMessageStream
  // ------------------------------------------

  /// Create a Message
  ///
  /// Send a structured list of input messages with text and/or image content, and the
  /// model will generate the next message in the conversation.
  ///
  /// The Messages API can be used for either single queries or stateless multi-turn
  /// conversations.
  ///
  /// `request`: The request parameters for creating a message.
  ///
  /// `POST` `https://api.anthropic.com/v1/messages`
  Stream<MessageStreamEvent> createMessageStream({
    required final CreateMessageRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.anthropic.com/v1',
      path: '/messages',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
      headerParams: {
        if (apiKey.isNotEmpty) 'x-api-key': apiKey,
      },
    );
    yield* r.stream
        .transform(const _AnthropicStreamTransformer()) //
        .map(
      (final d) {
        final j = json.decode(d) as Map<String, dynamic>;
        return MessageStreamEvent.fromJson(j);
      },
    );
  }

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}

class _AnthropicStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _AnthropicStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter()) //
        .where((final i) => i.startsWith('data: '))
        .map((final item) => item.substring(6));
  }
}
