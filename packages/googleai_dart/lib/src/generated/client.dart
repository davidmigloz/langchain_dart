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
// CLASS: GoogleAIClientException
// ==========================================

/// HTTP exception handler for GoogleAIClient
class GoogleAIClientException implements Exception {
  GoogleAIClientException({
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
    return 'GoogleAIClientException($s)';
  }
}

// ==========================================
// CLASS: GoogleAIClient
// ==========================================

/// Client for Generative Language API (v.v1)
///
/// The Gemini API allows developers to build generative AI applications using the Gemini model. Large Language Models (LLMs) are a powerful, versatile type of machine learning model that enables computers to comprehend and generate natural language through a series of prompts. The Gemini API is based on Google's next generation LLM, Gemini. It excels at a variety of different tasks like code generation, reasoning, and writing. You can use the Gemini API to build generative AI applications for use cases like content generation, dialogue agents, summarization and classification systems, and more.
class GoogleAIClient {
  /// Creates a new GoogleAIClient instance.
  ///
  /// - [GoogleAIClient.baseUrl] Override base URL (default: server url defined in spec)
  /// - [GoogleAIClient.headers] Global headers to be sent with every request
  /// - [GoogleAIClient.queryParams] Global query parameters to be sent with every request
  /// - [GoogleAIClient.client] Override HTTP client to use for requests
  GoogleAIClient({
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
        throw GoogleAIClientException(
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
      throw GoogleAIClientException(
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
    throw GoogleAIClientException(
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
      throw GoogleAIClientException(
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
    throw GoogleAIClientException(
      uri: uri,
      method: method,
      message: 'Unsuccessful response',
      code: response.statusCode,
      body: response.body,
    );
  }

  // ------------------------------------------
  // METHOD: cancelTunedModelOperation
  // ------------------------------------------

  /// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
  ///
  /// `tunedModelId`: The id of the tuned model.
  ///
  /// `operationId`: The id of the operation to cancel.
  ///
  /// `request`: The request message for Operations.CancelOperation.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/tunedModels/{tunedModelId}/operations/{operationId}:cancel`
  Future<Empty> cancelTunedModelOperation({
    required String tunedModelId,
    required String operationId,
    CancelOperationRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/tunedModels/$tunedModelId/operations/$operationId:cancel',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return Empty.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listTunedModelOperations
  // ------------------------------------------

  /// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`.
  ///
  /// `tunedModelId`: The id of the tuned model.
  ///
  /// `pageSize`: The standard list page size.
  ///
  /// `filter`: The filters to apply.
  ///
  /// `pageToken`: The token identifying which page to start with.
  ///
  /// `GET` `https://generativelanguage.googleapis.com/v1/tunedModels/{tunedModelId}/operations`
  Future<ListOperationsResponse> listTunedModelOperations({
    required String tunedModelId,
    int? pageSize,
    String? filter,
    String? pageToken,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/tunedModels/$tunedModelId/operations',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        if (pageSize != null) 'pageSize': pageSize,
        if (filter != null) 'filter': filter,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );
    return ListOperationsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: getTunedModelOperations
  // ------------------------------------------

  /// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
  ///
  /// `tunedModelId`: The id of the tuned model.
  ///
  /// `operationId`: The id of the operation to get.
  ///
  /// `GET` `https://generativelanguage.googleapis.com/v1/tunedModels/{tunedModelId}/operations/{operationId}`
  Future<Operation> getTunedModelOperations({
    required String tunedModelId,
    required String operationId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/tunedModels/$tunedModelId/operations/$operationId',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Operation.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: generateContent
  // ------------------------------------------

  /// Generates a response from the model given an input `GenerateContentRequest`.
  ///
  /// `modelId`: The id of the model to use.
  ///
  /// `request`: Request to generate a completion from the model.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/models/{modelId}:generateContent`
  Future<GenerateContentResponse> generateContent({
    String modelId = 'gemini-pro',
    GenerateContentRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId:generateContent',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return GenerateContentResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: countTokens
  // ------------------------------------------

  /// Runs a model's tokenizer on input content and returns the token count.
  ///
  /// `modelId`: The id of the model to use.
  ///
  /// `request`: Counts the number of tokens in the `prompt` sent to a model. Models may tokenize text differently, so each model may return a different `token_count`.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/models/{modelId}:countTokens`
  Future<CountTokensResponse> countTokens({
    String modelId = 'gemini-pro',
    CountTokensRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId:countTokens',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return CountTokensResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listModels
  // ------------------------------------------

  /// Lists models available through the API.
  ///
  /// `pageToken`: The token identifying which page to start with.
  ///
  /// `pageSize`: The list page size.
  ///
  /// `GET` `https://generativelanguage.googleapis.com/v1/models`
  Future<ListModelsResponse> listModels({
    String? pageToken,
    int? pageSize,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        if (pageToken != null) 'pageToken': pageToken,
        if (pageSize != null) 'pageSize': pageSize,
      },
    );
    return ListModelsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: getModel
  // ------------------------------------------

  /// Gets information about a specific Model.
  ///
  /// `modelId`: The id of the model to get.
  ///
  /// `GET` `https://generativelanguage.googleapis.com/v1/models/{modelId}`
  Future<Model> getModel({
    required String modelId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Model.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: batchEmbedContents
  // ------------------------------------------

  /// Generates multiple embeddings from the model given input text in a synchronous call.
  ///
  /// `modelId`: The id of the model to use.
  ///
  /// `request`: Batch request to get embeddings from the model for a list of prompts.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/models/{modelId}:batchEmbedContents`
  Future<BatchEmbedContentsResponse> batchEmbedContents({
    String modelId = 'embedding-001',
    BatchEmbedContentsRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId:batchEmbedContents',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return BatchEmbedContentsResponse.fromJson(_jsonDecode(r));
  }

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
  Future<GenerateContentResponse> streamGenerateContent({
    String modelId = 'gemini-pro',
    GenerateContentRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId:streamGenerateContent',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return GenerateContentResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: embedContent
  // ------------------------------------------

  /// Generates an embedding from the model given an input `Content`.
  ///
  /// `modelId`: The id of the model to use.
  ///
  /// `request`: Request containing the `Content` for the model to embed.
  ///
  /// `POST` `https://generativelanguage.googleapis.com/v1/models/{modelId}:embedContent`
  Future<EmbedContentResponse> embedContent({
    String modelId = 'embedding-001',
    EmbedContentRequest? request,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/models/$modelId:embedContent',
      method: HttpMethod.post,
      isMultipart: false,
      requestType: 'application/json',
      responseType: 'application/json',
      body: request,
    );
    return EmbedContentResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: listOperations
  // ------------------------------------------

  /// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`.
  ///
  /// `pageToken`: The token identifying which page to start with.
  ///
  /// `pageSize`: The list page size.
  ///
  /// `filter`: The filters to apply.
  ///
  /// `GET` `https://generativelanguage.googleapis.com/v1/operations`
  Future<ListOperationsResponse> listOperations({
    String? pageToken,
    int? pageSize,
    String? filter,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/operations',
      method: HttpMethod.get,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
      queryParams: {
        if (pageToken != null) 'pageToken': pageToken,
        if (pageSize != null) 'pageSize': pageSize,
        if (filter != null) 'filter': filter,
      },
    );
    return ListOperationsResponse.fromJson(_jsonDecode(r));
  }

  // ------------------------------------------
  // METHOD: deleteOperations
  // ------------------------------------------

  /// Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.
  ///
  /// `operationId`: The id of the operation to delete.
  ///
  /// `DELETE` `https://generativelanguage.googleapis.com/v1/operations/{operationId}`
  Future<Empty> deleteOperations({
    required String operationId,
  }) async {
    final r = await makeRequest(
      baseUrl: 'https://generativelanguage.googleapis.com/v1',
      path: '/operations/$operationId',
      method: HttpMethod.delete,
      isMultipart: false,
      requestType: '',
      responseType: 'application/json',
    );
    return Empty.fromJson(_jsonDecode(r));
  }
}
