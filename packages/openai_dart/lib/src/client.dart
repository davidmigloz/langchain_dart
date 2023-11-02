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
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OpenAIClient({
    final String? apiKey,
    final String? organization,
    final String? baseUrl,
    final Map<String, String>? headers,
    final http.Client? client,
  }) : super(
          bearerToken: apiKey ?? '',
          baseUrl: baseUrl,
          headers: {
            if (organization != null) 'OpenAI-Organization': organization,
            ...?headers,
          },
          client: client ?? createDefaultHttpClient(),
        );

  // ------------------------------------------
  // METHOD: onStreamedResponse
  // ------------------------------------------

  /// Middleware for HTTP streamed responses (user can override)
  Future<http.StreamedResponse> onStreamedResponse(
    final http.StreamedResponse response,
  ) {
    return Future.value(response);
  }

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
    final r = await _requestStream(
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
    final r = await _requestStream(
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

  // ------------------------------------------
  // METHOD: _request
  // ------------------------------------------

  /// Reusable request stream method
  Future<http.StreamedResponse> _requestStream({
    required String baseUrl,
    required final String path,
    required final g.HttpMethod method,
    final Map<String, dynamic> queryParams = const {},
    final Map<String, String> headerParams = const {},
    final String requestType = '',
    final String responseType = '',
    final Object? body,
  }) async {
    // Override with the user provided baseUrl
    baseUrl = this.baseUrl ?? baseUrl;

    // Ensure a baseUrl is provided
    assert(
      baseUrl.isNotEmpty,
      'baseUrl is required, but none defined in spec or provided by user',
    );

    // Ensure query parameters are strings or iterable of strings
    final query = queryParams.map((final key, final value) {
      if (value is Iterable) {
        return MapEntry(key, value.map((final v) => v.toString()));
      } else {
        return MapEntry(key, value.toString());
      }
    });

    // Build the request URI
    Uri uri = Uri.parse(baseUrl + path);
    if (query.isNotEmpty) {
      uri = uri.replace(queryParameters: query);
    }

    // Build the headers
    final Map<String, String> headers = {...headerParams};

    // Add bearer token to request headers
    if (bearerToken.isNotEmpty) {
      headers['authorization'] = 'Bearer $bearerToken';
    }

    // Define the request type being sent to server
    if (requestType.isNotEmpty) {
      headers['content-type'] = requestType;
    }

    // Define the response type expected to receive from server
    if (responseType.isNotEmpty) {
      headers['accept'] = responseType;
    }

    // Add global headers
    headers.addAll(this.headers);

    // Build the request object
    late http.StreamedResponse response;
    try {
      http.Request request = http.Request(method.name, uri);
      try {
        if (body != null) {
          request.body = json.encode(body);
        }
      } catch (e) {
        // Handle request encoding error
        throw g.OpenAIClientException(
          uri: uri,
          method: method,
          message: 'Could not encode: ${body.runtimeType}',
          body: e,
        );
      }

      // Add request headers
      request.headers.addAll(headers);

      // Handle user request middleware
      request = await onRequest(request) as http.Request;

      // Submit request
      response = await client.send(request);

      // Handle user response middleware
      response = await onStreamedResponse(response);
    } catch (e) {
      // Handle request and response errors
      throw g.OpenAIClientException(
        uri: uri,
        method: method,
        message: 'Response error',
        body: e,
      );
    }

    // Check for successful response
    if ((response.statusCode ~/ 100) == 2) {
      return response;
    }

    // Handle unsuccessful response
    throw g.OpenAIClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: (await http.Response.fromStream(response)).body,
    );
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
