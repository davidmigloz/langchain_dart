// ignore_for_file: use_super_parameters
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;

import '../ollama_dart.dart';
import 'generated/client.dart' as g;

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
  /// - `retries`: the number of retries to attempt if a request fails.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OllamaClient({
    final String? baseUrl,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final int retries = 3,
    final http.Client? client,
  }) : super(
          baseUrl: baseUrl,
          headers: headers ?? const {},
          queryParams: queryParams ?? const {},
          client: client ?? RetryClient(http.Client(), retries: retries),
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
    yield* r.stream
        .transform(const _OllamaStreamTransformer()) //
        .map((d) => GenerateCompletionResponse.fromJson(json.decode(d)));
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
    yield* r.stream
        .transform(const _OllamaStreamTransformer()) //
        .map((d) => GenerateChatCompletionResponse.fromJson(json.decode(d)));
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
    yield* r.stream
        .transform(const _OllamaStreamTransformer()) //
        .map((d) => CreateModelResponse.fromJson(json.decode(d)));
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
    yield* r.stream
        .transform(const _OllamaStreamTransformer()) //
        .map((d) => PullModelResponse.fromJson(json.decode(d)));
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
    yield* r.stream
        .transform(const _OllamaStreamTransformer()) //
        .map((d) => PushModelResponse.fromJson(json.decode(d)));
  }
}

class _OllamaStreamTransformer
    extends StreamTransformerBase<List<int>, String> {
  const _OllamaStreamTransformer();

  @override
  Stream<String> bind(final Stream<List<int>> stream) {
    return stream //
        .transform(utf8.decoder) //
        .transform(const LineSplitter());
  }
}
