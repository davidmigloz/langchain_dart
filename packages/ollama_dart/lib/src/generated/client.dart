// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target, unused_import

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:meta/meta.dart';

import 'schema/schema.dart';

/// Enum of HTTP methods
enum HttpMethod { get, put, post, delete, options, head, patch, trace }

// ==========================================
// CLASS: OllamaClientException
// ==========================================

/// HTTP exception handler for OllamaClient
class OllamaClientException implements Exception {
  OllamaClientException({
    required this.message,
    required this.uri,
    required this.method,
    this.code,
    this.body,
  });

  final String message;
  final Uri uri;
  final HttpMethod method;
  final int? code;
  final Object? body;

  @override
  String toString() {
    Object? data;
    try {
      data = body is String ? jsonDecode(body as String) : body.toString();
    } catch (e) {
      data = body.toString();
    }
    final s = JsonEncoder.withIndent('  ').convert({
      'uri': uri.toString(),
      'method': method.name.toUpperCase(),
      'code': code,
      'message': message,
      'body': data,
    });
    return 'OllamaClientException($s)';
  }
}

// ==========================================
// CLASS: OllamaClient
// ==========================================

/// Client for Ollama API (v.0.1.9)
///
/// API Spec for Ollama API server
class OllamaClient {
  /// Creates a new OllamaClient instance.
  ///
  /// - [OllamaClient.baseUrl] Override base URL (default: server url defined in spec)
  /// - [OllamaClient.headers] Global headers to be sent with every request
  /// - [OllamaClient.queryParams] Global query parameters to be sent with every request
  /// - [OllamaClient.client] Override HTTP client to use for requests
  OllamaClient({
    this.baseUrl,
    this.headers = const {},
    this.queryParams = const {},
    http.Client? client,
  })  : assert(
          baseUrl == null || baseUrl.startsWith('http'),
          'baseUrl must start with http',
        ),
        assert(
          baseUrl == null || !baseUrl.endsWith('/'),
          'baseUrl must not end with /',
        ),
        client = RetryClient(client ?? http.Client());

  /// Override base URL (default: server url defined in spec)
  final String? baseUrl;

  /// Global headers to be sent with every request
  final Map<String, String> headers;

  /// Global query parameters to be sent with every request
  final Map<String, dynamic> queryParams;

  /// HTTP client for requests
  final http.Client client;

  // ------------------------------------------
  // METHOD: endSession
  // ------------------------------------------

  /// Close the HTTP client and end session
  void endSession() => client.close();

  // ------------------------------------------
  // METHOD: onRequest
  // ------------------------------------------

  /// Middleware for HTTP requests (user can override)
  ///
  /// The request can be of type [http.Request] or [http.MultipartRequest]
  Future<http.BaseRequest> onRequest(http.BaseRequest request) {
    return Future.value(request);
  }

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
  // METHOD: onResponse
  // ------------------------------------------

  /// Middleware for HTTP responses (user can override)
  Future<http.Response> onResponse(http.Response response) {
    return Future.value(response);
  }

  // ------------------------------------------
  // METHOD: _jsonDecode
  // ------------------------------------------

  dynamic _jsonDecode(http.Response r) {
    return json.decode(utf8.decode(r.bodyBytes));
  }

  // ------------------------------------------
  // METHOD: _request
  // ------------------------------------------

  /// Reusable request method
  @protected
  Future<http.StreamedResponse> _request({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    // Override with the user provided baseUrl
    baseUrl = this.baseUrl ?? baseUrl;

    // Ensure a baseUrl is provided
    assert(
      baseUrl.isNotEmpty,
      'baseUrl is required, but none defined in spec or provided by user',
    );

    // Add global query parameters
    queryParams = {...queryParams, ...this.queryParams};

    // Ensure query parameters are strings or iterable of strings
    queryParams = queryParams.map((key, value) {
      if (value is Iterable) {
        return MapEntry(key, value.map((v) => v.toString()));
      } else {
        return MapEntry(key, value.toString());
      }
    });

    // Build the request URI
    Uri uri = Uri.parse(baseUrl + path);
    if (queryParams.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParams);
    }

    // Build the headers
    Map<String, String> headers = {...headerParams};

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
    http.BaseRequest request;
    if (isMultipart) {
      // Handle multipart request
      request = http.MultipartRequest(method.name, uri);
      request = request as http.MultipartRequest;
      if (body is List<http.MultipartFile>) {
        request.files.addAll(body);
      } else {
        request.files.add(body as http.MultipartFile);
      }
    } else {
      // Handle normal request
      request = http.Request(method.name, uri);
      request = request as http.Request;
      try {
        if (body != null) {
          request.body = json.encode(body);
        }
      } catch (e) {
        // Handle request encoding error
        throw OllamaClientException(
          uri: uri,
          method: method,
          message: 'Could not encode: ${body.runtimeType}',
          body: e,
        );
      }
    }

    // Add request headers
    request.headers.addAll(headers);

    // Handle user request middleware
    request = await onRequest(request);

    // Submit request
    return await client.send(request);
  }

  // ------------------------------------------
  // METHOD: makeRequestStream
  // ------------------------------------------

  /// Reusable request stream method
  @protected
  Future<http.StreamedResponse> makeRequestStream({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    final uri = Uri.parse((this.baseUrl ?? baseUrl) + path);
    late http.StreamedResponse response;
    try {
      response = await _request(
        baseUrl: baseUrl,
        path: path,
        method: method,
        queryParams: queryParams,
        headerParams: headerParams,
        requestType: requestType,
        responseType: responseType,
        body: body,
      );
      // Handle user response middleware
      response = await onStreamedResponse(response);
    } catch (e) {
      // Handle request and response errors
      throw OllamaClientException(
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
    throw OllamaClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: (await http.Response.fromStream(response)).body,
    );
  }

  // ------------------------------------------
  // METHOD: makeRequest
  // ------------------------------------------

  /// Reusable request method
  @protected
  Future<http.Response> makeRequest({
    required String baseUrl,
    required String path,
    required HttpMethod method,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headerParams = const {},
    bool isMultipart = false,
    String requestType = '',
    String responseType = '',
    Object? body,
  }) async {
    final uri = Uri.parse((this.baseUrl ?? baseUrl) + path);
    late http.Response response;
    try {
      final streamedResponse = await _request(
        baseUrl: baseUrl,
        path: path,
        method: method,
        queryParams: queryParams,
        headerParams: headerParams,
        requestType: requestType,
        responseType: responseType,
        body: body,
      );
      response = await http.Response.fromStream(streamedResponse);
      // Handle user response middleware
      response = await onResponse(response);
    } catch (e) {
      // Handle request and response errors
      throw OllamaClientException(
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
    throw OllamaClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: response.body,
    );
  }

  // ------------------------------------------
  // METHOD: postGenerate
  // ------------------------------------------

  /// Generate a response for a given prompt with a provided model.
  ///
  /// This is a streaming endpoint, so will be a series of responses. The final response object will include statistics and additional data from the request.
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:11434/api/generate`
  Future<GenerateResponse> postGenerate({
    GenerateRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/generate',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request,
    );
    return GenerateResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: create
  // ------------------------------------------

  /// Create a model from a Modelfile.
  ///
  /// It is recommended to set modelfile to the content of the Modelfile rather than just set path. This is a requirement for remote create. Remote model creation should also create any file blobs, fields such as FROM and ADAPTER, explicitly with the server using Create a Blob and the value to the path indicated in the response.
  ///
  /// `request`: Create a new model from a modelfile
  ///
  /// `POST` `http://localhost:11434/api/create`
  Future<CreateResponse> create({
    CreateRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/create',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/x-ndjson',
      body: request,
    );
    return CreateResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: postBlobsDigest
  // ------------------------------------------

  /// Create a blob from a file. Returns the server file path.
  ///
  /// `request`: No description
  ///
  /// `POST` `http://localhost:11434/api/blobs/{digest}`
  Future<void> postBlobsDigest({
    String? request,
  }) async {
    final _ = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/blobs/{digest}',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/octet-stream',
      responseType: '',
      body: request,
    );
  }

  // ------------------------------------------
  // METHOD: headBlobsDigest
  // ------------------------------------------

  /// Check if a blob is known to the server.
  ///
  /// Check to see if a blob exists on the Ollama server which is useful when creating models
  ///
  /// `name`: the SHA256 digest of the blob
  ///
  /// `HEAD` `http://localhost:11434/api/blobs/{digest}`
  Future<void> headBlobsDigest({
    required String name,
  }) async {
    final _ = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/blobs/{digest}',
      method: HttpMethod.head,
      isMultipart: false,
      requestType: '',
      responseType: '',
      queryParams: {
        'name': name,
      },
    );
  }

  // ------------------------------------------
  // METHOD: listTags
  // ------------------------------------------

  /// List Local Models
  ///
  /// List models that are available locally.
  ///
  /// `GET` `http://localhost:11434/api/tags`
  Future<TagResponse> listTags() async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/tags',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return TagResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: showModel
  // ------------------------------------------

  /// Show Model Information
  ///
  /// Show details about a model including modelfile, template, parameters, license, and system prompt.
  ///
  /// `request`: Show details about a model including modelfile, template, parameters, license, and system prompt.
  ///
  /// `POST` `http://localhost:11434/api/show`
  Future<ShowResponse> showModel({
    ShowRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/show',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return ShowResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: copyModel
  // ------------------------------------------

  /// Copy a Model
  ///
  /// Copy a model. Creates a model with another name from an existing model.
  ///
  /// `request`: Creates a model with another name from an existing model.
  ///
  /// `POST` `http://localhost:11434/api/copy`
  Future<void> copyModel({
    CopyRequest? request,
  }) async {
    final _ = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/copy',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: '',
      body: request,
    );
  }

  // ------------------------------------------
  // METHOD: deleteModel
  // ------------------------------------------

  /// Delete a Model
  ///
  /// Delete a model and its data.
  ///
  /// `request`: Deletes a model and its data
  ///
  /// `DELETE` `http://localhost:11434/api/delete`
  Future<void> deleteModel({
    DeleteRequest? request,
  }) async {
    final _ = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/delete',
      method: HttpMethod.delete,
      isMultipart: false,
      requestType: 'application/json',
      responseType: '',
      body: request,
    );
  }

  // ------------------------------------------
  // METHOD: pullModel
  // ------------------------------------------

  /// Pull a Model
  ///
  /// Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.
  ///
  /// `request`: Download a model from the ollama library. Cancelled pulls are resumed from where they left off, and multiple calls will share the same download progress.
  ///
  /// `POST` `http://localhost:11434/api/pull`
  Future<PullResponse> pullModel({
    PullRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/pull',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return PullResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: pushModel
  // ------------------------------------------

  /// Push a Model
  ///
  /// Upload a model to a model library. Requires registering for ollama.ai and adding a public key first.
  ///
  /// `request`: Upload a model to a model library. Requires registering for ollama.ai and adding a public key first.
  ///
  /// `POST` `http://localhost:11434/api/push`
  Future<PushResponse> pushModel({
    PushRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/push',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return PushResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: postEmbedding
  // ------------------------------------------

  /// Generate embeddings from a model
  ///
  /// Generate embeddings from a model
  ///
  /// `request`: Generate embeddings from a model
  ///
  /// `POST` `http://localhost:11434/api/embeddings`
  Future<EmbeddingResponse> postEmbedding({
    EmbeddingRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'http://localhost:11434/api',
      path: '/embeddings',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return EmbeddingResponse.fromJson(_jsonDecode(r));
  }
}