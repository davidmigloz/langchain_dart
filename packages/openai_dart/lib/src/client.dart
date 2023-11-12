// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'generated/client.dart' as g;
import 'generated/schema/schema.dart';
import 'http_client/http_client.dart';

/// Client for OpenAI API.
///
/// Please see https://platform.openai.com/docs/api-reference for more details.
class OpenAIClient extends g.OpenAIClient {
  /// Create a new OpenAI API client.
  ///
  /// Main configuration options:
  /// - `apiKey`: your OpenAI API key. You can find your API key in the
  ///   [OpenAI dashboard](https://platform.openai.com/account/api-keys).
  /// - `organization`: your OpenAI organization ID (if applicable).
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to OpenAI's API URL. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters (e.g. Azure OpenAI API
  ///   required to attach a `version` query parameter to every request).
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAIClient({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : super(
          bearerToken: apiKey ?? '',
          baseUrl: baseUrl,
          headers: {
            if (organization != null) 'OpenAI-Organization': organization,
            'OpenAI-Beta': 'assistants=v1',
            ...?headers,
          },
          queryParams: queryParams ?? const {},
          client: client ?? createDefaultHttpClient(),
        );

  /// Set or replace the API key.
  set apiKey(final String value) => bearerToken = value;

  /// Get the API key.
  String get apiKey => bearerToken;

  // ------------------------------------------
  // METHOD: createCompletionStream
  // ------------------------------------------

  /// Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position. We recommend most users use our Chat completions API. [Learn more](https://platform.openai.com/docs/deprecations/2023-07-06-gpt-and-embeddings)  Related guide: [Legacy Completions](https://platform.openai.com/docs/guides/gpt/completions-api)
  ///
  /// `request`: Request object for the Create completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/completions`
  Stream<CreateCompletionResponse> createCompletionStream({
    required final CreateCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/completions',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream
        .transform(const _OpenAIStreamTransformer()) //
        .map((final d) => CreateCompletionResponse.fromJson(json.decode(d)));
  }

  // ------------------------------------------
  // METHOD: createChatCompletionStream
  // ------------------------------------------

  /// Creates a model response for the given chat conversation.
  ///
  /// `request`: Request object for the Create chat completion endpoint.
  ///
  /// `POST` `https://api.openai.com/v1/chat/completions`
  Stream<CreateChatCompletionStreamResponse> createChatCompletionStream({
    required final CreateChatCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'https://api.openai.com/v1',
      path: '/chat/completions',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request.copyWith(stream: true),
    );
    yield* r.stream
        .transform(const _OpenAIStreamTransformer()) //
        .map(
          (final d) =>
              CreateChatCompletionStreamResponse.fromJson(json.decode(d)),
        );
  }

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}

class _OpenAIStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _OpenAIStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter()) //
        .where((final i) => i.startsWith('data: ') && !i.endsWith('[DONE]'))
        .map((final item) => item.substring(6));
  }
}
