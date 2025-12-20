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
// CLASS: AnthropicClientException
// ==========================================

/// HTTP exception handler for AnthropicClient
class AnthropicClientException implements Exception {
  AnthropicClientException({
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
    return 'AnthropicClientException($s)';
  }
}

// ==========================================
// CLASS: AnthropicClient
// ==========================================

/// Client for Anthropic API (v.1)
///
/// API Spec for Anthropic API. Please see https://docs.anthropic.com/en/api for more details.
class AnthropicClient {
  /// Creates a new AnthropicClient instance.
  ///
  /// - [AnthropicClient.baseUrl] Override base URL (default: server url defined in spec)
  /// - [AnthropicClient.headers] Global headers to be sent with every request
  /// - [AnthropicClient.queryParams] Global query parameters to be sent with every request
  /// - [AnthropicClient.client] Override HTTP client to use for requests
  AnthropicClient({
    this.apiKey = '',
    this.baseUrl,
    this.headers = const {},
    this.queryParams = const {},
    http.Client? client,
  }) : assert(
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

  /// Authentication related variables
  String apiKey;

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
        throw AnthropicClientException(
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
      throw AnthropicClientException(
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
    throw AnthropicClientException(
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
      throw AnthropicClientException(
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
    throw AnthropicClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: response.body,
    );
  }

  // ------------------------------------------
  // METHOD: createMessage
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
  Future<Message> createMessage({required CreateMessageRequest request}) async {
    final r = await makeRequest(
      baseUrl: 'https://api.anthropic.com/v1',
      path: '/messages',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
      headerParams: {if (apiKey.isNotEmpty) 'x-api-key': apiKey},
    );
    return Message.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: countMessageTokens
  // ------------------------------------------

  /// Count Message Tokens
  ///
  /// Count the number of tokens in a Message.
  ///
  /// The Token Count API can be used to count the number of tokens in a Message,
  /// including tools, images, and documents, without creating it.
  ///
  /// `request`: The request parameters for counting tokens in a message.
  ///
  /// `POST` `https://api.anthropic.com/v1/messages/count_tokens`
  Future<CountMessageTokensResponse> countMessageTokens({
    required CountMessageTokensRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.anthropic.com/v1',
      path: '/messages/count_tokens',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
      headerParams: {if (apiKey.isNotEmpty) 'x-api-key': apiKey},
    );
    return CountMessageTokensResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: createMessageBatch
  // ------------------------------------------

  /// Create a Message Batch
  ///
  /// Send a batch of Message creation requests.
  ///
  /// `request`: The request parameters for creating a message batch.
  ///
  /// `POST` `https://api.anthropic.com/v1/messages/batches`
  Future<MessageBatch> createMessageBatch({
    required CreateMessageBatchRequest request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://api.anthropic.com/v1',
      path: '/messages/batches',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
      headerParams: {if (apiKey.isNotEmpty) 'x-api-key': apiKey},
    );
    return MessageBatch.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: retrieveMessageBatch
  // ------------------------------------------

  /// Retrieve a Message Batch
  ///
  /// This endpoint is idempotent and can be used to poll for Message Batch
  /// completion. To access the results of a Message Batch, make a request to the
  /// `results_url` field in the response.
  ///
  /// `id`: The ID of the message batch to retrieve.
  ///
  /// `GET` `https://api.anthropic.com/v1/messages/batches/{id}`
  Future<MessageBatch> retrieveMessageBatch({required String id}) async {
    final r = await makeRequest(
      baseUrl: 'https://api.anthropic.com/v1',
      path: '/messages/batches/$id',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',

      headerParams: {if (apiKey.isNotEmpty) 'x-api-key': apiKey},
    );
    return MessageBatch.fromJson(_jsonDecode(r));
  }
}
