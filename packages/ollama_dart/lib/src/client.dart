// ignore_for_file: use_super_parameters
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../ollama_dart.dart';
import 'generated/client.dart' as g;
import 'http_client/http_client.dart';

/// Client for Ollama API.
///
/// Please see https://github.com/jmorganca/ollama/blob/main/docs/api.md for more details.
class OllamaClient extends g.OllamaClient {
  /// Create a new Ollama API client.
  ///
  /// Advance configuration options:
  /// - `baseUrl`: the base URL to use. Defaults to `http://localhost:11434/api`.
  ///   You can override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `queryParams`: global query parameters to send with every request. You
  ///   can use this to set custom query parameters.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OllamaClient({
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final http.Client? client,
  }) : super(
          baseUrl: baseUrl,
          headers: headers ?? const {},
          queryParams: queryParams ?? const {},
          client: client ?? createDefaultHttpClient(),
        );

  // ------------------------------------------
  // METHOD: generateCompletionStream
  // ------------------------------------------

  /// Generate a response for a given prompt with a provided model streaming the response.
  ///
  /// The final response object will include statistics and additional data from the request.
  ///
  /// `request`: Request class for the generate endpoint.
  ///
  /// `POST` `http://localhost:11434/api/generate`
  Stream<GenerateCompletionResponse> generateCompletionStream({
    required final GenerateCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'http://localhost:11434/api',
      path: '/generate',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => GenerateCompletionResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: generateChatCompletionStream
  // ------------------------------------------

  /// Generate a chat response for a given prompt with a provided model streaming the response.
  ///
  /// The final response object will include statistics and additional data from the request.
  ///
  /// `request`: Request class for the generate endpoint.
  ///
  /// `POST` `http://localhost:11434/api/chat`
  Stream<GenerateChatCompletionResponse> generateChatCompletionStream({
    required final GenerateChatCompletionRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'http://localhost:11434/api',
      path: '/chat',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => GenerateChatCompletionResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: createModelStream
  // ------------------------------------------

  /// Create a model from a Modelfile streaming the response.
  ///
  /// It is recommended to set `modelfile` to the content of the Modelfile rather than just set `path`. This is a requirement for remote create. Remote model creation should also create any file blobs, fields such as `FROM` and `ADAPTER`, explicitly with the server using Create a Blob and the value to the path indicated in the response.
  ///
  /// `request`: Create a new model from a Modelfile.
  ///
  /// `POST` `http://localhost:11434/api/create`
  Stream<CreateModelResponse> createModelStream({
    required final CreateModelRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'http://localhost:11434/api',
      path: '/create',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => CreateModelResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: pullModelStream
  // ------------------------------------------

  /// Download a model from the ollama library streaming the response.
  ///
  /// Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.
  ///
  /// `request`: Request class for pulling a model.
  ///
  /// `POST` `http://localhost:11434/api/pull`
  Stream<PullModelResponse> pullModelStream({
    required final PullModelRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'http://localhost:11434/api',
      path: '/pull',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => PullModelResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: pushModelStream
  // ------------------------------------------

  /// Upload a model to a model library streaming the response.
  ///
  /// Requires registering for ollama.ai and adding a public key first.
  ///
  /// `request`: Request class for pushing a model.
  ///
  /// `POST` `http://localhost:11434/api/push`
  Stream<PushModelResponse> pushModelStream({
    required final PushModelRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: 'http://localhost:11434/api',
      path: '/push',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => PushModelResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  @override
  Future<http.BaseRequest> onRequest(final http.BaseRequest request) {
    return onRequestHandler(request);
  }
}
