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
  /// - `baseUrl`: the base URL to use. Defaults to [defaultHost]. You can
  ///   override this to use a different API URL, or to use a proxy.
  /// - `headers`: global headers to send with every request. You can use
  ///   this to set custom headers, or to override the default headers.
  /// - `client`: the HTTP client to use. You can set your own HTTP client if
  ///   you need further customization (e.g. to use a Socks5 proxy).
  OllamaClient({
    super.baseUrl,
    final Map<String, String>? headers,
    final http.Client? client,
  }) : super(
          headers: headers ?? const {},
          client: client ?? createDefaultHttpClient(),
        );

  /// Host used when not provided in the class constructor
  final defaultHost = 'http://localhost:11434/api';

  // ------------------------------------------
  // METHOD: generateStream
  // ------------------------------------------

  /// Generate a response for a given prompt with a provided model. This is a streaming endpoint, so will be a series of responses. The final response object will include statistics and additional data from the request.
  ///
  /// `request`: Request object for the Create completion endpoint.
  ///
  /// `POST` `http://localhost:11434/api/generate`
  Stream<GenerateResponse> generateStream({
    required final GenerateRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: baseUrl ?? defaultHost,
      path: '/generate',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => GenerateResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: createModelStream
  // ------------------------------------------

  /// Create a model from a Modelfile. It is recommended to set modelfile to the content of the Modelfile rather than just set path. This is a requirement for remote create. Remote model creation should also create any file blobs, fields such as FROM and ADAPTER, explicitly with the server using Create a Blob and the value to the path indicated in the response.
  ///
  /// `request`: Request object for the creating a new model
  ///
  /// `POST` `http://localhost:11434/api/create`
  Stream<CreateResponse> createModelStream({
    required final CreateRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: baseUrl ?? defaultHost,
      path: '/create',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => CreateResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: pullModelStream
  // ------------------------------------------

  /// Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.
  ///
  /// `request`: Request object for pulling a model
  ///
  /// `POST` `http://localhost:11434/api/pull`
  Stream<PullResponse> pullModelStream({
    required final PullRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: baseUrl ?? defaultHost,
      path: '/pull',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => PullResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: pushModelStream
  // ------------------------------------------

  /// Upload a model to a model library. Requires registering for ollama.ai and adding a public key first.
  ///
  /// `request`: Request object for pushing models
  ///
  /// `POST` `http://localhost:11434/api/push`
  Stream<PushResponse> pushModelStream({
    required final PushRequest request,
  }) async* {
    final r = await makeRequestStream(
      baseUrl: baseUrl ?? defaultHost,
      path: '/push',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request.copyWith(stream: true),
    );
    yield* r.stream.map(
      (final d) => PushResponse.fromJson(
        json.decode(const Utf8Decoder().convert(d)),
      ),
    );
  }

  // ------------------------------------------
  // METHOD: copyModelWithResponse
  // ------------------------------------------

  /// Copy a model. Creates a model with another name from an existing model. Returns status code 200 on successful copy.
  ///
  /// `request`: Request object for copying models
  ///
  /// `POST` `http://localhost:11434/api/copy
  /// ]`
  Future<http.Response> copyModelWithResponse({
    required final CopyRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: baseUrl ?? defaultHost,
      path: '/copy',
      method: g.HttpMethod.post,
      requestType: 'application/json',
      body: request,
    );
    return r;
  }

  // ------------------------------------------
  // METHOD: deleteModelWithResponse
  // ------------------------------------------

  /// Delete a model. Deletes a model from local storage. Returns status code 200 on successful delete.
  ///
  /// `request`: Request object for deleting models
  ///
  /// `POST` `http://localhost:11434/api/delete
  /// ]`
  Future<http.Response> deleteModelWithResponse({
    required final DeleteRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: baseUrl ?? defaultHost,
      path: '/delete',
      method: g.HttpMethod.delete,
      requestType: 'application/json',
      body: request,
    );
    return r;
  }
}
